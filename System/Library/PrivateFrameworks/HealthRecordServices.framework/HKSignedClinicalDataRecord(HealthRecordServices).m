@implementation HKSignedClinicalDataRecord(HealthRecordServices)

- (void)copyWithItems:()HealthRecordServices
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  v22 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD3F78], "signedClinicalDataRecordType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "note");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(a1, "enteredInError");
  objc_msgSend(a1, "modifiedDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "originIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locale");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(a1, "extractionVersion");
  objc_msgSend(a1, "device");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "metadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sortDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "country");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(a1, "state");
  objc_msgSend(a1, "credentialTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "issuerIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "issuedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "relevantDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "signatureStatus");
  objc_msgSend(a1, "subject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "signedClinicalDataRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:credentialTypes:issuerIdentifier:issuedDate:relevantDate:expirationDate:signatureStatus:subject:items:dataValue:sourceType:", v28, v27, v21, v20, v19, v18, v17, v26, v25, v16, v24, v15, v14, v13, v12,
    v5,
    v6,
    v7,
    v8,
    v4,
    v9,
    objc_msgSend(a1, "sourceType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setUUID:", v10);

  return v23;
}

@end
