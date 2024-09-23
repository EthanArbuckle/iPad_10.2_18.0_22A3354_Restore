@implementation DMFFetchConfigurationSourceSyncTokenResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchConfigurationSourceSyncTokenResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchConfigurationSourceSyncTokenResultObject *v5;
  void *v6;
  uint64_t v7;
  NSString *syncToken;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchConfigurationSourceSyncTokenResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("syncToken"));
    v7 = objc_claimAutoreleasedReturnValue();
    syncToken = v5->_syncToken;
    v5->_syncToken = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchConfigurationSourceSyncTokenResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchConfigurationSourceSyncTokenResultObject syncToken](self, "syncToken", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("syncToken"));

}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncToken, 0);
}

@end
