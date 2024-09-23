@implementation NPTWiFiCollector

- (void)startCollectingWithCompletion:(id)a3
{
  void (**v4)(id, id, id);
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id location;

  v4 = (void (**)(id, id, id))a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTWiFiCollector setCachedMetadata:](self, "setCachedMetadata:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTWiFiCollector cachedMetadata](self, "cachedMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("initial_state"));

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPTWiFiCollector cachedMetadata](self, "cachedMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("events"));

  v11 = objc_alloc_init(MEMORY[0x24BE29F18]);
  -[NPTWiFiCollector setInterface:](self, "setInterface:", v11);

  objc_initWeak(&location, self);
  -[NPTWiFiCollector interface](self, "interface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __50__NPTWiFiCollector_startCollectingWithCompletion___block_invoke;
  v33[3] = &unk_24C9914A8;
  v31 = &v34;
  objc_copyWeak(&v34, &location);
  objc_msgSend(v12, "setEventHandler:", v33);

  -[NPTWiFiCollector interface](self, "interface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activate");

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = 0; objc_msgSend(&unk_24C9A7D50, "count", v31) > i; ++i)
  {
    objc_msgSend(&unk_24C9A7D50, "objectAtIndexedSubscript:", i);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTWiFiCollector interface](self, "interface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "integerValue");
    v32 = 0;
    objc_msgSend(v17, "startMonitoringEventType:error:", v18, &v32);
    v19 = v32;

    if (v19)
      objc_msgSend(v14, "addObject:", v19);

  }
  -[NPTWiFiCollector interface](self, "interface");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPTWiFiCollector fetchWiFiData:](NPTWiFiCollector, "fetchWiFiData:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addEntriesFromDictionary:", v21);
  -[NPTWiFiCollector interface](self, "interface");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "currentKnownNetworkProfile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPTWiFiCollector interface](self, "interface");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    -[NPTWiFiCollector interface](self, "interface");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "CCA");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v28, CFSTR("wifi_cwf_cca"));

  }
  if (v23)
  {
    objc_msgSend(v23, "dictionary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", v29);

  }
  -[NPTWiFiCollector cachedMetadata](self, "cachedMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v5, CFSTR("initial_state"));

  if (v4)
    v4[2](v4, v5, v14);

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);

}

void __50__NPTWiFiCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NPTMetadataEvent *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  id v25;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unsigned int v63;
  const char *v64;
  void *v65;
  void *v66;
  id v67;
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
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void (**v115)(_QWORD, _QWORD, _QWORD);
  id v116;
  id v117;
  const __CFString *v118;
  void *v119;
  const __CFString *v120;
  void *v121;
  const __CFString *v122;
  void *v123;
  const __CFString *v124;
  void *v125;
  const __CFString *v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  const __CFString *v132;
  _QWORD v133[3];

  v133[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v116 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v116, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSxxx"));
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc_init(NPTMetadataEvent);
  v117 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetadataEvent setTimeStamp:](v6, "setTimeStamp:", v7);

  -[NPTMetadataEvent setCollectorType:](v6, "setCollectorType:", objc_opt_class());
  objc_msgSend(v3, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v3, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("info"));

  }
  switch(objc_msgSend(v3, "type"))
  {
    case 1:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 12);
      v13 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(WeakRetained, "interface");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "powerOn"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("data"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v128 = CFSTR("wifi_power");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("data"));

      }
      else
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("data"));
      }

      goto LABEL_84;
    case 2:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 11);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("data"));
      }
      else
      {
        v67 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(WeakRetained, "interface");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "SSID");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = (void *)objc_msgSend(v67, "initWithData:encoding:", v69, 4);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v70, CFSTR("data"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      if (v71)
      {
        v130 = CFSTR("wifi_ssid");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v131 = v72;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v73, CFSTR("data"));

      }
      else
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("data"));
      }

      goto LABEL_84;
    case 3:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 10);
      objc_msgSend(WeakRetained, "interface");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "BSSID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setObject:forKeyedSubscript:", v21, CFSTR("wifi_bssid"));

      objc_msgSend(WeakRetained, "interface");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "BSSID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[NPTWiFiCollector convertBSSIDToOUI:](NPTWiFiCollector, "convertBSSIDToOUI:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setObject:forKeyedSubscript:", v24, CFSTR("wifi_oui"));

      if (objc_msgSend(v117, "count"))
        v25 = v117;
      else
        v25 = 0;
      goto LABEL_44;
    case 5:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 15);
      objc_msgSend(WeakRetained, "interface");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "currentScanResult");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dictionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count"))
      {
        objc_msgSend(WeakRetained, "interface");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "currentScanResult");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "dictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("data"));

      }
      else
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("data"));
      }

      goto LABEL_82;
    case 6:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 25);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        v26 = v32;
      }
      else
      {
        objc_msgSend(WeakRetained, "interface");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "cachedLinkDownStatus");
        v26 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v26, "interfaceName");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setObject:forKeyedSubscript:", v75, CFSTR("interface"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v26, "isLinkDown"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setObject:forKeyedSubscript:", v76, CFSTR("link_down"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v26, "reason"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setObject:forKeyedSubscript:", v77, CFSTR("reason"));

      objc_msgSend(v5, "setObject:forKeyedSubscript:", v117, CFSTR("data"));
      goto LABEL_83;
    case 7:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 16);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v34)
      {
        v26 = v34;
      }
      else
      {
        objc_msgSend(WeakRetained, "interface");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "cachedLinkQualityMetric");
        v26 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v26, "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
        goto LABEL_64;
      goto LABEL_65;
    case 10:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 13);
      objc_msgSend(WeakRetained, "interface");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "interfaceNames");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("data"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        v126 = CFSTR("wifi_interface_names");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = v39;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("data"));

      }
      else
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("data"));
      }

      goto LABEL_84;
    case 11:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 14);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v41)
      {
        v43 = v41;
      }
      else
      {
        objc_msgSend(WeakRetained, "interface");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "interfaceNames");
        v43 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("data"));
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        v124 = CFSTR("wifi_interface_names");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = v81;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v82, CFSTR("data"));

      }
      else
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("data"));
      }

      goto LABEL_84;
    case 12:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 17);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v44;
      if (v44)
      {
        v26 = v44;
      }
      else
      {
        objc_msgSend(WeakRetained, "interface");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "cachedAutoJoinStatus");
        v26 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v26, "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
        goto LABEL_64;
      goto LABEL_65;
    case 13:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 18);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v46;
      if (v46)
      {
        v26 = v46;
      }
      else
      {
        objc_msgSend(WeakRetained, "interface");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "cachedJoinStatus");
        v26 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v26, "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
        goto LABEL_64;
      goto LABEL_65;
    case 14:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 19);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      if (v48)
      {
        v26 = v48;
      }
      else
      {
        objc_msgSend(WeakRetained, "interface");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "cachedRoamStatus");
        v26 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v26, "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "count"))
      {
LABEL_64:
        objc_msgSend(v26, "dictionary");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v86, CFSTR("data"));

      }
      else
      {
LABEL_65:
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("data"));
      }
LABEL_82:

LABEL_83:
      goto LABEL_84;
    case 18:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 9);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v50)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v50, CFSTR("data"));
      }
      else
      {
        objc_msgSend(WeakRetained, "interface");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "networkServiceName");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v88, CFSTR("data"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if (v89)
      {
        v132 = CFSTR("wifi_network_service_name");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v133[0] = v90;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v133, &v132, 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v91, CFSTR("data"));

      }
      else
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("data"));
      }

      goto LABEL_84;
    case 19:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 21);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("data"));
      }
      else
      {
        objc_msgSend(WeakRetained, "interface");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "IPv4Addresses");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v93, CFSTR("data"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      if (v94)
      {
        v120 = CFSTR("wifi_ipv4_addresses");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = v95;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v96, CFSTR("data"));

      }
      else
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("data"));
      }

      goto LABEL_84;
    case 20:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 22);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v52, CFSTR("data"));
      }
      else
      {
        objc_msgSend(WeakRetained, "interface");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "IPv6Addresses");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v98, CFSTR("data"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      if (v99)
      {
        v118 = CFSTR("wifi_ipv6_addresses");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = v100;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v101, CFSTR("data"));

      }
      else
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("data"));
      }

      goto LABEL_84;
    case 21:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 20);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("info"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (v53)
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v53, CFSTR("data"));
      }
      else
      {
        objc_msgSend(WeakRetained, "interface");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "DNSServerAddresses");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v103, CFSTR("data"));

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      if (v104)
      {
        v122 = CFSTR("wifi_dns_addresses");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = v105;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v106, CFSTR("data"));

      }
      else
      {
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("data"));
      }

      goto LABEL_84;
    case 22:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 24);
      objc_msgSend(WeakRetained, "interface");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "DHCPLeaseStartedAt");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "stringFromDate:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setObject:forKeyedSubscript:", v56, CFSTR("wifi_dhcp_start_time"));

      objc_msgSend(WeakRetained, "interface");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "DHCPLeaseExpiresAt");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "stringFromDate:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v117;
      objc_msgSend(v117, "setObject:forKeyedSubscript:", v59, CFSTR("wifi_dhcp_expire_time"));

      goto LABEL_41;
    case 23:
      -[NPTMetadataEvent setEventType:](v6, "setEventType:", 23);
      v61 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(WeakRetained, "interface");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "EAP8021XSupplicantState");
      if (v63 > 8)
        v64 = "<unknown>";
      else
        v64 = SupplicantStateString_str[v63];
      objc_msgSend(v61, "stringWithUTF8String:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setObject:forKeyedSubscript:", v65, CFSTR("wifi_eap8021x_supplicant_state"));

      objc_msgSend(WeakRetained, "interface");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[NPTWiFiCollector ControlModeToString:](NPTWiFiCollector, "ControlModeToString:", objc_msgSend(v57, "EAP8021XControlMode"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v117;
      objc_msgSend(v117, "setObject:forKeyedSubscript:", v66, CFSTR("wifi_eap8021x_control_mode"));

LABEL_41:
      if (objc_msgSend(v60, "count"))
        v25 = v60;
      else
        v25 = 0;
LABEL_44:
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("data"));
LABEL_84:
      objc_msgSend(v5, "removeObjectForKey:", CFSTR("info"));
      if (v6)
      {
        v107 = (void *)MEMORY[0x24BDBCE70];
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("data"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "dictionaryWithDictionary:", v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPTMetadataEvent setData:](v6, "setData:", v109);

        v110 = WeakRetained;
        objc_sync_enter(v110);
        objc_msgSend(v110, "cachedMetadata");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("events"));
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPTMetadataEvent asDictionary](v6, "asDictionary");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "addObject:", v113);

        objc_sync_exit(v110);
        objc_msgSend(v110, "metadataDidChangeHandler");
        v114 = (void *)objc_claimAutoreleasedReturnValue();

        if (v114)
        {
          objc_msgSend(v110, "metadataDidChangeHandler");
          v115 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, NPTMetadataEvent *, _QWORD))v115)[2](v115, v6, 0);

        }
      }
      break;
    default:

      objc_msgSend(v5, "removeObjectForKey:", CFSTR("info"));
      v6 = 0;
      break;
  }

}

- (void)stopCollecting
{
  id v2;

  -[NPTWiFiCollector interface](self, "interface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

+ (id)collectorName
{
  return CFSTR("wifi");
}

+ (id)fetchWiFiData:(id)a3
{
  id v4;
  id v5;
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
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "BSSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("wifi_bssid"));

  objc_msgSend(v4, "BSSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPTWiFiCollector convertBSSIDToOUI:](NPTWiFiCollector, "convertBSSIDToOUI:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("wifi_oui"));

  objc_msgSend(a1, "BTCModeToString:", objc_msgSend(v4, "bluetoothCoexistenceMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("wifi_btc_mode"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "channel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "channel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("wifi_channel"));

  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "channel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInteger:", objc_msgSend(a1, "channelBandToInt:", objc_msgSend(v14, "band")));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("wifi_channel_band"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "channel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithUnsignedInt:", objc_msgSend(v17, "width"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("wifi_channel_width"));

  objc_msgSend(v4, "countryCode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("wifi_country_code"));

  objc_msgSend(a1, "ControlModeToString:", objc_msgSend(v4, "EAP8021XControlMode"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("wifi_eapol_control_mode"));

  v21 = (void *)MEMORY[0x24BDD17C8];
  v22 = objc_msgSend(v4, "EAP8021XSupplicantState");
  if (v22 > 8)
    v23 = "<unknown>";
  else
    v23 = SupplicantStateString_str[v22];
  objc_msgSend(v21, "stringWithUTF8String:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("wifi_eapol_supplicant_state"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "guardInterval"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("wifi_guard_interval"));

  objc_msgSend(v4, "MACAddress");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("wifi_mac_address"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "MCSIndex"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("wifi_mcs_index"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "noise"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("wifi_noise"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfSpatialStreams"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("wifi_number_of_spatial_streams"));

  objc_msgSend(a1, "OpModeToString:", objc_msgSend(v4, "opMode"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("wifi_op_mode"));

  objc_msgSend(a1, "PhyModeToString:", objc_msgSend(v4, "PHYMode"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("wifi_phy_mode"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "RSSI"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("wifi_rssi"));

  objc_msgSend(a1, "SecurityTypeToString:", objc_msgSend(v4, "securityType"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("wifi_security"));

  objc_msgSend(v4, "networkName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("wifi_ssid"));

  v35 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "txRate");
  objc_msgSend(v35, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("wifi_tx_rate"));

  objc_msgSend(v4, "cachedJoinStatus");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    objc_msgSend(v37, "scanResult");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "networkName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkName");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqualToString:", v41);

    if (v42)
    {
      v43 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "cachedJoinStatus");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "endedAt");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "timeIntervalSinceNow");
      objc_msgSend(v43, "numberWithDouble:", -v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, CFSTR("wifi_assoc_duration"));

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v48 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "rxRate");
    objc_msgSend(v48, "numberWithDouble:");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, CFSTR("wifi_rx_rate"));

  }
  return v5;
}

+ (id)convertBSSIDToOUI:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = 0;
    v5 = 0;
    while (objc_msgSend(v3, "characterAtIndex:", v4) != 58 || ++v5 != 3)
    {
      if (objc_msgSend(v3, "length") <= (unint64_t)++v4)
        goto LABEL_6;
    }
    objc_msgSend(v3, "substringToIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v6 = 0;
  }

  return v6;
}

+ (id)SecurityTypeToString:(unint64_t)a3
{
  id result;

  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 <= 63)
    {
      if (a3 == 16)
        return CFSTR("WPA2 Personal");
      if (a3 == 32)
        return CFSTR("WPA2 Enterprise");
    }
    else
    {
      switch(a3)
      {
        case 0x40uLL:
          return CFSTR("WPA3 Personal");
        case 0x80uLL:
          return CFSTR("WPA3 Enterprise");
        case 0x200uLL:
          return CFSTR("None");
      }
    }
    return CFSTR("Conversion not found");
  }
  else
  {
    switch(a3)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
        result = CFSTR("Any");
        break;
      case 1uLL:
        result = CFSTR("WEP");
        break;
      case 2uLL:
        result = CFSTR("WAPI");
        break;
      case 4uLL:
        result = CFSTR("WPA Personal");
        break;
      case 8uLL:
        result = CFSTR("WPA Enterprise");
        break;
      default:
        return CFSTR("Conversion not found");
    }
  }
  return result;
}

+ (id)BTCModeToString:(int)a3
{
  if (a3 > 8)
    return CFSTR("Conversion not found");
  else
    return off_24C9916F0[a3];
}

+ (id)ControlModeToString:(unsigned int)a3
{
  if (a3 > 3)
    return CFSTR("Conversion not found");
  else
    return off_24C991738[a3];
}

+ (id)OpModeToString:(int)a3
{
  id result;

  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16)
        return CFSTR("MONITOR");
      if (a3 == 32)
        return CFSTR("P2P_GO");
    }
    else
    {
      switch(a3)
      {
        case 64:
          return CFSTR("P2P_CLI");
        case 128:
          return CFSTR("P2P_DEV");
        case 256:
          return CFSTR("NAN");
      }
    }
    return CFSTR("Conversion not found");
  }
  else
  {
    result = CFSTR("NONE");
    switch(a3)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("STA");
        break;
      case 2:
        result = CFSTR("IBSS");
        break;
      case 4:
        result = CFSTR("AHDEMO");
        break;
      case 8:
        result = CFSTR("HOSTAP");
        break;
      default:
        return CFSTR("Conversion not found");
    }
  }
  return result;
}

+ (id)PhyModeToString:(int)a3
{
  id result;

  if (a3 > 31)
  {
    if (a3 > 255)
    {
      switch(a3)
      {
        case 256:
          return CFSTR("11ax");
        case 512:
          return CFSTR("11BE");
        case 1024:
          return CFSTR("6E");
      }
    }
    else
    {
      switch(a3)
      {
        case 32:
          return CFSTR("turbo_a");
        case 64:
          return CFSTR("turbo_g");
        case 128:
          return CFSTR("11ac");
      }
    }
    return CFSTR("Conversion not found");
  }
  else
  {
    result = CFSTR("unknown");
    switch(a3)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("auto");
        break;
      case 2:
        result = CFSTR("11a");
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        return CFSTR("Conversion not found");
      case 4:
        result = CFSTR("11b");
        break;
      case 8:
        result = CFSTR("11g");
        break;
      default:
        if (a3 != 16)
          return CFSTR("Conversion not found");
        result = CFSTR("11n");
        break;
    }
  }
  return result;
}

+ (id)convertPowerStateToString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(objc_retainAutorelease(a3), "bytes");
  if (v3)
  {
    v4 = v3;
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (*(_DWORD *)(v4 + 4))
    {
      v6 = 0;
      do
      {
        v7 = *(int *)(v4 + 8 + 4 * v6);
        if (v7 <= 4)
          objc_msgSend(v5, "addObject:", off_24C991758[v7]);
        ++v6;
      }
      while (v6 < *(unsigned int *)(v4 + 4));
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (int64_t)channelBandToInt:(unsigned int)a3
{
  void *v3;
  int64_t v4;

  if (a3 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)qword_24C991780[a3];
  }
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)metadataDidChangeHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setMetadataDidChangeHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CWFInterface)interface
{
  return self->_interface;
}

- (void)setInterface:(id)a3
{
  objc_storeStrong((id *)&self->_interface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);
  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

@end
