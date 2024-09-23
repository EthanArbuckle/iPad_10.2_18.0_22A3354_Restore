@implementation HFUserHandle

- (HFUserHandle)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithType_userID_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFUserHandle.m"), 18, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFUserHandle init]",
    v5);

  return 0;
}

- (HFUserHandle)initWithType:(unint64_t)a3 userID:(id)a4
{
  id v7;
  HFUserHandle *v8;
  HFUserHandle *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFUserHandle;
  v8 = -[HFUserHandle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_userID, a4);
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFUserHandle type](self, "type"), CFSTR("type"));
  -[HFUserHandle userID](self, "userID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("userID"));

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (NAIdentity)na_identity
{
  if (qword_1ED378DF0 != -1)
    dispatch_once(&qword_1ED378DF0, &__block_literal_global_33);
  return (NAIdentity *)(id)_MergedGlobals_225;
}

void __27__HFUserHandle_na_identity__block_invoke()
{
  id v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v4, "appendCharacteristic:", &__block_literal_global_13_2);
  v1 = (id)objc_msgSend(v4, "appendCharacteristic:", &__block_literal_global_15_1);
  objc_msgSend(v4, "build");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_225;
  _MergedGlobals_225 = v2;

}

uint64_t __27__HFUserHandle_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
}

uint64_t __27__HFUserHandle_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userID");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (NSString)userID
{
  return self->_userID;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userID, 0);
}

@end
