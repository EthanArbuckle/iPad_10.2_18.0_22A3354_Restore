@implementation _HDCDASampleEntityEncoder

- (id)orderedProperties
{
  int64_t v3;
  const __CFString **v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v3 = -[HDEntityEncoder purpose](self, "purpose");
  if (v3 == 1)
  {
    v10 = CFSTR("document_data");
    v4 = &v10;
  }
  else
  {
    if (v3)
    {
      v5 = 0;
      goto LABEL_7;
    }
    v11[0] = CFSTR("document_data");
    v4 = (const __CFString **)v11;
  }
  v4[1] = CFSTR("title");
  v4[2] = CFSTR("patient_name");
  v4[3] = CFSTR("author_name");
  v4[4] = CFSTR("custodian_name");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  HDCodableCDADocumentSample *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(HDCodableCDADocumentSample);
    -[HDCodableCDADocumentSample setSample:](v10, "setSample:", v9);
    HDSQLiteColumnWithNameAsData();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableCDADocumentSample setDocumentData:](v10, "setDocumentData:", v11);
    -[HDCodableCDADocumentSample setTitle:](v10, "setTitle:", v12);
    -[HDCodableCDADocumentSample setPatientName:](v10, "setPatientName:", v13);
    -[HDCodableCDADocumentSample setAuthorName:](v10, "setAuthorName:", v14);
    -[HDCodableCDADocumentSample setCustodianName:](v10, "setCustodianName:", v15);
    -[HDCodableCDADocumentSample setOmittedContent:](v10, "setOmittedContent:", 1);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  uint64_t (**v13)(id, void *, int64_t, uint64_t, id *);
  void *v14;
  void *v15;
  int64_t v16;
  uint64_t v17;
  id v18;
  BOOL v19;

  v13 = (uint64_t (**)(id, void *, int64_t, uint64_t, id *))a7;
  -[_HDCDASampleEntityEncoder codableRepresentationForPersistentID:row:error:](self, "codableRepresentationForPersistentID:row:error:", a3, a4, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v19 = 0;
    goto LABEL_12;
  }
  v16 = objc_msgSend(v14, "encodedByteCount");
  v17 = objc_msgSend((id)objc_opt_class(), "estimatedEncodedSize");
  if (v16 <= v17)
    v16 = v17;
  if (v16 > a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("encoded size (%ld) > maximum (%ld) so this entity will by skipped"), v16, a5);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    goto LABEL_11;
  }
  v19 = v13[2](v13, v15, v16, 1, a6) != 2;
LABEL_12:

  return v19;
}

- (id)createBareObjectWithRow:(HDSQLiteRow *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6358]), "_init");
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if (v12)
  {
    -[HDEntityEncoder encodingOptions](self, "encodingOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKey:", CFSTR("IncludeCDADocument"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      objc_msgSend(v14, "objectForKey:", CFSTR("IncludeCDADocumentData"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        v16 |= 2uLL;
      if ((v16 & 2) == 0)
      {
        HDSQLiteColumnWithNameAsData();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        HDSQLiteColumnWithNameAsString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        HDSQLiteColumnWithNameAsString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HDSQLiteColumnWithNameAsString();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        HDSQLiteColumnWithNameAsString();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_applyPropertiesWithOmittedFlags:compressedDocumentData:title:patientName:authorName:custodianName:", v16, v18, v19, v20, v21, v22);

        goto LABEL_10;
      }
    }
    else
    {
      v16 = 3;
    }
    v18 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v12;
}

@end
