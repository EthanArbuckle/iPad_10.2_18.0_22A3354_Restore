@implementation IATextInputActionsSessionEndAction

- (int64_t)inputActionCount
{
  return 0;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v30;
  id v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)IATextInputActionsSessionEndAction;
  -[IATextInputActionsSessionAction description](&v32, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyboardTrialParameters(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = sub_23F09A040;
  v30 = &unk_250F8FBD8;
  v31 = v8;
  v14 = v8;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v13, v15, (uint64_t)&v27, v16, v17);

  objc_msgSend_componentsJoinedByString_(v14, v18, (uint64_t)CFSTR(", "), v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v22, (uint64_t)CFSTR(", %@"), v23, v24, v21, v27, v28, v29, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (NSDictionary)keyboardTrialParameters
{
  return self->_keyboardTrialParameters;
}

- (void)setKeyboardTrialParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardTrialParameters, 0);
}

- (IATextInputActionsSessionEndAction)initWithCoder:(id)a3
{
  id v4;
  IATextInputActionsSessionEndAction *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSDictionary *keyboardTrialParameters;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IATextInputActionsSessionEndAction;
  v5 = -[IATextInputActionsSessionAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(v4, v8, v6, v7, (uint64_t)CFSTR("keyboardTrialParameters"));
    v9 = objc_claimAutoreleasedReturnValue();
    keyboardTrialParameters = v5->_keyboardTrialParameters;
    v5->_keyboardTrialParameters = (NSDictionary *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IATextInputActionsSessionEndAction;
  v4 = a3;
  -[IATextInputActionsSessionAction encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_keyboardTrialParameters, (uint64_t)CFSTR("keyboardTrialParameters"), v6, v7.receiver, v7.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
