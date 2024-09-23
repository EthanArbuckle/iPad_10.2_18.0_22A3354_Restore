@implementation HDVerifiableClinicalRecordEntity

+ (id)databaseTable
{
  return CFSTR("verifiable_clinical_record_samples");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 11;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_41;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[12];

  v27[11] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a5;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDVerifiableClinicalRecordEntity.m"), 67, CFSTR("Subclasses must override %s"), "+[HDVerifiableClinicalRecordEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v27[0] = CFSTR("data_id");
  v27[1] = CFSTR("record_types");
  v27[2] = CFSTR("issued_date");
  v27[3] = CFSTR("relevant_date");
  v27[4] = CFSTR("expiration_date");
  v27[5] = CFSTR("issuer_identifier");
  v27[6] = CFSTR("subject");
  v27[7] = CFSTR("item_names");
  v27[8] = CFSTR("jws_representation");
  v27[9] = CFSTR("origin_identifier");
  v27[10] = CFSTR("source_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __98__HDVerifiableClinicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v24[3] = &unk_1E6CE89A8;
  v25 = v13;
  v26 = v12;
  v17 = v12;
  v18 = v13;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v14, v16, a7, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = v18;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

void __98__HDVerifiableClinicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  MEMORY[0x1BCCAB114](a2, CFSTR("data_id"), objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  objc_msgSend(*(id *)(a1 + 40), "recordTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

  objc_msgSend(*(id *)(a1 + 40), "issuedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("issued_date"), v5);

  objc_msgSend(*(id *)(a1 + 40), "relevantDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("relevant_date"), v6);

  objc_msgSend(*(id *)(a1 + 40), "expirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0E4](a2, CFSTR("expiration_date"), v7);

  objc_msgSend(*(id *)(a1 + 40), "issuerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB144](a2, CFSTR("issuer_identifier"), v8);

  objc_msgSend(*(id *)(a1 + 40), "subject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

  objc_msgSend(*(id *)(a1 + 40), "itemNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

  objc_msgSend(*(id *)(a1 + 40), "dataRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB0D8](a2, CFSTR("jws_representation"), v11);

  objc_msgSend(*(id *)(a1 + 40), "originIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB168](a2, CFSTR("origin_identifier"), v12);

  v13 = (void *)MEMORY[0x1E0CB6D98];
  objc_msgSend(*(id *)(a1 + 40), "sourceType");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("source_type"), objc_msgSend(v13, "_privateSourceTypeForExternalType:", v14));

}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDVerifiableClinicalRecordEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDVerifiableClinicalRecordEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

@end
