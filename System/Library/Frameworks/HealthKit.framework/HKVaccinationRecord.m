@implementation HKVaccinationRecord

+ (id)defaultDisplayString
{
  void *v2;
  void *v3;

  HKHealthKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNSPECIFIED_VACCINATION"), &stru_1E37FD4C0, CFSTR("Localizable-Clinical-Health-Records"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)indexableConceptKeyPaths
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HKVaccinationRecord;
  objc_msgSendSuper2(&v5, sel_indexableConceptKeyPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "addObject:", CFSTR("vaccination"));
  objc_msgSend(v3, "addObject:", CFSTR("bodySite"));
  objc_msgSend(v3, "addObject:", CFSTR("status"));
  objc_msgSend(v3, "addObject:", CFSTR("route"));
  objc_msgSend(v3, "addObject:", CFSTR("reasons"));
  objc_msgSend(v3, "addObject:", CFSTR("reasonsNotGiven"));
  return v3;
}

+ (id)cachedConceptRelationshipKeyPaths
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___HKVaccinationRecord;
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
  void **v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("vaccination")))
    {
      -[HKVaccinationRecord vaccinationCodings](self, "vaccinationCodings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v11;
      v12 = (void *)MEMORY[0x1E0C99D20];
      v13 = (void **)v26;
LABEL_14:
      objc_msgSend(v12, "arrayWithObjects:count:", v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
      goto LABEL_16;
    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("bodySite")))
    {
      -[HKVaccinationRecord bodySiteCodings](self, "bodySiteCodings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[HKVaccinationRecord bodySiteCodings](self, "bodySiteCodings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v11;
        v12 = (void *)MEMORY[0x1E0C99D20];
        v13 = &v25;
        goto LABEL_14;
      }
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("status")))
    {
      -[HKVaccinationRecord statusCoding](self, "statusCoding");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[HKVaccinationRecord statusCoding](self, "statusCoding");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v11;
        v12 = (void *)MEMORY[0x1E0C99D20];
        v13 = &v24;
        goto LABEL_14;
      }
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("route")))
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("reasons")))
        {
          -[HKVaccinationRecord reasonsCodings](self, "reasonsCodings");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
            goto LABEL_24;
          -[HKVaccinationRecord reasonsCodingsCollections](self, "reasonsCodingsCollections");
          v20 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v8, "isEqualToString:", CFSTR("reasonsNotGiven")))
          {
            v22.receiver = self;
            v22.super_class = (Class)HKVaccinationRecord;
            -[HKMedicalRecord codingsForKeyPath:error:](&v22, sel_codingsForKeyPath_error_, v6, a4);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
          -[HKVaccinationRecord reasonsNotGivenCodings](self, "reasonsNotGivenCodings");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
            goto LABEL_24;
          -[HKVaccinationRecord reasonsNotGivenCodingsCollections](self, "reasonsNotGivenCodingsCollections");
          v20 = objc_claimAutoreleasedReturnValue();
        }
        v9 = (void *)v20;
        +[HKConceptIndexUtilities indexedCodingsForCodingCollections:context:error:](HKConceptIndexUtilities, "indexedCodingsForCodingCollections:context:error:", v20, v6, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      -[HKVaccinationRecord routeCodings](self, "routeCodings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[HKVaccinationRecord routeCodings](self, "routeCodings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v11;
        v12 = (void *)MEMORY[0x1E0C99D20];
        v13 = &v23;
        goto LABEL_14;
      }
    }
LABEL_24:
    v14 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_16;
  }
  v14 = 0;
LABEL_16:

  return v14;
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  +[HKConceptIndexUtilities firstComponentForKeyPath:error:](HKConceptIndexUtilities, "firstComponentForKeyPath:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
LABEL_5:
    LOBYTE(a5) = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("vaccination")))
  {
    if (HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 1, (uint64_t)v9, (uint64_t)a5))
    {
      objc_msgSend(v8, "firstObject");
      a5 = (id *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a5, "object");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKVaccinationRecord _setVaccination:](self, "_setVaccination:", v12);
LABEL_15:

      LOBYTE(a5) = 1;
      goto LABEL_16;
    }
    goto LABEL_5;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("bodySite")))
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("status")))
    {
      v15 = objc_msgSend(v8, "count");
      -[HKVaccinationRecord statusCoding](self, "statusCoding");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v15, v16 != 0, (uint64_t)v9, (uint64_t)a5);

      if ((_DWORD)a5)
      {
        objc_msgSend(v8, "firstObject");
        a5 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a5, "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKVaccinationRecord _setStatus:](self, "_setStatus:", v12);
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("route")))
    {
      v17 = objc_msgSend(v8, "count");
      -[HKVaccinationRecord routeCodings](self, "routeCodings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v17, v18 != 0, (uint64_t)v9, (uint64_t)a5);

      if ((_DWORD)a5)
      {
        objc_msgSend(v8, "firstObject");
        a5 = (id *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a5, "object");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKVaccinationRecord _setRoute:](self, "_setRoute:", v12);
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("reasons")))
    {
      -[HKVaccinationRecord reasonsCodings](self, "reasonsCodings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[HKVaccinationRecord reasonsCodings](self, "reasonsCodings");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v21, "count"), v9, a5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(a5) = v22 != 0;
        if (v22)
          -[HKVaccinationRecord _setReasons:](self, "_setReasons:", v22);
LABEL_25:

        goto LABEL_16;
      }
    }
    else
    {
      if (!objc_msgSend(v11, "isEqualToString:", CFSTR("reasonsNotGiven")))
      {
        v26.receiver = self;
        v26.super_class = (Class)HKVaccinationRecord;
        v25 = -[HKMedicalRecord applyConcepts:forKeyPath:error:](&v26, sel_applyConcepts_forKeyPath_error_, v8, v9, a5);
        goto LABEL_28;
      }
      -[HKVaccinationRecord reasonsNotGivenCodings](self, "reasonsNotGivenCodings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[HKVaccinationRecord reasonsNotGivenCodings](self, "reasonsNotGivenCodings");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKConceptIndexUtilities conceptsForIndexedConcepts:expectedCount:context:error:](HKConceptIndexUtilities, "conceptsForIndexedConcepts:expectedCount:context:error:", v8, objc_msgSend(v24, "count"), v9, a5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(a5) = v22 != 0;
        if (v22)
          -[HKVaccinationRecord _setReasonsNotGiven:](self, "_setReasonsNotGiven:", v22);
        goto LABEL_25;
      }
    }
    v25 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v8, "count"), 0, (uint64_t)v9, (uint64_t)a5);
LABEL_28:
    LOBYTE(a5) = v25;
    goto LABEL_16;
  }
  v13 = objc_msgSend(v8, "count");
  -[HKVaccinationRecord bodySiteCodings](self, "bodySiteCodings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = HKIndexableObjectCheckCardinalityForIndexRestore(v13, v14 != 0, (uint64_t)v9, (uint64_t)a5);

  if ((_DWORD)a5)
  {
    objc_msgSend(v8, "firstObject");
    a5 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a5, "object");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKVaccinationRecord _setBodySite:](self, "_setBodySite:", v12);
    goto LABEL_15;
  }
LABEL_16:

  return (char)a5;
}

- (int64_t)recordCategoryType
{
  return 6;
}

+ (BOOL)groupsByUserDomainConcept
{
  return 1;
}

+ (id)vaccinationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 country:(id)a12 state:(unint64_t)a13 vaccinationCodings:(id)a14 expirationDate:(id)a15 doseNumber:(id)a16 doseQuantity:(id)a17 lotNumber:(id)a18 performer:(id)a19 bodySiteCodings:(id)a20 reaction:(id)a21 notGiven:(BOOL)a22 administrationDate:(id)a23 statusCoding:(id)a24 patientReported:(BOOL)a25 routeCodings:(id)a26 reasonsCodings:(id)a27 reasonsNotGivenCodings:(id)a28
{
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v40;
  id v41;
  id v43;
  id v44;
  void *v46;
  void *v48;
  _BOOL4 v49;
  void *v50;
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
  v44 = a28;
  v28 = a27;
  v41 = a26;
  v29 = a24;
  v30 = a23;
  v38 = a21;
  v37 = a20;
  v36 = a19;
  v60 = a18;
  v59 = a17;
  v56 = a16;
  v54 = a15;
  v58 = a14;
  v57 = a12;
  v55 = a11;
  v53 = a10;
  v40 = a8;
  v52 = a7;
  v31 = a6;
  v43 = a4;
  v32 = a3;
  objc_msgSend(v30, "dateForUTC");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSemanticDate semanticDateWithKeyPath:date:](HKSemanticDate, "semanticDateWithKeyPath:date:", CFSTR("administrationDate"), v48);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v35) = a25;
  LOBYTE(v34) = a22;
  +[HKVaccinationRecord vaccinationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:vaccinationCodings:expirationDate:doseNumber:doseQuantity:lotNumber:performer:bodySiteCodings:reaction:notGiven:administrationDate:statusCoding:patientReported:routeCodings:reasonsCodings:reasonsNotGivenCodings:](HKVaccinationRecord, "vaccinationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:vaccinationCodings:expirationDate:doseNumber:doseQuantity:lotNumber:performer:bodySiteCodings:reaction:notGiven:administrationDate:statusCoding:patientReported:routeCodings:reasonsCodings:reasonsNotGivenCodings:", v32, v43, v49, v31, v52, v40, a9, v53, v55, v46, v57, a13, v58, v54, v56,
    v59,
    v60,
    v36,
    v37,
    v38,
    v34,
    v30,
    v29,
    v35,
    v41,
    v28,
    v44);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

+ (id)vaccinationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 vaccinationCodings:(id)a15 expirationDate:(id)a16 doseNumber:(id)a17 doseQuantity:(id)a18 lotNumber:(id)a19 performer:(id)a20 bodySiteCodings:(id)a21 reaction:(id)a22 notGiven:(BOOL)a23 administrationDate:(id)a24 statusCoding:(id)a25 patientReported:(BOOL)a26 routeCodings:(id)a27 reasonsCodings:(id)a28 reasonsNotGivenCodings:(id)a29
{
  uint64_t v30;
  uint64_t v31;

  LOBYTE(v31) = a26;
  LOBYTE(v30) = a23;
  return objc_autoreleaseReturnValue((id)objc_msgSend(a1, "_newVaccinationRecordWithType:note:enteredInError:modifiedDate:originIdentifier:locale:extractionVersion:device:metadata:sortDate:country:state:vaccinationCodings:expirationDate:doseNumber:doseQuantity:lotNumber:performer:bodySiteCodings:reaction:notGiven:administrationDate:statusCoding:patientReported:routeCodings:reasonsCodings:reasonsNotGivenCodings:config:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15,
                                           a16,
                                           a17,
                                           a18,
                                           a19,
                                           a20,
                                           a21,
                                           a22,
                                           v30,
                                           a24,
                                           a25,
                                           v31,
                                           a27,
                                           a28,
                                           a29,
                                           0));
}

+ (id)_newVaccinationRecordWithType:(id)a3 note:(id)a4 enteredInError:(BOOL)a5 modifiedDate:(id)a6 originIdentifier:(id)a7 locale:(id)a8 extractionVersion:(int64_t)a9 device:(id)a10 metadata:(id)a11 sortDate:(id)a12 country:(id)a13 state:(unint64_t)a14 vaccinationCodings:(id)a15 expirationDate:(id)a16 doseNumber:(id)a17 doseQuantity:(id)a18 lotNumber:(id)a19 performer:(id)a20 bodySiteCodings:(id)a21 reaction:(id)a22 notGiven:(BOOL)a23 administrationDate:(id)a24 statusCoding:(id)a25 patientReported:(BOOL)a26 routeCodings:(id)a27 reasonsCodings:(id)a28 reasonsNotGivenCodings:(id)a29 config:(id)a30
{
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
  id v49;
  void *v50;
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
  id v68;
  _BOOL4 v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  objc_super v77;
  _QWORD aBlock[4];
  id v79;
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
  BOOL v93;
  BOOL v94;

  v69 = a5;
  v75 = a15;
  v73 = a16;
  v71 = a17;
  v30 = a18;
  v31 = a19;
  v32 = a20;
  v33 = a21;
  v34 = a22;
  v35 = a24;
  v36 = a25;
  v37 = a27;
  v38 = a28;
  v39 = a29;
  v40 = a30;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __385__HKVaccinationRecord__newVaccinationRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_vaccinationCodings_expirationDate_doseNumber_doseQuantity_lotNumber_performer_bodySiteCodings_reaction_notGiven_administrationDate_statusCoding_patientReported_routeCodings_reasonsCodings_reasonsNotGivenCodings_config___block_invoke;
  aBlock[3] = &unk_1E37F7C98;
  v79 = v75;
  v80 = v73;
  v81 = v71;
  v82 = v30;
  v83 = v31;
  v84 = v32;
  v85 = v33;
  v86 = v34;
  v93 = a23;
  v87 = v35;
  v88 = v36;
  v94 = a26;
  v89 = v37;
  v90 = v38;
  v91 = v39;
  v92 = v40;
  v68 = v40;
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
  v72 = v71;
  v74 = v73;
  v76 = v75;
  v41 = a13;
  v42 = a12;
  v43 = a11;
  v44 = a10;
  v45 = a8;
  v46 = a7;
  v47 = a6;
  v48 = a4;
  v49 = a3;
  v50 = _Block_copy(aBlock);
  v77.receiver = a1;
  v77.super_class = (Class)&OBJC_METACLASS___HKVaccinationRecord;
  v70 = objc_msgSendSuper2(&v77, sel__newMedicalRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_config_, v49, v48, v69, v47, v46, v45, a9, v44, v43, v42, v41, a14, v50);

  return v70;
}

void __385__HKVaccinationRecord__newVaccinationRecordWithType_note_enteredInError_modifiedDate_originIdentifier_locale_extractionVersion_device_metadata_sortDate_country_state_vaccinationCodings_expirationDate_doseNumber_doseQuantity_lotNumber_performer_bodySiteCodings_reaction_notGiven_administrationDate_statusCoding_patientReported_routeCodings_reasonsCodings_reasonsNotGivenCodings_config___block_invoke(uint64_t a1, void *a2)
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
  _QWORD *v30;

  v30 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)v30[22];
  v30[22] = v3;

  v5 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v6 = (void *)v30[23];
  v30[23] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v8 = (void *)v30[24];
  v30[24] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v10 = (void *)v30[25];
  v30[25] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v12 = (void *)v30[26];
  v30[26] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v14 = (void *)v30[27];
  v30[27] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v16 = (void *)v30[28];
  v30[28] = v15;

  v17 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v18 = (void *)v30[29];
  v30[29] = v17;

  *((_BYTE *)v30 + 240) = *(_BYTE *)(a1 + 144);
  v19 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v20 = (void *)v30[31];
  v30[31] = v19;

  v21 = objc_msgSend(*(id *)(a1 + 104), "copy");
  v22 = (void *)v30[32];
  v30[32] = v21;

  *((_BYTE *)v30 + 264) = *(_BYTE *)(a1 + 145);
  v23 = objc_msgSend(*(id *)(a1 + 112), "copy");
  v24 = (void *)v30[34];
  v30[34] = v23;

  v25 = objc_msgSend(*(id *)(a1 + 120), "copy");
  v26 = (void *)v30[35];
  v30[35] = v25;

  v27 = objc_msgSend(*(id *)(a1 + 128), "copy");
  v28 = (void *)v30[36];
  v30[36] = v27;

  v29 = *(_QWORD *)(a1 + 136);
  if (v29)
    (*(void (**)(uint64_t, _QWORD *))(v29 + 16))(v29, v30);

}

- (HKVaccinationRecord)init
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
  v9.super_class = (Class)HKVaccinationRecord;
  -[HKSample description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p super=%@vaccinationCodings = %@expirationDate = %@doseNumber = %@doseQuantity = %@lotNumber = %@performer = %@bodySiteCodings = %@reaction = %@notGiven = %ldadministrationDate = %@statusCoding = %@patientReported = %ldrouteCodings = %@reasonsCodings = %@reasonsNotGivenCodings = %@>"), v5, self, v6, self->_vaccinationCodings, self->_expirationDate, self->_doseNumber, self->_doseQuantity, self->_lotNumber, self->_performer, self->_bodySiteCodings, self->_reaction, self->_notGiven, self->_administrationDate, self->_statusCoding, self->_patientReported, self->_routeCodings,
    self->_reasonsCodings,
    self->_reasonsNotGivenCodings);
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
  v5.super_class = (Class)HKVaccinationRecord;
  v4 = a3;
  -[HKMedicalRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_vaccinationCodings, CFSTR("VaccinationCodings"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, CFSTR("ExpirationDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_doseNumber, CFSTR("DoseNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_doseQuantity, CFSTR("DoseQuantity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lotNumber, CFSTR("LotNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_performer, CFSTR("Performer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodySiteCodings, CFSTR("BodySiteCodings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reaction, CFSTR("Reaction"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_notGiven, CFSTR("NotGiven"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_administrationDate, CFSTR("AdministrationDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_statusCoding, CFSTR("StatusCoding"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_patientReported, CFSTR("PatientReported"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeCodings, CFSTR("RouteCodings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonsCodings, CFSTR("ReasonsCodings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonsNotGivenCodings, CFSTR("ReasonsNotGivenCodings"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_vaccination, CFSTR("Vaccination"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bodySite, CFSTR("BodySite"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_status, CFSTR("Status"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_route, CFSTR("Route"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasons, CFSTR("Reasons"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_reasonsNotGiven, CFSTR("ReasonsNotGiven"));

}

- (HKVaccinationRecord)initWithCoder:(id)a3
{
  id v4;
  HKVaccinationRecord *v5;
  void *v6;
  uint64_t v7;
  NSArray *vaccinationCodings;
  uint64_t v9;
  HKMedicalDate *expirationDate;
  uint64_t v11;
  NSString *doseNumber;
  uint64_t v13;
  NSString *doseQuantity;
  uint64_t v15;
  NSString *lotNumber;
  uint64_t v17;
  NSString *performer;
  void *v19;
  uint64_t v20;
  NSArray *bodySiteCodings;
  uint64_t v22;
  NSString *reaction;
  uint64_t v24;
  HKMedicalDate *administrationDate;
  uint64_t v26;
  HKMedicalCoding *statusCoding;
  void *v28;
  uint64_t v29;
  NSArray *routeCodings;
  void *v31;
  uint64_t v32;
  NSArray *reasonsCodings;
  void *v34;
  uint64_t v35;
  NSArray *reasonsNotGivenCodings;
  uint64_t v37;
  HKConcept *vaccination;
  uint64_t v39;
  HKConcept *bodySite;
  uint64_t v41;
  HKConcept *status;
  uint64_t v43;
  HKConcept *route;
  void *v45;
  uint64_t v46;
  NSArray *reasons;
  void *v48;
  uint64_t v49;
  NSArray *reasonsNotGiven;
  objc_super v52;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HKVaccinationRecord;
  v5 = -[HKMedicalRecord initWithCoder:](&v52, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("VaccinationCodings"));
    v7 = objc_claimAutoreleasedReturnValue();
    vaccinationCodings = v5->_vaccinationCodings;
    v5->_vaccinationCodings = (NSArray *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExpirationDate"));
    v9 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (HKMedicalDate *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DoseNumber"));
    v11 = objc_claimAutoreleasedReturnValue();
    doseNumber = v5->_doseNumber;
    v5->_doseNumber = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DoseQuantity"));
    v13 = objc_claimAutoreleasedReturnValue();
    doseQuantity = v5->_doseQuantity;
    v5->_doseQuantity = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LotNumber"));
    v15 = objc_claimAutoreleasedReturnValue();
    lotNumber = v5->_lotNumber;
    v5->_lotNumber = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Performer"));
    v17 = objc_claimAutoreleasedReturnValue();
    performer = v5->_performer;
    v5->_performer = (NSString *)v17;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("BodySiteCodings"));
    v20 = objc_claimAutoreleasedReturnValue();
    bodySiteCodings = v5->_bodySiteCodings;
    v5->_bodySiteCodings = (NSArray *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Reaction"));
    v22 = objc_claimAutoreleasedReturnValue();
    reaction = v5->_reaction;
    v5->_reaction = (NSString *)v22;

    v5->_notGiven = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("NotGiven"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AdministrationDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    administrationDate = v5->_administrationDate;
    v5->_administrationDate = (HKMedicalDate *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StatusCoding"));
    v26 = objc_claimAutoreleasedReturnValue();
    statusCoding = v5->_statusCoding;
    v5->_statusCoding = (HKMedicalCoding *)v26;

    v5->_patientReported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PatientReported"));
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("RouteCodings"));
    v29 = objc_claimAutoreleasedReturnValue();
    routeCodings = v5->_routeCodings;
    v5->_routeCodings = (NSArray *)v29;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v31, CFSTR("ReasonsCodings"));
    v32 = objc_claimAutoreleasedReturnValue();
    reasonsCodings = v5->_reasonsCodings;
    v5->_reasonsCodings = (NSArray *)v32;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("ReasonsNotGivenCodings"));
    v35 = objc_claimAutoreleasedReturnValue();
    reasonsNotGivenCodings = v5->_reasonsNotGivenCodings;
    v5->_reasonsNotGivenCodings = (NSArray *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Vaccination"));
    v37 = objc_claimAutoreleasedReturnValue();
    vaccination = v5->_vaccination;
    v5->_vaccination = (HKConcept *)v37;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BodySite"));
    v39 = objc_claimAutoreleasedReturnValue();
    bodySite = v5->_bodySite;
    v5->_bodySite = (HKConcept *)v39;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Status"));
    v41 = objc_claimAutoreleasedReturnValue();
    status = v5->_status;
    v5->_status = (HKConcept *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Route"));
    v43 = objc_claimAutoreleasedReturnValue();
    route = v5->_route;
    v5->_route = (HKConcept *)v43;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("Reasons"));
    v46 = objc_claimAutoreleasedReturnValue();
    reasons = v5->_reasons;
    v5->_reasons = (NSArray *)v46;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("ReasonsNotGiven"));
    v49 = objc_claimAutoreleasedReturnValue();
    reasonsNotGiven = v5->_reasonsNotGiven;
    v5->_reasonsNotGiven = (NSArray *)v49;

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
  int v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  char v124;
  objc_super v126;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v126.receiver = self;
    v126.super_class = (Class)HKVaccinationRecord;
    if (!-[HKMedicalRecord isEquivalent:](&v126, sel_isEquivalent_, v5))
      goto LABEL_101;
    -[HKVaccinationRecord vaccinationCodings](self, "vaccinationCodings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vaccinationCodings");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "vaccinationCodings");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_100;
      v10 = (void *)v9;
      -[HKVaccinationRecord vaccinationCodings](self, "vaccinationCodings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "vaccinationCodings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToArray:", v12);

      if (!v13)
        goto LABEL_101;
    }
    -[HKVaccinationRecord expirationDate](self, "expirationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "expirationDate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v15)
    {

    }
    else
    {
      v8 = (void *)v15;
      objc_msgSend(v5, "expirationDate");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_100;
      v17 = (void *)v16;
      -[HKVaccinationRecord expirationDate](self, "expirationDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "expirationDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_101;
    }
    -[HKVaccinationRecord doseNumber](self, "doseNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doseNumber");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v21)
    {

    }
    else
    {
      v8 = (void *)v21;
      objc_msgSend(v5, "doseNumber");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_100;
      v23 = (void *)v22;
      -[HKVaccinationRecord doseNumber](self, "doseNumber");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doseNumber");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqualToString:", v25);

      if (!v26)
        goto LABEL_101;
    }
    -[HKVaccinationRecord doseQuantity](self, "doseQuantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doseQuantity");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v27)
    {

    }
    else
    {
      v8 = (void *)v27;
      objc_msgSend(v5, "doseQuantity");
      v28 = objc_claimAutoreleasedReturnValue();
      if (!v28)
        goto LABEL_100;
      v29 = (void *)v28;
      -[HKVaccinationRecord doseQuantity](self, "doseQuantity");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doseQuantity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqualToString:", v31);

      if (!v32)
        goto LABEL_101;
    }
    -[HKVaccinationRecord lotNumber](self, "lotNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lotNumber");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v33)
    {

    }
    else
    {
      v8 = (void *)v33;
      objc_msgSend(v5, "lotNumber");
      v34 = objc_claimAutoreleasedReturnValue();
      if (!v34)
        goto LABEL_100;
      v35 = (void *)v34;
      -[HKVaccinationRecord lotNumber](self, "lotNumber");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lotNumber");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqualToString:", v37);

      if (!v38)
        goto LABEL_101;
    }
    -[HKVaccinationRecord performer](self, "performer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performer");
    v39 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v39)
    {

    }
    else
    {
      v8 = (void *)v39;
      objc_msgSend(v5, "performer");
      v40 = objc_claimAutoreleasedReturnValue();
      if (!v40)
        goto LABEL_100;
      v41 = (void *)v40;
      -[HKVaccinationRecord performer](self, "performer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "performer");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "isEqualToString:", v43);

      if (!v44)
        goto LABEL_101;
    }
    -[HKVaccinationRecord bodySiteCodings](self, "bodySiteCodings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bodySiteCodings");
    v45 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v45)
    {

    }
    else
    {
      v8 = (void *)v45;
      objc_msgSend(v5, "bodySiteCodings");
      v46 = objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_100;
      v47 = (void *)v46;
      -[HKVaccinationRecord bodySiteCodings](self, "bodySiteCodings");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bodySiteCodings");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v48, "isEqualToArray:", v49);

      if (!v50)
        goto LABEL_101;
    }
    -[HKVaccinationRecord reaction](self, "reaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reaction");
    v51 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v51)
    {

    }
    else
    {
      v8 = (void *)v51;
      objc_msgSend(v5, "reaction");
      v52 = objc_claimAutoreleasedReturnValue();
      if (!v52)
        goto LABEL_100;
      v53 = (void *)v52;
      -[HKVaccinationRecord reaction](self, "reaction");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reaction");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v54, "isEqualToString:", v55);

      if (!v56)
        goto LABEL_101;
    }
    v57 = -[HKVaccinationRecord notGiven](self, "notGiven");
    if (v57 != objc_msgSend(v5, "notGiven"))
      goto LABEL_101;
    -[HKVaccinationRecord administrationDate](self, "administrationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "administrationDate");
    v58 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v58)
    {

    }
    else
    {
      v8 = (void *)v58;
      objc_msgSend(v5, "administrationDate");
      v59 = objc_claimAutoreleasedReturnValue();
      if (!v59)
        goto LABEL_100;
      v60 = (void *)v59;
      -[HKVaccinationRecord administrationDate](self, "administrationDate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "administrationDate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v61, "isEqual:", v62);

      if (!v63)
        goto LABEL_101;
    }
    -[HKVaccinationRecord statusCoding](self, "statusCoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusCoding");
    v64 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v64)
    {

    }
    else
    {
      v8 = (void *)v64;
      objc_msgSend(v5, "statusCoding");
      v65 = objc_claimAutoreleasedReturnValue();
      if (!v65)
        goto LABEL_100;
      v66 = (void *)v65;
      -[HKVaccinationRecord statusCoding](self, "statusCoding");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "statusCoding");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v67, "isEqual:", v68);

      if (!v69)
        goto LABEL_101;
    }
    v70 = -[HKVaccinationRecord patientReported](self, "patientReported");
    if (v70 != objc_msgSend(v5, "patientReported"))
      goto LABEL_101;
    -[HKVaccinationRecord routeCodings](self, "routeCodings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "routeCodings");
    v71 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v71)
    {

    }
    else
    {
      v8 = (void *)v71;
      objc_msgSend(v5, "routeCodings");
      v72 = objc_claimAutoreleasedReturnValue();
      if (!v72)
        goto LABEL_100;
      v73 = (void *)v72;
      -[HKVaccinationRecord routeCodings](self, "routeCodings");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "routeCodings");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = objc_msgSend(v74, "isEqualToArray:", v75);

      if (!v76)
        goto LABEL_101;
    }
    -[HKVaccinationRecord reasonsCodings](self, "reasonsCodings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonsCodings");
    v77 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v77)
    {

    }
    else
    {
      v8 = (void *)v77;
      objc_msgSend(v5, "reasonsCodings");
      v78 = objc_claimAutoreleasedReturnValue();
      if (!v78)
        goto LABEL_100;
      v79 = (void *)v78;
      -[HKVaccinationRecord reasonsCodings](self, "reasonsCodings");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonsCodings");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v80, "isEqualToArray:", v81);

      if (!v82)
        goto LABEL_101;
    }
    -[HKVaccinationRecord reasonsNotGivenCodings](self, "reasonsNotGivenCodings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonsNotGivenCodings");
    v83 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v83)
    {

    }
    else
    {
      v8 = (void *)v83;
      objc_msgSend(v5, "reasonsNotGivenCodings");
      v84 = objc_claimAutoreleasedReturnValue();
      if (!v84)
        goto LABEL_100;
      v85 = (void *)v84;
      -[HKVaccinationRecord reasonsNotGivenCodings](self, "reasonsNotGivenCodings");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonsNotGivenCodings");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v86, "isEqualToArray:", v87);

      if (!v88)
        goto LABEL_101;
    }
    -[HKVaccinationRecord vaccination](self, "vaccination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vaccination");
    v89 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v89)
    {

    }
    else
    {
      v8 = (void *)v89;
      objc_msgSend(v5, "vaccination");
      v90 = objc_claimAutoreleasedReturnValue();
      if (!v90)
        goto LABEL_100;
      v91 = (void *)v90;
      -[HKVaccinationRecord vaccination](self, "vaccination");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "vaccination");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(v92, "isEqual:", v93);

      if (!v94)
        goto LABEL_101;
    }
    -[HKVaccinationRecord bodySite](self, "bodySite");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bodySite");
    v95 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v95)
    {

    }
    else
    {
      v8 = (void *)v95;
      objc_msgSend(v5, "bodySite");
      v96 = objc_claimAutoreleasedReturnValue();
      if (!v96)
        goto LABEL_100;
      v97 = (void *)v96;
      -[HKVaccinationRecord bodySite](self, "bodySite");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bodySite");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v98, "isEqual:", v99);

      if (!v100)
        goto LABEL_101;
    }
    -[HKVaccinationRecord status](self, "status");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "status");
    v101 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v101)
    {

    }
    else
    {
      v8 = (void *)v101;
      objc_msgSend(v5, "status");
      v102 = objc_claimAutoreleasedReturnValue();
      if (!v102)
        goto LABEL_100;
      v103 = (void *)v102;
      -[HKVaccinationRecord status](self, "status");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "status");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = objc_msgSend(v104, "isEqual:", v105);

      if (!v106)
        goto LABEL_101;
    }
    -[HKVaccinationRecord route](self, "route");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "route");
    v107 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v107)
    {

    }
    else
    {
      v8 = (void *)v107;
      objc_msgSend(v5, "route");
      v108 = objc_claimAutoreleasedReturnValue();
      if (!v108)
        goto LABEL_100;
      v109 = (void *)v108;
      -[HKVaccinationRecord route](self, "route");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "route");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v110, "isEqual:", v111);

      if (!v112)
        goto LABEL_101;
    }
    -[HKVaccinationRecord reasons](self, "reasons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasons");
    v113 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v113)
    {

    }
    else
    {
      v8 = (void *)v113;
      objc_msgSend(v5, "reasons");
      v114 = objc_claimAutoreleasedReturnValue();
      if (!v114)
        goto LABEL_100;
      v115 = (void *)v114;
      -[HKVaccinationRecord reasons](self, "reasons");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasons");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend(v116, "isEqualToArray:", v117);

      if (!v118)
        goto LABEL_101;
    }
    -[HKVaccinationRecord reasonsNotGiven](self, "reasonsNotGiven");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reasonsNotGiven");
    v119 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v119)
    {

LABEL_105:
      v14 = 1;
      goto LABEL_102;
    }
    v8 = (void *)v119;
    objc_msgSend(v5, "reasonsNotGiven");
    v120 = objc_claimAutoreleasedReturnValue();
    if (v120)
    {
      v121 = (void *)v120;
      -[HKVaccinationRecord reasonsNotGiven](self, "reasonsNotGiven");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "reasonsNotGiven");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = objc_msgSend(v122, "isEqualToArray:", v123);

      if ((v124 & 1) != 0)
        goto LABEL_105;
LABEL_101:
      v14 = 0;
LABEL_102:

      goto LABEL_103;
    }
LABEL_100:

    goto LABEL_101;
  }
  v14 = 0;
LABEL_103:

  return v14;
}

- (id)vaccinationCodingsCollection
{
  void *v2;
  void *v3;

  -[HKVaccinationRecord vaccinationCodings](self, "vaccinationCodings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)bodySiteCodingsCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[HKVaccinationRecord bodySiteCodings](self, "bodySiteCodings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKVaccinationRecord bodySiteCodings](self, "bodySiteCodings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)statusCodingCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[HKVaccinationRecord statusCoding](self, "statusCoding");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKVaccinationRecord statusCoding](self, "statusCoding");
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

- (id)routeCodingsCollection
{
  void *v3;
  void *v4;
  void *v5;

  -[HKVaccinationRecord routeCodings](self, "routeCodings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKVaccinationRecord routeCodings](self, "routeCodings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)reasonsCodingsCollections
{
  void *v3;
  void *v4;
  void *v5;

  -[HKVaccinationRecord reasonsCodings](self, "reasonsCodings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKVaccinationRecord reasonsCodings](self, "reasonsCodings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_map:", &__block_literal_global_134);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

HKMedicalCodingCollection *__48__HKVaccinationRecord_reasonsCodingsCollections__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", a2);
}

- (id)reasonsNotGivenCodingsCollections
{
  void *v3;
  void *v4;
  void *v5;

  -[HKVaccinationRecord reasonsNotGivenCodings](self, "reasonsNotGivenCodings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKVaccinationRecord reasonsNotGivenCodings](self, "reasonsNotGivenCodings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_map:", &__block_literal_global_108);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

HKMedicalCodingCollection *__56__HKVaccinationRecord_reasonsNotGivenCodingsCollections__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", a2);
}

- (NSArray)vaccinationCodings
{
  return self->_vaccinationCodings;
}

- (void)_setVaccinationCodings:(id)a3
{
  NSArray *v4;
  NSArray *vaccinationCodings;
  HKConcept *v6;
  HKConcept *vaccination;
  id v8;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  vaccinationCodings = self->_vaccinationCodings;
  self->_vaccinationCodings = v4;

  -[HKVaccinationRecord vaccinationCodingsCollection](self, "vaccinationCodingsCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v8);
  v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
  vaccination = self->_vaccination;
  self->_vaccination = v6;

}

- (HKMedicalDate)expirationDate
{
  return self->_expirationDate;
}

- (void)_setExpirationDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *expirationDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  expirationDate = self->_expirationDate;
  self->_expirationDate = v4;

}

- (NSString)doseNumber
{
  return self->_doseNumber;
}

- (void)_setDoseNumber:(id)a3
{
  NSString *v4;
  NSString *doseNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  doseNumber = self->_doseNumber;
  self->_doseNumber = v4;

}

- (NSString)doseQuantity
{
  return self->_doseQuantity;
}

- (void)_setDoseQuantity:(id)a3
{
  NSString *v4;
  NSString *doseQuantity;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  doseQuantity = self->_doseQuantity;
  self->_doseQuantity = v4;

}

- (NSString)lotNumber
{
  return self->_lotNumber;
}

- (void)_setLotNumber:(id)a3
{
  NSString *v4;
  NSString *lotNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  lotNumber = self->_lotNumber;
  self->_lotNumber = v4;

}

- (NSString)performer
{
  return self->_performer;
}

- (void)_setPerformer:(id)a3
{
  NSString *v4;
  NSString *performer;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  performer = self->_performer;
  self->_performer = v4;

}

- (NSArray)bodySiteCodings
{
  return self->_bodySiteCodings;
}

- (void)_setBodySiteCodings:(id)a3
{
  NSArray *v4;
  NSArray *bodySiteCodings;
  HKConcept *v6;
  HKConcept *bodySite;
  HKConcept *v8;
  uint64_t v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  bodySiteCodings = self->_bodySiteCodings;
  self->_bodySiteCodings = v4;

  if (self->_bodySiteCodings)
  {
    -[HKVaccinationRecord bodySiteCodingsCollection](self, "bodySiteCodingsCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    bodySite = self->_bodySite;
    self->_bodySite = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_bodySite;
    self->_bodySite = 0;
  }

}

- (NSString)reaction
{
  return self->_reaction;
}

- (void)_setReaction:(id)a3
{
  NSString *v4;
  NSString *reaction;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  reaction = self->_reaction;
  self->_reaction = v4;

}

- (BOOL)notGiven
{
  return self->_notGiven;
}

- (void)_setNotGiven:(BOOL)a3
{
  self->_notGiven = a3;
}

- (HKMedicalDate)administrationDate
{
  return self->_administrationDate;
}

- (void)_setAdministrationDate:(id)a3
{
  HKMedicalDate *v4;
  HKMedicalDate *administrationDate;

  v4 = (HKMedicalDate *)objc_msgSend(a3, "copy");
  administrationDate = self->_administrationDate;
  self->_administrationDate = v4;

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
  HKConcept *v8;
  uint64_t v9;

  v4 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  statusCoding = self->_statusCoding;
  self->_statusCoding = v4;

  if (self->_statusCoding)
  {
    -[HKVaccinationRecord statusCodingCollection](self, "statusCodingCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    status = self->_status;
    self->_status = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_status;
    self->_status = 0;
  }

}

- (BOOL)patientReported
{
  return self->_patientReported;
}

- (void)_setPatientReported:(BOOL)a3
{
  self->_patientReported = a3;
}

- (NSArray)routeCodings
{
  return self->_routeCodings;
}

- (void)_setRouteCodings:(id)a3
{
  NSArray *v4;
  NSArray *routeCodings;
  HKConcept *v6;
  HKConcept *route;
  HKConcept *v8;
  uint64_t v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  routeCodings = self->_routeCodings;
  self->_routeCodings = v4;

  if (self->_routeCodings)
  {
    -[HKVaccinationRecord routeCodingsCollection](self, "routeCodingsCollection");
    v9 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v9);
    v6 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    route = self->_route;
    self->_route = v6;

    v8 = (HKConcept *)v9;
  }
  else
  {
    v8 = self->_route;
    self->_route = 0;
  }

}

- (NSArray)reasonsCodings
{
  return self->_reasonsCodings;
}

- (void)_setReasonsCodings:(id)a3
{
  NSArray *v4;
  NSArray *reasonsCodings;
  NSArray *v6;
  NSArray *reasons;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasonsCodings = self->_reasonsCodings;
  self->_reasonsCodings = v4;

  if (self->_reasonsCodings)
  {
    -[HKVaccinationRecord reasonsCodingsCollections](self, "reasonsCodingsCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_111_1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    reasons = self->_reasons;
    self->_reasons = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_reasons;
    self->_reasons = 0;
  }

}

id __42__HKVaccinationRecord__setReasonsCodings___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (NSArray)reasonsNotGivenCodings
{
  return self->_reasonsNotGivenCodings;
}

- (void)_setReasonsNotGivenCodings:(id)a3
{
  NSArray *v4;
  NSArray *reasonsNotGivenCodings;
  NSArray *v6;
  NSArray *reasonsNotGiven;
  NSArray *v8;
  NSArray *v9;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasonsNotGivenCodings = self->_reasonsNotGivenCodings;
  self->_reasonsNotGivenCodings = v4;

  if (self->_reasonsNotGivenCodings)
  {
    -[HKVaccinationRecord reasonsNotGivenCodingsCollections](self, "reasonsNotGivenCodingsCollections");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray hk_map:](v9, "hk_map:", &__block_literal_global_112_1);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    reasonsNotGiven = self->_reasonsNotGiven;
    self->_reasonsNotGiven = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_reasonsNotGiven;
    self->_reasonsNotGiven = 0;
  }

}

id __50__HKVaccinationRecord__setReasonsNotGivenCodings___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (HKConcept)vaccination
{
  HKConcept *vaccination;
  HKConcept *v3;
  void *v4;

  vaccination = self->_vaccination;
  if (vaccination)
  {
    v3 = vaccination;
  }
  else
  {
    -[HKVaccinationRecord vaccinationCodingsCollection](self, "vaccinationCodingsCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v4);
    v3 = (HKConcept *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)_setVaccination:(id)a3
{
  id v4;
  NSObject *v5;
  HKConcept *v6;
  HKConcept *vaccination;

  v4 = a3;
  if (!v4)
  {
    _HKInitializeLogging();
    v5 = HKLogHealthRecords;
    if (os_log_type_enabled((os_log_t)HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      -[HKVaccinationRecord _setVaccination:].cold.1(v5);
  }
  v6 = (HKConcept *)objc_msgSend(v4, "copy");
  vaccination = self->_vaccination;
  self->_vaccination = v6;

}

- (HKConcept)bodySite
{
  HKConcept *bodySite;
  HKConcept *v3;
  void *v4;

  if (self->_bodySiteCodings)
  {
    bodySite = self->_bodySite;
    if (bodySite)
    {
      v3 = bodySite;
    }
    else
    {
      -[HKVaccinationRecord bodySiteCodingsCollection](self, "bodySiteCodingsCollection");
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

- (void)_setBodySite:(id)a3
{
  HKConcept *v4;
  HKConcept *bodySite;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  bodySite = self->_bodySite;
  self->_bodySite = v4;

}

- (HKConcept)status
{
  HKConcept *status;
  HKConcept *v3;
  void *v4;

  if (self->_statusCoding)
  {
    status = self->_status;
    if (status)
    {
      v3 = status;
    }
    else
    {
      -[HKVaccinationRecord statusCodingCollection](self, "statusCodingCollection");
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

- (void)_setStatus:(id)a3
{
  HKConcept *v4;
  HKConcept *status;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  status = self->_status;
  self->_status = v4;

}

- (HKConcept)route
{
  HKConcept *route;
  HKConcept *v3;
  void *v4;

  if (self->_routeCodings)
  {
    route = self->_route;
    if (route)
    {
      v3 = route;
    }
    else
    {
      -[HKVaccinationRecord routeCodingsCollection](self, "routeCodingsCollection");
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

- (void)_setRoute:(id)a3
{
  HKConcept *v4;
  HKConcept *route;

  v4 = (HKConcept *)objc_msgSend(a3, "copy");
  route = self->_route;
  self->_route = v4;

}

- (NSArray)reasons
{
  NSArray *reasons;
  NSArray *v3;
  void *v4;

  if (self->_reasonsCodings)
  {
    reasons = self->_reasons;
    if (reasons)
    {
      v3 = reasons;
    }
    else
    {
      -[HKVaccinationRecord reasonsCodingsCollections](self, "reasonsCodingsCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_113_1);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __30__HKVaccinationRecord_reasons__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setReasons:(id)a3
{
  NSArray *v4;
  NSArray *reasons;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasons = self->_reasons;
  self->_reasons = v4;

}

- (NSArray)reasonsNotGiven
{
  NSArray *reasonsNotGiven;
  NSArray *v3;
  void *v4;

  if (self->_reasonsNotGivenCodings)
  {
    reasonsNotGiven = self->_reasonsNotGiven;
    if (reasonsNotGiven)
    {
      v3 = reasonsNotGiven;
    }
    else
    {
      -[HKVaccinationRecord reasonsNotGivenCodingsCollections](self, "reasonsNotGivenCodingsCollections");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hk_map:", &__block_literal_global_114_0);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __38__HKVaccinationRecord_reasonsNotGiven__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", a2);
}

- (void)_setReasonsNotGiven:(id)a3
{
  NSArray *v4;
  NSArray *reasonsNotGiven;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  reasonsNotGiven = self->_reasonsNotGiven;
  self->_reasonsNotGiven = v4;

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
  v13.super_class = (Class)HKVaccinationRecord;
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
  if (!self->_vaccinationCodings)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: vaccinationCodings must not be nil");
LABEL_8:
    objc_msgSend(v9, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v10, a2, v11, self);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!self->_administrationDate)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = objc_opt_class();
    v11 = CFSTR("%@: administrationDate must not be nil");
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
  objc_storeStrong((id *)&self->_reasonsNotGiven, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_bodySite, 0);
  objc_storeStrong((id *)&self->_vaccination, 0);
  objc_storeStrong((id *)&self->_reasonsNotGivenCodings, 0);
  objc_storeStrong((id *)&self->_reasonsCodings, 0);
  objc_storeStrong((id *)&self->_routeCodings, 0);
  objc_storeStrong((id *)&self->_statusCoding, 0);
  objc_storeStrong((id *)&self->_administrationDate, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_bodySiteCodings, 0);
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_lotNumber, 0);
  objc_storeStrong((id *)&self->_doseQuantity, 0);
  objc_storeStrong((id *)&self->_doseNumber, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_vaccinationCodings, 0);
}

- (void)_setVaccination:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_19A0E6000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found nil while setting a concept property vaccination for record type HKVaccinationRecord.", v1, 2u);
}

@end
