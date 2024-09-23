@implementation CUPairingManager

uint64_t __80__CUPairingManager_APPairingClientCoreUtils__pairingGroupInfoForPairingGroupID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "groupInfo");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", objc_msgSend(a2, "groupInfo"));
  return result;
}

intptr_t __74__CUPairingManager_APPairingClientCoreUtils__peersMatchingPairingGroupID___block_invoke(uint64_t a1, void *a2)
{
  if (NSErrorToOSStatus())
  {
    if (gLogCategory_APPairingClientCoreUtils <= 90
      && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
    {
      if (*(_QWORD *)(a1 + 32))
        IsAppleInternalBuild();
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_APPairingClientCoreUtils <= 50
      && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(a2, "count");
      if (*(_QWORD *)(a1 + 32))
        IsAppleInternalBuild();
      LogPrintF();
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __87__CUPairingManager_APPairingClientCoreUtils__updatePairingGroupInfo_forPairingGroupID___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = NSErrorToOSStatus();
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (gLogCategory_APPairingClientCoreUtils <= 90
      && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
    {
      if (!*(_QWORD *)(a1 + 32))
        goto LABEL_8;
      goto LABEL_5;
    }
  }
  else if (gLogCategory_APPairingClientCoreUtils <= 50
         && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
  {
    if (!*(_QWORD *)(a1 + 32))
    {
LABEL_8:
      LogPrintF();
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    }
LABEL_5:
    IsAppleInternalBuild();
    goto LABEL_8;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __61__CUPairingManager_APPairingClientCoreUtils__savePairedPeer___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = NSErrorToOSStatus();
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (gLogCategory_APPairingClientCoreUtils <= 90
      && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
    {
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_APPairingClientCoreUtils <= 50
         && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
  {
    if (*(_QWORD *)(a1 + 32))
      IsAppleInternalBuild();
    goto LABEL_8;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

@end
