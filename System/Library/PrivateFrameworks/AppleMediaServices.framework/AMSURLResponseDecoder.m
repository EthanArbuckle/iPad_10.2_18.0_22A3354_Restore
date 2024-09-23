@implementation AMSURLResponseDecoder

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "response");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_14;
  objc_msgSend(v6, "response");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSURLResponseDecoder allowedStatusCodes](self, "allowedStatusCodes");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[AMSURLResponseDecoder allowedStatusCodes](self, "allowedStatusCodes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsIndex:", objc_msgSend(v9, "statusCode"));

    if ((v12 & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      v33[0] = CFSTR("AMSStatusCode");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "statusCode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = v13;
      v33[1] = CFSTR("AMSURL");
      objc_msgSend(v6, "response");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      AMSCustomError(CFSTR("AMSErrorDomain"), 301, CFSTR("Invalid Status Code"), CFSTR("The response has an invalid status code"), v17, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v9, "ams_valueForHTTPHeaderField:", CFSTR("Content-Type"));
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[AMSURLResponseDecoder allowedContentTypes](self, "allowedContentTypes");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[AMSURLResponseDecoder allowedContentTypes](self, "allowedContentTypes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "containsObject:", v18);

    if ((v22 & 1) == 0)
    {
      v23 = &stru_1E2548760;
      if (v18)
        v23 = v18;
      v32[0] = v23;
      v31[0] = CFSTR("AMSContentType");
      v31[1] = CFSTR("AMSURL");
      objc_msgSend(v6, "response");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "URL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v32[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      AMSCustomError(CFSTR("AMSErrorDomain"), 301, CFSTR("Invalid Content Type"), CFSTR("The response has an invalid content type"), v27, 0);
      v28 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v28;
    }
  }

  if (v10)
  {
    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      v29 = 0;
      *a4 = v10;
    }
    else
    {
      v29 = 0;
    }
  }
  else
  {
LABEL_14:
    v29 = v6;
    v10 = 0;
  }

  return v29;
}

- (NSIndexSet)allowedStatusCodes
{
  return self->_allowedStatusCodes;
}

- (NSSet)allowedContentTypes
{
  return self->_allowedContentTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedContentTypes, 0);
  objc_storeStrong((id *)&self->_allowedStatusCodes, 0);
}

- (AMSURLResponseDecoder)init
{
  AMSURLResponseDecoder *v2;
  uint64_t v3;
  NSIndexSet *allowedStatusCodes;
  NSSet *allowedContentTypes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AMSURLResponseDecoder;
  v2 = -[AMSURLResponseDecoder init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 200, 100);
    allowedStatusCodes = v2->_allowedStatusCodes;
    v2->_allowedStatusCodes = (NSIndexSet *)v3;

    allowedContentTypes = v2->_allowedContentTypes;
    v2->_allowedContentTypes = 0;

  }
  return v2;
}

- (void)setAllowedStatusCodes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setAllowedContentTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
