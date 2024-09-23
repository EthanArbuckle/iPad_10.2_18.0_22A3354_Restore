@implementation HDMedicationUserDomainConceptGenerator

+ (id)propertyCollectionWithOntologyConcept:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
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
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D29530], "localizedOntologyPreferredNamesForConcept:withUserDomainConceptPropertyType:", v7, 160012);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "addObjectsFromArray:", v10);
    objc_msgSend(MEMORY[0x1E0D29518], "basicAttributesForConcept:ofTypes:", v7, &unk_1E6E115C8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "addObjectsFromArray:", v11);
      objc_msgSend(v7, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDOntologyBrandNameProvider brandNamesForConceptWithIdentifier:ontologyTransaction:error:](HDOntologyBrandNameProvider, "brandNamesForConceptWithIdentifier:ontologyTransaction:error:", v12, v8, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v9, "addObjectsFromArray:", v13);
        objc_msgSend(v7, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDOntologyGenericMedicationContentProvider genericMedicationContentForConceptWithIdentifier:ontologyTransaction:error:](HDOntologyGenericMedicationContentProvider, "genericMedicationContentForConceptWithIdentifier:ontologyTransaction:error:", v14, v8, a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v9, "addObjectsFromArray:", v15);
          objc_msgSend(v7, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDOntologyManufacturedDoseFormProvider manufacturedDoseFormsForConceptWithIdentifier:ontologyTransaction:error:](HDOntologyManufacturedDoseFormProvider, "manufacturedDoseFormsForConceptWithIdentifier:ontologyTransaction:error:", v16, v8, a5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v32 = v17;
            objc_msgSend(v9, "addObjectsFromArray:", v17);
            objc_msgSend(v7, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[HDOntologyBasicDoseFormProvider basicDoseFormsForConceptWithIdentifier:ontologyTransaction:error:](HDOntologyBasicDoseFormProvider, "basicDoseFormsForConceptWithIdentifier:ontologyTransaction:error:", v18, v8, a5);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v33 = v19;
            if (v19)
            {
              objc_msgSend(v9, "addObjectsFromArray:", v19);
              objc_msgSend(v7, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              +[HDOntologyLoggingUnitProvider loggingUnitsForConceptWithIdentifier:ontologyTransaction:error:](HDOntologyLoggingUnitProvider, "loggingUnitsForConceptWithIdentifier:ontologyTransaction:error:", v20, v8, a5);
              v21 = objc_claimAutoreleasedReturnValue();

              v31 = (void *)v21;
              if (v21)
              {
                objc_msgSend(v9, "addObjectsFromArray:", v21);
                v22 = (void *)MEMORY[0x1E0D29528];
                objc_msgSend(v7, "identifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = 0;
                v29 = objc_msgSend(v22, "localizedEducationContentForConceptWithIdentifier:ontologyTransaction:localizedEducationContentOut:error:", v23, v8, &v34, a5);
                v24 = v34;

                v19 = 0;
                if (v29)
                {
                  v30 = v24;
                  objc_msgSend(v9, "hk_addNonNilObject:", v24);
                  objc_msgSend(v7, "identifier");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  +[HDOntologyComponentNameProvider componentNamesForConceptWithIdentifier:ontologyTransaction:error:](HDOntologyComponentNameProvider, "componentNamesForConceptWithIdentifier:ontologyTransaction:error:", v25, v8, a5);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v26)
                  {
                    objc_msgSend(v9, "addObjectsFromArray:", v26);
                    +[HDOntologyPregnancyTrimesterLactationRatingsProvider pregnancyTrimesterLactationRatingsForConcept:](HDOntologyPregnancyTrimesterLactationRatingsProvider, "pregnancyTrimesterLactationRatingsForConcept:", v7);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v9, "hk_addNonNilObject:", v27);
                    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D20]), "initWithProperties:", v9);

                  }
                  else
                  {
                    v19 = 0;
                  }

                  v24 = v30;
                }

              }
              else
              {
                v19 = 0;
              }
              v17 = v32;

            }
            else
            {
              v17 = v32;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (BOOL)performAdditionalCleanupAfterRefreshingUserDomainConcept:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  return 1;
}

@end
