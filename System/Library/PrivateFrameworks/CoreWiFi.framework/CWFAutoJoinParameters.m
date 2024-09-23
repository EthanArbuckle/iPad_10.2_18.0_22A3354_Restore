@implementation CWFAutoJoinParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredChannels, 0);
  objc_storeStrong((id *)&self->_targetNetworkProfile, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinParameters, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setTrigger_(v11, v12, self->_trigger, v13, v14);
  objc_msgSend_setMode_(v11, v15, self->_mode, v16, v17);
  objc_msgSend_setTargetNetworkProfile_(v11, v18, (uint64_t)self->_targetNetworkProfile, v19, v20);
  objc_msgSend_setPreferredChannels_(v11, v21, (uint64_t)self->_preferredChannels, v22, v23);
  return v11;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v6 = (void *)MEMORY[0x1E0CB3940];
  sub_1B063D5D0(self->_trigger, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B063F1D4(self->_mode, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(self->_preferredChannels, v13, (uint64_t)CFSTR(", "), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v17, (uint64_t)CFSTR("trigger=%@, mode=%@, preferredChannels=(%@), target=(%@)"), v18, v19, v7, v12, v16, self->_targetNetworkProfile);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)trigger
{
  return self->_trigger;
}

- (CWFNetworkProfile)targetNetworkProfile
{
  return self->_targetNetworkProfile;
}

- (void)setTrigger:(int64_t)a3
{
  self->_trigger = a3;
}

- (void)setTargetNetworkProfile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setPreferredChannels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (BOOL)isEqualToAutoJoinParameters:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  int64_t trigger;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t mode;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CWFNetworkProfile *targetNetworkProfile;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CWFNetworkProfile *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CWFNetworkProfile *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  char isEqual;
  NSArray *preferredChannels;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSArray *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  NSArray *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;

  v6 = a3;
  trigger = self->_trigger;
  if (trigger == objc_msgSend_trigger(v6, v8, v9, v10, v11))
  {
    mode = self->_mode;
    if (mode == objc_msgSend_mode(v6, v12, v13, v14, v15))
    {
      targetNetworkProfile = self->_targetNetworkProfile;
      objc_msgSend_targetNetworkProfile(v6, v17, v18, v19, v20);
      v26 = (CWFNetworkProfile *)objc_claimAutoreleasedReturnValue();
      if (targetNetworkProfile != v26)
      {
        if (!self->_targetNetworkProfile
          || (objc_msgSend_targetNetworkProfile(v6, v22, v23, v24, v25), (v27 = objc_claimAutoreleasedReturnValue()) == 0))
        {
          isEqual = 0;
          goto LABEL_17;
        }
        v3 = (void *)v27;
        v32 = self->_targetNetworkProfile;
        objc_msgSend_targetNetworkProfile(v6, v28, v29, v30, v31);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v32, v33, (uint64_t)v4, v34, v35))
        {
          isEqual = 0;
          goto LABEL_15;
        }
      }
      preferredChannels = self->_preferredChannels;
      objc_msgSend_preferredChannels(v6, v22, v23, v24, v25);
      v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
      isEqual = preferredChannels == v42;
      if (!isEqual && self->_preferredChannels)
      {
        objc_msgSend_preferredChannels(v6, v38, v39, v40, v41);
        v43 = objc_claimAutoreleasedReturnValue();
        if (!v43)
        {

          isEqual = 0;
LABEL_14:
          if (targetNetworkProfile == v26)
          {
LABEL_17:

            goto LABEL_18;
          }
LABEL_15:

          goto LABEL_17;
        }
        v48 = (void *)v43;
        v49 = self->_preferredChannels;
        objc_msgSend_preferredChannels(v6, v44, v45, v46, v47);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v49, v51, (uint64_t)v50, v52, v53);

      }
      goto LABEL_14;
    }
  }
  isEqual = 0;
LABEL_18:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  CWFAutoJoinParameters *v4;
  CWFAutoJoinParameters *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToAutoJoinParameters;

  v4 = (CWFAutoJoinParameters *)a3;
  v5 = v4;
  if (v4 == self)
  {
    isEqualToAutoJoinParameters = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isEqualToAutoJoinParameters = objc_msgSend_isEqualToAutoJoinParameters_(self, v6, (uint64_t)v5, v7, v8);
  }
  else
  {
    isEqualToAutoJoinParameters = 0;
  }

  return isEqualToAutoJoinParameters;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = self->_mode ^ self->_trigger;
  v7 = v6 ^ objc_msgSend_hash(self->_targetNetworkProfile, a2, v2, v3, v4);
  return v7 ^ objc_msgSend_hash(self->_preferredChannels, v8, v9, v10, v11);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t trigger;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  trigger = self->_trigger;
  v13 = a3;
  objc_msgSend_encodeInteger_forKey_(v13, v5, trigger, (uint64_t)CFSTR("_trigger"), v6);
  objc_msgSend_encodeInteger_forKey_(v13, v7, self->_mode, (uint64_t)CFSTR("_mode"), v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_targetNetworkProfile, (uint64_t)CFSTR("_targetNetworkProfile"), v10);
  objc_msgSend_encodeObject_forKey_(v13, v11, (uint64_t)self->_preferredChannels, (uint64_t)CFSTR("_preferredChannels"), v12);

}

- (CWFAutoJoinParameters)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CWFAutoJoinParameters *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CWFNetworkProfile *targetNetworkProfile;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *preferredChannels;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CWFAutoJoinParameters;
  v8 = -[CWFAutoJoinParameters init](&v29, sel_init);
  if (v8)
  {
    v8->_trigger = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("_trigger"), v6, v7);
    v8->_mode = objc_msgSend_decodeIntegerForKey_(v4, v9, (uint64_t)CFSTR("_mode"), v10, v11);
    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("_targetNetworkProfile"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    targetNetworkProfile = v8->_targetNetworkProfile;
    v8->_targetNetworkProfile = (CWFNetworkProfile *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v17, v20, v18, v21, v22, v19, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v23, (uint64_t)CFSTR("_preferredChannels"), v25);
    v26 = objc_claimAutoreleasedReturnValue();
    preferredChannels = v8->_preferredChannels;
    v8->_preferredChannels = (NSArray *)v26;

  }
  return v8;
}

- (NSArray)preferredChannels
{
  return self->_preferredChannels;
}

@end
