@implementation MPVoicemailController

- (MPVoicemailController)init
{
  id v2;

  -[MPVoicemailController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("doesNotRecognizeSelector"), CFSTR("init not implemented"), 0)));
  objc_exception_throw(v2);
}

- (MPVoicemailController)initWithVoicemailManager:(id)a3 accountManager:(id)a4 callProviderManager:(id)a5 contactStore:(id)a6 suggestedContactStore:(id)a7 metadataCache:(id)a8
{
  id v15;
  id v16;
  MPVoicemailController *v17;
  uint64_t v18;
  OS_dispatch_queue *serialDispatchQueue;
  NSObject *v20;
  const void *v21;
  void *specific;
  uint64_t v23;
  id v24;
  NSObject *v25;
  TUFeatureFlags *v26;
  TUFeatureFlags *featureFlags;
  NSMutableDictionary *v28;
  NSMutableDictionary *contactCache;
  id v30;
  NSObject *v31;
  NSObject *v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD block[4];
  MPVoicemailController *v41;
  uint8_t buf[16];
  objc_super v43;

  v15 = a3;
  v16 = a4;
  v39 = a5;
  v38 = a6;
  v37 = a7;
  v36 = a8;
  v43.receiver = self;
  v43.super_class = (Class)MPVoicemailController;
  v17 = -[MPVoicemailController init](&v43, "init");
  if (v17)
  {
    v34 = v16;
    v35 = v15;
    v18 = objc_claimAutoreleasedReturnValue(+[MPVoicemailQueueManager serialQueue](MPVoicemailQueueManager, "serialQueue"));
    serialDispatchQueue = v17->_serialDispatchQueue;
    v17->_serialDispatchQueue = (OS_dispatch_queue *)v18;

    v20 = v17->_serialDispatchQueue;
    v21 = off_100090C88;
    specific = dispatch_queue_get_specific(v20, off_100090C88);
    if (specific)
    {
      v23 = (uint64_t)specific;
      v24 = PHDefaultLog();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        sub_10005285C(v23, (uint64_t)v17, v25);

      v20 = v17->_serialDispatchQueue;
      v21 = off_100090C88;
    }
    dispatch_queue_set_specific(v20, v21, v17, 0);
    objc_storeStrong((id *)&v17->_callProviderManager, a5);
    objc_storeStrong((id *)&v17->_contactStore, a6);
    objc_storeStrong((id *)&v17->_suggestedContactStore, a7);
    objc_storeStrong((id *)&v17->_metadataCache, a8);
    objc_storeStrong((id *)&v17->_voicemailManager, a3);
    objc_storeStrong((id *)&v17->_accountManager, a4);
    v26 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v17->_featureFlags;
    v17->_featureFlags = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contactCache = v17->_contactCache;
    v17->_contactCache = v28;

    v30 = PHDefaultLog();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v16 = v34;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "MPVoicemailController initWithVoicemailManager", buf, 2u);
    }

    v32 = v17->_serialDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001FAA0;
    block[3] = &unk_10007D440;
    v41 = v17;
    dispatch_async(v32, block);

    v15 = v35;
  }

  return v17;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MPVoicemailController;
  -[MPVoicemailController dealloc](&v4, "dealloc");
}

- (void)audioMessagesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FE50;
  block[3] = &unk_10007DA40;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSArray)audioMessages
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10001FF60;
  v9 = sub_10001FF70;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001FF78;
  v4[3] = &unk_10007D738;
  v4[4] = self;
  v4[5] = &v5;
  -[MPVoicemailController performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (NSArray)messages
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10001FF60;
  v9 = sub_10001FF70;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020050;
  v4[3] = &unk_10007D738;
  v4[4] = self;
  v4[5] = &v5;
  -[MPVoicemailController performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

- (unint64_t)unreadMessageCount
{
  unint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020104;
  v4[3] = &unk_10007D738;
  v4[4] = self;
  v4[5] = &v5;
  -[MPVoicemailController performSynchronousBlock:](self, "performSynchronousBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)loadLocalizedTitlesForMessages:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = -[MPVoicemailController localizedTitleForMessage:](self, "localizedTitleForMessage:", v9);
        v11 = -[MPVoicemailController localizedSubtitleForMessage:](self, "localizedSubtitleForMessage:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (id)localizedSubtitleForMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  MPVoicemailController *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10001FF60;
  v15 = sub_10001FF70;
  v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002031C;
  v7[3] = &unk_10007D850;
  v4 = a3;
  v9 = self;
  v10 = &v11;
  v8 = v4;
  -[MPVoicemailController performSynchronousBlock:](self, "performSynchronousBlock:", v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (BOOL)isRestrictedMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "senderDestinationID"));
  if (objc_msgSend(v4, "length"))
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "senderDestinationID"));
  else
    v5 = TUCallFilterUnknownCallerAddress;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle normalizedHandleWithDestinationID:](TUHandle, "normalizedHandleWithDestinationID:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "callFilterController"));
  v10 = objc_msgSend(v9, "containsRestrictedHandle:forBundleIdentifier:", v7, TUBundleIdentifierMobilePhoneApplication);

  return v10;
}

- (id)localizedAttributedDowntimeTitleForMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  MPVoicemailController *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10001FF60;
  v15 = sub_10001FF70;
  v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000208DC;
  v7[3] = &unk_10007D850;
  v4 = a3;
  v9 = self;
  v10 = &v11;
  v8 = v4;
  -[MPVoicemailController performSynchronousBlock:](self, "performSynchronousBlock:", v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (id)localizedTitleForMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  MPVoicemailController *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10001FF60;
  v15 = sub_10001FF70;
  v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020BE0;
  v7[3] = &unk_10007D850;
  v4 = a3;
  v9 = self;
  v10 = &v11;
  v8 = v4;
  -[MPVoicemailController performSynchronousBlock:](self, "performSynchronousBlock:", v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (id)localizedHandleTitleFromMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "senderHandle"));
  v5 = objc_msgSend(v4, "type");
  if (v5 == (id)2)
  {
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "normalizedValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "isoCountryCode"));
    v12 = (void *)PNCreateFormattedStringWithCountry(v10, v11, 2, 0);

    goto LABEL_7;
  }
  if (v5 == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController featureFlags](self, "featureFlags"));
    v7 = objc_msgSend(v6, "callScreeningEnabledM3");

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "normalizedValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNLabeledValue localizedDisplayStringForLabel:propertyName:](CNLabeledValue, "localizedDisplayStringForLabel:propertyName:", v8, CNContactEmailAddressesKey));

    }
    goto LABEL_5;
  }
  v12 = 0;
LABEL_7:
  if (!objc_msgSend(v12, "length"))
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));

    v12 = (void *)v13;
  }

  return v12;
}

- (id)messagesPassingTest:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (unsigned int (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController messages](self, "messages", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (v4[2](v4, v11))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v5, "copy");
  return v12;
}

- (void)messagesPassingTest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000210F0;
  v11[3] = &unk_10007DA68;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (id)audioMessagesPassingTest:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (unsigned int (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController audioMessages](self, "audioMessages", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (v4[2](v4, v11))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v5, "copy");
  return v12;
}

- (void)audioMessagesPassingTest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002149C;
  v11[3] = &unk_10007DA68;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)deleteMessages:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController voicemailManager](self, "voicemailManager"));
  v6 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000216C0;
  v9[3] = &unk_10007D7B0;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, v9);

}

- (void)markMessagesAsRead:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController voicemailManager](self, "voicemailManager"));
  v6 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100021788;
  v9[3] = &unk_10007D7B0;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, v9);

}

- (void)trashMessages:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController voicemailManager](self, "voicemailManager"));
  v6 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100021850;
  v9[3] = &unk_10007D7B0;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, v9);

}

- (void)moveMessagesToInbox:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController voicemailManager](self, "voicemailManager"));
  v6 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100021918;
  v9[3] = &unk_10007D7B0;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, v9);

}

- (void)messageForIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MPVoicemailController *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000219F0;
  v11[3] = &unk_10007DAE0;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[MPVoicemailController voicemailManager](self, "voicemailManager"));
  v13 = v6;
  v14 = self;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = v12;
  -[MPVoicemailController performSynchronousBlock:](self, "performSynchronousBlock:", v11);

}

- (BOOL)shouldShowVerifiedBadge
{
  id Value;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  Value = PHPreferencesGetValue(CFSTR("showVerifiedBadge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)attributedStringForDowntimeMessage:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableAttributedString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCallout));
  if (v6)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, NSFontAttributeName);
  v7 = objc_alloc_init((Class)NSTextAttachment);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 40, UIFontTextStyleCallout, 3, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithRenderingMode:", 2));
  objc_msgSend(v7, "setImage:", v9);

  if (objc_msgSend(UIApp, "userInterfaceLayoutDirection") == (id)1)
  {
    v10 = objc_alloc((Class)NSAttributedString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR(" ")));
    v12 = objc_msgSend(v10, "initWithString:attributes:", v11, v5);
    objc_msgSend(v4, "appendAttributedString:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v7));
    objc_msgSend(v4, "appendAttributedString:", v13);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v7));
    objc_msgSend(v4, "appendAttributedString:", v14);

    v15 = objc_alloc((Class)NSAttributedString);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR(" "), "stringByAppendingString:", v3));
    v16 = objc_msgSend(v15, "initWithString:attributes:", v13, v5);
    objc_msgSend(v4, "appendAttributedString:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v4, "addAttribute:value:range:", NSForegroundColorAttributeName, v17, 0, objc_msgSend(v4, "length"));

  return v4;
}

- (CNContactFormatter)contactFormatter
{
  NSObject *v3;
  CNContactFormatter *contactFormatter;
  CNContactFormatter *v5;
  CNContactFormatter *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  dispatch_assert_queue_V2(v3);

  contactFormatter = self->_contactFormatter;
  if (!contactFormatter)
  {
    v5 = (CNContactFormatter *)objc_alloc_init((Class)CNContactFormatter);
    -[CNContactFormatter setStyle:](v5, "setStyle:", 0);
    v6 = self->_contactFormatter;
    self->_contactFormatter = v5;

    contactFormatter = self->_contactFormatter;
  }
  return contactFormatter;
}

- (NSArray)contactKeyDescriptors
{
  NSObject *v3;
  NSArray *contactKeyDescriptors;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[3];

  v3 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  dispatch_assert_queue_V2(v3);

  contactKeyDescriptors = self->_contactKeyDescriptors;
  if (!contactKeyDescriptors)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
    v9[0] = v5;
    v9[1] = CNContactPhoneNumbersKey;
    v9[2] = CNContactEmailAddressesKey;
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 3));
    v7 = self->_contactKeyDescriptors;
    self->_contactKeyDescriptors = v6;

    contactKeyDescriptors = self->_contactKeyDescriptors;
  }
  return contactKeyDescriptors;
}

- (void)setMessages:(id)a3
{
  NSObject *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *messages;
  void *v8;
  NSArray *v9;
  NSArray *v10;

  v10 = (NSArray *)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = v10;
  if (self->_messages != v10)
  {
    v6 = (NSArray *)-[NSArray copy](v10, "copy");
    messages = self->_messages;
    self->_messages = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_10007DB20));
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray filteredArrayUsingPredicate:](v10, "filteredArrayUsingPredicate:", v8));

    if (self->_audioMessages != v9)
      objc_storeStrong((id *)&self->_audioMessages, v9);
    -[MPVoicemailController postMPVoicemailControllerMessagesDidChangeNotification](self, "postMPVoicemailControllerMessagesDidChangeNotification");

    v5 = v10;
  }

}

- (void)setAudioMessages:(id)a3
{
  NSObject *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *audioMessages;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  dispatch_assert_queue_V2(v4);

  v5 = v8;
  if (self->_audioMessages != v8)
  {
    v6 = (NSArray *)-[NSArray copy](v8, "copy");
    audioMessages = self->_audioMessages;
    self->_audioMessages = v6;

    -[MPVoicemailController postMPVoicemailControllerMessagesDidChangeNotification](self, "postMPVoicemailControllerMessagesDidChangeNotification");
    v5 = v8;
  }

}

- (void)setUnreadMessageCount:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000220B8;
  v6[3] = &unk_10007DB48;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (id)mutableSenderContactForMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController metadataCache](self, "metadataCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderDestinationID"));
  if (objc_msgSend(v7, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUHandle normalizedHandleWithDestinationID:](TUHandle, "normalizedHandleWithDestinationID:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "senderISOCountryCode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CNMutableContact contactForHandle:isoCountryCode:metadataCache:](CNMutableContact, "contactForHandle:isoCountryCode:metadataCache:", v8, v9, v6));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)senderContactForMessage:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  MPVoicemailController *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_10001FF60;
  v15 = sub_10001FF70;
  v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000222A8;
  v7[3] = &unk_10007D850;
  v4 = a3;
  v9 = self;
  v10 = &v11;
  v8 = v4;
  -[MPVoicemailController performSynchronousBlock:](self, "performSynchronousBlock:", v7);
  v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

- (void)fetchContactsForMessages:(id)a3 keyDescriptors:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  dispatch_assert_queue_V2(v8);

  v9 = objc_alloc_init((Class)NSMutableSet);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v14), "senderDestinationID"));
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController contactCache](self, "contactCache"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v15));

          if (!v17)
            objc_msgSend(v9, "addObject:", v15);
        }

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v12);
  }

  v18 = PHDefaultLog();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v9, "count");
    v21 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134218240;
    v53 = v20;
    v54 = 2048;
    v55 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found %lu contact handles in %lu messages", buf, 0x16u);
  }

  if (objc_msgSend(v9, "count"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController contactStore](self, "contactStore"));
    v23 = PHDefaultLog();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134218242;
      v53 = v25;
      v54 = 2112;
      v55 = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Fetching contacts for %lu handles using contact store %@", buf, 0x16u);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "contactsForHandles:keyDescriptors:", v26, v7));

    if (v27)
    {
      v38 = v22;
      v39 = v10;
      v40 = v9;
      v41 = v7;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v9;
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v44;
        do
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v44 != v30)
              objc_enumerationMutation(obj);
            v32 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v31);
            v33 = objc_alloc((Class)TUOptionalObject);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v32));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "firstObject"));
            v36 = objc_msgSend(v33, "initWithValue:", v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController contactCache](self, "contactCache"));
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v32);

            v31 = (char *)v31 + 1;
          }
          while (v29 != v31);
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        }
        while (v29);
      }

      v9 = v40;
      v7 = v41;
      v22 = v38;
      v10 = v39;
    }

  }
}

- (void)fetchMessagesCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController voicemailManager](self, "voicemailManager"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002279C;
  v8[3] = &unk_10007DB98;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "fetchMessagesWithCompletion:", v8);

}

- (void)fetchMetadataForMessages:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController metadataCache](self, "metadataCache"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUMetadataDestinationID metadataDestinationIDsForVMVoicemails:](TUMetadataDestinationID, "metadataDestinationIDsForVMVoicemails:", v4));
    v8 = PHDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134218240;
      v12 = objc_msgSend(v4, "count");
      v13 = 2048;
      v14 = objc_msgSend(v7, "count");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching metadata for %lu voicemail messages using %lu handles", (uint8_t *)&v11, 0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController metadataCache](self, "metadataCache"));
    objc_msgSend(v10, "updateCacheWithDestinationIDs:", v7);

  }
}

+ (id)_telephonyClient
{
  if (qword_1000922C8 != -1)
    dispatch_once(&qword_1000922C8, &stru_10007DBB8);
  return (id)qword_1000922C0;
}

- (void)fetchLegacyVoicemailsCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "_telephonyClient");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022B28;
  v8[3] = &unk_10007DC30;
  v8[4] = self;
  v9 = (id)objc_claimAutoreleasedReturnValue(v5);
  v10 = v4;
  v6 = v4;
  v7 = v9;
  objc_msgSend(v7, "getActiveContextsWithCallback:", v8);

}

- (void)handleCNContactStoreDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = PHDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023230;
  block[3] = &unk_10007D440;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)handleRecentsChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = PHDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002340C;
  block[3] = &unk_10007D440;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)handleNSCurrentLocaleDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = PHDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002359C;
  block[3] = &unk_10007D440;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)handleTUMetadataCacheDidFinishUpdatingNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = PHDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002373C;
  block[3] = &unk_10007D440;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)handleUIApplicationSignificantTimeChangeNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  v4 = a3;
  v5 = PHDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v10, 0x16u);

  }
  -[MPVoicemailController postMPVoicemailControllerMessagesDidChangeNotification](self, "postMPVoicemailControllerMessagesDidChangeNotification");

}

- (void)handleUIApplicationWillEnterForegroundNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v5 = PHDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v11, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController voicemailManager](self, "voicemailManager"));
  objc_msgSend(v10, "requestInitialStateIfNecessaryAndSendNotifications:", 1);

}

- (void)handleVoicemailsChangedNotification:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;

  v4 = a3;
  v5 = PHDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);

  }
  v10 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023AF0;
  block[3] = &unk_10007D440;
  block[4] = self;
  dispatch_async(v10, block);

}

- (void)postMPVoicemailControllerMessagesDidChangeNotification
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController completionDispatchQueue](self, "completionDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023BBC;
  block[3] = &unk_10007D440;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)postMPVoicemailControllerUnreadMessageCountDidChangeNotification
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController completionDispatchQueue](self, "completionDispatchQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023C74;
  block[3] = &unk_10007D440;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)performSynchronousBlock:(id)a3
{
  id v5;
  void (*v6)(void);
  NSObject *v7;

  if (dispatch_get_specific(off_100090C88) == self)
  {
    v6 = (void (*)(void))*((_QWORD *)a3 + 2);
    v7 = a3;
    v6();
  }
  else
  {
    v5 = a3;
    v7 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
    dispatch_sync(v7, v5);

  }
}

- (void)providersChangedForProviderManager:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  MPVoicemailController *v11;
  __int16 v12;
  id v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MPVoicemailController serialDispatchQueue](self, "serialDispatchQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = PHDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is handling providersChangedForProviderManager %@", (uint8_t *)&v10, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController localizedSubtitleCache](self, "localizedSubtitleCache"));
  objc_msgSend(v8, "removeAllObjects");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPVoicemailController localizedTitleCache](self, "localizedTitleCache"));
  objc_msgSend(v9, "removeAllObjects");

  -[MPVoicemailController postMPVoicemailControllerMessagesDidChangeNotification](self, "postMPVoicemailControllerMessagesDidChangeNotification");
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNContactStore)suggestedContactStore
{
  return self->_suggestedContactStore;
}

- (TUMetadataCache)metadataCache
{
  return self->_metadataCache;
}

- (MPVoicemailManagerProtocol)voicemailManager
{
  return self->_voicemailManager;
}

- (VMVoicemailManager)accountManager
{
  return self->_accountManager;
}

- (BOOL)isSetupRequired
{
  return self->_setupRequired;
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (void)setCompletionDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionDispatchQueue, a3);
}

- (OS_dispatch_queue)serialDispatchQueue
{
  return self->_serialDispatchQueue;
}

- (NSMutableDictionary)contactCache
{
  return self->_contactCache;
}

- (NSCache)localizedSubtitleCache
{
  return self->_localizedSubtitleCache;
}

- (NSCache)localizedTitleCache
{
  return self->_localizedTitleCache;
}

- (NSCache)localizedDowntimeTitleCache
{
  return self->_localizedDowntimeTitleCache;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_localizedDowntimeTitleCache, 0);
  objc_storeStrong((id *)&self->_localizedTitleCache, 0);
  objc_storeStrong((id *)&self->_localizedSubtitleCache, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);
  objc_storeStrong((id *)&self->_metadataCache, 0);
  objc_storeStrong((id *)&self->_suggestedContactStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_audioMessages, 0);
  objc_storeStrong((id *)&self->_contactKeyDescriptors, 0);
}

@end
