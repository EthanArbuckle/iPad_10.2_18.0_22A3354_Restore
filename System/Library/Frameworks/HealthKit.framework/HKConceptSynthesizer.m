@implementation HKConceptSynthesizer

+ (id)prioritizedCodingSystemsForDisplay
{
  if (prioritizedCodingSystemsForDisplay_onceToken != -1)
    dispatch_once(&prioritizedCodingSystemsForDisplay_onceToken, &__block_literal_global_115);
  return (id)prioritizedCodingSystemsForDisplay_codingSystems;
}

void __58__HKConceptSynthesizer_prioritizedCodingSystemsForDisplay__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;

  v15 = (void *)MEMORY[0x1E0C99E40];
  +[HKMedicalCodingSystem textSystem](HKMedicalCodingSystem, "textSystem");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem LOINCCodeSystem](HKMedicalCodingSystem, "LOINCCodeSystem");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem RxNormCodeSystem](HKMedicalCodingSystem, "RxNormCodeSystem");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem CVXSystem](HKMedicalCodingSystem, "CVXSystem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem SNOMEDCodeSystem](HKMedicalCodingSystem, "SNOMEDCodeSystem");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/allergy-intolerance-category"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/allergy-intolerance-criticality"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/allergy-intolerance-status"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/allergy-intolerance-type"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/condition-category"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/condition-clinical"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/condition-severity"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/condition-ver-status"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/diagnostic-report-status"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/diagnostic-service-sections"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/immunization-reason"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/immunization-route"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/immunization-site"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/medication-admin-status"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/medication-dispense-status"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/medication-order-status"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/medication-statement-status"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/no-immunization-reason"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/observation-category"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/observation-status"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/observation-valueabsentreason"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/procedure-category"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/procedure-followup"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/procedure-not-performed-reason"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/procedure-outcome"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/procedure-status"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/reaction-event-severity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/reason-medication-not-given-codes"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/referencerange-meaning"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/CodeSystem/medication-statement-status"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/CodeSystem/medicationrequest-status"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/device-status"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/devicestatus"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/event-status"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/fm-status"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/condition-clinical"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/condition-ver-status"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/coverage-class"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem FHIRCoverageClassification](HKMedicalCodingSystem, "FHIRCoverageClassification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/coverage-selfpay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/medication-statement-category"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/medicationdispense-status"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/medicationrequest-category"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/medicationrequest-status-reason"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem FHIRCoverageType](HKMedicalCodingSystem, "FHIRCoverageType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem FHIRDocumentReferenceClinicalNoteStatus](HKMedicalCodingSystem, "FHIRDocumentReferenceClinicalNoteStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem FHIRDocumentReferenceClinicalNoteDocStatus](HKMedicalCodingSystem, "FHIRDocumentReferenceClinicalNoteDocStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCodingSystem FHIRDocumentReferenceClinicalNoteCategorySystem](HKMedicalCodingSystem, "FHIRDocumentReferenceClinicalNoteCategorySystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "orderedSetWithObjects:", v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45, v44, v43, v42, v41, v40, v39,
    v38,
    v37,
    v36,
    v32,
    v34,
    v35,
    v33,
    v29,
    v31,
    v24,
    v30,
    v28,
    v14,
    v27,
    v13,
    v26,
    v25,
    v23,
    v22,
    v12,
    v21,
    v20,
    v19,
    v18,
    v17,
    v16,
    v11,
    v10,
    v0,
    v1,
    v2,
    v9,
    v3,
    v4,
    v5,
    v6,
    0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)prioritizedCodingSystemsForDisplay_codingSystems;
  prioritizedCodingSystemsForDisplay_codingSystems = v7;

}

+ (id)privateCodeCreationCodingSortDescriptors
{
  if (privateCodeCreationCodingSortDescriptors_onceToken != -1)
    dispatch_once(&privateCodeCreationCodingSortDescriptors_onceToken, &__block_literal_global_107);
  return (id)privateCodeCreationCodingSortDescriptors_result;
}

void __64__HKConceptSynthesizer_privateCodeCreationCodingSortDescriptors__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("codingSystem.identifier"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("codingVersion"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("code"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("displayString"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)privateCodeCreationCodingSortDescriptors_result;
  privateCodeCreationCodingSortDescriptors_result = v4;

}

+ (id)synthesizeConceptWithIdentifier:(id)a3 forCodingCollection:(id)a4
{
  return (id)objc_msgSend(a1, "_synthesizeConceptWithIdentifier:forCodingCollection:additionalAttributes:", a3, a4, 0);
}

+ (id)_synthesizeConceptWithIdentifier:(id)a3 forCodingCollection:(id)a4 additionalAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "prioritizedCodingSystemsForDisplay");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_synthesizeConceptWithIdentifier:forCodingCollection:prioritizedCodingSystems:addtionalAttributes:", v10, v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)bestDisplayNameForCodingCollection:(id)a3 prioritizedCodingSystems:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "bestCodingSystemForDisplayForCodingCollection:prioritizedCodingSystems:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "displayString");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_6;
  }
  objc_msgSend(v4, "code");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "code");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

+ (id)synthesizeInMemoryConceptForCodingCollection:(id)a3
{
  return (id)objc_msgSend(a1, "synthesizeInMemoryConceptForCodingCollection:additionalAttributes:", a3, 0);
}

+ (id)synthesizeInMemoryConceptForCodingCollection:(id)a3 additionalAttributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[HKConceptIdentifier inMemoryConceptIdentifier](HKConceptIdentifier, "inMemoryConceptIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_synthesizeConceptWithIdentifier:forCodingCollection:additionalAttributes:", v8, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)bestDisplayNameForCodingCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "prioritizedCodingSystemsForDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bestDisplayNameForCodingCollection:prioritizedCodingSystems:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)bestCodingSystemForDisplayForCodingCollection:(id)a3 prioritizedCodingSystems:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a4;
  objc_msgSend(a3, "codingsBySystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __95__HKConceptSynthesizer_bestCodingSystemForDisplayForCodingCollection_prioritizedCodingSystems___block_invoke;
  v18[3] = &unk_1E37F5600;
  v9 = v6;
  v19 = v9;
  objc_msgSend(v7, "enumerateCodingsBySystem:prioritizingCodingSystems:handler:", v9, v5, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
  }
  else
  {
    v12 = (void *)objc_opt_class();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __95__HKConceptSynthesizer_bestCodingSystemForDisplayForCodingCollection_prioritizedCodingSystems___block_invoke_2;
    v16[3] = &unk_1E37F5600;
    v17 = v9;
    objc_msgSend(v12, "enumerateCodingsBySystem:prioritizingCodingSystems:handler:", v17, v5, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    if (v13)
      v14 = v13;

  }
  return v11;
}

id __95__HKConceptSynthesizer_bestCodingSystemForDisplayForCodingCollection_prioritizedCodingSystems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "displayString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
      v6 = v8;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __95__HKConceptSynthesizer_bestCodingSystemForDisplayForCodingCollection_prioritizedCodingSystems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "code");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
      v6 = v8;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)enumerateCodingsBySystem:(id)a3 prioritizingCodingSystems:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD, uint64_t);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD, uint64_t))a5;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          v9[2](v9, v15, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v21 = v10;
            goto LABEL_22;
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v12)
        continue;
      break;
    }
  }

  objc_msgSend(v7, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_120);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = v20;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
LABEL_12:
    v25 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v24)
        objc_enumerationMutation(v21);
      v26 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v25);
      if ((objc_msgSend(v10, "containsObject:", v26, (_QWORD)v29) & 1) == 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v26, (uint64_t)v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          break;
      }
      if (v23 == ++v25)
      {
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v23)
          goto LABEL_12;
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    v18 = 0;
  }

LABEL_22:
  return v18;
}

uint64_t __83__HKConceptSynthesizer_enumerateCodingsBySystem_prioritizingCodingSystems_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)_synthesizeConceptWithIdentifier:(id)a3 forCodingCollection:(id)a4 prioritizedCodingSystems:(id)a5 addtionalAttributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HKConceptAttribute *v14;
  void *v15;
  void *v16;
  HKConceptAttribute *v17;
  HKConceptAttribute *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HKConceptAttribute *v22;
  uint64_t v23;
  HKConcept *v24;
  HKConcept *v25;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = [HKConceptAttribute alloc];
  objc_msgSend(a1, "adHocCodingForCodingCollection:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "code");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HKConceptAttribute initWithType:stringValue:](v14, "initWithType:stringValue:", 2, v16);
  v27[0] = v17;
  v18 = -[HKConceptAttribute initWithType:stringValue:]([HKConceptAttribute alloc], "initWithType:stringValue:", 959, CFSTR("CA,GB,US"));
  v27[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v19, "arrayByAddingObjectsFromArray:", v12);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  objc_msgSend(a1, "bestDisplayNameForCodingCollection:prioritizedCodingSystems:", v10, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = -[HKConceptAttribute initWithType:stringValue:]([HKConceptAttribute alloc], "initWithType:stringValue:", 1012, v21);
    objc_msgSend(v19, "arrayByAddingObject:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v23;
  }
  v24 = [HKConcept alloc];
  v25 = -[HKConcept initWithIdentifier:attributes:relationships:version:deleted:options:](v24, "initWithIdentifier:attributes:relationships:version:deleted:options:", v13, v19, MEMORY[0x1E0C9AA60], 0, 0, 0);

  return v25;
}

+ (id)adHocCodingForCodingCollection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "privateCodeCreationCodingSortDescriptors");
  v5 = objc_claimAutoreleasedReturnValue();
  v31 = v4;
  objc_msgSend(v4, "codings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v5;
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v8, "appendString:", CFSTR("system="));
        objc_msgSend(v13, "codingSystem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (const __CFString *)v15;
        else
          v17 = CFSTR("none");
        objc_msgSend(v8, "appendString:", v17);

        objc_msgSend(v8, "appendString:", CFSTR("version="));
        objc_msgSend(v13, "codingVersion");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (const __CFString *)v18;
        else
          v20 = CFSTR("none");
        objc_msgSend(v8, "appendString:", v20);

        objc_msgSend(v8, "appendString:", CFSTR("code="));
        objc_msgSend(v13, "code");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v21)
          v23 = (const __CFString *)v21;
        else
          v23 = CFSTR("none");
        objc_msgSend(v8, "appendString:", v23);

        objc_msgSend(v8, "appendString:", CFSTR("display="));
        objc_msgSend(v13, "displayString");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v24)
          v26 = (const __CFString *)v24;
        else
          v26 = CFSTR("none");
        objc_msgSend(v8, "appendString:", v26);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v10);
  }

  +[HKMedicalCodingSystem adHocConceptSystem](HKMedicalCodingSystem, "adHocConceptSystem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v27, 0, v8, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)codingCollectionFromAdHocCode:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id *v27;
  id v29;
  void *v30;
  char v31;
  void *v32;
  id v33;
  id v34;
  char v35;
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v5, "length"))
  {
    v22 = v5;
    v6 = (id)objc_msgSend(v5, "copy");
    v35 = 0;
    v7 = CFSTR("none");
    v27 = a4;
    while (1)
    {
      v8 = v7;
      v9 = v6;
      v36[0] = CFSTR("system=");
      v36[1] = CFSTR("version=");
      v36[2] = CFSTR("code=");
      v36[3] = CFSTR("display=");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v6;
      objc_msgSend(a1, "_substringsInBetweenSequentialDelimiters:poppableString:outReachedEndOfString:outStringRemainder:error:", v10, v6, &v35, &v34, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v34;

      if (!v11)
        break;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      v12 = 0;
      v31 = objc_msgSend(v32, "isEqualToString:", v8);
      if ((v31 & 1) == 0)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKMedicalCodingSystem codeSystemWithIdentifier:](HKMedicalCodingSystem, "codeSystemWithIdentifier:");
        v12 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v12;
      }
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v30, "isEqualToString:", v8);
      if ((v13 & 1) != 0)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v14 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v14;
      }
      v33 = v6;
      objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v8);
      if ((v16 & 1) != 0)
      {
        v17 = 0;
      }
      else
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
        v17 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v17;
      }
      objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", v8))
      {
        +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v12, v14, v17, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKMedicalCoding medicalCodingWithSystem:codingVersion:code:displayString:](HKMedicalCoding, "medicalCodingWithSystem:codingVersion:code:displayString:", v12, v14, v17, v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v8;
      }

      v6 = v33;
      if ((v16 & 1) == 0)

      a4 = v27;
      if ((v13 & 1) == 0)

      if ((v31 & 1) == 0)
      {

      }
      objc_msgSend(v29, "addObject:", v19);

      if (v35)
      {
        +[HKMedicalCodingCollection collectionWithCodings:](HKMedicalCodingCollection, "collectionWithCodings:", v29);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      }
    }

    v5 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 3, CFSTR("Must supply a non-empty string for adhoc code decoding"));
    v11 = 0;
  }

  return v11;
}

+ (id)_substringsInBetweenSequentialDelimiters:(id)a3 poppableString:(id)a4 outReachedEndOfString:(BOOL *)a5 outStringRemainder:(id *)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__51;
  v38 = __Block_byref_object_dispose__51;
  v19 = v11;
  v39 = (id)objc_msgSend(v11, "copy");
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__51;
  v32 = __Block_byref_object_dispose__51;
  v33 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __127__HKConceptSynthesizer__substringsInBetweenSequentialDelimiters_poppableString_outReachedEndOfString_outStringRemainder_error___block_invoke;
  v20[3] = &unk_1E37F5668;
  v13 = v10;
  v21 = v13;
  v23 = &v34;
  v24 = &v44;
  v25 = &v28;
  v26 = &v40;
  v27 = a1;
  v14 = v12;
  v22 = v14;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v20);
  if (*((_BYTE *)v41 + 24))
  {
    if (a6)
      *a6 = objc_retainAutorelease((id)v35[5]);
    if (a5)
      *a5 = *((_BYTE *)v45 + 24);
    v15 = (void *)objc_msgSend(v14, "copy");
  }
  else
  {
    v15 = 0;
    if (a7)
      *a7 = objc_retainAutorelease((id)v29[5]);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v15;
}

void __127__HKConceptSynthesizer__substringsInBetweenSequentialDelimiters_poppableString_outReachedEndOfString_outStringRemainder_error___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id obj;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 + 1);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(*(id *)(a1 + 80), "_popValueForString:startingFromSubstring:untilSubstring:outRemainderString:outEndOfString:error:", *(_QWORD *)(v11 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  objc_storeStrong((id *)(v11 + 40), v16);
  if (objc_msgSend(*(id *)(a1 + 32), "count") - 1 > a3 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Invalid order of delimiters. Reached end of string before full sequence was parsed."));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

LABEL_8:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_9;
  }
  if (!v12)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
LABEL_9:

}

+ (id)_popValueForString:(id)a3 startingFromSubstring:(id)a4 untilSubstring:(id)a5 outRemainderString:(id *)a6 outEndOfString:(BOOL *)a7 error:(id *)a8
{
  id v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  const __CFString *v20;
  id *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v13 = a3;
  v14 = a5;
  v15 = objc_msgSend(v13, "rangeOfString:", a4);
  v17 = v16;
  v18 = objc_msgSend(v13, "rangeOfString:", v14);

  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = CFSTR("Starting substring was not found in string when trying to unwrap adhoc code.");
    v21 = a8;
    v22 = 100;
LABEL_3:
    objc_msgSend(v19, "hk_assignError:code:description:", v21, v22, v20);
    v23 = 0;
    goto LABEL_16;
  }
  v24 = v15 + v17;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a6)
      *a6 = 0;
    if (a7)
      *a7 = 1;
    objc_msgSend(v13, "substringFromIndex:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v18 <= v15)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = CFSTR("Starting substring has a location after or equal to the second one. The first substring must come before the first.");
      v21 = a8;
      v22 = 3;
      goto LABEL_3;
    }
    objc_msgSend(v13, "substringWithRange:", v24, v18 - v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "substringFromIndex:", v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a6)
      *a6 = objc_retainAutorelease(v25);
    if (a7)
      *a7 = 0;

  }
LABEL_16:

  return v23;
}

@end
