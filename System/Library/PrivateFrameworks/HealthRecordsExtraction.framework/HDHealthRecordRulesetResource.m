@implementation HDHealthRecordRulesetResource

+ (id)resourceFromDictionary:(id)a3 resourceName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  HDHealthRecordRulesetResource *v9;
  uint64_t v10;
  NSString *resourceName;
  void *v12;
  HDHealthRecordClinicalType *v13;
  HDHealthRecordClinicalType *clinicalType;
  void *v15;
  id v16;
  id v17;
  HDHealthRecordRulesetResource *v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSArray *APIReferenceRules;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  NSDictionary *medicalRecordProperties;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSString *resourceType;
  void *v39;
  HDHRConditionRule *v40;
  id v41;
  HDHRConditionRule *condition;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(HDHealthRecordRulesetResource);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    resourceName = v9->_resourceName;
    v9->_resourceName = (NSString *)v10;

    objc_msgSend(v7, "hk_safeValueForKeyPath:class:error:", CFSTR("clinicalType"), objc_opt_class(), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[HDHealthRecordClinicalType initWithClinicalTypeName:]([HDHealthRecordClinicalType alloc], "initWithClinicalTypeName:", v12);
      clinicalType = v9->_clinicalType;
      v9->_clinicalType = v13;

      if (v9->_clinicalType)
      {
        v56 = 0;
        objc_msgSend(v7, "hk_safeArrayIfExistsForKeyPath:error:", CFSTR("containReferences"), &v56);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v56;
        v17 = v16;
        if (!v15 && v16)
        {
          if (a5)
          {
            v17 = objc_retainAutorelease(v16);
            v18 = 0;
            *a5 = v17;
          }
          else
          {
            _HKLogDroppedError();
            v18 = 0;
          }
          goto LABEL_53;
        }
        objc_storeStrong((id *)&v9->_containReferences, v15);

        v55 = 0;
        objc_msgSend(v7, "hk_safeValueIfExistsForKeyPath:class:error:", CFSTR("apiContainedReferenceRules"), objc_opt_class(), &v55);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v55;
        v17 = v20;
        if (!v19 && v20)
        {
          if (a5)
          {
            v17 = objc_retainAutorelease(v20);
            v18 = 0;
            *a5 = v17;
LABEL_52:

LABEL_53:
            goto LABEL_54;
          }
          _HKLogDroppedError();
LABEL_30:
          v18 = 0;
          goto LABEL_52;
        }
        if (objc_msgSend(v19, "count"))
        {
          +[HDHealthRecordRulesetReferenceRule referenceRulesetsForRules:error:](HDHealthRecordRulesetReferenceRule, "referenceRulesetsForRules:error:", v19, a5);
          v21 = objc_claimAutoreleasedReturnValue();
          if (!v21)
            goto LABEL_30;
          APIReferenceRules = v9->_APIReferenceRules;
          v9->_APIReferenceRules = (NSArray *)v21;

        }
        v47 = v19;
        v54 = v17;
        objc_msgSend(v7, "hk_safeArrayIfExistsForKeyPath:error:", CFSTR("retrieveReferences"), &v54);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v54;

        v25 = v23;
        if (!v23 && v24)
        {
          if (a5)
          {
            v24 = objc_retainAutorelease(v24);
            v18 = 0;
            *a5 = v24;
          }
          else
          {
            _HKLogDroppedError();
            v18 = 0;
          }
          goto LABEL_51;
        }
        v46 = v23;
        objc_storeStrong((id *)&v9->_retrieveReferences, v23);
        v53 = v24;
        objc_msgSend(v7, "hk_safeArrayForKeyPath:error:", CFSTR("displayNameKeyPaths"), &v53);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v53;

        if (v26)
        {
          objc_storeStrong((id *)&v9->_displayNameKeyPaths, v26);
        }
        else if (v27)
        {
          if (a5)
          {
            v27 = objc_retainAutorelease(v27);
            v18 = 0;
            *a5 = v27;
          }
          else
          {
            _HKLogDroppedError();
            v18 = 0;
          }
LABEL_50:

          v24 = v27;
          v25 = v46;
LABEL_51:
          v19 = v47;

          v17 = v24;
          goto LABEL_52;
        }
        v45 = v26;
        v52 = v27;
        objc_msgSend(v7, "hk_safeDictionaryIfExistsForKeyPath:error:", CFSTR("redactionRules"), &v52);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v52;

        v30 = v28;
        if (v28 || !v29)
        {
          v44 = v28;
          objc_storeStrong((id *)&v9->_redactionRules, v28);
          v51 = v29;
          objc_msgSend(v7, "hk_safeValueForKeyPath:class:error:", CFSTR("properties"), objc_opt_class(), &v51);
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = v51;

          medicalRecordProperties = v9->_medicalRecordProperties;
          v9->_medicalRecordProperties = (NSDictionary *)v31;

          if (-[NSDictionary count](v9->_medicalRecordProperties, "count"))
          {

            v50 = 0;
            objc_msgSend(v7, "hk_safeValueForKeyPath:class:error:", CFSTR("resourcePath"), objc_opt_class(), &v50);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v50;
            v29 = v35;
            if (v34 || !v35)
            {
              if (v34)
                v36 = v34;
              else
                v36 = v8;
              v37 = objc_msgSend(v36, "copy");
              resourceType = v9->_resourceType;
              v9->_resourceType = (NSString *)v37;

              v49 = 0;
              objc_msgSend(v7, "hk_safeValueForKeyPath:class:error:", CFSTR("condition"), objc_opt_class(), &v49);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v49;
              if (v39)
              {
                v48 = v29;
                v40 = -[HDHRConditionRule initWithDefinition:error:]([HDHRConditionRule alloc], "initWithDefinition:error:", v39, &v48);
                v41 = v48;

                condition = v9->_condition;
                v9->_condition = v40;

                v29 = v41;
              }
              v30 = v44;
              v18 = v9;

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", a5, 3, CFSTR("resource must have resourcePath"), v35);
              v18 = 0;
              v30 = v44;
            }

          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:underlyingError:", a5, 3, CFSTR("resource properties must be non-empty"), v32);
            v18 = 0;
            v29 = v32;
            v30 = v44;
          }
        }
        else if (a5)
        {
          v29 = objc_retainAutorelease(v29);
          v18 = 0;
          *a5 = v29;
        }
        else
        {
          _HKLogDroppedError();
          v18 = 0;
        }

        v27 = v29;
        v26 = v45;
        goto LABEL_50;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a5, 100, CFSTR("Couldn't construct ruleset resource for unknown clinical type \"%@\"), v12);
    }
    v18 = 0;
LABEL_54:

    goto LABEL_55;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a5, 100, CFSTR("Couldn't construct ruleset resource - init failed"));
  v18 = 0;
LABEL_55:

  return v18;
}

- (BOOL)evaluateWithObject:(id)a3
{
  HDHRConditionRule *condition;

  condition = self->_condition;
  return !condition || -[HDHRConditionRule evaluateWith:](condition, "evaluateWith:", a3);
}

- (HDHealthRecordClinicalType)clinicalType
{
  return self->_clinicalType;
}

- (NSArray)containReferences
{
  return self->_containReferences;
}

- (NSArray)APIReferenceRules
{
  return self->_APIReferenceRules;
}

- (NSArray)retrieveReferences
{
  return self->_retrieveReferences;
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (NSDictionary)medicalRecordProperties
{
  return self->_medicalRecordProperties;
}

- (NSArray)displayNameKeyPaths
{
  return self->_displayNameKeyPaths;
}

- (NSDictionary)redactionRules
{
  return self->_redactionRules;
}

- (HDHRConditionRule)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_redactionRules, 0);
  objc_storeStrong((id *)&self->_displayNameKeyPaths, 0);
  objc_storeStrong((id *)&self->_medicalRecordProperties, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_retrieveReferences, 0);
  objc_storeStrong((id *)&self->_APIReferenceRules, 0);
  objc_storeStrong((id *)&self->_containReferences, 0);
  objc_storeStrong((id *)&self->_clinicalType, 0);
}

@end
