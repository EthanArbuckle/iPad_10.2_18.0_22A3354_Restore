@implementation DADeviceAccessAnalytics

+ (void)sendAnalyticsInfo:(id)a3 forEvent:(id)a4 withDeviceIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  if (v11 && v7 && v8)
  {
    if (sendAnalyticsInfo_forEvent_withDeviceIdentifier__once != -1)
      dispatch_once(&sendAnalyticsInfo_forEvent_withDeviceIdentifier__once, &__block_literal_global_0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sentIdentifier, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      +[DADeviceAccessAnalytics sendAnalytics:forEvent:](DADeviceAccessAnalytics, "sendAnalytics:forEvent:", v11, v7);
      objc_msgSend((id)sentIdentifier, "setObject:forKeyedSubscript:", &unk_24D1702D8, v9);
    }

  }
}

void __75__DADeviceAccessAnalytics_sendAnalyticsInfo_forEvent_withDeviceIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sentIdentifier;
  sentIdentifier = v0;

}

+ (void)sendAnalytics:(id)a3 forEvent:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v9 = v5;
    AnalyticsSendEventLazy();

  }
  else if (gLogCategory_DeviceAccessAnalytics <= 115
         && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5 == 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

id __50__DADeviceAccessAnalytics_sendAnalytics_forEvent___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)markSessionActivationForPid:(id)a3 atTime:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (v8 && v5)
  {
    if (markSessionActivationForPid_atTime__once != -1)
      dispatch_once(&markSessionActivationForPid_atTime__once, &__block_literal_global_101);
    objc_msgSend((id)sessionStartTime, "setObject:forKeyedSubscript:", v5, v8);
  }
  else if (gLogCategory_DeviceAccessAnalytics <= 115
         && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8 == 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5 == 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

void __62__DADeviceAccessAnalytics_markSessionActivationForPid_atTime___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sessionStartTime;
  sessionStartTime = v0;

}

+ (void)markSessionInvalidationForPid:(id)a3 atTime:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v6 = a4;
  if (v5
    && (objc_msgSend((id)sessionStartTime, "objectForKeyedSubscript:", v5),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend((id)sessionStartTime, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    objc_msgSend(v6, "doubleValue");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11 - v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sessionStartTime, "removeObjectForKey:", v5);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v12;
    v13 = v12;
    v14 = v17;
    AnalyticsSendEventLazy();

  }
  else if (gLogCategory_DeviceAccessAnalytics <= 115
         && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5 == 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 == 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

id __64__DADeviceAccessAnalytics_markSessionInvalidationForPid_atTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("Identifier");
  v3[1] = CFSTR("ElapsedTime");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)markState:(int64_t)a3 deviceID:(id)a4 shared:(BOOL)a5 discovery:(id)a6 flags:(unint64_t)a7 sourceApp:(int64_t)a8 atTime:(id)a9 errorCode:(unint64_t)a10
{
  id v13;
  id v14;
  id v15;
  void *v16;
  DADeviceStateRecord *v17;
  char v18;
  void *v19;
  double Current;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t i;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  DADeviceStateRecord *v95;
  id v96;
  void *v97;
  id obj;
  id obja;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  uint64_t v117;
  id (*v118)(uint64_t);
  void *v119;
  id v120;
  id v121;
  id v122;
  DADeviceStateRecord *v123;
  id v124;
  unint64_t v125;
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a6;
  v15 = a9;
  if (markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode__once != -1)
    dispatch_once(&markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode__once, &__block_literal_global_111);
  objc_msgSend((id)daDeviceState, "objectForKeyedSubscript:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[DADeviceStateRecord initWithState:andTime:]([DADeviceStateRecord alloc], "initWithState:andTime:", a3, v15);
  v18 = objc_msgSend(v14, "flags");
  if (a3 == 5 && (v18 & 4) != 0)
  {
    v19 = (void *)MEMORY[0x24BDD16E0];
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v14, "activateTimeInterval");
    objc_msgSend(v19, "numberWithDouble:", vabdd_f64(Current, v21));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[DADeviceStateRecord setDiscoveryTime:](v17, "setDiscoveryTime:", v22);

  }
  if (v16)
  {
    if ((objc_msgSend(v16, "isEqual:", v17) & 1) == 0)
    {
      objc_msgSend(v16, "timeIntervelBetweenState:", v17);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stateTransitionAsString:", v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_DeviceAccessAnalytics <= 40
        && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
      {
        v86 = v13;
        v87 = v23;
        v85 = v24;
        LogPrintF();
      }
      v116 = MEMORY[0x24BDAC760];
      v117 = 3221225472;
      v118 = __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_2;
      v119 = &unk_24D169628;
      v108 = v24;
      v120 = v108;
      v121 = v13;
      v125 = a7;
      v105 = v16;
      v122 = v105;
      v123 = v17;
      v25 = v23;
      v124 = v25;
      AnalyticsSendEventLazy();
      objc_msgSend((id)daDeviceState, "setObject:forKeyedSubscript:", v123, v121);
      if (v14
        && (unint64_t)objc_msgSend(v14, "flags") >= 2
        && (unint64_t)objc_msgSend(v14, "flags") >= 2
        && (unint64_t)a3 <= 0x1E
        && ((1 << a3) & 0x42100000) != 0)
      {
        v100 = v25;
        objc_msgSend(v14, "configuration");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "bundleID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          v29 = v27;
        }
        else
        {
          objc_msgSend(v14, "bundleID");
          v29 = (id)objc_claimAutoreleasedReturnValue();
        }
        v97 = v29;

        objc_msgSend(v14, "configuration");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v92 = &unk_24D1702D8;
        }
        else
        {
          v31 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v14, "configurations");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v32, "count"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v14, "configuration");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "configurations");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = v17;
        v96 = v15;
        v93 = v34;
        v94 = v33;
        if (v33)
        {
          objc_msgSend(v33, "bluetoothCompanyIdentifiers");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "count");

          objc_msgSend(v33, "bluetoothCompanyPayload");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "length");

          objc_msgSend(v33, "bluetoothNameSubstring");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "length");

          objc_msgSend(v33, "bluetoothServices");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "count");

          objc_msgSend(v33, "bluetoothServicePayload");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "length");

          objc_msgSend(v33, "bluetoothIdentifier");
          objc_msgSend(v33, "hotspotSSIDs");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "count");

          objc_msgSend(v33, "hotspotSSIDPrefixes");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "count");

          objc_msgSend(v33, "networkHotspotSSID");
        }
        else if (v34)
        {
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          obj = v34;
          v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
          if (v103)
          {
            v101 = *(_QWORD *)v113;
            v89 = v13;
            while (2)
            {
              for (i = 0; i != v103; ++i)
              {
                if (*(_QWORD *)v113 != v101)
                  objc_enumerationMutation(obj);
                v43 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
                objc_msgSend(v43, "bluetoothCompanyIdentifiers", v85, v86, v87);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "count");

                objc_msgSend(v43, "bluetoothCompanyPayload");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v46, "length");

                objc_msgSend(v43, "bluetoothNameSubstring");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v48, "length");

                objc_msgSend(v43, "bluetoothServices");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = objc_msgSend(v50, "count");

                objc_msgSend(v43, "bluetoothServicePayload");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "length");

                objc_msgSend(v43, "bluetoothIdentifier");
                v54 = objc_claimAutoreleasedReturnValue();
                LOBYTE(v45) = (v54 | v45 | v47 | v49 | v51 | v53) != 0;

                objc_msgSend(v43, "hotspotSSIDs");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = objc_msgSend(v55, "count");

                objc_msgSend(v43, "hotspotSSIDPrefixes");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                v58 = objc_msgSend(v57, "count");

                objc_msgSend(v43, "networkHotspotSSID");
                v59 = objc_claimAutoreleasedReturnValue();
                v60 = (v59 | v56 | v58) != 0;

                if ((v45 & 1) != 0 || v60)
                {

                  v13 = v89;
                  goto LABEL_39;
                }
              }
              v13 = v89;
              v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v126, 16);
              if (v103)
                continue;
              break;
            }
          }

        }
LABEL_39:
        objc_msgSend(v14, "configuration", v85, v86, v87);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)MEMORY[0x24BDD16E0];
        if (v61)
        {
          objc_msgSend(v14, "configuration");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "numberWithUnsignedInteger:", objc_msgSend(v63, "flags") & 4);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v14, "configurations");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "cuFilteredArrayUsingBlock:", &__block_literal_global_128);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "numberWithInt:", objc_msgSend(v64, "count") != 0);
          v104 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v14, "configuration");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)MEMORY[0x24BDD16E0];
        if (v65)
        {
          objc_msgSend(v14, "configuration");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "numberWithUnsignedInteger:", objc_msgSend(v67, "flags") & 2);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v14, "configurations");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "cuFilteredArrayUsingBlock:", &__block_literal_global_130);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "numberWithInt:", objc_msgSend(v68, "count") != 0);
          v102 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v14, "configuration");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (void *)MEMORY[0x24BDD16E0];
        if (v69)
        {
          objc_msgSend(v14, "configuration");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "numberWithBool:", objc_msgSend(v71, "allowsRename"));
          obja = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v14, "configurations");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "cuFilteredArrayUsingBlock:", &__block_literal_global_131);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "numberWithInt:", objc_msgSend(v72, "count") != 0);
          obja = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v14, "configuration");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)MEMORY[0x24BDD16E0];
        if (v73)
        {
          objc_msgSend(v14, "configuration");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "numberWithUnsignedInteger:", objc_msgSend(v75, "flags") & 8);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v14, "configurations");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "cuFilteredArrayUsingBlock:", &__block_literal_global_132);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "numberWithInt:", objc_msgSend(v76, "count") != 0);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if ((objc_msgSend(v14, "flags") & 8) != 0)
        {
          objc_msgSend(v14, "configuration");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (v77)
          {
            v90 = &unk_24D1702D8;
          }
          else
          {
            v78 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v14, "configurations");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "numberWithUnsignedInteger:", objc_msgSend(v79, "count"));
            v90 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          v90 = &unk_24D1702F0;
        }
        if (gLogCategory_DeviceAccessAnalytics <= 40
          && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a10);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        v109 = v100;
        v110 = v105;
        v111 = v14;
        v106 = v90;
        v80 = v102;
        v81 = v91;
        v82 = obja;
        v107 = v92;
        v83 = v97;
        v84 = v104;
        AnalyticsSendEventLazy();

        v25 = v100;
        v17 = v95;
        v15 = v96;
      }

    }
  }
  else
  {
    objc_msgSend((id)daDeviceState, "setObject:forKeyedSubscript:", v17, v13);
  }

}

void __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)daDeviceState;
  daDeviceState = v0;

}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x24BDAC8D0];
  if (gLogCategory_DeviceAccessAnalytics <= 40
    && (gLogCategory_DeviceAccessAnalytics != -1 || _LogCategory_Initialize()))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    LogPrintF();
  }
  if ((*(_QWORD *)(a1 + 72) & 8) != 0)
    v2 = &unk_24D170308;
  else
    v2 = &unk_24D1702D8;
  v13[0] = v2;
  v12[0] = CFSTR("DeviceFlags");
  v12[1] = CFSTR("sourceApplication");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "state", v10, v11));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v13[1] = v3;
  v13[2] = v4;
  v12[2] = CFSTR("State");
  v12[3] = CFSTR("StateFrom");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  v12[4] = CFSTR("StateTo");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 56), "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = CFSTR("ElapsedTime");
  v7 = *(_QWORD *)(a1 + 64);
  v13[4] = v6;
  v13[5] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_126(uint64_t a1, void *a2)
{
  unint64_t v2;
  id v3;

  v2 = a2;
  v3 = (id)(v2 & (objc_msgSend((id)v2, "flags") << 61 >> 63));

  return v3;
}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_2_129(uint64_t a1, void *a2)
{
  unint64_t v2;
  id v3;

  v2 = a2;
  v3 = (id)(v2 & (objc_msgSend((id)v2, "flags") << 62 >> 63));

  return v3;
}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "allowsRename"))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_4(uint64_t a1, void *a2)
{
  unint64_t v2;
  id v3;

  v2 = a2;
  v3 = (id)(v2 & (objc_msgSend((id)v2, "flags") << 60 >> 63));

  return v3;
}

id __96__DADeviceAccessAnalytics_markState_deviceID_shared_discovery_flags_sourceApp_atTime_errorCode___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[20];
  _QWORD v31[22];

  v31[20] = *MEMORY[0x24BDAC8D0];
  v30[0] = CFSTR("AccessoryDiscoveryErrorOccurred");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 112));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v31[0] = v29;
  v31[1] = v2;
  v30[1] = CFSTR("AccessoryReadyToUseInSeconds");
  v30[2] = CFSTR("BluetoothTransportBridging");
  v4 = *(const __CFString **)(a1 + 48);
  if (!v4)
    v4 = CFSTR("-");
  v31[2] = v3;
  v31[3] = v4;
  v30[3] = CFSTR("BundleID");
  v30[4] = CFSTR("DiscoveryTechnology");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 120));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v28;
  v30[5] = CFSTR("DiscoveryTimeInSeconds");
  objc_msgSend(*(id *)(a1 + 56), "discoveryTime");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = &unk_24D1702F0;
  v8 = *(void **)(a1 + 64);
  if (!v8)
    v8 = &unk_24D1702F0;
  v31[5] = v7;
  v31[6] = v8;
  v30[6] = CFSTR("DisplayItemsCount");
  v30[7] = CFSTR("HasBluetoothCompanyIDs");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 128));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v27;
  v30[8] = CFSTR("HasBlobMaskMfgData");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 129));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v9;
  v30[9] = CFSTR("HasBluetoothNames");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 130));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v10;
  v30[10] = CFSTR("HasBluetoothServices");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 131));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v11;
  v30[11] = CFSTR("HasBlobMaskServiceData");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 132));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = *(_QWORD *)(a1 + 72);
  v15 = *(_QWORD *)(a1 + 80);
  if (!v14)
    v14 = MEMORY[0x24BDBD1C0];
  v31[11] = v12;
  v31[12] = v14;
  v30[12] = CFSTR("HasRenameOption");
  v30[13] = CFSTR("HasRenameSSID");
  if (v15)
    v16 = v15;
  else
    v16 = MEMORY[0x24BDBD1C0];
  v31[13] = v16;
  v30[14] = CFSTR("HasSSIDs");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 133));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31[14] = v17;
  v30[15] = CFSTR("HasSSIDPrefixes");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 134));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1 + 88);
  v19 = *(void **)(a1 + 96);
  v31[15] = v18;
  v31[16] = v20;
  v30[16] = CFSTR("isBluetoothPairing");
  v30[17] = CFSTR("isExtensionDiscovery");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v19, "runningExtension"));
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = *(void **)(a1 + 104);
  if (!v23)
    v23 = &unk_24D1702F0;
  v31[17] = v21;
  v31[18] = v23;
  v30[18] = CFSTR("MigrationItemsCount");
  v30[19] = CFSTR("SharedAccessory");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 135));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[19] = v24;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

@end
