@implementation AFInstanceInfo

- (AFInstanceInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFInstanceInfoMutation *);
  AFInstanceInfo *v5;
  AFInstanceInfo *v6;
  _AFInstanceInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSUUID *instanceUUID;
  void *v11;
  uint64_t v12;
  NSUUID *applicationUUID;
  objc_super v15;

  v4 = (void (**)(id, _AFInstanceInfoMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFInstanceInfo;
  v5 = -[AFInstanceInfo init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFInstanceInfoMutation initWithBase:]([_AFInstanceInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFInstanceInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFInstanceInfoMutation getInstanceUUID](v7, "getInstanceUUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      instanceUUID = v6->_instanceUUID;
      v6->_instanceUUID = (NSUUID *)v9;

      v6->_applicationType = -[_AFInstanceInfoMutation getApplicationType](v7, "getApplicationType");
      -[_AFInstanceInfoMutation getApplicationUUID](v7, "getApplicationUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      applicationUUID = v6->_applicationUUID;
      v6->_applicationUUID = (NSUUID *)v12;

    }
  }

  return v6;
}

void __71__AFInstanceInfo_initWithInstanceUUID_applicationType_applicationUUID___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setInstanceUUID:", v3);
  objc_msgSend(v4, "setApplicationType:", a1[6]);
  objc_msgSend(v4, "setApplicationUUID:", a1[5]);

}

- (AFInstanceInfo)initWithInstanceUUID:(id)a3 applicationType:(int64_t)a4 applicationUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  AFInstanceInfo *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  int64_t v17;

  v8 = a3;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__AFInstanceInfo_initWithInstanceUUID_applicationType_applicationUUID___block_invoke;
  v14[3] = &unk_1E3A2DA20;
  v16 = v9;
  v17 = a4;
  v15 = v8;
  v10 = v9;
  v11 = v8;
  v12 = -[AFInstanceInfo initWithBuilder:](self, "initWithBuilder:", v14);

  return v12;
}

- (AFInstanceInfo)init
{
  return -[AFInstanceInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (NSString)description
{
  return (NSString *)-[AFInstanceInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  int64_t applicationType;
  NSUUID *instanceUUID;
  const __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  objc_super v13;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)AFInstanceInfo;
  -[AFInstanceInfo description](&v13, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  instanceUUID = self->_instanceUUID;
  applicationType = self->_applicationType;
  v8 = CFSTR("(unknown)");
  if (applicationType == 1)
    v8 = CFSTR("default");
  if (applicationType)
    v9 = (__CFString *)v8;
  else
    v9 = CFSTR("unspecified");
  v10 = v9;
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {instanceUUID = %@, applicationType = %@, applicationUUID = %@}"), v5, instanceUUID, v10, self->_applicationUUID);

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSUUID hash](self->_instanceUUID, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_applicationType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ v3 ^ -[NSUUID hash](self->_applicationUUID, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  AFInstanceInfo *v4;
  AFInstanceInfo *v5;
  int64_t applicationType;
  NSUUID *v7;
  NSUUID *instanceUUID;
  NSUUID *v9;
  NSUUID *applicationUUID;
  BOOL v11;

  v4 = (AFInstanceInfo *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      applicationType = self->_applicationType;
      if (applicationType == -[AFInstanceInfo applicationType](v5, "applicationType"))
      {
        -[AFInstanceInfo instanceUUID](v5, "instanceUUID");
        v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        instanceUUID = self->_instanceUUID;
        if (instanceUUID == v7 || -[NSUUID isEqual:](instanceUUID, "isEqual:", v7))
        {
          -[AFInstanceInfo applicationUUID](v5, "applicationUUID");
          v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          applicationUUID = self->_applicationUUID;
          v11 = applicationUUID == v9 || -[NSUUID isEqual:](applicationUUID, "isEqual:", v9);

        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (AFInstanceInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  AFInstanceInfo *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFInstanceInfo::instanceUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFInstanceInfo::applicationType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFInstanceInfo::applicationUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[AFInstanceInfo initWithInstanceUUID:applicationType:applicationUUID:](self, "initWithInstanceUUID:applicationType:applicationUUID:", v5, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *instanceUUID;
  void *v5;
  id v6;

  instanceUUID = self->_instanceUUID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", instanceUUID, CFSTR("AFInstanceInfo::instanceUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_applicationType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("AFInstanceInfo::applicationType"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_applicationUUID, CFSTR("AFInstanceInfo::applicationUUID"));
}

- (AFInstanceInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFInstanceInfo *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("instanceUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("applicationType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = AFInstanceApplicationTypeGetFromName(v9);
    else
      v10 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("applicationUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    self = -[AFInstanceInfo initWithInstanceUUID:applicationType:applicationUUID:](self, "initWithInstanceUUID:applicationType:applicationUUID:", v7, v10, v12);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSUUID *instanceUUID;
  int64_t applicationType;
  const __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  NSUUID *applicationUUID;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  instanceUUID = self->_instanceUUID;
  if (instanceUUID)
    objc_msgSend(v3, "setObject:forKey:", instanceUUID, CFSTR("instanceUUID"));
  applicationType = self->_applicationType;
  v7 = CFSTR("(unknown)");
  if (applicationType == 1)
    v7 = CFSTR("default");
  if (applicationType)
    v8 = (__CFString *)v7;
  else
    v8 = CFSTR("unspecified");
  v9 = v8;
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("applicationType"));

  applicationUUID = self->_applicationUUID;
  if (applicationUUID)
    objc_msgSend(v4, "setObject:forKey:", applicationUUID, CFSTR("applicationUUID"));
  v11 = (void *)objc_msgSend(v4, "copy");

  return v11;
}

- (NSUUID)instanceUUID
{
  return self->_instanceUUID;
}

- (int64_t)applicationType
{
  return self->_applicationType;
}

- (NSUUID)applicationUUID
{
  return self->_applicationUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationUUID, 0);
  objc_storeStrong((id *)&self->_instanceUUID, 0);
}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFInstanceInfoMutation *);
  _AFInstanceInfoMutation *v5;
  AFInstanceInfo *v6;
  void *v7;
  uint64_t v8;
  NSUUID *instanceUUID;
  void *v10;
  uint64_t v11;
  NSUUID *applicationUUID;

  v4 = (void (**)(id, _AFInstanceInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFInstanceInfoMutation initWithBase:]([_AFInstanceInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFInstanceInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFInstanceInfo);
      -[_AFInstanceInfoMutation getInstanceUUID](v5, "getInstanceUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      instanceUUID = v6->_instanceUUID;
      v6->_instanceUUID = (NSUUID *)v8;

      v6->_applicationType = -[_AFInstanceInfoMutation getApplicationType](v5, "getApplicationType");
      -[_AFInstanceInfoMutation getApplicationUUID](v5, "getApplicationUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      applicationUUID = v6->_applicationUUID;
      v6->_applicationUUID = (NSUUID *)v11;

    }
    else
    {
      v6 = (AFInstanceInfo *)-[AFInstanceInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFInstanceInfo *)-[AFInstanceInfo copy](self, "copy");
  }

  return v6;
}

@end
