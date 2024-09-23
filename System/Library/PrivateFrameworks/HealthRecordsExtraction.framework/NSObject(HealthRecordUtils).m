@implementation NSObject(HealthRecordUtils)

- (id)hd_stringValue
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (void *)objc_msgSend(a1, "copy");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "description");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "performSelector:", sel_stringValue);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (id)hd_stringArrayValue
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return MEMORY[0x24BDBD1A8];
  v2 = (void *)objc_msgSend(a1, "copy");
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hd_valueForKeyPath:()HealthRecordUtils rootResource:error:
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  int v22;
  uint64_t v23;
  id *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  id v76;
  _QWORD *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  id v97;
  id obj;
  _QWORD v99[4];
  id v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  id v107;
  id v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  objc_opt_class();
  v80 = v10;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v67 = v9;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObject+HealthRecordUtils.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[resource isKindOfClass:[HDOriginalFHIRResourceObject class]]"));

    v9 = v67;
  }
  v77 = a5;
  v78 = v9;
  +[HDHealthRecordsExtractionRule extractionRuleWithDefinition:error:](HDHealthRecordsExtractionRule, "extractionRuleWithDefinition:error:", v9, a5);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v79;
  if (!v79)
  {
    v13 = 0;
    goto LABEL_47;
  }
  v12 = a1;
  objc_msgSend(v79, "keyPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = 0;
  +[HDHRExtractionRulesKeyPathParser componentsFrom:error:](HDHRExtractionRulesKeyPathParser, "componentsFrom:error:", v13, &v108);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v108;
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (!v15)
  {
    _HKInitializeLogging();
    v30 = *MEMORY[0x24BDD2FF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
      -[NSObject(HealthRecordUtils) hd_valueForKeyPath:rootResource:error:].cold.1((uint64_t)v79, (uint64_t)v76, v30);
    v31 = v76;
    v32 = v31;
    if (v31)
    {
      if (v77)
        *v77 = objc_retainAutorelease(v31);
      else
        _HKLogDroppedError();
    }

    goto LABEL_45;
  }
  if (!v12)
  {
LABEL_45:
    v13 = 0;
    goto LABEL_46;
  }
  while (1)
  {
    if (!objc_msgSend(v15, "count"))
    {
      +[HDHealthRecordsExtractionRuleTransformer transformValue:rootResource:extractionRule:error:](HDHealthRecordsExtractionRuleTransformer, "transformValue:rootResource:extractionRule:error:", v12, v80, v79, v77);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v33;
      v13 = v12;
      goto LABEL_46;
    }
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectAtIndex:", 0);
    if (objc_msgSend(v17, "isEqualToString:", CFSTR("@contained")))
    {
      v102 = 0;
      v103 = &v102;
      v104 = 0x3032000000;
      v105 = __Block_byref_object_copy__3;
      v106 = __Block_byref_object_dispose__3;
      v107 = 0;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v99[0] = MEMORY[0x24BDAC760];
        v99[1] = 3221225472;
        v99[2] = __69__NSObject_HealthRecordUtils__hd_valueForKeyPath_rootResource_error___block_invoke;
        v99[3] = &unk_24ECF5830;
        v101 = &v102;
        v100 = v80;
        objc_msgSend(v12, "hk_map:", v99);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");
        if (v19 != objc_msgSend(v12, "count"))
        {
          v26 = (id)v103[5];
          v27 = v26;
          if (v26)
          {
            if (v77)
              *v77 = objc_retainAutorelease(v26);
            else
              _HKLogDroppedError();
          }

          v13 = 0;
          v22 = 1;
          goto LABEL_29;
        }

      }
      else
      {
        v24 = (id *)(v103 + 5);
        obj = (id)v103[5];
        +[HDHealthRecordsExtractionUtilities resourceReferencedBy:containedIn:error:](HDHealthRecordsExtractionUtilities, "resourceReferencedBy:containedIn:error:", v12, v80, &obj);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v24, obj);
        objc_msgSend(v25, "JSONObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v12 = 0;
          if (v103[5])
          {
            v22 = 1;
            v13 = 0;
            goto LABEL_29;
          }
          v18 = 0;
        }
      }
      v22 = 6;
      v12 = v18;
LABEL_29:
      _Block_object_dispose(&v102, 8);

      goto LABEL_33;
    }
    if (objc_msgSend(v17, "hasPrefix:", CFSTR("@extension")))
    {
      v97 = 0;
      objc_msgSend(v12, "hd_handleExtensionComponent:error:", v16, &v97);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v97;

      if (v20)
      {
        v22 = 6;
      }
      else
      {
        v28 = v21;
        v29 = v28;
        if (v28)
        {
          if (v77)
            *v77 = objc_retainAutorelease(v28);
          else
            _HKLogDroppedError();
        }

        v13 = 0;
        v22 = 1;
      }

      v12 = (id)v20;
LABEL_33:

      if (v22 != 6)
        goto LABEL_46;
      goto LABEL_34;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    objc_msgSend(v12, "valueForKey:", v17);
    v23 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v23;
LABEL_34:
    if (!v12)
      goto LABEL_45;
  }
  objc_msgSend(v15, "hk_map:", &__block_literal_global_4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "componentsJoinedByString:", CFSTR("."));
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v79, "definitionBySubstitutingKeyPathWith:", v70);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v12;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("@all")))
  {
    v74 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v37 = v36;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
    v39 = v37;
    if (v38)
    {
      v40 = *(_QWORD *)v94;
      v39 = v37;
      v71 = v37;
      while (2)
      {
        v41 = 0;
        v42 = v39;
        do
        {
          if (*(_QWORD *)v94 != v40)
            objc_enumerationMutation(v71);
          v43 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v41);
          v92 = 0;
          objc_msgSend(v43, "hd_valueForKeyPath:rootResource:error:", v75, v80, &v92);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v92;

          if (v39)
          {
            objc_msgSend(v74, "addObject:", v39);
          }
          else
          {
            v45 = v44;
            if (v45)
            {
              v55 = v45;
              if (v77)
                *v77 = objc_retainAutorelease(v45);
              else
                _HKLogDroppedError();

              goto LABEL_93;
            }
          }

          ++v41;
          v42 = v39;
        }
        while (v38 != v41);
        v37 = v71;
        v38 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
        if (v38)
          continue;
        break;
      }
    }

    v46 = v74;
    v47 = v74;
    goto LABEL_60;
  }
  if (!objc_msgSend(v17, "isEqualToString:", CFSTR("@any")))
  {
    if (!objc_msgSend(v17, "isEqualToString:", CFSTR("@concat")))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", v77, 3, CFSTR("keypath %@ at key «%@» needs to handle array"), v78, v17);
      v13 = 0;
      v39 = v36;
      goto LABEL_105;
    }
    v56 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v57 = v36;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v82, v109, 16);
    v74 = v56;
    v39 = v57;
    if (v58)
    {
      v73 = *(id *)v83;
      v39 = v57;
      v69 = v57;
      do
      {
        v59 = 0;
        v60 = v39;
        do
        {
          if (*(id *)v83 != v73)
            objc_enumerationMutation(v69);
          v61 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v59);
          v81 = 0;
          objc_msgSend(v61, "hd_valueForKeyPath:rootResource:error:", v75, v80, &v81);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v81;
          objc_msgSend(v62, "hd_stringValue");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            objc_msgSend(v74, "addObject:", v39);
          }
          else if (v63)
          {
            v65 = v63;
            v66 = v65;
            if (v77)
              *v77 = objc_retainAutorelease(v65);
            else
              _HKLogDroppedError();

LABEL_93:
            v39 = 0;
            v13 = 0;
            goto LABEL_103;
          }

          ++v59;
          v60 = v39;
        }
        while (v58 != v59);
        v57 = v69;
        v58 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v82, v109, 16);
      }
      while (v58);
    }

    v46 = v74;
    if (!objc_msgSend(v74, "count"))
    {
      v13 = 0;
      goto LABEL_104;
    }
    objc_msgSend(v74, "componentsJoinedByString:", CFSTR("\n\n"));
    v47 = (id)objc_claimAutoreleasedReturnValue();
LABEL_60:
    v13 = v47;
    goto LABEL_104;
  }
  v91 = 0u;
  v89 = 0u;
  v90 = 0u;
  v88 = 0u;
  v46 = v36;
  v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
  if (!v48)
  {
    v13 = 0;
    v39 = v46;
    goto LABEL_104;
  }
  v72 = *(id *)v89;
  v74 = v46;
  v13 = v46;
  while (2)
  {
    v49 = 0;
    v50 = v48;
    while (2)
    {
      if (*(id *)v89 != v72)
        objc_enumerationMutation(v74);
      v51 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v49);
      if (objc_msgSend(v70, "length"))
      {
        v87 = 0;
        v52 = (id *)&v87;
        objc_msgSend(v51, "hd_valueForKeyPath:rootResource:error:", v75, v80, &v87);
      }
      else
      {
        v86 = 0;
        v52 = (id *)&v86;
        +[HDHealthRecordsExtractionRuleTransformer transformValue:rootResource:extractionRule:error:](HDHealthRecordsExtractionRuleTransformer, "transformValue:rootResource:extractionRule:error:", v51, v80, v79, &v86);
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = *v52;

      if (v39)
      {
        v64 = v39;
LABEL_102:

        v13 = v39;
        goto LABEL_103;
      }
      v54 = v53;
      if (v54)
      {
        v53 = v54;
        if (v77)
          *v77 = objc_retainAutorelease(v54);
        else
          _HKLogDroppedError();

        goto LABEL_102;
      }
      v13 = 0;
      if (v50 != ++v49)
        continue;
      break;
    }
    v48 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v88, v110, 16);
    v13 = 0;
    if (v48)
      continue;
    break;
  }
  v39 = 0;
LABEL_103:
  v46 = v74;
LABEL_104:

LABEL_105:
  v12 = v39;
LABEL_46:

  v11 = v79;
LABEL_47:

  return v13;
}

- (id)hd_handleExtensionComponent:()HealthRecordUtils error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(v6, "parenthesisContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v6, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_assignError:code:format:", a4, 3, CFSTR("A valid extraction rules component has content between parenthesis, this one doesn't: %@"), v12);

LABEL_7:
    v10 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Extensions can only be found on dictionary instances, not on %@"), objc_opt_class());
    goto LABEL_7;
  }
  objc_msgSend(v6, "parenthesisContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDFHIRExtensionProcessor extensionsForURL:inJSONDictionary:error:](HDFHIRExtensionProcessor, "extensionsForURL:inJSONDictionary:error:", v8, a1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "hk_map:", &__block_literal_global_226);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

LABEL_10:
  return v10;
}

- (void)hd_valueForKeyPath:()HealthRecordUtils rootResource:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_224DAC000, log, OS_LOG_TYPE_ERROR, "Failed to parse key path of extraction rule %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
