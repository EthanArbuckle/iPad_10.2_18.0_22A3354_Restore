@implementation SGSocialProfile

- (SGSocialProfile)initWithUsername:(id)a3 userIdentifier:(id)a4 bundleIdentifier:(id)a5 displayName:(id)a6 service:(id)a7 teamIdentifier:(id)a8 label:(id)a9 extractionInfo:(id)a10 recordId:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SGSocialProfile *v23;
  uint64_t v24;
  NSString *username;
  uint64_t v26;
  NSString *userIdentifier;
  uint64_t v28;
  NSString *bundleIdentifier;
  uint64_t v30;
  NSString *displayName;
  uint64_t v32;
  NSString *service;
  uint64_t v34;
  NSString *teamIdentifier;
  objc_super v37;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v37.receiver = self;
  v37.super_class = (Class)SGSocialProfile;
  v23 = -[SGLabeledObject initWithLabel:extractionInfo:recordId:](&v37, sel_initWithLabel_extractionInfo_recordId_, a9, a10, a11);
  if (v23)
  {
    v24 = objc_msgSend(v17, "copy");
    username = v23->_username;
    v23->_username = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    userIdentifier = v23->_userIdentifier;
    v23->_userIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v19, "copy");
    bundleIdentifier = v23->_bundleIdentifier;
    v23->_bundleIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v20, "copy");
    displayName = v23->_displayName;
    v23->_displayName = (NSString *)v30;

    v32 = objc_msgSend(v21, "copy");
    service = v23->_service;
    v23->_service = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    teamIdentifier = v23->_teamIdentifier;
    v23->_teamIdentifier = (NSString *)v34;

  }
  return v23;
}

- (SGSocialProfile)initWithCoder:(id)a3
{
  id v4;
  SGSocialProfile *v5;
  void *v6;
  uint64_t v7;
  NSString *username;
  void *v9;
  uint64_t v10;
  NSString *userIdentifier;
  __CFString *v12;
  NSObject *v13;
  NSString *bundleIdentifier;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  NSString *displayName;
  void *v19;
  uint64_t v20;
  NSString *service;
  void *v22;
  uint64_t v23;
  NSString *teamIdentifier;
  uint8_t buf[16];
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SGSocialProfile;
  v5 = -[SGLabeledObject initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("username"));
    v7 = objc_claimAutoreleasedReturnValue();
    username = v5->_username;
    v5->_username = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("userIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      sgLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1A2267000, v13, OS_LOG_TYPE_FAULT, "Nil bundle id used in SGSocialProfile", buf, 2u);
      }

      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
      v12 = &stru_1E4762D08;
    }
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = &v12->isa;
    v15 = v12;

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("displayName"));
    v17 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v17;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("service"));
    v20 = objc_claimAutoreleasedReturnValue();
    service = v5->_service;
    v5->_service = (NSString *)v20;

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("teamIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue();
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGSocialProfile;
  v4 = a3;
  -[SGLabeledObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_username, CFSTR("username"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_userIdentifier, CFSTR("userIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_service, CFSTR("service"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_teamIdentifier, CFSTR("teamIdentifier"));

}

- (BOOL)isEqual:(id)a3
{
  SGSocialProfile *v4;
  SGSocialProfile *v5;
  BOOL v6;

  v4 = (SGSocialProfile *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGSocialProfile isEqualToSGSocialProfile:](self, "isEqualToSGSocialProfile:", v5);

  return v6;
}

- (BOOL)isEqualToSGSocialProfile:(id)a3
{
  id *v4;
  NSString *username;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  NSString *userIdentifier;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSString *bundleIdentifier;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  NSString *displayName;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  NSString *service;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  char v29;
  char v30;
  NSString *v32;
  NSString *v33;

  v4 = (id *)a3;
  if (!-[SGLabeledObject isEqualToLabeledObject:](self, "isEqualToLabeledObject:", v4))
    goto LABEL_20;
  username = self->_username;
  v6 = (NSString *)v4[5];
  if (username == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = username;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_20;
  }
  userIdentifier = self->_userIdentifier;
  v11 = (NSString *)v4[6];
  if (userIdentifier == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = userIdentifier;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_20;
  }
  bundleIdentifier = self->_bundleIdentifier;
  v16 = (NSString *)v4[7];
  if (bundleIdentifier == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = bundleIdentifier;
    v19 = -[NSString isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_20;
  }
  displayName = self->_displayName;
  v21 = (NSString *)v4[8];
  if (displayName == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = displayName;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_20;
  }
  service = self->_service;
  v26 = (NSString *)v4[9];
  if (service == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = service;
    v29 = -[NSString isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
    {
LABEL_20:
      v30 = 0;
      goto LABEL_21;
    }
  }
  v32 = self->_teamIdentifier;
  v33 = v32;
  if (v32 == v4[10])
    v30 = 1;
  else
    v30 = -[NSString isEqual:](v32, "isEqual:");

LABEL_21:
  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSString **p_userIdentifier;

  v3 = -[NSString hash](self->_bundleIdentifier, "hash");
  p_userIdentifier = &self->_userIdentifier;
  if (!-[NSString length](self->_userIdentifier, "length"))
    p_userIdentifier = &self->_username;
  return -[NSString hash](*p_userIdentifier, "hash") - v3 + 32 * v3;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGLabeledObject label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    -[SGLabeledObject label](self, "label");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("unlabeled");
  }
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@/[%@ %@:%@:%@:%@:%@]"), v6, self->_displayName, self->_bundleIdentifier, self->_username, self->_userIdentifier, self->_service, self->_teamIdentifier);
  if (v5)

  return v7;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
