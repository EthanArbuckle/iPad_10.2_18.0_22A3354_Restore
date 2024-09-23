@implementation BRCAppTelemetryConverter

- (id)fixupValue:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v6, "isEqualToString:", CFSTR("telemetrySchema")))
  {
    v7 = objc_msgSend(v5, "integerValue");
    if ((int)v7 > 299)
    {
      switch((int)v7)
      {
        case 500:
          v8 = CFSTR("ITEM_BOUNCE_APPLY_NEW_WITH_EXISTING");
          break;
        case 501:
          v8 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW");
          break;
        case 502:
          v8 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_EXISTING");
          break;
        case 503:
          v8 = CFSTR("ITEM_BOUNCE_BY_SERVER");
          break;
        case 504:
          v8 = CFSTR("ITEM_BOUNCE_CREATE_ITEM_WITH_EXISTING");
          break;
        case 505:
          v8 = CFSTR("ITEM_BOUNCE_CHANGE_ITEM_WITH_EXISTING");
          break;
        case 506:
          v8 = CFSTR("ITEM_BOUNCE_SHARE_ACCEPT_EXISTING_WITH_NEW");
          break;
        case 507:
          v8 = CFSTR("ITEM_BOUNCE_SHARE_ACCEPT_NEW_WITH_EXISTING");
          break;
        case 508:
          v8 = CFSTR("ITEM_BOUNCE_TRASHED_ITEM");
          break;
        case 509:
          v8 = CFSTR("ITEM_BOUNCE_ITEM_DIRECTORY_MERGE");
          break;
        case 510:
          v8 = CFSTR("ITEM_BOUNCE_NEW_DIRECTORY_WITH_EXISTING");
          break;
        case 511:
          v8 = CFSTR("ITEM_BOUNCE_EXISTING_WITH_NEW_DIRECTORY");
          break;
        case 512:
          v8 = CFSTR("ITEM_BOUNCE_ITEM_WITH_DOCUMENTS_FOLDER");
          break;
        case 513:
          v8 = CFSTR("ITEM_BOUNCE_APPLY_DEAD_EXISTING_WITH_NEW");
          break;
        case 514:
          v8 = CFSTR("ITEM_BOUNCE_APPLY_NOT_KNOWN_BY_SERVER_WITH_NEW");
          break;
        case 515:
          v8 = CFSTR("ITEM_BOUNCE_APPLY_LOCAL_DIFF_REPARENT_WITH_NEW");
          break;
        case 516:
          v8 = CFSTR("ITEM_BOUNCE_APPLY_LOCAL_DIFF_FILE_NAME_WITH_NEW");
          break;
        case 517:
          v8 = CFSTR("ITEM_BOUNCE_APPLY_INITIAL_SCAN_WITH_NEW");
          break;
        case 518:
          v8 = CFSTR("ITEM_BOUNCE_APPLY_SHARED_ITEM_WITH_NEW_SHARED_ITEM_UNTITLED_FILE_NAME");
          break;
        case 519:
          v8 = CFSTR("ITEM_BOUNCE_APPLY_EXISTING_WITH_NEW_UNTITLED_FILE_NAME");
          break;
        default:
          switch((int)v7)
          {
            case 400:
              v8 = CFSTR("FPFS_MIGRATION_STARTED");
              break;
            case 401:
              v8 = CFSTR("FPFS_MIGRATION_FINISHED");
              break;
            case 402:
              v8 = CFSTR("FPFS_MIGRATION_STATUS_REPORT");
              break;
            case 403:
              v8 = CFSTR("FPFS_MIGRATION_NON_MIGRATED_ITEM_REPORT");
              break;
            case 404:
              v8 = CFSTR("FPFS_MIGRATION_STUCK_STATUS");
              break;
            default:
              if ((_DWORD)v7 != 300)
              {
LABEL_42:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
                v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
                goto LABEL_9;
              }
              v8 = CFSTR("INITIAL_SCAN_REJECTED_MISMATCH_TYPE");
              break;
          }
          break;
      }
    }
    else
    {
      v8 = CFSTR("UNKNOWN");
      switch((int)v7)
      {
        case 0:
          break;
        case 1:
          v8 = CFSTR("_UNUSED_SYNC_UP_BACKOFF_RATIO");
          break;
        case 2:
          v8 = CFSTR("FOLDER_SHARING_ITEM_COUNT_MISMATCH");
          break;
        case 3:
          v8 = CFSTR("MISSING_PUSH");
          break;
        case 4:
          v8 = CFSTR("PERMANENTLY_INCONSISTENT");
          break;
        case 5:
          v8 = CFSTR("DROPPED_EVENTS");
          break;
        case 6:
          v8 = CFSTR("TEST_METRIC");
          break;
        case 7:
          v8 = CFSTR("SHARE_ALIAS_IN_SHARED_FOLDER");
          break;
        case 8:
          v8 = CFSTR("MALIGNANT_ZONE_RESET");
          break;
        case 9:
          v8 = CFSTR("BENIGN_ZONE_RESET");
          break;
        case 10:
          v8 = CFSTR("DB_RESET");
          break;
        case 11:
          v8 = CFSTR("APPLY_SCHEDULER_MISSING_JOBS");
          break;
        case 12:
          v8 = CFSTR("SYNC_UP_MISSING_JOBS");
          break;
        case 13:
          v8 = CFSTR("READER_MISSING_JOBS");
          break;
        case 14:
          v8 = CFSTR("UPLOADER_MISSING_JOBS");
          break;
        case 15:
          v8 = CFSTR("DOWNLOADER_MISSING_JOBS");
          break;
        case 16:
          v8 = CFSTR("_UNUSED_SYNC_UP_BACKOFF_DELAY");
          break;
        case 17:
          v8 = CFSTR("FOLDER_SHARING_PCS_CHAINING");
          break;
        case 18:
          v8 = CFSTR("NEW_SHARE_ACCEPTATION");
          break;
        case 19:
          v8 = CFSTR("FS_EVENT_TO_SYNC_UP");
          break;
        case 20:
          v8 = CFSTR("USER_DOWNLOAD");
          break;
        case 21:
          v8 = CFSTR("CORRUPT_PACKAGE_DOWNLOAD");
          break;
        case 22:
          v8 = CFSTR("DIRECTORY_MISSING_CHAINPCS");
          break;
        case 23:
          v8 = CFSTR("SYNC_BOOSTING_PROBLEM_COUNT");
          break;
        case 24:
          v8 = CFSTR("DEEP_SCAN");
          break;
        case 25:
          v8 = CFSTR("OPERATION_TIMED_OUT");
          break;
        case 26:
          v8 = CFSTR("MISSING_SHARE_ALIAS");
          break;
        case 27:
          v8 = CFSTR("ASSET_CONTENT_NOT_FOUND");
          break;
        case 28:
          v8 = CFSTR("QBS_DIR_FAULT_COUNT");
          break;
        case 29:
          v8 = CFSTR("FILE_BOUNCED_MANY_TIMES");
          break;
        case 30:
          v8 = CFSTR("SYNC_UP_BACKOFF_RATIO_SUMMARY");
          break;
        case 31:
          v8 = CFSTR("SYNC_UP_BACKOFF_DELAY_SUMMARY");
          break;
        case 32:
          v8 = CFSTR("QBS_PERFORMANCE");
          break;
        case 33:
          v8 = CFSTR("ACCOUNT_SESSION_OPEN_ERROR");
          break;
        case 34:
          v8 = CFSTR("CORRUPT_SHARING_OPTIONS");
          break;
        case 35:
          v8 = CFSTR("INCORRECT_CONTENT_POLICY_COUNT");
          break;
        case 36:
          v8 = CFSTR("CORRUPT_BASEHASH_SALT_COUNT");
          break;
        case 37:
          v8 = CFSTR("EDP_KEYS_MISMATCH");
          break;
        case 38:
          v8 = CFSTR("DATABASE_ID_MISMATCH");
          break;
        case 39:
          v8 = CFSTR("COLLABORATION_UPLOAD");
          break;
        case 40:
          v8 = CFSTR("DANGLING_ZOMBIE_DIRECTORY_COUNT");
          break;
        case 41:
          v8 = CFSTR("RECORD_VALUE_ERROR");
          break;
        case 42:
          v8 = CFSTR("AGGRESSIVE_SALTING");
          break;
        case 43:
        case 44:
        case 45:
        case 46:
        case 47:
        case 48:
        case 49:
        case 50:
        case 51:
        case 52:
        case 53:
        case 54:
        case 55:
        case 56:
        case 57:
        case 58:
        case 59:
        case 60:
        case 61:
        case 62:
        case 63:
        case 64:
        case 65:
        case 66:
        case 67:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 80:
        case 81:
        case 82:
        case 83:
        case 84:
        case 85:
        case 86:
        case 87:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 96:
        case 97:
        case 98:
        case 99:
          goto LABEL_42;
        case 100:
          v8 = CFSTR("FULLY_CONSISTENT");
          break;
        case 101:
          v8 = CFSTR("FILE_CHECKSUM_MISMATCH");
          break;
        case 102:
          v8 = CFSTR("PACKAGE_CHECKSUM_MISMATCH");
          break;
        case 103:
          v8 = CFSTR("CHILD_COUNT_MISMATCH");
          break;
        case 104:
          v8 = CFSTR("RECURSIVE_ITEM_COUNT_MISMATCH");
          break;
        case 105:
          v8 = CFSTR("SHARE_ALIAS_COUNT_MISMATCH");
          break;
        case 106:
          v8 = CFSTR("SHARE_COUNT_MISMATCH");
          break;
        case 107:
          v8 = CFSTR("CONSISTENCY_CHECKER_FAILED");
          break;
        case 108:
          v8 = CFSTR("FILE_READ_ERROR");
          break;
        default:
          switch((int)v7)
          {
            case 200:
              v8 = CFSTR("CA_TOTAL_ERROR_COUNT");
              break;
            case 201:
              v8 = CFSTR("CA_UPLOAD_ERROR_COUNT");
              break;
            case 202:
              v8 = CFSTR("CA_DOWNLOAD_ERROR_COUNT");
              break;
            case 203:
              v8 = CFSTR("CA_SYNC_UP_ITEM_ERROR_COUNT");
              break;
            case 204:
              v8 = CFSTR("CA_SYNC_UP_ZONE_ERROR_COUNT");
              break;
            case 205:
              v8 = CFSTR("CA_SYNC_DOWN_ERROR_COUNT");
              break;
            case 210:
              v8 = CFSTR("CA_UPLOAD_ERROR");
              break;
            case 211:
              v8 = CFSTR("CA_DOWNLOAD_ERROR");
              break;
            case 212:
              v8 = CFSTR("CA_SYNC_UP_ITEM_ERROR");
              break;
            case 213:
              v8 = CFSTR("CA_SYNC_UP_ZONE_ERROR");
              break;
            case 214:
              v8 = CFSTR("CA_SYNC_DOWN_ERROR");
              break;
            case 215:
              v8 = CFSTR("CA_DAMAGED_FILE_UPLOAD_ERROR");
              break;
            case 216:
              v8 = CFSTR("CA_NIL_APP_LIBRARY");
              break;
            default:
              goto LABEL_42;
          }
          break;
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4)) == 0)
    {
      v9 = (__CFString *)v5;
LABEL_9:
      v8 = v9;
    }
  }

  return v8;
}

- (void)_payloadFromEventDictionary:(id)a3 dictionary:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__BRCAppTelemetryConverter__payloadFromEventDictionary_dictionary___block_invoke;
  v8[3] = &unk_1E875E6B0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __67__BRCAppTelemetryConverter__payloadFromEventDictionary_dictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "_payloadFromEventDictionary:dictionary:", v5, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v7, "fixupValue:forKey:", v5, v9);
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v9);
    v5 = (id)v8;
  }

}

- (void)_fixupEventDataWithEvent:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "hasTimestamp"))
    objc_msgSend(v3, "setTimestamp:", 60 * (objc_msgSend(v3, "timestamp") / 0x3CuLL));

}

- (id)dictionaryRepresentationFromEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BRCAppTelemetryConverter _fixupEventDataWithEvent:](self, "_fixupEventDataWithEvent:", v4);
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCAppTelemetryConverter _payloadFromEventDictionary:dictionary:](self, "_payloadFromEventDictionary:dictionary:", v5, v6);

  return v6;
}

@end
