@implementation DKBluetoothMonitor

uint64_t __28___DKBluetoothMonitor_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCurrentBatteryLevels");
}

void __28___DKBluetoothMonitor_start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = (void *)os_transaction_create();
  objc_msgSend(v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = dispatch_time(0, 1000000000);
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __28___DKBluetoothMonitor_start__block_invoke_3;
  v9[3] = &unk_24DA66D60;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v8 = v5;
  dispatch_after(v6, v7, v9);

}

void __28___DKBluetoothMonitor_start__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "lock");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  objc_msgSend(*(id *)(a1 + 40), "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "unlock");
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "isAppleAudioDevice"))
    {
      objc_msgSend(*(id *)(a1 + 32), "updateCurrentBatteryLevels");
      objc_msgSend(*(id *)(a1 + 32), "batteryLevels");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 208);
      v7 = dispatch_walltime(0, 300000000000);
      dispatch_source_set_timer(v6, v7, 0x45D964B800uLL, 0x64uLL);
    }
    else
    {
      v5 = 0;
    }
    v8 = objc_msgSend(*(id *)(a1 + 32), "_inEarStatusForDevice:", *(_QWORD *)(a1 + 40));
    v9 = objc_msgSend(*(id *)(a1 + 40), "connected");
    objc_msgSend(*(id *)(a1 + 40), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(a1 + 40), "type");
    v13 = objc_msgSend(*(id *)(a1 + 40), "isAppleAudioDevice");
    v43 = (void *)v5;
    LODWORD(v40) = objc_msgSend(*(id *)(a1 + 40), "productId");
    v42 = v8;
    +[_DKBluetoothMonitor _eventWithState:name:address:type:isAppleAudioDevice:isUserWearing:productID:accessoryBatteryLevels:](_DKBluetoothMonitor, "_eventWithState:name:address:type:isAppleAudioDevice:isUserWearing:productID:accessoryBatteryLevels:", v9, v10, v11, v12, v13, v8, v40, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
    objc_msgSend(*(id *)(a1 + 40), "address");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "historicalHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v14, "startDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setEndDate:", v19);

        objc_msgSend(*(id *)(a1 + 32), "historicalHandler");
        v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v44[0] = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v20)[2](v20, v21);

        v22 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
        objc_msgSend(*(id *)(a1 + 40), "address");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "removeObjectForKey:", v23);

      }
    }
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
    objc_msgSend(*(id *)(a1 + 40), "address");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKey:", v14, v25);

    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "vendorId"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "address");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v27, v28);

    v29 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "vendorId"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_BMEventFromDKEvent:starting:vendorID:", v14, 1, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "sendEvent:", v31);
    objc_msgSend(*(id *)(a1 + 32), "saveState");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "unlock");
    v32 = objc_msgSend(*(id *)(a1 + 40), "connected");
    objc_msgSend(*(id *)(a1 + 40), "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "address");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(*(id *)(a1 + 40), "type");
    v36 = objc_msgSend(*(id *)(a1 + 40), "isAppleAudioDevice");
    LODWORD(v41) = objc_msgSend(*(id *)(a1 + 40), "productId");
    +[_DKBluetoothMonitor contextValueForBluetoothConnectionStatus:name:address:deviceType:isAppleAudioDevice:isUserWearing:productID:](_DKBluetoothMonitor, "contextValueForBluetoothConnectionStatus:name:address:deviceType:isAppleAudioDevice:isUserWearing:productID:", v32, v33, v34, v35, v36, v42, v41);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBluetoothDataDictionary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, v39);

  }
}

void __28___DKBluetoothMonitor_start__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD);
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v47 = (void *)os_transaction_create();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateCurrentBatteryLevels");
  objc_msgSend(*(id *)(a1 + 32), "batteryLevels");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "_inEarStatusForDevice:", v5);
  v8 = objc_msgSend(v5, "connected");
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "type");
  v12 = objc_msgSend(v5, "isAppleAudioDevice");
  v45 = (void *)v6;
  LODWORD(v43) = objc_msgSend(v5, "productId");
  +[_DKBluetoothMonitor _eventWithState:name:address:type:isAppleAudioDevice:isUserWearing:productID:accessoryBatteryLevels:](_DKBluetoothMonitor, "_eventWithState:name:address:type:isAppleAudioDevice:isUserWearing:productID:accessoryBatteryLevels:", v8, v9, v10, v11, v12, v7, v43, v6);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "lock");
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  objc_msgSend(v5, "address");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "metadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "isUserWearing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKey:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v48 = v15;
  if (!v18)
  {

    goto LABEL_8;
  }
  v19 = (void *)v18;
  objc_msgSend(v15, "metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B040], "isUserWearing");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForKey:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "isEqual:", v23);

  if (v24)
  {
LABEL_8:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "unlock");
    v25 = v44;
    goto LABEL_9;
  }
  v25 = v44;
  if (v48)
  {
    objc_msgSend(*(id *)(a1 + 32), "historicalHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v44, "startDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setEndDate:", v27);

      v28 = (void *)objc_opt_class();
      v29 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
      objc_msgSend(v5, "address");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "_BMEventFromDKEvent:starting:vendorID:", v48, 0, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "sendEvent:", v32);
      objc_msgSend(*(id *)(a1 + 32), "historicalHandler");
      v33 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v49[0] = v48;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v33)[2](v33, v34);

    }
  }
  v35 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  objc_msgSend(v5, "address");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKey:", v44, v36);

  v37 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v5, "vendorId"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "address");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setObject:forKey:", v38, v39);

  v40 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v5, "vendorId"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_BMEventFromDKEvent:starting:vendorID:", v44, 1, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "sendEvent:", v42);
  objc_msgSend(*(id *)(a1 + 32), "saveState");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "unlock");

LABEL_9:
}

void __28___DKBluetoothMonitor_start__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD);
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)os_transaction_create();
  objc_msgSend(v3, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "lock");
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  objc_msgSend(v5, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(id **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(v9[28], "unlock");
  }
  else
  {
    v43 = v4;
    objc_msgSend(v9, "batteryLevels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "type");
    v14 = objc_msgSend(v5, "isAppleAudioDevice");
    LODWORD(v41) = objc_msgSend(v5, "productId");
    +[_DKBluetoothMonitor _eventWithState:name:address:type:isAppleAudioDevice:isUserWearing:productID:accessoryBatteryLevels:](_DKBluetoothMonitor, "_eventWithState:name:address:type:isAppleAudioDevice:isUserWearing:productID:accessoryBatteryLevels:", 0, v11, v12, v13, v14, 0, v41, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
    objc_msgSend(v5, "address");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 32), "historicalHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v15, "startDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setEndDate:", v20);

        v21 = (void *)objc_opt_class();
        v22 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
        objc_msgSend(v5, "address");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "_BMEventFromDKEvent:starting:vendorID:", v18, 0, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "sendEvent:", v25);
        objc_msgSend(*(id *)(a1 + 32), "historicalHandler");
        v26 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v44[0] = v18;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v26)[2](v26, v27);

        v28 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
        objc_msgSend(v5, "address");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "removeObjectForKey:", v29);

        v30 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
        objc_msgSend(v5, "address");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeObjectForKey:", v31);

      }
    }
    v32 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
    objc_msgSend(v5, "address");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKey:", v15, v33);

    if (objc_msgSend(v5, "isAppleAudioDevice")
      && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "count"))
    {
      dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 208), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_msgSend(*(id *)(a1 + 32), "setBatteryLevels:", MEMORY[0x24BDBD1B8]);
    }
    objc_msgSend(*(id *)(a1 + 32), "saveState");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "unlock");
    objc_msgSend(v5, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v5, "type");
    v37 = objc_msgSend(v5, "isAppleAudioDevice");
    LODWORD(v42) = objc_msgSend(v5, "productId");
    +[_DKBluetoothMonitor contextValueForBluetoothConnectionStatus:name:address:deviceType:isAppleAudioDevice:isUserWearing:productID:](_DKBluetoothMonitor, "contextValueForBluetoothConnectionStatus:name:address:deviceType:isAppleAudioDevice:isUserWearing:productID:", 0, v34, v35, v36, v37, 0, v42);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBluetoothDataDictionary");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, v40);

    v4 = v43;
  }

}

void __26___DKBluetoothMonitor_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreduet.monitors", "_DKBluetoothMonitor");
  v1 = (void *)log_log_2;
  log_log_2 = (uint64_t)v0;

}

void __32___DKBluetoothMonitor_saveState__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  NSObject *v16;
  id v17;

  objc_msgSend(MEMORY[0x24BE1AFD0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v17;
  if (v5)
  {
    +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __32___DKBluetoothMonitor_saveState__block_invoke_cold_2((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  v13 = a1 + 32;
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setData:forKey:", v4, v15);

  +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __32___DKBluetoothMonitor_saveState__block_invoke_cold_1(v13, v16);

}

void __32___DKBluetoothMonitor_loadState__block_invoke(uint64_t a1)
{
  objc_class *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *context;
  void *v63;
  void *v64;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  uint64_t v82;
  __int16 v83;
  void *v84;
  _BYTE v85[128];
  _QWORD v86[2];
  _QWORD v87[5];

  v87[2] = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x219A29278]();
  objc_msgSend(MEMORY[0x24BE1AFD0], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "dataForKey:", v2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "classesForSecureStateDecoding");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setByAddingObjectsFromSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v11, v64, &v78);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v78;
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v12;

    if (v13)
    {
      +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __32___DKBluetoothMonitor_loadState__block_invoke_cold_1((uint64_t)v13, v16, v17, v18, v19, v20, v21, v22);

    }
  }
  v23 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(v23 + 8) + 40))
  {
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(v23 + 8) + 40), "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v75 != v26)
            objc_enumerationMutation(v24);
          v28 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
          +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v82 = v28;
            v83 = 2112;
            v84 = v30;
            _os_log_impl(&dword_219056000, v29, OS_LOG_TYPE_INFO, "savedState key: %@ value: %@", buf, 0x16u);

          }
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v74, v85, 16);
      }
      while (v25);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("_DKBluetoothMonitor-activeConnections"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("_DKBluetoothMonitor-activeConnections"));
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *(_QWORD *)(a1 + 32);
      v34 = *(void **)(v33 + 168);
      *(_QWORD *)(v33 + 168) = v32;

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "allKeys");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      if (v36)
      {
        v37 = *(_QWORD *)v71;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v71 != v37)
              objc_enumerationMutation(v35);
            v39 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * j);
            +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKeyedSubscript:", v39);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v82 = v39;
              v83 = 2112;
              v84 = v41;
              _os_log_impl(&dword_219056000, v40, OS_LOG_TYPE_INFO, "load key: %@ value: %@", buf, 0x16u);

            }
          }
          v36 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
        }
        while (v36);
      }
    }
    else
    {
      +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219056000, v35, OS_LOG_TYPE_INFO, "No active connections to load", buf, 2u);
      }
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("_DKBluetoothMonitor-inactiveConnections"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("_DKBluetoothMonitor-inactiveConnections"));
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = *(_QWORD *)(a1 + 32);
      v55 = *(void **)(v54 + 176);
      *(_QWORD *)(v54 + 176) = v53;

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "allKeys");
      v51 = objc_claimAutoreleasedReturnValue();
      v56 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      if (v56)
      {
        v57 = *(_QWORD *)v67;
        do
        {
          for (k = 0; k != v56; ++k)
          {
            if (*(_QWORD *)v67 != v57)
              objc_enumerationMutation(v51);
            v59 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k);
            +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "objectForKeyedSubscript:", v59);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v82 = v59;
              v83 = 2112;
              v84 = v61;
              _os_log_impl(&dword_219056000, v60, OS_LOG_TYPE_INFO, "load key: %@ value: %@", buf, 0x16u);

            }
          }
          v56 = -[NSObject countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
        }
        while (v56);
      }
    }
    else
    {
      +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219056000, v51, OS_LOG_TYPE_INFO, "No inactive connections to load", buf, 2u);
      }
    }
  }
  else
  {
    +[_DKBluetoothMonitor log](_DKBluetoothMonitor, "log");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219056000, v42, OS_LOG_TYPE_INFO, "saved state is nil", buf, 2u);
    }

    v43 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v44 = objc_claimAutoreleasedReturnValue();
    v87[0] = v44;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = CFSTR("_DKBluetoothMonitor-activeConnections");
    v86[1] = CFSTR("_DKBluetoothMonitor-inactiveConnections");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "dictionaryWithObjects:forKeys:", v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    v49 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v50 = *(void **)(v49 + 40);
    *(_QWORD *)(v49 + 40) = v48;

    v51 = v44;
  }

  objc_autoreleasePoolPop(context);
}

uint64_t __48___DKBluetoothMonitor_receiveNotificationEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleUnpairingEvent:", *(_QWORD *)(a1 + 40));
}

BOOL __44___DKBluetoothMonitor_handleUnpairingEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == 0;

  }
  return v6;
}

void __32___DKBluetoothMonitor_saveState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 136446466;
  v5 = "-[_DKBluetoothMonitor saveState]_block_invoke";
  v6 = 2114;
  v7 = (id)objc_opt_class();
  v3 = v7;
  _os_log_debug_impl(&dword_219056000, a2, OS_LOG_TYPE_DEBUG, "%{public}s did _CDSharedMemoryKeyValueStore for %{public}@.", (uint8_t *)&v4, 0x16u);

}

void __32___DKBluetoothMonitor_saveState__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_219056000, a2, a3, "Error serializing activeConnection data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __32___DKBluetoothMonitor_loadState__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_219056000, a2, a3, "Error unarchiving state: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
