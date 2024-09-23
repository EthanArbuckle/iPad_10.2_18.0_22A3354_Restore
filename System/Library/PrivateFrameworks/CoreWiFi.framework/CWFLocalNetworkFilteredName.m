@implementation CWFLocalNetworkFilteredName

+ (id)filteredName:(id)a3 reason:(unint64_t)a4
{
  id v5;
  CWFLocalNetworkFilteredName *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v6 = objc_alloc_init(CWFLocalNetworkFilteredName);
  objc_msgSend_setName_(v6, v7, (uint64_t)v5, v8, v9);

  objc_msgSend_setReason_(v6, v10, a4, v11, v12);
  return v6;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v6, v9, (uint64_t)CFSTR("<%@ : %p"), v10, v11, v8, self);

  objc_msgSend_name(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_name(self, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v6, v22, (uint64_t)CFSTR(" name='%@'"), v23, v24, v21);

  }
  if (objc_msgSend_reason(self, v17, v18, v19, v20))
  {
    v29 = objc_msgSend_reason(self, v25, v26, v27, v28);
    objc_msgSend_appendFormat_(v6, v30, (uint64_t)CFSTR(" reason=%lu"), v31, v32, v29);
  }
  objc_msgSend_appendString_(v6, v25, (uint64_t)CFSTR(">"), v27, v28);
  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
