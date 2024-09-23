@implementation NSError(GameKitErrors)

+ (id)userErrorForCode:()GameKitErrors underlyingError:
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  if (a4)
  {
    v11 = *MEMORY[0x1E0CB3388];
    v12[0] = a4;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a4;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userErrorForCode:userInfo:", a3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
    objc_msgSend(v5, "userErrorForCode:userInfo:", a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)userErrorForCode:()GameKitErrors userInfo:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  switch(a3)
  {
    case 2:
      +[GCFLocalizedStrings ERROR_CANCELED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_CANCELED_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[GCFLocalizedStrings ERROR_COMMUNICATIONSFAILURE_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_COMMUNICATIONSFAILURE_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[GCFLocalizedStrings ERROR_USERDENIED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_USERDENIED_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[GCFLocalizedStrings ERROR_INVALIDCREDENTIALS_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_INVALIDCREDENTIALS_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      +[GCFLocalizedStrings ERROR_NOTAUTHENTICATED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_NOTAUTHENTICATED_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      +[GCFLocalizedStrings ERROR_AUTHENTICATIONINPROGRESS_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_AUTHENTICATIONINPROGRESS_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      +[GCFLocalizedStrings ERROR_INVALIDPLAYER_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_INVALIDPLAYER_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      +[GCFLocalizedStrings ERROR_SCORENOTSET_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_SCORENOTSET_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      +[GCFLocalizedStrings ERROR_PARENTALCONTROLSBLOCKED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_PARENTALCONTROLSBLOCKED_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 11:
    case 12:
    case 29:
    case 32:
    case 36:
LABEL_8:
      +[GCFLocalizedStrings ERROR_UNKNOWN_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_UNKNOWN_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      +[GCFLocalizedStrings ERROR_MATCHREQUESTINVALID_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_MATCHREQUESTINVALID_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      +[GCFLocalizedStrings ERROR_UNDERAGE_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_UNDERAGE_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      +[GCFLocalizedStrings ERROR_GAMEUNRECOGNIZED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_GAMEUNRECOGNIZED_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 16:
      +[GCFLocalizedStrings GAME_CENTER_IS_NOT_SUPPORTED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "GAME_CENTER_IS_NOT_SUPPORTED");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 17:
      +[GCFLocalizedStrings ERROR_INVALIDPARAMETER_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_INVALIDPARAMETER_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 18:
      +[GCFLocalizedStrings ERROR_UNEXPECTEDCONNECTION_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_UNEXPECTEDCONNECTION_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 19:
      +[GCFLocalizedStrings ERROR_INVALID_CHALLENGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_INVALID_CHALLENGE");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 20:
      +[GCFLocalizedStrings ERROR_TBG_MATCH_DATA_TO_LARGE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_TBG_MATCH_DATA_TO_LARGE");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 21:
      +[GCFLocalizedStrings ERROR_TBG_TOO_MANY_SESSIONS](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_TBG_TOO_MANY_SESSIONS");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 22:
      +[GCFLocalizedStrings ERROR_TBG_INVALID_PARTICIPANT](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_TBG_INVALID_PARTICIPANT");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 23:
      +[GCFLocalizedStrings ERROR_TBG_INVALID_TURN](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_TBG_INVALID_TURN");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 24:
      +[GCFLocalizedStrings ERROR_TBG_INVALID_STATE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_TBG_INVALID_STATE");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 25:
      +[GCFLocalizedStrings ERROR_INVITATIONS_DISABLED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_INVITATIONS_DISABLED_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 26:
      +[GCFLocalizedStrings ERROR_PLAYERPHOTOFAILURE_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_PLAYERPHOTOFAILURE_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 27:
      +[GCFLocalizedStrings ERROR_UBIQUITY_CONTAINER_INVALID](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_UBIQUITY_CONTAINER_INVALID");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 28:
      +[GCFLocalizedStrings ERROR_MATCHNOTCONNECTED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_MATCHNOTCONNECTED_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 30:
      +[GCFLocalizedStrings RESTRICTED_TO_AUTOMATCH](_TtC20GameCenterFoundation19GCFLocalizedStrings, "RESTRICTED_TO_AUTOMATCH");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 31:
      +[GCFLocalizedStrings ERROR_API_NOT_AVAILABLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_API_NOT_AVAILABLE");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 33:
      +[GCFLocalizedStrings ERROR_CONNECTION_TIMEOUT_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_CONNECTION_TIMEOUT_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 34:
      +[GCFLocalizedStrings ERROR_API_OBSOLETE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_API_OBSOLETE");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 35:
      +[GCFLocalizedStrings ERROR_ICLOUD_NOT_AUTHENTICATED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_ICLOUD_NOT_AUTHENTICATED_DESCRIPTION");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    case 37:
      +[GCFLocalizedStrings ERROR_APP_UNLISTED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_APP_UNLISTED");
      v9 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      switch(a3)
      {
        case 'd':
          +[GCFLocalizedStrings ERROR_API_FRIEND_LIST_DESCRIPTION_MISSING](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_API_FRIEND_LIST_DESCRIPTION_MISSING");
          v9 = objc_claimAutoreleasedReturnValue();
          break;
        case 'e':
          +[GCFLocalizedStrings ERROR_API_FRIEND_LIST_RESTRICTED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_API_FRIEND_LIST_RESTRICTED");
          v9 = objc_claimAutoreleasedReturnValue();
          break;
        case 'f':
          +[GCFLocalizedStrings ERROR_API_FRIEND_LIST_DENIED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_API_FRIEND_LIST_DENIED");
          v9 = objc_claimAutoreleasedReturnValue();
          break;
        case 'g':
          +[GCFLocalizedStrings ERROR_API_FRIEND_REQUEST_NOT_AVAILABLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_API_FRIEND_REQUEST_NOT_AVAILABLE");
          v9 = objc_claimAutoreleasedReturnValue();
          break;
        default:
          goto LABEL_8;
      }
      break;
  }
  v10 = (void *)v9;
  if (v9)
    objc_msgSend(v8, "setValue:forKey:", v9, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", GKErrorDomain, a3, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)userErrorForCode:()GameKitErrors description:
{
  void *v5;
  NSString *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = GKErrorDomain;
  if (a4)
  {
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = a4;
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = a4;
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, a3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)userErrorForCode:()GameKitErrors underlyingErrors:
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB35C8];
  if (a4)
  {
    v11 = *MEMORY[0x1E0CB2F70];
    v12[0] = a4;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a4;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userErrorForCode:userInfo:", a3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
    objc_msgSend(v5, "userErrorForCode:userInfo:", a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)userErrorForServerError:()GameKitErrors
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "userErrorForServerError:userInfo:", v3, MEMORY[0x1E0C9AA70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)userErrorForServerError:()GameKitErrors userInfo:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "code");
  v9 = 1;
  switch(v8)
  {
    case 5000:
    case 5029:
    case 5032:
    case 5033:
    case 5046:
    case 5047:
    case 5048:
      goto LABEL_12;
    case 5001:
    case 5002:
    case 5003:
    case 5004:
    case 5006:
    case 5007:
    case 5008:
    case 5009:
    case 5013:
    case 5014:
    case 5015:
    case 5016:
    case 5017:
    case 5018:
    case 5021:
    case 5022:
    case 5024:
    case 5025:
    case 5026:
    case 5027:
    case 5028:
    case 5030:
    case 5031:
    case 5039:
    case 5040:
    case 5041:
    case 5042:
    case 5043:
    case 5044:
    case 5045:
    case 5049:
    case 5050:
    case 5055:
    case 5057:
    case 5058:
    case 5067:
    case 5069:
    case 5070:
    case 5074:
    case 5076:
    case 5077:
    case 5078:
    case 5079:
    case 5080:
    case 5081:
    case 5082:
    case 5083:
    case 5084:
    case 5085:
    case 5086:
    case 5087:
    case 5088:
    case 5089:
    case 5090:
    case 5091:
    case 5092:
    case 5093:
    case 5095:
    case 5096:
    case 5105:
    case 5106:
    case 5107:
    case 5108:
    case 5116:
    case 5117:
    case 5118:
    case 5119:
    case 5120:
      goto LABEL_13;
    case 5005:
    case 5121:
    case 5122:
      v9 = 8;
      goto LABEL_14;
    case 5010:
    case 5019:
    case 5034:
      v9 = 15;
      goto LABEL_14;
    case 5011:
    case 5012:
    case 5023:
    case 5072:
    case 5073:
      v9 = 5;
      goto LABEL_14;
    case 5020:
    case 5051:
    case 5052:
      goto LABEL_14;
    case 5035:
    case 5036:
    case 5037:
    case 5038:
    case 5053:
    case 5054:
    case 5056:
    case 5059:
    case 5060:
    case 5061:
    case 5062:
    case 5063:
    case 5064:
    case 5065:
    case 5066:
    case 5071:
      v9 = 17;
      goto LABEL_14;
    case 5068:
    case 5094:
      v9 = 21;
      goto LABEL_14;
    case 5075:
      v9 = 25;
      goto LABEL_14;
    case 5097:
    case 5098:
      v9 = 22;
      goto LABEL_14;
    case 5099:
      v9 = 20;
      goto LABEL_14;
    case 5100:
    case 5101:
      v9 = 24;
      goto LABEL_14;
    case 5102:
    case 5103:
    case 5104:
      v9 = 23;
      goto LABEL_14;
    case 5109:
    case 5110:
    case 5111:
    case 5112:
    case 5113:
    case 5114:
    case 5115:
      v9 = 19;
      goto LABEL_14;
    default:
      if (v8 == 5170)
LABEL_12:
        v9 = 6;
      else
LABEL_13:
        v9 = 3;
LABEL_14:
      v10 = (void *)objc_msgSend(v6, "mutableCopy");

      objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB3388]);
      objc_msgSend(v7, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("GKServerStatusCode"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("GKServerStatusCode"));

      objc_msgSend(a1, "userErrorForCode:userInfo:", v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
  }
}

+ (id)userErrorForServerCode:()GameKitErrors reason:
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "serverErrorForCode:withReason:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userErrorForServerError:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)userErrorForServerCode:()GameKitErrors reason:userInfo:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  objc_msgSend(a1, "serverErrorForCode:withReason:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userErrorForServerError:userInfo:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (uint64_t)serverErrorForCode:()GameKitErrors withUserInfo:
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GKServerErrorDomain"), a3, a4);
}

+ (id)serverErrorForCode:()GameKitErrors withReason:
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v9, CFSTR("GKServerStatusCode"), v8, *MEMORY[0x1E0CB2D68], 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "serverErrorForCode:withUserInfo:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (uint64_t)gkUnauthenticatedError
{
  return objc_msgSend(a1, "userErrorForCode:userInfo:", 6, 0);
}

+ (uint64_t)gkPrivacyNoticeNotAcceptedError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("GKInternalErrorDomain"), 101, 0);
}

- (uint64_t)gkIsUnauthenticatedError
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(a1, "code") != 6)
    return 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", GKErrorDomain);

  return v3;
}

+ (uint64_t)gkNotConnectedToInternetError
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1009, 0);
}

- (uint64_t)gkIsNotConnectedToInternetError
{
  void *v2;
  uint64_t v3;

  if (objc_msgSend(a1, "code") != -1009)
    return 0;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

  return v3;
}

- (id)getUnderlyingErrorWithServerStatusCode:()GameKitErrors
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "underlyingErrors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "isGKServerError"))
        {
          objc_msgSend(v9, "userInfo");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", CFSTR("GKServerStatusCode"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 && objc_msgSend(v11, "intValue") == a3)
          {
            v12 = v9;

            goto LABEL_14;
          }

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (uint64_t)isGKClientError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", GKErrorDomain);

  return v2;
}

- (uint64_t)isGKServerError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("GKServerErrorDomain"));

  return v2;
}

@end
