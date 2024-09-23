@implementation HKCoverageRecord

- (id)medicalRecordCodings
{
  void *v2;
  void *v3;

  -[HKCoverageRecord coverageTypeCodingCollection](self, "coverageTypeCodingCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "codings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultDisplayString
{
  void *v2;
  void *v3;

  HKHealthKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNSPECIFIED_COVERAGE"), &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Health-Records"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKCoverageRecord;
  objc_msgSendSuper2(&v6, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("status"));
  objc_msgSend(v3, "addObject:", CFSTR("coverageType"));
  objc_msgSend(v3, "addObject:", CFSTR("relationship"));
  +[HKCoverageClassification indexableKeyPathsWithPrefix:](HKCoverageClassification, "indexableKeyPathsWithPrefix:", CFSTR("classification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKCoverageRecord;
  objc_msgSendSuper2(&v3, sel_cachedConceptRelationshipKeyPaths);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  void *v17;
  void *v19;
  void *v20;
  objc_super v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v12 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("status")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("coverageType")))
    {
      -[HKCoverageRecord coverageTypeCodingCollection](self, "coverageTypeCodingCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v14;
      v15 = (void *)MEMORY[0x1E0C99D20];
      v16 = &v23;
LABEL_10:
      objc_msgSend(v15, "arrayWithObjects:count:", v16, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      goto LABEL_12;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("relationship")))
    {
      -[HKCoverageRecord relationshipCodingCollection](self, "relationshipCodingCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[HKCoverageRecord relationshipCodingCollection](self, "relationshipCodingCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v14;
        v15 = (void *)MEMORY[0x1E0C99D20];
        v16 = &v22;
        goto LABEL_10;
      }
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("classification")))
      {
        v21.receiver = self;
        v21.super_class = (Class)HKCoverageRecord;
        -[HKMedicalRecord codingsForKeyPath:error:](&v21, sel_codingsForKeyPath_error_, v6, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      -[HKCoverageRecord classification](self, "classification");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:error:](HKConceptIndexUtilities, "keyPathRemovingFirstComponentFromKeyPath:error:", v6, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[HKCoverageRecord classification](self, "classification");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "codingsForKeyPath:error:", v13, a4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = 0;
        }
        goto LABEL_11;
      }
    }
    v12 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_12;
  }
  -[HKCoverageRecord statusCoding](self, "statusCoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v12;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  unsigned __int8 v17;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_12;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("status")))
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCoverageRecord _setStatus:](self, "_setStatus:", v13);
LABEL_11:

      v17 = 1;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("coverageType")))
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCoverageRecord _setCoverageType:](self, "_setCoverageType:", v13);
      goto LABEL_11;
    }
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("relationship")))
  {
    v14 = objc_msgSend(v8, "count");
    -[HKCoverageRecord relationshipCodingCollection](self, "relationshipCodingCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HKIndexableObjectCheckCardinalityForIndexRestore(v14, v15 != 0, (uint64_t)v9, (uint64_t)a5);

    if (v16)
    {
      objc_msgSend(v8, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCoverageRecord _setRelationship:](self, "_setRelationship:", v13);
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("classification")))
  {
    +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:error:](HKConceptIndexUtilities, "keyPathRemovingFirstComponentFromKeyPath:error:", v9, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[HKCoverageRecord classification](self, "classification");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[HKCoverageRecord classification](self, "classification");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v21, "applyConcepts:forKeyPath:error:", v8, v19, a5);

      }
      else
      {
        v17 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 0, (uint64_t)v9, (uint64_t)a5);
      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)HKCoverageRecord;
    v17 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v22, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
  }
LABEL_13:

  return v17;
}

- (int64_t)recordCategoryType
{
  return 9;
}

+ (id)coverageRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 statusCoding:(id)a14 coverageTypeCodingCollection:(id)a15 subscriber:(id)a16 subscriberId:(id)a17 beneficiary:(id)a18 policyHolder:(id)a19 payor:(id)a20 relationshipCodingCollection:(id)a21 classification:(id)a22 network:(id)a23 periodStartDate:(id)a24 periodEndDate:(id)a25 subscriberIdentifier:(id)a26 beneficiaryIdentifier:(id)a27
{
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  __CFString *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _BOOL4 v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;

  v52 = a5;
  v65 = a3;
  v64 = a4;
  v31 = a6;
  v63 = a7;
  v62 = a8;
  v59 = a10;
  v58 = a11;
  v57 = a12;
  v61 = a14;
  v60 = a15;
  v56 = a16;
  v51 = a17;
  v55 = a18;
  v50 = a19;
  v54 = a20;
  v49 = a21;
  v32 = a22;
  v33 = a23;
  v34 = a24;
  v35 = a25;
  v48 = a26;
  v47 = a27;
  v36 = CFSTR("modifiedDate");
  v66 = v31;
  if (v34)
  {
    v37 = CFSTR("periodStartDate");

    objc_msgSend(v34, "dateForUTC");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = v37;
    if (!v35)
      goto LABEL_7;
  }
  else
  {
    v38 = v66;
    if (!v35)
    {
LABEL_7:
      v43 = v35;
      goto LABEL_8;
    }
  }
  objc_msgSend(v35, "dateForUTC");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "timeIntervalSinceNow");
  v41 = v40;

  if (v41 >= 0.0)
    goto LABEL_7;
  v42 = CFSTR("periodEndDate");

  v43 = v35;
  objc_msgSend(v35, "dateForUTC");
  v44 = objc_claimAutoreleasedReturnValue();

  v38 = (void *)v44;
  v36 = v42;
LABEL_8:
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", v36, v38);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKCoverageRecord coverageRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:coverageTypeCodingCollection:subscriber:subscriberId:beneficiary:policyHolder:payor:relationshipCodingCollection:classification:network:periodStartDate:periodEndDate:subscriberIdentifier:beneficiaryIdentifier:](HKCoverageRecord, "coverageRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:coverageTypeCodingCollection:subscriber:subscriberId:beneficiary:policyHolder:payor:relationshipCodingCollection:classification:network:periodStartDate:periodEndDate:subscriberIdentifier:beneficiaryIdentifier:", v65, v64, v52, v66, v63, v62, a9, v59, v58, v45, v57, a13, v61, v60, v56,
    v51,
    v55,
    v50,
    v54,
    v49,
    v32,
    v33,
    v34,
    v43,
    v48,
    v47);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

+ (id)coverageRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 coverageTypeCodingCollection:(id)a16 subscriber:(id)a17 subscriberId:(id)a18 beneficiary:(id)a19 policyHolder:(id)a20 payor:(id)a21 relationshipCodingCollection:(id)a22 classification:(id)a23 network:(id)a24 periodStartDate:(id)a25 periodEndDate:(id)a26 subscriberIdentifier:(id)a27 beneficiaryIdentifier:(id)a28
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newCoverageRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:statusCoding:coverageTypeCodingCollection:subscriber:subscriberId:beneficiary:policyHolder:payor:relationshipCodingCollection:classification:network:periodStartDate:periodEndDate:subscriberIdentifier:beneficiaryIdentifier:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
                                           a16,
                                           a17,
                                           a18,
                                           a19,
                                           a20,
                                           a21,
                                           a22,
                                           a23,
                                           a24,
                                           a25,
                                           a26,
                                           a27,
                                           a28,
                                           0));
}

+ (id)_newCoverageRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 statusCoding:(id)a15 coverageTypeCodingCollection:(id)a16 subscriber:(id)a17 subscriberId:(id)a18 beneficiary:(id)a19 policyHolder:(id)a20 payor:(id)a21 relationshipCodingCollection:(id)a22 classification:(id)a23 network:(id)a24 periodStartDate:(id)a25 periodEndDate:(id)a26 subscriberIdentifier:(id)a27 beneficiaryIdentifier:(id)a28 config:(id)a29
{
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _BOOL4 v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  objc_super v78;
  _QWORD aBlock[4];
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;

  v68 = a5;
  v76 = a15;
  v74 = a16;
  v72 = a17;
  v70 = a18;
  v29 = a19;
  v30 = a20;
  v31 = a21;
  v32 = a22;
  v33 = a23;
  v34 = a24;
  v35 = a25;
  v36 = a26;
  v37 = a27;
  v38 = a28;
  v39 = a29;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __390__HKCoverageRecord__newCoverageRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_statusCoding_coverageTypeCodingCollection_subscriber_subscriberId_beneficiary_policyHolder_payor_relationshipCodingCollection_classification_network_periodStartDate_periodEndDate_subscriberIdentifier_beneficiaryIdentifier_config___block_invoke;
  aBlock[3] = &unk_1E37F1F48;
  v80 = v76;
  v81 = v74;
  v82 = v72;
  v83 = v70;
  v84 = v29;
  v85 = v30;
  v86 = v31;
  v87 = v32;
  v88 = v33;
  v89 = v34;
  v90 = v35;
  v91 = v36;
  v92 = v37;
  v93 = v38;
  v94 = v39;
  v67 = v39;
  v66 = v38;
  v65 = v37;
  v64 = v36;
  v63 = v35;
  v62 = v34;
  v61 = v33;
  v60 = v32;
  v59 = v31;
  v58 = v30;
  v57 = v29;
  v71 = v70;
  v73 = v72;
  v75 = v74;
  v77 = v76;
  v40 = a13;
  v41 = a12;
  v42 = a11;
  v43 = a10;
  v44 = a8;
  v45 = a7;
  v46 = a6;
  v47 = a4;
  v48 = a3;
  v49 = _Block_copy(aBlock);
  v78.receiver = a1;
  v78.super_class = (Class)&OBJC_METACLASS___HKCoverageRecord;
  v69 = objc_msgSendSuper2(&v78, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v48, v47, v68, v46, v45, v44, a9, v43, v42, v41, v40, a14, v49);

  return v69;
}

void __390__HKCoverageRecord__newCoverageRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_statusCoding_coverageTypeCodingCollection_subscriber_subscriberId_beneficiary_policyHolder_payor_relationshipCodingCollection_classification_network_periodStartDate_periodEndDate_subscriberIdentifier_beneficiaryIdentifier_config___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD *v32;

  v32 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v32[22];
  v32[22] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v32[23];
  v32[23] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v32[24];
  v32[24] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v32[25];
  v32[25] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v32[26];
  v32[26] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v32[27];
  v32[27] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v16 = (void *)v32[28];
  v32[28] = v15;

  v17 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v18 = (void *)v32[29];
  v32[29] = v17;

  v19 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v20 = (void *)v32[30];
  v32[30] = v19;

  v21 = objc_msgSend(*(id *)(a1 + 104), "copy");
  v22 = (void *)v32[31];
  v32[31] = v21;

  v23 = objc_msgSend(*(id *)(a1 + 112), "copy");
  v24 = (void *)v32[32];
  v32[32] = v23;

  v25 = objc_msgSend(*(id *)(a1 + 120), "copy");
  v26 = (void *)v32[33];
  v32[33] = v25;

  v27 = objc_msgSend(*(id *)(a1 + 128), "copy");
  v28 = (void *)v32[34];
  v32[34] = v27;

  v29 = objc_msgSend(*(id *)(a1 + 136), "copy");
  v30 = (void *)v32[35];
  v32[35] = v29;

  v31 = *(_QWORD *)(a1 + 144);
  if (v31)
    (*(void (**)(uint64_t, _QWORD *))(v31 + 16))(v31, v32);

}

- (HKCoverageRecord)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)HKCoverageRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@statusCoding = %@coverageTypeCodingCollection = %@subscriber = %@subscriberId = %@beneficiary = %@policyHolder = %@payor = %@relationshipCodingCollection = %@classification = %@network = %@periodStartDate = %@periodEndDate = %@subscriberIdentifier = %@beneficiaryIdentifier = %@>"), v5, self, v6, self->_statusCoding, self->_coverageTypeCodingCollection, self->_subscriber, self->_subscriberId, self->_beneficiary, self->_policyHolder, self->_payor, self->_relationshipCodingCollection, self->_classification, self->_network, self->_periodStartDate, self->_periodEndDate, self->_subscriberIdentifier,
    self->_beneficiaryIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKCoverageRecord;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusCoding, CFSTR("StatusCoding"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_coverageTypeCodingCollection, CFSTR("CoverageTypeCodingCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subscriber, CFSTR("Subscriber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subscriberId, CFSTR("SubscriberId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_beneficiary, CFSTR("Beneficiary"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_policyHolder, CFSTR("PolicyHolder"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_payor, CFSTR("Payor"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_relationshipCodingCollection, CFSTR("RelationshipCodingCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_classification, CFSTR("Classification"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_network, CFSTR("Network"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_periodStartDate, CFSTR("PeriodStartDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_periodEndDate, CFSTR("PeriodEndDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_subscriberIdentifier, CFSTR("SubscriberIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_beneficiaryIdentifier, CFSTR("BeneficiaryIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_coverageType, CFSTR("CoverageType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_relationship, CFSTR("Relationship"));

}

- (HKCoverageRecord)initWithCoder:(id)a3
{
  id v4;
  HKCoverageRecord *v5;
  uint64_t v6;
  HKMedicalCoding *statusCoding;
  uint64_t v8;
  HKMedicalCodingCollection *coverageTypeCodingCollection;
  uint64_t v10;
  NSString *subscriber;
  uint64_t v12;
  NSString *subscriberId;
  uint64_t v14;
  NSString *beneficiary;
  uint64_t v16;
  NSString *policyHolder;
  void *v18;
  uint64_t v19;
  NSArray *payor;
  uint64_t v21;
  HKMedicalCodingCollection *relationshipCodingCollection;
  void *v23;
  uint64_t v24;
  NSArray *classification;
  uint64_t v26;
  NSString *network;
  uint64_t v28;
  HKMedicalDate *periodStartDate;
  uint64_t v30;
  HKMedicalDate *periodEndDate;
  uint64_t v32;
  HKFHIRIdentifierElement *subscriberIdentifier;
  uint64_t v34;
  HKFHIRIdentifierElement *beneficiaryIdentifier;
  uint64_t v36;
  HKConcept *status;
  uint64_t v38;
  HKConcept *coverageType;
  uint64_t v40;
  HKConcept *relationship;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)HKCoverageRecord;
  v5 = -[HKMedicalRecord initWithCoder:](&v43, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusCoding"));
    v6 = objc_claimAutoreleasedReturnValue();
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CoverageTypeCodingCollection"));
    v8 = objc_claimAutoreleasedReturnValue();
    coverageTypeCodingCollection = v5->_coverageTypeCodingCollection;
    v5->_coverageTypeCodingCollection = (HKMedicalCodingCollection *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Subscriber"));
    v10 = objc_claimAutoreleasedReturnValue();
    subscriber = v5->_subscriber;
    v5->_subscriber = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SubscriberId"));
    v12 = objc_claimAutoreleasedReturnValue();
    subscriberId = v5->_subscriberId;
    v5->_subscriberId = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Beneficiary"));
    v14 = objc_claimAutoreleasedReturnValue();
    beneficiary = v5->_beneficiary;
    v5->_beneficiary = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PolicyHolder"));
    v16 = objc_claimAutoreleasedReturnValue();
    policyHolder = v5->_policyHolder;
    v5->_policyHolder = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("Payor"));
    v19 = objc_claimAutoreleasedReturnValue();
    payor = v5->_payor;
    v5->_payor = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RelationshipCodingCollection"));
    v21 = objc_claimAutoreleasedReturnValue();
    relationshipCodingCollection = v5->_relationshipCodingCollection;
    v5->_relationshipCodingCollection = (HKMedicalCodingCollection *)v21;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("Classification"));
    v24 = objc_claimAutoreleasedReturnValue();
    classification = v5->_classification;
    v5->_classification = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Network"));
    v26 = objc_claimAutoreleasedReturnValue();
    network = v5->_network;
    v5->_network = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PeriodStartDate"));
    v28 = objc_claimAutoreleasedReturnValue();
    periodStartDate = v5->_periodStartDate;
    v5->_periodStartDate = (HKMedicalDate *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PeriodEndDate"));
    v30 = objc_claimAutoreleasedReturnValue();
    periodEndDate = v5->_periodEndDate;
    v5->_periodEndDate = (HKMedicalDate *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SubscriberIdentifier"));
    v32 = objc_claimAutoreleasedReturnValue();
    subscriberIdentifier = v5->_subscriberIdentifier;
    v5->_subscriberIdentifier = (HKFHIRIdentifierElement *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BeneficiaryIdentifier"));
    v34 = objc_claimAutoreleasedReturnValue();
    beneficiaryIdentifier = v5->_beneficiaryIdentifier;
    v5->_beneficiaryIdentifier = (HKFHIRIdentifierElement *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Status"));
    v36 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (HKConcept *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CoverageType"));
    v38 = objc_claimAutoreleasedReturnValue();
    coverageType = v5->_coverageType;
    v5->_coverageType = (HKConcept *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Relationship"));
    v40 = objc_claimAutoreleasedReturnValue();
    relationship = v5->_relationship;
    v5->_relationship = (HKConcept *)v40;

  }
  return v5;
}

+ (BOOL)supportsEquivalence
{
  return 1;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  char v110;
  objc_super v112;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v112.receiver = self;
    v112.super_class = (Class)HKCoverageRecord;
    if (!-[HKMedicalRecord isEquivalent:](&v112, sel_isEquivalent_, v5))
      goto LABEL_89;
    -[HKCoverageRecord statusCoding](self, "statusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusCoding");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "statusCoding");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_88;
      v10 = (void *)v9;
      -[HKCoverageRecord statusCoding](self, "statusCoding");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusCoding");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_89;
    }
    -[HKCoverageRecord coverageTypeCodingCollection](self, "coverageTypeCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coverageTypeCodingCollection");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

    }
    else
    {
      v8 = (void *)v15;
      objc_msgSend(v5, "coverageTypeCodingCollection");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_88;
      v17 = (void *)v16;
      -[HKCoverageRecord coverageTypeCodingCollection](self, "coverageTypeCodingCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coverageTypeCodingCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_89;
    }
    -[HKCoverageRecord subscriber](self, "subscriber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscriber");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v21)
    {

    }
    else
    {
      v8 = (void *)v21;
      objc_msgSend(v5, "subscriber");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_88;
      v23 = (void *)v22;
      -[HKCoverageRecord subscriber](self, "subscriber");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subscriber");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

      if (!v26)
        goto LABEL_89;
    }
    -[HKCoverageRecord subscriberId](self, "subscriberId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscriberId");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v27)
    {

    }
    else
    {
      v8 = (void *)v27;
      objc_msgSend(v5, "subscriberId");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_88;
      v29 = (void *)v28;
      -[HKCoverageRecord subscriberId](self, "subscriberId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subscriberId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToString:", v31);

      if (!v32)
        goto LABEL_89;
    }
    -[HKCoverageRecord beneficiary](self, "beneficiary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beneficiary");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v33)
    {

    }
    else
    {
      v8 = (void *)v33;
      objc_msgSend(v5, "beneficiary");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
        goto LABEL_88;
      v35 = (void *)v34;
      -[HKCoverageRecord beneficiary](self, "beneficiary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "beneficiary");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqualToString:", v37);

      if (!v38)
        goto LABEL_89;
    }
    -[HKCoverageRecord policyHolder](self, "policyHolder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "policyHolder");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v39)
    {

    }
    else
    {
      v8 = (void *)v39;
      objc_msgSend(v5, "policyHolder");
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_88;
      v41 = (void *)v40;
      -[HKCoverageRecord policyHolder](self, "policyHolder");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "policyHolder");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqualToString:", v43);

      if (!v44)
        goto LABEL_89;
    }
    -[HKCoverageRecord payor](self, "payor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payor");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v45)
    {

    }
    else
    {
      v8 = (void *)v45;
      objc_msgSend(v5, "payor");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_88;
      v47 = (void *)v46;
      -[HKCoverageRecord payor](self, "payor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "payor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqualToArray:", v49);

      if (!v50)
        goto LABEL_89;
    }
    -[HKCoverageRecord relationshipCodingCollection](self, "relationshipCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relationshipCodingCollection");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v51)
    {

    }
    else
    {
      v8 = (void *)v51;
      objc_msgSend(v5, "relationshipCodingCollection");
      v52 = objc_claimAutoreleasedReturnValue();
      if (!v52)
        goto LABEL_88;
      v53 = (void *)v52;
      -[HKCoverageRecord relationshipCodingCollection](self, "relationshipCodingCollection");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "relationshipCodingCollection");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v54, "isEqual:", v55);

      if (!v56)
        goto LABEL_89;
    }
    -[HKCoverageRecord classification](self, "classification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "classification");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v57)
    {

    }
    else
    {
      v8 = (void *)v57;
      objc_msgSend(v5, "classification");
      v58 = objc_claimAutoreleasedReturnValue();
      if (!v58)
        goto LABEL_88;
      v59 = (void *)v58;
      -[HKCoverageRecord classification](self, "classification");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "classification");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v60, "isEqualToArray:", v61);

      if (!v62)
        goto LABEL_89;
    }
    -[HKCoverageRecord network](self, "network");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "network");
    v63 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v63)
    {

    }
    else
    {
      v8 = (void *)v63;
      objc_msgSend(v5, "network");
      v64 = objc_claimAutoreleasedReturnValue();
      if (!v64)
        goto LABEL_88;
      v65 = (void *)v64;
      -[HKCoverageRecord network](self, "network");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "network");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v66, "isEqualToString:", v67);

      if (!v68)
        goto LABEL_89;
    }
    -[HKCoverageRecord periodStartDate](self, "periodStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "periodStartDate");
    v69 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v69)
    {

    }
    else
    {
      v8 = (void *)v69;
      objc_msgSend(v5, "periodStartDate");
      v70 = objc_claimAutoreleasedReturnValue();
      if (!v70)
        goto LABEL_88;
      v71 = (void *)v70;
      -[HKCoverageRecord periodStartDate](self, "periodStartDate");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "periodStartDate");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v72, "isEqual:", v73);

      if (!v74)
        goto LABEL_89;
    }
    -[HKCoverageRecord periodEndDate](self, "periodEndDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "periodEndDate");
    v75 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v75)
    {

    }
    else
    {
      v8 = (void *)v75;
      objc_msgSend(v5, "periodEndDate");
      v76 = objc_claimAutoreleasedReturnValue();
      if (!v76)
        goto LABEL_88;
      v77 = (void *)v76;
      -[HKCoverageRecord periodEndDate](self, "periodEndDate");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "periodEndDate");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v78, "isEqual:", v79);

      if (!v80)
        goto LABEL_89;
    }
    -[HKCoverageRecord subscriberIdentifier](self, "subscriberIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subscriberIdentifier");
    v81 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v81)
    {

    }
    else
    {
      v8 = (void *)v81;
      objc_msgSend(v5, "subscriberIdentifier");
      v82 = objc_claimAutoreleasedReturnValue();
      if (!v82)
        goto LABEL_88;
      v83 = (void *)v82;
      -[HKCoverageRecord subscriberIdentifier](self, "subscriberIdentifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "subscriberIdentifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v84, "isEqual:", v85);

      if (!v86)
        goto LABEL_89;
    }
    -[HKCoverageRecord beneficiaryIdentifier](self, "beneficiaryIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beneficiaryIdentifier");
    v87 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v87)
    {

    }
    else
    {
      v8 = (void *)v87;
      objc_msgSend(v5, "beneficiaryIdentifier");
      v88 = objc_claimAutoreleasedReturnValue();
      if (!v88)
        goto LABEL_88;
      v89 = (void *)v88;
      -[HKCoverageRecord beneficiaryIdentifier](self, "beneficiaryIdentifier");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "beneficiaryIdentifier");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v90, "isEqual:", v91);

      if (!v92)
        goto LABEL_89;
    }
    -[HKCoverageRecord status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "status");
    v93 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v93)
    {

    }
    else
    {
      v8 = (void *)v93;
      objc_msgSend(v5, "status");
      v94 = objc_claimAutoreleasedReturnValue();
      if (!v94)
        goto LABEL_88;
      v95 = (void *)v94;
      -[HKCoverageRecord status](self, "status");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "status");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v96, "isEqual:", v97);

      if (!v98)
        goto LABEL_89;
    }
    -[HKCoverageRecord coverageType](self, "coverageType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coverageType");
    v99 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v99)
    {

    }
    else
    {
      v8 = (void *)v99;
      objc_msgSend(v5, "coverageType");
      v100 = objc_claimAutoreleasedReturnValue();
      if (!v100)
        goto LABEL_88;
      v101 = (void *)v100;
      -[HKCoverageRecord coverageType](self, "coverageType");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "coverageType");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = objc_msgSend(v102, "isEqual:", v103);

      if (!v104)
        goto LABEL_89;
    }
    -[HKCoverageRecord relationship](self, "relationship");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relationship");
    v105 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v105)
    {

LABEL_93:
      v14 = 1;
      goto LABEL_90;
    }
    v8 = (void *)v105;
    objc_msgSend(v5, "relationship");
    v106 = objc_claimAutoreleasedReturnValue();
    if (v106)
    {
      v107 = (void *)v106;
      -[HKCoverageRecord relationship](self, "relationship");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "relationship");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = objc_msgSend(v108, "isEqual:", v109);

      if ((v110 & 1) != 0)
        goto LABEL_93;
LABEL_89:
      v14 = 0;
LABEL_90:

      goto LABEL_91;
    }
LABEL_88:

    goto LABEL_89;
  }
  v14 = 0;
LABEL_91:

  return v14;
}

- (id)statusCodingCollection
{
  void *v2;
  void *v3;

  -[HKCoverageRecord statusCoding](self, "statusCoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HKMedicalCoding)statusCoding
{
  return self->_statusCoding;
}

- (void)_setStatusCoding:(id)a3
{
  HKMedicalCoding *v4;
  HKMedicalCoding *statusCoding;
  HKConcept *v6;
  HKConcept *status;
  id v8;

  v4 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  statusCoding = self->_statusCoding;
  self->_statusCoding = v4;

  -[HKCoverageRecord statusCodingCollection](self, "statusCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  self->_status = v6;

}

- (HKMedicalCodingCollection)coverageTypeCodingCollection
{
  return self->_coverageTypeCodingCollection;
}

- (void)_setCoverageTypeCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *coverageTypeCodingCollection;
  HKConcept *v6;
  HKConcept *coverageType;
  id v8;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  coverageTypeCodingCollection = self->_coverageTypeCodingCollection;
  self->_coverageTypeCodingCollection = v4;

  -[HKCoverageRecord coverageTypeCodingCollection](self, "coverageTypeCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  coverageType = self->_coverageType;
  self->_coverageType = v6;

}

- (NSString)subscriber
{
  return self->_subscriber;
}

- (void)_setSubscriber:(id)a3
{
  NSString *v4;
  NSString *subscriber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subscriber = self->_subscriber;
  self->_subscriber = v4;

}

- (NSString)subscriberId
{
  return self->_subscriberId;
}

- (void)_setSubscriberId:(id)a3
{
  NSString *v4;
  NSString *subscriberId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  subscriberId = self->_subscriberId;
  self->_subscriberId = v4;

}

- (NSString)beneficiary
{
  return self->_beneficiary;
}

- (void)_setBeneficiary:(id)a3
{
  NSString *v4;
  NSString *beneficiary;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  beneficiary = self->_beneficiary;
  self->_beneficiary = v4;

}

- (NSString)policyHolder
{
  return self->_policyHolder;
}

- (void)_setPolicyHolder:(id)a3
{
  NSString *v4;
  NSString *policyHolder;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  policyHolder = self->_policyHolder;
  self->_policyHolder = v4;

}

- (NSArray)payor
{
  return self->_payor;
}

- (void)_setPayor:(id)a3
{
  NSArray *v4;
  NSArray *payor;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  payor = self->_payor;
  self->_payor = v4;

}

- (HKMedicalCodingCollection)relationshipCodingCollection
{
  return self->_relationshipCodingCollection;
}

- (void)_setRelationshipCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *relationshipCodingCollection;
  HKConcept *v6;
  HKConcept *relationship;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  relationshipCodingCollection = self->_relationshipCodingCollection;
  self->_relationshipCodingCollection = v4;

  if (self->_relationshipCodingCollection)
  {
    -[HKCoverageRecord relationshipCodingCollection](self, "relationshipCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    relationship = self->_relationship;
    self->_relationship = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_relationship;
    self->_relationship = 0;
  }

}

- (NSArray)classification
{
  return self->_classification;
}

- (void)_setClassification:(id)a3
{
  NSArray *v4;
  NSArray *classification;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  classification = self->_classification;
  self->_classification = v4;

}

- (NSString)network
{
  return self->_network;
}

- (void)_setNetwork:(id)a3
{
  NSString *v4;
  NSString *network;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  network = self->_network;
  self->_network = v4;

}

- (HKMedicalDate)periodStartDate
{
  return self->_periodStartDate;
}

- (void)_setPeriodStartDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *periodStartDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  periodStartDate = self->_periodStartDate;
  self->_periodStartDate = v4;

}

- (HKMedicalDate)periodEndDate
{
  return self->_periodEndDate;
}

- (void)_setPeriodEndDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *periodEndDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  periodEndDate = self->_periodEndDate;
  self->_periodEndDate = v4;

}

- (HKFHIRIdentifierElement)subscriberIdentifier
{
  return self->_subscriberIdentifier;
}

- (void)_setSubscriberIdentifier:(id)a3
{
  HKFHIRIdentifierElement *v4;
  HKFHIRIdentifierElement *subscriberIdentifier;

  v4 = (HKFHIRIdentifierElement *)objc_msgSend(a3, "copy");
  subscriberIdentifier = self->_subscriberIdentifier;
  self->_subscriberIdentifier = v4;

}

- (HKFHIRIdentifierElement)beneficiaryIdentifier
{
  return self->_beneficiaryIdentifier;
}

- (void)_setBeneficiaryIdentifier:(id)a3
{
  HKFHIRIdentifierElement *v4;
  HKFHIRIdentifierElement *beneficiaryIdentifier;

  v4 = (HKFHIRIdentifierElement *)objc_msgSend(a3, "copy");
  beneficiaryIdentifier = self->_beneficiaryIdentifier;
  self->_beneficiaryIdentifier = v4;

}

- (HKConcept)status
{
  HKConcept *status;
  HKConcept *v3;
  void *v4;

  status = self->_status;
  if (status)
  {
    v3 = status;
  }
  else
  {
    -[HKCoverageRecord statusCodingCollection](self, "statusCodingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setStatus:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HKConcept *v13;
  HKConcept *status;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKCoverageRecord _setStatus:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  status = self->_status;
  self->_status = v13;

}

- (HKConcept)coverageType
{
  HKConcept *coverageType;
  HKConcept *v3;
  void *v4;

  coverageType = self->_coverageType;
  if (coverageType)
  {
    v3 = coverageType;
  }
  else
  {
    -[HKCoverageRecord coverageTypeCodingCollection](self, "coverageTypeCodingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setCoverageType:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HKConcept *v13;
  HKConcept *coverageType;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKCoverageRecord _setCoverageType:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  coverageType = self->_coverageType;
  self->_coverageType = v13;

}

- (HKConcept)relationship
{
  HKConcept *relationship;
  HKConcept *v3;
  void *v4;

  if (self->_relationshipCodingCollection)
  {
    relationship = self->_relationship;
    if (relationship)
    {
      v3 = relationship;
    }
    else
    {
      -[HKCoverageRecord relationshipCodingCollection](self, "relationshipCodingCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
      v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_setRelationship:(id)a3
{
  HKConcept *v4;
  HKConcept *relationship;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  relationship = self->_relationship;
  self->_relationship = v4;

}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKCoverageRecord;
  -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_11:
    v8 = v7;
    goto LABEL_12;
  }
  if (!self->_statusCoding)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: statusCoding must not be nil");
LABEL_10:
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11, self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!self->_coverageTypeCodingCollection)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: coverageTypeCodingCollection must not be nil");
    goto LABEL_10;
  }
  if (!self->_subscriberId)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: subscriberId must not be nil");
    goto LABEL_10;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationship, 0);
  objc_storeStrong((id *)&self->_coverageType, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_beneficiaryIdentifier, 0);
  objc_storeStrong((id *)&self->_subscriberIdentifier, 0);
  objc_storeStrong((id *)&self->_periodEndDate, 0);
  objc_storeStrong((id *)&self->_periodStartDate, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->_relationshipCodingCollection, 0);
  objc_storeStrong((id *)&self->_payor, 0);
  objc_storeStrong((id *)&self->_policyHolder, 0);
  objc_storeStrong((id *)&self->_beneficiary, 0);
  objc_storeStrong((id *)&self->_subscriberId, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_coverageTypeCodingCollection, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
}

- (void)_setStatus:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property status for record type HKCoverageRecord.", a5, a6, a7, a8, 0);
}

- (void)_setCoverageType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property coverageType for record type HKCoverageRecord.", a5, a6, a7, a8, 0);
}

@end
