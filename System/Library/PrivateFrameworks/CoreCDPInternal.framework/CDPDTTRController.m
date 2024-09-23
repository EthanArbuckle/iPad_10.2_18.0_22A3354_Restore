@implementation CDPDTTRController

- (void)requestTTRWithTitle:(id)a3 message:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywords:(id)a8 fullDiagnostic:(BOOL)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v24;

  v16 = a10;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v24 = (id)objc_opt_new();
  objc_msgSend(v24, "setRadarTitle:", v22);

  objc_msgSend(v24, "setRadarDescription:", v21);
  objc_msgSend(v24, "setComponentName:", v20);

  objc_msgSend(v24, "setComponentID:", v18);
  objc_msgSend(v24, "setComponentVersion:", v19);

  objc_msgSend(v24, "setKeywords:", v17);
  objc_msgSend(v24, "setFullDiagnostic:", a9);
  -[CDPDTTRController _performTTRForRequest:completion:](self, "_performTTRForRequest:completion:", v24, v16);

}

- (void)requestTTRIfSupportedForEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  CDPDTTRController *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BE1A4A0], "isInternalBuild") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE0ADF0], "sharedBag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationAtKey:", CFSTR("ttr-cfgs-v2"));
    v6 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v4, "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    -[CDPDTTRController _ttrInfoForEvent:forTTRConfigSupportedErrors:](self, "_ttrInfoForEvent:forTTRConfigSupportedErrors:", v4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cid"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    if (v12)
    {
      v29 = v9;
      objc_opt_class();
      -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("componentInfo"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;

      objc_opt_class();
      objc_msgSend(v14, "objectForKeyedSubscript:", v12);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v27 = self;

      objc_opt_class();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("cn"));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
      v28 = v14;

      objc_opt_class();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("cv"));
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;

      objc_opt_class();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("fla"));
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;

      objc_msgSend(v22, "lowercaseString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("y"));

      if (v18 && v20)
      {
        -[CDPDTTRController _triggerTTRForEvent:componentName:componentVersion:componentID:fullDiagnostic:](v27, "_triggerTTRForEvent:componentName:componentVersion:componentID:fullDiagnostic:", v4, v18, v20, v12, v24);
      }
      else
      {
        _AKLogSystem();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "eventName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v31 = v26;
          v32 = 2112;
          v33 = v12;
          v34 = 2112;
          v35 = v18;
          v36 = 2112;
          v37 = v20;
          _os_log_debug_impl(&dword_20DB2C000, v25, OS_LOG_TYPE_DEBUG, "Unable to send TTR for event %@. Component ID - %@, name - %@, version - %@", buf, 0x2Au);

        }
      }

      v9 = v29;
    }

  }
  else
  {
    _AKLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CDPDTTRController requestTTRIfSupportedForEvent:].cold.1(v6);
  }

}

- (void)_performTTRForRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  _QWORD v9[4];
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v5)
  {
    v8 = (void *)objc_opt_new();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __54__CDPDTTRController__performTTRForRequest_completion___block_invoke;
    v9[3] = &unk_24C81C0D0;
    v10 = v7;
    objc_msgSend(v8, "silentTapToRadarWithRequest:completion:", v5, v9);

LABEL_5:
    goto LABEL_6;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE0AC68], 3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);
    goto LABEL_5;
  }
LABEL_6:

}

void __54__CDPDTTRController__performTTRForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (*v5)(void);
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    if (v4)
    {
      v5 = *(void (**)(void))(v4 + 16);
      v6 = v3;
LABEL_6:
      v5();
      v3 = v6;
    }
  }
  else if (v4)
  {
    v5 = *(void (**)(void))(v4 + 16);
    v6 = 0;
    goto LABEL_6;
  }

}

- (id)_normalizedTTRErrorForEvent:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  BOOL v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v36 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = 0x24BDD1000uLL;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFC330]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = 0x24BDD1000uLL;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFC338]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v34 = v8;
  else
    v34 = 0;

  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDFC350]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  v11 = objc_msgSend(v10, "integerValue");
  v33 = v6;
  if (v6 && v34)
  {
    v43[0] = CFSTR("ec");
    objc_msgSend(v6, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = CFSTR("ed");
    v44[0] = v12;
    v44[1] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addEntriesFromDictionary:", v13);

    v14 = *MEMORY[0x24BDFC360];
    v15 = *MEMORY[0x24BDFC368];
    v16 = 1;
    v35 = v3;
    do
    {
      if (v11 < v16)
        break;
      objc_msgSend(*(id *)(v7 + 1992), "stringWithFormat:", CFSTR("%@%u"), v14, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v7 + 1992), "stringWithFormat:", CFSTR("%@%u"), v15, v16);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_msgSend(v3, "objectForKeyedSubscript:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v38 = (void *)v17;
      v19 = (objc_opt_isKindOfClass() & 1) != 0 ? v18 : 0;

      objc_opt_class();
      objc_msgSend(v3, "objectForKeyedSubscript:", v40);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = (objc_opt_isKindOfClass() & 1) != 0 ? v20 : 0;

      v22 = !v19 || v21 == 0;
      v23 = !v22;
      v39 = v23;
      if (!v22)
      {
        objc_msgSend(*(id *)(v7 + 1992), "stringWithFormat:", CFSTR("uec%lu"), v16);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v7 + 1992), "stringWithFormat:", CFSTR("ued%lu"), v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v37;
        objc_msgSend(v19, "stringValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v24;
        v42[0] = v25;
        v42[1] = v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
        v26 = v16;
        v27 = v15;
        v28 = v14;
        v29 = v11;
        v30 = v4;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addEntriesFromDictionary:", v31);

        v4 = v30;
        v11 = v29;
        v14 = v28;
        v15 = v27;

        v3 = v35;
        v7 = 0x24BDD1000;

        v16 = (v26 + 1);
      }

    }
    while (v39);
  }

  return v36;
}

- (void)_triggerTTRForEvent:(id)a3 componentName:(id)a4 componentVersion:(id)a5 componentID:(id)a6 fullDiagnostic:(BOOL)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;

  v12 = a3;
  v13 = (void *)MEMORY[0x24BDD17C8];
  v14 = a6;
  v15 = a5;
  v16 = a4;
  objc_msgSend(v12, "eventName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("Analyzing error for the event %@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "eventName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("AAA team is analyzing an issue for the event %@. It will be very helpful if you can complete the TTR and file the radar with sysdiagnose. Thank you for your help, have a wonderful day."), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v12, "reportData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ \nEvent Details - \n%@"), v21, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __99__CDPDTTRController__triggerTTRForEvent_componentName_componentVersion_componentID_fullDiagnostic___block_invoke;
  v27[3] = &unk_24C81C618;
  v28 = v12;
  v25 = v12;
  LOBYTE(v26) = a7;
  -[CDPDTTRController requestTTRWithTitle:message:componentName:componentVersion:componentID:keywords:fullDiagnostic:completion:](self, "requestTTRWithTitle:message:componentName:componentVersion:componentID:keywords:fullDiagnostic:completion:", v18, v24, v16, v15, v14, MEMORY[0x24BDBD1A8], v26, v27);

}

void __99__CDPDTTRController__triggerTTRForEvent_componentName_componentVersion_componentID_fullDiagnostic___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "eventName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    v12 = 2112;
    v13 = v5;
    _os_log_debug_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEBUG, "\"TTR filed for event - %@ with status - %d and error - %@\", (uint8_t *)&v8, 0x1Cu);

  }
}

- (id)_ttrInfoForEvent:(id)a3 forTTRConfigSupportedErrors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[CDPDTTRController _normalizedTTRErrorForEvent:](self, "_normalizedTTRErrorForEvent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPDTTRController _ttrInfoForEventErrorDict:inTTRConfigSupportedErrors:](self, "_ttrInfoForEventErrorDict:inTTRConfigSupportedErrors:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _CDPLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CDPDTTRController _ttrInfoForEvent:forTTRConfigSupportedErrors:].cold.1(v6, v10);

    v9 = 0;
  }

  return v9;
}

- (id)_ttrInfoForEventErrorDict:(id)a3 inTTRConfigSupportedErrors:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  CDPDTTRController *v16;
  id v17;

  v6 = a3;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __74__CDPDTTRController__ttrInfoForEventErrorDict_inTTRConfigSupportedErrors___block_invoke;
  v15 = &unk_24C81C640;
  v16 = self;
  v7 = v6;
  v17 = v7;
  objc_msgSend(a4, "aaf_filter:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v8, "firstObject", v12, v13, v14, v15, v16);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

uint64_t __74__CDPDTTRController__ttrInfoForEventErrorDict_inTTRConfigSupportedErrors___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isTTREnabledForDict:", v3);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("pt"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("cid"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("fla"));
  if (v4)
    v5 = objc_msgSend(v3, "isEqualToDictionary:", *(_QWORD *)(a1 + 40));
  else
    v5 = 0;

  return v5;
}

- (BOOL)_isTTREnabledForDict:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint32_t v9;
  unint64_t v10;
  NSObject *v11;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  v7 = objc_msgSend(v6, "integerValue");
  if ((v7 & (unint64_t)~(v7 >> 63)) >= 0x64)
    v8 = 100;
  else
    v8 = v7 & ~(v7 >> 63);
  v9 = arc4random_uniform(0x65u);
  if (v9 <= 1)
    v10 = 1;
  else
    v10 = v9;
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CDPDTTRController _isTTREnabledForDict:].cold.1(v8, v10, v11);

  return v8 >= v10;
}

- (void)requestTTRIfSupportedForEvent:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "CoreCDP received request for TTR on non-internal build, ignoring.", v1, 2u);
}

- (void)_ttrInfoForEvent:(void *)a1 forTTRConfigSupportedErrors:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"Missing ttr configs for event - %@\", (uint8_t *)&v4, 0xCu);

}

- (void)_isTTREnabledForDict:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_debug_impl(&dword_20DB2C000, log, OS_LOG_TYPE_DEBUG, "ttr-cfgs normalized mid drift ttrFrequency - %ld and  randomNumber - %ld", (uint8_t *)&v3, 0x16u);
}

@end
