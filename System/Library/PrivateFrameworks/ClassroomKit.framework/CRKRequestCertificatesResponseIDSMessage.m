@implementation CRKRequestCertificatesResponseIDSMessage

- (CRKRequestCertificatesResponseIDSMessage)initWithRequestIdentifier:(id)a3 certificateDataCollection:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  CRKRequestCertificatesResponseIDSMessage *v12;
  CRKRequestCertificatesResponseIDSMessage *v13;
  uint64_t v14;
  NSArray *certificateDataCollection;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKRequestCertificatesResponseIDSMessage;
  v12 = -[CRKRequestCertificatesResponseIDSMessage init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestIdentifier, a3);
    v14 = objc_msgSend(v10, "copy");
    certificateDataCollection = v13->_certificateDataCollection;
    v13->_certificateDataCollection = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_error, a5);
  }

  return v13;
}

- (int64_t)messageType
{
  return 2;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CRKErrorBox *v8;
  void *v9;
  CRKErrorBox *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[CRKRequestCertificatesResponseIDSMessage requestIdentifier](self, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("RequestIdentifier"));

  -[CRKRequestCertificatesResponseIDSMessage certificateDataCollection](self, "certificateDataCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("CertificateDataCollection"));

  -[CRKRequestCertificatesResponseIDSMessage error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [CRKErrorBox alloc];
    -[CRKRequestCertificatesResponseIDSMessage error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CRKErrorBox initWithError:](v8, "initWithError:", v9);
    -[CRKErrorBox dictionaryValue](v10, "dictionaryValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("ErrorBox"));

  }
  v12 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v12;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RequestIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ErrorBox"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CertificateDataCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v7)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v7);
    if (v14)
    {
      if (!v10)
      {
        v17 = 0;
        goto LABEL_18;
      }
      +[CRKErrorBox instanceWithDictionary:](CRKErrorBox, "instanceWithDictionary:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = v15;
        objc_msgSend(v15, "error");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
        v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestIdentifier:certificateDataCollection:error:", v14, v13, v17);

        goto LABEL_19;
      }
    }
    v18 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v18 = 0;
LABEL_20:

  return v18;
}

- (NSUUID)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSArray)certificateDataCollection
{
  return self->_certificateDataCollection;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_certificateDataCollection, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
