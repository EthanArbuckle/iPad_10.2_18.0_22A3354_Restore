@implementation CRKFetchUserImageResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchUserImageResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchUserImageResultObject *v5;
  void *v6;
  uint64_t v7;
  NSData *userImageData;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchUserImageResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("userImageData"));
    v7 = objc_claimAutoreleasedReturnValue();
    userImageData = v5->_userImageData;
    v5->_userImageData = (NSData *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKFetchUserImageResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKFetchUserImageResultObject userImageData](self, "userImageData", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("userImageData"));

}

- (NSData)userImageData
{
  return self->_userImageData;
}

- (void)setUserImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userImageData, 0);
}

@end
