@implementation CDPDFollowUpController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_7);
  return (id)sharedInstance_instance_0;
}

void __40__CDPDFollowUpController_sharedInstance__block_invoke()
{
  CDPDFollowUpController *v0;
  void *v1;

  v0 = objc_alloc_init(CDPDFollowUpController);
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v0;

}

- (CDPDFollowUpController)init
{
  CDPDFollowUpController *v2;
  void *v3;
  CDPDFollowUpFactory *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CDPDFollowUpController;
  v2 = -[CDPDFollowUpController init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.corecdp"));
    -[CDPDFollowUpController setFollowUpController:](v2, "setFollowUpController:", v3);

    v4 = objc_alloc_init(CDPDFollowUpFactory);
    -[CDPDFollowUpController setFollowUpFactory:](v2, "setFollowUpFactory:", v4);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CDPDFollowUpController;
  -[CDPDFollowUpController dealloc](&v2, sel_dealloc);
}

- (BOOL)_isNotAudioAccessory
{
  return objc_msgSend(MEMORY[0x24BE1A4A0], "isAudioAccessory") ^ 1;
}

+ (id)_identifiersAllowedForTelemetry
{
  if (_identifiersAllowedForTelemetry_onceToken != -1)
    dispatch_once(&_identifiersAllowedForTelemetry_onceToken, &__block_literal_global_28_0);
  return (id)_identifiersAllowedForTelemetry_allowlistedFollowUpIdentifiers;
}

void __57__CDPDFollowUpController__identifiersAllowedForTelemetry__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24C836828);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_identifiersAllowedForTelemetry_allowlistedFollowUpIdentifiers;
  _identifiersAllowedForTelemetry_allowlistedFollowUpIdentifiers = v0;

}

- (BOOL)_postFollowUpItem:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v23;

  v8 = a3;
  v9 = (void *)MEMORY[0x24BDFC2A0];
  v10 = *MEMORY[0x24BE1A5F0];
  v11 = *MEMORY[0x24BE1A860];
  v12 = a4;
  objc_msgSend(v9, "analyticsEventWithFollowUpContext:eventName:category:", v12, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpController _followUpControllerForContext:](self, "_followUpControllerForContext:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v15 = objc_msgSend(v14, "postFollowUpItem:error:", v8, &v23);
  v16 = v23;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE1A640]);

  objc_msgSend((id)objc_opt_class(), "_identifiersAllowedForTelemetry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v18, "containsObject:", v19);

  if ((_DWORD)v12)
  {
    objc_msgSend(v8, "uniqueIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE1A608]);
  }
  else
  {
    _CDPLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[CDPDFollowUpController _postFollowUpItem:context:error:].cold.1(v8, v20);
  }

  objc_msgSend(v13, "populateUnderlyingErrorsStartingWithRootError:", v16);
  objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sendEvent:", v13);

  if (a5)
    *a5 = objc_retainAutorelease(v16);

  return v15;
}

- (BOOL)_clearFollowUpForContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[CDPDFollowUpFactory identifierForContext:](self->_followUpFactory, "identifierForContext:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v7;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Clearing a follow up: (%@) - %@\", buf, 0x16u);
  }

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDFC2A0], "analyticsEventWithFollowUpContext:eventName:category:", v6, *MEMORY[0x24BE1A5E8], *MEMORY[0x24BE1A860]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDFollowUpController _followUpControllerForContext:](self, "_followUpControllerForContext:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v12 = objc_msgSend(v10, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v11, &v19);
    v13 = v19;

    if (a4)
      *a4 = objc_retainAutorelease(v13);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE1A640]);

    objc_msgSend((id)objc_opt_class(), "_identifiersAllowedForTelemetry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v15, "containsObject:", v7);

    if ((_DWORD)v14)
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE1A608]);
    }
    else
    {
      _CDPLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[CDPDFollowUpController _clearFollowUpForContext:error:].cold.1();

    }
    objc_msgSend(v9, "populateUnderlyingErrorsStartingWithRootError:", v13);
    objc_msgSend(MEMORY[0x24BE1A3E0], "rtcAnalyticsReporter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendEvent:", v9);

  }
  else if (a4)
  {
    _CDPStateError();
    LOBYTE(v12) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)postFollowUpItemForContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  BOOL v14;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  _QWORD *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  BOOL v65;
  NSObject *v66;
  char v67;
  void *v68;
  BOOL v69;
  void *v70;
  int v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _QWORD v85[2];
  _QWORD v86[2];
  uint64_t v87;
  uint64_t v88;
  _QWORD v89[2];
  uint64_t v90;
  uint64_t v91;
  const __CFString *v92;
  uint8_t buf[4];
  id v94;
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!objc_msgSend(MEMORY[0x24BE1A4A0], "hasFullCDPSupport")
    || !-[CDPDFollowUpController _isNotAudioAccessory](self, "_isNotAudioAccessory"))
  {
    _CDPLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"posting followup is not supported in current configuration\", buf, 2u);
    }
    goto LABEL_13;
  }
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v94 = v6;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Processing request for context: %@\", buf, 0xCu);
  }

  -[CDPDFollowUpController followUpFactory](self, "followUpFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "followUpItemWithContext:", v6);
  v9 = objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (a4)
    {
      _CDPStateError();
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    goto LABEL_73;
  }
  objc_msgSend(v6, "followUpType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE1A388]) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE1A448], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasLocalSecret");

    if ((v12 & 1) == 0)
    {
      _CDPLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[CDPDFollowUpController postFollowUpItemForContext:error:].cold.7();

      goto LABEL_13;
    }
  }
  else
  {

  }
  if (objc_msgSend(MEMORY[0x24BE1A4A0], "isInternalBuild"))
  {
    -[CDPDFollowUpController informativeText](self, "informativeText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject informativeText](v9, "informativeText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setInformativeText:](v9, "setInformativeText:", v19);

    -[NSObject notification](v9, "notification");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "informativeText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingString:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject notification](v9, "notification");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setInformativeText:", v22);

  }
  -[CDPDFollowUpController followUpController](self, "followUpController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = CFSTR("RepairCDPState");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v92, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v25, a4);

  if ((objc_msgSend(v6, "isDefaultRepairOrSOSCompatibilityFollowUp") & 1) == 0)
  {
    v16 = -[CDPDFollowUpController _postFollowUpItem:context:error:](self, "_postFollowUpItem:context:error:", v9, v6, a4);
LABEL_73:

    v14 = v16;
    goto LABEL_14;
  }
  v79 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v6, "altDSID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "altDSID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAltDSID:", v29);

  }
  v30 = (void *)MEMORY[0x24BE1A3E8];
  objc_msgSend(v6, "altDSID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "syncingStatusForAltDSID:", v31);

  v33 = (void *)MEMORY[0x24BE1A488];
  objc_msgSend(v6, "altDSID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "syncingStatusForAltDSID:", v34);

  objc_msgSend(v6, "altDSID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpController _hasSOSActiveDeviceForAltDSID:](self, "_hasSOSActiveDeviceForAltDSID:", v36);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "altDSID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpController _sosCompatibilityModeContext:](self, "_sosCompatibilityModeContext:", v37);
  v38 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "altDSID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPDFollowUpController _cdpRepairContext:](self, "_cdpRepairContext:", v39);
  v40 = objc_claimAutoreleasedReturnValue();

  v76 = (void *)v38;
  v77 = (void *)v40;
  v75 = v35;
  if (v32 != 1)
  {
    _CDPLogSystem();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      -[CDPDFollowUpController postFollowUpItemForContext:error:].cold.6();

    v91 = v38;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v91, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObjectsFromArray:", v45);

    v90 = v40;
    v46 = (void *)MEMORY[0x24BDBCE30];
    v47 = &v90;
    goto LABEL_34;
  }
  if (v35 == 1)
  {
LABEL_38:
    _CDPLogSystem();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      -[CDPDFollowUpController postFollowUpItemForContext:error:].cold.3();

    v85[0] = v40;
    v85[1] = v38;
    v42 = (void *)MEMORY[0x24BDBCE30];
    v43 = v85;
    goto LABEL_41;
  }
  if (v35)
  {
    if ((objc_msgSend(v78, "BOOLValue") & 1) == 0 && v78)
    {
      if ((objc_msgSend(v78, "BOOLValue") & 1) == 0)
      {
        _CDPLogSystem();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          -[CDPDFollowUpController postFollowUpItemForContext:error:].cold.4();

        v86[0] = v40;
        v86[1] = v38;
        v42 = (void *)MEMORY[0x24BDBCE30];
        v43 = v86;
        goto LABEL_41;
      }
      goto LABEL_38;
    }
    _CDPLogSystem();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      -[CDPDFollowUpController postFollowUpItemForContext:error:].cold.2();

    v88 = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v88, 1);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObjectsFromArray:", v73);

    v87 = v38;
    v46 = (void *)MEMORY[0x24BDBCE30];
    v47 = &v87;
LABEL_34:
    objc_msgSend(v46, "arrayWithObjects:count:", v47, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v79;
    objc_msgSend(v79, "addObjectsFromArray:", v48);
    goto LABEL_42;
  }
  _CDPLogSystem();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    -[CDPDFollowUpController postFollowUpItemForContext:error:].cold.5();

  v89[0] = v40;
  v89[1] = v38;
  v42 = (void *)MEMORY[0x24BDBCE30];
  v43 = v89;
LABEL_41:
  objc_msgSend(v42, "arrayWithObjects:count:", v43, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObjectsFromArray:", v48);
  v49 = v79;
LABEL_42:

  if (objc_msgSend(v49, "count"))
  {
    _CDPLogSystem();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DB2C000, v51, OS_LOG_TYPE_DEFAULT, "\"_handleCDPRepairCFUPosting - tearing down RK Mismatch healing CFU to post CDP Repair CFU\", buf, 2u);
    }

    objc_msgSend(v6, "altDSID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDFollowUpController _rkMismatchHealingContext:](self, "_rkMismatchHealingContext:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "addObject:", v53);
  }
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v54 = v26;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v81 != v57)
          objc_enumerationMutation(v54);
        -[CDPDFollowUpController clearFollowUpWithContext:error:](self, "clearFollowUpWithContext:error:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * i), 0);
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
    }
    while (v56);
  }

  objc_msgSend(v49, "firstObject");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(v49, "firstObject");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDFollowUpController followUpFactory](self, "followUpFactory");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "followUpItemWithContext:", v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v60, "followUpType");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = *MEMORY[0x24BE1A3B8];
    if (objc_msgSend(v63, "isEqualToString:", *MEMORY[0x24BE1A3B8]))
    {
      v65 = +[CDPDOctagonTrustProxyImpl octagonIsSOSFeatureEnabled](CDPDOctagonTrustProxyImpl, "octagonIsSOSFeatureEnabled");

      if (!v65)
      {
        _CDPLogSystem();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
          -[CDPDFollowUpController postFollowUpItemForContext:error:].cold.1();

        v67 = 0;
        v16 = 0;
        v49 = v79;
        goto LABEL_68;
      }
    }
    else
    {

    }
    v16 = -[CDPDFollowUpController _postFollowUpItem:context:error:](self, "_postFollowUpItem:context:error:", v62, v60, a4);

    v49 = v79;
  }
  else
  {
    v16 = 0;
    v64 = *MEMORY[0x24BE1A3B8];
  }
  objc_msgSend(v6, "followUpType");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v68, "isEqualToString:", v64))
    v69 = v75 == 1;
  else
    v69 = 1;
  if (v69)
  {

    v67 = 1;
LABEL_68:
    v70 = v78;
    goto LABEL_72;
  }
  v70 = v78;
  v71 = objc_msgSend(v78, "BOOLValue");

  if (!v71)
    v16 = 1;
  v67 = 1;
LABEL_72:

  if ((v67 & 1) != 0)
    goto LABEL_73;
LABEL_13:

  v14 = 0;
LABEL_14:

  return v14;
}

- (id)_makeAAFLFollowUpController
{
  id v2;

  v2 = objc_alloc(MEMORY[0x24BE1B3A8]);
  return (id)objc_msgSend(v2, "initWithClientIdentifier:", *MEMORY[0x24BE04830]);
}

- (id)_sosCompatibilityModeContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE1A428];
  v4 = a3;
  objc_msgSend(v3, "contextForSOSCompatibilityMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAltDSID:", v4);

  return v5;
}

- (id)_cdpRepairContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE1A428];
  v4 = a3;
  objc_msgSend(v3, "contextForStateRepair");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAltDSID:", v4);

  return v5;
}

- (id)_rkMismatchHealingContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE1A428];
  v4 = a3;
  objc_msgSend(v3, "contextForRecoveryKeyMismatchHealing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAltDSID:", v4);

  return v5;
}

- (id)_hasSOSActiveDeviceForAltDSID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BE0AC98];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authKitAccountWithAltDSID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hasSOSActiveDeviceForAccount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)clearFollowUpWithContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "followUpType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "followUpType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE1A3C0]);

    v10 = -[CDPDFollowUpController _clearFollowUpForContext:error:](self, "_clearFollowUpForContext:error:", v6, a4);
    if (v9)
    {
      -[CDPDFollowUpController followUpController](self, "followUpController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = CFSTR("RepairCDPState");
      v12 = 1;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v13, a4);

    }
    else
    {
      v12 = v10;
    }
  }
  else if (a4)
  {
    _CDPStateError();
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)informativeText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("KEYCHAIN_FOLLOWUP_INTERNAL_BLAME"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), 0, v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_24C821FD0;
  }

  return v7;
}

- (void)securityLevelChangedForAccountContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (objc_msgSend(v4, "isSharediPad"))
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"CDPDFollowUpController: Manatee is not available on Shared iPad - no CFU needed\", v8, 2u);
    }

  }
  else if (objc_msgSend(v4, "isHSA2Account"))
  {
    objc_msgSend(MEMORY[0x24BE1A428], "contextForStateRepair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRepairType:", 1);
    objc_msgSend(v4, "altDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAltDSID:", v7);

    -[CDPDFollowUpController postFollowUpItemForContext:error:](self, "postFollowUpItemForContext:error:", v6, 0);
  }

}

- (id)_followUpControllerForContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "followUpType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE1A3B0]);

  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.purplebuddy"));
  }
  else
  {
    objc_msgSend(v4, "followUpType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE1A3C0]))
    {

    }
    else
    {
      objc_msgSend(v4, "followUpType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE1A398]);

      if (!v10)
      {
        -[CDPDFollowUpController followUpController](self, "followUpController");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    -[CDPDFollowUpController _makeAAFLFollowUpController](self, "_makeAAFLFollowUpController");
    v7 = objc_claimAutoreleasedReturnValue();
  }
LABEL_8:
  v11 = (void *)v7;

  return v11;
}

- (BOOL)hasPendingFollowUpWithUniqueIdentifier:(id)a3
{
  id v4;
  FLFollowUpController *followUpController;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *i;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  followUpController = self->_followUpController;
  v21 = 0;
  -[FLFollowUpController pendingFollowUpItems:](followUpController, "pendingFollowUpItems:", &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v6;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; i = ((char *)i + 1))
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "uniqueIdentifier", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v4, "isEqualToString:", v14);

          if (v15)
          {
            _CDPLogSystem();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v4;
              _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Found CFU with uniqueIdentifier %@\", buf, 0xCu);
            }

            LOBYTE(v11) = 1;
            goto LABEL_20;
          }
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
        if (v11)
          continue;
        break;
      }
    }
  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CDPDFollowUpController hasPendingFollowUpWithUniqueIdentifier:].cold.1();
    LOBYTE(v11) = 0;
  }
LABEL_20:

  return (char)v11;
}

- (FLFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
  objc_storeStrong((id *)&self->_followUpController, a3);
}

- (CDPDFollowUpFactory)followUpFactory
{
  return self->_followUpFactory;
}

- (void)setFollowUpFactory:(id)a3
{
  objc_storeStrong((id *)&self->_followUpFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpFactory, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
}

- (void)_postFollowUpItem:(void *)a1 context:(NSObject *)a2 error:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_20DB2C000, a2, v4, "\"CDP was requested to post a non-allowed CFU: %@\", v5);

}

- (void)_clearFollowUpForContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_20DB2C000, v0, v1, "\"CDP was requested to clear a non-allowed CFU: %@\", v2);
  OUTLINED_FUNCTION_4();
}

- (void)postFollowUpItemForContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Will not post Compatability Mode CFU on platforms that do not support SOS\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)postFollowUpItemForContext:error:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_20DB2C000, v0, OS_LOG_TYPE_DEBUG, "@\"_handleCDPRepairCFUPosting - In OT but not in SOS circle, with hasSOSActiveDevice = %@, clear CDP Repair CFU and posting SOS Compatibility Mode CFU\", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)postFollowUpItemForContext:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "@\"_handleCDPRepairCFUPosting - In both OT and SOS circle, clear both CFUs\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)postFollowUpItemForContext:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "@\"_handleCDPRepairCFUPosting - In OT but not in SOS circle, with hasSOSActiveDevice set to false, clear both CFUs for SOS rot\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)postFollowUpItemForContext:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "@\"_handleCDPRepairCFUPosting - In OT but SOS compatibility mode is off, clearing CDP Repair and SOS Compatibility Mode CFU\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)postFollowUpItemForContext:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "@\"_handleCDPRepairCFUPosting - Not in OT circle, clearing SOS Compatibility Mode CFU and posting CDP Repair CFU\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)postFollowUpItemForContext:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_20DB2C000, v0, v1, "\"Will not post Confirm Existing Secret CFU if user has no existing Local Secret or their Local Secret is the same as their iCloud Login\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)hasPendingFollowUpWithUniqueIdentifier:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_20DB2C000, v0, OS_LOG_TYPE_ERROR, "\"Failed to fetch any pending CFUs, error: %{public}@\", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

@end
