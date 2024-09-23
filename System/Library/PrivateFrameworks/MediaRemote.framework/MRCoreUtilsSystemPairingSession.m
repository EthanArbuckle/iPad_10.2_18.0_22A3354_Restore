@implementation MRCoreUtilsSystemPairingSession

- (id)initializePairingSession:(PairingSessionPrivate *)a3
{
  -[MRCoreUtilsPairingSession setPairingFlags:](self, "setPairingFlags:", 12);
  return 0;
}

- (BOOL)shouldAutoRetryPairingExchange:(id)a3
{
  return 0;
}

- (id)addPeer
{
  NSObject *v3;
  void *v4;
  MRCoreUtilsPairingSession *v5;
  void *v6;
  MRCoreUtilsPairingSession *v7;
  id v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRCryptoPairingSession device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils-System)] Pairing Device %@", (uint8_t *)&v11, 0xCu);

  }
  v5 = [MRCoreUtilsPairingSession alloc];
  -[MRCryptoPairingSession device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MRCoreUtilsPairingSession initWithRole:device:](v5, "initWithRole:device:", 0, v6);

  -[MRCoreUtilsPairingSession open](v7, "open");
  v8 = -[MRCoreUtilsPairingSession removePeer](v7, "removePeer");
  -[MRCoreUtilsSystemPairingSession updatePeer](self, "updatePeer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)removePeer
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MRCryptoPairingSession device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils-System)] Unpairing Device %@", (uint8_t *)&v7, 0xCu);

  }
  -[MRCryptoPairingSession device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[MRCoreUtilsSystemPairingSession updateMediaRemotePairedDevice:](self, 0);
  else
    MRCreateCryptoError(CFSTR("Cannot remove peer, No device available"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)updateMediaRemotePairedDevice:(id)a1
{
  id v3;
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  dispatch_time_t v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  NSObject *v30;
  uint64_t *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  uint64_t *v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  _QWORD v42[4];
  NSObject *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v3 = a2;
  if (a1)
  {
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy_;
    v55 = __Block_byref_object_dispose_;
    v56 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy_;
    v49 = __Block_byref_object_dispose_;
    v50 = 0;
    objc_msgSend((id)objc_opt_class(), "pairingManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1, "peerIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = dispatch_semaphore_create(0);
      v7 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke;
      v42[3] = &unk_1E30C5D20;
      v44 = &v51;
      v8 = v6;
      v43 = v8;
      objc_msgSend(v4, "setInvalidationHandler:", v42);
      v39[0] = v7;
      v39[1] = 3221225472;
      v39[2] = __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_2;
      v39[3] = &unk_1E30C5D20;
      v41 = &v51;
      v9 = v8;
      v40 = v9;
      objc_msgSend(v4, "setInterruptionHandler:", v39);
      objc_msgSend(a1, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v32[0] = v7;
      v32[1] = 3221225472;
      v32[2] = __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_3;
      v32[3] = &unk_1E30C5D48;
      v14 = v11;
      v33 = v14;
      v15 = v5;
      v34 = v15;
      v16 = v3;
      v35 = v16;
      v17 = v13;
      v36 = v17;
      v38 = &v45;
      v18 = v9;
      v37 = v18;
      objc_msgSend(v4, "getPairedPeersWithOptions:completion:", 4, v32);
      v19 = dispatch_time(0, 7000000000);
      dispatch_semaphore_wait(v18, v19);
      if (v46[5])
      {
        v26 = v7;
        v27 = 3221225472;
        v28 = __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_4;
        v29 = &unk_1E30C5D70;
        v31 = &v51;
        v20 = v18;
        v30 = v20;
        v21 = (void *)MEMORY[0x194036C44](&v26);
        v22 = v46[5];
        if (v16)
          objc_msgSend(v4, "savePairedPeer:options:completion:", v22, 4, v21, v26, v27, v28, v29);
        else
          objc_msgSend(v4, "removePairedPeer:options:completion:", v22, 4, v21, v26, v27, v28, v29);
        v24 = dispatch_time(0, 7000000000);
        dispatch_semaphore_wait(v20, v24);

      }
      objc_msgSend(v4, "setInterruptionHandler:", 0);
      objc_msgSend(v4, "setInvalidationHandler:", 0);
      objc_msgSend(v4, "invalidate");

    }
    else
    {
      MRCreateCryptoError(CFSTR("Does not have required entitlements"));
      v23 = objc_claimAutoreleasedReturnValue();
      v15 = (id)v52[5];
      v52[5] = v23;
    }

    a1 = (id)v52[5];
    _Block_object_dispose(&v45, 8);

    _Block_object_dispose(&v51, 8);
  }

  return a1;
}

- (id)updatePeer
{
  void *v3;
  void *v4;
  void *v5;

  -[MRCryptoPairingSession device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MRCryptoPairingSession device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRCoreUtilsSystemPairingSession updateMediaRemotePairedDevice:](self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MRCreateCryptoError(CFSTR("Cannot update peer, No device available"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)pairedPeerDevice
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
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
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  -[MRCoreUtilsSystemPairingSession pairedPeerDevices](self, "pairedPeerDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRCoreUtilsSystemPairingSession mediaRemotePairedDevices](self, "mediaRemotePairedDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__MRCoreUtilsSystemPairingSession_pairedPeerDevice__block_invoke;
  v8[3] = &unk_1E30C5C80;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __51__MRCoreUtilsSystemPairingSession_pairedPeerDevice__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  _BYTE *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    v21 = a4;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = *(id *)(a1 + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v18, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", v7);

          if (v20)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v18);
            *v21 = 1;
            goto LABEL_12;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (id)pairedPeerDevices
{
  void *v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v12[5];
  NSObject *v13;
  uint64_t *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)objc_opt_class(), "pairingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    v5 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke;
    v17[3] = &unk_1E30C5CA8;
    v6 = v4;
    v18 = v6;
    objc_msgSend(v3, "setInvalidationHandler:", v17);
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke_2;
    v15[3] = &unk_1E30C5CA8;
    v7 = v6;
    v16 = v7;
    objc_msgSend(v3, "setInterruptionHandler:", v15);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke_3;
    v12[3] = &unk_1E30C5CD0;
    v14 = &v19;
    v12[4] = self;
    v8 = v7;
    v13 = v8;
    objc_msgSend(v3, "getPairedPeersWithOptions:completion:", 4, v12);
    v9 = dispatch_time(0, 7000000000);
    dispatch_semaphore_wait(v8, v9);
    objc_msgSend(v3, "setInterruptionHandler:", 0);
    objc_msgSend(v3, "setInvalidationHandler:", 0);
    objc_msgSend(v3, "invalidate");

  }
  v10 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v10;
}

intptr_t __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __52__MRCoreUtilsSystemPairingSession_pairedPeerDevices__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  MRDeviceInfo *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v9 = -[MRCoreUtilsSystemPairingSession _createPeerDeviceFromPairedPeer:](*(_QWORD *)(a1 + 32), *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7));
        objc_msgSend(v8, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (MRDeviceInfo)_createPeerDeviceFromPairedPeer:(uint64_t)a1
{
  id v3;
  void *v4;
  MRDeviceInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v5 = objc_alloc_init(MRDeviceInfo);
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setIdentifier:](v5, "setIdentifier:", v7);

    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setName:](v5, "setName:", v8);

    objc_msgSend(v4, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRDeviceInfo setLocalizedModelName:](v5, "setLocalizedModelName:", v9);

  }
  return v5;
}

- (id)mediaRemotePairedDevices
{
  id v2;
  void *v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend((id)objc_opt_class(), "pairingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    v5 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke;
    v19[3] = &unk_1E30C5CA8;
    v6 = v4;
    v20 = v6;
    objc_msgSend(v3, "setInvalidationHandler:", v19);
    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke_2;
    v17[3] = &unk_1E30C5CA8;
    v7 = v6;
    v18 = v7;
    objc_msgSend(v3, "setInterruptionHandler:", v17);
    v11 = v5;
    v12 = 3221225472;
    v13 = __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke_3;
    v14 = &unk_1E30C5CF8;
    v15 = v2;
    v16 = v7;
    v8 = v7;
    objc_msgSend(v3, "getPairedPeersWithOptions:completion:", 4, &v11);
    v9 = dispatch_time(0, 7000000000);
    dispatch_semaphore_wait(v8, v9);
    objc_msgSend(v3, "setInterruptionHandler:", 0, v11, v12, v13, v14);
    objc_msgSend(v3, "setInvalidationHandler:", 0);
    objc_msgSend(v3, "invalidate");

  }
  return v2;
}

intptr_t __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __59__MRCoreUtilsSystemPairingSession_mediaRemotePairedDevices__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MRDeviceInfo *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a2;
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v2)
  {
    v3 = v2;
    v16 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v18 != v16)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v5, "info");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("MediaRemote_ExtendedInfo"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("MediaRemote_PeerIdentifier"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("MediaRemote_PeerName"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v10 = objc_alloc_init(MRDeviceInfo);
          -[MRDeviceInfo setIdentifier:](v10, "setIdentifier:", v8);
          -[MRDeviceInfo setName:](v10, "setName:", v9);
          v11 = *(void **)(a1 + 32);
          objc_msgSend(v5, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUIDString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v10, v13);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

intptr_t __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    MRCreateCryptoError(CFSTR("CUPairingManager Invalidation"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    MRCreateCryptoError(CFSTR("CUPairingManager Interuption"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = v3;
    v16 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v16)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "info");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("MediaRemote_ExtendedInfo"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("MediaRemote_PeerIdentifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
          goto LABEL_21;
        v10 = *(void **)(a1 + 40);
        objc_msgSend(v6, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v10, "isEqualToString:", v12);

        if ((_DWORD)v10)
        {
LABEL_21:
          if (*(_QWORD *)(a1 + 48))
          {
            v13 = (id)objc_msgSend(v7, "mutableCopy");
            if (!v13)
              v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v14 = (id)objc_msgSend(v8, "mutableCopy");
            if (!v14)
              v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v14, "setObject:forKey:", *(_QWORD *)(a1 + 32), CFSTR("MediaRemote_PeerIdentifier"));
            objc_msgSend(v14, "setObject:forKey:", *(_QWORD *)(a1 + 56), CFSTR("MediaRemote_PeerName"));
            objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("MediaRemote_ExtendedInfo"));
            objc_msgSend(v6, "setInfo:", v13);

          }
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v6);

          goto LABEL_18;
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_18:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

void __65__MRCoreUtilsSystemPairingSession_updateMediaRemotePairedDevice___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  if (!v6)
    objc_storeStrong(v5, a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (BOOL)systemPairingAvailable
{
  if (systemPairingAvailable___once != -1)
    dispatch_once(&systemPairingAvailable___once, &__block_literal_global_2);
  return systemPairingAvailable_supportsSystemPairing;
}

uint64_t __57__MRCoreUtilsSystemPairingSession_systemPairingAvailable__block_invoke()
{
  uint64_t result;
  void *v1;

  if ((MRProcessIsMediaRemoteDaemon() & 1) != 0)
  {
    result = 1;
  }
  else
  {
    v1 = (void *)MRGetSharedService();
    result = MRMediaRemoteServiceSupportsSystemPairing(v1);
  }
  systemPairingAvailable_supportsSystemPairing = result;
  return result;
}

+ (id)pairingManager
{
  id v2;
  void *v3;
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(a1, "systemPairingAvailable"))
  {
    v2 = objc_alloc_init((Class)MSVWeakLinkClass());
    +[MRCoreUtilsSystemPairingSession globalPairingQueue]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDispatchQueue:", v3);

    return v2;
  }
  else
  {
    _MRLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[CryptoPairingSession(CoreUtils-System)] Pairing Manager not available due to lacking entitlements", v6, 2u);
    }

    return 0;
  }
}

+ (id)globalPairingQueue
{
  objc_opt_self();
  if (globalPairingQueue___once != -1)
    dispatch_once(&globalPairingQueue___once, &__block_literal_global_24);
  return (id)globalPairingQueue___queue;
}

void __53__MRCoreUtilsSystemPairingSession_globalPairingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.MediaRemote.MRCoreUtilsSystemPairingSession.GlobalQueue", v2);
  v1 = (void *)globalPairingQueue___queue;
  globalPairingQueue___queue = (uint64_t)v0;

}

@end
