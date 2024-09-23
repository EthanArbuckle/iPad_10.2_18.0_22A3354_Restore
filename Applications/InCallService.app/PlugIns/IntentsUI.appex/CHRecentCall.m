@implementation CHRecentCall

+ (id)predicateForRecentCallsGreaterThanDate:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(date > %@)"), a3);
}

+ (id)predicateForRecentCallsMatchingAnyMediaTypes:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(mediaType IN %@)"), a3);
}

+ (id)predicateForRecentCallsMatchingCallStatus:(unsigned int)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(callStatus == %@)"), v3));

  return v4;
}

+ (id)predicateForRecentCallsMatchingRead:(BOOL)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(read == %@)"), v3));

  return v4;
}

+ (id)predicateForRecentCallsMatchingServiceProvider:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(serviceProvider == %@)"), a3);
}

+ (id)predicateForRecentCallsMatchingServiceProviders:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(serviceProvider IN %@)"), a3);
}

+ (id)predicateForFilteringOutFaceTimeAudioCalls
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("!(mediaType == %@ && serviceProvider == %@)"), &off_100080280, kCHServiceProviderFaceTime);
}

- (TUHandle)handle
{
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentCall callerId](self, "callerId"));
  if (objc_msgSend(v3, "length"))
  {
    switch((unint64_t)-[CHRecentCall handleType](self, "handleType"))
    {
      case 0uLL:
        v4 = PHDefaultLog();
        v5 = objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          sub_1000529E4(v5);

        v6 = (id)objc_claimAutoreleasedReturnValue(+[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:", v3));
        goto LABEL_11;
      case 1uLL:
        v8 = objc_alloc((Class)TUHandle);
        v9 = 1;
        goto LABEL_10;
      case 2uLL:
        v8 = objc_alloc((Class)TUHandle);
        v9 = 2;
        goto LABEL_10;
      case 3uLL:
        v8 = objc_alloc((Class)TUHandle);
        v9 = 3;
LABEL_10:
        v6 = objc_msgSend(v8, "initWithType:value:", v9, v3);
LABEL_11:
        v7 = v6;
        break;
      default:
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v7 = 0;
  }

  return (TUHandle *)v7;
}

- (BOOL)ph_supportsLocalParticipantBadge
{
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentCall localParticipantUUID](self, "localParticipantUUID"));
  v4 = objc_claimAutoreleasedReturnValue(-[CHRecentCall outgoingLocalParticipantUUID](self, "outgoingLocalParticipantUUID"));
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
    v6 = objc_msgSend(v3, "isEqual:", v4);

  return v6;
}

- (NSSet)ph_uniqueIDs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentCall uniqueId](self, "uniqueId"));
  objc_msgSend(v3, "addObject:", v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentCall callOccurrences](self, "callOccurrences", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = kCHCallOccurrenceUniqueIdKey;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "objectForKeyedSubscript:", v9));
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = objc_msgSend(v3, "copy");
  return (NSSet *)v12;
}

- (BOOL)ph_canAssociateWithMessage:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentCall remoteParticipantHandles](self, "remoteParticipantHandles", a3));
  objc_msgSend(v3, "count");

  return 0;
}

@end
