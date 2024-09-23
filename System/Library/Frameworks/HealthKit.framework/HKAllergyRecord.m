@implementation HKAllergyRecord

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

- (id)medicalRecordCodings
{
  void *v2;
  void *v3;

  -[HKAllergyRecord allergyCodingCollection](self, "allergyCodingCollection");
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNSPECIFIED_ALLERGY"), &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Health-Records"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allergyRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 allergyCodingCollection:(id)a14 onsetDate:(id)a15 asserter:(id)a16 reactions:(id)a17 criticalityCoding:(id)a18 lastOccurrenceDate:(id)a19 recordedDate:(id)a20 verificationStatusCoding:(id)a21 clinicalStatusCoding:(id)a22 allergyTypeCoding:(id)a23 categoryCoding:(id)a24
{
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  __CFString *v33;
  id v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  uint64_t v40;
  __CFString *v41;
  uint64_t v42;
  void *v43;
  id v45;
  id v46;
  id v47;
  id v48;
  _BOOL4 v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;

  v49 = a5;
  v59 = a3;
  v58 = a4;
  v28 = a6;
  v57 = a7;
  v51 = a8;
  v55 = a10;
  v56 = a11;
  v54 = a12;
  v53 = a14;
  v60 = a15;
  v52 = a16;
  v48 = a17;
  v29 = a18;
  v30 = a19;
  v31 = a20;
  v47 = a21;
  v46 = a22;
  v32 = a23;
  v45 = a24;
  v33 = CFSTR("modifiedDate");
  v34 = v28;
  v35 = v34;
  if (v30)
  {
    v36 = CFSTR("lastOccurrenceDate");

    v37 = v30;
    objc_msgSend(v30, "dateForUTC");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v36;
  }
  else
  {
    v37 = 0;
    v38 = v34;
  }
  if (v60)
  {
    v39 = CFSTR("onsetDate");

    objc_msgSend(v60, "dateForUTC");
    v40 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v40;
    v33 = v39;
  }
  if (v31)
  {
    v41 = CFSTR("recordedDate");

    objc_msgSend(v31, "dateForUTC");
    v42 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v42;
    v33 = v41;
  }
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", v33, v38);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAllergyRecord allergyRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:allergyCodingCollection:onsetDate:asserter:reactions:criticalityCoding:lastOccurrenceDate:recordedDate:verificationStatusCoding:clinicalStatusCoding:allergyTypeCoding:categoryCoding:](HKAllergyRecord, "allergyRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:allergyCodingCollection:onsetDate:asserter:reactions:criticalityCoding:lastOccurrenceDate:recordedDate:verificationStatusCoding:clinicalStatusCoding:allergyTypeCoding:categoryCoding:", v59, v58, v49, v35, v57, v51, a9, v55, v56, v43, v54, a13, v53, v60, v52,
    v48,
    v29,
    v37,
    v31,
    v47,
    v46,
    v32,
    v45);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___HKAllergyRecord;
  objc_msgSendSuper2(&v6, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("allergy"));
  +[HKAllergyReaction indexableKeyPathsWithPrefix:](HKAllergyReaction, "indexableKeyPathsWithPrefix:", CFSTR("reactions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  objc_msgSend(v3, "addObject:", CFSTR("criticality"));
  objc_msgSend(v3, "addObject:", CFSTR("verificationStatus"));
  objc_msgSend(v3, "addObject:", CFSTR("clinicalStatus"));
  objc_msgSend(v3, "addObject:", CFSTR("allergyType"));
  objc_msgSend(v3, "addObject:", CFSTR("category"));
  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKAllergyRecord;
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
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v11 = 0;
    goto LABEL_28;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("allergy")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("reactions")))
    {
      -[HKAllergyRecord reactions](self, "reactions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:error:](HKConceptIndexUtilities, "keyPathRemovingFirstComponentFromKeyPath:error:", v6, a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[HKAllergyRecord reactions](self, "reactions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "codingsForKeyPath:error:", v9, a4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = 0;
        }
        goto LABEL_4;
      }
LABEL_27:
      v11 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_28;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("criticality")))
    {
      -[HKAllergyRecord criticalityCoding](self, "criticalityCoding");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_27;
      -[HKAllergyRecord criticalityCoding](self, "criticalityCoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v17;
      v18 = (void *)MEMORY[0x1E0C99D20];
      v19 = &v30;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("verificationStatus")))
    {
      -[HKAllergyRecord verificationStatusCoding](self, "verificationStatusCoding");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_27;
      -[HKAllergyRecord verificationStatusCoding](self, "verificationStatusCoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v17;
      v18 = (void *)MEMORY[0x1E0C99D20];
      v19 = &v29;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("clinicalStatus")))
    {
      -[HKAllergyRecord clinicalStatusCoding](self, "clinicalStatusCoding");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_27;
      -[HKAllergyRecord clinicalStatusCoding](self, "clinicalStatusCoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v17;
      v18 = (void *)MEMORY[0x1E0C99D20];
      v19 = &v28;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("allergyType")))
    {
      -[HKAllergyRecord allergyTypeCoding](self, "allergyTypeCoding");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_27;
      -[HKAllergyRecord allergyTypeCoding](self, "allergyTypeCoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v17;
      v18 = (void *)MEMORY[0x1E0C99D20];
      v19 = &v27;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("category")))
      {
        v25.receiver = self;
        v25.super_class = (Class)HKAllergyRecord;
        -[HKMedicalRecord codingsForKeyPath:error:](&v25, sel_codingsForKeyPath_error_, v6, a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
      -[HKAllergyRecord categoryCoding](self, "categoryCoding");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_27;
      -[HKAllergyRecord categoryCoding](self, "categoryCoding");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v17;
      v18 = (void *)MEMORY[0x1E0C99D20];
      v19 = &v26;
    }
    objc_msgSend(v18, "arrayWithObjects:count:", v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  -[HKAllergyRecord allergyCodingCollection](self, "allergyCodingCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
LABEL_28:

  return v11;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v29;
  uint64_t v30;
  void *v31;
  _BOOL4 v32;
  objc_super v34;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_28;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("allergy")))
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKAllergyRecord _setAllergy:](self, "_setAllergy:", v13);
LABEL_5:

      v14 = 1;
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("reactions")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("criticality")))
    {
      v18 = objc_msgSend(v8, "count");
      -[HKAllergyRecord criticalityCoding](self, "criticalityCoding");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = HKIndexableObjectCheckCardinalityForIndexRestore(v18, v19 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v20)
      {
        objc_msgSend(v8, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "object");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAllergyRecord _setCriticality:](self, "_setCriticality:", v13);
        goto LABEL_5;
      }
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("verificationStatus")))
    {
      v21 = objc_msgSend(v8, "count");
      -[HKAllergyRecord verificationStatusCoding](self, "verificationStatusCoding");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = HKIndexableObjectCheckCardinalityForIndexRestore(v21, v22 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v23)
      {
        objc_msgSend(v8, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "object");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAllergyRecord _setVerificationStatus:](self, "_setVerificationStatus:", v13);
        goto LABEL_5;
      }
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("clinicalStatus")))
    {
      v24 = objc_msgSend(v8, "count");
      -[HKAllergyRecord clinicalStatusCoding](self, "clinicalStatusCoding");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = HKIndexableObjectCheckCardinalityForIndexRestore(v24, v25 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v26)
      {
        objc_msgSend(v8, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "object");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAllergyRecord _setClinicalStatus:](self, "_setClinicalStatus:", v13);
        goto LABEL_5;
      }
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("allergyType")))
    {
      v27 = objc_msgSend(v8, "count");
      -[HKAllergyRecord allergyTypeCoding](self, "allergyTypeCoding");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = HKIndexableObjectCheckCardinalityForIndexRestore(v27, v28 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v29)
      {
        objc_msgSend(v8, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "object");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAllergyRecord _setAllergyType:](self, "_setAllergyType:", v13);
        goto LABEL_5;
      }
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("category")))
      {
        v34.receiver = self;
        v34.super_class = (Class)HKAllergyRecord;
        v14 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v34, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
        goto LABEL_29;
      }
      v30 = objc_msgSend(v8, "count");
      -[HKAllergyRecord categoryCoding](self, "categoryCoding");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = HKIndexableObjectCheckCardinalityForIndexRestore(v30, v31 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v32)
      {
        objc_msgSend(v8, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "object");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAllergyRecord _setCategory:](self, "_setCategory:", v13);
        goto LABEL_5;
      }
    }
LABEL_28:
    v14 = 0;
    goto LABEL_29;
  }
  +[HKConceptIndexUtilities keyPathRemovingFirstComponentFromKeyPath:error:](HKConceptIndexUtilities, "keyPathRemovingFirstComponentFromKeyPath:error:", v9, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HKAllergyRecord reactions](self, "reactions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[HKAllergyRecord reactions](self, "reactions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v17, "applyConcepts:forKeyPath:error:", v8, v15, a5);

    }
    else
    {
      v14 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 0, (uint64_t)v9, (uint64_t)a5);
    }
  }
  else
  {
    v14 = 0;
  }

LABEL_29:
  return v14;
}

- (int64_t)recordCategoryType
{
  return 7;
}

+ (id)allergyRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 allergyCodingCollection:(id)a15 onsetDate:(id)a16 asserter:(id)a17 reactions:(id)a18 criticalityCoding:(id)a19 lastOccurrenceDate:(id)a20 recordedDate:(id)a21 verificationStatusCoding:(id)a22 clinicalStatusCoding:(id)a23 allergyTypeCoding:(id)a24 categoryCoding:(id)a25
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newAllergyRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:allergyCodingCollection:onsetDate:asserter:reactions:criticalityCoding:lastOccurrenceDate:recordedDate:verificationStatusCoding:clinicalStatusCoding:allergyTypeCoding:categoryCoding:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
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
                                           0));
}

+ (id)_newAllergyRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 allergyCodingCollection:(id)a15 onsetDate:(id)a16 asserter:(id)a17 reactions:(id)a18 criticalityCoding:(id)a19 lastOccurrenceDate:(id)a20 recordedDate:(id)a21 verificationStatusCoding:(id)a22 clinicalStatusCoding:(id)a23 allergyTypeCoding:(id)a24 categoryCoding:(id)a25 config:(id)a26
{
  id v26;
  id v27;
  id v28;
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
  void *v43;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  _BOOL4 v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  objc_super v69;
  _QWORD aBlock[4];
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;

  v63 = a5;
  v67 = a15;
  v51 = a16;
  v53 = a17;
  v55 = a18;
  v26 = a19;
  v27 = a20;
  v28 = a21;
  v29 = a22;
  v30 = a23;
  v31 = a24;
  v32 = a25;
  v33 = a26;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __348__HKAllergyRecord__newAllergyRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_allergyCodingCollection_onsetDate_asserter_reactions_criticalityCoding_lastOccurrenceDate_recordedDate_verificationStatusCoding_clinicalStatusCoding_allergyTypeCoding_categoryCoding_config___block_invoke;
  aBlock[3] = &unk_1E37F7820;
  v71 = v67;
  v72 = v51;
  v73 = v53;
  v74 = v55;
  v75 = v26;
  v76 = v27;
  v77 = v28;
  v78 = v29;
  v79 = v30;
  v80 = v31;
  v81 = v32;
  v82 = v33;
  v66 = v33;
  v65 = v32;
  v62 = v31;
  v61 = v30;
  v60 = v29;
  v59 = v28;
  v58 = v27;
  v57 = v26;
  v56 = v55;
  v54 = v53;
  v52 = v51;
  v68 = v67;
  v34 = a13;
  v35 = a12;
  v36 = a11;
  v37 = a10;
  v38 = a8;
  v39 = a7;
  v40 = a6;
  v41 = a4;
  v42 = a3;
  v43 = _Block_copy(aBlock);
  v69.receiver = a1;
  v69.super_class = (Class)&OBJC_METACLASS___HKAllergyRecord;
  v64 = objc_msgSendSuper2(&v69, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v42, v41, v63, v40, v39, v38, a9, v37, v36, v35, v34, a14, v43);

  return v64;
}

void __348__HKAllergyRecord__newAllergyRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_allergyCodingCollection_onsetDate_asserter_reactions_criticalityCoding_lastOccurrenceDate_recordedDate_verificationStatusCoding_clinicalStatusCoding_allergyTypeCoding_categoryCoding_config___block_invoke(uint64_t a1, void *a2)
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
  _QWORD *v26;

  v26 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v26[22];
  v26[22] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v26[23];
  v26[23] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v26[24];
  v26[24] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v26[25];
  v26[25] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v26[26];
  v26[26] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v26[27];
  v26[27] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v16 = (void *)v26[28];
  v26[28] = v15;

  v17 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v18 = (void *)v26[29];
  v26[29] = v17;

  v19 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v20 = (void *)v26[30];
  v26[30] = v19;

  v21 = objc_msgSend(*(id *)(a1 + 104), "copy");
  v22 = (void *)v26[31];
  v26[31] = v21;

  v23 = objc_msgSend(*(id *)(a1 + 112), "copy");
  v24 = (void *)v26[32];
  v26[32] = v23;

  v25 = *(_QWORD *)(a1 + 120);
  if (v25)
    (*(void (**)(uint64_t, _QWORD *))(v25 + 16))(v25, v26);

}

- (HKAllergyRecord)init
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
  v9.super_class = (Class)HKAllergyRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@allergyCodingCollection = %@onsetDate = %@asserter = %@reactions = %@criticalityCoding = %@lastOccurrenceDate = %@recordedDate = %@verificationStatusCoding = %@clinicalStatusCoding = %@allergyTypeCoding = %@categoryCoding = %@>"), v5, self, v6, self->_allergyCodingCollection, self->_onsetDate, self->_asserter, self->_reactions, self->_criticalityCoding, self->_lastOccurrenceDate, self->_recordedDate, self->_verificationStatusCoding, self->_clinicalStatusCoding, self->_allergyTypeCoding, self->_categoryCoding);
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
  v5.super_class = (Class)HKAllergyRecord;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_allergyCodingCollection, CFSTR("AllergyCodingCollection"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_onsetDate, CFSTR("OnsetDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_asserter, CFSTR("Asserter"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reactions, CFSTR("Reactions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_criticalityCoding, CFSTR("CriticalityCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastOccurrenceDate, CFSTR("LastOccurrenceDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_recordedDate, CFSTR("RecordedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_verificationStatusCoding, CFSTR("VerificationStatusCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clinicalStatusCoding, CFSTR("ClinicalStatusCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_allergyTypeCoding, CFSTR("AllergyTypeCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_categoryCoding, CFSTR("CategoryCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_allergy, CFSTR("Allergy"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_criticality, CFSTR("Criticality"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_verificationStatus, CFSTR("VerificationStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clinicalStatus, CFSTR("ClinicalStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_allergyType, CFSTR("AllergyType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_category, CFSTR("Category"));

}

- (HKAllergyRecord)initWithCoder:(id)a3
{
  id v4;
  HKAllergyRecord *v5;
  uint64_t v6;
  HKMedicalCodingCollection *allergyCodingCollection;
  uint64_t v8;
  HKMedicalDate *onsetDate;
  uint64_t v10;
  NSString *asserter;
  void *v12;
  uint64_t v13;
  NSArray *reactions;
  uint64_t v15;
  HKMedicalCoding *criticalityCoding;
  uint64_t v17;
  HKMedicalDate *lastOccurrenceDate;
  uint64_t v19;
  HKMedicalDate *recordedDate;
  uint64_t v21;
  HKMedicalCoding *verificationStatusCoding;
  uint64_t v23;
  HKMedicalCoding *clinicalStatusCoding;
  uint64_t v25;
  HKMedicalCoding *allergyTypeCoding;
  uint64_t v27;
  HKMedicalCoding *categoryCoding;
  uint64_t v29;
  HKConcept *allergy;
  uint64_t v31;
  HKConcept *criticality;
  uint64_t v33;
  HKConcept *verificationStatus;
  uint64_t v35;
  HKConcept *clinicalStatus;
  uint64_t v37;
  HKConcept *allergyType;
  uint64_t v39;
  HKConcept *category;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)HKAllergyRecord;
  v5 = -[HKMedicalRecord initWithCoder:](&v42, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AllergyCodingCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    allergyCodingCollection = v5->_allergyCodingCollection;
    v5->_allergyCodingCollection = (HKMedicalCodingCollection *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OnsetDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    onsetDate = v5->_onsetDate;
    v5->_onsetDate = (HKMedicalDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Asserter"));
    v10 = objc_claimAutoreleasedReturnValue();
    asserter = v5->_asserter;
    v5->_asserter = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("Reactions"));
    v13 = objc_claimAutoreleasedReturnValue();
    reactions = v5->_reactions;
    v5->_reactions = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CriticalityCoding"));
    v15 = objc_claimAutoreleasedReturnValue();
    criticalityCoding = v5->_criticalityCoding;
    v5->_criticalityCoding = (HKMedicalCoding *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastOccurrenceDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    lastOccurrenceDate = v5->_lastOccurrenceDate;
    v5->_lastOccurrenceDate = (HKMedicalDate *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecordedDate"));
    v19 = objc_claimAutoreleasedReturnValue();
    recordedDate = v5->_recordedDate;
    v5->_recordedDate = (HKMedicalDate *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VerificationStatusCoding"));
    v21 = objc_claimAutoreleasedReturnValue();
    verificationStatusCoding = v5->_verificationStatusCoding;
    v5->_verificationStatusCoding = (HKMedicalCoding *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClinicalStatusCoding"));
    v23 = objc_claimAutoreleasedReturnValue();
    clinicalStatusCoding = v5->_clinicalStatusCoding;
    v5->_clinicalStatusCoding = (HKMedicalCoding *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AllergyTypeCoding"));
    v25 = objc_claimAutoreleasedReturnValue();
    allergyTypeCoding = v5->_allergyTypeCoding;
    v5->_allergyTypeCoding = (HKMedicalCoding *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CategoryCoding"));
    v27 = objc_claimAutoreleasedReturnValue();
    categoryCoding = v5->_categoryCoding;
    v5->_categoryCoding = (HKMedicalCoding *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Allergy"));
    v29 = objc_claimAutoreleasedReturnValue();
    allergy = v5->_allergy;
    v5->_allergy = (HKConcept *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Criticality"));
    v31 = objc_claimAutoreleasedReturnValue();
    criticality = v5->_criticality;
    v5->_criticality = (HKConcept *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VerificationStatus"));
    v33 = objc_claimAutoreleasedReturnValue();
    verificationStatus = v5->_verificationStatus;
    v5->_verificationStatus = (HKConcept *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClinicalStatus"));
    v35 = objc_claimAutoreleasedReturnValue();
    clinicalStatus = v5->_clinicalStatus;
    v5->_clinicalStatus = (HKConcept *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AllergyType"));
    v37 = objc_claimAutoreleasedReturnValue();
    allergyType = v5->_allergyType;
    v5->_allergyType = (HKConcept *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Category"));
    v39 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (HKConcept *)v39;

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
    v112.super_class = (Class)HKAllergyRecord;
    if (!-[HKMedicalRecord isEquivalent:](&v112, sel_isEquivalent_, v5))
      goto LABEL_89;
    -[HKAllergyRecord allergyCodingCollection](self, "allergyCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allergyCodingCollection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "allergyCodingCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_88;
      v10 = (void *)v9;
      -[HKAllergyRecord allergyCodingCollection](self, "allergyCodingCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allergyCodingCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_89;
    }
    -[HKAllergyRecord onsetDate](self, "onsetDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "onsetDate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

    }
    else
    {
      v8 = (void *)v15;
      objc_msgSend(v5, "onsetDate");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_88;
      v17 = (void *)v16;
      -[HKAllergyRecord onsetDate](self, "onsetDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "onsetDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_89;
    }
    -[HKAllergyRecord asserter](self, "asserter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asserter");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v21)
    {

    }
    else
    {
      v8 = (void *)v21;
      objc_msgSend(v5, "asserter");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_88;
      v23 = (void *)v22;
      -[HKAllergyRecord asserter](self, "asserter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "asserter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

      if (!v26)
        goto LABEL_89;
    }
    -[HKAllergyRecord reactions](self, "reactions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reactions");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v27)
    {

    }
    else
    {
      v8 = (void *)v27;
      objc_msgSend(v5, "reactions");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_88;
      v29 = (void *)v28;
      -[HKAllergyRecord reactions](self, "reactions");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reactions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToArray:", v31);

      if (!v32)
        goto LABEL_89;
    }
    -[HKAllergyRecord criticalityCoding](self, "criticalityCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "criticalityCoding");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v33)
    {

    }
    else
    {
      v8 = (void *)v33;
      objc_msgSend(v5, "criticalityCoding");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
        goto LABEL_88;
      v35 = (void *)v34;
      -[HKAllergyRecord criticalityCoding](self, "criticalityCoding");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "criticalityCoding");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_89;
    }
    -[HKAllergyRecord lastOccurrenceDate](self, "lastOccurrenceDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastOccurrenceDate");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v39)
    {

    }
    else
    {
      v8 = (void *)v39;
      objc_msgSend(v5, "lastOccurrenceDate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_88;
      v41 = (void *)v40;
      -[HKAllergyRecord lastOccurrenceDate](self, "lastOccurrenceDate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastOccurrenceDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
        goto LABEL_89;
    }
    -[HKAllergyRecord recordedDate](self, "recordedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordedDate");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v45)
    {

    }
    else
    {
      v8 = (void *)v45;
      objc_msgSend(v5, "recordedDate");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_88;
      v47 = (void *)v46;
      -[HKAllergyRecord recordedDate](self, "recordedDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordedDate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqual:", v49);

      if (!v50)
        goto LABEL_89;
    }
    -[HKAllergyRecord verificationStatusCoding](self, "verificationStatusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "verificationStatusCoding");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v51)
    {

    }
    else
    {
      v8 = (void *)v51;
      objc_msgSend(v5, "verificationStatusCoding");
      v52 = objc_claimAutoreleasedReturnValue();
      if (!v52)
        goto LABEL_88;
      v53 = (void *)v52;
      -[HKAllergyRecord verificationStatusCoding](self, "verificationStatusCoding");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "verificationStatusCoding");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v54, "isEqual:", v55);

      if (!v56)
        goto LABEL_89;
    }
    -[HKAllergyRecord clinicalStatusCoding](self, "clinicalStatusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clinicalStatusCoding");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v57)
    {

    }
    else
    {
      v8 = (void *)v57;
      objc_msgSend(v5, "clinicalStatusCoding");
      v58 = objc_claimAutoreleasedReturnValue();
      if (!v58)
        goto LABEL_88;
      v59 = (void *)v58;
      -[HKAllergyRecord clinicalStatusCoding](self, "clinicalStatusCoding");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clinicalStatusCoding");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v60, "isEqual:", v61);

      if (!v62)
        goto LABEL_89;
    }
    -[HKAllergyRecord allergyTypeCoding](self, "allergyTypeCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allergyTypeCoding");
    v63 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v63)
    {

    }
    else
    {
      v8 = (void *)v63;
      objc_msgSend(v5, "allergyTypeCoding");
      v64 = objc_claimAutoreleasedReturnValue();
      if (!v64)
        goto LABEL_88;
      v65 = (void *)v64;
      -[HKAllergyRecord allergyTypeCoding](self, "allergyTypeCoding");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allergyTypeCoding");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v66, "isEqual:", v67);

      if (!v68)
        goto LABEL_89;
    }
    -[HKAllergyRecord categoryCoding](self, "categoryCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoryCoding");
    v69 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v69)
    {

    }
    else
    {
      v8 = (void *)v69;
      objc_msgSend(v5, "categoryCoding");
      v70 = objc_claimAutoreleasedReturnValue();
      if (!v70)
        goto LABEL_88;
      v71 = (void *)v70;
      -[HKAllergyRecord categoryCoding](self, "categoryCoding");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categoryCoding");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v72, "isEqual:", v73);

      if (!v74)
        goto LABEL_89;
    }
    -[HKAllergyRecord allergy](self, "allergy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allergy");
    v75 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v75)
    {

    }
    else
    {
      v8 = (void *)v75;
      objc_msgSend(v5, "allergy");
      v76 = objc_claimAutoreleasedReturnValue();
      if (!v76)
        goto LABEL_88;
      v77 = (void *)v76;
      -[HKAllergyRecord allergy](self, "allergy");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allergy");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v78, "isEqual:", v79);

      if (!v80)
        goto LABEL_89;
    }
    -[HKAllergyRecord criticality](self, "criticality");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "criticality");
    v81 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v81)
    {

    }
    else
    {
      v8 = (void *)v81;
      objc_msgSend(v5, "criticality");
      v82 = objc_claimAutoreleasedReturnValue();
      if (!v82)
        goto LABEL_88;
      v83 = (void *)v82;
      -[HKAllergyRecord criticality](self, "criticality");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "criticality");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v84, "isEqual:", v85);

      if (!v86)
        goto LABEL_89;
    }
    -[HKAllergyRecord verificationStatus](self, "verificationStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "verificationStatus");
    v87 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v87)
    {

    }
    else
    {
      v8 = (void *)v87;
      objc_msgSend(v5, "verificationStatus");
      v88 = objc_claimAutoreleasedReturnValue();
      if (!v88)
        goto LABEL_88;
      v89 = (void *)v88;
      -[HKAllergyRecord verificationStatus](self, "verificationStatus");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "verificationStatus");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v90, "isEqual:", v91);

      if (!v92)
        goto LABEL_89;
    }
    -[HKAllergyRecord clinicalStatus](self, "clinicalStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clinicalStatus");
    v93 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v93)
    {

    }
    else
    {
      v8 = (void *)v93;
      objc_msgSend(v5, "clinicalStatus");
      v94 = objc_claimAutoreleasedReturnValue();
      if (!v94)
        goto LABEL_88;
      v95 = (void *)v94;
      -[HKAllergyRecord clinicalStatus](self, "clinicalStatus");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clinicalStatus");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v96, "isEqual:", v97);

      if (!v98)
        goto LABEL_89;
    }
    -[HKAllergyRecord allergyType](self, "allergyType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allergyType");
    v99 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v99)
    {

    }
    else
    {
      v8 = (void *)v99;
      objc_msgSend(v5, "allergyType");
      v100 = objc_claimAutoreleasedReturnValue();
      if (!v100)
        goto LABEL_88;
      v101 = (void *)v100;
      -[HKAllergyRecord allergyType](self, "allergyType");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allergyType");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = objc_msgSend(v102, "isEqual:", v103);

      if (!v104)
        goto LABEL_89;
    }
    -[HKAllergyRecord category](self, "category");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
    v105 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v105)
    {

LABEL_93:
      v14 = 1;
      goto LABEL_90;
    }
    v8 = (void *)v105;
    objc_msgSend(v5, "category");
    v106 = objc_claimAutoreleasedReturnValue();
    if (v106)
    {
      v107 = (void *)v106;
      -[HKAllergyRecord category](self, "category");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "category");
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

- (id)criticalityCodingCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[HKAllergyRecord criticalityCoding](self, "criticalityCoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKAllergyRecord criticalityCoding](self, "criticalityCoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)verificationStatusCodingCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[HKAllergyRecord verificationStatusCoding](self, "verificationStatusCoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKAllergyRecord verificationStatusCoding](self, "verificationStatusCoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)clinicalStatusCodingCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[HKAllergyRecord clinicalStatusCoding](self, "clinicalStatusCoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKAllergyRecord clinicalStatusCoding](self, "clinicalStatusCoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)allergyTypeCodingCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[HKAllergyRecord allergyTypeCoding](self, "allergyTypeCoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKAllergyRecord allergyTypeCoding](self, "allergyTypeCoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)categoryCodingCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[HKAllergyRecord categoryCoding](self, "categoryCoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKAllergyRecord categoryCoding](self, "categoryCoding");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (HKMedicalCodingCollection)allergyCodingCollection
{
  return self->_allergyCodingCollection;
}

- (void)_setAllergyCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *allergyCodingCollection;
  HKConcept *v6;
  HKConcept *allergy;
  id v8;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  allergyCodingCollection = self->_allergyCodingCollection;
  self->_allergyCodingCollection = v4;

  -[HKAllergyRecord allergyCodingCollection](self, "allergyCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  allergy = self->_allergy;
  self->_allergy = v6;

}

- (HKMedicalDate)onsetDate
{
  return self->_onsetDate;
}

- (void)_setOnsetDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *onsetDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  onsetDate = self->_onsetDate;
  self->_onsetDate = v4;

}

- (NSString)asserter
{
  return self->_asserter;
}

- (void)_setAsserter:(id)a3
{
  NSString *v4;
  NSString *asserter;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  asserter = self->_asserter;
  self->_asserter = v4;

}

- (NSArray)reactions
{
  return self->_reactions;
}

- (void)_setReactions:(id)a3
{
  NSArray *v4;
  NSArray *reactions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reactions = self->_reactions;
  self->_reactions = v4;

}

- (HKMedicalCoding)criticalityCoding
{
  return self->_criticalityCoding;
}

- (void)_setCriticalityCoding:(id)a3
{
  HKMedicalCoding *v4;
  HKMedicalCoding *criticalityCoding;
  HKConcept *v6;
  HKConcept *criticality;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  criticalityCoding = self->_criticalityCoding;
  self->_criticalityCoding = v4;

  if (self->_criticalityCoding)
  {
    -[HKAllergyRecord criticalityCodingCollection](self, "criticalityCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    criticality = self->_criticality;
    self->_criticality = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_criticality;
    self->_criticality = 0;
  }

}

- (HKMedicalDate)lastOccurrenceDate
{
  return self->_lastOccurrenceDate;
}

- (void)_setLastOccurrenceDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *lastOccurrenceDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  lastOccurrenceDate = self->_lastOccurrenceDate;
  self->_lastOccurrenceDate = v4;

}

- (HKMedicalDate)recordedDate
{
  return self->_recordedDate;
}

- (void)_setRecordedDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *recordedDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  recordedDate = self->_recordedDate;
  self->_recordedDate = v4;

}

- (HKMedicalCoding)verificationStatusCoding
{
  return self->_verificationStatusCoding;
}

- (void)_setVerificationStatusCoding:(id)a3
{
  HKMedicalCoding *v4;
  HKMedicalCoding *verificationStatusCoding;
  HKConcept *v6;
  HKConcept *verificationStatus;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  verificationStatusCoding = self->_verificationStatusCoding;
  self->_verificationStatusCoding = v4;

  if (self->_verificationStatusCoding)
  {
    -[HKAllergyRecord verificationStatusCodingCollection](self, "verificationStatusCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    verificationStatus = self->_verificationStatus;
    self->_verificationStatus = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_verificationStatus;
    self->_verificationStatus = 0;
  }

}

- (HKMedicalCoding)clinicalStatusCoding
{
  return self->_clinicalStatusCoding;
}

- (void)_setClinicalStatusCoding:(id)a3
{
  HKMedicalCoding *v4;
  HKMedicalCoding *clinicalStatusCoding;
  HKConcept *v6;
  HKConcept *clinicalStatus;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  clinicalStatusCoding = self->_clinicalStatusCoding;
  self->_clinicalStatusCoding = v4;

  if (self->_clinicalStatusCoding)
  {
    -[HKAllergyRecord clinicalStatusCodingCollection](self, "clinicalStatusCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    clinicalStatus = self->_clinicalStatus;
    self->_clinicalStatus = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_clinicalStatus;
    self->_clinicalStatus = 0;
  }

}

- (HKMedicalCoding)allergyTypeCoding
{
  return self->_allergyTypeCoding;
}

- (void)_setAllergyTypeCoding:(id)a3
{
  HKMedicalCoding *v4;
  HKMedicalCoding *allergyTypeCoding;
  HKConcept *v6;
  HKConcept *allergyType;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  allergyTypeCoding = self->_allergyTypeCoding;
  self->_allergyTypeCoding = v4;

  if (self->_allergyTypeCoding)
  {
    -[HKAllergyRecord allergyTypeCodingCollection](self, "allergyTypeCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    allergyType = self->_allergyType;
    self->_allergyType = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_allergyType;
    self->_allergyType = 0;
  }

}

- (HKMedicalCoding)categoryCoding
{
  return self->_categoryCoding;
}

- (void)_setCategoryCoding:(id)a3
{
  HKMedicalCoding *v4;
  HKMedicalCoding *categoryCoding;
  HKConcept *v6;
  HKConcept *category;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  categoryCoding = self->_categoryCoding;
  self->_categoryCoding = v4;

  if (self->_categoryCoding)
  {
    -[HKAllergyRecord categoryCodingCollection](self, "categoryCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    category = self->_category;
    self->_category = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_category;
    self->_category = 0;
  }

}

- (HKConcept)allergy
{
  HKConcept *allergy;
  HKConcept *v3;
  void *v4;

  allergy = self->_allergy;
  if (allergy)
  {
    v3 = allergy;
  }
  else
  {
    -[HKAllergyRecord allergyCodingCollection](self, "allergyCodingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setAllergy:(id)a3
{
  id v4;
  NSObject *v5;
  HKConcept *v6;
  HKConcept *allergy;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKAllergyRecord _setAllergy:].cold.1(v5);
  }
  v6 = (HKConcept *)objc_msgSend(v4, "copy");
  allergy = self->_allergy;
  self->_allergy = v6;

}

- (HKConcept)criticality
{
  HKConcept *criticality;
  HKConcept *v3;
  void *v4;

  if (self->_criticalityCoding)
  {
    criticality = self->_criticality;
    if (criticality)
    {
      v3 = criticality;
    }
    else
    {
      -[HKAllergyRecord criticalityCodingCollection](self, "criticalityCodingCollection");
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

- (void)_setCriticality:(id)a3
{
  HKConcept *v4;
  HKConcept *criticality;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  criticality = self->_criticality;
  self->_criticality = v4;

}

- (HKConcept)verificationStatus
{
  HKConcept *verificationStatus;
  HKConcept *v3;
  void *v4;

  if (self->_verificationStatusCoding)
  {
    verificationStatus = self->_verificationStatus;
    if (verificationStatus)
    {
      v3 = verificationStatus;
    }
    else
    {
      -[HKAllergyRecord verificationStatusCodingCollection](self, "verificationStatusCodingCollection");
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

- (void)_setVerificationStatus:(id)a3
{
  HKConcept *v4;
  HKConcept *verificationStatus;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  verificationStatus = self->_verificationStatus;
  self->_verificationStatus = v4;

}

- (HKConcept)clinicalStatus
{
  HKConcept *clinicalStatus;
  HKConcept *v3;
  void *v4;

  if (self->_clinicalStatusCoding)
  {
    clinicalStatus = self->_clinicalStatus;
    if (clinicalStatus)
    {
      v3 = clinicalStatus;
    }
    else
    {
      -[HKAllergyRecord clinicalStatusCodingCollection](self, "clinicalStatusCodingCollection");
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

- (void)_setClinicalStatus:(id)a3
{
  HKConcept *v4;
  HKConcept *clinicalStatus;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  clinicalStatus = self->_clinicalStatus;
  self->_clinicalStatus = v4;

}

- (HKConcept)allergyType
{
  HKConcept *allergyType;
  HKConcept *v3;
  void *v4;

  if (self->_allergyTypeCoding)
  {
    allergyType = self->_allergyType;
    if (allergyType)
    {
      v3 = allergyType;
    }
    else
    {
      -[HKAllergyRecord allergyTypeCodingCollection](self, "allergyTypeCodingCollection");
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

- (void)_setAllergyType:(id)a3
{
  HKConcept *v4;
  HKConcept *allergyType;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  allergyType = self->_allergyType;
  self->_allergyType = v4;

}

- (HKConcept)category
{
  HKConcept *category;
  HKConcept *v3;
  void *v4;

  if (self->_categoryCoding)
  {
    category = self->_category;
    if (category)
    {
      v3 = category;
    }
    else
    {
      -[HKAllergyRecord categoryCodingCollection](self, "categoryCodingCollection");
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

- (void)_setCategory:(id)a3
{
  HKConcept *v4;
  HKConcept *category;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  category = self->_category;
  self->_category = v4;

}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKAllergyRecord;
  -[HKMedicalRecord _validateWithConfiguration:](&v10, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    if (self->_allergyCodingCollection)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("%@: allergyCodingCollection must not be nil"), self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_6:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_allergyType, 0);
  objc_storeStrong((id *)&self->_clinicalStatus, 0);
  objc_storeStrong((id *)&self->_verificationStatus, 0);
  objc_storeStrong((id *)&self->_criticality, 0);
  objc_storeStrong((id *)&self->_allergy, 0);
  objc_storeStrong((id *)&self->_categoryCoding, 0);
  objc_storeStrong((id *)&self->_allergyTypeCoding, 0);
  objc_storeStrong((id *)&self->_clinicalStatusCoding, 0);
  objc_storeStrong((id *)&self->_verificationStatusCoding, 0);
  objc_storeStrong((id *)&self->_recordedDate, 0);
  objc_storeStrong((id *)&self->_lastOccurrenceDate, 0);
  objc_storeStrong((id *)&self->_criticalityCoding, 0);
  objc_storeStrong((id *)&self->_reactions, 0);
  objc_storeStrong((id *)&self->_asserter, 0);
  objc_storeStrong((id *)&self->_onsetDate, 0);
  objc_storeStrong((id *)&self->_allergyCodingCollection, 0);
}

- (void)_setAllergy:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19A0E6000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property allergy for record type HKAllergyRecord.", v1, 2u);
}

@end
