@implementation IDSServerBagValidator

- (id)trustedContentsFromRawContents:(id)a3 shouldReport:(BOOL)a4 withError:(id *)a5
{
  _BOOL4 v6;
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  __SecTrust *v13;
  __CFError *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  double v29;
  int v30;
  BOOL v31;
  id v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  id v41;
  IDSServerBagLoadedContents *v42;
  const char *v43;
  double v44;
  void *v45;
  id v47;
  id v48;
  __CFError *v49;

  v6 = a4;
  v8 = a3;
  objc_msgSend_serverCerts(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v13 = sub_19B94BBFC(self, v12, v6, &v49);
  v14 = v49;

  if (v13)
  {
    objc_msgSend_serverSignature(v8, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_signedBag(v8, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_config(self, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_hashAlgorithm(v26, v27, v28, v29);
    v48 = 0;
    v31 = sub_19B971FD4(self, v18, v22, v13, v30, &v48);
    v32 = v48;

    CFRelease(v13);
    if (v31)
    {
      v36 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend_signedBag(v8, v33, v34, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      objc_msgSend_propertyListWithData_options_format_error_(v36, v38, (uint64_t)v37, v39, 0, 0, &v47);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v47;

      if (v40)
      {
        v42 = [IDSServerBagLoadedContents alloc];
        v45 = (void *)objc_msgSend_initWithDictionary_rawContents_(v42, v43, (uint64_t)v40, v44, v8);
      }
      else if (a5)
      {
        IDSServerBagContentErrorWithUnderlyingError(200, v41);
        v45 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v45 = 0;
      }

    }
    else if (a5)
    {
      IDSServerBagContentErrorWithUnderlyingError(500, v32);
      v45 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = 0;
    }

  }
  else if (a5)
  {
    IDSServerBagContentErrorWithUnderlyingError(400, v14);
    v45 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

- (IDSServerBagValidator)initWithConfig:(id)a3
{
  id v5;
  IDSServerBagValidator *v6;
  IDSServerBagValidator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSServerBagValidator;
  v6 = -[IDSServerBagValidator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_config, a3);

  return v7;
}

- (IDSServerBagConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

@end
