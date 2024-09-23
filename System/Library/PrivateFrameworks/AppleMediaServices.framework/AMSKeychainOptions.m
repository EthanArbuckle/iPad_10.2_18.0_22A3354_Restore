@implementation AMSKeychainOptions

- (AMSKeychainOptions)init
{
  return -[AMSKeychainOptions initWithOptionsDictionary:](self, "initWithOptionsDictionary:", 0);
}

- (AMSKeychainOptions)initWithOptionsDictionary:(id)a3
{
  id v4;
  AMSKeychainOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSKeychainOptions;
  v5 = -[AMSKeychainOptions init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ams_objectForKey:defaultValue:", CFSTR("AMSKeychainOptionsAuthenticationFallbackVisible"), MEMORY[0x1E0C9AAB0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_authenticationFallbackVisible = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AMSKeychainOptionsClientCertLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_storeStrong((id *)&v5->_clientCertLabel, v7);
    objc_msgSend(v4, "ams_objectForKey:defaultValue:", CFSTR("AMSKeychainOptionsDisplayAuthenticationReason"), MEMORY[0x1E0C9AAB0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_displayAuthenticationReason = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AMSKeychainOptionsIntermediateCertLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_storeStrong((id *)&v5->_intermediateCertLabel, v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AMSKeychainOptionsLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_storeStrong((id *)&v5->_label, v10);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AMSKeychainOptionsPrompt"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_storeStrong((id *)&v5->_prompt, v11);
    objc_msgSend(v4, "ams_objectForKey:defaultValue:", CFSTR("AMSKeychainOptionsPurpose"), &unk_1E25AF650);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_purpose = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "ams_objectForKey:defaultValue:", CFSTR("AMSKeychainOptionsRegenerateKeys"), MEMORY[0x1E0C9AAA0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_regenerateKeys = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "ams_objectForKey:defaultValue:", CFSTR("AMSKeychainOptionsStyle"), &unk_1E25AF650);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_style = objc_msgSend(v14, "unsignedIntegerValue");

  }
  return v5;
}

- (id)optionsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSKeychainOptions authenticationFallbackVisible](self, "authenticationFallbackVisible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, CFSTR("AMSKeychainOptionsAuthenticationFallbackVisible"));

  -[AMSKeychainOptions clientCertLabel](self, "clientCertLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, CFSTR("AMSKeychainOptionsClientCertLabel"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSKeychainOptions displayAuthenticationReason](self, "displayAuthenticationReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, CFSTR("AMSKeychainOptionsDisplayAuthenticationReason"));

  -[AMSKeychainOptions intermediateCertLabel](self, "intermediateCertLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, CFSTR("AMSKeychainOptionsIntermediateCertLabel"));

  -[AMSKeychainOptions label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, CFSTR("AMSKeychainOptionsLabel"));

  -[AMSKeychainOptions prompt](self, "prompt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v9, CFSTR("AMSKeychainOptionsPrompt"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSKeychainOptions purpose](self, "purpose"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v10, CFSTR("AMSKeychainOptionsPurpose"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSKeychainOptions regenerateKeys](self, "regenerateKeys"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v11, CFSTR("AMSKeychainOptionsRegenerateKeys"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSKeychainOptions style](self, "style"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v12, CFSTR("AMSKeychainOptionsStyle"));

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

+ (unint64_t)preferredAttestationStyle
{
  int v2;
  void *v3;
  void *v4;
  unint64_t v5;

  v2 = MGGetBoolAnswer();
  +[AMSDevice hardwarePlatform](AMSDevice, "hardwarePlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = !v2 || objc_msgSend(v3, "isEqualToString:", CFSTR("t8015"));

  return v5;
}

- (id)description
{
  id v3;
  void *v4;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSKeychainOptions authenticationFallbackVisible](self, "authenticationFallbackVisible"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, CFSTR("authenticationFallbackVisible"));

  -[AMSKeychainOptions clientCertLabel](self, "clientCertLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AMSKeychainOptions clientCertLabel](self, "clientCertLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, CFSTR("clientCertLabel"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSKeychainOptions displayAuthenticationReason](self, "displayAuthenticationReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, CFSTR("displayAuthenticationReason"));

  -[AMSKeychainOptions intermediateCertLabel](self, "intermediateCertLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AMSKeychainOptions intermediateCertLabel](self, "intermediateCertLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_setNullableObject:forKey:", v11, CFSTR("intermediateCertLabel"));

  }
  -[AMSKeychainOptions label](self, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[AMSKeychainOptions label](self, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_setNullableObject:forKey:", v14, CFSTR("label"));

  }
  -[AMSKeychainOptions prompt](self, "prompt");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[AMSKeychainOptions prompt](self, "prompt");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_setNullableObject:forKey:", v17, CFSTR("prompt"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSKeychainOptions purpose](self, "purpose"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v18, CFSTR("purpose"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSKeychainOptions regenerateKeys](self, "regenerateKeys"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v19, CFSTR("regenerateKeys"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSKeychainOptions style](self, "style"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v20, CFSTR("style"));

  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  BOOL v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  v5 = v4;

  if (!v5)
    goto LABEL_13;
  v6 = -[AMSKeychainOptions authenticationFallbackVisible](self, "authenticationFallbackVisible");
  if (v6 != objc_msgSend(v5, "authenticationFallbackVisible"))
    goto LABEL_13;
  -[AMSKeychainOptions clientCertLabel](self, "clientCertLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientCertLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[AMSKeychainOptions _compareString:withString:](self, "_compareString:withString:", v7, v8);

  if (!v9)
    goto LABEL_13;
  v10 = -[AMSKeychainOptions displayAuthenticationReason](self, "displayAuthenticationReason");
  if (v10 != objc_msgSend(v5, "displayAuthenticationReason"))
    goto LABEL_13;
  -[AMSKeychainOptions intermediateCertLabel](self, "intermediateCertLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intermediateCertLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AMSKeychainOptions _compareString:withString:](self, "_compareString:withString:", v11, v12);

  if (!v13)
    goto LABEL_13;
  -[AMSKeychainOptions label](self, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[AMSKeychainOptions _compareString:withString:](self, "_compareString:withString:", v14, v15);

  if (!v16)
    goto LABEL_13;
  -[AMSKeychainOptions prompt](self, "prompt");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prompt");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[AMSKeychainOptions _compareString:withString:](self, "_compareString:withString:", v17, v18);

  if (!v19)
    goto LABEL_13;
  v20 = -[AMSKeychainOptions purpose](self, "purpose");
  if (v20 != objc_msgSend(v5, "purpose"))
    goto LABEL_13;
  v21 = -[AMSKeychainOptions regenerateKeys](self, "regenerateKeys");
  if (v21 != objc_msgSend(v5, "regenerateKeys"))
    goto LABEL_13;
  v22 = -[AMSKeychainOptions style](self, "style");
  v23 = v22 == objc_msgSend(v5, "style");
LABEL_14:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSKeychainOptions optionsDictionary](self, "optionsDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("o"));

}

- (AMSKeychainOptions)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  AMSKeychainOptions *v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("o"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v11 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;

  v12 = -[AMSKeychainOptions initWithOptionsDictionary:](self, "initWithOptionsDictionary:", v11);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AMSKeychainOptions optionsDictionary](self, "optionsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithOptionsDictionary:", v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_compareString:(id)a3 withString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = (v5 || !v6) && (!v5 || !v6 || objc_msgSend(v5, "isEqualToString:", v6));

  return v8;
}

- (NSString)clientCertLabel
{
  return self->_clientCertLabel;
}

- (void)setClientCertLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)intermediateCertLabel
{
  return self->_intermediateCertLabel;
}

- (void)setIntermediateCertLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(unint64_t)a3
{
  self->_purpose = a3;
}

- (BOOL)regenerateKeys
{
  return self->_regenerateKeys;
}

- (void)setRegenerateKeys:(BOOL)a3
{
  self->_regenerateKeys = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BOOL)authenticationFallbackVisible
{
  return self->_authenticationFallbackVisible;
}

- (void)setAuthenticationFallbackVisible:(BOOL)a3
{
  self->_authenticationFallbackVisible = a3;
}

- (BOOL)displayAuthenticationReason
{
  return self->_displayAuthenticationReason;
}

- (void)setDisplayAuthenticationReason:(BOOL)a3
{
  self->_displayAuthenticationReason = a3;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_intermediateCertLabel, 0);
  objc_storeStrong((id *)&self->_clientCertLabel, 0);
}

@end
