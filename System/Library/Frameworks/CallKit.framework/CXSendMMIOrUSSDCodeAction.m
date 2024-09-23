@implementation CXSendMMIOrUSSDCodeAction

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXSendMMIOrUSSDCodeAction;
  -[CXAction customDescription](&v7, sel_customDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXSendMMIOrUSSDCodeAction code](self, "code");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" code=%@"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" ttyType=%ld"), -[CXSendMMIOrUSSDCodeAction ttyType](self, "ttyType"));
  -[CXSendMMIOrUSSDCodeAction senderIdentityUUID](self, "senderIdentityUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" senderIdentityUUID=%@"), v5);

  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CXSendMMIOrUSSDCodeAction;
  v6 = a3;
  -[CXAction updateCopy:withZone:](&v9, sel_updateCopy_withZone_, v6, a4);
  -[CXSendMMIOrUSSDCodeAction code](self, "code", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCode:", v7);

  objc_msgSend(v6, "setTtyType:", -[CXSendMMIOrUSSDCodeAction ttyType](self, "ttyType"));
  -[CXSendMMIOrUSSDCodeAction senderIdentityUUID](self, "senderIdentityUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSenderIdentityUUID:", v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSendMMIOrUSSDCodeAction)initWithCoder:(id)a3
{
  id v4;
  CXSendMMIOrUSSDCodeAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *code;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSUUID *senderIdentityUUID;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CXSendMMIOrUSSDCodeAction;
  v5 = -[CXAction initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_code);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    code = v5->_code;
    v5->_code = (NSString *)v8;

    NSStringFromSelector(sel_ttyType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ttyType = objc_msgSend(v4, "decodeIntegerForKey:", v10);

    v11 = objc_opt_class();
    NSStringFromSelector(sel_senderIdentityUUID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    senderIdentityUUID = v5->_senderIdentityUUID;
    v5->_senderIdentityUUID = (NSUUID *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CXSendMMIOrUSSDCodeAction;
  v4 = a3;
  -[CXAction encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  -[CXSendMMIOrUSSDCodeAction code](self, "code", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_code);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[CXSendMMIOrUSSDCodeAction ttyType](self, "ttyType");
  NSStringFromSelector(sel_ttyType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  -[CXSendMMIOrUSSDCodeAction senderIdentityUUID](self, "senderIdentityUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_senderIdentityUUID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)ttyType
{
  return self->_ttyType;
}

- (void)setTtyType:(int64_t)a3
{
  self->_ttyType = a3;
}

- (NSUUID)senderIdentityUUID
{
  return self->_senderIdentityUUID;
}

- (void)setSenderIdentityUUID:(id)a3
{
  objc_storeStrong((id *)&self->_senderIdentityUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderIdentityUUID, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

@end
