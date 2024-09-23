@implementation UITextInteraction_QSExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextInteraction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_updatedAccessibilityTextSpeechMenuWithMenu:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
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
  NSObject *v33;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF7BC8]);

  if (v6)
  {
    AXLogSpeakSelection();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_230C05000, v7, OS_LOG_TYPE_INFO, "Will update AX speech items for UIMenu", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UITextInteraction_QSExtras _accessibilityQScanPerformAction:withSender:](self, "_accessibilityQScanPerformAction:withSender:", sel__accessibilitySpeak_, 0))
    {
      v9 = (void *)MEMORY[0x24BDF6960];
      accessibilityQuickSpeakLocalizedString(CFSTR("quickspeak.speak"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("play"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "commandWithTitle:image:action:propertyList:", v10, v11, sel__accessibilitySpeak_, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v12);
    }
    else if (-[UITextInteraction_QSExtras _accessibilityQScanPerformAction:withSender:](self, "_accessibilityQScanPerformAction:withSender:", sel__accessibilityPauseSpeaking_, 0))
    {
      v14 = (void *)MEMORY[0x24BDF6960];
      accessibilityQuickSpeakLocalizedString(CFSTR("quickspeak.pause"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("pause"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "commandWithTitle:image:action:propertyList:", v15, v16, sel__accessibilityPauseSpeaking_, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v17);
    }
    else if (-[UITextInteraction_QSExtras _accessibilityShouldShowSpeakLanguageBubble](self, "_accessibilityShouldShowSpeakLanguageBubble")&& -[UITextInteraction_QSExtras _accessibilitySystemShouldShowSpeakLanguageBubble](self, "_accessibilitySystemShouldShowSpeakLanguageBubble"))
    {
      objc_initWeak((id *)buf, self);
      v18 = (void *)MEMORY[0x24BDF69C0];
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __74__UITextInteraction_QSExtras__updatedAccessibilityTextSpeechMenuWithMenu___block_invoke;
      v35[3] = &unk_24FF24CC8;
      objc_copyWeak(&v36, (id *)buf);
      objc_msgSend(v18, "elementWithProvider:", v35);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BDF6BA8];
      accessibilityQuickSpeakLocalizedString(CFSTR("quickspeak.speak.languages"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("play"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "menuWithTitle:image:identifier:options:children:", v21, v22, 0, 0, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v24);
      objc_destroyWeak(&v36);
      objc_destroyWeak((id *)buf);
    }
    if (-[UITextInteraction_QSExtras _accessibilityQScanPerformAction:withSender:](self, "_accessibilityQScanPerformAction:withSender:", sel__accessibilitySpeakSentence_, 0))
    {
      v25 = (void *)MEMORY[0x24BDF6960];
      accessibilityQuickSpeakLocalizedString(CFSTR("quickspeak.sentence"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("play"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "commandWithTitle:image:action:propertyList:", v26, v27, sel__accessibilitySpeakSentence_, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v28);
    }
    if (-[UITextInteraction_QSExtras _accessibilityQScanPerformAction:withSender:](self, "_accessibilityQScanPerformAction:withSender:", sel__accessibilitySpeakSpellOut_, 0))
    {
      v29 = (void *)MEMORY[0x24BDF6960];
      accessibilityQuickSpeakLocalizedString(CFSTR("quickspeak.spell.out"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("play"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "commandWithTitle:image:action:propertyList:", v30, v31, sel__accessibilitySpeakSpellOut_, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v32);
    }
    AXLogSpeakSelection();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v8;
      _os_log_impl(&dword_230C05000, v33, OS_LOG_TYPE_INFO, "Did update AX speech items for UIMenu: %@", buf, 0xCu);
    }

    objc_msgSend(v4, "menuByReplacingChildren:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_updatedAccessibilityTextMenuWithMenuElements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)UITextInteraction_QSExtras;
  -[UITextInteraction_QSExtras _updatedAccessibilityTextMenuWithMenuElements:](&v21, sel__updatedAccessibilityTextMenuWithMenuElements_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else if (_AXSQuickSpeakEnabled()
         && (+[AXQuickSpeak sharedInstance](AXQuickSpeak, "sharedInstance"),
             v8 = (void *)objc_claimAutoreleasedReturnValue(),
             v9 = objc_msgSend(v8, "isSpeaking"),
             v8,
             (v9 & 1) == 0))
  {
    v7 = (id)objc_msgSend(v4, "mutableCopy");
    if (objc_msgSend(v7, "count"))
    {
      v10 = 0;
      v11 = *MEMORY[0x24BDF7BC8];
      do
      {
        objc_opt_class();
        objc_msgSend(v7, "objectAtIndex:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v11);

        if (v15)
        {
          -[UITextInteraction_QSExtras _updatedAccessibilityTextSpeechMenuWithMenu:](self, "_updatedAccessibilityTextSpeechMenuWithMenu:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v7, "setObject:atIndexedSubscript:", v16, v10);
          }
          else
          {
            objc_msgSend(v13, "children");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[UITextInteraction_QSExtras _updatedAccessibilityTextMenuWithMenuElements:](self, "_updatedAccessibilityTextMenuWithMenuElements:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v18, "count"))
            {
              objc_msgSend(v13, "menuByReplacingChildren:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:atIndexedSubscript:", v19, v10);

            }
          }

        }
        ++v10;
      }
      while (v10 < objc_msgSend(v7, "count"));
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
