@implementation DTCompanionControlServiceV2

+ (void)instantiateServiceWithChannel:(id)a3
{
  uint64_t v4;
  id v5;
  objc_super v6;

  v4 = qword_25576F980;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&qword_25576F980, &unk_24EB27670);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___DTCompanionControlServiceV2;
  objc_msgSendSuper2(&v6, sel_instantiateServiceWithChannel_, v5);

}

+ (void)setSockPuppetSymbols:(id *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v4 = *(_OWORD *)&a3->var2;
  xmmword_25576F988 = *(_OWORD *)&a3->var0;
  *(_OWORD *)&qword_25576F998 = v4;
  v5 = *(_OWORD *)&a3->var10;
  v7 = *(_OWORD *)&a3->var4;
  v6 = *(_OWORD *)&a3->var6;
  xmmword_25576F9C8 = *(_OWORD *)&a3->var8;
  *(_OWORD *)&qword_25576F9D8 = v5;
  xmmword_25576F9A8 = v7;
  *(_OWORD *)&qword_25576F9B8 = v6;
  objc_sync_exit(obj);

}

+ ($E500CE0F53EF55493F587D4F07A80590)sockPuppetSymbols
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  $E500CE0F53EF55493F587D4F07A80590 *result;
  id obj;

  obj = a2;
  objc_sync_enter(obj);
  v4 = *(_OWORD *)&qword_25576F9B8;
  *(_OWORD *)&retstr->var4 = xmmword_25576F9A8;
  *(_OWORD *)&retstr->var6 = v4;
  v5 = *(_OWORD *)&qword_25576F9D8;
  *(_OWORD *)&retstr->var8 = xmmword_25576F9C8;
  *(_OWORD *)&retstr->var10 = v5;
  v6 = *(_OWORD *)&qword_25576F998;
  *(_OWORD *)&retstr->var0 = xmmword_25576F988;
  *(_OWORD *)&retstr->var2 = v6;
  objc_sync_exit(obj);

  return result;
}

+ (void)registerCapabilities:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  objc_msgSend(a1, "sockPuppetSymbols");
  if (v5)
    objc_msgSend(v4, "publishCapability:withVersion:forClass:", DTDefaultCompanionProcessControlServiceIdentifier, 3, a1);

}

- (id)_launchModeTranslationsMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B23D14;
  block[3] = &unk_24EB27E30;
  block[4] = self;
  if (qword_25576F9F0 != -1)
    dispatch_once(&qword_25576F9F0, block);
  return (id)qword_25576F9E8;
}

- (id)willInstallWatchAppForCompanionIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  dispatch_time_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void (*v12)(void *, _QWORD *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[4];
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BE2A968]);
    v7 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B24114;
    block[3] = &unk_24EB27E30;
    v10 = v6;
    v33 = v10;
    dispatch_after(v7, v8, block);

    v11 = (void *)objc_opt_class();
    if (v11)
    {
      objc_msgSend(v11, "sockPuppetSymbols");
      v12 = (void (*)(void *, _QWORD *))*((_QWORD *)&v29 + 1);
      if (*((_QWORD *)&v29 + 1))
      {
        v24[0] = v9;
        v24[1] = 3221225472;
        v24[2] = sub_222B241E8;
        v24[3] = &unk_24EB283C8;
        v25 = v10;
        v12(v5, v24);
        v13 = v25;
LABEL_9:

        v16 = v33;
        goto LABEL_10;
      }
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
    }
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = DTDefaultCompanionProcessControlServiceIdentifier;
    v36 = *MEMORY[0x24BDD0FC8];
    v37[0] = CFSTR("WatchKit framework symbol not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, -5, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "invokeCompletionWithReturnValue:error:", 0, v13);
    goto LABEL_9;
  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("Error, Nil or empty bundle identifer: '%@' sent to %@"), 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDD1540];
  v18 = DTDefaultCompanionProcessControlServiceIdentifier;
  v34 = *MEMORY[0x24BDD0FC8];
  v35 = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, -4, v19);
  v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

- (id)launchWatchAppForCompanionIdentifier:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  dispatch_time_t v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void (*v42)(id, void *, _QWORD *);
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD block[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
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
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  const __CFString *v85;
  _QWORD v86[2];
  _QWORD v87[5];

  v87[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IDEDebugLogging"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("DTCompanionControlServiceV2: called %@ for bundleID: %@"), v10, v7);

  }
  if (!v7)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = DTDefaultCompanionProcessControlServiceIdentifier;
    v16 = *MEMORY[0x24BDD0FD8];
    v86[0] = *MEMORY[0x24BDD0FC8];
    v86[1] = v16;
    v87[0] = CFSTR("Failed to launch Watch App for companion. No bundle identifier provided.");
    v87[1] = CFSTR("bundleIdentifier cannot be nil.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, -1, v17);
    v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:

    goto LABEL_51;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", DTProcessControlServiceOption_KillExistingKey[0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToNumber:", MEMORY[0x24BDBD1C0]);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IDEWatchLaunchMode"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[DTCompanionControlServiceV2 _launchModeTranslationsMap](self, "_launchModeTranslationsMap");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)objc_opt_class();
      if (v21)
      {
        objc_msgSend(v21, "sockPuppetSymbols");
        if (v20 && (_QWORD)v78 && *(_QWORD *)v78)
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v20);
      }
      else
      {
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
      }

    }
    v22 = (void *)objc_opt_class();
    if (v22)
    {
      objc_msgSend(v22, "sockPuppetSymbols");
      v23 = (_QWORD *)v74;
    }
    else
    {
      v23 = 0;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
    }
    v49 = (void *)v18;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IDEWatchLaunchNotificationType-Static"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToNumber:", MEMORY[0x24BDBD1C8]) && v23)
    {
      v25 = *v23;

      if (v25)
        objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *v23);
    }
    else
    {

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IDEWatchNotificationPayload"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_opt_class();
    if (v27)
    {
      objc_msgSend(v27, "sockPuppetSymbols");
      if (v26 && *((_QWORD *)&v68 + 1) && **((_QWORD **)&v68 + 1))
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v26);
    }
    else
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IDEWatchExeptionProcessAssertionDisabled"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (!v28 || (objc_msgSend(v28, "BOOLValue") & 1) == 0)
    {
      v30 = (void *)objc_opt_class();
      if (v30)
      {
        objc_msgSend(v30, "sockPuppetSymbols");
        if ((_QWORD)v63 && *(_QWORD *)v63)
          objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8]);
      }
      else
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
      }
    }
    v48 = (void *)v26;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IDEWatchLaunchEnvironment"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v31)
      v33 = v31;
    else
      v33 = MEMORY[0x24BDBD1B8];
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v33, CFSTR("SPXcodeSupportAppLaunchEnvironmentKey"));

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IDEWatchLaunchArguments"));
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    if (v34)
      v36 = v34;
    else
      v36 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v36, CFSTR("SPXcodeSupportAppLaunchArgumentsKey"));

    v37 = objc_alloc_init(MEMORY[0x24BE2A968]);
    v38 = dispatch_time(0, 305000000000);
    dispatch_get_global_queue(0, 0);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B247C8;
    block[3] = &unk_24EB27E30;
    v13 = v37;
    v59 = v13;
    dispatch_after(v38, v39, block);

    if (v9)
      NSLog(CFSTR("DTCompanionControlServiceV2: watch launch options: '%@'"), v17);
    v41 = (void *)objc_opt_class();
    if (v41)
    {
      objc_msgSend(v41, "sockPuppetSymbols");
      v42 = (void (*)(id, void *, _QWORD *))v56;
      if ((_QWORD)v56)
      {
        v50[0] = v40;
        v50[1] = 3221225472;
        v50[2] = sub_222B2489C;
        v50[3] = &unk_24EB283F0;
        v51 = v13;
        v42(v7, v17, v50);
        v43 = v51;
LABEL_49:

        goto LABEL_50;
      }
    }
    else
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
    }
    v44 = (void *)MEMORY[0x24BDD1540];
    v45 = DTDefaultCompanionProcessControlServiceIdentifier;
    v84 = *MEMORY[0x24BDD0FC8];
    v85 = CFSTR("WatchKit framework symbol not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", v45, -5, v46);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "invokeCompletionWithReturnValue:error:", 0, v43);
    goto LABEL_49;
  }
  v13 = 0;
LABEL_51:

  return v13;
}

- (id)terminateWatchAppForCompanionIdentifier:(id)a3 options:(id)a4
{
  id v4;
  id v5;
  void *v6;
  void (*v7)(id, _QWORD *);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE2A968]);
  v6 = (void *)objc_opt_class();
  if (!v6)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    goto LABEL_5;
  }
  objc_msgSend(v6, "sockPuppetSymbols");
  v7 = (void (*)(id, _QWORD *))*((_QWORD *)&v19 + 1);
  if (!*((_QWORD *)&v19 + 1))
  {
LABEL_5:
    v9 = (void *)MEMORY[0x24BDD1540];
    v10 = DTDefaultCompanionProcessControlServiceIdentifier;
    v21 = *MEMORY[0x24BDD0FC8];
    v22[0] = CFSTR("WatchKit framework symbol not found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -5, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "invokeCompletionWithReturnValue:error:", 0, v8);
    goto LABEL_6;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_222B24A18;
  v13[3] = &unk_24EB283C8;
  v14 = v5;
  v7(v4, v13);
  v8 = v14;
LABEL_6:

  return v5;
}

@end
