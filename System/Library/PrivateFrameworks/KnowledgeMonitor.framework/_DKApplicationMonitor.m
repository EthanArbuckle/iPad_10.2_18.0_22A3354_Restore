@implementation _DKApplicationMonitor

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;

  v7 = a5;
  v8 = a4;
  -[_DKApplicationMonitor donateElementsFromDisplayLayout:withContext:](self, "donateElementsFromDisplayLayout:withContext:", v8, v7);
  objc_msgSend(v8, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKApplicationMonitor focalApplicationFromDisplayLayout:](self, "focalApplicationFromDisplayLayout:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKMonitor log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[_DKApplicationMonitor layoutMonitor:didUpdateDisplayLayout:withContext:].cold.5();

  objc_msgSend(v7, "transitionReason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKMonitor log](self, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_DKApplicationMonitor layoutMonitor:didUpdateDisplayLayout:withContext:].cold.4();

  -[_DKMonitor log](self, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[_DKApplicationMonitor layoutMonitor:didUpdateDisplayLayout:withContext:].cold.3(v7, v14);

  -[_DKApplicationMonitorBase updateContextStoreWithFocalApplication:launchReason:](self, "updateContextStoreWithFocalApplication:launchReason:", v10, v12);
  v41 = 0;
  v42 = 0;
  -[_DKApplicationMonitorBase lookupApplication:shortVersionString:exactBundleVersion:](self, "lookupApplication:shortVersionString:exactBundleVersion:", v10, &v42, &v41);
  v15 = v42;
  v16 = v41;
  -[_DKApplicationMonitorBase _eventWithTimestamp:bundleIdentifier:launchReason:shortVersionString:exactBundleVersion:](self, "_eventWithTimestamp:bundleIdentifier:launchReason:shortVersionString:exactBundleVersion:", v9, v10, v12, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_DKMonitor currentEvent](self, "currentEvent");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_10;
    v19 = (void *)v18;
    -[_DKMonitor eventComparator](self, "eventComparator");
    v38 = v12;
    v39 = v10;
    v20 = v16;
    v21 = v15;
    v22 = v9;
    v23 = v7;
    v24 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[_DKMonitor currentEvent](self, "currentEvent");
    v25 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = ((uint64_t (**)(_QWORD, void *, void *))v24)[2](v24, v26, v25);

    v17 = v25;
    v7 = v23;
    v9 = v22;
    v15 = v21;
    v16 = v20;
    v12 = v38;
    v10 = v39;

    if (v27)
    {
LABEL_10:
      v40 = v7;
      -[_DKMonitor currentEvent](self, "currentEvent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "value");
      v29 = v17;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringValue");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v29;
      v32 = objc_msgSend(&unk_24DA70F28, "containsObject:", v31);
      if ((objc_msgSend(MEMORY[0x24BE7A5D0], "isClassCLocked") & 1) == 0)
      {
        -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v17, v32 ^ 1u);
        if ((objc_msgSend(v31, "isEqual:", v10) & 1) == 0
          && (objc_msgSend(&unk_24DA70F40, "containsObject:", v10) & 1) == 0)
        {
          if (objc_msgSend(v31, "length"))
          {
            -[_DKApplicationMonitorBase updateBiomeAppInFocusWithStopEventAtTimestamp:reason:](self, "updateBiomeAppInFocusWithStopEventAtTimestamp:reason:", v9, 0);
            -[_DKMonitor log](self, "log");
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              -[_DKApplicationMonitor layoutMonitor:didUpdateDisplayLayout:withContext:].cold.2();

          }
          if (objc_msgSend(v10, "length"))
          {
            if ((objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple.springboard")) & 1) != 0
              || objc_msgSend(&unk_24DA70F58, "containsObject:", v10))
            {
              v34 = 3;
            }
            else
            {
              v34 = 1;
            }
            v35 = objc_alloc(MEMORY[0x24BE0C288]);
            v36 = (void *)objc_msgSend(v35, "initWithLaunchReason:launchType:starting:absoluteTimestamp:duration:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:", v12, v34, MEMORY[0x24BDBD1C8], v9, 0, v10, 0, 0, v15, v16);
            -[_DKApplicationMonitorBase updateBiomeWithAppInFocusStartEvent:](self, "updateBiomeWithAppInFocusStartEvent:", v36);
            -[_DKMonitor log](self, "log");
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              -[_DKApplicationMonitor layoutMonitor:didUpdateDisplayLayout:withContext:].cold.1();

          }
        }
      }

      v7 = v40;
    }
  }

}

- (id)_elementFromDisplayLayoutElement:(id)a3 displayLayout:(id)a4 context:(id)a5 changeType:(int)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  void *v38;
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  void *v42;
  void *v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "interfaceOrientation");
  if ((unint64_t)(v11 - 1) < 4)
    v12 = v11;
  else
    v12 = 0;
  v41 = v12;
  if (objc_msgSend(v9, "displayBacklightLevel"))
  {
    if (objc_msgSend(v9, "displayBacklightLevel") < 1 || objc_msgSend(v9, "displayBacklightLevel") >= 101)
    {
      v39 = 0;
      goto LABEL_11;
    }
    v13 = 2;
  }
  else
  {
    v13 = 1;
  }
  v39 = v13;
LABEL_11:
  v14 = (void *)objc_opt_new();
  v15 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v10, "transitionReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObjects:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unionSet:", v17);

  objc_msgSend(v10, "transitionReasons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v14, "unionSet:", v18);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unionSet:", v19);

  }
  v20 = objc_alloc(MEMORY[0x24BE0C3C8]);
  objc_msgSend(v9, "displayConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "deviceName");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hardwareIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v14;
  objc_msgSend(v14, "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v20, "initWithType:name:deviceName:hardwareIdentifier:interfaceOrientation:backlightStatus:transitionReasons:", 1, v22, v24, v26, v41, v39, v27);

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "isSpringBoardElement") & 1) != 0)
    v40 = 2;
  else
    v40 = objc_msgSend(v8, "isMemberOfClass:", objc_opt_class());
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "layoutRole"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  v28 = objc_alloc(MEMORY[0x24BE0C3C0]);
  objc_msgSend(v9, "timestamp");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "level"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "hasKeyboardFocus"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v8, "isUIApplicationElement"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v37) = a6;
  v35 = (void *)objc_msgSend(v28, "initWithAbsoluteTimestamp:identifier:bundleIdentifier:elementType:layoutRole:level:hasKeyboardFocus:isUIApplicationElement:display:changeType:", v29, v30, v31, v40, v38, v32, v33, v34, v42, v37);

  return v35;
}

- (void)donateElementsFromDisplayLayout:(id)a3 withContext:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  NSObject *v65;
  id obj;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  _DKApplicationMonitor *v83;
  id v84;
  id v85;
  uint8_t v86;
  _BYTE v87[15];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _QWORD v96[6];
  _QWORD v97[6];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint8_t v101[128];
  _BYTE buf[24];
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v70 = a3;
  v69 = a4;
  -[_DKApplicationMonitor displayElementStream](self, "displayElementStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_DKApplicationMonitor currentFrontBoardElements](self, "currentFrontBoardElements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)objc_opt_new();
      -[_DKApplicationMonitor setCurrentFrontBoardElements:](self, "setCurrentFrontBoardElements:", v8);

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v103 = 0;
      -[_DKApplicationMonitor displayElementStream](self, "displayElementStream");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "publisher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = MEMORY[0x24BDAC760];
      v97[1] = 3221225472;
      v97[2] = __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke;
      v97[3] = &unk_24DA67420;
      v97[4] = self;
      v97[5] = buf;
      v96[0] = MEMORY[0x24BDAC760];
      v96[1] = 3221225472;
      v96[2] = __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_2;
      v96[3] = &unk_24DA67448;
      v96[4] = self;
      v96[5] = buf;
      v11 = (id)objc_msgSend(v10, "sinkWithCompletion:receiveInput:", v97, v96);

      _Block_object_dispose(buf, 8);
    }
    objc_msgSend(v70, "elements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_pas_filteredArrayWithTest:", &__block_literal_global_10);
    v65 = objc_claimAutoreleasedReturnValue();

    -[NSObject sortedArrayUsingComparator:](v65, "sortedArrayUsingComparator:", &__block_literal_global_6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_new();
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v93 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * i), "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v19);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
      }
      while (v16);
    }

    v67 = (id)objc_opt_new();
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = v15;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v89;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v89 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
          -[_DKApplicationMonitor currentFrontBoardElements](self, "currentFrontBoardElements");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
            v27 = 2;
          else
            v27 = 1;
          -[_DKApplicationMonitor _elementFromDisplayLayoutElement:displayLayout:context:changeType:](self, "_elementFromDisplayLayoutElement:displayLayout:context:changeType:", v23, v70, v69, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26 && objc_msgSend(v26, "dk_isDuplicateOf:", v28))
          {
            -[_DKMonitor log](self, "log");
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              -[_DKApplicationMonitor(BMFrontBoardDisplayElement) donateElementsFromDisplayLayout:withContext:].cold.3(&v86, v87, v29);

          }
          else
          {
            objc_msgSend(v67, "addObject:", v28);
          }

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
      }
      while (v20);
    }

    v30 = (void *)objc_opt_new();
    -[_DKApplicationMonitor currentFrontBoardElements](self, "currentFrontBoardElements");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x24BDAC760];
    v81[1] = 3221225472;
    v81[2] = __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_10;
    v81[3] = &unk_24DA674D0;
    v63 = v14;
    v82 = v63;
    v83 = self;
    v32 = v70;
    v84 = v32;
    v64 = v30;
    v85 = v64;
    objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v81);

    -[_DKApplicationMonitor displayElementSource](self, "displayElementSource");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v71 = v33;
    }
    else
    {
      -[_DKApplicationMonitor displayElementStream](self, "displayElementStream");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "source");
      v71 = (id)objc_claimAutoreleasedReturnValue();
      -[_DKApplicationMonitor setDisplayElementSource:](self, "setDisplayElementSource:", v71);

    }
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v68 = v67;
    v37 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
    if (v37)
    {
      v38 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v37; ++k)
        {
          if (*(_QWORD *)v78 != v38)
            objc_enumerationMutation(v68);
          v40 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * k);
          objc_msgSend(v32, "timestamp");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "timeIntervalSinceReferenceDate");
          objc_msgSend(v71, "sendEvent:timestamp:", v40);

          -[_DKApplicationMonitor _updateCurrentElementsWithDisplayElement:](self, "_updateCurrentElementsWithDisplayElement:", v40);
          -[_DKMonitor log](self, "log");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v40, "changeType");
            BMFrontBoardDisplayElementChangeTypeAsString();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "identifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "bundleIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v43;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v44;
            *(_WORD *)&buf[22] = 2112;
            v103 = v45;
            _os_log_debug_impl(&dword_219056000, v42, OS_LOG_TYPE_DEBUG, "BMFrontBoardDisplayElement - Writing %@ event for identifier: %@ bundleIdentifier: %@", buf, 0x20u);

          }
        }
        v37 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v77, v99, 16);
      }
      while (v37);
    }

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v46 = v64;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v98, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v74;
      do
      {
        for (m = 0; m != v47; ++m)
        {
          if (*(_QWORD *)v74 != v48)
            objc_enumerationMutation(v46);
          v50 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * m);
          objc_msgSend(v32, "timestamp");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "timeIntervalSinceReferenceDate");
          objc_msgSend(v71, "sendEvent:timestamp:", v50);

          -[_DKApplicationMonitor _updateCurrentElementsWithDisplayElement:](self, "_updateCurrentElementsWithDisplayElement:", v50);
          -[_DKMonitor log](self, "log");
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v50, "changeType");
            BMFrontBoardDisplayElementChangeTypeAsString();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "identifier");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "bundleIdentifier");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v53;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v54;
            *(_WORD *)&buf[22] = 2112;
            v103 = v55;
            _os_log_debug_impl(&dword_219056000, v52, OS_LOG_TYPE_DEBUG, "BMFrontBoardDisplayElement - Writing %@ event for identifier: %@ bundleIdentifier: %@", buf, 0x20u);

          }
        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v98, 16);
      }
      while (v47);
    }

    -[_DKMonitor log](self, "log");
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      -[_DKApplicationMonitor(BMFrontBoardDisplayElement) donateElementsFromDisplayLayout:withContext:].cold.2(v56, v57, v58);

    -[_DKApplicationMonitor currentFrontBoardElements](self, "currentFrontBoardElements");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x24BDAC760];
    v72[1] = 3221225472;
    v72[2] = __97___DKApplicationMonitor_BMFrontBoardDisplayElement__donateElementsFromDisplayLayout_withContext___block_invoke_12;
    v72[3] = &unk_24DA674F8;
    v72[4] = self;
    objc_msgSend(v59, "enumerateKeysAndObjectsUsingBlock:", v72);

    -[_DKMonitor log](self, "log");
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      -[_DKApplicationMonitor(BMFrontBoardDisplayElement) donateElementsFromDisplayLayout:withContext:].cold.1(v60, v61, v62);

    v35 = v65;
  }
  else
  {
    -[_DKMonitor log](self, "log");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219056000, v35, OS_LOG_TYPE_INFO, "BMFrontBoardDisplayElement - Waiting for first unlock before donating event", buf, 2u);
    }
  }

}

- (NSMutableDictionary)currentFrontBoardElements
{
  return self->_currentFrontBoardElements;
}

- (void)_updateCurrentElementsWithDisplayElement:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[_DKMonitor log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_DKApplicationMonitor(BMFrontBoardDisplayElement) _updateCurrentElementsWithDisplayElement:].cold.1((uint64_t)v4, v7);
    goto LABEL_9;
  }
  v6 = objc_msgSend(v4, "changeType");
  if ((v6 - 1) < 2)
  {
    -[_DKApplicationMonitor currentFrontBoardElements](self, "currentFrontBoardElements");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v4, v8);
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  if (v6 == 3)
  {
    -[_DKApplicationMonitor currentFrontBoardElements](self, "currentFrontBoardElements");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v7, "removeObjectForKey:", v8);
    goto LABEL_8;
  }
LABEL_10:

}

- (id)focalApplicationFromDisplayLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  __CFString *v26;
  _DKApplicationMonitor *v28;
  void *v29;
  id v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "elements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DKMonitor log](self, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_DKApplicationMonitor focalApplicationFromDisplayLayout:].cold.3();

  if (objc_msgSend(v4, "displayBacklightLevel"))
  {
    v28 = self;
    v30 = v4;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = v6;
    obj = v6;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v33 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14)
          {
            v16 = v14;
          }
          else
          {
            objc_msgSend(v13, "identifier");
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          v17 = v16;

          if (objc_msgSend(&unk_24DA70F10, "containsObject:", v17))
          {

            v17 = &stru_24DA67840;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "level"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = v18;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "hasKeyboardFocus"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v36[1] = v19;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v13, "layoutRole"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v36[2] = v20;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v17, v21);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v10);
    }

    -[NSObject allKeys](v8, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sortedArrayUsingComparator:", &__block_literal_global_48);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject objectsForKeys:notFoundMarker:](v8, "objectsForKeys:notFoundMarker:", v23, &stru_24DA67840);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKMonitor log](v28, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[_DKApplicationMonitor focalApplicationFromDisplayLayout:].cold.2();

    objc_msgSend(v24, "firstObject");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v6 = v29;
    v4 = v30;
  }
  else
  {
    -[_DKMonitor log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_DKApplicationMonitor focalApplicationFromDisplayLayout:].cold.1(v8);
    v26 = &stru_24DA67840;
  }

  return v26;
}

- (BMStream)displayElementStream
{
  return self->_displayElementStream;
}

- (BMSource)displayElementSource
{
  return self->_displayElementSource;
}

- (id)_newElementFromExistingDisplayElement:(id)a3 newTimestamp:(id)a4 newChangeType:(int)a5
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v29;
  unsigned int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;

  v6 = (objc_class *)MEMORY[0x24BE0C3C8];
  v37 = a4;
  v7 = a3;
  v35 = [v6 alloc];
  objc_msgSend(v7, "display");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v34, "type");
  objc_msgSend(v7, "display");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "display");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "deviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "display");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hardwareIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "display");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "interfaceOrientation");
  objc_msgSend(v7, "display");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "backlightStatus");
  objc_msgSend(v7, "display");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transitionReasons");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "initWithType:name:deviceName:hardwareIdentifier:interfaceOrientation:backlightStatus:transitionReasons:", v30, v8, v9, v10, v12, v14, v16);

  v17 = objc_alloc(MEMORY[0x24BE0C3C0]);
  objc_msgSend(v7, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v7, "elementType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v7, "layoutRole"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v7, "level"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "hasKeyboardFocus"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDD16E0];
  v25 = objc_msgSend(v7, "isUIApplicationElement");

  objc_msgSend(v24, "numberWithBool:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = a5;
  v27 = (void *)objc_msgSend(v17, "initWithAbsoluteTimestamp:identifier:bundleIdentifier:elementType:layoutRole:level:hasKeyboardFocus:isUIApplicationElement:display:changeType:", v37, v18, v19, v20, v21, v22, v23, v26, v36, v29);

  return v27;
}

- (_DKApplicationMonitor)init
{
  _DKApplicationMonitor *v2;
  _DKApplicationMonitor *v3;
  void *v4;
  _QWORD v6[4];
  _DKApplicationMonitor *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DKApplicationMonitor;
  v2 = -[_DKApplicationMonitorBase init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BE7A5D0];
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __29___DKApplicationMonitor_init__block_invoke;
    v6[3] = &unk_24DA66D10;
    v7 = v2;
    objc_msgSend(v4, "runBlockWhenDeviceIsClassCUnlocked:", v6);

  }
  return v3;
}

+ (id)entitlements
{
  return &unk_24DA70EC8;
}

- (void)platformSpecificStart
{
  NSMutableDictionary *v3;
  NSMutableDictionary *activeExtensions;
  NSString *lastFocalApplication;
  void *v6;
  void *v7;
  void *v8;
  FBSDisplayLayoutMonitor *v9;
  FBSDisplayLayoutMonitor *layoutMonitor;
  RBSProcessMonitor *v11;
  RBSProcessMonitor *processMonitor;
  _QWORD v13[5];

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  activeExtensions = self->_activeExtensions;
  self->_activeExtensions = v3;

  lastFocalApplication = self->_lastFocalApplication;
  self->_lastFocalApplication = (NSString *)&stru_24DA67840;

  v6 = (void *)MEMORY[0x24BE38438];
  objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKApplicationMonitor displayLayoutTransitionHandler](self, "displayLayoutTransitionHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTransitionHandler:", v8);

  objc_msgSend(v6, "monitorWithConfiguration:", v7);
  v9 = (FBSDisplayLayoutMonitor *)objc_claimAutoreleasedReturnValue();
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v9;

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __46___DKApplicationMonitor_platformSpecificStart__block_invoke;
  v13[3] = &unk_24DA67360;
  v13[4] = self;
  objc_msgSend(MEMORY[0x24BE80CC8], "monitorWithConfiguration:", v13);
  v11 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
  processMonitor = self->_processMonitor;
  self->_processMonitor = v11;

}

- (void)platformSpecificStop
{
  FBSDisplayLayoutMonitor *layoutMonitor;
  RBSProcessMonitor *processMonitor;
  NSMutableDictionary *activeExtensions;
  NSString *lastFocalApplication;

  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = 0;

  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
  processMonitor = self->_processMonitor;
  self->_processMonitor = 0;

  activeExtensions = self->_activeExtensions;
  self->_activeExtensions = 0;

  lastFocalApplication = self->_lastFocalApplication;
  self->_lastFocalApplication = 0;

}

- (void)obtainCurrentValue
{
  void *v3;
  id v4;

  -[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKApplicationMonitor focalApplicationFromDisplayLayout:](self, "focalApplicationFromDisplayLayout:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[_DKApplicationMonitorBase updateContextStoreWithFocalApplication:launchReason:](self, "updateContextStoreWithFocalApplication:launchReason:", v4, &stru_24DA67840);
}

- (id)displayLayoutTransitionHandler
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55___DKApplicationMonitor_displayLayoutTransitionHandler__block_invoke;
  v4[3] = &unk_24DA675C8;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x219A29428](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (BOOL)ignoreAppExtension:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = ignoreAppExtension__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&ignoreAppExtension__onceToken, &__block_literal_global_60);
  v5 = objc_msgSend((id)ignoreAppExtension__ignoreList, "containsObject:", v4);

  return v5;
}

- (void)processMonitor:(id)a3 didUpdateState:(id)a4 forProcess:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BMSource *appInFocusSource;
  uint64_t v35;
  const __CFString *v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  int v50;
  BMSource *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  int v55;
  id v56;
  void *v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  _QWORD v67[2];
  _QWORD v68[4];

  v68[2] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "embeddedApplicationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v8, "xpcServiceIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v12 = v13;
    }
    else
    {
      objc_msgSend(v8, "bundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  if (objc_msgSend(v8, "isXPCService")
    && !-[_DKApplicationMonitor ignoreAppExtension:](self, "ignoreAppExtension:", v12))
  {
    v58 = 0;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v12, &v58);
    v17 = v58;
    if (v17)
    {
      -[_DKMonitor log](self, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[_DKApplicationMonitor processMonitor:didUpdateState:forProcess:].cold.1();
      v19 = 0;
    }
    else
    {
      objc_msgSend(v16, "containingBundleRecord");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bundleIdentifier");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "hostProcess");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "identifier");
      v18 = objc_claimAutoreleasedReturnValue();

      if ((-[__CFString isEqual:](v19, "isEqual:", CFSTR("com.apple.PosterBoard")) & 1) == 0
        && (-[__CFString isEqual:](v19, "isEqual:", CFSTR("com.apple.PaperBoard")) & 1) == 0
        && (-[NSObject isEqual:](v18, "isEqual:", CFSTR("com.apple.PosterBoard")) & 1) == 0
        && (-[NSObject isEqual:](v18, "isEqual:", CFSTR("com.apple.PaperBoard")) & 1) == 0)
      {
        if (!-[NSObject isEqual:](v18, "isEqual:", CFSTR("com.apple.springboard"))
          || (objc_msgSend(v12, "lowercaseString"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              v24 = objc_msgSend(v23, "containsString:", CFSTR("poster")),
              v23,
              (v24 & 1) == 0))
        {
          objc_msgSend(v7, "state");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v25, "isRunning");

          objc_msgSend(v7, "state");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "endowmentNamespaces");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v27, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

          v28 = v55 & v53;
          v50 = v55 & v53;
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v29 = objc_claimAutoreleasedReturnValue();
          v56 = objc_alloc(MEMORY[0x24BE0C288]);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v56;
          v57 = (void *)v29;
          v54 = (void *)objc_msgSend(v31, "initWithLaunchReason:launchType:starting:absoluteTimestamp:duration:bundleID:parentBundleID:extensionHostID:shortVersionString:exactVersionString:", 0, 2, v30, v29, 0, v12, v19, v18, 0, 0);

          -[NSMutableDictionary objectForKeyedSubscript:](self->_activeExtensions, "objectForKeyedSubscript:", v12);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32;
          if (v50 == 1)
          {

            if (!v33)
            {
              appInFocusSource = self->_appInFocusSource;
              objc_msgSend(v57, "timeIntervalSinceReferenceDate");
              -[BMSource sendEvent:timestamp:](appInFocusSource, "sendEvent:timestamp:", v54);
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeExtensions, "setObject:forKeyedSubscript:", v57, v12);
            }
          }
          else
          {

            if (v33)
            {
              v51 = self->_appInFocusSource;
              objc_msgSend(v57, "timeIntervalSinceReferenceDate");
              -[BMSource sendEvent:timestamp:](v51, "sendEvent:timestamp:", v54);
              -[NSMutableDictionary objectForKeyedSubscript:](self->_activeExtensions, "objectForKeyedSubscript:", v12);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = v57;
              v47 = (void *)MEMORY[0x24BE1B080];
              objc_msgSend(MEMORY[0x24BE1B130], "appInFocusStream");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BE1B050], "withBundle:", v12);
              v35 = objc_claimAutoreleasedReturnValue();
              v44 = (void *)v35;
              objc_msgSend(MEMORY[0x24BE1B020], "extensionHostIdentifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v67[0] = v46;
              v36 = &stru_24DA67840;
              if (v18)
                v36 = (const __CFString *)v18;
              v68[0] = v36;
              objc_msgSend(MEMORY[0x24BE1B020], "extensionContainingBundleIdentifier");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v67[1] = v45;
              v37 = &stru_24DA67840;
              if (v19)
                v37 = v19;
              v68[1] = v37;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "eventWithStream:startDate:endDate:value:metadata:", v48, v52, v49, v35, v38);
              v39 = objc_claimAutoreleasedReturnValue();

              v40 = (void *)v39;
              if (v39)
              {
                -[_DKMonitor setCurrentEvent:inferHistoricalState:](self, "setCurrentEvent:inferHistoricalState:", v39, 1);
                -[NSMutableDictionary removeObjectForKey:](self->_activeExtensions, "removeObjectForKey:", v12);
              }
              else
              {
                -[_DKMonitor log](self, "log");
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x24BE1B130], "appInFocusStream");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BE1B050], "withBundle:", v12);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138413058;
                  v60 = v42;
                  v61 = 2112;
                  v62 = v52;
                  v63 = 2112;
                  v64 = v49;
                  v65 = 2112;
                  v66 = v43;
                  _os_log_error_impl(&dword_219056000, v41, OS_LOG_TYPE_ERROR, "Failed to create _DKEvent: {%@, %@, %@, %@}", buf, 0x2Au);

                  v40 = 0;
                }

              }
            }
          }

        }
      }
    }

  }
}

- (id)processUpdateHandler
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45___DKApplicationMonitor_processUpdateHandler__block_invoke;
  v4[3] = &unk_24DA673B0;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x219A29428](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)setDisplayElementStream:(id)a3
{
  objc_storeStrong((id *)&self->_displayElementStream, a3);
}

- (void)setDisplayElementSource:(id)a3
{
  objc_storeStrong((id *)&self->_displayElementSource, a3);
}

- (void)setCurrentFrontBoardElements:(id)a3
{
  objc_storeStrong((id *)&self->_currentFrontBoardElements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentFrontBoardElements, 0);
  objc_storeStrong((id *)&self->_displayElementSource, 0);
  objc_storeStrong((id *)&self->_displayElementStream, 0);
  objc_storeStrong((id *)&self->_activeExtensions, 0);
  objc_storeStrong((id *)&self->_lastFocalApplication, 0);
  objc_storeStrong((id *)&self->_appInFocusSource, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
}

- (void)focalApplicationFromDisplayLayout:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_219056000, log, OS_LOG_TYPE_DEBUG, "Screen is off", v1, 2u);
}

- (void)focalApplicationFromDisplayLayout:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_219056000, v0, OS_LOG_TYPE_DEBUG, "Applications: %@ Ordered applications: %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)focalApplicationFromDisplayLayout:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_219056000, v0, v1, "Layout monitor filtered elements: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)layoutMonitor:didUpdateDisplayLayout:withContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_219056000, v0, v1, "BMAppInFocus started %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)layoutMonitor:didUpdateDisplayLayout:withContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_219056000, v0, v1, "BMAppInFocus stopped %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)layoutMonitor:(void *)a1 didUpdateDisplayLayout:(NSObject *)a2 withContext:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "transitionReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_debug_impl(&dword_219056000, a2, OS_LOG_TYPE_DEBUG, "Transition reasons: %@", v4, 0xCu);

}

- (void)layoutMonitor:didUpdateDisplayLayout:withContext:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_219056000, v0, v1, "Transition reason: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)layoutMonitor:didUpdateDisplayLayout:withContext:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_219056000, v0, v1, "Frontmost application: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)processMonitor:didUpdateState:forProcess:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_219056000, v0, OS_LOG_TYPE_ERROR, "Failed to look up extension record for identifier %@, error, %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
