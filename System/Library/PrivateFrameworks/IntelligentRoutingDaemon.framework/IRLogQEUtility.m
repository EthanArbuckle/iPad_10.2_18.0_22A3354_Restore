@implementation IRLogQEUtility

+ (id)getContextAsString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "candidateResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", CFSTR("{\n"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v34;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(obj);
        v28 = v7;
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v7);
        objc_msgSend(v6, "appendString:", CFSTR("    {\n"));
        objc_msgSend(v8, "candidate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "candidateIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "classification");
        IRCandidateClassificationToString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "classificationDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("        candidateIdentifier: %@, classification: %@, desc: %@\n"), v10, v11, v12);

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v8, "candidate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "nodes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v30 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v19, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "avOutpuDeviceIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "rapportIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "idsIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "appendFormat:", CFSTR("        node: name: %@, avOutpuDeviceIdentifier: %@, rapportIdentifier: %@, idsIdentifier: %@\n"), v20, v21, v22, v23);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v16);
        }

        objc_msgSend(v6, "appendString:", CFSTR("    \n    }\n"));
        v7 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v27);
  }

  objc_msgSend(v6, "appendString:", CFSTR("}\n"));
  return v6;
}

+ (id)getSystemStateAsString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v3 = a3;
  objc_msgSend(v3, "appInFocusBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  +[IRLogQEUtility BOOLPropertyToString:](IRLogQEUtility, "BOOLPropertyToString:", objc_msgSend(v3, "appInFocusWindowValid"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceWiFiSSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "locationSemanticLoiIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "iCloudId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "avInitialRouteSharingPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "mediaRouteGroupLeaderOutputDeviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v9);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "outputDeviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  IRAVOutputDeviceTypeToString(objc_msgSend(v3, "outputDeviceType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v11);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  IRAVOutputDeviceSubTypeToString(objc_msgSend(v3, "outputDeviceSubType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "predictedOutputDeviceName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  IRAVOutputDeviceTypeToString(objc_msgSend(v3, "predictedOutputDeviceType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  IRAVOutputDeviceSubTypeToString(objc_msgSend(v3, "predictedOutputDeviceSubType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  IRLocationSemanticUserSpecificPlaceTypeToString(objc_msgSend(v3, "locationSemanticUserSpecificPlaceType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility BOOLPropertyToString:](IRLogQEUtility, "BOOLPropertyToString:", objc_msgSend(v3, "appInFocusWindowScreenUnlockEvent"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility BOOLPropertyToString:](IRLogQEUtility, "BOOLPropertyToString:", objc_msgSend(v3, "pdrFenceActive"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestPickerChoiceDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility datePropertyToString:timeZone:](IRLogQEUtility, "datePropertyToString:timeZone:", v17, objc_msgSend(v3, "timeZoneSeconds"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v3, "isContinuityDisplay");
  +[IRLogQEUtility BOOLPropertyToString:](IRLogQEUtility, "BOOLPropertyToString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("appInFocusBundleID: %@\n appInFocusWindowValid: %@\n appInFocusWindowScreenUnlockEvent: %@\n deviceWiFiSSID: %@\n locationSemanticLoiIdentifier: %@\n iCloudId: %@\n locationSemanticUserSpecificPlaceType: %@\n avInitialRouteSharingPolicy: %@\n mediaRouteGroupLeaderOutputDeviceID: %@\n outputDevice: Name - %@, Type - %@, SubType - %@\n predictedOutputDevice: Name - %@, Type - %@, SubType - %@\n pdrFenceActive: %@\n latestPickerChoiceDate: %@\n isContinuityDisplay: %@\n"), v37, v36, v25, v35, v34, v33, v27, v32, v31, v30, v29, v28, v24, v23, v22, v16,
    v18,
    v20);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)stringPropertyToString:(id)a3
{
  if (a3)
    return a3;
  else
    return CFSTR("nil");
}

+ (id)BOOLPropertyToString:(BOOL)a3
{
  if (a3)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

+ (id)getEventAsString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE5B2E0], "eventTypeStringEventDO:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE5B2E0], "eventSubTypeStringEventDO:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("eventType: %@ eventSubType: %@ name: %@ bundleID: %@ contextIdentifier: %@"), v7, v8, v5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)getCandidateAsString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "candidateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  +[IRLogQEUtility BOOLPropertyToString:](IRLogQEUtility, "BOOLPropertyToString:", objc_msgSend(v3, "isSameWiFi"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "lastSeenDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastUsedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstSeenDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v6;
  v37 = (void *)v5;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("candidateIdentifier: %@\nlastSeen: %@\nlastUsed: %@\nfirstSeen: %@\nname: %@\nisSameWiFi: %@\n"), v5, v8, v9, v10, v11, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v38 = v3;
  objc_msgSend(v3, "nodes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v41)
  {
    v13 = &unk_25105EAF8;
    v40 = *(_QWORD *)v53;
    do
    {
      v14 = 0;
      v15 = v13;
      v16 = v12;
      do
      {
        v46 = v16;
        if (*(_QWORD *)v53 != v40)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v14);
        objc_msgSend(v17, "avOutpuDeviceIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v18);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "rapportIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v19);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "idsIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v20);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "avOutputDevice");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "modelID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v22);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "avOutputDevice");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "deviceName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[IRLogQEUtility stringPropertyToString:](IRLogQEUtility, "stringPropertyToString:", v24);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v15, "stringValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "avOutputDevice");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v17, "avOutputDevice");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          IRAVOutputDeviceTypeToString(objc_msgSend(v45, "deviceType"));
          v28 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          v43 = (__CFString *)v28;
        }
        else
        {
          v28 = CFSTR("Invalid");
        }
        objc_msgSend(v17, "avOutputDevice");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(v17, "avOutputDevice");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          IRAVOutputDeviceSubTypeToString(objc_msgSend(v44, "deviceSubType"));
          v30 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          v42 = (__CFString *)v30;
        }
        else
        {
          v30 = CFSTR("Invalid");
        }
        objc_msgSend(v17, "rapportDevice");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "iCloudId");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR(" device%@:\n  avOutpuDeviceIdentifier: %@\n  rapportIdentifier: %@\n  idsIdentifier: %@\n  modelID: %@\n  deviceName: %@\n  deviceType: %@\n  deviceSubType: %@\n  iCloudId: %@\n"), v26, v47, v51, v50, v49, v48, v28, v30, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {

        }
        if (v27)
        {

        }
        objc_msgSend(v46, "stringByAppendingString:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringByAppendingString:", CFSTR("\n"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v15, "intValue") + 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v13;
        v16 = v12;
      }
      while (v41 != v14);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v41);
  }
  else
  {
    v13 = &unk_25105EAF8;
  }

  return v12;
}

+ (id)datePropertyToString:(id)a3 timeZone:(int64_t)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  __CFString *v9;

  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x24BDD1500];
    v6 = a3;
    v7 = objc_alloc_init(v5);
    objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss (Z)"));
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v8);

    objc_msgSend(v7, "stringFromDate:", v6);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("nil");
  }
  return v9;
}

uint64_t __37__IRLogQEUtility_getContextAsString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "classification");
  if (v6 <= objc_msgSend(v5, "classification"))
  {
    v8 = objc_msgSend(v4, "classification");
    v7 = v8 < objc_msgSend(v5, "classification");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

@end
