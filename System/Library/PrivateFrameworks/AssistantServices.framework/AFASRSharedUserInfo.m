@implementation AFASRSharedUserInfo

- (AFASRSharedUserInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFASRSharedUserInfoMutation *);
  AFASRSharedUserInfo *v5;
  AFASRSharedUserInfo *v6;
  _AFASRSharedUserInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *sharedUserId;
  void *v11;
  uint64_t v12;
  NSString *loggableSharedUserId;
  objc_super v15;

  v4 = (void (**)(id, _AFASRSharedUserInfoMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFASRSharedUserInfo;
  v5 = -[AFASRSharedUserInfo init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFASRSharedUserInfoMutation initWithBase:]([_AFASRSharedUserInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFASRSharedUserInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFASRSharedUserInfoMutation getSharedUserId](v7, "getSharedUserId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v9;

      -[_AFASRSharedUserInfoMutation getLoggableSharedUserId](v7, "getLoggableSharedUserId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      loggableSharedUserId = v6->_loggableSharedUserId;
      v6->_loggableSharedUserId = (NSString *)v12;

    }
  }

  return v6;
}

- (AFASRSharedUserInfo)init
{
  return -[AFASRSharedUserInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFASRSharedUserInfo)initWithSharedUserId:(id)a3 loggableSharedUserId:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  AFASRSharedUserInfo *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__AFASRSharedUserInfo_initWithSharedUserId_loggableSharedUserId___block_invoke;
  v12[3] = &unk_1E3A31E80;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[AFASRSharedUserInfo initWithBuilder:](self, "initWithBuilder:", v12);

  return v10;
}

- (id)description
{
  return -[AFASRSharedUserInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFASRSharedUserInfo;
  -[AFASRSharedUserInfo description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {sharedUserId = %@, loggableSharedUserId = %@}"), v5, self->_sharedUserId, self->_loggableSharedUserId);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_sharedUserId, "hash");
  return -[NSString hash](self->_loggableSharedUserId, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  AFASRSharedUserInfo *v4;
  AFASRSharedUserInfo *v5;
  NSString *v6;
  NSString *sharedUserId;
  NSString *v8;
  NSString *loggableSharedUserId;
  BOOL v10;

  v4 = (AFASRSharedUserInfo *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[AFASRSharedUserInfo sharedUserId](v5, "sharedUserId");
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      sharedUserId = self->_sharedUserId;
      if (sharedUserId == v6 || -[NSString isEqual:](sharedUserId, "isEqual:", v6))
      {
        -[AFASRSharedUserInfo loggableSharedUserId](v5, "loggableSharedUserId");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        loggableSharedUserId = self->_loggableSharedUserId;
        v10 = loggableSharedUserId == v8 || -[NSString isEqual:](loggableSharedUserId, "isEqual:", v8);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (AFASRSharedUserInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFASRSharedUserInfo *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFASRSharedUserInfo::sharedUserId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFASRSharedUserInfo::loggableSharedUserId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[AFASRSharedUserInfo initWithSharedUserId:loggableSharedUserId:](self, "initWithSharedUserId:loggableSharedUserId:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sharedUserId;
  id v5;

  sharedUserId = self->_sharedUserId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sharedUserId, CFSTR("AFASRSharedUserInfo::sharedUserId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loggableSharedUserId, CFSTR("AFASRSharedUserInfo::loggableSharedUserId"));

}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_sharedUserId, 0);
}

void __65__AFASRSharedUserInfo_initWithSharedUserId_loggableSharedUserId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSharedUserId:", v3);
  objc_msgSend(v4, "setLoggableSharedUserId:", *(_QWORD *)(a1 + 40));

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
  void (**v4)(id, _AFASRSharedUserInfoMutation *);
  _AFASRSharedUserInfoMutation *v5;
  AFASRSharedUserInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *sharedUserId;
  void *v10;
  uint64_t v11;
  NSString *loggableSharedUserId;

  v4 = (void (**)(id, _AFASRSharedUserInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFASRSharedUserInfoMutation initWithBase:]([_AFASRSharedUserInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFASRSharedUserInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFASRSharedUserInfo);
      -[_AFASRSharedUserInfoMutation getSharedUserId](v5, "getSharedUserId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v8;

      -[_AFASRSharedUserInfoMutation getLoggableSharedUserId](v5, "getLoggableSharedUserId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      loggableSharedUserId = v6->_loggableSharedUserId;
      v6->_loggableSharedUserId = (NSString *)v11;

    }
    else
    {
      v6 = (AFASRSharedUserInfo *)-[AFASRSharedUserInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFASRSharedUserInfo *)-[AFASRSharedUserInfo copy](self, "copy");
  }

  return v6;
}

@end
