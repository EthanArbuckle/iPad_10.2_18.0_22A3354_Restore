@implementation HKCDADocumentSample(HDCodingSupport)

- (HDCodableCDADocumentSample)codableRepresentationForSync
{
  HDCodableCDADocumentSample *v2;
  void *v3;
  char v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v2 = objc_alloc_init(HDCodableCDADocumentSample);
  v14.receiver = a1;
  v14.super_class = (Class)&off_1EF223730;
  objc_msgSendSuper2(&v14, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableCDADocumentSample setSample:](v2, "setSample:", v3);

  v4 = objc_msgSend(a1, "_omittedContentFlags");
  objc_msgSend(a1, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((v4 & 2) != 0)
      v6 = 2;
    else
      v6 = 1;
    if ((v4 & 1) != 0)
      v7 = 3;
    else
      v7 = v6;
    -[HDCodableCDADocumentSample setOmittedContent:](v2, "setOmittedContent:", v7);
    objc_msgSend(v5, "_compressedDocumentData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableCDADocumentSample setDocumentData:](v2, "setDocumentData:", v8);

    objc_msgSend(v5, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableCDADocumentSample setTitle:](v2, "setTitle:", v9);

    objc_msgSend(v5, "patientName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableCDADocumentSample setPatientName:](v2, "setPatientName:", v10);

    objc_msgSend(v5, "authorName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableCDADocumentSample setAuthorName:](v2, "setAuthorName:", v11);

    objc_msgSend(v5, "custodianName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableCDADocumentSample setCustodianName:](v2, "setCustodianName:", v12);

  }
  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addCdaDocumentSamples:", v5);

  return v5 != 0;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend([a1 alloc], "_init");
    if (objc_msgSend(v5, "applyToObject:", v6))
    {
      v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = 0;
      else
        v10 = v6;
      v11 = v10;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
