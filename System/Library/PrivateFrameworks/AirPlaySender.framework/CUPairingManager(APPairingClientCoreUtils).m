@implementation CUPairingManager(APPairingClientCoreUtils)

- (void)pairingGroupInfoForPairingGroupID:()APPairingClientCoreUtils
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a3, CFSTR("groupID"));
  v6 = (void *)objc_msgSend(a1, "peersMatchingPairingGroupID:", a3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__CUPairingManager_APPairingClientCoreUtils__pairingGroupInfoForPairingGroupID___block_invoke;
  v8[3] = &unk_1E826AD90;
  v8[4] = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);
  return v5;
}

- (id)peersMatchingPairingGroupID:()APPairingClientCoreUtils
{
  NSObject *v5;
  const __CFString *v6;
  id v7;
  const __CFString *v9;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v5 = dispatch_semaphore_create(0);
  if (gLogCategory_APPairingClientCoreUtils <= 50
    && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
  {
    if (a3 && !IsAppleInternalBuild())
      v6 = CFSTR("#Redacted#");
    else
      v6 = a3;
    v9 = v6;
    LogPrintF();
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__CUPairingManager_APPairingClientCoreUtils__peersMatchingPairingGroupID___block_invoke;
  v10[3] = &unk_1E826ADB8;
  v10[5] = v5;
  v10[6] = &v11;
  v10[4] = a3;
  objc_msgSend(a1, "getPairedPeersWithGroupID:options:completion:", a3, 4, v10, v9);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v5)
    dispatch_release(v5);
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v7;
}

- (uint64_t)updatePairingGroupInfo:()APPairingClientCoreUtils forPairingGroupID:
{
  NSObject *v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFString *v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = dispatch_semaphore_create(0);
  if (gLogCategory_APPairingClientCoreUtils <= 50
    && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
  {
    if (a4 && !IsAppleInternalBuild())
      v8 = CFSTR("#Redacted#");
    else
      v8 = a4;
    v11 = v8;
    LogPrintF();
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__CUPairingManager_APPairingClientCoreUtils__updatePairingGroupInfo_forPairingGroupID___block_invoke;
  v12[3] = &unk_1E826ADE0;
  v12[5] = v7;
  v12[6] = &v13;
  v12[4] = a4;
  objc_msgSend(a1, "updatePairedPeersWithGroupID:groupInfo:options:completion:", a4, a3, 4, v12, v11);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v7)
    dispatch_release(v7);
  v9 = *((unsigned int *)v14 + 6);
  _Block_object_dispose(&v13, 8);
  return v9;
}

- (uint64_t)savePairedPeer:()APPairingClientCoreUtils
{
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  const __CFString *v9;
  const __CFString *v10;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = dispatch_semaphore_create(0);
  if (gLogCategory_APPairingClientCoreUtils <= 50
    && (gLogCategory_APPairingClientCoreUtils != -1 || _LogCategory_Initialize()))
  {
    if (a3 && !IsAppleInternalBuild())
      v6 = CFSTR("#Redacted#");
    else
      v6 = a3;
    v9 = a3;
    v10 = v6;
    LogPrintF();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__CUPairingManager_APPairingClientCoreUtils__savePairedPeer___block_invoke;
  v11[3] = &unk_1E826ADE0;
  v11[5] = v5;
  v11[6] = &v12;
  v11[4] = a3;
  objc_msgSend(a1, "savePairedPeer:options:completion:", a3, 4, v11, v9, v10);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (v5)
    dispatch_release(v5);
  v7 = *((unsigned int *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v7;
}

@end
