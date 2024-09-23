@implementation UITextInteraction

void __74__UITextInteraction_QSExtras__updatedAccessibilityTextSpeechMenuWithMenu___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void (**v43)(id, void *);
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  id v52;
  id *from;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  void *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  void *v71;
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v43 = a2;
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "selectedContent");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "unpredictedAmbiguousLangMaps");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "predictedSecondaryLangMaps");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "unambiguousLangMaps");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v46;
  if ((unint64_t)objc_msgSend(v46, "count") < 2)
  {
    if (objc_msgSend(v46, "count") != 1)
    {
      v57 = 0;
      goto LABEL_7;
    }
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityQuickSpeakLocalizedString(CFSTR("quickspeak.one.nonambiguous.language"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultDialect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageNameInNativeLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v4, v8);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityQuickSpeakLocalizedString(CFSTR("quickspeak.many.languages"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v4, objc_msgSend(v46, "count"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v3 = v46;
LABEL_7:
  v9 = v45;
  if (v45 && objc_msgSend(v3, "intersectsOrderedSet:", v45))
  {
    AXLogSpeakSelection();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v74 = v45;
      v75 = 2112;
      v76 = v46;
      _os_log_impl(&dword_230C05000, v10, OS_LOG_TYPE_INFO, "Secondary maps contained langs in non ambiguous maps. Secondary Maps: %@ Non-ambiguous Maps: %@", buf, 0x16u);
    }

    v9 = v45;
  }
  v11 = v9 == 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unionOrderedSet:", v44);
  if (!v11)
  {
    objc_msgSend(v47, "primaryUnambiguousDialect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (v14)
    {
      objc_msgSend(v47, "primaryAmbiguousDialect");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (v17)
      {
LABEL_18:
        objc_msgSend(v12, "unionOrderedSet:", v45);
        goto LABEL_19;
      }
      objc_msgSend(v47, "primaryAmbiguousDialect");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v47, "primaryUnambiguousDialect");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v15;
    objc_msgSend(v15, "langMap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v19);

    goto LABEL_18;
  }
LABEL_19:
  v68 = 0u;
  v69 = 0u;
  v67 = 0u;
  v66 = 0u;
  obj = v12;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v50)
  {
    v49 = *(_QWORD *)v67;
    from = (id *)(a1 + 32);
    do
    {
      for (i = 0; i != v50; ++i)
      {
        if (*(_QWORD *)v67 != v49)
          objc_enumerationMutation(obj);
        v56 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v56, "associatedAmbiguousLanguages");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "systemLanguageID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "containsObject:", v22);

        if ((v23 & 1) == 0)
        {
          objc_msgSend(v56, "defaultDialect");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v24;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v71, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v52 = v25;
          v26 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
          if (!v26)
            goto LABEL_40;
          v27 = *(_QWORD *)v63;
          while (1)
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v63 != v27)
                objc_enumerationMutation(v52);
              v29 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "dialectForCurrentLocale");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "langMap");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v56, "isEqual:", v32) & 1) != 0)
              {
                objc_msgSend(MEMORY[0x24BE00658], "sharedInstance");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "dialectForCurrentLocale");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v29, "isEqual:", v34);

                if (!v35)
                  continue;
              }
              else
              {

              }
              objc_msgSend(v29, "languageNameInNativeLocale");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v36;
              if (v57)
              {
                v38 = (void *)MEMORY[0x24BDD17C8];
                accessibilityQuickSpeakLocalizedString(CFSTR("quickspeak.preferred.language"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "stringWithFormat:", v39, v37, v57);
                v40 = (id)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v40 = v36;
              }
              v41 = (void *)MEMORY[0x24BDF67B8];
              v58[0] = MEMORY[0x24BDAC760];
              v58[1] = 3221225472;
              v58[2] = __74__UITextInteraction_QSExtras__updatedAccessibilityTextSpeechMenuWithMenu___block_invoke_207;
              v58[3] = &unk_24FF24CA0;
              v59 = v55;
              objc_copyWeak(&v61, from);
              v60 = v29;
              objc_msgSend(v41, "actionWithTitle:image:identifier:handler:", v40, 0, 0, v58);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "addObject:", v42);

              objc_destroyWeak(&v61);
            }
            v26 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
            if (!v26)
            {
LABEL_40:

              break;
            }
          }
        }
      }
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    }
    while (v50);
  }

  v43[2](v43, v54);
}

void __74__UITextInteraction_QSExtras__updatedAccessibilityTextSpeechMenuWithMenu___block_invoke_207(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "specificLanguageID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speakAction:withPreferredLanguage:", WeakRetained, v3);

}

@end
