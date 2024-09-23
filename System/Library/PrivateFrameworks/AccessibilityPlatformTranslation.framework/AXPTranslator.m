@implementation AXPTranslator

void __35__AXPTranslator_iOS_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "init");
  v1 = (void *)sharedInstance_Translator;
  sharedInstance_Translator = v0;

}

void __52__AXPTranslator_iOS_attributedStringConversionBlock__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  uint64_t *v21;
  void *v22;
  int v23;
  uint64_t *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id obj;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a3;
  v81 = a4;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v78 = v11;
  objc_msgSend(v11, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
  if (v82)
  {
    v80 = *(_QWORD *)v89;
    v68 = *MEMORY[0x24BDFEAA8];
    v67 = *MEMORY[0x24BDFE990];
    v74 = *MEMORY[0x24BDFE9B0];
    v73 = *MEMORY[0x24BDFE9A0];
    v66 = *MEMORY[0x24BDFE998];
    v12 = (_QWORD *)MEMORY[0x24BDFEC70];
    v65 = *MEMORY[0x24BDFE9A8];
    v72 = *MEMORY[0x24BDFEBA0];
LABEL_3:
    v13 = 0;
    while (2)
    {
      if (*(_QWORD *)v89 != v80)
        objc_enumerationMutation(obj);
      v83 = v13;
      v14 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v13);
      switch(objc_msgSend(v14, "unsignedIntegerValue", v65))
      {
        case 0:
          objc_msgSend(v81, "objectForKeyedSubscript:", v72);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "BOOLValue");

          if (v16)
          {
            v17 = v10;
            v18 = v72;
            goto LABEL_31;
          }
          goto LABEL_55;
        case 1:
          objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x24BDFEBD0]);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "BOOLValue");

          if (v30)
          {
            v21 = (uint64_t *)MEMORY[0x24BDFEBD0];
            goto LABEL_22;
          }
          goto LABEL_55;
        case 2:
          objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x24BDFEC98]);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "BOOLValue");

          if (v20)
          {
            v21 = (uint64_t *)MEMORY[0x24BDFEC98];
            goto LABEL_22;
          }
          goto LABEL_55;
        case 3:
          objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x24BDFEB98]);
          v28 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x24BDFEBE0]);
          v31 = objc_claimAutoreleasedReturnValue();
          if (v28 | v31)
          {
            objc_msgSend(v10, "removeAttribute:range:", *MEMORY[0x24BDFEB98], a5, a6);
            objc_msgSend(v10, "removeAttribute:range:", *MEMORY[0x24BDFEBE0], a5, a6);
            if (v31)
              v32 = (void *)v31;
            else
              v32 = (void *)v28;
            v33 = v32;
            objc_msgSend(v78, "objectForKeyedSubscript:", v14);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addAttribute:value:range:", v34, v33, a5, a6);

          }
          goto LABEL_50;
        case 4:
          v35 = v81;
          v27 = v66;
          goto LABEL_47;
        case 5:
          objc_msgSend(v81, "objectForKeyedSubscript:", v73);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "BOOLValue");

          if (!v23)
            goto LABEL_55;
          v17 = v10;
          v18 = v73;
          goto LABEL_31;
        case 6:
          objc_msgSend(v81, "objectForKeyedSubscript:", v74);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "BOOLValue");

          if (!v37)
            goto LABEL_55;
          v17 = v10;
          v18 = v74;
          goto LABEL_31;
        case 7:
          v24 = (uint64_t *)MEMORY[0x24BDFEAE0];
          objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x24BDFEAE0]);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "translationObjectFromPlatformElement:", v38);
          v39 = objc_claimAutoreleasedReturnValue();
          goto LABEL_44;
        case 8:
          v28 = objc_opt_new();
          v40 = (_QWORD *)MEMORY[0x24BDFEB48];
          objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x24BDFEB48]);
          v41 = objc_claimAutoreleasedReturnValue();
          v77 = (void *)v41;
          if (v41)
          {
            v42 = (void *)v41;
            objc_msgSend(v10, "removeAttribute:range:", *v40, a5, a6);
            objc_msgSend((id)v28, "setObject:forKeyedSubscript:", v42, &unk_24E6B0ED0);
            objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "componentsSeparatedByCharactersInSet:", v75);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "componentsJoinedByString:", CFSTR(" "));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "stringByTrimmingCharactersInSet:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v28, "setObject:forKeyedSubscript:", v44, &unk_24E6B0EE8);

          }
          v45 = (_QWORD *)MEMORY[0x24BDFEB40];
          objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x24BDFEB40]);
          v46 = objc_claimAutoreleasedReturnValue();
          if (v46)
          {
            objc_msgSend(v10, "removeAttribute:range:", *v45, a5, a6);
            objc_msgSend((id)v28, "setObject:forKeyedSubscript:", v46, &unk_24E6B0F00);
          }
          v76 = (void *)v46;
          v47 = (_QWORD *)MEMORY[0x24BDFEB50];
          objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x24BDFEB50]);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48)
          {
            objc_msgSend(v10, "removeAttribute:range:", *v47, a5, a6);
            objc_msgSend((id)v28, "setObject:forKeyedSubscript:", v48, &unk_24E6B0F18);
          }
          if (objc_msgSend((id)v28, "count"))
          {
            objc_msgSend(v78, "objectForKeyedSubscript:", v14);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addAttribute:value:range:", v49, v28, a5, a6);

          }
          goto LABEL_53;
        case 13:
          v24 = (uint64_t *)MEMORY[0x24BDFEB58];
          goto LABEL_43;
        case 14:
          v24 = (uint64_t *)MEMORY[0x24BDFEBE8];
LABEL_43:
          objc_msgSend(v81, "objectForKeyedSubscript:", *v24);
          v39 = objc_claimAutoreleasedReturnValue();
LABEL_44:
          v28 = v39;
          if (v39)
            goto LABEL_45;
          goto LABEL_54;
        case 15:
          objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x24BDFECD8]);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "BOOLValue");

          if (!v26)
            goto LABEL_55;
          v21 = (uint64_t *)MEMORY[0x24BDFECD8];
LABEL_22:
          v18 = *v21;
          v17 = v10;
LABEL_31:
          objc_msgSend(v17, "removeAttribute:range:", v18, a5, a6);
          objc_msgSend(v78, "objectForKeyedSubscript:", v14);
          v28 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addAttribute:value:range:", v28, MEMORY[0x24BDBD1C8], a5, a6);
          goto LABEL_54;
        case 16:
          v27 = v65;
          objc_msgSend(v81, "objectForKeyedSubscript:", v65);
          v28 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_54;
          goto LABEL_48;
        case 17:
          v24 = (uint64_t *)MEMORY[0x24BDFEAD8];
          objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x24BDFEAD8]);
          v28 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_54;
LABEL_45:
          v50 = *v24;
          v51 = v10;
          goto LABEL_49;
        case 18:
          v35 = v81;
          v27 = v67;
LABEL_47:
          objc_msgSend(v35, "objectForKeyedSubscript:", v27);
          v28 = objc_claimAutoreleasedReturnValue();
          if (!v28)
            goto LABEL_54;
LABEL_48:
          v51 = v10;
          v50 = v27;
LABEL_49:
          objc_msgSend(v51, "removeAttribute:range:", v50, a5, a6);
          objc_msgSend(v78, "objectForKeyedSubscript:", v14);
          v31 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addAttribute:value:range:", v31, v28, a5, a6);
LABEL_50:

LABEL_54:
LABEL_55:
          v86 = 0u;
          v87 = 0u;
          v84 = 0u;
          v85 = 0u;
          objc_msgSend(v81, "keyEnumerator");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "allObjects");
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
          if (v60)
          {
            v61 = v60;
            v62 = *(_QWORD *)v85;
            do
            {
              for (i = 0; i != v61; ++i)
              {
                if (*(_QWORD *)v85 != v62)
                  objc_enumerationMutation(v59);
                v64 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
                if (objc_msgSend(v64, "hasPrefix:", CFSTR("UIAccessibilityToken"))
                  && (objc_msgSend(v64, "isEqualToString:", *v12) & 1) == 0)
                {
                  objc_msgSend(v10, "removeAttribute:range:", v64, a5, a6);
                }
              }
              v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v84, v92, 16);
            }
            while (v61);
          }

          v13 = v83 + 1;
          if (v83 + 1 != v82)
            continue;
          v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
          if (!v82)
            goto LABEL_67;
          goto LABEL_3;
        case 19:
          objc_msgSend(v81, "objectForKeyedSubscript:", v68);
          v28 = objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v10, "removeAttribute:range:", v68, a5, a6);
            objc_msgSend(v10, "string");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "substringWithRange:", a5, a6);
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = objc_msgSend(v77, "rangeOfString:", v28);
            v55 = v54;
            v56 = v53 + a5;
            objc_msgSend(v78, "objectForKeyedSubscript:", v14);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addAttribute:value:range:", v57, MEMORY[0x24BDBD1C8], v56, v55);

LABEL_53:
          }
          goto LABEL_54;
        default:
          goto LABEL_55;
      }
    }
  }
LABEL_67:

}

uint64_t __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processAccessibilityAttributeValue:", a4);
}

uint64_t __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processAccessibilityAttributeValue:forParameter:", a4, a5);
}

uint64_t __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processPerformAction:value:", a4, a5);
}

id __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __58__AXPTranslator_iOS_initializeAXRuntimeForSystemAppServer__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  return a3;
}

uint64_t __54__AXPTranslator_iOS__enableAccessibilityBridgeRuntime__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v20[16];

  if (!_AXSApplicationAccessibilityEnabled())
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_appLoadedAccessibilityCallback, (CFStringRef)*MEMORY[0x24BDFEDA8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v3 = MEMORY[0x24BDAC9B8];
    dispatch_assert_queue_not_V2(MEMORY[0x24BDAC9B8]);
    dispatch_async(v3, &__block_literal_global_232);

    v4 = dispatch_semaphore_create(0);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v4;

    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
    v8 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v7, v8);
    v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 104);
    AXPlatformTranslationLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_220DB6000, v11, OS_LOG_TYPE_INFO, "App accessibility enabled successfully", v20, 2u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __54__AXPTranslator_iOS__enableAccessibilityBridgeRuntime__block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_registerAccessibilityNotifications");
}

uint64_t __54__AXPTranslator_iOS__enableAccessibilityBridgeRuntime__block_invoke_2()
{
  _AXSApplicationAccessibilitySetEnabled();
  return AXDisableAccessibilityOnTermination();
}

id __47__AXPTranslator_iOS__processAuditIssuesResult___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v2 = a2;
  v3 = *MEMORY[0x24BDFE880];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFE880]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *MEMORY[0x24BDFE898];
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFE898]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longLongValue");

    if (v7 > 1999)
    {
      v12 = 200;
      v13 = 300;
      if (v7 != 4001)
        v13 = 0;
      if (v7 != 2000)
        v12 = v13;
      if ((unint64_t)(v7 - 2001) >= 2)
        v10 = v12;
      else
        v10 = 201;
    }
    else if ((unint64_t)(v7 - 1000) > 7)
    {
      v10 = 0;
    }
    else
    {
      v8 = 1 << (v7 + 24);
      v9 = 102;
      if (v7 != 1001)
        v9 = 0;
      if ((v8 & 0xC8) != 0)
        v9 = 202;
      if ((v8 & 0x15) != 0)
        v10 = 100;
      else
        v10 = v9;
    }
    v11 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v5);

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, v3);
    v15 = *MEMORY[0x24BDFE890];
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFE890]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v15);

    }
    v18 = *MEMORY[0x24BDFE878];
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFE878]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v18);

    }
    v21 = *MEMORY[0x24BDFE888];
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFE888]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, v21);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __79__AXPTranslator_iOS__processCellWithIndexPathAttributeRequest_parameter_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "createPlatformElementFromTranslationObject:", v2);

  }
  else
  {
    v4 = v2;
  }

  return v4;
}

void __72__AXPTranslator_iOS__processTextInputMarkedRangeAttributeRequest_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BDFEAA8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", a3, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a5 = 1;
  }
}

void __58__AXPTranslator_iOS_processFrontMostApp_withiOSAttribute___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "updateCache:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "_processDirectAttributeRequest:iosAttribute:axpAttribute:parameter:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_postProcessResultDataForSecureCoding:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", v6);

}

void __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_postProcessResultDataForSecureCoding:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v4);

}

void __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a2, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_postProcessResultDataForSecureCoding:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

void __59__AXPTranslator_iOS__postProcessResultDataForSecureCoding___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a2, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_postProcessResultDataForSecureCoding:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_11;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

}

void __38__AXPTranslator_iOS__allAXTreeActions__block_invoke()
{
  void *v0;

  v0 = (void *)_allAXTreeActions_actionValues;
  _allAXTreeActions_actionValues = (uint64_t)&unk_24E6B2068;

}

void __49__AXPTranslator_iOS__topPriorityAXTreeAttrValues__block_invoke()
{
  void *v0;

  v0 = (void *)_topPriorityAXTreeAttrValues_attributeValues;
  _topPriorityAXTreeAttrValues_attributeValues = (uint64_t)&unk_24E6B2080;

}

void __41__AXPTranslator_iOS__allAXTreeAttrValues__block_invoke()
{
  void *v0;

  v0 = (void *)_allAXTreeAttrValues_attributeValues;
  _allAXTreeAttrValues_attributeValues = (uint64_t)&unk_24E6B2098;

}

void __64__AXPTranslator_iOS_createPlatformElementFromTranslationObject___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "backTranslationCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v3 = objc_msgSend(v6, "pid");
    v4 = objc_msgSend(v6, "uid");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = MEMORY[0x227665EC8](v3, v4, v5);

  }
}

void __58__AXPTranslator_iOS_translationObjectFromPlatformElement___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  CFTypeRef cf;

  objc_msgSend(*(id *)(a1 + 32), "translationCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v6 = objc_opt_new();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPid:", objc_msgSend(*(id *)(a1 + 48), "pid"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setIsApplicationElement:", AXUIElementIsApplication());
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDidPopuldateAppInfo:", 1);
    cf = 0;
    v9 = *(_QWORD *)(a1 + 64);
    v10 = getpid();
    v11 = _AXPAXUIElementReplaceWithRemotePid(v9, &cf, v10);
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    if (!v11 || !AXPIsCatalyst())
      objc_msgSend(*(id *)(a1 + 32), "_addCacheElement:translationObject:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
}

id __58__AXPTranslator_iOS_translationObjectFromPlatformElement___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = a2;
  +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const void *)objc_msgSend(v3, "createPlatformElementFromTranslationObject:", v2);

  v5 = (void *)MEMORY[0x24BDFEA90];
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "uiElementWithAXElement:cache:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithAXAttribute:", 2185);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" -- ORIGINAL DESCRIPTION: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    CFRelease(v4);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%d] %@"), objc_msgSend(v7, "pid"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__AXPTranslator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_Translator_0;
}

void __31__AXPTranslator_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "init");
  v1 = (void *)sharedInstance_Translator_0;
  sharedInstance_Translator_0 = v0;

}

+ (id)sharediOSInstance
{
  return +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
}

- (AXPTranslator)init
{
  AXPTranslator *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXPTranslator;
  v2 = -[AXPTranslator init](&v5, sel_init);
  v3 = (void *)objc_opt_new();
  -[AXPTranslator setFakeElementCache:](v2, "setFakeElementCache:", v3);

  -[AXPTranslator setRequestResolvingBehavior:](v2, "setRequestResolvingBehavior:", 0);
  return v2;
}

- (id)translationApplicationObject
{
  return -[AXPTranslator _translationApplicationObjectForPidNumber:](self, "_translationApplicationObjectForPidNumber:", 0);
}

- (id)translationApplicationObjectForPid:(int)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator _translationApplicationObjectForPidNumber:](self, "_translationApplicationObjectForPidNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_translationApplicationObjectForPidNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[AXPTranslatorRequest requestWithTranslation:](AXPTranslatorRequest, "requestWithTranslation:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestType:", 1);
  if (v4)
  {
    v10 = CFSTR("pid");
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setParameters:", v6);

  }
  -[AXPTranslator sendTranslatorRequest:](self, "sendTranslatorRequest:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "translationResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)frontmostApplicationWithDisplayId:(unsigned int)a3 bridgeDelegateToken:(id)a4
{
  uint64_t v4;
  id v6;
  AXPTranslationObject *v7;
  AXPTranslationObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v4 = *(_QWORD *)&a3;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if ((-[AXPTranslator requestResolvingBehavior](self, "requestResolvingBehavior") == 2
     || -[AXPTranslator requestResolvingBehavior](self, "requestResolvingBehavior") == 1)
    && (-[AXPTranslator _checkCacheForFrontmostAppResponseWithBridgeDelegateToken:](self, "_checkCacheForFrontmostAppResponseWithBridgeDelegateToken:", v6), (v7 = (AXPTranslationObject *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    -[AXPTranslationObject translationResponse](v7, "translationResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = -[AXPTranslationObject init]([AXPTranslationObject alloc], "init");
    -[AXPTranslationObject setBridgeDelegateToken:](v8, "setBridgeDelegateToken:", v6);
    +[AXPTranslatorRequest requestWithTranslation:](AXPTranslatorRequest, "requestWithTranslation:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRequestType:", 4);
    v15 = CFSTR("displayId");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setParameters:", v12);

    -[AXPTranslator sendTranslatorRequest:](self, "sendTranslatorRequest:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "translationResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_checkCacheForFrontmostAppResponseWithBridgeDelegateToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AXPTranslator treeDumpResponseCacheForBridgeDelegateToken:](self, "treeDumpResponseCacheForBridgeDelegateToken:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "treeDumpResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "associatedRequestType") == 4)
        {
          v13 = v12;

          v9 = v13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v14 = v9;

  return v14;
}

- (void)handleNotification:(unint64_t)a3 data:(id)a4 associatedObject:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  AXPTranslator *v21;
  id v22;
  id v23;
  unint64_t v24;

  v8 = a4;
  v9 = a5;
  AXPlatformTranslationLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AXPTranslator handleNotification:data:associatedObject:].cold.2(a3, (uint64_t)v8, v10);

  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __58__AXPTranslator_handleNotification_data_associatedObject___block_invoke;
  v20 = &unk_24E6AC1B8;
  v21 = self;
  v24 = a3;
  v11 = v8;
  v22 = v11;
  v12 = v9;
  v23 = v12;
  dispatch_async(MEMORY[0x24BDAC9B8], &v17);
  if (-[AXPTranslator requestResolvingBehavior](self, "requestResolvingBehavior", v17, v18, v19, v20, v21) != 1)
  {
    v13 = -[AXPTranslator requestResolvingBehavior](self, "requestResolvingBehavior");
    if (a3 == 2 && v13 != 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        AXPlatformTranslationLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[AXPTranslator handleNotification:data:associatedObject:].cold.1(v12, self, v14);

        -[AXPTranslator fakeElementCache](self, "fakeElementCache");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "objectID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v16);

      }
    }
  }

}

void __58__AXPTranslator_handleNotification_data_associatedObject___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "platformTranslator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processPlatformNotification:data:associatedObject:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)handleUpdatedAXTree:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXPlatformTranslationLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXPTranslator handleUpdatedAXTree:].cold.2(v5);

  objc_msgSend(v4, "associatedTranslationObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bridgeDelegateToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    AXPlatformTranslationLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[AXPTranslator handleUpdatedAXTree:].cold.1(v19);
    goto LABEL_27;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v4, "treeDumpResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v13, "resultData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXPTranslator _resetBridgeTokensForResponse:bridgeDelegateToken:](self, "_resetBridgeTokensForResponse:bridgeDelegateToken:", v14, v7);

        objc_msgSend(v13, "associatedNotificationObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setBridgeDelegateToken:", v7);

        objc_msgSend(v13, "associatedTranslationObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBridgeDelegateToken:", v7);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v10);
  }

  objc_msgSend(v4, "treeDumpType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("AXPTreeDumpTypeInitialDump"));

  if (v18)
  {
    -[AXPTranslator bridgeDelegateTokenToTreeDumpLookup](self, "bridgeDelegateTokenToTreeDumpLookup");
    v19 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v4, v7);
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(v4, "treeDumpType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("AXPTreeDumpTypeAdditionalData"));

  if (v21)
  {
    -[AXPTranslator treeDumpResponseCacheForBridgeDelegateToken:](self, "treeDumpResponseCacheForBridgeDelegateToken:", v7);
    v19 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDBCEB8];
    -[NSObject treeDumpResponse](v19, "treeDumpResponse");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = v4;
    objc_msgSend(v4, "treeDumpResponse");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v25);
          v30 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
          -[AXPTranslator checkTreeDumpCacheResponses:forMatchingResponse:withBridgeTokenDelegate:](self, "checkTreeDumpCacheResponses:forMatchingResponse:withBridgeTokenDelegate:", v24, v30, v7);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            -[AXPTranslator updateTreeDumpCacheResponse:withAdditionalResponse:](self, "updateTreeDumpCacheResponse:withAdditionalResponse:", v31, v30);
          else
            objc_msgSend(v24, "addObject:", v30);

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v27);
    }

    v32 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v24, CFSTR("treeDump"));
    -[NSObject treeDumpType](v19, "treeDumpType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("treeDumpType"));

    -[NSObject setResultData:](v19, "setResultData:", v32);
    v4 = v34;
    goto LABEL_27;
  }
LABEL_28:

}

- (void)_resetBridgeTokensForResponse:(id)a3 bridgeDelegateToken:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v8);
            -[AXPTranslator _resetBridgeTokensForResponse:bridgeDelegateToken:](self, "_resetBridgeTokensForResponse:bridgeDelegateToken:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), v7);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v10);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_21;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v8 = v6;
      v13 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v19;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(v8);
            objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[AXPTranslator _resetBridgeTokensForResponse:bridgeDelegateToken:](self, "_resetBridgeTokensForResponse:bridgeDelegateToken:", v17, v7);

          }
          v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v14);
      }
    }

    goto LABEL_21;
  }
  objc_msgSend(v6, "setBridgeDelegateToken:", v7);
LABEL_21:

}

- (id)sendTranslatorRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
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
  void (**v25)(_QWORD, _QWORD);
  uint64_t v26;
  void (**v27)(_QWORD, _QWORD);
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
  NSObject *v38;
  uint64_t v40;

  v4 = a3;
  -[AXPTranslator bridgeDelegate](self, "bridgeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[AXPTranslator bridgeTokenDelegate](self, "bridgeTokenDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      AXPlatformTranslationLogCommon();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[AXPTranslator sendTranslatorRequest:].cold.1(v38);

      goto LABEL_21;
    }
  }
  v7 = -[AXPTranslator requestResolvingBehavior](self, "requestResolvingBehavior");
  v8 = -[AXPTranslator requestResolvingBehavior](self, "requestResolvingBehavior");
  -[AXPTranslator requestResolvingBehavior](self, "requestResolvingBehavior");
  if (!AXPClientIsEntitledForRemoteDeviceContent())
  {
LABEL_21:
    +[AXPTranslatorResponse emptyResponse](AXPTranslatorResponse, "emptyResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if ((v7 == 1 || v8 == 2)
    && -[AXPTranslator shouldCheckTreeDumpCacheForRequestType:](self, "shouldCheckTreeDumpCacheForRequestType:", objc_msgSend(v4, "requestType")))
  {
    -[AXPTranslator checkTreeDumpCacheForRequest:](self, "checkTreeDumpCacheForRequest:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 != 1)
      goto LABEL_11;
    if (objc_msgSend(v4, "requestType") != 5)
      goto LABEL_11;
    objc_msgSend(v9, "resultData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("attributes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqualToArray:", v13);

    if (v14)
    {
LABEL_11:
      if (v9)
      {
        objc_msgSend(v9, "resultData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "translation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bridgeDelegateToken");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXPTranslator _resetBridgeTokensForResponse:bridgeDelegateToken:](self, "_resetBridgeTokensForResponse:bridgeDelegateToken:", v15, v17);

        objc_msgSend(v4, "translation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bridgeDelegateToken");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "associatedNotificationObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setBridgeDelegateToken:", v19);

        objc_msgSend(v4, "translation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bridgeDelegateToken");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "associatedTranslationObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setBridgeDelegateToken:", v22);

        goto LABEL_22;
      }
    }
    if (-[AXPTranslator requestResolvingBehavior](self, "requestResolvingBehavior") == 2)
    {
      +[AXPTranslatorResponse emptyResponse](AXPTranslatorResponse, "emptyResponse");
      v40 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v40;
      goto LABEL_22;
    }
  }
  else
  {
    v9 = 0;
  }
  if (-[AXPTranslator supportsDelegateTokens](self, "supportsDelegateTokens"))
  {
    -[AXPTranslator bridgeTokenDelegate](self, "bridgeTokenDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translation");
    v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bridgeDelegateToken");
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "accessibilityTranslationDelegateBridgeCallbackWithToken:", v26);
    v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v27)[2](v27, v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)v26;
  }
  else
  {
    -[AXPTranslator bridgeDelegate](self, "bridgeDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "accessibilityTranslationDelegateBridgeCallback");
    v25 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v25)[2](v25, v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v28, "resultData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bridgeDelegateToken");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator _resetBridgeTokensForResponse:bridgeDelegateToken:](self, "_resetBridgeTokensForResponse:bridgeDelegateToken:", v29, v31);

  objc_msgSend(v4, "translation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bridgeDelegateToken");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "associatedNotificationObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBridgeDelegateToken:", v33);

  objc_msgSend(v4, "translation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bridgeDelegateToken");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "associatedTranslationObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBridgeDelegateToken:", v36);

  v9 = v28;
LABEL_22:

  return v9;
}

- (id)treeDumpResponseCacheForBridgeDelegateToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[AXPTranslator bridgeDelegateTokenToTreeDumpLookup](self, "bridgeDelegateTokenToTreeDumpLookup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)shouldCheckTreeDumpCacheForRequestType:(unint64_t)a3
{
  return (a3 < 0xB) & (0x63Cu >> a3);
}

- (void)updateTreeDumpCacheResponse:(id)a3 withAdditionalResponse:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v23 = a3;
  v5 = a4;
  v6 = objc_msgSend(v23, "associatedRequestType");
  v7 = objc_msgSend(v23, "associatedRequestType");
  v8 = objc_msgSend(v23, "associatedRequestType");
  v9 = objc_msgSend(v23, "associatedRequestType");
  v10 = objc_msgSend(v23, "associatedRequestType");
  if (v6 != 2)
  {
    if (v7 != 5)
    {
      if (v8 == 3)
        goto LABEL_15;
      if (v9 != 10)
      {
        if (v10 != 9)
          goto LABEL_17;
        goto LABEL_15;
      }
      v16 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(v23, "resultData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dictionaryWithDictionary:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "resultData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __68__AXPTranslator_updateTreeDumpCacheResponse_withAdditionalResponse___block_invoke_2;
      v24[3] = &unk_24E6AC1E0;
      v25 = v18;
      v13 = v18;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);

      v20 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v23, "setResultData:", v20);

LABEL_16:
      goto LABEL_17;
    }
    v11 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(v23, "resultData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithDictionary:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "associatedRequestType") == 2)
    {
      objc_msgSend(v5, "resultData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "attribute"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v14, v15);

    }
    else
    {
      if (objc_msgSend(v5, "associatedRequestType") != 5)
      {
LABEL_13:
        v22 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v23, "setResultData:", v22);

        goto LABEL_16;
      }
      objc_msgSend(v5, "resultData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __68__AXPTranslator_updateTreeDumpCacheResponse_withAdditionalResponse___block_invoke;
      v26[3] = &unk_24E6AC1E0;
      v27 = v13;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v26);

      v14 = v27;
    }

    goto LABEL_13;
  }
  if (objc_msgSend(v5, "associatedRequestType") == 2)
  {
LABEL_15:
    objc_msgSend(v5, "resultData");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setResultData:", v13);
    goto LABEL_16;
  }
  objc_msgSend(v5, "associatedRequestType");
LABEL_17:

}

uint64_t __68__AXPTranslator_updateTreeDumpCacheResponse_withAdditionalResponse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

uint64_t __68__AXPTranslator_updateTreeDumpCacheResponse_withAdditionalResponse___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

- (id)checkTreeDumpCacheResponses:(id)a3 forMatchingResponse:(id)a4 withBridgeTokenDelegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "associatedRequestType") == 4)
  {
    -[AXPTranslator _checkCacheForFrontmostAppResponseWithBridgeDelegateToken:](self, "_checkCacheForFrontmostAppResponseWithBridgeDelegateToken:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v8;
    v11 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v22 = v8;
      v13 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v12);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v16 = objc_msgSend(v15, "associatedRequestType");
          if (v16 == objc_msgSend(v9, "associatedRequestType"))
          {
            objc_msgSend(v15, "associatedTranslationObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "associatedTranslationObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "isEqual:", v18);

            if (v19)
            {
              if (objc_msgSend(v15, "associatedRequestType") != 3
                || (v20 = objc_msgSend(v15, "attribute"), v20 == objc_msgSend(v9, "attribute")))
              {
                v11 = v15;
                goto LABEL_16;
              }
            }
          }
        }
        v11 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          continue;
        break;
      }
LABEL_16:
      v8 = v22;
    }

  }
  return v11;
}

- (id)treeDumpCacheResultDataForAttributeTypeRequest:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char isKindOfClass;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v38;
  uint64_t v39;
  id obj;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "requestType");
  v6 = objc_msgSend(v4, "requestType");
  objc_msgSend(v4, "translation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bridgeDelegateToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator treeDumpResponseCacheForBridgeDelegateToken:](self, "treeDumpResponseCacheForBridgeDelegateToken:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v5;
  if (v5 == 2)
  {
    v10 = (void *)MEMORY[0x24BDBCE30];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "attributeType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_48;
    goto LABEL_6;
  }
  if (v6 == 5)
  {
    objc_msgSend(v4, "parameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("attributes"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
LABEL_6:
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      obj = v12;
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (!v44)
      {
        v42 = 0;
        goto LABEL_50;
      }
      v38 = v6;
      v42 = 0;
      v43 = *(_QWORD *)v52;
      v41 = v9;
      while (1)
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v52 != v43)
            objc_enumerationMutation(obj);
          v46 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          objc_msgSend(v9, "treeDumpResponse");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (!v16)
            goto LABEL_44;
          v17 = v16;
          v45 = i;
          v18 = 0;
          v19 = *(_QWORD *)v48;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v48 != v19)
                objc_enumerationMutation(v15);
              v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
              v22 = objc_msgSend(v21, "associatedRequestType");
              v23 = objc_msgSend(v21, "associatedRequestType");
              if (v22 == 2 || v23 == 5)
              {
                objc_msgSend(v21, "associatedTranslationObject");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "translation");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v25, "isEqual:", v26);

                if (v27)
                {
                  if (objc_msgSend(v4, "attributeType")
                    && objc_msgSend(v21, "attribute")
                    && (v28 = objc_msgSend(v21, "attribute"), v28 == objc_msgSend(v4, "attributeType")))
                  {
                    objc_msgSend(v21, "resultData");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v18 = 1;
LABEL_30:
                    if (v29)
                    {
                      if (v39 == 2)
                      {
                        v34 = v29;

                        v42 = v34;
                        v9 = v41;
                        i = v45;
                      }
                      else
                      {
                        v9 = v41;
                        i = v45;
                        if (v38 == 5)
                        {
                          v35 = v42;
                          if (!v42)
                            v35 = (void *)objc_opt_new();
                          v42 = v35;
                          objc_msgSend(v35, "setObject:forKey:", v29, v46);
                        }
                      }

                      goto LABEL_44;
                    }
                  }
                  else
                  {
                    objc_msgSend(v21, "resultData");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    isKindOfClass = objc_opt_isKindOfClass();

                    if ((isKindOfClass & 1) != 0)
                    {
                      objc_msgSend(v21, "resultData");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "objectForKey:", v46);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v29)
                      {
                        v33 = v29;
                        v18 = 1;
                      }

                      if ((v18 & 1) != 0)
                        goto LABEL_30;
                    }
                    else
                    {
                      v29 = 0;
                    }
                  }

                  continue;
                }
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            if (v17)
              continue;
            break;
          }
          v9 = v41;
          i = v45;
LABEL_44:

        }
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (!v44)
        {
LABEL_50:
          v12 = obj;

          v36 = v42;
          goto LABEL_51;
        }
      }
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_48:
  v36 = 0;
LABEL_51:

  return v36;
}

- (id)treeDumpCacheResultDataForCanSetAttributeTypeRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "requestType");
  objc_msgSend(v4, "translation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bridgeDelegateToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator treeDumpResponseCacheForBridgeDelegateToken:](self, "treeDumpResponseCacheForBridgeDelegateToken:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v5 == 3 && v8)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v8, "treeDumpResponse", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v15, "associatedRequestType") == 3)
          {
            objc_msgSend(v15, "associatedTranslationObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "translation");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqual:", v17);

            if (v18)
            {
              if (objc_msgSend(v4, "attributeType"))
              {
                if (objc_msgSend(v15, "attribute"))
                {
                  v19 = objc_msgSend(v15, "attribute");
                  if (v19 == objc_msgSend(v4, "attributeType"))
                  {
                    objc_msgSend(v15, "resultData");
                    v20 = objc_claimAutoreleasedReturnValue();
                    if (v20)
                    {
                      v9 = (void *)v20;
                      goto LABEL_18;
                    }
                  }
                }
              }
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v12)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_18:

  }
  return v9;
}

- (id)treeDumpCacheResultDataForSupportedActionsTypeRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  int v26;
  id v27;
  void *v28;
  void *v29;
  id obj;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "requestType");
  objc_msgSend(v4, "translation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bridgeDelegateToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator treeDumpResponseCacheForBridgeDelegateToken:](self, "treeDumpResponseCacheForBridgeDelegateToken:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v5 == 9 && v8)
  {
    objc_msgSend(v4, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("actions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v11;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v35)
    {
      v33 = 0;
      v34 = *(_QWORD *)v42;
      v32 = v8;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v42 != v34)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          objc_msgSend(v8, "treeDumpResponse");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v15)
          {
            v16 = v15;
            v36 = i;
            v17 = *(_QWORD *)v38;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v38 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
                if (objc_msgSend(v19, "associatedRequestType") == 9)
                {
                  objc_msgSend(v19, "associatedTranslationObject");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "translation");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v20, "isEqual:", v21);

                  if (v22)
                  {
                    objc_msgSend(v19, "resultData");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    isKindOfClass = objc_opt_isKindOfClass();

                    if ((isKindOfClass & 1) != 0)
                    {
                      objc_msgSend(v19, "resultData");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = objc_msgSend(v25, "containsObject:", v13);

                      if (v26)
                      {
                        v27 = v13;
                        if (v13)
                        {
                          v28 = v27;
                          v29 = v33;
                          if (!v33)
                          {
                            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                            v29 = (void *)objc_claimAutoreleasedReturnValue();
                          }
                          v33 = v29;
                          objc_msgSend(v29, "addObject:", v28);

                          goto LABEL_24;
                        }
                      }
                    }
                  }
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v16)
                continue;
              break;
            }
LABEL_24:
            v8 = v32;
            i = v36;
          }

        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v35);
    }
    else
    {
      v33 = 0;
    }

    v9 = v33;
  }

  return v9;
}

- (id)treeDumpCacheResultDataForSupportsAttributesTypeRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "requestType");
  objc_msgSend(v4, "translation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bridgeDelegateToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPTranslator treeDumpResponseCacheForBridgeDelegateToken:](self, "treeDumpResponseCacheForBridgeDelegateToken:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v5 == 10 && v8)
  {
    objc_msgSend(v4, "parameters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("attributes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v11;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v33)
    {
      v31 = *(_QWORD *)v40;
      v32 = 0;
      v30 = v8;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v40 != v31)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          objc_msgSend(v8, "treeDumpResponse");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v15)
          {
            v16 = v15;
            v34 = i;
            v17 = *(_QWORD *)v36;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v36 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                if (objc_msgSend(v19, "associatedRequestType") == 10)
                {
                  objc_msgSend(v19, "associatedTranslationObject");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "translation");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v20, "isEqual:", v21);

                  if (v22)
                  {
                    objc_msgSend(v19, "resultData");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    isKindOfClass = objc_opt_isKindOfClass();

                    if ((isKindOfClass & 1) != 0)
                    {
                      objc_msgSend(v19, "resultData");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v25, "objectForKey:", v13);
                      v26 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v26)
                      {
                        v27 = v32;
                        if (!v32)
                          v27 = (void *)objc_opt_new();
                        v32 = v27;
                        objc_msgSend(v27, "setObject:forKey:", v26, v13);

                        goto LABEL_23;
                      }
                    }
                  }
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              if (v16)
                continue;
              break;
            }
LABEL_23:
            v8 = v30;
            i = v34;
          }

        }
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v33);
    }
    else
    {
      v32 = 0;
    }

    v9 = v32;
  }

  return v9;
}

- (id)checkTreeDumpCacheForRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = 0;
  switch(objc_msgSend(v4, "requestType"))
  {
    case 2:
      objc_msgSend(v5, "setAttribute:", objc_msgSend(v4, "attributeType"));
      goto LABEL_3;
    case 3:
      objc_msgSend(v5, "setAttribute:", objc_msgSend(v4, "attributeType"));
      -[AXPTranslator treeDumpCacheResultDataForCanSetAttributeTypeRequest:](self, "treeDumpCacheResultDataForCanSetAttributeTypeRequest:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      objc_msgSend(v4, "translation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bridgeDelegateToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXPTranslator _checkCacheForFrontmostAppResponseWithBridgeDelegateToken:](self, "_checkCacheForFrontmostAppResponseWithBridgeDelegateToken:", v9);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 5:
LABEL_3:
      -[AXPTranslator treeDumpCacheResultDataForAttributeTypeRequest:](self, "treeDumpCacheResultDataForAttributeTypeRequest:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 9:
      -[AXPTranslator treeDumpCacheResultDataForSupportedActionsTypeRequest:](self, "treeDumpCacheResultDataForSupportedActionsTypeRequest:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 10:
      -[AXPTranslator treeDumpCacheResultDataForSupportsAttributesTypeRequest:](self, "treeDumpCacheResultDataForSupportsAttributesTypeRequest:", v4);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v10 = (void *)v7;
      objc_msgSend(v5, "setResultData:", v7);

      objc_msgSend(v5, "resultData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        v12 = v5;
      else
        v12 = 0;
      v6 = v12;
      break;
    default:
      break;
  }

  return v6;
}

- (id)platformTranslator
{
  return +[AXPTranslator_iOS sharedInstance](AXPTranslator_iOS, "sharedInstance");
}

- (id)processTranslatorRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[AXPTranslator platformTranslator](self, "platformTranslator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableAccessibility");
  switch(objc_msgSend(v4, "requestType"))
  {
    case 1:
      objc_msgSend(v5, "processApplicationObject:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 2:
      objc_msgSend(v5, "processAttributeRequest:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 3:
      objc_msgSend(v5, "processCanSetAttribute:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4:
      objc_msgSend(v5, "processFrontMostApp:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5:
      objc_msgSend(v5, "processMultipleAttributeRequest:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 6:
      objc_msgSend(v5, "processHitTest:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 7:
      objc_msgSend(v5, "processActionRequest:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 8:
      objc_msgSend(v5, "processSetAttribute:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 9:
      objc_msgSend(v5, "processSupportedActions:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 10:
      objc_msgSend(v5, "processSupportsAttributes:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 11:
      objc_msgSend(v5, "processAXTreeElements:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v7 = (void *)v6;
      if (!v6)
        goto LABEL_14;
      goto LABEL_15;
    default:
LABEL_14:
      +[AXPTranslatorResponse emptyResponse](AXPTranslatorResponse, "emptyResponse");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      objc_msgSend(v7, "setAssociatedRequestType:", objc_msgSend(v4, "requestType"));

      return v7;
  }
}

- (id)objectAtPoint:(CGPoint)a3 displayId:(unsigned int)a4 bridgeDelegateToken:(id)a5
{
  uint64_t v5;
  double y;
  double x;
  id v9;
  AXPTranslationObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];

  v5 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  v19[2] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = -[AXPTranslationObject init]([AXPTranslationObject alloc], "init");
  -[AXPTranslationObject setBridgeDelegateToken:](v10, "setBridgeDelegateToken:", v9);

  +[AXPTranslatorRequest requestWithTranslation:](AXPTranslatorRequest, "requestWithTranslation:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRequestType:", 6);
  v18[0] = CFSTR("point");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = CFSTR("displayId");
  v19[0] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setParameters:", v14);

  -[AXPTranslator sendTranslatorRequest:](self, "sendTranslatorRequest:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "translationResponse");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)iosPlatformElementFromTranslation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AXPTranslator platformTranslator](self, "platformTranslator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "platformElementFromTranslation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setSystemAppDelegate:(id)a3
{
  id v4;
  AXPTranslator *v5;
  AXPTranslator *v6;
  _QWORD block[4];
  AXPTranslator *v8;

  v4 = a3;
  objc_storeWeak((id *)&self->_systemAppDelegate, v4);
  -[AXPTranslator platformTranslator](self, "platformTranslator");
  v5 = (AXPTranslator *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 != self)
  {
    -[AXPTranslator setSystemAppDelegate:](v5, "setSystemAppDelegate:", v4);
    if (objc_msgSend(v4, "requiresAXRuntimeInitialization"))
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__AXPTranslator_setSystemAppDelegate___block_invoke;
      block[3] = &unk_24E6ABDB0;
      v8 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

uint64_t __38__AXPTranslator_setSystemAppDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initializeAXRuntimeForSystemAppServer");
}

- (void)setBridgeDelegate:(id)a3
{
  AXPTranslator *v4;
  AXPTranslator *v5;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_bridgeDelegate, v6);
  -[AXPTranslator platformTranslator](self, "platformTranslator");
  v4 = (AXPTranslator *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != self)
    -[AXPTranslator setBridgeDelegate:](v4, "setBridgeDelegate:", v6);

}

- (void)setBridgeTokenDelegate:(id)a3
{
  AXPTranslator *v4;
  AXPTranslator *v5;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_bridgeTokenDelegate, v6);
  -[AXPTranslator setSupportsDelegateTokens:](self, "setSupportsDelegateTokens:", v6 != 0);
  -[AXPTranslator platformTranslator](self, "platformTranslator");
  v4 = (AXPTranslator *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != self)
  {
    -[AXPTranslator setBridgeTokenDelegate:](v4, "setBridgeTokenDelegate:", v6);
    -[AXPTranslator setSupportsDelegateTokens:](v5, "setSupportsDelegateTokens:", -[AXPTranslator supportsDelegateTokens](self, "supportsDelegateTokens"));
  }

}

- (void)setRuntimeDelegate:(id)a3
{
  AXPTranslator *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_runtimeDelegate, v6);
  -[AXPTranslator platformTranslator](self, "platformTranslator");
  v4 = (AXPTranslator *)objc_claimAutoreleasedReturnValue();

  if (v4 != self)
  {
    -[AXPTranslator platformTranslator](self, "platformTranslator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRuntimeDelegate:", v6);

  }
}

- (void)setRequestResolvingBehavior:(unint64_t)a3
{
  void *v5;
  AXPTranslator *v6;
  id v7;

  if (self->_requestResolvingBehavior != a3)
  {
    if (a3)
    {
      if (a3 <= 2)
      {
        v5 = (void *)objc_opt_new();
        -[AXPTranslator setBridgeDelegateTokenToTreeDumpLookup:](self, "setBridgeDelegateTokenToTreeDumpLookup:", v5);

      }
    }
    else
    {
      -[AXPTranslator setBridgeDelegateTokenToTreeDumpLookup:](self, "setBridgeDelegateTokenToTreeDumpLookup:", 0);
    }
    self->_requestResolvingBehavior = a3;
    -[AXPTranslator platformTranslator](self, "platformTranslator");
    v6 = (AXPTranslator *)objc_claimAutoreleasedReturnValue();

    if (v6 != self)
    {
      -[AXPTranslator platformTranslator](self, "platformTranslator");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRequestResolvingBehavior:", a3);

    }
  }
}

- (void)setAccessibilityEnabled:(BOOL)a3
{
  _BOOL8 v3;
  AXPTranslator *v5;
  id v6;

  v3 = a3;
  self->_accessibilityEnabled = a3;
  -[AXPTranslator platformTranslator](self, "platformTranslator");
  v5 = (AXPTranslator *)objc_claimAutoreleasedReturnValue();

  if (v5 != self)
  {
    -[AXPTranslator platformTranslator](self, "platformTranslator");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityEnabled:", v3);

  }
}

- (id)generateInitialAXTreeDump
{
  AXPTranslationObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[AXPTranslationObject init]([AXPTranslationObject alloc], "init");
  +[AXPTranslatorRequest requestWithTranslation:](AXPTranslatorRequest, "requestWithTranslation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestType:", 11);
  v9 = CFSTR("treeDumpType");
  v10[0] = CFSTR("AXPTreeDumpTypeInitialDump");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParameters:", v5);

  -[AXPTranslator platformTranslator](self, "platformTranslator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processAXTreeElements:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)generateAdditionalAXTreeDump
{
  AXPTranslationObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[AXPTranslationObject init]([AXPTranslationObject alloc], "init");
  +[AXPTranslatorRequest requestWithTranslation:](AXPTranslatorRequest, "requestWithTranslation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestType:", 11);
  v9 = CFSTR("treeDumpType");
  v10[0] = CFSTR("AXPTreeDumpTypeAdditionalData");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParameters:", v5);

  -[AXPTranslator platformTranslator](self, "platformTranslator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processAXTreeElements:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)accessibilityEnabled
{
  return self->_accessibilityEnabled;
}

- (AXPTranslationDelegateHelper)bridgeDelegate
{
  return (AXPTranslationDelegateHelper *)objc_loadWeakRetained((id *)&self->_bridgeDelegate);
}

- (AXPTranslationTokenDelegateHelper)bridgeTokenDelegate
{
  return (AXPTranslationTokenDelegateHelper *)objc_loadWeakRetained((id *)&self->_bridgeTokenDelegate);
}

- (unint64_t)requestResolvingBehavior
{
  return self->_requestResolvingBehavior;
}

- (AXPTranslationRuntimeHelper)runtimeDelegate
{
  return (AXPTranslationRuntimeHelper *)objc_loadWeakRetained((id *)&self->_runtimeDelegate);
}

- (AXPTranslationSystemAppDelegate)systemAppDelegate
{
  return (AXPTranslationSystemAppDelegate *)objc_loadWeakRetained((id *)&self->_systemAppDelegate);
}

- (NSMutableDictionary)fakeElementCache
{
  return self->_fakeElementCache;
}

- (void)setFakeElementCache:(id)a3
{
  objc_storeStrong((id *)&self->_fakeElementCache, a3);
}

- (BOOL)supportsDelegateTokens
{
  return self->_supportsDelegateTokens;
}

- (void)setSupportsDelegateTokens:(BOOL)a3
{
  self->_supportsDelegateTokens = a3;
}

- (NSMutableDictionary)bridgeDelegateTokenToTreeDumpLookup
{
  return self->_bridgeDelegateTokenToTreeDumpLookup;
}

- (void)setBridgeDelegateTokenToTreeDumpLookup:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeDelegateTokenToTreeDumpLookup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgeDelegateTokenToTreeDumpLookup, 0);
  objc_storeStrong((id *)&self->_fakeElementCache, 0);
  objc_destroyWeak((id *)&self->_systemAppDelegate);
  objc_destroyWeak((id *)&self->_runtimeDelegate);
  objc_destroyWeak((id *)&self->_bridgeTokenDelegate);
  objc_destroyWeak((id *)&self->_bridgeDelegate);
}

void __54__AXPTranslator_iOS__enableAccessibilityBridgeRuntime__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_220DB6000, a1, a3, "App accessibility not enabled", a5, a6, a7, a8, 0);
}

- (id)processMultipleAttributeRequest:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)processActionRequest:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)processSetAttribute:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)processCanSetAttribute:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)processAttributeRequest:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)processHitTest:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)processFrontMostApp:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)processSupportedActions:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)processSupportsAttributes:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)processAXTreeElements:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)attributedStringConversionBlock
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (void)processPlatformNotification:(unint64_t)a3 data:(id)a4
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
}

- (void)processPlatformAXTreeDump:(id)a3
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
}

- (void)enableAccessibility
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
}

- (void)initializeAXRuntimeForSystemAppServer
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0();
}

- (id)platformElementFromTranslation:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)translationObjectFromData:(id)a3
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (id)remoteTranslationDataWithTranslation:(id)a3 pid:(int)a4
{
  id result;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0();
  return result;
}

- (void)handleNotification:(void *)a1 data:(void *)a2 associatedObject:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "fakeElementCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(a1, "objectID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = a1;
  v11 = 2112;
  v12 = v7;
  OUTLINED_FUNCTION_5(&dword_220DB6000, a3, v8, "Removing element: %@ -> %@", (uint8_t *)&v9);

}

- (void)handleNotification:(unint64_t)a1 data:(uint64_t)a2 associatedObject:(NSObject *)a3 .cold.2(unint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _AXPNotificationToString(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412547;
  v8 = v5;
  v9 = 2117;
  v10 = a2;
  OUTLINED_FUNCTION_5(&dword_220DB6000, a3, v6, "Handle notification: %@: %{sensitive}@", (uint8_t *)&v7);

}

- (void)handleUpdatedAXTree:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[AXPTranslator handleUpdatedAXTree:]";
  _os_log_error_impl(&dword_220DB6000, log, OS_LOG_TYPE_ERROR, "%s: bridgeTokenDelegate is nil!", (uint8_t *)&v1, 0xCu);
}

- (void)handleUpdatedAXTree:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_220DB6000, log, OS_LOG_TYPE_DEBUG, "Handling updated AX Tree", v1, 2u);
}

- (void)sendTranslatorRequest:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_220DB6000, log, OS_LOG_TYPE_ERROR, "No bridge delegate set!", v1, 2u);
}

@end
