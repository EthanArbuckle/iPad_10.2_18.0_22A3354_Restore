@implementation MAAutoAssetError

+ (id)summaryForCode:(int64_t)a3 fromOperation:(id)a4
{
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  BOOL v8;

  v4 = CFSTR("MAAutoAssetError");
  if (a3 <= 6530)
  {
    if (a3 <= 6200)
    {
      switch(a3)
      {
        case 6101:
          v4 = CFSTR("ResourceUnavailable");
          break;
        case 6102:
          v4 = CFSTR("MissingParameter");
          break;
        case 6103:
          v4 = CFSTR("InvalidInstance");
          break;
        case 6104:
          v4 = CFSTR("CommunicationFailure");
          break;
        case 6105:
          v4 = CFSTR("OperationTimedOut");
          break;
        case 6106:
          v4 = CFSTR("UnknownOperation");
          break;
        case 6107:
          v4 = CFSTR("UnderlyingError");
          break;
        case 6108:
          v4 = CFSTR("InvalidValue");
          break;
        case 6109:
          v4 = CFSTR("TooManyEntries");
          break;
        case 6110:
          v4 = CFSTR("NoValidEntries");
          break;
        case 6111:
          v4 = CFSTR("MissingReference");
          break;
        case 6112:
          v4 = CFSTR("NotSupportedForSimulator");
          break;
        case 6113:
          v4 = CFSTR("BusyPerformingOperation");
          break;
        case 6114:
          v4 = CFSTR("EliminationInProgress");
          break;
        case 6115:
          v4 = CFSTR("OperationCanceled");
          break;
        default:
          v7 = CFSTR("SUCCESS");
          v8 = a3 == 0;
LABEL_64:
          if (v8)
            v4 = v7;
          break;
      }
    }
    else if (a3 > 6300)
    {
      switch(a3)
      {
        case 6501:
          v4 = CFSTR("NotCurrentlyLocked");
          break;
        case 6502:
          v4 = CFSTR("LockInitiatedNoWait");
          break;
        case 6503:
          v4 = CFSTR("LockNoWaitNoDownloadedAsset");
          break;
        case 6504:
          v4 = CFSTR("LockAttemptedNoDownloadedAsset");
          break;
        case 6505:
          v4 = CFSTR("LockTimeoutNoDownloadedAsset");
          break;
        default:
          v5 = 6301;
          v6 = CFSTR("NotAwareOfAsset");
          if (a3 == 6401)
            v4 = CFSTR("DownloadPostponed");
          goto LABEL_20;
      }
    }
    else
    {
      switch(a3)
      {
        case 6201:
          v4 = CFSTR("NoVersionFound");
          break;
        case 6202:
          v4 = CFSTR("NewerVersionRevoked");
          break;
        case 6203:
          v4 = CFSTR("AvailableVersionRevoked");
          break;
        case 6204:
          v4 = CFSTR("CheckInitiatedNoWait");
          break;
        case 6205:
          v4 = CFSTR("SameVersionFound");
          break;
        case 6206:
          v4 = CFSTR("CheckNoWaitNoDownloadedAsset");
          break;
        case 6207:
          v4 = CFSTR("CheckAttemptedNoDownloadedAsset");
          break;
        case 6208:
          v4 = CFSTR("CheckTimeoutNoDownloadedAsset");
          break;
        case 6209:
          v4 = CFSTR("NotEnoughSpaceForSetDownload");
          break;
        case 6210:
          v4 = CFSTR("SomeContentNotAvailable");
          break;
        default:
          v8 = a3 == 6251;
          v7 = CFSTR("CheckNoWaitNoDownloadedInstance");
          goto LABEL_64;
      }
    }
  }
  else if (a3 > 6700)
  {
    v5 = 6701;
    v6 = CFSTR("BlockedNoNetwork");
    if (a3 == 6801)
      v4 = CFSTR("NotImplemented");
    if (a3 == 6702)
      v4 = CFSTR("BlockedRecentUserActivity");
LABEL_20:
    if (a3 == v5)
      v4 = v6;
  }
  else
  {
    switch(a3)
    {
      case 6531:
        v4 = CFSTR("NotSecureAssetFormat");
        break;
      case 6532:
        v4 = CFSTR("SecureOperationInProgress");
        break;
      case 6533:
        v4 = CFSTR("WouldRequireNetwork");
        break;
      case 6534:
        v4 = CFSTR("SecureOperationFailure");
        break;
      case 6535:
        v4 = CFSTR("SecureUnableToPersonalize");
        break;
      case 6536:
        v4 = CFSTR("SecureUnableToBeginAccess");
        break;
      case 6537:
        v4 = CFSTR("SecureUnableToMapToExclave");
        break;
      case 6551:
        v4 = CFSTR("SetAtomicInstanceUnknown");
        break;
      case 6552:
        v4 = CFSTR("SetSubAtomicInstanceUnavailable");
        break;
      case 6553:
        v4 = CFSTR("SetSubAtomicInstanceReference");
        break;
      case 6554:
        v4 = CFSTR("SetConfigurationInvalid");
        break;
      case 6555:
        v4 = CFSTR("SetEmptyEntriesNotValid");
        break;
      case 6556:
        v4 = CFSTR("SetNoneFoundServerSide");
        break;
      case 6557:
        v4 = CFSTR("SetAtomicInstanceOrphaned");
        break;
      case 6558:
        v4 = CFSTR("SetIdentifierNotFound");
        break;
      case 6570:
        v4 = CFSTR("PolicyInvalidClientRequest");
        break;
      case 6571:
        v4 = CFSTR("PolicyInvalidUserInitiated");
        break;
      case 6572:
        v4 = CFSTR("PolicyInvalidLockInhibits");
        break;
      case 6573:
        v4 = CFSTR("PolicyInvalidBlockCheck");
        break;
      case 6580:
        v4 = CFSTR("InvalidForLockerMode");
        break;
      case 6581:
        v4 = CFSTR("RestrictedToLockerMode");
        break;
      case 6582:
        v4 = CFSTR("NoSharedLock");
        break;
      case 6583:
        v4 = CFSTR("FailedSharedLockPreparation");
        break;
      case 6584:
        v4 = CFSTR("ShortTermLocked");
        break;
      case 6601:
        v4 = CFSTR("StagingOperationReplaced");
        break;
      case 6602:
        v4 = CFSTR("StagingDetermineUnableWhenRequired");
        break;
      case 6603:
        v4 = CFSTR("StagingDetermineUnableNoRequired");
        break;
      case 6604:
        v4 = CFSTR("StagingDetermineAlreadyDownloading");
        break;
      case 6605:
        v4 = CFSTR("StagingDetermineAlreadyDownloaded");
        break;
      case 6606:
        v4 = CFSTR("StagingWrongMode");
        break;
      case 6607:
        v4 = CFSTR("StagingAlreadyDetermining");
        break;
      case 6608:
        v4 = CFSTR("StagingNoGroupsStaged");
        break;
      case 6609:
        v4 = CFSTR("StagingOperationCanceled");
        break;
      case 6611:
        v4 = CFSTR("StagingDownloadUnableWhenRequired");
        break;
      case 6612:
        v4 = CFSTR("StagingDifferentClientThanLatched");
        break;
      case 6613:
        v4 = CFSTR("StagingSpecifierNotInLookupResults");
        break;
      default:
        return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@(%lld)"), a4, v4, a3);
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@(%lld)"), a4, v4, a3);
}

+ (id)buildError:(int64_t)a3 fromOperation:(id)a4 underlyingError:(id)a5 withDescription:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v9 = a5;
  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  +[MAAutoAssetError summaryForCode:fromOperation:](MAAutoAssetError, "summaryForCode:fromOperation:", a3, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v10)
    v15 = objc_msgSend(v14, "initWithFormat:", CFSTR("[%@] %@"), v13, v10);
  else
    v15 = objc_msgSend(v14, "initWithFormat:", CFSTR("[%@]"), v13, v19);
  v16 = (void *)v15;
  if (v15)
    objc_msgSend(v12, "setObject:forKey:", v15, *MEMORY[0x1E0CB2D50]);
  if (v9)
    objc_msgSend(v12, "setObject:forKey:", v9, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.MobileAssetError.AutoAsset"), a3, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
