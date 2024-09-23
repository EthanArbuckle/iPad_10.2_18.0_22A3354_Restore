@implementation NSObject_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NSObject");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilitySpeakSelectionTextInputResponder
{
  return 0;
}

- (BOOL)_accessibilityShouldShowSpeakBubble
{
  return 1;
}

- (BOOL)_accessibilityShouldShowSpeakLanguageBubble
{
  return 1;
}

- (BOOL)_accessibilityShouldShowPauseBubble
{
  return 1;
}

- (BOOL)_accessibilityIsTextInput
{
  char v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_opt_respondsToSelector();
  else
    v2 = 0;
  return v2 & 1;
}

- (BOOL)_accessibilityIsTextInteraction
{
  NSClassFromString(CFSTR("UITextInteraction"));
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  void *v3;
  void *v4;
  void *v5;
  NSObject_QSExtras *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(self, &CachedSelectedTextRange);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSObject_QSExtras _accessibilityIsTextInput](self, "_accessibilityIsTextInput"))
    v6 = self;
  else
    v6 = 0;
  if (-[NSObject_QSExtras _accessibilityIsTextInteraction](self, "_accessibilityIsTextInteraction"))
  {
    -[NSObject_QSExtras safeValueForKey:](self, "safeValueForKey:", CFSTR("_textInput"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (NSObject_QSExtras *)v7;
  }
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSObject_QSExtras selectedTextRange](v6, "selectedTextRange");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v11 = 1;
    if (v5)
    {
      if (v8)
      {
        v10 = (void *)objc_opt_class();
        if (objc_msgSend(v10, "isEqual:", objc_opt_class()))
        {
          if (objc_msgSend(v5, "isEqual:", v9)
            && (!objc_msgSend(v4, "length") || !objc_msgSend(v9, "isEmpty")))
          {
            v11 = 0;
          }
        }
      }
    }
    objc_setAssociatedObject(self, &CachedSelectedTextRange, v9, (void *)1);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_accessibilitySpeak:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSObject_QSExtras _accessibilityCacheContentIfNecessary](self, "_accessibilityCacheContentIfNecessary");
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "safeValueForKey:", CFSTR("dialect"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  +[AXQSMenuHelper sharedInstance](AXQSMenuHelper, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "restoreMenu");

  objc_msgSend(v5, "specificLanguageID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speakAction:withPreferredLanguage:", self, v7);

}

- (void)_accessibilitySpeakSpellOut:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[NSObject_QSExtras _accessibilityCacheContentIfNecessary](self, "_accessibilityCacheContentIfNecessary");
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "safeValueForKey:", CFSTR("dialect"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "specificLanguageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentInputModeInPreference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[AXQSMenuHelper sharedInstance](AXQSMenuHelper, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "restoreMenu");

  objc_msgSend(v4, "setSpellOutContent:", 1);
  objc_msgSend(v4, "speakAction:withPreferredLanguage:", self, v6);

}

- (void)_accessibilitySpeakSentence:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  -[NSObject_QSExtras _accessibilityQuickSpeakEnclosingSentence:](self, "_accessibilityQuickSpeakEnclosingSentence:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  objc_msgSend(v4, "setContent:", v5);

  objc_msgSend(v4, "setSpeakingSentenceRange:", v6);
  objc_msgSend(v4, "speakAction:withPreferredLanguage:", self, 0);

}

- (void)_accessibilityPauseSpeaking:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v3 = a3;
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSpeaking");

  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "pauseAction:", v3);
  else
    objc_msgSend(v6, "resumeAction:", v3);

}

- (void)_accessibilitySpeakLanguageSelection:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id obj;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  NSObject_QSExtras *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  void *v78;
  uint8_t v79[128];
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance", a3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "selectedContent");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "unpredictedAmbiguousLangMaps");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "predictedSecondaryLangMaps");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "unambiguousLangMaps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v4;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("quickspeak.many.languages"), 0, CFSTR("QuickSpeak"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v6, objc_msgSend(v4, "count"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "count") == 1)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultDialect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "languageNameInNativeLocale");
    v9 = v3;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("& %@"), v10);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v9;
LABEL_5:

    v4 = v51;
    if (!v3)
      goto LABEL_12;
    goto LABEL_8;
  }
  v64 = 0;
  if (!v3)
    goto LABEL_12;
LABEL_8:
  if (objc_msgSend(v4, "intersectsOrderedSet:", v3))
  {
    AXLogSpeakSelection();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v81 = v3;
      v82 = 2112;
      v83 = v4;
      _os_log_impl(&dword_230C05000, v11, OS_LOG_TYPE_INFO, "Secondary maps contained langs in non ambiguous maps. Secondary Maps: %@ Non-ambiguous Maps: %@", buf, 0x16u);
    }

  }
LABEL_12:
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unionOrderedSet:", v53);
  v50 = (void *)v3;
  if (!v3)
    goto LABEL_19;
  objc_msgSend(v52, "primaryUnambiguousDialect");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v52, "primaryUnambiguousDialect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
    v16 = v14;
    objc_msgSend(v14, "langMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v17);

    goto LABEL_18;
  }
  objc_msgSend(v52, "primaryAmbiguousDialect");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v52, "primaryAmbiguousDialect");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(v12, "unionOrderedSet:", v3);
LABEL_19:
  v75 = 0u;
  v76 = 0u;
  v74 = 0u;
  v73 = 0u;
  obj = v12;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v74;
    v21 = 0x24BE00000uLL;
    v54 = *(_QWORD *)v74;
    do
    {
      v22 = 0;
      v55 = v19;
      do
      {
        if (*(_QWORD *)v74 != v20)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v22);
        objc_msgSend(v23, "associatedAmbiguousLanguages");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v21 + 1624), "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "systemLanguageID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v24, "containsObject:", v26);

        if ((v27 & 1) == 0)
        {
          v57 = v22;
          objc_msgSend(v23, "defaultDialect");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = v28;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v59 = v29;
          v30 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
          v31 = 0x24BE00000uLL;
          if (!v30)
            goto LABEL_40;
          v32 = v30;
          v33 = *(_QWORD *)v70;
          while (1)
          {
            v34 = 0;
            v58 = v32;
            do
            {
              if (*(_QWORD *)v70 != v33)
                objc_enumerationMutation(v59);
              v35 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v34);
              objc_msgSend(*(id *)(v31 + 1624), "sharedInstance");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "dialectForCurrentLocale");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "langMap");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v23, "isEqual:", v38) & 1) != 0)
              {
                objc_msgSend(*(id *)(v31 + 1624), "sharedInstance");
                v39 = v33;
                v40 = v23;
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "dialectForCurrentLocale");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend(v35, "isEqual:", v42);

                v31 = 0x24BE00000;
                v23 = v40;
                v33 = v39;
                v32 = v58;

                if (!v63)
                  goto LABEL_38;
              }
              else
              {

              }
              objc_msgSend(v35, "languageNameInNativeLocale");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v43;
              if (v64)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v43, v64);
                v45 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v45 = v43;
              }
              v46 = v45;
              v47 = (void *)MEMORY[0x24BDF67B8];
              v65[0] = MEMORY[0x24BDAC760];
              v65[1] = 3221225472;
              v65[2] = __58__NSObject_QSExtras__accessibilitySpeakLanguageSelection___block_invoke;
              v65[3] = &unk_24FF24C50;
              v66 = v62;
              v67 = self;
              v68 = v35;
              objc_msgSend(v47, "actionWithTitle:image:identifier:handler:", v46, 0, 0, v65);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "addObject:", v48);

LABEL_38:
              ++v34;
            }
            while (v32 != v34);
            v32 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
            if (!v32)
            {
LABEL_40:

              v20 = v54;
              v19 = v55;
              v22 = v57;
              break;
            }
          }
        }
        ++v22;
        v21 = 0x24BE00000;
      }
      while (v22 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    }
    while (v19);
  }

  +[AXQSMenuHelper sharedInstance](AXQSMenuHelper, "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setShowingLanguageChoices:", 1);

}

- (BOOL)_accessibilitySystemShouldShowSpeakBubbleCommon
{
  int v3;
  void *v4;
  char v5;
  void *v6;
  char v7;

  v3 = _AXSQuickSpeakEnabled();
  if (v3)
  {
    +[AXQSMenuHelper sharedInstance](AXQSMenuHelper, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isShowingLanguageChoices");

    if ((v5 & 1) != 0
      || (+[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "isSpeaking"),
          v6,
          (v7 & 1) != 0))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LOBYTE(v3) = !+[AXQuickSpeak quickSpeakClassIsDenied:](AXQuickSpeak, "quickSpeakClassIsDenied:", self);
    }
  }
  return v3;
}

- (void)_accessibilityCacheContentIfNecessary
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  NSObject_QSExtras *v6;
  void *v7;
  void *v8;
  NSObject_QSExtras *v9;
  void *v10;
  id v11;

  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "content");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        v5 = -[NSObject_QSExtras _accessibilityShouldUpdateQuickSpeakContent](self, "_accessibilityShouldUpdateQuickSpeakContent"), v4, v5))
  {
    v6 = self;
    -[NSObject_QSExtras _accessibilityUITextInput](v6, "_accessibilityUITextInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = v6;
    if (v7)
    {
      v9 = v7;

    }
    -[NSObject_QSExtras _accessibilityQuickSpeakContent](v9, "_accessibilityQuickSpeakContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContent:", v10);
    objc_msgSend(v11, "setContentOwner:", v6);

  }
}

- (BOOL)_accessibilitySystemShouldShowSpeakSpellOut
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (-[NSObject_QSExtras _accessibilitySystemShouldShowSpeakBubbleCommon](self, "_accessibilitySystemShouldShowSpeakBubbleCommon"))
  {
    -[NSObject_QSExtras _accessibilityCacheContentIfNecessary](self, "_accessibilityCacheContentIfNecessary");
    +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x24BDD1638]);
    v19[0] = *MEMORY[0x24BDD0F88];
    v6 = v19[0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithTagSchemes:options:", v7, 0);

    objc_msgSend(v8, "setString:", v4);
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v9 = objc_msgSend(v4, "length");
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __64__NSObject_QSExtras__accessibilitySystemShouldShowSpeakSpellOut__block_invoke;
    v14[3] = &unk_24FF24C78;
    v14[4] = &v15;
    objc_msgSend(v8, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v9, v6, 0, v14);
    v10 = v16[3];
    if (v10 == 1)
    {
      objc_msgSend(v4, "rangeOfComposedCharacterSequenceAtIndex:", 0);
      if (v11 == objc_msgSend(v4, "length"))
      {
        v12 = 0;
LABEL_8:
        _Block_object_dispose(&v15, 8);

        return v12;
      }
      v10 = v16[3];
    }
    v12 = v10 == 1;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)_accessibilitySystemShouldShowSpeakSentence
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;

  if (!-[NSObject_QSExtras _accessibilitySystemShouldShowSpeakBubbleCommon](self, "_accessibilitySystemShouldShowSpeakBubbleCommon"))return 0;
  -[NSObject_QSExtras _accessibilityCacheContentIfNecessary](self, "_accessibilityCacheContentIfNecessary");
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (!objc_msgSend(v4, "length"))
  {
    -[NSObject_QSExtras _accessibilityQuickSpeakEnclosingSentence:](self, "_accessibilityQuickSpeakEnclosingSentence:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
      v5 = 1;
  }

  return v5;
}

- (BOOL)_accessibilitySystemShouldShowSpeakBubble
{
  void *v3;
  int v4;

  if (-[NSObject_QSExtras _accessibilitySystemShouldShowSpeakBubbleCommon](self, "_accessibilitySystemShouldShowSpeakBubbleCommon"))
  {
    +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isPaused") & 1) != 0)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      -[NSObject_QSExtras _accessibilityCacheContentIfNecessary](self, "_accessibilityCacheContentIfNecessary");
      if (objc_msgSend(v3, "selectedContentIsSpeakable"))
        v4 = objc_msgSend(v3, "selectedContentRequiresUserChoice") ^ 1;
      else
        LOBYTE(v4) = 0;
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_accessibilitySystemShouldShowSpeakLanguageBubble
{
  void *v3;
  char v4;

  if (!-[NSObject_QSExtras _accessibilitySystemShouldShowSpeakBubbleCommon](self, "_accessibilitySystemShouldShowSpeakBubbleCommon"))return 0;
  -[NSObject_QSExtras _accessibilityCacheContentIfNecessary](self, "_accessibilityCacheContentIfNecessary");
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPaused") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "selectedContentRequiresUserChoice");

  return v4;
}

- (BOOL)_accessibilitySystemShouldShowPauseBubble
{
  void *v2;
  char v3;
  void *v4;

  +[AXQSMenuHelper sharedInstance](AXQSMenuHelper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isShowingLanguageChoices") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isSpeaking");

  }
  return v3;
}

- (BOOL)_accessibilityQScanPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  char v8;
  void *v9;

  v6 = a4;
  if (sel__accessibilitySpeak_ == a3)
  {
    if (-[NSObject_QSExtras _accessibilitySystemShouldShowSpeakBubble](self, "_accessibilitySystemShouldShowSpeakBubble"))
    {
      v7 = -[NSObject_QSExtras _accessibilityShouldShowSpeakBubble](self, "_accessibilityShouldShowSpeakBubble");
      goto LABEL_13;
    }
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  if (sel__accessibilitySpeakSentence_ == a3)
  {
    v7 = -[NSObject_QSExtras _accessibilitySystemShouldShowSpeakSentence](self, "_accessibilitySystemShouldShowSpeakSentence");
    goto LABEL_13;
  }
  if (sel__accessibilitySpeakSpellOut_ == a3)
  {
    v7 = -[NSObject_QSExtras _accessibilityShouldShowSpeakSpellOut](self, "_accessibilityShouldShowSpeakSpellOut");
    goto LABEL_13;
  }
  if (sel__accessibilitySpeakWithLanguage_ == a3)
  {
    +[AXQSMenuHelper sharedInstance](AXQSMenuHelper, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isShowingLanguageChoices");

    goto LABEL_18;
  }
  if (sel__accessibilitySpeakLanguageSelection_ == a3)
  {
    if (-[NSObject_QSExtras _accessibilityShouldShowSpeakLanguageBubble](self, "_accessibilityShouldShowSpeakLanguageBubble"))
    {
      v7 = -[NSObject_QSExtras _accessibilitySystemShouldShowSpeakLanguageBubble](self, "_accessibilitySystemShouldShowSpeakLanguageBubble");
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  if (sel__accessibilityPauseSpeaking_ != a3
    || !-[NSObject_QSExtras _accessibilitySystemShouldShowPauseBubble](self, "_accessibilitySystemShouldShowPauseBubble"))
  {
    goto LABEL_17;
  }
  v7 = -[NSObject_QSExtras _accessibilityShouldShowPauseBubble](self, "_accessibilityShouldShowPauseBubble");
LABEL_13:
  v8 = v7;
LABEL_18:

  return v8;
}

- (BOOL)_accessibilityQuickSpeakContentIsSpeakable
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDFE4D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDFE4D0], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      AXColorizeFormatLog();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v8;
        _os_log_impl(&dword_230C05000, v5, v6, "%{public}@", buf, 0xCu);
      }

    }
  }
  +[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "selectedContentIsSpeakable");

  return v10;
}

@end
