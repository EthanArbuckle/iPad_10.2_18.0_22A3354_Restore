@implementation CKMenuBarManager

- (id)allKeyboardShortcutKeyCommands
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SEL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  SEL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  SEL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  SEL v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SEL v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0CEB740], 0, NSSelectorFromString(CFSTR("escButtonPressed:")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("]"), 0x100000, NSSelectorFromString(CFSTR("keyCommandNextConversation:")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("["), 0x100000, NSSelectorFromString(CFSTR("keyCommandPreviousConversation:")));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("}"), 0x100000, NSSelectorFromString(CFSTR("keyCommandNextConversation:")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("{"), 0x100000, NSSelectorFromString(CFSTR("keyCommandPreviousConversation:")));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "maximumNumberOfPinnedConversations");

  if (v10 >= 9)
    v11 = 9;
  else
    v11 = v10;
  if (v11)
  {
    v12 = 0;
    do
    {
      ++v12;
      v13 = (void *)MEMORY[0x1E0CEA6B8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "keyCommandWithInput:modifierFlags:action:", v15, 0x100000, NSSelectorFromString(CFSTR("keyCommandSelectPinnedConversation:")));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v16);

    }
    while (v11 != v12);
  }
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("1"), 1179648, NSSelectorFromString(CFSTR("keyCommandSelectFirstActiveConversation")));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  -[CKMenuBarManager filterCommands](self, "filterCommands");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v18);

  v19 = (void *)MEMORY[0x1E0CEA6B8];
  v20 = NSSelectorFromString(CFSTR("keyCommandCompose:"));
  CKFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "keyCommandWithInput:modifierFlags:action:upAction:discoverabilityTitle:", CFSTR("N"), 0x100000, v20, 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = objc_msgSend(v24, "isExpressiveTextEnabled");

  if ((_DWORD)v20)
    v25 = 1572864;
  else
    v25 = 0x100000;
  v26 = (void *)MEMORY[0x1E0CEA6B8];
  v27 = NSSelectorFromString(CFSTR("keyCommandToggleDetails"));
  CKFrameworkBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("SHOW_DETAILS"), &stru_1E276D870, CFSTR("ChatKit"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "keyCommandWithInput:modifierFlags:action:upAction:discoverabilityTitle:", CFSTR("I"), v25, v27, 0, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  v31 = (void *)MEMORY[0x1E0CEA6B8];
  v32 = NSSelectorFromString(CFSTR("keyCommandFind:"));
  CKFrameworkBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("FIND_ELLIPSIS"), &stru_1E276D870, CFSTR("ChatKit"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "keyCommandWithInput:modifierFlags:action:upAction:discoverabilityTitle:", CFSTR("F"), 0x100000, v32, 0, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v35);

  v36 = (void *)MEMORY[0x1E0CEA6B8];
  v37 = NSSelectorFromString(CFSTR("keyCommandNextConversation:"));
  CKFrameworkBundle();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("NEXT_CONVERSATION"), &stru_1E276D870, CFSTR("ChatKit"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "keyCommandWithInput:modifierFlags:action:upAction:discoverabilityTitle:", CFSTR("\t"), 0x40000, v37, 0, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v3, "addObject:", v40);
  v41 = (void *)MEMORY[0x1E0CEA6B8];
  v42 = NSSelectorFromString(CFSTR("keyCommandPreviousConversation:"));
  CKFrameworkBundle();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("PREVIOUS_CONVERSATION"), &stru_1E276D870, CFSTR("ChatKit"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "keyCommandWithInput:modifierFlags:action:upAction:discoverabilityTitle:", CFSTR("\t"), 393216, v42, 0, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v3, "addObject:", v45);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v41) = objc_msgSend(v46, "isExpressiveTextEnabled");

  if ((v41 & 1) != 0)
  {
    +[CKTextEffectsMenuFactory effectKeyCommandsWithAction:](CKTextEffectsMenuFactory, "effectKeyCommandsWithAction:", NSSelectorFromString(CFSTR("keyCommandApplyTextEffect:")));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v47);
    +[CKTextEffectsMenuFactory textStyleKeyCommandsWithAction:configureImages:configureAttributedTitles:activeTextStyles:](CKTextEffectsMenuFactory, "textStyleKeyCommandsWithAction:configureImages:configureAttributedTitles:activeTextStyles:", NSSelectorFromString(CFSTR("keyCommandApplyTextStyle:")), 0, 0, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v48);

  }
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "isInternalInstall");

  if (v50)
  {
    objc_msgSend(MEMORY[0x1E0CEA6B8], "ck_debugMenuWithAction:", NSSelectorFromString(CFSTR("showDebugMenu:")));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v51);

  }
  return v3;
}

- (NSArray)filterCommands
{
  return self->_filterCommands;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_24);
  return (id)sharedInstance_sInstance;
}

void __34__CKMenuBarManager_sharedInstance__block_invoke()
{
  CKMenuBarManager *v0;
  void *v1;

  v0 = objc_alloc_init(CKMenuBarManager);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;

}

- (void)setFilterCommands:(id)a3
{
  objc_storeStrong((id *)&self->_filterCommands, a3);
}

- (NSDictionary)filterImagesByFilterMode
{
  return self->_filterImagesByFilterMode;
}

- (void)setFilterImagesByFilterMode:(id)a3
{
  objc_storeStrong((id *)&self->_filterImagesByFilterMode, a3);
}

- (BOOL)shouldForceFilterImageReload
{
  return self->_shouldForceFilterImageReload;
}

- (void)setShouldForceFilterImageReload:(BOOL)a3
{
  self->_shouldForceFilterImageReload = a3;
}

- (BOOL)shouldConfigureAttributedTextStyleTitles
{
  return self->_shouldConfigureAttributedTextStyleTitles;
}

- (void)setShouldConfigureAttributedTextStyleTitles:(BOOL)a3
{
  self->_shouldConfigureAttributedTextStyleTitles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterImagesByFilterMode, 0);
  objc_storeStrong((id *)&self->_filterCommands, 0);
}

@end
