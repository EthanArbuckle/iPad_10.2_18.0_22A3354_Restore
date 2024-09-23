@implementation GDAddressResolutionRequest

- (void)encodeWithCoder:(id)a3
{
  NSString *addressString;
  id v4;
  const char *v5;
  id v6;

  addressString = self->_addressString;
  v4 = a3;
  NSStringFromSelector(sel_addressString);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)addressString, v6);

}

- (GDAddressResolutionRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  GDAddressResolutionRequest *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_addressString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = (GDAddressResolutionRequest *)(id)objc_msgSend_initWithAddressString_(self, v9, (uint64_t)v8);
    v11 = self;
  }
  else
  {
    objc_msgSend_error(v4, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D50];
      v21[0] = CFSTR("GDAddressResolutionRequest addressString could not be decoded");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v21, &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, (uint64_t)CFSTR("GDErrorDomain"), 9, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v18, (uint64_t)v17);

    }
    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_msgSend_allocWithZone_(GDAddressResolutionRequest, a2, (uint64_t)a3);
  return (id)objc_msgSend_initWithAddressString_(v4, v5, (uint64_t)self->_addressString);
}

- (GDAddressResolutionRequest)initWithAddressString:(id)a3
{
  id v5;
  GDAddressResolutionRequest *v6;
  GDAddressResolutionRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDAddressResolutionRequest;
  v6 = -[GDAddressResolutionRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_addressString, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  GDAddressResolutionRequest *v4;
  const char *v5;
  char isEqualToAddressResolutionRequest;

  v4 = (GDAddressResolutionRequest *)a3;
  if (v4 == self)
  {
    isEqualToAddressResolutionRequest = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      isEqualToAddressResolutionRequest = objc_msgSend_isEqualToAddressResolutionRequest_(self, v5, (uint64_t)v4);
    else
      isEqualToAddressResolutionRequest = 0;
  }

  return isEqualToAddressResolutionRequest;
}

- (BOOL)isEqualToAddressResolutionRequest:(id)a3
{
  GDAddressResolutionRequest *v4;
  const char *v5;
  uint64_t v6;
  GDAddressResolutionRequest *v7;
  NSString *addressString;
  void *v9;
  const char *v10;
  char isEqualToString;

  v4 = (GDAddressResolutionRequest *)a3;
  v7 = v4;
  if (v4 == self)
  {
    isEqualToString = 1;
  }
  else if (v4)
  {
    addressString = self->_addressString;
    objc_msgSend_addressString(v4, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(addressString, v10, (uint64_t)v9);

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (unint64_t)hash
{
  uint64_t v2;

  return objc_msgSend_hash(self->_addressString, a2, v2);
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<GDAddressResolutionRequest: addressString: %@>"), self->_addressString);
}

- (NSString)addressString
{
  return self->_addressString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
