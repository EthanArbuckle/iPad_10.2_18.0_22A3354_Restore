@implementation IASTextInputActionsEvent

- (IASTextInputActionsEvent)initWithbundleId:(id)a3
{
  id v5;
  IASTextInputActionsEvent *v6;
  IASTextInputActionsEvent *v7;
  NSString *sessionActions;
  NSString *language;
  NSString *region;
  NSString *keyboardVariant;
  NSString *keyboardLayout;
  NSString *keyboardType;
  NSString *inputModeIdentifier;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IASTextInputActionsEvent;
  v6 = -[IASTextInputActionsEvent init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    *(_OWORD *)&v6->_netCharacters = 0u;
    *(_OWORD *)&v6->_netEmojiCharacters = 0u;
    *(_OWORD *)&v6->_source = 0u;
    sessionActions = v6->_sessionActions;
    v6->_inputActionCount = 0;
    v6->_sessionActions = (NSString *)CFSTR("T");

    *(_WORD *)&v7->_isEmojiSearch = 0;
    v7->_sessionIsModeless = 0;
    language = v7->_language;
    v7->_language = (NSString *)CFSTR("None");

    region = v7->_region;
    v7->_region = (NSString *)CFSTR("None");

    keyboardVariant = v7->_keyboardVariant;
    v7->_keyboardVariant = (NSString *)CFSTR("None");

    keyboardLayout = v7->_keyboardLayout;
    v7->_keyboardLayout = (NSString *)CFSTR("None");

    keyboardType = v7->_keyboardType;
    v7->_keyboardType = (NSString *)CFSTR("None");

    inputModeIdentifier = v7->_inputModeIdentifier;
    v7->_inputModeIdentifier = (NSString *)CFSTR("None");

    objc_storeStrong((id *)&v7->_bundleId, a3);
  }

  return v7;
}

- (void)dispatchEvent
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_dispatchEvent_(self, a2, (uint64_t)&unk_250F8F2D8, v2, v3);
}

- (void)dispatchEvent:(id)a3
{
  void (**v4)(id, void *);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isDispatchable;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  NSString *sessionActions;
  NSString *language;
  NSString *keyboardType;
  NSString *bundleId;
  const char *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[18];
  _QWORD v57[12];
  __int128 v58;
  NSString *keyboardLayout;
  NSString *v60;
  NSString *inputModeIdentifier;
  NSString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  isDispatchable = objc_msgSend_isDispatchable(self, v5, v6, v7, v8);
  if (v4 && isDispatchable)
  {
    v56[0] = CFSTR("src");
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v10, self->_source, v11, v12);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v55;
    v56[1] = CFSTR("type");
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v13, self->_type, v14, v15);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v54;
    v56[2] = CFSTR("netChars");
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v16, self->_netCharacters, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v19;
    v56[3] = CFSTR("usrRmChars");
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v20, self->_userRemovedCharacters, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v23;
    v56[4] = CFSTR("netEmojis");
    objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v24, self->_netEmojiCharacters, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v57[4] = v27;
    v56[5] = CFSTR("usrRmEmojis");
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v28, self->_userRemovedEmojiCharacters, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v57[5] = v31;
    v56[6] = CFSTR("isEmojiSearch");
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v32, self->_isEmojiSearch, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v57[6] = v35;
    v56[7] = CFSTR("isMarkedText");
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v36, self->_isMarkedText, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v57[7] = v39;
    v56[8] = CFSTR("inputActionCount");
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v40, self->_inputActionCount, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v57[8] = v43;
    v56[9] = CFSTR("sessionIsModeless");
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v44, self->_sessionIsModeless, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    sessionActions = self->_sessionActions;
    language = self->_language;
    v57[9] = v47;
    v57[10] = sessionActions;
    v56[10] = CFSTR("sessionActions");
    v56[11] = CFSTR("language");
    v57[11] = language;
    v58 = *(_OWORD *)&self->_region;
    v56[12] = CFSTR("region");
    v56[13] = CFSTR("kbVariant");
    v56[14] = CFSTR("kbLayout");
    v56[15] = CFSTR("kbType");
    keyboardType = self->_keyboardType;
    keyboardLayout = self->_keyboardLayout;
    v60 = keyboardType;
    v56[16] = CFSTR("kbConfiguration");
    v56[17] = CFSTR("bundleId");
    bundleId = self->_bundleId;
    inputModeIdentifier = self->_inputModeIdentifier;
    v62 = bundleId;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v52, (uint64_t)v57, (uint64_t)v56, 18);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v53);
  }

}

- (BOOL)isDispatchable
{
  return (self->_netCharacters
       || self->_netEmojiCharacters
       || self->_userRemovedCharacters
       || self->_inputActionCount
       || self->_userRemovedEmojiCharacters)
      && self->_sessionActions
      && self->_language
      && self->_region
      && self->_keyboardLayout
      && self->_keyboardVariant
      && self->_keyboardType
      && self->_inputModeIdentifier
      && self->_bundleId != 0;
}

- (void)resetMeasures
{
  self->_inputActionCount = 0;
  *(_OWORD *)&self->_netCharacters = 0u;
  *(_OWORD *)&self->_netEmojiCharacters = 0u;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)netCharacters
{
  return self->_netCharacters;
}

- (void)setNetCharacters:(int64_t)a3
{
  self->_netCharacters = a3;
}

- (unint64_t)userRemovedCharacters
{
  return self->_userRemovedCharacters;
}

- (void)setUserRemovedCharacters:(unint64_t)a3
{
  self->_userRemovedCharacters = a3;
}

- (int64_t)netEmojiCharacters
{
  return self->_netEmojiCharacters;
}

- (void)setNetEmojiCharacters:(int64_t)a3
{
  self->_netEmojiCharacters = a3;
}

- (unint64_t)userRemovedEmojiCharacters
{
  return self->_userRemovedEmojiCharacters;
}

- (void)setUserRemovedEmojiCharacters:(unint64_t)a3
{
  self->_userRemovedEmojiCharacters = a3;
}

- (unint64_t)inputActionCount
{
  return self->_inputActionCount;
}

- (void)setInputActionCount:(unint64_t)a3
{
  self->_inputActionCount = a3;
}

- (BOOL)isEmojiSearch
{
  return self->_isEmojiSearch;
}

- (void)setIsEmojiSearch:(BOOL)a3
{
  self->_isEmojiSearch = a3;
}

- (BOOL)isMarkedText
{
  return self->_isMarkedText;
}

- (void)setIsMarkedText:(BOOL)a3
{
  self->_isMarkedText = a3;
}

- (BOOL)sessionIsModeless
{
  return self->_sessionIsModeless;
}

- (void)setSessionIsModeless:(BOOL)a3
{
  self->_sessionIsModeless = a3;
}

- (NSString)sessionActions
{
  return self->_sessionActions;
}

- (void)setSessionActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)keyboardVariant
{
  return self->_keyboardVariant;
}

- (void)setKeyboardVariant:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)keyboardLayout
{
  return self->_keyboardLayout;
}

- (void)setKeyboardLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (void)setInputModeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_inputModeIdentifier, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
  objc_storeStrong((id *)&self->_keyboardVariant, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_sessionActions, 0);
}

@end
