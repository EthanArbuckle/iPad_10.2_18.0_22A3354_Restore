@implementation HDClinicalAttachmentSchemaProvider

+ (id)schemaIdentifier
{
  return (id)*MEMORY[0x1E0CB47B8];
}

- (int64_t)schemaVersionForObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  int64_t v10;
  id v12;

  v12 = 0;
  -[HDClinicalAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a3, a4, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  objc_msgSend(v7, "hd_sampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a5, 100, CFSTR("Failed to fetch object"), v8);
    goto LABEL_7;
  }
  if (!self)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  if ((unint64_t)(objc_msgSend(v9, "code") - 267) < 2)
    v10 = 1;
  else
    v10 = -1;
LABEL_8:

  return v10;
}

- (id)_objectWithIdentifier:(void *)a3 profile:(_QWORD *)a4 errorOut:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v7 = a2;
  v8 = a3;
  if (!a1)
    goto LABEL_12;
  if (!objc_msgSend(v7, "hasPrefix:", *MEMORY[0x1E0CB4A00]))
  {
    if (objc_msgSend(v7, "hasPrefix:", *MEMORY[0x1E0CB49F8]))
    {
      +[HDMedicalRecordEntity medicalRecordWithAttachmentObjectIdentifier:profile:error:](HDMedicalRecordEntity, "medicalRecordWithAttachmentObjectIdentifier:profile:error:", v7, v8, a4);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("identifier is not a clinical or medical record  %@"), v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  +[HDClinicalRecordEntity clinicalRecordWithAttachmentObjectIdentifier:profile:error:](HDClinicalRecordEntity, "clinicalRecordWithAttachmentObjectIdentifier:profile:error:", v7, v8, a4);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = (void *)v9;
LABEL_13:

  return v10;
}

- (BOOL)validateAttachment:(id)a3 forObjectWithIdentifier:(id)a4 metadata:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v8;

  v8 = objc_msgSend(a3, "size");
  if (v8 >= 26214401)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a7, 3, CFSTR("File size is too large"));
  return v8 < 26214401;
}

- (BOOL)readAuthorizationForObjectIdentifier:(id)a3 client:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  char v13;

  v10 = a4;
  -[HDClinicalAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "authorizationOracle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAuthorizedToReadObject:error:", v11, a6);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)writeAuthorizationForObjectIdentifier:(id)a3 client:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 110, CFSTR("Adding attachments is not supported"), a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v7);
    else
      _HKLogDroppedError();
  }

  return 0;
}

@end
