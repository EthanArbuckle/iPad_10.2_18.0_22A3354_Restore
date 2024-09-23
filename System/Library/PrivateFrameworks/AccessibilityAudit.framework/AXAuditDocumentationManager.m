@implementation AXAuditDocumentationManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__AXAuditDocumentationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_5 != -1)
    dispatch_once(&sharedManager_onceToken_5, block);
  return (id)sharedManager_instance_5;
}

void __44__AXAuditDocumentationManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance_5;
  sharedManager_instance_5 = v0;

}

+ (id)webpageURLs
{
  id v2;
  _QWORD block[4];
  __CFString *v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AXAuditDocumentationManager_webpageURLs__block_invoke;
  block[3] = &unk_25071ABD8;
  v5 = CFSTR("https://developer.apple.com");
  if (webpageURLs_once != -1)
    dispatch_once(&webpageURLs_once, block);
  v2 = (id)webpageURLs_returnValue;

  return v2;
}

void __42__AXAuditDocumentationManager_webpageURLs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[46];
  _QWORD v51[48];

  v51[46] = *MEMORY[0x24BDAC8D0];
  v50[0] = &unk_25072A468;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1534976-accessibilitylabel"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v49;
  v50[1] = &unk_25072A480;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535033-accessibilitytitle"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v48;
  v50[2] = &unk_25072A498;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535103-accessibilityvalue"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v47;
  v50[3] = &unk_25072A4B0;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535144-accessibilityroledescription"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v46;
  v50[4] = &unk_25072A4C8;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535018-accessibilitychildren"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v45;
  v50[5] = &unk_25072A4E0;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/2869552-accessibilitychildreninnavigatio"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v44;
  v50[6] = &unk_25072A4F8;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1534996-accessibilityextrasmenubar"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v43;
  v50[7] = &unk_25072A510;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibilitylayoutarea/1533902-accessibilityfocuseduielement"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v42;
  v50[8] = &unk_25072A528;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1534986-accessibilityfocusedwindow"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v51[8] = v41;
  v50[9] = &unk_25072A540;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535073-accessibilityfrontmost"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v51[9] = v40;
  v50[10] = &unk_25072A558;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/attribute/1530325-topleveluielement"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v51[10] = v39;
  v50[11] = &unk_25072A570;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1534961-accessibilityhidden"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v51[11] = v38;
  v50[12] = &unk_25072A588;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535138-accessibilitymainwindow"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v51[12] = v37;
  v50[13] = &unk_25072A5A0;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535055-accessibilitymenubar"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51[13] = v36;
  v50[14] = &unk_25072A5B8;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535005-accessibilityrole"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51[14] = v35;
  v50[15] = &unk_25072A5D0;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535117-accessibilitywindows"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v51[15] = v34;
  v50[16] = &unk_25072A5E8;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/objectivec/nsobject/1411337-classname"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51[16] = v33;
  v50[17] = &unk_25072A600;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1532774-accessibilityperformshowmenu"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v51[17] = v32;
  v50[18] = &unk_25072A618;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1526358-accessibilityperformpress"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v51[18] = v31;
  v50[19] = &unk_25072A630;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibilitypositionattribute"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[19] = v30;
  v50[20] = &unk_25072A648;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibilitysizeattribute"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[20] = v29;
  v50[21] = &unk_25072A660;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535040-accessibilityparent"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[21] = v28;
  v50[22] = &unk_25072A678;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1534974-accessibilityhelp"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51[22] = v27;
  v50[23] = &unk_25072A690;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1534939-accessibilityframe"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51[23] = v26;
  v50[24] = &unk_25072A6A8;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1534994-accessibilityfocused"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51[24] = v25;
  v50[25] = &unk_25072A6C0;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535024-accessibilityenabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[25] = v24;
  v50[26] = &unk_25072A6D8;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535149-accessibilityactivationpoint"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51[26] = v23;
  v50[27] = &unk_25072A6F0;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535030-accessibilitywindow"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51[27] = v22;
  v50[28] = &unk_25072A708;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535157-accessibilityurl"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51[28] = v21;
  v50[29] = &unk_25072A720;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535092-accessibilitytopleveluielement"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51[29] = v20;
  v50[30] = &unk_25072A738;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/appkit/nsaccessibility/1535070-accessibilitysubrole"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51[30] = v19;
  v50[31] = &unk_25072A750;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/uikit/uiaccessibilityelement/1619577-accessibilitylabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v51[31] = v18;
  v50[32] = &unk_25072A768;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/uikit/uiaccessibilityelement/1619583-accessibilityvalue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51[32] = v17;
  v50[33] = &unk_25072A780;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/uikit/uiaccessibilityelement/1619584-accessibilitytraits"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51[33] = v16;
  v50[34] = &unk_25072A798;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/uikit/uiaccessibilityidentification"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51[34] = v15;
  v50[35] = &unk_25072A7B0;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/objectivec/nsobject/uiaccessibilityaction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v51[35] = v14;
  v50[36] = &unk_25072A7C8;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/objectivec/nsobject/1615093-accessibilityhint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v51[36] = v2;
  v50[37] = &unk_25072A7E0;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/objectivec/nsobject/3197989-accessibilityuserinputlabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v51[37] = v3;
  v50[38] = &unk_25072A7F8;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/objectivec/nsobject/1615165-accessibilityactivate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v51[38] = v4;
  v50[39] = &unk_25072A810;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/objectivec/nsobject/1615076-accessibilityincrement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51[39] = v5;
  v50[40] = &unk_25072A828;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/objectivec/nsobject/1615169-accessibilitydecrement"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v51[40] = v6;
  v50[41] = &unk_25072A840;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/objectivec/nsobject/1615161-accessibilityscroll"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v51[41] = v7;
  v50[42] = &unk_25072A858;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/objectivec/nsobject/1615202-accessibilitytraits"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51[42] = v8;
  v50[43] = &unk_25072A870;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/uikit/uiaccessibility/uiaccessibilitycontainertype"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v51[43] = v9;
  v50[44] = &unk_25072A888;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/objectivec/nsobject/1615181-accessibilitylabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51[44] = v10;
  v50[45] = &unk_25072A8A0;
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingString:", CFSTR("/documentation/objectivec/nsobject/1615117-accessibilityvalue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v51[45] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 46);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)webpageURLs_returnValue;
  webpageURLs_returnValue = v12;

}

+ (id)appleDocViewerURLs
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__AXAuditDocumentationManager_appleDocViewerURLs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (appleDocViewerURLs_once != -1)
    dispatch_once(&appleDocViewerURLs_once, block);
  return 0;
}

void __49__AXAuditDocumentationManager_appleDocViewerURLs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "webpageURLs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v5);
        objc_msgSend(*(id *)(a1 + 32), "webpageURLs");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 32), "_appleDocViewerURLForWebDocURL:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "absoluteString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(0, "setObject:forKey:", v11, v6);

        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }

}

+ (id)appleDocURLForType:(int64_t)a3
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "webDocURLForType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "_appleDocViewerURLForWebDocURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_appleDocViewerURLForWebDocURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(a3, "absoluteString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("%252F"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("https:%252F%252Fdeveloper.apple.com"), CFSTR("x-xcode-documentation:/apple-built-in/doc%253A%252F%252Fcom.apple.documentation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)webDocURLForType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "webpageURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
  return v7;
}

+ (id)_getOriginaliOSTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_macOSToiOSTitleDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

+ (int64_t)getAXDocumentationType:(id)a3 isCatalyst:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "_getOriginaliOSTitle:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_docTypeCatalystDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)v7;
  }
  else
  {
    objc_msgSend(a1, "_docTypeDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = (int)objc_msgSend(v9, "intValue");

LABEL_7:
  return v11;
}

+ (id)_macOSToiOSTitleDictionary
{
  if (_macOSToiOSTitleDictionary_once != -1)
    dispatch_once(&_macOSToiOSTitleDictionary_once, &__block_literal_global_18);
  return (id)_macOSToiOSTitleDictionary_macOSToiOSTitleDictionary;
}

void __57__AXAuditDocumentationManager__macOSToiOSTitleDictionary__block_invoke()
{
  void *v0;

  v0 = (void *)_macOSToiOSTitleDictionary_macOSToiOSTitleDictionary;
  _macOSToiOSTitleDictionary_macOSToiOSTitleDictionary = (uint64_t)&unk_25072A960;

}

+ (id)_docTypeCatalystDictionary
{
  if (_docTypeCatalystDictionary_once != -1)
    dispatch_once(&_docTypeCatalystDictionary_once, &__block_literal_global_159);
  return (id)_docTypeCatalystDictionary_docTypeCatalystDictionary;
}

void __57__AXAuditDocumentationManager__docTypeCatalystDictionary__block_invoke()
{
  void *v0;

  v0 = (void *)_docTypeCatalystDictionary_docTypeCatalystDictionary;
  _docTypeCatalystDictionary_docTypeCatalystDictionary = (uint64_t)&unk_25072A988;

}

+ (id)_docTypeDictionary
{
  if (_docTypeDictionary_once != -1)
    dispatch_once(&_docTypeDictionary_once, &__block_literal_global_171);
  return (id)_docTypeDictionary_docTypeDictionary;
}

void __49__AXAuditDocumentationManager__docTypeDictionary__block_invoke()
{
  void *v0;

  v0 = (void *)_docTypeDictionary_docTypeDictionary;
  _docTypeDictionary_docTypeDictionary = (uint64_t)&unk_25072A9B0;

}

@end
