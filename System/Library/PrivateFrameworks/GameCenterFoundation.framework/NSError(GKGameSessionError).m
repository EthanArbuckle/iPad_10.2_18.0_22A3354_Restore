@implementation NSError(GKGameSessionError)

+ (id)_gkUserErrorForGameSessionErrorCode:()GKGameSessionError userInfo:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a4;
  if (v5)
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
  else
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 2:
      +[GCFLocalizedStrings ERROR_ICLOUD_NOT_AUTHENTICATED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_ICLOUD_NOT_AUTHENTICATED_DESCRIPTION");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      +[GCFLocalizedStrings ERROR_SESSION_CONFLICT_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_SESSION_CONFLICT_DESCRIPTION");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[GCFLocalizedStrings ERROR_SESSION_NOT_SHARED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_SESSION_NOT_SHARED_DESCRIPTION");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[GCFLocalizedStrings ERROR_SESSION_CONNECTION_CANCELLED_BY_USER](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_SESSION_CONNECTION_CANCELLED_BY_USER");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      +[GCFLocalizedStrings ERROR_SESSION_CONNECTION_FAILED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_SESSION_CONNECTION_FAILED_DESCRIPTION");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      +[GCFLocalizedStrings ERROR_SESSION_HAS_MAX_CONNECTED_PLAYERS_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_SESSION_HAS_MAX_CONNECTED_PLAYERS_DESCRIPTION");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      +[GCFLocalizedStrings ERROR_SEND_DATA_NOT_CONNECTED_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_SEND_DATA_NOT_CONNECTED_DESCRIPTION");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      +[GCFLocalizedStrings ERROR_SEND_DATA_NO_RECIPIENTS_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_SEND_DATA_NO_RECIPIENTS_DESCRIPTION");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      +[GCFLocalizedStrings ERROR_SEND_DATA_PLAYERS_NOT_REACHABLE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_SEND_DATA_PLAYERS_NOT_REACHABLE");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 11:
      +[GCFLocalizedStrings ERROR_SEND_RATE_LIMIT_REACHED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_SEND_RATE_LIMIT_REACHED");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      +[GCFLocalizedStrings ERROR_BAD_CONTAINER](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_BAD_CONTAINER");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      +[GCFLocalizedStrings ERROR_CLOUD_QUOTA_EXCEEDED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_CLOUD_QUOTA_EXCEEDED");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 14:
      +[GCFLocalizedStrings ERROR_NETWORK_FAILURE](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_NETWORK_FAILURE");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 15:
      +[GCFLocalizedStrings ERROR_CLOUD_DRIVE_DISABLED](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_CLOUD_DRIVE_DISABLED");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    case 16:
      +[GCFLocalizedStrings ERROR_SESSION_INVALID](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_SESSION_INVALID");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      +[GCFLocalizedStrings ERROR_UNKNOWN_DESCRIPTION](_TtC20GameCenterFoundation19GCFLocalizedStrings, "ERROR_UNKNOWN_DESCRIPTION");
      v7 = objc_claimAutoreleasedReturnValue();
      break;
  }
  v8 = (void *)v7;
  if (v7)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", GKGameSessionErrorDomain, a3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
