@implementation IATextInputActionsInputMode

- (IATextInputActionsInputMode)initWithLanguage:(id)a3 region:(id)a4 keyboardVariant:(id)a5 keyboardLayout:(id)a6 keyboardType:(id)a7 inputModeIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  IATextInputActionsInputMode *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  IATextInputActionsInputMode *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v41;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v41.receiver = self;
  v41.super_class = (Class)IATextInputActionsInputMode;
  v20 = -[IATextInputActionsInputMode init](&v41, sel_init);
  v24 = v20;
  if (v20)
  {
    objc_msgSend_setLanguage_(v20, v21, (uint64_t)v14, v22, v23);
    objc_msgSend_setRegion_(v24, v25, (uint64_t)v15, v26, v27);
    objc_msgSend_setKeyboardVariant_(v24, v28, (uint64_t)v16, v29, v30);
    objc_msgSend_setKeyboardLayout_(v24, v31, (uint64_t)v17, v32, v33);
    objc_msgSend_setKeyboardType_(v24, v34, (uint64_t)v18, v35, v36);
    objc_msgSend_setInputModeIdentifier_(v24, v37, (uint64_t)v19, v38, v39);
  }

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  IATextInputActionsInputMode *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;

  v4 = objc_alloc_init(IATextInputActionsInputMode);
  objc_msgSend_language(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLanguage_(v4, v10, (uint64_t)v9, v11, v12);

  objc_msgSend_region(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRegion_(v4, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_keyboardVariant(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeyboardVariant_(v4, v26, (uint64_t)v25, v27, v28);

  objc_msgSend_keyboardLayout(self, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeyboardLayout_(v4, v34, (uint64_t)v33, v35, v36);

  objc_msgSend_keyboardType(self, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKeyboardType_(v4, v42, (uint64_t)v41, v43, v44);

  objc_msgSend_inputModeIdentifier(self, v45, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputModeIdentifier_(v4, v50, (uint64_t)v49, v51, v52);

  return v4;
}

- (id)inputModeUniqueString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v49;
  const __CFString *v50;
  void *v51;

  v51 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_language(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v6;
  if (v6)
    v12 = (const __CFString *)v6;
  else
    v12 = CFSTR("None");
  v50 = v12;
  objc_msgSend_region(self, v7, v8, v9, v10);
  v13 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v13;
  if (v13)
    v19 = (const __CFString *)v13;
  else
    v19 = CFSTR("None");
  v49 = v19;
  objc_msgSend_keyboardVariant(self, v14, v15, v16, v17);
  v20 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v20;
  if (v20)
    v26 = (const __CFString *)v20;
  else
    v26 = CFSTR("None");
  objc_msgSend_keyboardLayout(self, v21, v22, v23, v24);
  v27 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v27;
  if (v27)
    v33 = (const __CFString *)v27;
  else
    v33 = CFSTR("None");
  objc_msgSend_keyboardType(self, v28, v29, v30, v31);
  v34 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v34;
  if (v34)
    v40 = (const __CFString *)v34;
  else
    v40 = CFSTR("None");
  objc_msgSend_inputModeIdentifier(self, v35, v36, v37, v38);
  v41 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)v41;
  if (v41)
    v46 = (const __CFString *)v41;
  else
    v46 = CFSTR("None");
  objc_msgSend_stringWithFormat_(v51, v42, (uint64_t)CFSTR("%@%@%@%@%@%@%@%@%@%@%@"), v43, v44, v50, CFSTR("≡"), v49, CFSTR("≡"), v26, CFSTR("≡"), v33, CFSTR("≡"), v40, CFSTR("≡"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  return v47;
}

- (BOOL)isEmpty
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;

  objc_msgSend_language(self, a2, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend_region(self, v6, v7, v8, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend_keyboardVariant(self, v12, v13, v14, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend_keyboardLayout(self, v17, v18, v19, v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v11 = 0;
        }
        else
        {
          objc_msgSend_keyboardType(self, v22, v23, v24, v25);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v11 = 0;
          }
          else
          {
            objc_msgSend_inputModeIdentifier(self, v27, v28, v29, v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v32 == 0;

          }
        }

      }
    }

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  char isEqualToString;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    isEqualToString = 0;
    if (v4 && (isKindOfClass & 1) != 0)
    {
      v7 = v4;
      objc_msgSend_inputModeUniqueString(self, v8, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_inputModeUniqueString(v7, v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      isEqualToString = objc_msgSend_isEqualToString_(v12, v18, (uint64_t)v17, v19, v20);
    }
  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (IATextInputActionsInputMode)initWithCoder:(id)a3
{
  id v4;
  IATextInputActionsInputMode *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *language;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *region;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *keyboardVariant;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *keyboardLayout;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSString *keyboardType;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSString *inputModeIdentifier;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)IATextInputActionsInputMode;
  v5 = -[IATextInputActionsInputMode init](&v37, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("language"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("region"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("keyboardVariant"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    keyboardVariant = v5->_keyboardVariant;
    v5->_keyboardVariant = (NSString *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("keyboardLayout"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    keyboardLayout = v5->_keyboardLayout;
    v5->_keyboardLayout = (NSString *)v24;

    v26 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, (uint64_t)CFSTR("keyboardType"), v28);
    v29 = objc_claimAutoreleasedReturnValue();
    keyboardType = v5->_keyboardType;
    v5->_keyboardType = (NSString *)v29;

    v31 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("inputModeIdentifier"), v33);
    v34 = objc_claimAutoreleasedReturnValue();
    inputModeIdentifier = v5->_inputModeIdentifier;
    v5->_inputModeIdentifier = (NSString *)v34;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *language;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  id v17;

  language = self->_language;
  v17 = a3;
  objc_msgSend_encodeObject_forKey_(v17, v5, (uint64_t)language, (uint64_t)CFSTR("language"), v6);
  objc_msgSend_encodeObject_forKey_(v17, v7, (uint64_t)self->_region, (uint64_t)CFSTR("region"), v8);
  objc_msgSend_encodeObject_forKey_(v17, v9, (uint64_t)self->_keyboardVariant, (uint64_t)CFSTR("keyboardVariant"), v10);
  objc_msgSend_encodeObject_forKey_(v17, v11, (uint64_t)self->_keyboardLayout, (uint64_t)CFSTR("keyboardLayout"), v12);
  objc_msgSend_encodeObject_forKey_(v17, v13, (uint64_t)self->_keyboardType, (uint64_t)CFSTR("keyboardType"), v14);
  objc_msgSend_encodeObject_forKey_(v17, v15, (uint64_t)self->_inputModeIdentifier, (uint64_t)CFSTR("inputModeIdentifier"), v16);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)keyboardVariant
{
  return self->_keyboardVariant;
}

- (void)setKeyboardVariant:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)keyboardLayout
{
  return self->_keyboardLayout;
}

- (void)setKeyboardLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (void)setInputModeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputModeIdentifier, 0);
  objc_storeStrong((id *)&self->_keyboardType, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
  objc_storeStrong((id *)&self->_keyboardVariant, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
