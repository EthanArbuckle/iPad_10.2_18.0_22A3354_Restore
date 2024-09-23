@implementation HAPAccessoryServerBTLE100

uint64_t __40___HAPAccessoryServerBTLE100_disconnect__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@Disconnecting %@ %@ as a result of direct disconnect call", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_disconnect");
}

void __80___HAPAccessoryServerBTLE100_listPairingsWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6702, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke_308(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    v34 = 2112;
    v35 = v3;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server '%@] Request to remove current controller completed with error %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "keyStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v8, "removeAccessoryKeyForName:error:", v9, &v29);
  v10 = v29;

  if (v10)
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v13;
      v32 = 2112;
      v33 = v14;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@After removing the accessory with 'Remove Pairing', we failed to remove accessory %@ from the keychain with error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "keyStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v10;
  v17 = objc_msgSend(v15, "deletePeripheralIdentifierForAccessoryIdentifier:error:", v16, &v28);
  v18 = v28;

  if ((v17 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v21;
      v32 = 2112;
      v33 = v22;
      v34 = 2112;
      v35 = v3;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to remove the peripheral keychain entry for %@ with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
  }
  v23 = *(void **)(a1 + 48);
  if (v23)
  {
    v24 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke_309;
    block[3] = &unk_1E894D498;
    v27 = v23;
    dispatch_async(v24, block);

  }
  objc_msgSend(*(id *)(a1 + 32), "browser");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "disconnectFromBTLEAccessoryServer:", *(_QWORD *)(a1 + 32));

}

uint64_t __82___HAPAccessoryServerBTLE100_removePairingForCurrentControllerOnQueue_completion___block_invoke_309(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Remove pairing failed."), CFSTR("Failed to create remove pairing request payload."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke_307(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke_2;
  v9[3] = &unk_1E894D798;
  v8 = *(id *)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v6, "_handlePairingsWriteForCharacteristic:writeError:removing:queue:completion:", a2, a3, 1, v7, v9);

}

uint64_t __86___HAPAccessoryServerBTLE100__removePairingWithIdentifier_publicKey_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_dequeueAndContinueOperation");
}

void __78___HAPAccessoryServerBTLE100_removePairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "addRemovePairingOperationsQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "publicKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_removePairingWithIdentifier:publicKey:queue:completion:", v5, v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "publicKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_enqueueOperation:identifier:publicKey:admin:queue:completion:", 6, v11, v10, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __103___HAPAccessoryServerBTLE100__handlePairingsReadForCharacteristic_readError_removing_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __103___HAPAccessoryServerBTLE100__handlePairingsReadForCharacteristic_readError_removing_queue_completion___block_invoke_302(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __105___HAPAccessoryServerBTLE100__handlePairingsWriteForCharacteristic_writeError_removing_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __105___HAPAccessoryServerBTLE100__handlePairingsWriteForCharacteristic_writeError_removing_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePairingsReadForCharacteristic:readError:removing:queue:completion:", a2, a3, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 12, CFSTR("Add pairing failed."), CFSTR("Failed to create add pairing request payload."), 0, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_299(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_2;
  v9[3] = &unk_1E894D798;
  v8 = *(id *)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v6, "_handlePairingsWriteForCharacteristic:writeError:removing:queue:completion:", a2, a3, 0, v7, v9);

}

uint64_t __89___HAPAccessoryServerBTLE100__addPairingWithIdentifier_publicKey_admin_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_dequeueAndContinueOperation");
}

void __75___HAPAccessoryServerBTLE100_addPairing_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = objc_msgSend(*(id *)(a1 + 32), "permissions");
  objc_msgSend(*(id *)(a1 + 40), "addRemovePairingOperationsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "publicKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_addPairingWithIdentifier:publicKey:admin:queue:completion:", v6, v8, v2 & 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  v9 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "publicKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_enqueueOperation:identifier:publicKey:admin:queue:completion:", 5, v12, v11, v2 & 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __53___HAPAccessoryServerBTLE100_identifyWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "unpairedIdentifyRequested"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 15);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setUnpairedIdentifyRequested:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_handlePairingStateMachine");
    objc_msgSend(*(id *)(a1 + 32), "_updateConnectionLifetimeTimer");
    objc_msgSend(*(id *)(a1 + 32), "setUnpairedIdentifyCompletionBlock:", *(_QWORD *)(a1 + 40));
  }
}

void __60___HAPAccessoryServerBTLE100__updateConnectionLifetimeTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_handleConnectionLifetimeTimeout");
    WeakRetained = v2;
  }

}

uint64_t __55___HAPAccessoryServerBTLE100_updateConnectionIdleTime___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  double v4;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  v4 = 10.0;
  if (v2 == 1)
    v4 = 2.0;
  objc_msgSend(v3, "setIdleConnectionTimeoutInSec:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "_updateConnectionLifetimeTimer");
}

void __63___HAPAccessoryServerBTLE100__handlePairSetupExchangeWithData___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __63___HAPAccessoryServerBTLE100__handlePairSetupExchangeWithData___block_invoke_291(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __45___HAPAccessoryServerBTLE100__pairSetupStart__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), 0);

}

void __45___HAPAccessoryServerBTLE100__pairSetupStart__block_invoke_290(uint64_t a1)
{
  void *v2;
  id v3;

  HMErrorFromOSStatus(*(unsigned int *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), v3);

}

uint64_t __91___HAPAccessoryServerBTLE100_peripheral_didUpdateNotificationStateForCharacteristic_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v13 = 138543874;
    v14 = v4;
    v15 = 2080;
    v16 = "-[_HAPAccessoryServerBTLE100 peripheral:didUpdateNotificationStateForCharacteristic:error:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%{public}@%s: Received Notification Updated confirmation for characteristics %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v6 = objc_msgSend(*(id *)(a1 + 40), "_updateConnectionLifetimeTimer");
  if (*(_QWORD *)(a1 + 48))
  {
    v7 = (void *)MEMORY[0x1D17B7244](v6);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(const char **)(a1 + 48);
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@### Notification Update failed with error: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = *(_QWORD *)(a1 + 48);
  }
  else
  {
    v11 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 40), "_handleHAPNotificationStateUpdateForCharacteristic:error:", *(_QWORD *)(a1 + 32), v11);
}

void __78___HAPAccessoryServerBTLE100_peripheral_didWriteValueForCharacteristic_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_updateConnectionLifetimeTimer");
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = (void *)MEMORY[0x1D17B7244](v2);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v18 = 138543618;
      v19 = v5;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, "%{public}@### Writing failed after receiving a write confirmation with error: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
  }
  v7 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "pairSetupCharacteristic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "peripheral");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pairSetupCharacteristic");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "pairVerifyCharacteristic");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v11, "isEqual:", v12);

    if (!(_DWORD)v11)
    {
      v14 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "identifyCharacteristic");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqual:", v15))
      {
        v16 = objc_msgSend(*(id *)(a1 + 32), "unpairedIdentifyRequested");

        if (v16)
        {
          objc_msgSend(*(id *)(a1 + 32), "unpairedIdentifyCompletionBlock");
          v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setUnpairedIdentifyCompletionBlock:", 0);
          if (v9)
            v9[2](v9, *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(a1 + 32), "browser");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "disconnectFromBTLEAccessoryServer:", *(_QWORD *)(a1 + 32));

          goto LABEL_10;
        }
      }
      else
      {

      }
      objc_msgSend(*(id *)(a1 + 32), "_handleHAPWriteConfirmationForCharacteristic:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      return;
    }
    objc_msgSend(*(id *)(a1 + 32), "peripheral");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pairVerifyCharacteristic");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v10;
  objc_msgSend(v9, "readValueForCharacteristic:", v10);

LABEL_10:
}

void __79___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForCharacteristic_error___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  char *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  unsigned __int16 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "_updateConnectionLifetimeTimer");
  if (a1[5])
  {
    v3 = (void *)MEMORY[0x1D17B7244](v2);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = a1[5];
      v6 = (const char *)a1[6];
      *(_DWORD *)buf = 138543874;
      v60 = v5;
      v61 = 2112;
      v62 = v6;
      v63 = 2112;
      v64 = v7;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, "%{public}@### Reading characteristic %@ failed with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    v8 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed with CBT code %d"), objc_msgSend(a1[5], "code"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithHMErrorCode:reason:underlyingError:", 54, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v11 = a1[6];
  objc_msgSend(a1[4], "pairSetupCharacteristic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "isEqual:", v12);

  if ((_DWORD)v11)
  {
    v13 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v15;
      v61 = 2080;
      v62 = "-[_HAPAccessoryServerBTLE100 peripheral:didUpdateValueForCharacteristic:error:]_block_invoke";
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_INFO, "%{public}@%s: Received pair setup data", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v16 = a1[4];
    objc_msgSend(a1[6], "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_pairSetupHAPCharacteristic");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_notifyDelegateOfReceivedPlaintextData:forCharacteristic:", v17, v18);

    v19 = a1[4];
    objc_msgSend(a1[6], "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_handlePairSetupExchangeWithData:", v20);
LABEL_14:

    goto LABEL_15;
  }
  v21 = a1[6];
  objc_msgSend(a1[4], "pairVerifyCharacteristic");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v21, "isEqual:", v22);

  if ((_DWORD)v21)
  {
    v23 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v60 = v25;
      v61 = 2080;
      v62 = "-[_HAPAccessoryServerBTLE100 peripheral:didUpdateValueForCharacteristic:error:]_block_invoke";
      _os_log_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_INFO, "%{public}@%s: Received pair verify data", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    v26 = a1[4];
    objc_msgSend(a1[6], "value");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_pairVerifyHAPCharacteristic");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_notifyDelegateOfReceivedPlaintextData:forCharacteristic:", v27, v28);

    v29 = a1[4];
    objc_msgSend(a1[6], "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_handleReceivedSecuritySessionSetupExchangeData:", v20);
    goto LABEL_14;
  }
  v30 = a1[6];
  objc_msgSend(a1[4], "pairingFeaturesCharacteristic");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = objc_msgSend(v30, "isEqual:", v31);

  v32 = a1[6];
  if ((_DWORD)v30)
  {
    objc_msgSend(v32, "value");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = v36;
      v61 = 2080;
      v62 = "-[_HAPAccessoryServerBTLE100 peripheral:didUpdateValueForCharacteristic:error:]_block_invoke";
      v63 = 2112;
      v64 = v33;
      _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_INFO, "%{public}@%s: Received pair features data %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v34);
    if (objc_msgSend(v33, "length") == 1)
    {
      *((_QWORD *)a1[4] + 80) = *(unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v33), "bytes");
      objc_msgSend(a1[4], "setPairingFeaturesRead:", 1);
    }
    objc_msgSend(a1[4], "_handlePairingStateMachine");

  }
  else
  {
    objc_msgSend(v32, "UUID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("00000051-0000-1000-8000-0026BB765291"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v37, "isEqual:", v38);

    if (v39)
    {
      if (a1[5]
        || (objc_msgSend(a1[6], "value"),
            v44 = (void *)objc_claimAutoreleasedReturnValue(),
            v45 = objc_msgSend(v44, "length"),
            v44,
            !v45))
      {
        v40 = 0;
      }
      else
      {
        v58 = 0;
        v46 = a1[4];
        objc_msgSend(a1[6], "value");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        objc_msgSend(v46, "_decryptData:error:", v47, &v57);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v57;

        v40 = 0;
        if (objc_msgSend(v48, "length") == 2)
        {
          objc_msgSend(v48, "getBytes:length:", &v58, 2);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v58);
          v40 = (char *)objc_claimAutoreleasedReturnValue();
        }
        v50 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "service");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "UUID");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v60 = v52;
          v61 = 2112;
          v62 = v40;
          v63 = 2112;
          v64 = v54;
          _os_log_impl(&dword_1CCE01000, v51, OS_LOG_TYPE_INFO, "%{public}@Read Service Instance ID value: %@ for Service-UUID: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v50);

      }
      v55 = a1[4];
      objc_msgSend(a1[6], "service");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "_handleHAPServiceDiscoveryCompletionForService:withInstanceId:", v56, v40);

    }
    else
    {
      v41 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = v43;
        v61 = 2080;
        v62 = "-[_HAPAccessoryServerBTLE100 peripheral:didUpdateValueForCharacteristic:error:]_block_invoke";
        _os_log_impl(&dword_1CCE01000, v42, OS_LOG_TYPE_INFO, "%{public}@%s: Received HAP characteristic data", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v41);
      objc_msgSend(a1[4], "_handleUpdatedValueForBTLECharacteristic:error:", a1[6], v10);
    }
  }
LABEL_15:

}

void __75___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForDescriptor_error___block_invoke(id *a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  char v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = (void *)MEMORY[0x1D17B7244](objc_msgSend(a1[5], "setMetadataValueReadCount:", objc_msgSend(a1[5], "metadataValueReadCount") - 1));
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[6];
    v8 = a1[4];
    *(_DWORD *)buf = 138544130;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] didUpdateValueForDescriptor: %@ error: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v3);
  v9 = a1[5];
  v10 = a1[6];
  objc_msgSend(v10, "characteristic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "characteristic");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "_parseBTLECharacteristicDescriptor:existingDescriptors:characteristics:", v10, v12, v13);

  if ((v14 & 1) == 0)
  {
    HMErrorFromOSStatus(4294960562);
    v15 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v15;
  }
  objc_msgSend(a1[5], "_updateConnectionLifetimeTimer");
  if (objc_msgSend(a1[5], "metadataValueReadCount"))
    v16 = v14;
  else
    v16 = 0;
  if ((v16 & 1) == 0)
  {
    objc_msgSend(a1[5], "_handlePairingStateMachine");
    if (objc_msgSend(a1[5], "_delegateRespondsToSelector:", sel_accessoryServer_didDiscoverAccessories_transaction_error_))
    {
      objc_msgSend(a1[5], "delegateQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __75___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForDescriptor_error___block_invoke_287;
      v18[3] = &unk_1E894E0F8;
      v18[4] = a1[5];
      v19 = v2;
      dispatch_async(v17, v18);

    }
  }

}

void __75___HAPAccessoryServerBTLE100_peripheral_didUpdateValueForDescriptor_error___block_invoke_287(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v5, "accessoryServer:didDiscoverAccessories:transaction:error:", v2, v4, 0, *(_QWORD *)(a1 + 40));

}

uint64_t __87___HAPAccessoryServerBTLE100_peripheral_didDiscoverDescriptorsForCharacteristic_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138544130;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] didDiscoverDescriptorsForCharacteristic: %@, error: %@", (uint8_t *)&v9, 0x2Au);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "_updateConnectionLifetimeTimer");
  objc_msgSend(*(id *)(a1 + 32), "setMetadataDiscoveryRequestCount:", objc_msgSend(*(id *)(a1 + 32), "metadataDiscoveryRequestCount") - 1);
  result = objc_msgSend(*(id *)(a1 + 32), "metadataDiscoveryRequestCount");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_handlePairingStateMachine");
  return result;
}

void __84___HAPAccessoryServerBTLE100_peripheral_didDiscoverCharacteristicsForService_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  const char *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v26 = 138544130;
    v27 = v4;
    v28 = 2112;
    v29 = v5;
    v30 = 2112;
    v31 = v6;
    v32 = 2112;
    v33 = v7;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] didDiscoverCharacteristicsForService:%@ error %@", (uint8_t *)&v26, 0x2Au);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "_updateConnectionLifetimeTimer");
  v8 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "pairingService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

  if (!(_DWORD)v8)
  {
    v18 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "accessoryInfoService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqual:", v19))
    {
      v20 = objc_msgSend(*(id *)(a1 + 32), "state");

      if (v20 == 6)
      {
        v21 = *(_QWORD *)(a1 + 48);
        v11 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        v13 = v22;
        if (v21)
        {
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            goto LABEL_8;
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543618;
          v27 = v14;
          v28 = 2112;
          v29 = v15;
          v16 = "%{public}@[BTLE Accessory Server %@] accessory info service matched with error, disconnecting";
          goto LABEL_7;
        }
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          goto LABEL_21;
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v23;
        v28 = 2112;
        v29 = v24;
        v25 = "%{public}@[BTLE Accessory Server %@] accessory service match, running state machine";
        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "_handleHAPCharacteristicDiscoveryForService:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    return;
  }
  v10 = *(_QWORD *)(a1 + 48);
  v11 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      objc_autoreleasePoolPop(v11);
      objc_msgSend(*(id *)(a1 + 32), "browser");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "disconnectFromBTLEAccessoryServer:", *(_QWORD *)(a1 + 32));

      return;
    }
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    v16 = "%{public}@[BTLE Accessory Server %@] pairing service matched with error, disconnecting";
LABEL_7:
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v26, 0x16u);

    goto LABEL_8;
  }
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    goto LABEL_21;
  HMFGetLogIdentifier();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 138543618;
  v27 = v23;
  v28 = 2112;
  v29 = v24;
  v25 = "%{public}@[BTLE Accessory Server %@] pairing service match, running state machine";
LABEL_20:
  _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, v25, (uint8_t *)&v26, 0x16u);

LABEL_21:
  objc_autoreleasePoolPop(v11);
  objc_msgSend(*(id *)(a1 + 32), "_handlePairingStateMachine");
}

uint64_t __59___HAPAccessoryServerBTLE100_peripheral_didModifyServices___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t result;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v4;
    v31 = 2112;
    v32 = (id)objc_opt_class();
    v33 = 2080;
    v34 = "-[_HAPAccessoryServerBTLE100 peripheral:didModifyServices:]_block_invoke";
    v5 = v32;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%{public}@%@ %s", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v25;
    *(_QWORD *)&v8 = 138543618;
    v23 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        objc_msgSend(*(id *)(a1 + 32), "btleServiceToHAPServiceMap", v23, (_QWORD)v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeObjectForKey:", v12);

        v14 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v23;
          v30 = v16;
          v31 = 2112;
          v32 = v12;
          _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Removed BTLE service: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

  result = objc_msgSend(*(id *)(a1 + 40), "count");
  if (result)
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(const char **)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] Disconnecting on services changed: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionLifetimeTimeout");
  }
  return result;
}

void __61___HAPAccessoryServerBTLE100_peripheral_didDiscoverServices___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  char *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  int v11;
  void *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v4;
    v13 = 2112;
    v14 = (char *)objc_opt_class();
    v15 = 2080;
    v16 = "-[_HAPAccessoryServerBTLE100 peripheral:didDiscoverServices:]_block_invoke";
    v5 = v14;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%{public}@%@ %s", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v6 = objc_msgSend(*(id *)(a1 + 32), "_updateConnectionLifetimeTimer");
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = (void *)MEMORY[0x1D17B7244](v6);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(const char **)(a1 + 40);
      v11 = 138543874;
      v12 = v9;
      v13 = 2080;
      v14 = "-[_HAPAccessoryServerBTLE100 peripheral:didDiscoverServices:]_block_invoke";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@%s: Unable to discover services with error: %@", (uint8_t *)&v11, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_handlePairingStateMachine");
  }
}

void __83___HAPAccessoryServerBTLE100__notifyDelegateOfSentPlaintextData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBTLE:willSendPlaintextPayload:forCharacteristic:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __96___HAPAccessoryServerBTLE100__notifyDelegateOfSentEncryptedAuthenticatedData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBTLE:willSendEncryptedAndAuthenticatedPayload:forCharacteristic:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __87___HAPAccessoryServerBTLE100__notifyDelegateOfReceivedPlaintextData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBTLE:didReceivePlaintextPayload:forCharacteristic:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __100___HAPAccessoryServerBTLE100__notifyDelegateOfReceivedEncryptedAuthenticatedData_forCharacteristic___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServerBTLE:didReceiveEncryptedAndAuthenticatedPayload:forCharacteristic:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __92___HAPAccessoryServerBTLE100__handleHAPServiceDiscoveryCompletionForService_withInstanceId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v5, "accessoryServer:didDiscoverAccessories:transaction:error:", v2, v4, 0, *(_QWORD *)(a1 + 40));

}

void __57___HAPAccessoryServerBTLE100__handleReadDescriptorValues__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v5, "accessoryServer:didDiscoverAccessories:transaction:error:", v2, v4, 0, 0);

}

void __51___HAPAccessoryServerBTLE100__getAttributeDatabase__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v5, "accessoryServer:didDiscoverAccessories:transaction:error:", v2, v4, 0, 0);

}

void __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Requested accessory discovery", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 32), "isSecuritySessionOpen"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_getAttributeDatabase");
  }
  else
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke_177;
    v6[3] = &unk_1E894DDF8;
    objc_copyWeak(&v7, (id *)buf);
    objc_msgSend(*(id *)(a1 + 32), "setPairVerifyCompletionBlock:", v6);
    objc_msgSend(*(id *)(a1 + 32), "setMetric_pairVerifyReason:", CFSTR("noSession.discovering"));
    objc_msgSend(*(id *)(a1 + 32), "_establishSecureSession");
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

void __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke_177(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v3;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%{public}@[BTLE Accessory Server %@] Failed to complete pair-verify - error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    if (v5
      && objc_msgSend(v5, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
    {
      objc_msgSend(v5, "delegateQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke_178;
      v11[3] = &unk_1E894E0F8;
      v11[4] = v5;
      v12 = v3;
      dispatch_async(v10, v11);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "_getAttributeDatabase");
  }

}

void __49___HAPAccessoryServerBTLE100_discoverAccessories__block_invoke_178(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __64___HAPAccessoryServerBTLE100_securitySession_didCloseWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "securitySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Security session did close with error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "setSecuritySessionOpening:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setSecuritySessionOpen:", 0);
    v9 = objc_msgSend(*(id *)(a1 + 40), "shouldRetryPVDueToAuthenticationError:", *(_QWORD *)(a1 + 48));
    v10 = *(void **)(a1 + 40);
    if (v9)
    {
      objc_msgSend(v10, "clientQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64___HAPAccessoryServerBTLE100_securitySession_didCloseWithError___block_invoke_176;
      block[3] = &unk_1E894DD08;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(v11, block);

    }
    else
    {
      objc_msgSend(v10, "browser");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "disconnectFromBTLEAccessoryServer:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 40), "pairVerifyCompletionBlock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 40), "pairVerifyCompletionBlock");
        v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v14[2](v14, 0);

        objc_msgSend(*(id *)(a1 + 40), "setPairVerifyCompletionBlock:", 0);
      }
    }
  }
}

uint64_t __64___HAPAccessoryServerBTLE100_securitySession_didCloseWithError___block_invoke_176(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setState:", 8);
  return objc_msgSend(*(id *)(a1 + 32), "_reallyEstablishSecureSession");
}

void __53___HAPAccessoryServerBTLE100_securitySessionDidOpen___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "securitySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Security session is open", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "associateAccessoryWithControllerKeyUsingAccessoryIdentifier:", v9);

    objc_msgSend(*(id *)(a1 + 40), "setSecuritySessionOpening:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setSecuritySessionOpen:", 1);
    objc_msgSend(*(id *)(a1 + 40), "pairVerifyCompletionBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "pairVerifyCompletionBlock");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0);

      objc_msgSend(*(id *)(a1 + 40), "setPairVerifyCompletionBlock:", 0);
    }
  }
}

void __55___HAPAccessoryServerBTLE100_securitySessionIsOpening___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "securitySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Security session is opening", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "setSecuritySessionOpening:", 1);
  }
}

void __74___HAPAccessoryServerBTLE100_securitySession_didReceiveSetupExchangeData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "securitySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Request to send security session setup exchange", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "pairVerifyCharacteristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(void **)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v9, "_pairVerifyHAPCharacteristic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_notifyDelegateOfSentPlaintextData:forCharacteristic:", v10, v11);

      objc_msgSend(*(id *)(a1 + 40), "_updateConnectionLifetimeTimer");
      objc_msgSend(*(id *)(a1 + 40), "peripheral");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "writeValue:forCharacteristic:type:", *(_QWORD *)(a1 + 48), v8, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), -6723, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "receivedSetupExchangeData:error:", 0, v12);
    }

  }
}

void __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke_2;
    v8 = &unk_1E894E0F8;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = v3;
    dispatch_async(v4, &v5);

    objc_msgSend(*(id *)(a1 + 32), "_updateConnectionLifetimeTimer", v5, v6, v7, v8, v9);
  }

}

void __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke_164(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __77___HAPAccessoryServerBTLE100__handleUpdatedValueForBTLECharacteristic_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", v3, v4, 0, 0);

}

uint64_t __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke_163(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __92___HAPAccessoryServerBTLE100__readValueForCharacteristic_completionQueue_completionHandler___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(v5, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serverIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "instanceID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544386;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Read response for characteristic %@/%@ with error: %@", (uint8_t *)&v17, 0x34u);

    }
    objc_autoreleasePoolPop(v9);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v5, "instanceID");

    objc_msgSend(v6, "domain");
    objc_msgSend(v6, "code");

  }
  else
  {
    objc_msgSend(v5, "instanceID");

  }
  +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v5, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v16);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke_157(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Completed multiple read requests", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(NSObject **)(a1 + 40);
  if (v7)
  {
    v8 = *(void **)(a1 + 56);
    if (v8)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke_158;
      v9[3] = &unk_1E894D5E0;
      v11 = v8;
      v10 = *(id *)(a1 + 48);
      dispatch_async(v7, v9);

    }
  }
}

uint64_t __90___HAPAccessoryServerBTLE100__readCharacteristicValues_completionQueue_completionHandler___block_invoke_158(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __81___HAPAccessoryServerBTLE100_readValueForCharacteristic_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81___HAPAccessoryServerBTLE100_readValueForCharacteristic_queue_completionHandler___block_invoke_2;
  v5[3] = &unk_1E894D680;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_readValueForCharacteristic:completionQueue:completionHandler:", v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __81___HAPAccessoryServerBTLE100_readValueForCharacteristic_queue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544386;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v5;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server '%@' '%@'] Read value '%@' for characteristic %@", (uint8_t *)&v15, 0x34u);

  }
  objc_autoreleasePoolPop(v8);
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);

}

void __97___HAPAccessoryServerBTLE100_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(double *)(a1 + 64) > 0.0)
  {
    v2 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544130;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      v20 = 2048;
      v21 = v7;
      _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Request timeouts are not supported, request may not timeout within %f seconds", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v2);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __97___HAPAccessoryServerBTLE100_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_147;
  v11[3] = &unk_1E894D658;
  objc_copyWeak(&v13, (id *)buf);
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v8, "_readCharacteristicValues:completionQueue:completionHandler:", v9, v10, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __97___HAPAccessoryServerBTLE100_readCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke_147(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  id WeakRetained;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v22 = a1;
  v23 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    v24 = *(_QWORD *)v28;
    v25 = v6;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "error", v22);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v13 = (void *)MEMORY[0x1D17B7244]();
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "characteristic");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "value");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "characteristic");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v32 = v15;
            v33 = 2112;
            v34 = v16;
            v35 = 2112;
            v36 = v17;
            v37 = 2112;
            v38 = v19;
            v39 = 2112;
            v40 = v20;
            _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server '%@' '%@'] Read value '%@' for characteristic %@", buf, 0x34u);

            v6 = v25;
            v9 = v24;

          }
          objc_autoreleasePoolPop(v13);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
    }
    while (v8);
  }

  v21 = *(_QWORD *)(v22 + 32);
  if (v21)
    (*(void (**)(uint64_t, id, id))(v21 + 16))(v21, v6, v23);

}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_137(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v9;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@### Failed to write characteristic with error %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v5, "instanceID");

    objc_msgSend(v6, "domain");
    objc_msgSend(v6, "code");

  }
  else
  {
    objc_msgSend(v5, "setValue:", *(_QWORD *)(a1 + 32));
    if ((objc_msgSend(*(id *)(a1 + 40), "properties") & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "browser");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "markNotifyingCharacteristicUpdatedForIdentifier:", v12);

    }
    objc_msgSend(v5, "instanceID");

  }
  v13 = *(void **)(a1 + 72);
  if (v13)
  {
    v14 = *(NSObject **)(a1 + 64);
    if (v14)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_145;
      block[3] = &unk_1E894D9E8;
      v18 = v13;
      v16 = v5;
      v17 = v6;
      dispatch_async(v14, block);

    }
  }

}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_146(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __106___HAPAccessoryServerBTLE100__writeValue_forCharacteristic_authorizationData_withCompletionHandler_queue___block_invoke_145(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(v5, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "serverIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "instanceID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544386;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v14;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Write response for characteristic %@/%@ with error: %@", (uint8_t *)&v16, 0x34u);

    }
    objc_autoreleasePoolPop(v9);

  }
  +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v5, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke_131(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = v4;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Completed multiple write requests", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 56);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke_132;
    v9[3] = &unk_1E894D5E0;
    v11 = v7;
    v10 = *(id *)(a1 + 48);
    dispatch_async(v8, v9);

  }
}

uint64_t __81___HAPAccessoryServerBTLE100__writeCharacteristicValues_queue_completionHandler___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __98___HAPAccessoryServerBTLE100_writeCharacteristicValues_timeout_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*(double *)(a1 + 64) > 0.0)
  {
    v1 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138544130;
      v27 = v3;
      v28 = 2112;
      v29 = v4;
      v30 = 2112;
      v31 = v5;
      v32 = 2048;
      v33 = v6;
      _os_log_impl(&dword_1CCE01000, v2, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Request timeouts are not supported, request may not timeout within %f seconds", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v1);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 40);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1D17B7244]();
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "characteristic");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v27 = v14;
          v28 = 2112;
          v29 = v15;
          v30 = 2112;
          v31 = v16;
          v32 = 2112;
          v33 = v17;
          _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory Server %@] Writing value '%@' to characteristic '%@'", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_writeCharacteristicValues:queue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 18);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), v3);

}

void __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_123(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 54);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v2, "accessoryServer:didDiscoverAccessories:transaction:error:", v3, v5, 0, v6);

}

void __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_124(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __65___HAPAccessoryServerBTLE100__handleDisconnectionWithCompletion___block_invoke_125(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

uint64_t __77___HAPAccessoryServerBTLE100_handleDisconnectionWithError_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDisconnectionWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __71___HAPAccessoryServerBTLE100_handleConnectionWithPeripheral_withError___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "updatePeripheral:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "peripheral");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "_handleConnectionWithError:", *(_QWORD *)(a1 + 48));
}

void __87___HAPAccessoryServerBTLE100__handleHAPNotificationStateUpdateForCharacteristic_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_117(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%{public}@### Failed to enable events on characteristic with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_msgSend(v5, "setEventNotificationsEnabled:", *(unsigned __int8 *)(a1 + 48));
  }
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(a1 + 32);
    if (v11)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_120;
      block[3] = &unk_1E894D9E8;
      v15 = v10;
      v13 = v5;
      v14 = v6;
      dispatch_async(v11, block);

    }
  }

}

uint64_t __89___HAPAccessoryServerBTLE100__enableEvent_forCharacteristic_withCompletionHandler_queue___block_invoke_120(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[HAPCharacteristicResponseTuple responseTupleForCharacteristic:error:](HAPCharacteristicResponseTuple, "responseTupleForCharacteristic:error:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v5, "service");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1D17B7244]();
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "serverIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "instanceID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "type");
        v16 = v10;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v18 = v12;
        v19 = 2112;
        v20 = v13;
        v21 = 2112;
        v22 = v14;
        v23 = 2112;
        v24 = v15;
        v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@[BTLE Accessory Server %@] Enable event response for characteristic %@/%@ with error: %@", buf, 0x34u);

        v10 = v16;
      }

      objc_autoreleasePoolPop(v10);
    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_101(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v4;
    v20 = 2112;
    v21 = v5;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Completed multiple enable event requests", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 64);
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v9 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_102;
    block[3] = &unk_1E894D5E0;
    v17 = v7;
    v16 = *(id *)(a1 + 48);
    dispatch_async(v9, block);

  }
  if (*(_BYTE *)(a1 + 72))
  {
    v10 = *(void **)(a1 + 56);
    v12 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2;
    v13[3] = &unk_1E894D568;
    v13[4] = v12;
    v14 = v10;
    objc_msgSend(v12, "_readCharacteristicValues:completionQueue:completionHandler:", v14, v11, v13);

  }
}

uint64_t __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __91___HAPAccessoryServerBTLE100__enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B7244]();
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v9;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    v33 = 2048;
    v34 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@[BTLE Accessory %@ %@] Read values for %lu events enabled characteristics", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v18, "error", (_QWORD)v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          objc_msgSend(v18, "characteristic");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v20);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v12, "count")
    && objc_msgSend(*(id *)(a1 + 32), "_delegateRespondsToSelector:", sel_accessoryServer_didUpdateValuesForCharacteristics_stateNumber_broadcast_))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

  }
}

uint64_t __90___HAPAccessoryServerBTLE100_enableEvents_forCharacteristics_withCompletionHandler_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enableEvents:forCharacteristics:withCompletionHandler:queue:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __51___HAPAccessoryServerBTLE100_stopPairingWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setStartPairingRequested:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setDisconnecting:", 1);
  objc_msgSend(*(id *)(a1 + 32), "browser");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disconnectFromBTLEAccessoryServer:", *(_QWORD *)(a1 + 32));

}

void __58___HAPAccessoryServerBTLE100_continueAuthAfterValidation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __84___HAPAccessoryServerBTLE100_tryPairingPassword_onboardingSetupPayloadString_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairSetupTryPassword:", *(_QWORD *)(a1 + 40));
}

void __49___HAPAccessoryServerBTLE100__checkForAuthPrompt__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:requestUserPermission:accessoryInfo:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40), 0);

}

void __49___HAPAccessoryServerBTLE100__checkForAuthPrompt__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 18);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), v3);

}

void __60___HAPAccessoryServerBTLE100_continuePairingAfterAuthPrompt__block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "unpairedIdentifyRequested");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    if (objc_msgSend(v3, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60___HAPAccessoryServerBTLE100_continuePairingAfterAuthPrompt__block_invoke_2;
      block[3] = &unk_1E894DD08;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v4, block);

    }
  }
  else
  {
    objc_msgSend(v3, "_handlePairingStateMachine");
  }
}

void __60___HAPAccessoryServerBTLE100_continuePairingAfterAuthPrompt__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 14);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), v3);

}

void __54___HAPAccessoryServerBTLE100_startPairingWithRequest___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setPairingActivity:", 0);
  v2 = objc_msgSend(*(id *)(a1 + 32), "unpairedIdentifyRequested");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    if (objc_msgSend(v3, "_delegateRespondsToSelector:", sel_accessoryServer_didStopPairingWithError_))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __54___HAPAccessoryServerBTLE100_startPairingWithRequest___block_invoke_2;
      block[3] = &unk_1E894DD08;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v4, block);

    }
  }
  else
  {
    objc_msgSend(v3, "setStartPairingRequested:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setPairingRequest:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_handlePairingStateMachine");
  }
}

void __54___HAPAccessoryServerBTLE100_startPairingWithRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 14);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryServer:didStopPairingWithError:", *(_QWORD *)(a1 + 32), v3);

}

void __83___HAPAccessoryServerBTLE100_configureCharacteristics_queue_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Broadcast Key configuration failed"), CFSTR("Not supported for 1.0 accessories"), 0, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __79___HAPAccessoryServerBTLE100_generateBroadcastKey_queue_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Broadcast Key configuration failed"), CFSTR("Not supported for 1.0 accessories"), 0, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);

  }
}

void __41___HAPAccessoryServerBTLE100_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  objc_super v10;

  v2 = *(void **)(a1 + 32);
  v10.receiver = *(id *)(a1 + 40);
  v10.super_class = (Class)_HAPAccessoryServerBTLE100;
  objc_msgSendSuper2(&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@\n"), v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "peripheral");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("Peripheral: %@\n"), v5);

  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(*(id *)(a1 + 40), "state");
  if ((unint64_t)(v7 - 1) > 0xB)
    v8 = CFSTR("Unknown State");
  else
    v8 = off_1E894DE40[v7 - 1];
  v9 = v8;
  objc_msgSend(v6, "appendFormat:", CFSTR("State: %@\n"), v9);

}

@end
