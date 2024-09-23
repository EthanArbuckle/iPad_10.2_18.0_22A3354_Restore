@implementation DKSyncPeerStatusTracker

void __42___DKSyncPeerStatusTracker_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  _DKSyncContext *v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  v4 = -[_DKSyncContext initWithName:]([_DKSyncContext alloc], "initWithName:", CFSTR("DEFAULT"));
  v2 = objc_msgSend(v1, "initWithContext:", v4);
  v3 = (void *)sharedInstance_sharedInstance_4;
  sharedInstance_sharedInstance_4 = v2;

}

void __53___DKSyncPeerStatusTracker_syncPeerTransportsStrings__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];
  _QWORD v3[17];

  v3[16] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E272B230;
  v2[1] = &unk_1E272B248;
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("Rapport(Pull)");
  v2[2] = &unk_1E272B260;
  v2[3] = &unk_1E272B278;
  v3[2] = CFSTR("Cloud(Down)");
  v3[3] = CFSTR("Cloud(Up)");
  v2[4] = &unk_1E272B290;
  v2[5] = &unk_1E272B2A8;
  v3[4] = CFSTR("Rapport(Pull) & Cloud(Down)");
  v3[5] = CFSTR("Rapport(Pull) & Cloud(Up)");
  v2[6] = &unk_1E272B2C0;
  v2[7] = &unk_1E272B2D8;
  v3[6] = CFSTR("Cloud(Down) & Cloud(Up)");
  v3[7] = CFSTR("Rapport(Pull), Cloud(Down) & Cloud(Up)");
  v2[8] = &unk_1E272B2F0;
  v2[9] = &unk_1E272B308;
  v3[8] = CFSTR("Rapport(Push)");
  v3[9] = CFSTR("Rapport(Pull) & Rapport(Push)");
  v2[10] = &unk_1E272B320;
  v2[11] = &unk_1E272B338;
  v3[10] = CFSTR("Rapport(Push) & Cloud(Down)");
  v3[11] = CFSTR("Rapport(Push) & Cloud(Up)");
  v2[12] = &unk_1E272B350;
  v2[13] = &unk_1E272B368;
  v3[12] = CFSTR("Rapport(Pull), Rapport(Push) & Cloud(Down)");
  v3[13] = CFSTR("Rapport(Pull), Rapport(Push) & Cloud(Up)");
  v2[14] = &unk_1E272B380;
  v2[15] = &unk_1E272B398;
  v3[14] = CFSTR("Rapport(Push), Cloud(Down) & Cloud(Up)");
  v3[15] = CFSTR("Rapport(Pull), Rapport(Push), Cloud(Down) & Cloud(Up)");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncPeerTransportsStrings_strings;
  syncPeerTransportsStrings_strings = v0;

}

uint64_t __55___DKSyncPeerStatusTracker_addActiveTransports_toPeer___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) | a2;
}

uint64_t __60___DKSyncPeerStatusTracker_removeActiveTransports_fromPeer___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 & ~*(_QWORD *)(a1 + 32);
}

uint64_t __41___DKSyncPeerStatusTracker_debugLogPeers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v6;
  if (v6)
    v8 = (void *)v6[2];
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "sourceDeviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  v12 = v11;
  if (v11)
    v13 = (void *)v11[2];
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v14, "sourceDeviceID");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v10 || !v15)
  {
    if (!v10 || v15)
    {
      if (v10 || !v15)
      {
        objc_msgSend(v9, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v22, "compare:", v23);

        goto LABEL_25;
      }
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  if (!v7)
  {
    v17 = 0;
    if (v12)
      goto LABEL_9;
LABEL_29:
    v19 = 0;
    if (!v17)
    {
LABEL_13:
      if (v17)
        v20 = 0;
      else
        v20 = v19;
      if (!v20)
        goto LABEL_17;
LABEL_23:
      v21 = 1;
      goto LABEL_25;
    }
    goto LABEL_12;
  }
  v17 = v7[3];
  if (!v12)
    goto LABEL_29;
LABEL_9:
  v18 = v12[3];
  v19 = v18 != 0;
  if (!v17 || !v18)
  {
    if (!v17)
      goto LABEL_13;
LABEL_12:
    if (v19)
      goto LABEL_13;
LABEL_20:
    v21 = -1;
    goto LABEL_25;
  }
LABEL_17:
  v21 = objc_msgSend(v10, "compare:", v15);
LABEL_25:

  return v21;
}

@end
