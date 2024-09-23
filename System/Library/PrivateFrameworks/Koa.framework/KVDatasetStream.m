@implementation KVDatasetStream

- (void)finish:(id)a3
{
  void (**v4)(id, _QWORD);
  CCSetDonation *donation;
  const char *v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (void (**)(id, _QWORD))a3;
  donation = self->_donation;
  v12 = 0;
  v8 = objc_msgSend_finish_(donation, v6, (uint64_t)&v12, v7);
  v9 = v12;
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    if (v4)
      v4[2](v4, 0);
  }
  else if (v4)
  {
    sub_1B70E8948(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v11);

  }
}

- (KVDatasetStream)initWithDonation:(id)a3
{
  id v5;
  KVDatasetStream *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  KVDatasetStream *v13;
  void *v14;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)KVDatasetStream;
  v6 = -[KVDatasetStream init](&v21, sel_init);
  if (!v6)
    goto LABEL_7;
  v7 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v6, v8, v7, v9)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (v10 = objc_opt_class(), objc_msgSend_isMemberOfClass_(v6, v11, v10, v12))
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_storeStrong((id *)&v6->_donation, a3);
LABEL_7:
    v13 = v6;
    goto LABEL_11;
  }
  v14 = (void *)qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
  {
    v16 = v14;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v23 = "-[KVDatasetStream initWithDonation:]";
    v24 = 2112;
    v25 = v18;
    v26 = 2112;
    v27 = v20;
    _os_log_error_impl(&dword_1B70E7000, v16, OS_LOG_TYPE_ERROR, "%s Unexpected donation: %@ for class: %@", buf, 0x20u);

  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (CCSetDonation)donation
{
  return self->_donation;
}

- (id)_cascadeItemFromItem:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  void *v29;
  id v31;

  v5 = a3;
  v31 = 0;
  objc_msgSend_toCascadeItem_(v5, v6, (uint64_t)&v31, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v31;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = (void *)MEMORY[0x1E0CB3940];
    v16 = objc_msgSend_itemType(v5, v13, v14, v15);
    KVItemTypeDescription(v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_itemId(v5, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v12, v23, (uint64_t)CFSTR("KVItem (%@) with itemId: \"%@\" cannot be converted to Cascade item instance"), v24, v18, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v11, v26, (uint64_t)v25, *MEMORY[0x1E0CB2D50]);

    if (v9)
      objc_msgSend_setObject_forKey_(v11, v27, (uint64_t)v9, *MEMORY[0x1E0CB3388]);
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v27, (uint64_t)CFSTR("com.apple.koa.donate"), 1, v11);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (a4 && v28)
      *a4 = objc_retainAutorelease(v28);

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donation, 0);
}

- (KVDatasetStream)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_description(self->_donation, a2, v2, v3);
}

- (void)cancel
{
  ((void (*)(CCSetDonation *, char *))MEMORY[0x1E0DE7D20])(self->_donation, sel_cancel);
}

@end
