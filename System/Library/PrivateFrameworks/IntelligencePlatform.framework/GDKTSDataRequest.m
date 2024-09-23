@implementation GDKTSDataRequest

- (GDKTSDataRequest)initWithParameters:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  GDKTSDataRequest *v7;
  uint64_t v8;
  GDKTSQueryParams *parameters;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GDKTSDataRequest;
  v7 = -[GDKTSDataRequest init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_copy(v4, v5, v6);
    parameters = v7->_parameters;
    v7->_parameters = (GDKTSQueryParams *)v8;

  }
  return v7;
}

- (GDKTSDataRequest)initWithParameters:(id)a3 cadence:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  GDKTSDataRequest *v9;
  uint64_t v10;
  GDKTSQueryParams *parameters;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GDKTSDataRequest;
  v9 = -[GDKTSDataRequest init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v6, v7, v8);
    parameters = v9->_parameters;
    v9->_parameters = (GDKTSQueryParams *)v10;

    v9->_cadence = a4;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  GDKTSQueryParams *parameters;
  id v5;
  void *v6;
  const char *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  parameters = self->_parameters;
  v5 = a3;
  NSStringFromSelector(sel_parameters);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)parameters, v6);

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, self->_cadence);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cadence);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v5, v10, (uint64_t)v11, v9);

}

- (GDKTSDataRequest)initWithCoder:(id)a3
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
  int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  GDKTSDataRequest *v28;
  void *v29;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_parameters);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = objc_opt_class();
    NSStringFromSelector(sel_cadence);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_intValue(v14, v15, v16);

    if (v17
      || (objc_msgSend_error(v4, v18, v19), v29 = (void *)objc_claimAutoreleasedReturnValue(), v29, !v29))
    {
      v20 = (void *)objc_msgSend_initWithParameters_cadence_(self, v18, (uint64_t)v8, v17);
    }
    else
    {
      v20 = (void *)objc_msgSend_initWithParameters_(self, v18, (uint64_t)v8);
    }
    self = v20;
    v28 = self;
  }
  else
  {
    objc_msgSend_error(v4, v9, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("GDKTSQueryParams is nil");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)v32, &v31, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v23, v25, (uint64_t)CFSTR("GDErrorDomain"), 9, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failWithError_(v4, v27, (uint64_t)v26);

    }
    v28 = 0;
  }

  return v28;
}

- (GDKTSQueryParams)parameters
{
  return self->_parameters;
}

- (int64_t)cadence
{
  return self->_cadence;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
