@implementation HKConditionRecord

+ (id)conditionRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 conditionCodingCollection:(id)a14 categoriesCodingCollections:(id)a15 asserter:(id)a16 abatement:(id)a17 onset:(id)a18 recordedDate:(id)a19 clinicalStatusCoding:(id)a20 verificationStatusCoding:(id)a21 severityCodingCollection:(id)a22 bodySitesCodingCollections:(id)a23
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  __CFString *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  unint64_t v48;
  void *v49;
  void *v51;
  id v52;
  id v53;
  id v54;
  _BOOL4 v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;

  v55 = a5;
  v66 = a3;
  v65 = a4;
  v27 = a6;
  v64 = a7;
  v57 = a8;
  v28 = a10;
  v63 = a11;
  v62 = a12;
  v59 = a14;
  v61 = a15;
  v29 = a16;
  v30 = a17;
  v31 = a18;
  v32 = a19;
  v54 = a20;
  v53 = a21;
  v33 = a22;
  v52 = a23;
  v34 = CFSTR("modifiedDate");
  v35 = v27;
  v36 = v35;
  if (v31)
  {
    v37 = v28;
    objc_msgSend(v31, "dateValueForUTC");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = CFSTR("onset");

      objc_msgSend(v31, "dateValueForUTC");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v39;
    }
    else
    {
      v40 = v36;
    }
    v28 = v37;
  }
  else
  {
    v40 = v35;
  }
  v60 = v36;
  v58 = v28;
  if (v32)
  {
    v41 = v31;
    v42 = v30;
    v43 = v29;
    v44 = CFSTR("recordedDate");

    v45 = v32;
    objc_msgSend(v32, "dateForUTC");
    v46 = objc_claimAutoreleasedReturnValue();

    v47 = (void *)v46;
    v34 = v44;
    v48 = a13;
  }
  else
  {
    v45 = 0;
    v41 = v31;
    v42 = v30;
    v43 = v29;
    v48 = a13;
    v47 = v40;
  }
  v51 = v47;
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", v34);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKConditionRecord conditionRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:conditionCodingCollection:categoriesCodingCollections:asserter:abatement:onset:recordedDate:clinicalStatusCoding:verificationStatusCoding:severityCodingCollection:bodySitesCodingCollections:](HKConditionRecord, "conditionRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:conditionCodingCollection:categoriesCodingCollections:asserter:abatement:onset:recordedDate:clinicalStatusCoding:verificationStatusCoding:severityCodingCollection:bodySitesCodingCollections:", v66, v65, v55, v60, v64, v57, a9, v58, v63, v49, v62, v48, v59, v61, v43,
    v42,
    v41,
    v45,
    v54,
    v53,
    v33,
    v52);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  return v56;
}

- (id)medicalRecordCodings
{
  void *v2;
  void *v3;

  -[HKConditionRecord conditionCodingCollection](self, "conditionCodingCollection");
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNSPECIFIED_CONDITION"), &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Health-Records"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKConditionRecord;
  objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("condition"));
  objc_msgSend(v3, "addObject:", CFSTR("categories"));
  objc_msgSend(v3, "addObject:", CFSTR("clinicalStatus"));
  objc_msgSend(v3, "addObject:", CFSTR("verificationStatus"));
  objc_msgSend(v3, "addObject:", CFSTR("severity"));
  objc_msgSend(v3, "addObject:", CFSTR("bodySites"));
  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKConditionRecord;
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
  void **v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void **v20;
  void *v21;
  void *v23;
  void *v24;
  objc_super v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v13 = 0;
    goto LABEL_17;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("condition")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("categories")))
    {
      -[HKConditionRecord categoriesCodingCollections](self, "categoriesCodingCollections");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v15 = (void *)v14;
      +[HKConceptIndexUtilities indexedCodingsForCodingCollections:context:error:](HKConceptIndexUtilities, "indexedCodingsForCodingCollections:context:error:", v14, v6, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

      goto LABEL_17;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("clinicalStatus")))
    {
      -[HKConditionRecord clinicalStatusCoding](self, "clinicalStatusCoding");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HKConditionRecord clinicalStatusCoding](self, "clinicalStatusCoding");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v18;
        v19 = (void *)MEMORY[0x1E0C99D20];
        v20 = &v28;
LABEL_15:
        objc_msgSend(v19, "arrayWithObjects:count:", v20, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("verificationStatus")))
    {
      -[HKConditionRecord verificationStatusCoding](self, "verificationStatusCoding");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[HKConditionRecord verificationStatusCoding](self, "verificationStatusCoding");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v18;
        v19 = (void *)MEMORY[0x1E0C99D20];
        v20 = &v27;
        goto LABEL_15;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("severity")))
    {
      -[HKConditionRecord severityCodingCollection](self, "severityCodingCollection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[HKConditionRecord severityCodingCollection](self, "severityCodingCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v26;
        goto LABEL_4;
      }
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("bodySites")))
      {
        v25.receiver = self;
        v25.super_class = (Class)HKConditionRecord;
        -[HKMedicalRecord codingsForKeyPath:error:](&v25, sel_codingsForKeyPath_error_, v6, a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      -[HKConditionRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        -[HKConditionRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
        v14 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    v13 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_17;
  }
  -[HKConditionRecord conditionCodingCollection](self, "conditionCodingCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v10;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = (void **)v29;
LABEL_4:
  objc_msgSend(v11, "arrayWithObjects:count:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v13;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  objc_super v25;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_6;
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("condition")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("categories")))
    {
      -[HKConditionRecord categoriesCodingCollections](self, "categoriesCodingCollections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v13, "count"), v9, a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = v14 != 0;
      if (v14)
        -[HKConditionRecord _setCategories:](self, "_setCategories:", v14);
LABEL_10:

      goto LABEL_11;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("clinicalStatus")))
    {
      v16 = objc_msgSend(v8, "count");
      -[HKConditionRecord clinicalStatusCoding](self, "clinicalStatusCoding");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v16, v17 != 0, (uint64_t)v9, (uint64_t)a5);

      if (!(_DWORD)a5)
        goto LABEL_11;
      objc_msgSend(v8, "firstObject");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKConditionRecord _setClinicalStatus:](self, "_setClinicalStatus:", v12);
      goto LABEL_5;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("verificationStatus")))
    {
      v18 = objc_msgSend(v8, "count");
      -[HKConditionRecord verificationStatusCoding](self, "verificationStatusCoding");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v18, v19 != 0, (uint64_t)v9, (uint64_t)a5);

      if (!(_DWORD)a5)
        goto LABEL_11;
      objc_msgSend(v8, "firstObject");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKConditionRecord _setVerificationStatus:](self, "_setVerificationStatus:", v12);
      goto LABEL_5;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("severity")))
    {
      v20 = objc_msgSend(v8, "count");
      -[HKConditionRecord severityCodingCollection](self, "severityCodingCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v20, v21 != 0, (uint64_t)v9, (uint64_t)a5);

      if (!(_DWORD)a5)
        goto LABEL_11;
      objc_msgSend(v8, "firstObject");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKConditionRecord _setSeverity:](self, "_setSeverity:", v12);
      goto LABEL_5;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("bodySites")))
    {
      -[HKConditionRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[HKConditionRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v23, "count"), v9, a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(a5) = v14 != 0;
        if (v14)
          -[HKConditionRecord _setBodySites:](self, "_setBodySites:", v14);
        goto LABEL_10;
      }
      v24 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 0, (uint64_t)v9, (uint64_t)a5);
    }
    else
    {
      v25.receiver = self;
      v25.super_class = (Class)HKConditionRecord;
      v24 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v25, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
    }
    LOBYTE(a5) = v24;
    goto LABEL_11;
  }
  if (!HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
  {
LABEL_6:
    LOBYTE(a5) = 0;
    goto LABEL_11;
  }
  objc_msgSend(v8, "firstObject");
  a5 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a5, "object");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKConditionRecord _setCondition:](self, "_setCondition:", v12);
LABEL_5:

  LOBYTE(a5) = 1;
LABEL_11:

  return (char)a5;
}

- (int64_t)recordCategoryType
{
  return 4;
}

+ (id)conditionRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 conditionCodingCollection:(id)a15 categoriesCodingCollections:(id)a16 asserter:(id)a17 abatement:(id)a18 onset:(id)a19 recordedDate:(id)a20 clinicalStatusCoding:(id)a21 verificationStatusCoding:(id)a22 severityCodingCollection:(id)a23 bodySitesCodingCollections:(id)a24
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newConditionRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:conditionCodingCollection:categoriesCodingCollections:asserter:abatement:onset:recordedDate:clinicalStatusCoding:verificationStatusCoding:severityCodingCollection:bodySitesCodingCollections:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
                                           a16,
                                           a17,
                                           a18,
                                           a19,
                                           a20,
                                           a21,
                                           a22,
                                           a23,
                                           a24,
                                           0));
}

+ (id)_newConditionRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 conditionCodingCollection:(id)a15 categoriesCodingCollections:(id)a16 asserter:(id)a17 abatement:(id)a18 onset:(id)a19 recordedDate:(id)a20 clinicalStatusCoding:(id)a21 verificationStatusCoding:(id)a22 severityCodingCollection:(id)a23 bodySitesCodingCollections:(id)a24 config:(id)a25
{
  id v25;
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
  id v43;
  id v44;
  void *v45;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _BOOL4 v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  objc_super v66;
  _QWORD aBlock[4];
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;

  v60 = a5;
  v25 = a15;
  v26 = a16;
  v27 = a17;
  v28 = a18;
  v29 = a19;
  v30 = a20;
  v31 = a21;
  v32 = a22;
  v33 = a23;
  v34 = a24;
  v35 = a25;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __360__HKConditionRecord__newConditionRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_conditionCodingCollection_categoriesCodingCollections_asserter_abatement_onset_recordedDate_clinicalStatusCoding_verificationStatusCoding_severityCodingCollection_bodySitesCodingCollections_config___block_invoke;
  aBlock[3] = &unk_1E37F6A18;
  v68 = v25;
  v69 = v26;
  v70 = v27;
  v71 = v28;
  v72 = v29;
  v73 = v30;
  v74 = v31;
  v75 = v32;
  v76 = v33;
  v77 = v34;
  v78 = v35;
  v65 = v35;
  v64 = v34;
  v63 = v33;
  v62 = v32;
  v59 = v31;
  v58 = v30;
  v57 = v29;
  v56 = v28;
  v55 = v27;
  v54 = v26;
  v53 = v25;
  v36 = a13;
  v37 = a12;
  v38 = a11;
  v39 = a10;
  v40 = a8;
  v41 = a7;
  v42 = a6;
  v43 = a4;
  v44 = a3;
  v45 = _Block_copy(aBlock);
  v66.receiver = a1;
  v66.super_class = (Class)&OBJC_METACLASS___HKConditionRecord;
  v61 = objc_msgSendSuper2(&v66, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v44, v43, v60, v42, v41, v40, a9, v39, v38, v37, v36, a14, v45);

  return v61;
}

void __360__HKConditionRecord__newConditionRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_conditionCodingCollection_categoriesCodingCollections_asserter_abatement_onset_recordedDate_clinicalStatusCoding_verificationStatusCoding_severityCodingCollection_bodySitesCodingCollections_config___block_invoke(uint64_t a1, void *a2)
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
  _QWORD *v24;

  v24 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v24[22];
  v24[22] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v24[23];
  v24[23] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v24[24];
  v24[24] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v24[25];
  v24[25] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v24[26];
  v24[26] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v24[27];
  v24[27] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v16 = (void *)v24[28];
  v24[28] = v15;

  v17 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v18 = (void *)v24[29];
  v24[29] = v17;

  v19 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v20 = (void *)v24[30];
  v24[30] = v19;

  v21 = objc_msgSend(*(id *)(a1 + 104), "copy");
  v22 = (void *)v24[31];
  v24[31] = v21;

  v23 = *(_QWORD *)(a1 + 112);
  if (v23)
    (*(void (**)(uint64_t, _QWORD *))(v23 + 16))(v23, v24);

}

- (HKConditionRecord)init
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
  v9.super_class = (Class)HKConditionRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@conditionCodingCollection = %@categoriesCodingCollections = %@asserter = %@abatement = %@onset = %@recordedDate = %@clinicalStatusCoding = %@verificationStatusCoding = %@severityCodingCollection = %@bodySitesCodingCollections = %@>"), v5, self, v6, self->_conditionCodingCollection, self->_categoriesCodingCollections, self->_asserter, self->_abatement, self->_onset, self->_recordedDate, self->_clinicalStatusCoding, self->_verificationStatusCoding, self->_severityCodingCollection, self->_bodySitesCodingCollections);
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
  v5.super_class = (Class)HKConditionRecord;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_conditionCodingCollection, CFSTR("ConditionCodingCollection"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_categoriesCodingCollections, CFSTR("CategoriesCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_asserter, CFSTR("Asserter"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_abatement, CFSTR("Abatement"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_onset, CFSTR("Onset"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_recordedDate, CFSTR("RecordedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clinicalStatusCoding, CFSTR("ClinicalStatusCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_verificationStatusCoding, CFSTR("VerificationStatusCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_severityCodingCollection, CFSTR("SeverityCodingCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodySitesCodingCollections, CFSTR("BodySitesCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_condition, CFSTR("Condition"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_categories, CFSTR("Categories"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clinicalStatus, CFSTR("ClinicalStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_verificationStatus, CFSTR("VerificationStatus"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_severity, CFSTR("Severity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodySites, CFSTR("BodySites"));

}

- (HKConditionRecord)initWithCoder:(id)a3
{
  id v4;
  HKConditionRecord *v5;
  uint64_t v6;
  HKMedicalCodingCollection *conditionCodingCollection;
  void *v8;
  uint64_t v9;
  NSArray *categoriesCodingCollections;
  uint64_t v11;
  NSString *asserter;
  uint64_t v13;
  HKInspectableValue *abatement;
  uint64_t v15;
  HKInspectableValue *onset;
  uint64_t v17;
  HKMedicalDate *recordedDate;
  uint64_t v19;
  HKMedicalCoding *clinicalStatusCoding;
  uint64_t v21;
  HKMedicalCoding *verificationStatusCoding;
  uint64_t v23;
  HKMedicalCodingCollection *severityCodingCollection;
  void *v25;
  uint64_t v26;
  NSArray *bodySitesCodingCollections;
  uint64_t v28;
  HKConcept *condition;
  void *v30;
  uint64_t v31;
  NSArray *categories;
  uint64_t v33;
  HKConcept *clinicalStatus;
  uint64_t v35;
  HKConcept *verificationStatus;
  uint64_t v37;
  HKConcept *severity;
  void *v39;
  uint64_t v40;
  NSArray *bodySites;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)HKConditionRecord;
  v5 = -[HKMedicalRecord initWithCoder:](&v43, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ConditionCodingCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    conditionCodingCollection = v5->_conditionCodingCollection;
    v5->_conditionCodingCollection = (HKMedicalCodingCollection *)v6;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("CategoriesCodingCollections"));
    v9 = objc_claimAutoreleasedReturnValue();
    categoriesCodingCollections = v5->_categoriesCodingCollections;
    v5->_categoriesCodingCollections = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Asserter"));
    v11 = objc_claimAutoreleasedReturnValue();
    asserter = v5->_asserter;
    v5->_asserter = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Abatement"));
    v13 = objc_claimAutoreleasedReturnValue();
    abatement = v5->_abatement;
    v5->_abatement = (HKInspectableValue *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Onset"));
    v15 = objc_claimAutoreleasedReturnValue();
    onset = v5->_onset;
    v5->_onset = (HKInspectableValue *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RecordedDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    recordedDate = v5->_recordedDate;
    v5->_recordedDate = (HKMedicalDate *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClinicalStatusCoding"));
    v19 = objc_claimAutoreleasedReturnValue();
    clinicalStatusCoding = v5->_clinicalStatusCoding;
    v5->_clinicalStatusCoding = (HKMedicalCoding *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VerificationStatusCoding"));
    v21 = objc_claimAutoreleasedReturnValue();
    verificationStatusCoding = v5->_verificationStatusCoding;
    v5->_verificationStatusCoding = (HKMedicalCoding *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SeverityCodingCollection"));
    v23 = objc_claimAutoreleasedReturnValue();
    severityCodingCollection = v5->_severityCodingCollection;
    v5->_severityCodingCollection = (HKMedicalCodingCollection *)v23;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("BodySitesCodingCollections"));
    v26 = objc_claimAutoreleasedReturnValue();
    bodySitesCodingCollections = v5->_bodySitesCodingCollections;
    v5->_bodySitesCodingCollections = (NSArray *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Condition"));
    v28 = objc_claimAutoreleasedReturnValue();
    condition = v5->_condition;
    v5->_condition = (HKConcept *)v28;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("Categories"));
    v31 = objc_claimAutoreleasedReturnValue();
    categories = v5->_categories;
    v5->_categories = (NSArray *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClinicalStatus"));
    v33 = objc_claimAutoreleasedReturnValue();
    clinicalStatus = v5->_clinicalStatus;
    v5->_clinicalStatus = (HKConcept *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VerificationStatus"));
    v35 = objc_claimAutoreleasedReturnValue();
    verificationStatus = v5->_verificationStatus;
    v5->_verificationStatus = (HKConcept *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Severity"));
    v37 = objc_claimAutoreleasedReturnValue();
    severity = v5->_severity;
    v5->_severity = (HKConcept *)v37;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("BodySites"));
    v40 = objc_claimAutoreleasedReturnValue();
    bodySites = v5->_bodySites;
    v5->_bodySites = (NSArray *)v40;

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
  char v104;
  objc_super v106;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v106.receiver = self;
    v106.super_class = (Class)HKConditionRecord;
    if (!-[HKMedicalRecord isEquivalent:](&v106, sel_isEquivalent_, v5))
      goto LABEL_84;
    -[HKConditionRecord conditionCodingCollection](self, "conditionCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "conditionCodingCollection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "conditionCodingCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_83;
      v10 = (void *)v9;
      -[HKConditionRecord conditionCodingCollection](self, "conditionCodingCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "conditionCodingCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_84;
    }
    -[HKConditionRecord categoriesCodingCollections](self, "categoriesCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoriesCodingCollections");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

    }
    else
    {
      v8 = (void *)v15;
      objc_msgSend(v5, "categoriesCodingCollections");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_83;
      v17 = (void *)v16;
      -[HKConditionRecord categoriesCodingCollections](self, "categoriesCodingCollections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categoriesCodingCollections");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToArray:", v19);

      if (!v20)
        goto LABEL_84;
    }
    -[HKConditionRecord asserter](self, "asserter");
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
        goto LABEL_83;
      v23 = (void *)v22;
      -[HKConditionRecord asserter](self, "asserter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "asserter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

      if (!v26)
        goto LABEL_84;
    }
    -[HKConditionRecord abatement](self, "abatement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "abatement");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v27)
    {

    }
    else
    {
      v8 = (void *)v27;
      objc_msgSend(v5, "abatement");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_83;
      v29 = (void *)v28;
      -[HKConditionRecord abatement](self, "abatement");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "abatement");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_84;
    }
    -[HKConditionRecord onset](self, "onset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "onset");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v33)
    {

    }
    else
    {
      v8 = (void *)v33;
      objc_msgSend(v5, "onset");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
        goto LABEL_83;
      v35 = (void *)v34;
      -[HKConditionRecord onset](self, "onset");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "onset");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_84;
    }
    -[HKConditionRecord recordedDate](self, "recordedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordedDate");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v39)
    {

    }
    else
    {
      v8 = (void *)v39;
      objc_msgSend(v5, "recordedDate");
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_83;
      v41 = (void *)v40;
      -[HKConditionRecord recordedDate](self, "recordedDate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordedDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqual:", v43);

      if (!v44)
        goto LABEL_84;
    }
    -[HKConditionRecord clinicalStatusCoding](self, "clinicalStatusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clinicalStatusCoding");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v45)
    {

    }
    else
    {
      v8 = (void *)v45;
      objc_msgSend(v5, "clinicalStatusCoding");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_83;
      v47 = (void *)v46;
      -[HKConditionRecord clinicalStatusCoding](self, "clinicalStatusCoding");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clinicalStatusCoding");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqual:", v49);

      if (!v50)
        goto LABEL_84;
    }
    -[HKConditionRecord verificationStatusCoding](self, "verificationStatusCoding");
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
        goto LABEL_83;
      v53 = (void *)v52;
      -[HKConditionRecord verificationStatusCoding](self, "verificationStatusCoding");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "verificationStatusCoding");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v54, "isEqual:", v55);

      if (!v56)
        goto LABEL_84;
    }
    -[HKConditionRecord severityCodingCollection](self, "severityCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "severityCodingCollection");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v57)
    {

    }
    else
    {
      v8 = (void *)v57;
      objc_msgSend(v5, "severityCodingCollection");
      v58 = objc_claimAutoreleasedReturnValue();
      if (!v58)
        goto LABEL_83;
      v59 = (void *)v58;
      -[HKConditionRecord severityCodingCollection](self, "severityCodingCollection");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "severityCodingCollection");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v60, "isEqual:", v61);

      if (!v62)
        goto LABEL_84;
    }
    -[HKConditionRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bodySitesCodingCollections");
    v63 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v63)
    {

    }
    else
    {
      v8 = (void *)v63;
      objc_msgSend(v5, "bodySitesCodingCollections");
      v64 = objc_claimAutoreleasedReturnValue();
      if (!v64)
        goto LABEL_83;
      v65 = (void *)v64;
      -[HKConditionRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bodySitesCodingCollections");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v66, "isEqualToArray:", v67);

      if (!v68)
        goto LABEL_84;
    }
    -[HKConditionRecord condition](self, "condition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "condition");
    v69 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v69)
    {

    }
    else
    {
      v8 = (void *)v69;
      objc_msgSend(v5, "condition");
      v70 = objc_claimAutoreleasedReturnValue();
      if (!v70)
        goto LABEL_83;
      v71 = (void *)v70;
      -[HKConditionRecord condition](self, "condition");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "condition");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v72, "isEqual:", v73);

      if (!v74)
        goto LABEL_84;
    }
    -[HKConditionRecord categories](self, "categories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categories");
    v75 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v75)
    {

    }
    else
    {
      v8 = (void *)v75;
      objc_msgSend(v5, "categories");
      v76 = objc_claimAutoreleasedReturnValue();
      if (!v76)
        goto LABEL_83;
      v77 = (void *)v76;
      -[HKConditionRecord categories](self, "categories");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categories");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v78, "isEqualToArray:", v79);

      if (!v80)
        goto LABEL_84;
    }
    -[HKConditionRecord clinicalStatus](self, "clinicalStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clinicalStatus");
    v81 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v81)
    {

    }
    else
    {
      v8 = (void *)v81;
      objc_msgSend(v5, "clinicalStatus");
      v82 = objc_claimAutoreleasedReturnValue();
      if (!v82)
        goto LABEL_83;
      v83 = (void *)v82;
      -[HKConditionRecord clinicalStatus](self, "clinicalStatus");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clinicalStatus");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v84, "isEqual:", v85);

      if (!v86)
        goto LABEL_84;
    }
    -[HKConditionRecord verificationStatus](self, "verificationStatus");
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
        goto LABEL_83;
      v89 = (void *)v88;
      -[HKConditionRecord verificationStatus](self, "verificationStatus");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "verificationStatus");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v90, "isEqual:", v91);

      if (!v92)
        goto LABEL_84;
    }
    -[HKConditionRecord severity](self, "severity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "severity");
    v93 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v93)
    {

    }
    else
    {
      v8 = (void *)v93;
      objc_msgSend(v5, "severity");
      v94 = objc_claimAutoreleasedReturnValue();
      if (!v94)
        goto LABEL_83;
      v95 = (void *)v94;
      -[HKConditionRecord severity](self, "severity");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "severity");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v96, "isEqual:", v97);

      if (!v98)
        goto LABEL_84;
    }
    -[HKConditionRecord bodySites](self, "bodySites");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bodySites");
    v99 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v99)
    {

LABEL_88:
      v14 = 1;
      goto LABEL_85;
    }
    v8 = (void *)v99;
    objc_msgSend(v5, "bodySites");
    v100 = objc_claimAutoreleasedReturnValue();
    if (v100)
    {
      v101 = (void *)v100;
      -[HKConditionRecord bodySites](self, "bodySites");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bodySites");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = objc_msgSend(v102, "isEqualToArray:", v103);

      if ((v104 & 1) != 0)
        goto LABEL_88;
LABEL_84:
      v14 = 0;
LABEL_85:

      goto LABEL_86;
    }
LABEL_83:

    goto LABEL_84;
  }
  v14 = 0;
LABEL_86:

  return v14;
}

- (id)clinicalStatusCodingCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[HKConditionRecord clinicalStatusCoding](self, "clinicalStatusCoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKConditionRecord clinicalStatusCoding](self, "clinicalStatusCoding");
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

  -[HKConditionRecord verificationStatusCoding](self, "verificationStatusCoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKConditionRecord verificationStatusCoding](self, "verificationStatusCoding");
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

- (HKMedicalCodingCollection)conditionCodingCollection
{
  return self->_conditionCodingCollection;
}

- (void)_setConditionCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *conditionCodingCollection;
  HKConcept *v6;
  HKConcept *condition;
  id v8;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  conditionCodingCollection = self->_conditionCodingCollection;
  self->_conditionCodingCollection = v4;

  -[HKConditionRecord conditionCodingCollection](self, "conditionCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  condition = self->_condition;
  self->_condition = v6;

}

- (NSArray)categoriesCodingCollections
{
  return self->_categoriesCodingCollections;
}

- (void)_setCategoriesCodingCollections:(id)a3
{
  NSArray *v4;
  NSArray *categoriesCodingCollections;
  NSArray *v6;
  NSArray *categories;
  id v8;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  categoriesCodingCollections = self->_categoriesCodingCollections;
  self->_categoriesCodingCollections = v4;

  -[HKConditionRecord categoriesCodingCollections](self, "categoriesCodingCollections");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_map:", &__block_literal_global_123);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  categories = self->_categories;
  self->_categories = v6;

}

id __53__HKConditionRecord__setCategoriesCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
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

- (HKInspectableValue)abatement
{
  return self->_abatement;
}

- (void)_setAbatement:(id)a3
{
  HKInspectableValue *v4;
  HKInspectableValue *abatement;

  v4 = (HKInspectableValue *)objc_msgSend(a3, "copy");
  abatement = self->_abatement;
  self->_abatement = v4;

}

- (HKInspectableValue)onset
{
  return self->_onset;
}

- (void)_setOnset:(id)a3
{
  HKInspectableValue *v4;
  HKInspectableValue *onset;

  v4 = (HKInspectableValue *)objc_msgSend(a3, "copy");
  onset = self->_onset;
  self->_onset = v4;

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
    -[HKConditionRecord clinicalStatusCodingCollection](self, "clinicalStatusCodingCollection");
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
    -[HKConditionRecord verificationStatusCodingCollection](self, "verificationStatusCodingCollection");
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

- (HKMedicalCodingCollection)severityCodingCollection
{
  return self->_severityCodingCollection;
}

- (void)_setSeverityCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *severityCodingCollection;
  HKConcept *v6;
  HKConcept *severity;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  severityCodingCollection = self->_severityCodingCollection;
  self->_severityCodingCollection = v4;

  if (self->_severityCodingCollection)
  {
    -[HKConditionRecord severityCodingCollection](self, "severityCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    severity = self->_severity;
    self->_severity = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_severity;
    self->_severity = 0;
  }

}

- (NSArray)bodySitesCodingCollections
{
  return self->_bodySitesCodingCollections;
}

- (void)_setBodySitesCodingCollections:(id)a3
{
  NSArray *v4;
  NSArray *bodySitesCodingCollections;
  NSArray *v6;
  NSArray *bodySites;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  bodySitesCodingCollections = self->_bodySitesCodingCollections;
  self->_bodySitesCodingCollections = v4;

  if (self->_bodySitesCodingCollections)
  {
    -[HKConditionRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_90_1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    bodySites = self->_bodySites;
    self->_bodySites = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_bodySites;
    self->_bodySites = 0;
  }

}

id __52__HKConditionRecord__setBodySitesCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (HKConcept)condition
{
  HKConcept *condition;
  HKConcept *v3;
  void *v4;

  condition = self->_condition;
  if (condition)
  {
    v3 = condition;
  }
  else
  {
    -[HKConditionRecord conditionCodingCollection](self, "conditionCodingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setCondition:(id)a3
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
  HKConcept *condition;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKConditionRecord _setCondition:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  condition = self->_condition;
  self->_condition = v13;

}

- (NSArray)categories
{
  NSArray *categories;
  NSArray *v3;
  void *v4;

  categories = self->_categories;
  if (categories)
  {
    v3 = categories;
  }
  else
  {
    -[HKConditionRecord categoriesCodingCollections](self, "categoriesCodingCollections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_map:", &__block_literal_global_91_1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

id __31__HKConditionRecord_categories__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setCategories:(id)a3
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
  NSArray *v13;
  NSArray *categories;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKConditionRecord _setCategories:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (NSArray *)objc_msgSend(v4, "copy");
  categories = self->_categories;
  self->_categories = v13;

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
      -[HKConditionRecord clinicalStatusCodingCollection](self, "clinicalStatusCodingCollection");
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
      -[HKConditionRecord verificationStatusCodingCollection](self, "verificationStatusCodingCollection");
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

- (HKConcept)severity
{
  HKConcept *severity;
  HKConcept *v3;
  void *v4;

  if (self->_severityCodingCollection)
  {
    severity = self->_severity;
    if (severity)
    {
      v3 = severity;
    }
    else
    {
      -[HKConditionRecord severityCodingCollection](self, "severityCodingCollection");
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

- (void)_setSeverity:(id)a3
{
  HKConcept *v4;
  HKConcept *severity;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  severity = self->_severity;
  self->_severity = v4;

}

- (NSArray)bodySites
{
  NSArray *bodySites;
  NSArray *v3;
  void *v4;

  if (self->_bodySitesCodingCollections)
  {
    bodySites = self->_bodySites;
    if (bodySites)
    {
      v3 = bodySites;
    }
    else
    {
      -[HKConditionRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_92_1);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __30__HKConditionRecord_bodySites__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setBodySites:(id)a3
{
  NSArray *v4;
  NSArray *bodySites;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  bodySites = self->_bodySites;
  self->_bodySites = v4;

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
  v13.super_class = (Class)HKConditionRecord;
  -[HKMedicalRecord _validateWithConfiguration:](&v13, sel__validateWithConfiguration_, a3.var0, a3.var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
LABEL_9:
    v8 = v7;
    goto LABEL_10;
  }
  if (!self->_conditionCodingCollection)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: conditionCodingCollection must not be nil");
LABEL_8:
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11, self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!self->_categoriesCodingCollections)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: categoriesCodingCollections must not be nil");
    goto LABEL_8;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodySites, 0);
  objc_storeStrong((id *)&self->_severity, 0);
  objc_storeStrong((id *)&self->_verificationStatus, 0);
  objc_storeStrong((id *)&self->_clinicalStatus, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_bodySitesCodingCollections, 0);
  objc_storeStrong((id *)&self->_severityCodingCollection, 0);
  objc_storeStrong((id *)&self->_verificationStatusCoding, 0);
  objc_storeStrong((id *)&self->_clinicalStatusCoding, 0);
  objc_storeStrong((id *)&self->_recordedDate, 0);
  objc_storeStrong((id *)&self->_onset, 0);
  objc_storeStrong((id *)&self->_abatement, 0);
  objc_storeStrong((id *)&self->_asserter, 0);
  objc_storeStrong((id *)&self->_categoriesCodingCollections, 0);
  objc_storeStrong((id *)&self->_conditionCodingCollection, 0);
}

- (void)_setCondition:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property condition for record type HKConditionRecord.", a5, a6, a7, a8, 0);
}

- (void)_setCategories:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property categories for record type HKConditionRecord.", a5, a6, a7, a8, 0);
}

@end
