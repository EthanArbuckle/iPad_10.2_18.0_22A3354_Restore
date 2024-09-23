@implementation HKProcedureRecord

- (id)medicalRecordCodings
{
  void *v2;
  void *v3;

  -[HKProcedureRecord procedureCodingCollection](self, "procedureCodingCollection");
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
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNSPECIFIED_PROCEDURE"), &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Health-Records"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)recordCategoryType
{
  return 5;
}

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKProcedureRecord;
  objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("procedure"));
  objc_msgSend(v3, "addObject:", CFSTR("status"));
  objc_msgSend(v3, "addObject:", CFSTR("category"));
  objc_msgSend(v3, "addObject:", CFSTR("reason"));
  objc_msgSend(v3, "addObject:", CFSTR("reasonsNotPerformed"));
  objc_msgSend(v3, "addObject:", CFSTR("outcome"));
  objc_msgSend(v3, "addObject:", CFSTR("complications"));
  objc_msgSend(v3, "addObject:", CFSTR("followUps"));
  objc_msgSend(v3, "addObject:", CFSTR("bodySites"));
  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKProcedureRecord;
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
  void *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("procedure")))
    {
      -[HKProcedureRecord procedureCodingCollection](self, "procedureCodingCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v10;
      v11 = (void *)MEMORY[0x1E0C99D20];
      v12 = (void **)v28;
LABEL_4:
      objc_msgSend(v11, "arrayWithObjects:count:", v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_9:
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("status")))
    {
      -[HKProcedureRecord statusCoding](self, "statusCoding");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("category")))
    {
      -[HKProcedureRecord categoryCodingCollection](self, "categoryCodingCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HKProcedureRecord categoryCodingCollection](self, "categoryCodingCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v10;
        v11 = (void *)MEMORY[0x1E0C99D20];
        v12 = &v26;
        goto LABEL_4;
      }
LABEL_33:
      v13 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("reason")))
    {
      -[HKProcedureRecord reasonCodingCollections](self, "reasonCodingCollections");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_33;
      -[HKProcedureRecord reasonCodingCollections](self, "reasonCodingCollections");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("reasonsNotPerformed")))
    {
      -[HKProcedureRecord reasonsNotPerformedCodingCollections](self, "reasonsNotPerformedCodingCollections");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
        goto LABEL_33;
      -[HKProcedureRecord reasonsNotPerformedCodingCollections](self, "reasonsNotPerformedCodingCollections");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("outcome")))
      {
        -[HKProcedureRecord outcomeCodingCollection](self, "outcomeCodingCollection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          -[HKProcedureRecord outcomeCodingCollection](self, "outcomeCodingCollection");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v10;
          v11 = (void *)MEMORY[0x1E0C99D20];
          v12 = &v25;
          goto LABEL_4;
        }
        goto LABEL_33;
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("complications")))
      {
        -[HKProcedureRecord complicationsCodingCollections](self, "complicationsCodingCollections");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          goto LABEL_33;
        -[HKProcedureRecord complicationsCodingCollections](self, "complicationsCodingCollections");
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v8, "isEqualToString:", CFSTR("followUps")))
      {
        -[HKProcedureRecord followUpsCodingCollections](self, "followUpsCodingCollections");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_33;
        -[HKProcedureRecord followUpsCodingCollections](self, "followUpsCodingCollections");
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v8, "isEqualToString:", CFSTR("bodySites")))
        {
          v24.receiver = self;
          v24.super_class = (Class)HKProcedureRecord;
          -[HKMedicalRecord codingsForKeyPath:error:](&v24, sel_codingsForKeyPath_error_, v6, a4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        -[HKProcedureRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          goto LABEL_33;
        -[HKProcedureRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
        v18 = objc_claimAutoreleasedReturnValue();
      }
    }
    v9 = (void *)v18;
    +[HKConceptIndexUtilities indexedCodingsForCodingCollections:context:error:](HKConceptIndexUtilities, "indexedCodingsForCodingCollections:context:error:", v18, v6, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v13 = 0;
LABEL_10:

  return v13;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
LABEL_8:
    LOBYTE(a5) = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("procedure")))
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKProcedureRecord _setProcedure:](self, "_setProcedure:", v12);
LABEL_12:

      LOBYTE(a5) = 1;
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("status")))
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKProcedureRecord _setStatus:](self, "_setStatus:", v12);
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("category")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("reason")))
    {
      -[HKProcedureRecord reasonCodingCollections](self, "reasonCodingCollections");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HKProcedureRecord reasonCodingCollections](self, "reasonCodingCollections");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v17, "count"), v9, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(a5) = v18 != 0;
        if (v18)
          -[HKProcedureRecord _setReason:](self, "_setReason:", v18);
LABEL_22:

        goto LABEL_13;
      }
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("reasonsNotPerformed")))
    {
      -[HKProcedureRecord reasonsNotPerformedCodingCollections](self, "reasonsNotPerformedCodingCollections");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[HKProcedureRecord reasonsNotPerformedCodingCollections](self, "reasonsNotPerformedCodingCollections");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v20, "count"), v9, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(a5) = v18 != 0;
        if (v18)
          -[HKProcedureRecord _setReasonsNotPerformed:](self, "_setReasonsNotPerformed:", v18);
        goto LABEL_22;
      }
    }
    else
    {
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("outcome")))
      {
        v21 = objc_msgSend(v8, "count");
        -[HKProcedureRecord outcomeCodingCollection](self, "outcomeCodingCollection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v21, v22 != 0, (uint64_t)v9, (uint64_t)a5);

        if (!(_DWORD)a5)
          goto LABEL_13;
        objc_msgSend(v8, "firstObject");
        a5 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a5, "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKProcedureRecord _setOutcome:](self, "_setOutcome:", v12);
        goto LABEL_12;
      }
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("complications")))
      {
        -[HKProcedureRecord complicationsCodingCollections](self, "complicationsCodingCollections");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[HKProcedureRecord complicationsCodingCollections](self, "complicationsCodingCollections");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v24, "count"), v9, a5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(a5) = v18 != 0;
          if (v18)
            -[HKProcedureRecord _setComplications:](self, "_setComplications:", v18);
          goto LABEL_22;
        }
      }
      else if (objc_msgSend(v11, "isEqualToString:", CFSTR("followUps")))
      {
        -[HKProcedureRecord followUpsCodingCollections](self, "followUpsCodingCollections");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          -[HKProcedureRecord followUpsCodingCollections](self, "followUpsCodingCollections");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v26, "count"), v9, a5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(a5) = v18 != 0;
          if (v18)
            -[HKProcedureRecord _setFollowUps:](self, "_setFollowUps:", v18);
          goto LABEL_22;
        }
      }
      else
      {
        if (!objc_msgSend(v11, "isEqualToString:", CFSTR("bodySites")))
        {
          v30.receiver = self;
          v30.super_class = (Class)HKProcedureRecord;
          v29 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v30, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
          goto LABEL_39;
        }
        -[HKProcedureRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          -[HKProcedureRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v28, "count"), v9, a5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(a5) = v18 != 0;
          if (v18)
            -[HKProcedureRecord _setBodySites:](self, "_setBodySites:", v18);
          goto LABEL_22;
        }
      }
    }
    v29 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 0, (uint64_t)v9, (uint64_t)a5);
LABEL_39:
    LOBYTE(a5) = v29;
    goto LABEL_13;
  }
  v13 = objc_msgSend(v8, "count");
  -[HKProcedureRecord categoryCodingCollection](self, "categoryCodingCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v13, v14 != 0, (uint64_t)v9, (uint64_t)a5);

  if ((_DWORD)a5)
  {
    objc_msgSend(v8, "firstObject");
    a5 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a5, "object");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKProcedureRecord _setCategory:](self, "_setCategory:", v12);
    goto LABEL_12;
  }
LABEL_13:

  return (char)a5;
}

+ (id)procedureRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 procedureCodingCollection:(id)a14 performers:(id)a15 executionStartDate:(id)a16 executionEndDate:(id)a17 notPerformed:(BOOL)a18 statusCoding:(id)a19 categoryCodingCollection:(id)a20 reasonCodingCollections:(id)a21 reasonsNotPerformedCodingCollections:(id)a22 outcomeCodingCollection:(id)a23 complicationsCodingCollections:(id)a24 followUpsCodingCollections:(id)a25 bodySitesCodingCollections:(id)a26
{
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  __CFString *v36;
  id v37;
  void *v38;
  __CFString *v39;
  void *v40;
  __CFString *v41;
  uint64_t v42;
  void *v43;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _BOOL4 v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;

  v51 = a5;
  v61 = a3;
  v60 = a4;
  v30 = a6;
  v59 = a7;
  v54 = a8;
  v58 = a10;
  v57 = a11;
  v53 = a12;
  v56 = a14;
  v55 = a15;
  v31 = a16;
  v32 = a17;
  v50 = a19;
  v49 = a20;
  v33 = a21;
  v48 = a22;
  v34 = a23;
  v47 = a24;
  v35 = a25;
  v46 = a26;
  v36 = CFSTR("modifiedDate");
  v37 = v30;
  v38 = v37;
  if (v32)
  {
    v39 = CFSTR("executionEndDate");

    objc_msgSend(v32, "dateForUTC");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = v39;
  }
  else
  {
    v40 = v37;
  }
  if (v31)
  {
    v41 = CFSTR("executionStartDate");

    objc_msgSend(v31, "dateForUTC");
    v42 = objc_claimAutoreleasedReturnValue();

    v40 = (void *)v42;
    v36 = v41;
  }
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", v36, v40);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v45) = a18;
  +[HKProcedureRecord procedureRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:procedureCodingCollection:performers:executionStartDate:executionEndDate:notPerformed:statusCoding:categoryCodingCollection:reasonCodingCollections:reasonsNotPerformedCodingCollections:outcomeCodingCollection:complicationsCodingCollections:followUpsCodingCollections:bodySitesCodingCollections:](HKProcedureRecord, "procedureRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:procedureCodingCollection:performers:executionStartDate:executionEndDate:notPerformed:statusCoding:categoryCodingCollection:reasonCodingCollections:reasonsNotPerformedCodingCollections:outcomeCodingCollection:complicationsCodingCollections:followUpsCodingCollections:bodySitesCodingCollections:", v61, v60, v51, v38, v59, v54, a9, v58, v57, v43, v53, a13, v56, v55,
    v31,
    v32,
    v45,
    v50,
    v49,
    v33,
    v48,
    v34,
    v47,
    v35,
    v46);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

+ (id)procedureRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 procedureCodingCollection:(id)a15 performers:(id)a16 executionStartDate:(id)a17 executionEndDate:(id)a18 notPerformed:(BOOL)a19 statusCoding:(id)a20 categoryCodingCollection:(id)a21 reasonCodingCollections:(id)a22 reasonsNotPerformedCodingCollections:(id)a23 outcomeCodingCollection:(id)a24 complicationsCodingCollections:(id)a25 followUpsCodingCollections:(id)a26 bodySitesCodingCollections:(id)a27
{
  uint64_t v28;

  LOBYTE(v28) = a19;
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newProcedureRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:procedureCodingCollection:performers:executionStartDate:executionEndDate:notPerformed:statusCoding:categoryCodingCollection:reasonCodingCollections:reasonsNotPerformedCodingCollections:outcomeCodingCollection:complicationsCodingCollections:followUpsCodingCollections:bodySitesCodingCollections:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14,
                                           a15,
                                           a16,
                                           a17,
                                           a18,
                                           v28,
                                           a20,
                                           a21,
                                           a22,
                                           a23,
                                           a24,
                                           a25,
                                           a26,
                                           a27,
                                           0));
}

+ (id)_newProcedureRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 procedureCodingCollection:(id)a15 performers:(id)a16 executionStartDate:(id)a17 executionEndDate:(id)a18 notPerformed:(BOOL)a19 statusCoding:(id)a20 categoryCodingCollection:(id)a21 reasonCodingCollections:(id)a22 reasonsNotPerformedCodingCollections:(id)a23 outcomeCodingCollection:(id)a24 complicationsCodingCollections:(id)a25 followUpsCodingCollections:(id)a26 bodySitesCodingCollections:(id)a27 config:(id)a28
{
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
  id v45;
  id v46;
  void *v47;
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
  _BOOL4 v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  objc_super v73;
  _QWORD aBlock[4];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  BOOL v88;

  v67 = a5;
  v71 = a15;
  v69 = a16;
  v55 = a17;
  v28 = a18;
  v29 = a20;
  v30 = a21;
  v31 = a22;
  v32 = a23;
  v33 = a24;
  v34 = a25;
  v35 = a26;
  v36 = a27;
  v37 = a28;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __464__HKProcedureRecord__newProcedureRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_procedureCodingCollection_performers_executionStartDate_executionEndDate_notPerformed_statusCoding_categoryCodingCollection_reasonCodingCollections_reasonsNotPerformedCodingCollections_outcomeCodingCollection_complicationsCodingCollections_followUpsCodingCollections_bodySitesCodingCollections_config___block_invoke;
  aBlock[3] = &unk_1E37F75B0;
  v75 = v71;
  v76 = v69;
  v77 = v55;
  v78 = v28;
  v88 = a19;
  v79 = v29;
  v80 = v30;
  v81 = v31;
  v82 = v32;
  v83 = v33;
  v84 = v34;
  v85 = v35;
  v86 = v36;
  v87 = v37;
  v66 = v37;
  v65 = v36;
  v64 = v35;
  v63 = v34;
  v62 = v33;
  v61 = v32;
  v60 = v31;
  v59 = v30;
  v58 = v29;
  v57 = v28;
  v56 = v55;
  v70 = v69;
  v72 = v71;
  v38 = a13;
  v39 = a12;
  v40 = a11;
  v41 = a10;
  v42 = a8;
  v43 = a7;
  v44 = a6;
  v45 = a4;
  v46 = a3;
  v47 = _Block_copy(aBlock);
  v73.receiver = a1;
  v73.super_class = (Class)&OBJC_METACLASS___HKProcedureRecord;
  v68 = objc_msgSendSuper2(&v73, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v46, v45, v67, v44, v43, v42, a9, v41, v40, v39, v38, a14, v47);

  return v68;
}

void __464__HKProcedureRecord__newProcedureRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_procedureCodingCollection_performers_executionStartDate_executionEndDate_notPerformed_statusCoding_categoryCodingCollection_reasonCodingCollections_reasonsNotPerformedCodingCollections_outcomeCodingCollection_complicationsCodingCollections_followUpsCodingCollections_bodySitesCodingCollections_config___block_invoke(uint64_t a1, void *a2)
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
  _QWORD *v28;

  v28 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v28[22];
  v28[22] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v28[23];
  v28[23] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v28[24];
  v28[24] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v28[25];
  v28[25] = v9;

  *((_BYTE *)v28 + 208) = *(_BYTE *)(a1 + 136);
  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v28[27];
  v28[27] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v28[28];
  v28[28] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v16 = (void *)v28[29];
  v28[29] = v15;

  v17 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v18 = (void *)v28[30];
  v28[30] = v17;

  v19 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v20 = (void *)v28[31];
  v28[31] = v19;

  v21 = objc_msgSend(*(id *)(a1 + 104), "copy");
  v22 = (void *)v28[32];
  v28[32] = v21;

  v23 = objc_msgSend(*(id *)(a1 + 112), "copy");
  v24 = (void *)v28[33];
  v28[33] = v23;

  v25 = objc_msgSend(*(id *)(a1 + 120), "copy");
  v26 = (void *)v28[34];
  v28[34] = v25;

  v27 = *(_QWORD *)(a1 + 128);
  if (v27)
    (*(void (**)(uint64_t, _QWORD *))(v27 + 16))(v27, v28);

}

- (HKProcedureRecord)init
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
  v9.super_class = (Class)HKProcedureRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@procedureCodingCollection = %@performers = %@executionStartDate = %@executionEndDate = %@notPerformed = %ldstatusCoding = %@categoryCodingCollection = %@reasonCodingCollections = %@reasonsNotPerformedCodingCollections = %@outcomeCodingCollection = %@complicationsCodingCollections = %@followUpsCodingCollections = %@bodySitesCodingCollections = %@>"), v5, self, v6, self->_procedureCodingCollection, self->_performers, self->_executionStartDate, self->_executionEndDate, self->_notPerformed, self->_statusCoding, self->_categoryCodingCollection, self->_reasonCodingCollections, self->_reasonsNotPerformedCodingCollections, self->_outcomeCodingCollection, self->_complicationsCodingCollections, self->_followUpsCodingCollections, self->_bodySitesCodingCollections);
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
  v5.super_class = (Class)HKProcedureRecord;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_procedureCodingCollection, CFSTR("ProcedureCodingCollection"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_performers, CFSTR("Performers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_executionStartDate, CFSTR("ExecutionStartDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_executionEndDate, CFSTR("ExecutionEndDate"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_notPerformed, CFSTR("NotPerformed"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusCoding, CFSTR("StatusCoding"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_categoryCodingCollection, CFSTR("CategoryCodingCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonCodingCollections, CFSTR("ReasonCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonsNotPerformedCodingCollections, CFSTR("ReasonsNotPerformedCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_outcomeCodingCollection, CFSTR("OutcomeCodingCollection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_complicationsCodingCollections, CFSTR("ComplicationsCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_followUpsCodingCollections, CFSTR("FollowUpsCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodySitesCodingCollections, CFSTR("BodySitesCodingCollections"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_procedure, CFSTR("Procedure"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_category, CFSTR("Category"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reason, CFSTR("Reason"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonsNotPerformed, CFSTR("ReasonsNotPerformed"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_outcome, CFSTR("Outcome"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_complications, CFSTR("Complications"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_followUps, CFSTR("FollowUps"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodySites, CFSTR("BodySites"));

}

- (HKProcedureRecord)initWithCoder:(id)a3
{
  id v4;
  HKProcedureRecord *v5;
  uint64_t v6;
  HKMedicalCodingCollection *procedureCodingCollection;
  void *v8;
  uint64_t v9;
  NSArray *performers;
  uint64_t v11;
  HKMedicalDate *executionStartDate;
  uint64_t v13;
  HKMedicalDate *executionEndDate;
  uint64_t v15;
  HKMedicalCoding *statusCoding;
  uint64_t v17;
  HKMedicalCodingCollection *categoryCodingCollection;
  void *v19;
  uint64_t v20;
  NSArray *reasonCodingCollections;
  void *v22;
  uint64_t v23;
  NSArray *reasonsNotPerformedCodingCollections;
  uint64_t v25;
  HKMedicalCodingCollection *outcomeCodingCollection;
  void *v27;
  uint64_t v28;
  NSArray *complicationsCodingCollections;
  void *v30;
  uint64_t v31;
  NSArray *followUpsCodingCollections;
  void *v33;
  uint64_t v34;
  NSArray *bodySitesCodingCollections;
  uint64_t v36;
  HKConcept *procedure;
  uint64_t v38;
  HKConcept *status;
  uint64_t v40;
  HKConcept *category;
  void *v42;
  uint64_t v43;
  NSArray *reason;
  void *v45;
  uint64_t v46;
  NSArray *reasonsNotPerformed;
  uint64_t v48;
  HKConcept *outcome;
  void *v50;
  uint64_t v51;
  NSArray *complications;
  void *v53;
  uint64_t v54;
  NSArray *followUps;
  void *v56;
  uint64_t v57;
  NSArray *bodySites;
  objc_super v60;

  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)HKProcedureRecord;
  v5 = -[HKMedicalRecord initWithCoder:](&v60, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProcedureCodingCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    procedureCodingCollection = v5->_procedureCodingCollection;
    v5->_procedureCodingCollection = (HKMedicalCodingCollection *)v6;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Performers"));
    v9 = objc_claimAutoreleasedReturnValue();
    performers = v5->_performers;
    v5->_performers = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExecutionStartDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    executionStartDate = v5->_executionStartDate;
    v5->_executionStartDate = (HKMedicalDate *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExecutionEndDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    executionEndDate = v5->_executionEndDate;
    v5->_executionEndDate = (HKMedicalDate *)v13;

    v5->_notPerformed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NotPerformed"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusCoding"));
    v15 = objc_claimAutoreleasedReturnValue();
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CategoryCodingCollection"));
    v17 = objc_claimAutoreleasedReturnValue();
    categoryCodingCollection = v5->_categoryCodingCollection;
    v5->_categoryCodingCollection = (HKMedicalCodingCollection *)v17;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("ReasonCodingCollections"));
    v20 = objc_claimAutoreleasedReturnValue();
    reasonCodingCollections = v5->_reasonCodingCollections;
    v5->_reasonCodingCollections = (NSArray *)v20;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("ReasonsNotPerformedCodingCollections"));
    v23 = objc_claimAutoreleasedReturnValue();
    reasonsNotPerformedCodingCollections = v5->_reasonsNotPerformedCodingCollections;
    v5->_reasonsNotPerformedCodingCollections = (NSArray *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OutcomeCodingCollection"));
    v25 = objc_claimAutoreleasedReturnValue();
    outcomeCodingCollection = v5->_outcomeCodingCollection;
    v5->_outcomeCodingCollection = (HKMedicalCodingCollection *)v25;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("ComplicationsCodingCollections"));
    v28 = objc_claimAutoreleasedReturnValue();
    complicationsCodingCollections = v5->_complicationsCodingCollections;
    v5->_complicationsCodingCollections = (NSArray *)v28;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("FollowUpsCodingCollections"));
    v31 = objc_claimAutoreleasedReturnValue();
    followUpsCodingCollections = v5->_followUpsCodingCollections;
    v5->_followUpsCodingCollections = (NSArray *)v31;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("BodySitesCodingCollections"));
    v34 = objc_claimAutoreleasedReturnValue();
    bodySitesCodingCollections = v5->_bodySitesCodingCollections;
    v5->_bodySitesCodingCollections = (NSArray *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Procedure"));
    v36 = objc_claimAutoreleasedReturnValue();
    procedure = v5->_procedure;
    v5->_procedure = (HKConcept *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Status"));
    v38 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (HKConcept *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Category"));
    v40 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (HKConcept *)v40;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v42, CFSTR("Reason"));
    v43 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSArray *)v43;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("ReasonsNotPerformed"));
    v46 = objc_claimAutoreleasedReturnValue();
    reasonsNotPerformed = v5->_reasonsNotPerformed;
    v5->_reasonsNotPerformed = (NSArray *)v46;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Outcome"));
    v48 = objc_claimAutoreleasedReturnValue();
    outcome = v5->_outcome;
    v5->_outcome = (HKConcept *)v48;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v50, CFSTR("Complications"));
    v51 = objc_claimAutoreleasedReturnValue();
    complications = v5->_complications;
    v5->_complications = (NSArray *)v51;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v53, CFSTR("FollowUps"));
    v54 = objc_claimAutoreleasedReturnValue();
    followUps = v5->_followUps;
    v5->_followUps = (NSArray *)v54;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v56, CFSTR("BodySites"));
    v57 = objc_claimAutoreleasedReturnValue();
    bodySites = v5->_bodySites;
    v5->_bodySites = (NSArray *)v57;

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
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  char v135;
  objc_super v137;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v137.receiver = self;
    v137.super_class = (Class)HKProcedureRecord;
    if (!-[HKMedicalRecord isEquivalent:](&v137, sel_isEquivalent_, v5))
      goto LABEL_110;
    -[HKProcedureRecord procedureCodingCollection](self, "procedureCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "procedureCodingCollection");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "procedureCodingCollection");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_109;
      v10 = (void *)v9;
      -[HKProcedureRecord procedureCodingCollection](self, "procedureCodingCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "procedureCodingCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_110;
    }
    -[HKProcedureRecord performers](self, "performers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performers");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

    }
    else
    {
      v8 = (void *)v15;
      objc_msgSend(v5, "performers");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_109;
      v17 = (void *)v16;
      -[HKProcedureRecord performers](self, "performers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "performers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToArray:", v19);

      if (!v20)
        goto LABEL_110;
    }
    -[HKProcedureRecord executionStartDate](self, "executionStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executionStartDate");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v21)
    {

    }
    else
    {
      v8 = (void *)v21;
      objc_msgSend(v5, "executionStartDate");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_109;
      v23 = (void *)v22;
      -[HKProcedureRecord executionStartDate](self, "executionStartDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "executionStartDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_110;
    }
    -[HKProcedureRecord executionEndDate](self, "executionEndDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executionEndDate");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v27)
    {

    }
    else
    {
      v8 = (void *)v27;
      objc_msgSend(v5, "executionEndDate");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_109;
      v29 = (void *)v28;
      -[HKProcedureRecord executionEndDate](self, "executionEndDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "executionEndDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_110;
    }
    v33 = -[HKProcedureRecord notPerformed](self, "notPerformed");
    if (v33 != objc_msgSend(v5, "notPerformed"))
      goto LABEL_110;
    -[HKProcedureRecord statusCoding](self, "statusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusCoding");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v34)
    {

    }
    else
    {
      v8 = (void *)v34;
      objc_msgSend(v5, "statusCoding");
      v35 = objc_claimAutoreleasedReturnValue();
      if (!v35)
        goto LABEL_109;
      v36 = (void *)v35;
      -[HKProcedureRecord statusCoding](self, "statusCoding");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusCoding");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqual:", v38);

      if (!v39)
        goto LABEL_110;
    }
    -[HKProcedureRecord categoryCodingCollection](self, "categoryCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categoryCodingCollection");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v40)
    {

    }
    else
    {
      v8 = (void *)v40;
      objc_msgSend(v5, "categoryCodingCollection");
      v41 = objc_claimAutoreleasedReturnValue();
      if (!v41)
        goto LABEL_109;
      v42 = (void *)v41;
      -[HKProcedureRecord categoryCodingCollection](self, "categoryCodingCollection");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "categoryCodingCollection");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v43, "isEqual:", v44);

      if (!v45)
        goto LABEL_110;
    }
    -[HKProcedureRecord reasonCodingCollections](self, "reasonCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonCodingCollections");
    v46 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v46)
    {

    }
    else
    {
      v8 = (void *)v46;
      objc_msgSend(v5, "reasonCodingCollections");
      v47 = objc_claimAutoreleasedReturnValue();
      if (!v47)
        goto LABEL_109;
      v48 = (void *)v47;
      -[HKProcedureRecord reasonCodingCollections](self, "reasonCodingCollections");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonCodingCollections");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqualToArray:", v50);

      if (!v51)
        goto LABEL_110;
    }
    -[HKProcedureRecord reasonsNotPerformedCodingCollections](self, "reasonsNotPerformedCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonsNotPerformedCodingCollections");
    v52 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v52)
    {

    }
    else
    {
      v8 = (void *)v52;
      objc_msgSend(v5, "reasonsNotPerformedCodingCollections");
      v53 = objc_claimAutoreleasedReturnValue();
      if (!v53)
        goto LABEL_109;
      v54 = (void *)v53;
      -[HKProcedureRecord reasonsNotPerformedCodingCollections](self, "reasonsNotPerformedCodingCollections");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonsNotPerformedCodingCollections");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v55, "isEqualToArray:", v56);

      if (!v57)
        goto LABEL_110;
    }
    -[HKProcedureRecord outcomeCodingCollection](self, "outcomeCodingCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outcomeCodingCollection");
    v58 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v58)
    {

    }
    else
    {
      v8 = (void *)v58;
      objc_msgSend(v5, "outcomeCodingCollection");
      v59 = objc_claimAutoreleasedReturnValue();
      if (!v59)
        goto LABEL_109;
      v60 = (void *)v59;
      -[HKProcedureRecord outcomeCodingCollection](self, "outcomeCodingCollection");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "outcomeCodingCollection");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v61, "isEqual:", v62);

      if (!v63)
        goto LABEL_110;
    }
    -[HKProcedureRecord complicationsCodingCollections](self, "complicationsCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "complicationsCodingCollections");
    v64 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v64)
    {

    }
    else
    {
      v8 = (void *)v64;
      objc_msgSend(v5, "complicationsCodingCollections");
      v65 = objc_claimAutoreleasedReturnValue();
      if (!v65)
        goto LABEL_109;
      v66 = (void *)v65;
      -[HKProcedureRecord complicationsCodingCollections](self, "complicationsCodingCollections");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "complicationsCodingCollections");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v67, "isEqualToArray:", v68);

      if (!v69)
        goto LABEL_110;
    }
    -[HKProcedureRecord followUpsCodingCollections](self, "followUpsCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "followUpsCodingCollections");
    v70 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v70)
    {

    }
    else
    {
      v8 = (void *)v70;
      objc_msgSend(v5, "followUpsCodingCollections");
      v71 = objc_claimAutoreleasedReturnValue();
      if (!v71)
        goto LABEL_109;
      v72 = (void *)v71;
      -[HKProcedureRecord followUpsCodingCollections](self, "followUpsCodingCollections");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "followUpsCodingCollections");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v73, "isEqualToArray:", v74);

      if (!v75)
        goto LABEL_110;
    }
    -[HKProcedureRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bodySitesCodingCollections");
    v76 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v76)
    {

    }
    else
    {
      v8 = (void *)v76;
      objc_msgSend(v5, "bodySitesCodingCollections");
      v77 = objc_claimAutoreleasedReturnValue();
      if (!v77)
        goto LABEL_109;
      v78 = (void *)v77;
      -[HKProcedureRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bodySitesCodingCollections");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v79, "isEqualToArray:", v80);

      if (!v81)
        goto LABEL_110;
    }
    -[HKProcedureRecord procedure](self, "procedure");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "procedure");
    v82 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v82)
    {

    }
    else
    {
      v8 = (void *)v82;
      objc_msgSend(v5, "procedure");
      v83 = objc_claimAutoreleasedReturnValue();
      if (!v83)
        goto LABEL_109;
      v84 = (void *)v83;
      -[HKProcedureRecord procedure](self, "procedure");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "procedure");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = objc_msgSend(v85, "isEqual:", v86);

      if (!v87)
        goto LABEL_110;
    }
    -[HKProcedureRecord status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "status");
    v88 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v88)
    {

    }
    else
    {
      v8 = (void *)v88;
      objc_msgSend(v5, "status");
      v89 = objc_claimAutoreleasedReturnValue();
      if (!v89)
        goto LABEL_109;
      v90 = (void *)v89;
      -[HKProcedureRecord status](self, "status");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "status");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v91, "isEqual:", v92);

      if (!v93)
        goto LABEL_110;
    }
    -[HKProcedureRecord category](self, "category");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "category");
    v94 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v94)
    {

    }
    else
    {
      v8 = (void *)v94;
      objc_msgSend(v5, "category");
      v95 = objc_claimAutoreleasedReturnValue();
      if (!v95)
        goto LABEL_109;
      v96 = (void *)v95;
      -[HKProcedureRecord category](self, "category");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "category");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v97, "isEqual:", v98);

      if (!v99)
        goto LABEL_110;
    }
    -[HKProcedureRecord reason](self, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reason");
    v100 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v100)
    {

    }
    else
    {
      v8 = (void *)v100;
      objc_msgSend(v5, "reason");
      v101 = objc_claimAutoreleasedReturnValue();
      if (!v101)
        goto LABEL_109;
      v102 = (void *)v101;
      -[HKProcedureRecord reason](self, "reason");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reason");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend(v103, "isEqualToArray:", v104);

      if (!v105)
        goto LABEL_110;
    }
    -[HKProcedureRecord reasonsNotPerformed](self, "reasonsNotPerformed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonsNotPerformed");
    v106 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v106)
    {

    }
    else
    {
      v8 = (void *)v106;
      objc_msgSend(v5, "reasonsNotPerformed");
      v107 = objc_claimAutoreleasedReturnValue();
      if (!v107)
        goto LABEL_109;
      v108 = (void *)v107;
      -[HKProcedureRecord reasonsNotPerformed](self, "reasonsNotPerformed");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonsNotPerformed");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = objc_msgSend(v109, "isEqualToArray:", v110);

      if (!v111)
        goto LABEL_110;
    }
    -[HKProcedureRecord outcome](self, "outcome");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outcome");
    v112 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v112)
    {

    }
    else
    {
      v8 = (void *)v112;
      objc_msgSend(v5, "outcome");
      v113 = objc_claimAutoreleasedReturnValue();
      if (!v113)
        goto LABEL_109;
      v114 = (void *)v113;
      -[HKProcedureRecord outcome](self, "outcome");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "outcome");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v115, "isEqual:", v116);

      if (!v117)
        goto LABEL_110;
    }
    -[HKProcedureRecord complications](self, "complications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "complications");
    v118 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v118)
    {

    }
    else
    {
      v8 = (void *)v118;
      objc_msgSend(v5, "complications");
      v119 = objc_claimAutoreleasedReturnValue();
      if (!v119)
        goto LABEL_109;
      v120 = (void *)v119;
      -[HKProcedureRecord complications](self, "complications");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "complications");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = objc_msgSend(v121, "isEqualToArray:", v122);

      if (!v123)
        goto LABEL_110;
    }
    -[HKProcedureRecord followUps](self, "followUps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "followUps");
    v124 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v124)
    {

    }
    else
    {
      v8 = (void *)v124;
      objc_msgSend(v5, "followUps");
      v125 = objc_claimAutoreleasedReturnValue();
      if (!v125)
        goto LABEL_109;
      v126 = (void *)v125;
      -[HKProcedureRecord followUps](self, "followUps");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "followUps");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = objc_msgSend(v127, "isEqualToArray:", v128);

      if (!v129)
        goto LABEL_110;
    }
    -[HKProcedureRecord bodySites](self, "bodySites");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bodySites");
    v130 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v130)
    {

LABEL_114:
      v14 = 1;
      goto LABEL_111;
    }
    v8 = (void *)v130;
    objc_msgSend(v5, "bodySites");
    v131 = objc_claimAutoreleasedReturnValue();
    if (v131)
    {
      v132 = (void *)v131;
      -[HKProcedureRecord bodySites](self, "bodySites");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bodySites");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = objc_msgSend(v133, "isEqualToArray:", v134);

      if ((v135 & 1) != 0)
        goto LABEL_114;
LABEL_110:
      v14 = 0;
LABEL_111:

      goto LABEL_112;
    }
LABEL_109:

    goto LABEL_110;
  }
  v14 = 0;
LABEL_112:

  return v14;
}

- (id)statusCodingCollection
{
  void *v2;
  void *v3;

  -[HKProcedureRecord statusCoding](self, "statusCoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HKMedicalCodingCollection)procedureCodingCollection
{
  return self->_procedureCodingCollection;
}

- (void)_setProcedureCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *procedureCodingCollection;
  HKConcept *v6;
  HKConcept *procedure;
  id v8;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  procedureCodingCollection = self->_procedureCodingCollection;
  self->_procedureCodingCollection = v4;

  -[HKProcedureRecord procedureCodingCollection](self, "procedureCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  procedure = self->_procedure;
  self->_procedure = v6;

}

- (NSArray)performers
{
  return self->_performers;
}

- (void)_setPerformers:(id)a3
{
  NSArray *v4;
  NSArray *performers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  performers = self->_performers;
  self->_performers = v4;

}

- (HKMedicalDate)executionStartDate
{
  return self->_executionStartDate;
}

- (void)_setExecutionStartDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *executionStartDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  executionStartDate = self->_executionStartDate;
  self->_executionStartDate = v4;

}

- (HKMedicalDate)executionEndDate
{
  return self->_executionEndDate;
}

- (void)_setExecutionEndDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *executionEndDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  executionEndDate = self->_executionEndDate;
  self->_executionEndDate = v4;

}

- (BOOL)notPerformed
{
  return self->_notPerformed;
}

- (void)_setNotPerformed:(BOOL)a3
{
  self->_notPerformed = a3;
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

  -[HKProcedureRecord statusCodingCollection](self, "statusCodingCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  status = self->_status;
  self->_status = v6;

}

- (HKMedicalCodingCollection)categoryCodingCollection
{
  return self->_categoryCodingCollection;
}

- (void)_setCategoryCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *categoryCodingCollection;
  HKConcept *v6;
  HKConcept *category;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  categoryCodingCollection = self->_categoryCodingCollection;
  self->_categoryCodingCollection = v4;

  if (self->_categoryCodingCollection)
  {
    -[HKProcedureRecord categoryCodingCollection](self, "categoryCodingCollection");
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

- (NSArray)reasonCodingCollections
{
  return self->_reasonCodingCollections;
}

- (void)_setReasonCodingCollections:(id)a3
{
  NSArray *v4;
  NSArray *reasonCodingCollections;
  NSArray *v6;
  NSArray *reason;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasonCodingCollections = self->_reasonCodingCollections;
  self->_reasonCodingCollections = v4;

  if (self->_reasonCodingCollections)
  {
    -[HKProcedureRecord reasonCodingCollections](self, "reasonCodingCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_128);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    reason = self->_reason;
    self->_reason = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_reason;
    self->_reason = 0;
  }

}

id __49__HKProcedureRecord__setReasonCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (NSArray)reasonsNotPerformedCodingCollections
{
  return self->_reasonsNotPerformedCodingCollections;
}

- (void)_setReasonsNotPerformedCodingCollections:(id)a3
{
  NSArray *v4;
  NSArray *reasonsNotPerformedCodingCollections;
  NSArray *v6;
  NSArray *reasonsNotPerformed;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasonsNotPerformedCodingCollections = self->_reasonsNotPerformedCodingCollections;
  self->_reasonsNotPerformedCodingCollections = v4;

  if (self->_reasonsNotPerformedCodingCollections)
  {
    -[HKProcedureRecord reasonsNotPerformedCodingCollections](self, "reasonsNotPerformedCodingCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_113_0);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    reasonsNotPerformed = self->_reasonsNotPerformed;
    self->_reasonsNotPerformed = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_reasonsNotPerformed;
    self->_reasonsNotPerformed = 0;
  }

}

id __62__HKProcedureRecord__setReasonsNotPerformedCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (HKMedicalCodingCollection)outcomeCodingCollection
{
  return self->_outcomeCodingCollection;
}

- (void)_setOutcomeCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *outcomeCodingCollection;
  HKConcept *v6;
  HKConcept *outcome;
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  outcomeCodingCollection = self->_outcomeCodingCollection;
  self->_outcomeCodingCollection = v4;

  if (self->_outcomeCodingCollection)
  {
    -[HKProcedureRecord outcomeCodingCollection](self, "outcomeCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    outcome = self->_outcome;
    self->_outcome = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_outcome;
    self->_outcome = 0;
  }

}

- (NSArray)complicationsCodingCollections
{
  return self->_complicationsCodingCollections;
}

- (void)_setComplicationsCodingCollections:(id)a3
{
  NSArray *v4;
  NSArray *complicationsCodingCollections;
  NSArray *v6;
  NSArray *complications;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  complicationsCodingCollections = self->_complicationsCodingCollections;
  self->_complicationsCodingCollections = v4;

  if (self->_complicationsCodingCollections)
  {
    -[HKProcedureRecord complicationsCodingCollections](self, "complicationsCodingCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_114);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    complications = self->_complications;
    self->_complications = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_complications;
    self->_complications = 0;
  }

}

id __56__HKProcedureRecord__setComplicationsCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (NSArray)followUpsCodingCollections
{
  return self->_followUpsCodingCollections;
}

- (void)_setFollowUpsCodingCollections:(id)a3
{
  NSArray *v4;
  NSArray *followUpsCodingCollections;
  NSArray *v6;
  NSArray *followUps;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  followUpsCodingCollections = self->_followUpsCodingCollections;
  self->_followUpsCodingCollections = v4;

  if (self->_followUpsCodingCollections)
  {
    -[HKProcedureRecord followUpsCodingCollections](self, "followUpsCodingCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_115_0);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    followUps = self->_followUps;
    self->_followUps = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_followUps;
    self->_followUps = 0;
  }

}

id __52__HKProcedureRecord__setFollowUpsCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
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
    -[HKProcedureRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_116_0);
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

id __52__HKProcedureRecord__setBodySitesCodingCollections___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (HKConcept)procedure
{
  HKConcept *procedure;
  HKConcept *v3;
  void *v4;

  procedure = self->_procedure;
  if (procedure)
  {
    v3 = procedure;
  }
  else
  {
    -[HKProcedureRecord procedureCodingCollection](self, "procedureCodingCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setProcedure:(id)a3
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
  HKConcept *procedure;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKProcedureRecord _setProcedure:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  procedure = self->_procedure;
  self->_procedure = v13;

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
    -[HKProcedureRecord statusCodingCollection](self, "statusCodingCollection");
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
      -[HKProcedureRecord _setStatus:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = (HKConcept *)objc_msgSend(v4, "copy");
  status = self->_status;
  self->_status = v13;

}

- (HKConcept)category
{
  HKConcept *category;
  HKConcept *v3;
  void *v4;

  if (self->_categoryCodingCollection)
  {
    category = self->_category;
    if (category)
    {
      v3 = category;
    }
    else
    {
      -[HKProcedureRecord categoryCodingCollection](self, "categoryCodingCollection");
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

- (NSArray)reason
{
  NSArray *reason;
  NSArray *v3;
  void *v4;

  if (self->_reasonCodingCollections)
  {
    reason = self->_reason;
    if (reason)
    {
      v3 = reason;
    }
    else
    {
      -[HKProcedureRecord reasonCodingCollections](self, "reasonCodingCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_117_0);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __27__HKProcedureRecord_reason__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setReason:(id)a3
{
  NSArray *v4;
  NSArray *reason;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reason = self->_reason;
  self->_reason = v4;

}

- (NSArray)reasonsNotPerformed
{
  NSArray *reasonsNotPerformed;
  NSArray *v3;
  void *v4;

  if (self->_reasonsNotPerformedCodingCollections)
  {
    reasonsNotPerformed = self->_reasonsNotPerformed;
    if (reasonsNotPerformed)
    {
      v3 = reasonsNotPerformed;
    }
    else
    {
      -[HKProcedureRecord reasonsNotPerformedCodingCollections](self, "reasonsNotPerformedCodingCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_118_0);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __40__HKProcedureRecord_reasonsNotPerformed__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setReasonsNotPerformed:(id)a3
{
  NSArray *v4;
  NSArray *reasonsNotPerformed;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasonsNotPerformed = self->_reasonsNotPerformed;
  self->_reasonsNotPerformed = v4;

}

- (HKConcept)outcome
{
  HKConcept *outcome;
  HKConcept *v3;
  void *v4;

  if (self->_outcomeCodingCollection)
  {
    outcome = self->_outcome;
    if (outcome)
    {
      v3 = outcome;
    }
    else
    {
      -[HKProcedureRecord outcomeCodingCollection](self, "outcomeCodingCollection");
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

- (void)_setOutcome:(id)a3
{
  HKConcept *v4;
  HKConcept *outcome;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  outcome = self->_outcome;
  self->_outcome = v4;

}

- (NSArray)complications
{
  NSArray *complications;
  NSArray *v3;
  void *v4;

  if (self->_complicationsCodingCollections)
  {
    complications = self->_complications;
    if (complications)
    {
      v3 = complications;
    }
    else
    {
      -[HKProcedureRecord complicationsCodingCollections](self, "complicationsCodingCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_119);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __34__HKProcedureRecord_complications__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setComplications:(id)a3
{
  NSArray *v4;
  NSArray *complications;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  complications = self->_complications;
  self->_complications = v4;

}

- (NSArray)followUps
{
  NSArray *followUps;
  NSArray *v3;
  void *v4;

  if (self->_followUpsCodingCollections)
  {
    followUps = self->_followUps;
    if (followUps)
    {
      v3 = followUps;
    }
    else
    {
      -[HKProcedureRecord followUpsCodingCollections](self, "followUpsCodingCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_120_0);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __30__HKProcedureRecord_followUps__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setFollowUps:(id)a3
{
  NSArray *v4;
  NSArray *followUps;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  followUps = self->_followUps;
  self->_followUps = v4;

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
      -[HKProcedureRecord bodySitesCodingCollections](self, "bodySitesCodingCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_121_0);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __30__HKProcedureRecord_bodySites__block_invoke(uint64_t a1, uint64_t a2)
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
  v13.super_class = (Class)HKProcedureRecord;
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
  if (!self->_procedureCodingCollection)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: procedureCodingCollection must not be nil");
LABEL_8:
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11, self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!self->_statusCoding)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: statusCoding must not be nil");
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
  objc_storeStrong((id *)&self->_followUps, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_reasonsNotPerformed, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_procedure, 0);
  objc_storeStrong((id *)&self->_bodySitesCodingCollections, 0);
  objc_storeStrong((id *)&self->_followUpsCodingCollections, 0);
  objc_storeStrong((id *)&self->_complicationsCodingCollections, 0);
  objc_storeStrong((id *)&self->_outcomeCodingCollection, 0);
  objc_storeStrong((id *)&self->_reasonsNotPerformedCodingCollections, 0);
  objc_storeStrong((id *)&self->_reasonCodingCollections, 0);
  objc_storeStrong((id *)&self->_categoryCodingCollection, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_executionEndDate, 0);
  objc_storeStrong((id *)&self->_executionStartDate, 0);
  objc_storeStrong((id *)&self->_performers, 0);
  objc_storeStrong((id *)&self->_procedureCodingCollection, 0);
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

- (void)_setProcedure:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property procedure for record type HKProcedureRecord.", a5, a6, a7, a8, 0);
}

- (void)_setStatus:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_19A0E6000, a1, a3, "Unexpectedly found nil while setting a concept property status for record type HKProcedureRecord.", a5, a6, a7, a8, 0);
}

@end
