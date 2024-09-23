@implementation LACUIAuthenticatorServiceConfiguration

- (LACUIAuthenticatorServiceConfiguration)initWithContext:(id)a3
{
  return -[LACUIAuthenticatorServiceConfiguration initWithContext:requirement:](self, "initWithContext:requirement:", a3, 1);
}

- (LACUIAuthenticatorServiceConfiguration)initWithContext:(id)a3 requirement:(unint64_t)a4
{
  id v7;
  LACUIAuthenticatorServiceConfiguration *v8;
  LACUIAuthenticatorServiceConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *passwordFieldPlaceholder;
  objc_super v21;

  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)LACUIAuthenticatorServiceConfiguration;
  v8 = -[LACUIAuthenticatorServiceConfiguration init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_requirement = a4;
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "infoDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("CFBundleName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUIAuthenticatorServiceConfiguration setTitle:](v9, "setTitle:", v12);

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUIAuthenticatorServiceConfiguration setBundleIdentifier:](v9, "setBundleIdentifier:", v14);

    -[LACUIAuthenticatorServiceConfiguration setPasscodeLength:](v9, "setPasscodeLength:", 6);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("BUTTON_CANCEL"), &stru_2510F9FD8, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACUIAuthenticatorServiceConfiguration setCancelButtonTitle:](v9, "setCancelButtonTitle:", v16);

    v9->_mode = 0;
    objc_storeStrong((id *)&v9->_contextData, a3);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ENTER_PASSWORD"), &stru_2510F9FD8, CFSTR("Localizable"));
    v18 = objc_claimAutoreleasedReturnValue();
    passwordFieldPlaceholder = v9->_passwordFieldPlaceholder;
    v9->_passwordFieldPlaceholder = (NSString *)v18;

    v9->_requiresIntent = 1;
    -[LACUIAuthenticatorServiceConfiguration _configureFallbackButtonTitleForRequirement:]((uint64_t)v9, a4);
  }

  return v9;
}

- (void)_configureFallbackButtonTitleForRequirement:(uint64_t)a1
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    switch(a2)
    {
      case 2:
      case 4:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v3;
        v4 = CFSTR("DEVICE_PASSCODE");
        goto LABEL_5;
      case 3:
      case 5:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v3;
        v4 = CFSTR("CUSTOM_PASSWORD");
LABEL_5:
        objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_2510F9FD8, CFSTR("Localizable"));
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = v5;

        v7 = v8;
        break;
      default:
        v7 = *(void **)(a1 + 72);
        *(_QWORD *)(a1 + 72) = 0;
        break;
    }

  }
}

- (LACUIAuthenticatorServiceConfiguration)initWithContext:(id)a3 requirement:(unint64_t)a4 options:(id)a5
{
  id v8;
  LACUIAuthenticatorServiceConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = -[LACUIAuthenticatorServiceConfiguration initWithContext:requirement:](self, "initWithContext:requirement:", a3, a4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE60638]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUIAuthenticatorServiceConfiguration setSubtitle:](v9, "setSubtitle:", v11);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE60668]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[LACUIAuthenticatorServiceConfiguration setIconPath:](v9, "setIconPath:", v13);
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v4 = a3;
  -[LACUIAuthenticatorServiceConfiguration title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_title);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[LACUIAuthenticatorServiceConfiguration bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bundleIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[LACUIAuthenticatorServiceConfiguration iconPath](self, "iconPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_iconPath);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  -[LACUIAuthenticatorServiceConfiguration subtitle](self, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_subtitle);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, v12);

  -[LACUIAuthenticatorServiceConfiguration cancelButtonTitle](self, "cancelButtonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cancelButtonTitle);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, v14);

  -[LACUIAuthenticatorServiceConfiguration contextData](self, "contextData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_contextData);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[LACUIAuthenticatorServiceConfiguration requirement](self, "requirement"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_requirement);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, v18);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[LACUIAuthenticatorServiceConfiguration passcodeLength](self, "passcodeLength"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_passcodeLength);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, v20);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[LACUIAuthenticatorServiceConfiguration mode](self, "mode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_mode);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, v22);

  -[LACUIAuthenticatorServiceConfiguration prompt](self, "prompt");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_prompt);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, v24);

  -[LACUIAuthenticatorServiceConfiguration verifyPrompt](self, "verifyPrompt");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_verifyPrompt);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, v26);

  -[LACUIAuthenticatorServiceConfiguration fallbackButtonTitle](self, "fallbackButtonTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fallbackButtonTitle);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, v28);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[LACUIAuthenticatorServiceConfiguration style](self, "style"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_style);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, v30);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACUIAuthenticatorServiceConfiguration headerHidden](self, "headerHidden"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_headerHidden);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, v32);

  -[LACUIAuthenticatorServiceConfiguration passwordFieldPlaceholder](self, "passwordFieldPlaceholder");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_passwordFieldPlaceholder);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, v34);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACUIAuthenticatorServiceConfiguration requiresIntent](self, "requiresIntent"));
  v36 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_requiresIntent);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v36, v35);

}

- (LACUIAuthenticatorServiceConfiguration)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  LACUIAuthenticatorServiceConfiguration *v42;
  unsigned int v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v60;

  v3 = a3;
  v4 = objc_opt_class();
  NSStringFromSelector(sel_title);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, v5);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  NSStringFromSelector(sel_bundleIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v6, v7);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_iconPath);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v8, v9);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  NSStringFromSelector(sel_subtitle);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v10, v11);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  NSStringFromSelector(sel_cancelButtonTitle);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v12, v13);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_opt_class();
  NSStringFromSelector(sel_contextData);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v14, v15);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_opt_class();
  NSStringFromSelector(sel_requirement);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v18, "integerValue");

  v19 = objc_opt_class();
  NSStringFromSelector(sel_fallbackButtonTitle);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v19, v20);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_opt_class();
  NSStringFromSelector(sel_passcodeLength);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (int)objc_msgSend(v23, "intValue");

  v24 = objc_opt_class();
  NSStringFromSelector(sel_mode);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v26, "unsignedIntValue");

  v27 = objc_opt_class();
  NSStringFromSelector(sel_prompt);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v27, v28);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_opt_class();
  NSStringFromSelector(sel_verifyPrompt);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v29, v30);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_opt_class();
  NSStringFromSelector(sel_style);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v33, "unsignedIntValue");

  v34 = objc_opt_class();
  NSStringFromSelector(sel_headerHidden);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v36, "BOOLValue");

  v37 = objc_opt_class();
  NSStringFromSelector(sel_passwordFieldPlaceholder);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v37, v38);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_opt_class();
  NSStringFromSelector(sel_requiresIntent);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = objc_msgSend(v41, "BOOLValue");
  v42 = -[LACUIAuthenticatorServiceConfiguration initWithContext:requirement:](self, "initWithContext:requirement:", v54, v52);
  -[LACUIAuthenticatorServiceConfiguration setTitle:](v42, "setTitle:", v60);
  -[LACUIAuthenticatorServiceConfiguration setBundleIdentifier:](v42, "setBundleIdentifier:", v58);
  -[LACUIAuthenticatorServiceConfiguration setIconPath:](v42, "setIconPath:", v57);
  -[LACUIAuthenticatorServiceConfiguration setSubtitle:](v42, "setSubtitle:", v56);
  -[LACUIAuthenticatorServiceConfiguration setCancelButtonTitle:](v42, "setCancelButtonTitle:", v55);
  -[LACUIAuthenticatorServiceConfiguration setFallbackButtonTitle:](v42, "setFallbackButtonTitle:", v53);
  -[LACUIAuthenticatorServiceConfiguration setPasscodeLength:](v42, "setPasscodeLength:", v51);
  -[LACUIAuthenticatorServiceConfiguration setMode:](v42, "setMode:", v50);
  -[LACUIAuthenticatorServiceConfiguration setPrompt:](v42, "setPrompt:", v49);
  -[LACUIAuthenticatorServiceConfiguration setVerifyPrompt:](v42, "setVerifyPrompt:", v48);
  -[LACUIAuthenticatorServiceConfiguration setStyle:](v42, "setStyle:", v47);
  -[LACUIAuthenticatorServiceConfiguration setHeaderHidden:](v42, "setHeaderHidden:", v46);
  -[LACUIAuthenticatorServiceConfiguration setPasswordFieldPlaceholder:](v42, "setPasswordFieldPlaceholder:", v45);
  -[LACUIAuthenticatorServiceConfiguration setRequiresIntent:](v42, "setRequiresIntent:", v44);

  return v42;
}

- (void)setFallbackButtonTitle:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (v8
    && (objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v5,
        v7))
  {
    objc_storeStrong((id *)&self->_fallbackButtonTitle, a3);
  }
  else
  {
    -[LACUIAuthenticatorServiceConfiguration _configureFallbackButtonTitleForRequirement:]((uint64_t)self, self->_requirement);
  }

}

- (id)validateConfiguration
{
  unint64_t mode;
  const char *v3;

  mode = self->_mode;
  if (mode == 1)
  {
    -[LACUIAuthenticatorServiceConfiguration _validateRegisterConfiguration](self);
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!mode)
  {
    -[LACUIAuthenticatorServiceConfiguration _validateEnterConfiguration](self);
    v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    a2 = v3;
  }
  return (id)(id)a2;
}

- (_QWORD)_validateEnterConfiguration
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (v2
      && (objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "length"),
          v4,
          v3,
          v5))
    {
      if (v1[10])
      {
        if (v1[11] != 0x7FFFFFFFFFFFFFFFLL)
        {
          a1 = 0;
          return a1;
        }
        v6 = CFSTR("There must be at least 1 authentication mechanism");
      }
      else
      {
        v6 = CFSTR("Password field placeholder cannot be nil or empty");
      }
    }
    else
    {
      v6 = CFSTR("Title cannot be nil or empty");
    }
    objc_msgSend(MEMORY[0x24BE606E0], "errorWithCode:debugDescription:", *MEMORY[0x24BE60578], v6);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)_validateRegisterConfiguration
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (v2
      && (objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "length"),
          v4,
          v3,
          v5))
    {
      v6 = v1[11];
      if (v6 == 5 || v6 == 3)
      {
        if (v1[10])
        {
          a1 = 0;
          return a1;
        }
        v7 = CFSTR("Password field placeholder cannot be nil or empty");
      }
      else
      {
        v7 = CFSTR("Invalid requirement used for register mode");
      }
    }
    else
    {
      v7 = CFSTR("Title cannot be nil or empty");
    }
    objc_msgSend(MEMORY[0x24BE606E0], "errorWithCode:debugDescription:", *MEMORY[0x24BE60578], v7);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)isEqual:(id)a3
{
  LACUIAuthenticatorServiceConfiguration *v4;
  LACUIAuthenticatorServiceConfiguration *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  unint64_t v37;
  int64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  unint64_t v46;
  _BOOL4 v47;

  v4 = (LACUIAuthenticatorServiceConfiguration *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self != v4)
    {
      v5 = v4;
      -[LACUIAuthenticatorServiceConfiguration title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACUIAuthenticatorServiceConfiguration title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v8)
        goto LABEL_52;
      -[LACUIAuthenticatorServiceConfiguration bundleIdentifier](self, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACUIAuthenticatorServiceConfiguration bundleIdentifier](v5, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_52;
      -[LACUIAuthenticatorServiceConfiguration iconPath](self, "iconPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12
        || (-[LACUIAuthenticatorServiceConfiguration iconPath](v5, "iconPath"),
            (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[LACUIAuthenticatorServiceConfiguration iconPath](self, "iconPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACUIAuthenticatorServiceConfiguration iconPath](v5, "iconPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if (v12)
        {

          if (!v15)
            goto LABEL_52;
        }
        else
        {

          if ((v15 & 1) == 0)
            goto LABEL_52;
        }
      }
      -[LACUIAuthenticatorServiceConfiguration subtitle](self, "subtitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17
        || (-[LACUIAuthenticatorServiceConfiguration subtitle](v5, "subtitle"),
            (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[LACUIAuthenticatorServiceConfiguration subtitle](self, "subtitle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACUIAuthenticatorServiceConfiguration subtitle](v5, "subtitle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if (v17)
        {

          if (!v20)
            goto LABEL_52;
        }
        else
        {

          if ((v20 & 1) == 0)
            goto LABEL_52;
        }
      }
      -[LACUIAuthenticatorServiceConfiguration prompt](self, "prompt");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21
        || (-[LACUIAuthenticatorServiceConfiguration prompt](v5, "prompt"),
            (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[LACUIAuthenticatorServiceConfiguration prompt](self, "prompt");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACUIAuthenticatorServiceConfiguration prompt](v5, "prompt");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToString:", v23);

        if (v21)
        {

          if (!v24)
            goto LABEL_52;
        }
        else
        {

          if ((v24 & 1) == 0)
            goto LABEL_52;
        }
      }
      -[LACUIAuthenticatorServiceConfiguration verifyPrompt](self, "verifyPrompt");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25
        || (-[LACUIAuthenticatorServiceConfiguration verifyPrompt](v5, "verifyPrompt"),
            (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[LACUIAuthenticatorServiceConfiguration verifyPrompt](self, "verifyPrompt");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACUIAuthenticatorServiceConfiguration verifyPrompt](v5, "verifyPrompt");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "isEqualToString:", v27);

        if (v25)
        {

          if (!v28)
            goto LABEL_52;
        }
        else
        {

          if ((v28 & 1) == 0)
            goto LABEL_52;
        }
      }
      -[LACUIAuthenticatorServiceConfiguration cancelButtonTitle](self, "cancelButtonTitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29
        || (-[LACUIAuthenticatorServiceConfiguration cancelButtonTitle](v5, "cancelButtonTitle"),
            (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[LACUIAuthenticatorServiceConfiguration cancelButtonTitle](self, "cancelButtonTitle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACUIAuthenticatorServiceConfiguration cancelButtonTitle](v5, "cancelButtonTitle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqualToString:", v31);

        if (v29)
        {

          if (!v32)
            goto LABEL_52;
        }
        else
        {

          if ((v32 & 1) == 0)
            goto LABEL_52;
        }
      }
      -[LACUIAuthenticatorServiceConfiguration fallbackButtonTitle](self, "fallbackButtonTitle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33
        || (-[LACUIAuthenticatorServiceConfiguration fallbackButtonTitle](v5, "fallbackButtonTitle"),
            (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[LACUIAuthenticatorServiceConfiguration fallbackButtonTitle](self, "fallbackButtonTitle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACUIAuthenticatorServiceConfiguration fallbackButtonTitle](v5, "fallbackButtonTitle");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v34, "isEqualToString:", v35);

        if (v33)
        {

          if (!v36)
            goto LABEL_52;
        }
        else
        {

          if ((v36 & 1) == 0)
            goto LABEL_52;
        }
      }
      v37 = -[LACUIAuthenticatorServiceConfiguration requirement](self, "requirement");
      if (v37 != -[LACUIAuthenticatorServiceConfiguration requirement](v5, "requirement"))
        goto LABEL_52;
      v38 = -[LACUIAuthenticatorServiceConfiguration passcodeLength](self, "passcodeLength");
      if (v38 != -[LACUIAuthenticatorServiceConfiguration passcodeLength](v5, "passcodeLength"))
        goto LABEL_52;
      v39 = -[LACUIAuthenticatorServiceConfiguration mode](self, "mode");
      if (v39 != -[LACUIAuthenticatorServiceConfiguration mode](v5, "mode"))
        goto LABEL_52;
      -[LACUIAuthenticatorServiceConfiguration contextData](self, "contextData");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACUIAuthenticatorServiceConfiguration contextData](v5, "contextData");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v40 == (void *)v41)
      {

      }
      else
      {
        v42 = (void *)v41;
        -[LACUIAuthenticatorServiceConfiguration contextData](self, "contextData");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACUIAuthenticatorServiceConfiguration contextData](v5, "contextData");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "isEqual:", v44);

        if (!v45)
          goto LABEL_52;
      }
      v46 = -[LACUIAuthenticatorServiceConfiguration style](self, "style");
      if (v46 == -[LACUIAuthenticatorServiceConfiguration style](v5, "style"))
      {
        v47 = -[LACUIAuthenticatorServiceConfiguration headerHidden](self, "headerHidden");
        v16 = v47 ^ -[LACUIAuthenticatorServiceConfiguration headerHidden](v5, "headerHidden") ^ 1;
LABEL_53:

        goto LABEL_54;
      }
LABEL_52:
      LOBYTE(v16) = 0;
      goto LABEL_53;
    }
    LOBYTE(v16) = 1;
  }
  else
  {
    LOBYTE(v16) = 0;
  }
LABEL_54:

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[18];

  v31[16] = *MEMORY[0x24BDAC8D0];
  v26 = (void *)MEMORY[0x24BDD17C8];
  v24 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("title: %@"), self->_title);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v30;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("bundleIdentifier: %@"), self->_bundleIdentifier);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v29;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("iconPath: %@"), self->_iconPath);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v28;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("subtitle: %@"), self->_subtitle);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v27;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("prompt: %@"), self->_prompt);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v25;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("verifyPrompt: %@"), self->_verifyPrompt);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v23;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cancelButtonTitle: %@"), self->_cancelButtonTitle);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v22;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fallbackButtonTitle: %@"), self->_fallbackButtonTitle);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v21;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("passwordFieldPlaceholder: %@"), self->_passwordFieldPlaceholder);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v20;
  v3 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromLACUIAuthenticatorServiceConfigurationRequirement(self->_requirement);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("requirement: %@"), v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("passcodeLength: %d"), self->_passcodeLength);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v5;
  if (self->_mode)
    v6 = CFSTR("Register");
  else
    v6 = CFSTR("Enter");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("mode: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[11] = v7;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("contextData: %@"), self->_contextData);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[12] = v8;
  if (self->_style)
    v9 = CFSTR("FullScreen");
  else
    v9 = CFSTR("Sheet");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("style: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[13] = v10;
  if (self->_headerHidden)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("headerHidden: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[14] = v12;
  if (self->_requiresIntent)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("requiresIntent: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[15] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("; "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v24, self, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (NSString)iconPath
{
  return self->_iconPath;
}

- (void)setIconPath:(id)a3
{
  objc_storeStrong((id *)&self->_iconPath, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_prompt, a3);
}

- (NSString)verifyPrompt
{
  return self->_verifyPrompt;
}

- (void)setVerifyPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_verifyPrompt, a3);
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButtonTitle, a3);
}

- (NSString)fallbackButtonTitle
{
  return self->_fallbackButtonTitle;
}

- (NSString)passwordFieldPlaceholder
{
  return self->_passwordFieldPlaceholder;
}

- (void)setPasswordFieldPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_passwordFieldPlaceholder, a3);
}

- (unint64_t)requirement
{
  return self->_requirement;
}

- (int64_t)passcodeLength
{
  return self->_passcodeLength;
}

- (void)setPasscodeLength:(int64_t)a3
{
  self->_passcodeLength = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (NSData)contextData
{
  return self->_contextData;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BOOL)headerHidden
{
  return self->_headerHidden;
}

- (void)setHeaderHidden:(BOOL)a3
{
  self->_headerHidden = a3;
}

- (BOOL)requiresIntent
{
  return self->_requiresIntent;
}

- (void)setRequiresIntent:(BOOL)a3
{
  self->_requiresIntent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_passwordFieldPlaceholder, 0);
  objc_storeStrong((id *)&self->_fallbackButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_verifyPrompt, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_iconPath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
