@implementation BCPowerSourceController

void __59___BCPowerSourceController_addBatteryDeviceObserver_queue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "connectedDevices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectedDevicesDidChange:", v3);

  }
}

void __72___BCPowerSourceController__shouldCoalesceDevices_minimumPercentCharge___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  id v24;

  v7 = a2;
  v24 = v7;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "vendor");
    if (v9 == objc_msgSend(v24, "vendor"))
    {
      v10 = objc_msgSend(v8, "productIdentifier");
      if (v10 == objc_msgSend(v24, "productIdentifier"))
      {
        objc_msgSend(v8, "matchIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "matchIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (v13)
        {
          v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v15 = objc_msgSend(v8, "percentCharge");
          v16 = objc_msgSend(v24, "percentCharge");
          if (v14 >= v15)
            v17 = v15;
          else
            v17 = v14;
          if (v17 >= v16)
            v17 = v16;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v17;
          v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          v19 = objc_msgSend(v8, "percentCharge");
          v20 = objc_msgSend(v24, "percentCharge");
          if (v18 <= v19)
            v21 = v19;
          else
            v21 = v18;
          if (v21 <= v20)
            v21 = v20;
          if (v21 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > 9)
          {
            v23 = 0;
          }
          else
          {
            v22 = objc_msgSend(v8, "isCharging");
            v23 = v22 ^ objc_msgSend(v24, "isCharging") ^ 1;
          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v23;
        }
      }
    }
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) ^ 1;

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "percentCharge");
  }

}

uint64_t __81___BCPowerSourceController__orderedDevicesFromPowerSourcesBlob_powerSourcesList___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isDevicePartOfPair:", v3);
  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "matchIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);
    }
    objc_msgSend(v6, "addObject:", v3);

  }
  return v4;
}

uint64_t __81___BCPowerSourceController__orderedDevicesFromPowerSourcesBlob_powerSourcesList___block_invoke_129(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v25;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = objc_msgSend(v6, "isInternal");
  if (v8 == objc_msgSend(v7, "isInternal"))
  {
    v10 = objc_msgSend(v6, "vendor");
    if ((v10 == 1) != (objc_msgSend(v7, "vendor") != 1))
    {
      v11 = objc_msgSend(v6, "accessoryCategory");
      v12 = objc_msgSend(v7, "accessoryCategory");
      v13 = 0;
      v14 = -1;
      v15 = -1;
      do
      {
        v16 = orderedDeviceAccessoryCategories[v13];
        if (v16 == v11)
          v15 = v13;
        if (v16 == v12)
          v14 = v13;
        ++v13;
      }
      while (v13 != 8);
      v17 = v15 >= v14;
      v18 = v15 > v14;
      if (v17)
        v9 = v18;
      else
        v9 = -1;
      if (!v9)
      {
        v19 = objc_msgSend(v6, "transportType");
        if (v19 == objc_msgSend(v7, "transportType")
          && (v20 = objc_msgSend(v6, "productIdentifier"), v20 == objc_msgSend(v7, "productIdentifier"))
          && (v21 = objc_msgSend(v6, "parts"), v21 != objc_msgSend(v7, "parts")))
        {
          v25 = objc_msgSend(v6, "parts");
          if (v25 < objc_msgSend(v7, "parts"))
            v9 = -1;
          else
            v9 = 1;
        }
        else
        {
          objc_msgSend(v6, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v22, "compare:", v23);

        }
      }
    }
    else if (v10 == 1)
    {
      v9 = -1;
    }
    else
    {
      v9 = 1;
    }
  }
  else if (v8)
  {
    v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __73___BCPowerSourceController__registerForNotification_token_queue_handler___block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[6];
    v8 = 138543618;
    v9 = v5;
    v10 = 2082;
    v11 = v6;
    _os_log_impl(&dword_2115B2000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Received %{public}s notification", (uint8_t *)&v8, 0x16u);
  }
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __82___BCPowerSourceController__registerForPowerSourceChangeNotification_token_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queryConnectedDevices");
}

uint64_t __65___BCPowerSourceController__beginPowerSourceObservingIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLowPowerModeChanged:", a2);
}

uint64_t __52___BCPowerSourceController__endPowerSourceObserving__block_invoke(uint64_t a1, int *a2)
{
  uint64_t result;

  result = notify_is_valid_token(*a2);
  if ((_DWORD)result)
    result = notify_cancel(*a2);
  *a2 = 0;
  return result;
}

void __50___BCPowerSourceController__queryConnectedDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "connectedDevicesDidChange:", *(_QWORD *)(a1 + 32));

}

uint64_t __56___BCPowerSourceController__notifyObserver_block_queue___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)BCLogPowerSourceController;
  if (os_log_type_enabled((os_log_t)BCLogPowerSourceController, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = v2;
    v7 = (void *)objc_opt_class();
    v8 = a1[5];
    v11 = 138543874;
    v12 = v5;
    v13 = 2114;
    v14 = v7;
    v15 = 2048;
    v16 = v8;
    v9 = v7;
    _os_log_impl(&dword_2115B2000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Notifying observer: <%{public}@: %p>", (uint8_t *)&v11, 0x20u);

  }
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a1[5], v3, v4);
}

@end
