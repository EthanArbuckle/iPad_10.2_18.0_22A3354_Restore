@implementation GDAddressResolutionResultEntity

- (void)encodeWithCoder:(id)a3
{
  NSString *mdId;
  id v5;
  void *v6;
  const char *v7;
  NSString *contactId;
  const char *v9;
  id v10;

  mdId = self->_mdId;
  v5 = a3;
  NSStringFromSelector(sel_mdId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)mdId, v6);

  contactId = self->_contactId;
  NSStringFromSelector(sel_contactId);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v9, (uint64_t)contactId, v10);

}

- (GDAddressResolutionResultEntity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  GDAddressResolutionResultEntity *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_mdId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_error(v4, v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D50];
      v34[0] = CFSTR("GDAddressResolutionResultEntity mdId could not be decoded");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v34, &v33, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v20, v21, (uint64_t)CFSTR("GDErrorDomain"), 9, v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v23, (uint64_t)v22);

LABEL_8:
      v17 = 0;
      goto LABEL_9;
    }
  }
  v11 = objc_opt_class();
  NSStringFromSelector(sel_contactId);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend_error(v4, v15, v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("GDAddressResolutionResultEntity contactId could not be decoded");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)&v32, &v31, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v25, v27, (uint64_t)CFSTR("GDErrorDomain"), 9, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v29, (uint64_t)v28);

      v14 = 0;
      goto LABEL_8;
    }
  }
  self = (GDAddressResolutionResultEntity *)(id)objc_msgSend_initWithMdId_contactId_(self, v15, (uint64_t)v8, v14);
  v17 = self;
LABEL_9:

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_msgSend_allocWithZone_(GDAddressResolutionResultEntity, a2, (uint64_t)a3);
  return (id)objc_msgSend_initWithMdId_contactId_(v4, v5, (uint64_t)self->_mdId, self->_contactId);
}

- (BOOL)isEqual:(id)a3
{
  GDAddressResolutionResultEntity *v4;
  const char *v5;
  char isEqualToAddressResolutionResultEntity;

  v4 = (GDAddressResolutionResultEntity *)a3;
  if (v4 == self)
  {
    isEqualToAddressResolutionResultEntity = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      isEqualToAddressResolutionResultEntity = objc_msgSend_isEqualToAddressResolutionResultEntity_(self, v5, (uint64_t)v4);
    else
      isEqualToAddressResolutionResultEntity = 0;
  }

  return isEqualToAddressResolutionResultEntity;
}

- (BOOL)isEqualToAddressResolutionResultEntity:(id)a3
{
  GDAddressResolutionResultEntity *v4;
  const char *v5;
  uint64_t v6;
  GDAddressResolutionResultEntity *v7;
  void *mdId;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  NSString *contactId;
  NSString *v14;
  void *v15;
  const char *v16;
  char isEqualToString;

  v4 = (GDAddressResolutionResultEntity *)a3;
  v7 = v4;
  if (v4 == self)
  {
    isEqualToString = 1;
  }
  else
  {
    if (v4)
    {
      mdId = self->_mdId;
      objc_msgSend_mdId(v4, v5, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(mdId, v10, (uint64_t)v9))
      {
        contactId = self->_contactId;
        v14 = contactId;
        if (!contactId)
        {
          objc_msgSend_contactId(v7, v11, v12);
          mdId = (void *)objc_claimAutoreleasedReturnValue();
          if (!mdId)
          {
            isEqualToString = 1;
LABEL_13:

            goto LABEL_14;
          }
          v14 = self->_contactId;
        }
        objc_msgSend_contactId(v7, v11, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v14, v16, (uint64_t)v15);

        if (!contactId)
          goto LABEL_13;
      }
      else
      {
        isEqualToString = 0;
      }
LABEL_14:

      goto LABEL_15;
    }
    isEqualToString = 0;
  }
LABEL_15:

  return isEqualToString;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_hash(self->_mdId, a2, v2);
  return objc_msgSend_hash(self->_contactId, v5, v6) - v4 + 32 * v4;
}

- (GDAddressResolutionResultEntity)initWithMdId:(id)a3 contactId:(id)a4
{
  id v7;
  id v8;
  GDAddressResolutionResultEntity *v9;
  GDAddressResolutionResultEntity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDAddressResolutionResultEntity;
  v9 = -[GDAddressResolutionResultEntity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mdId, a3);
    objc_storeStrong((id *)&v10->_contactId, a4);
  }

  return v10;
}

- (id)description
{
  id v3;
  const char *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  return (id)objc_msgSend_initWithFormat_(v3, v4, (uint64_t)CFSTR("<GDAddressResolutionResultEntity: mdId:%@ contactId:%@>"), self->_mdId, self->_contactId);
}

- (NSString)mdId
{
  return self->_mdId;
}

- (NSString)contactId
{
  return self->_contactId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactId, 0);
  objc_storeStrong((id *)&self->_mdId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
