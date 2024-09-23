@implementation NSMappingModelBuilder

uint64_t __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (a3)
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, objc_msgSend(a2, "renamingIdentifier"));
  else
    v5 = objc_msgSend(a2, "renamingIdentifier");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a2, v5);
  return objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "name"));
}

uint64_t __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v20;
    v8 = 0x1E1EDA000uLL;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(a2);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isNSArray"))
        {
          v11 = *(_QWORD *)(a1 + 32);
LABEL_8:
          (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(*(_QWORD *)(v11 + 8) + 40) + 16))(*(_QWORD *)(*(_QWORD *)(v11 + 8) + 40), v10, a3);
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v8;
          v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
          v14 = objc_msgSend(v10, "elements");
          v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, objc_msgSend(v10, "name"));
          v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
          v17 = v13;
          v8 = v12;
          v16(v17, v14, v15);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = *(_QWORD *)(a1 + 40);
            goto LABEL_8;
          }
        }
LABEL_11:
        ++v9;
      }
      while (v6 != v9);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

void __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  _BOOL4 v36;
  NSPropertyTransform *v37;
  void *v38;
  uint64_t v39;
  NSPropertyMapping *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  NSPropertyTransform *v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSPropertyTransform *v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  int v102;
  int v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  NSPropertyTransform *v117;
  NSPropertyTransform *v118;
  NSPropertyTransform *v119;
  const char *v120;
  NSPropertyTransform *v121;
  void *v122;
  uint64_t v123;
  const __CFString *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const __CFString *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  uint64_t v142;
  NSPropertyTransform *v143;
  _QWORD v144[2];

  v144[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "isTransient") & 1) != 0)
    return;
  if (a3)
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, objc_msgSend(a2, "renamingIdentifier"));
  else
    v6 = objc_msgSend(a2, "renamingIdentifier");
  v7 = v6;
  v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v9 = objc_msgSend(a2, "_propertyType");
  v10 = objc_msgSend(v8, "_propertyType");
  v142 = v9;
  if (v8 && v10 != v9)
  {
    if ((int)objc_msgSend((id)objc_opt_class(), "migrationDebugLevel") >= 2)
    {
      objc_msgSend(v8, "name");
      _NSCoreDataLog(2, (uint64_t)CFSTR("(migration) destination model property (renaming identifier '%@') matches the renaming identifier for a different type of property (%@) in the source model. Properties cannot be mapped to other property types.\n"), v11, v12, v13, v14, v15, v16, v7);
    }
    v8 = 0;
  }
  v17 = 56;
  if (!v8)
    v17 = 48;
  objc_msgSend(*(id *)(a1 + v17), "addObject:", objc_msgSend(a2, "_qualifiedName"));
  if (!objc_msgSend(a2, "_isAttribute"))
  {
    if (!objc_msgSend(a2, "_isRelationship") || (v139 = *(_QWORD *)(a1 + 40)) == 0)
    {
LABEL_152:
      if ((int)objc_msgSend((id)objc_opt_class(), "migrationDebugLevel") >= 2)
      {
        objc_msgSend(v8, "name");
        _NSCoreDataLog(1, (uint64_t)CFSTR("(migration) uninferrable, non-transient property type '%u' for destination model property (renaming identifier '%@'), source model property (renaming identifier '%@')."), v125, v126, v127, v128, v129, v130, v142);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
      return;
    }
    v136 = objc_msgSend(a2, "name");
    if (v8)
    {
      v22 = objc_msgSend(v8, "name");
      if ((objc_msgSend(v8, "isOptional") & 1) == 0
        && (!objc_msgSend(v8, "isToMany") || objc_msgSend(v8, "minCount"))
        || (objc_msgSend(a2, "isOptional") & 1) != 0
        || objc_msgSend(a2, "isToMany") && !objc_msgSend(a2, "minCount"))
      {
        v30 = 0;
      }
      else
      {
        if ((int)objc_msgSend((id)objc_opt_class(), "migrationDebugLevel") >= 2)
        {
          v23 = objc_msgSend(*(id *)(v139 + 24), "sourceEntityName");
          objc_msgSend(*(id *)(v139 + 24), "destinationEntityName");
          _NSCoreDataLog(2, (uint64_t)CFSTR("(migration) relationship mapping for (%@->%@ to %@->%@) requires data validation during store migration, mapping a previously optional relationship to a mandatory relationship.\n"), v24, v25, v26, v27, v28, v29, v23);
        }
        v30 = 1;
      }
      if (objc_msgSend(v8, "isToMany") && !objc_msgSend(a2, "isToMany"))
      {
        v82 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v81 = objc_msgSend(v82, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134190, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v136, CFSTR("property"), objc_msgSend(*(id *)(v139 + 24), "destinationEntityName"), CFSTR("entity"), CFSTR("Can not map from a to-many to a to-one relationship"), CFSTR("reason"), 0));
        goto LABEL_83;
      }
      v53 = (void *)MEMORY[0x1E0CB35D0];
      v54 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("source"));
      v55 = objc_msgSend(v53, "expressionForFunction:selectorName:arguments:", v54, CFSTR("valueForKey:"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v22)));
      v56 = (void *)MEMORY[0x1E0CB35D0];
      v57 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("manager"));
      v58 = objc_msgSend(v56, "expressionForFunction:selectorName:arguments:", v57, CFSTR("destinationInstancesForSourceRelationshipNamed:sourceInstances:"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v22), v55, 0));
      v59 = [NSPropertyTransform alloc];
      v143 = -[NSPropertyTransform initWithPropertyName:valueExpression:](v59, "initWithPropertyName:valueExpression:", v136, objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v22));
      v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &v143, 1);

      if (v60)
      {
LABEL_70:
        v40 = objc_alloc_init(NSPropertyMapping);
        -[NSPropertyMapping setName:](v40, "setName:", v136);
        -[NSPropertyMapping setValueExpression:](v40, "setValueExpression:", v58);
        -[NSPropertyMapping _setPropertyTransforms:](v40, v60);

        if (v30)
        {
          v61 = objc_alloc(MEMORY[0x1E0C99D80]);
          v62 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v63 = (void *)objc_msgSend(v61, "initWithObjectsAndKeys:", v62, _NSInferredMappingCouldFailValidation, 0);
          -[NSPropertyMapping setUserInfo:](v40, "setUserInfo:", v63);
          v144[0] = NSPropertyTransformMandatoryPropertyValidation;
          -[NSPropertyMapping _setTransformValidations:](v40, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 1));
          v64 = (void *)objc_msgSend(*(id *)(v139 + 24), "userInfo");
          if (v64)
          {
            v65 = v64;
            if ((objc_msgSend((id)objc_msgSend(v64, "objectForKey:", _NSInferredMappingCouldFailValidation), "BOOLValue") & 1) == 0)
            {
              v66 = (void *)objc_msgSend(v65, "mutableCopy");
              v67 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
              objc_msgSend(v66, "setObject:forKey:", v67, _NSInferredMappingCouldFailValidation);
              objc_msgSend(*(id *)(v139 + 24), "setUserInfo:", v66);

            }
          }
          else
          {
            objc_msgSend(*(id *)(v139 + 24), "setUserInfo:", v63);
          }

        }
        if (!v40)
          goto LABEL_152;
        v90 = (id *)(a1 + 80);
        goto LABEL_96;
      }
    }
    else
    {
      if ((objc_msgSend(a2, "isOptional") & 1) != 0
        || objc_msgSend(a2, "isToMany") && !objc_msgSend(a2, "minCount"))
      {
        v30 = 0;
      }
      else
      {
        if ((int)objc_msgSend((id)objc_opt_class(), "migrationDebugLevel") >= 2)
        {
          v71 = objc_msgSend(*(id *)(v139 + 24), "destinationEntityName");
          _NSCoreDataLog(2, (uint64_t)CFSTR("(migration) relationship mapping for (%@->%@) requires data validation during store migration, mapping a new, mandatory relationship.\n"), v72, v73, v74, v75, v76, v77, v71);
        }
        v30 = 1;
      }
      v78 = [NSPropertyTransform alloc];
      v79 = objc_msgSend(a2, "name");
      v143 = -[NSPropertyTransform initWithPropertyName:valueExpression:](v78, "initWithPropertyName:valueExpression:", v79, objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", 0));
      v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &v143, 1);

      v58 = 0;
      if (v60)
        goto LABEL_70;
    }
    v80 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v81 = objc_msgSend(v80, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134190, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v136, CFSTR("property"), objc_msgSend(*(id *)(v139 + 24), "destinationEntityName"), CFSTR("entity"), CFSTR("Unable to infer mapping for relationship"), CFSTR("reason"), 0));
LABEL_83:
    *(_QWORD *)(v139 + 32) = v81;
    goto LABEL_152;
  }
  v18 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", a3);
  if (v18)
    v18 = objc_msgSend(*(id *)(a1 + 64), "objectForKey:", a3);
  v19 = *(_QWORD *)(a1 + 40);
  if (v18)
    v20 = v18;
  else
    v20 = a3;
  if (!v19)
    goto LABEL_152;
  if (v20)
    v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v20, objc_msgSend(a2, "name"));
  else
    v21 = objc_msgSend(a2, "name");
  v31 = v21;
  if (v8)
  {
    v140 = v21;
    if (!objc_msgSend((id)objc_msgSend(a2, "userInfo"), "objectForKey:", CFSTR("NSMigrationAllowTypeTransformation"))
      || (v32 = objc_msgSend(v8, "attributeType"), v32 == objc_msgSend(a2, "attributeType"))
      && (objc_msgSend(a2, "attributeType") == 1000 || objc_msgSend(a2, "attributeType") == 1800))
    {
      v33 = objc_msgSend(v8, "attributeType");
      v34 = objc_msgSend(a2, "attributeType");
      v31 = v140;
      if (!v33 || !v34)
      {
LABEL_148:
        v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v69 = *MEMORY[0x1E0CB28A8];
        v122 = (void *)MEMORY[0x1E0C99D80];
        v123 = objc_msgSend(*(id *)(v19 + 24), "destinationEntityName");
        v133 = CFSTR("reason");
        v134 = 0;
        v124 = CFSTR("Source and destination attribute types are incompatible");
LABEL_149:
        v70 = objc_msgSend(v122, "dictionaryWithObjectsAndKeys:", v31, CFSTR("property"), v123, CFSTR("entity"), v124, v133, v134);
        goto LABEL_150;
      }
      if (v33 != v34)
      {
        v35 = 1;
        if (v33 > 399)
        {
          if (v33 != 400 && v33 != 500 && v33 != 600)
            goto LABEL_101;
        }
        else if (v33 != 100 && v33 != 200 && v33 != 300)
        {
LABEL_101:
          v35 = 0;
        }
        if (v34 > 399)
        {
          if (v34 != 400 && v34 != 600 && v34 != 500)
          {
LABEL_145:
            if (v34 != 800)
              v35 = 0;
            if ((v35 & 1) == 0)
              goto LABEL_148;
            goto LABEL_113;
          }
        }
        else if (v34 != 100 && v34 != 200 && v34 != 300)
        {
          goto LABEL_145;
        }
        if (v33 == 800)
          v35 = 1;
        if ((v35 & 1) == 0)
          goto LABEL_148;
      }
    }
    else
    {
      if ((objc_msgSend(v8, "attributeType") != 1800 || objc_msgSend(a2, "attributeType") != 1000)
        && (objc_msgSend(v8, "attributeType") != 1000 || objc_msgSend(a2, "attributeType") != 1800))
      {
        v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v69 = *MEMORY[0x1E0CB28A8];
        v70 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v140, CFSTR("property"), objc_msgSend(*(id *)(v19 + 24), "destinationEntityName"), CFSTR("entity"), CFSTR("Type Transformation expects NSTransformableAttributeType or NSBinaryDataAttributeType"), CFSTR("reason"), 0);
LABEL_150:
        v50 = v70;
        v51 = v68;
        v52 = v69;
        goto LABEL_151;
      }
      if (objc_msgSend(v8, "attributeType") == 1000 && (objc_msgSend(v8, "storesBinaryDataExternally") & 1) != 0
        || objc_msgSend(a2, "attributeType") == 1000 && objc_msgSend(a2, "storesBinaryDataExternally"))
      {
        v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49 = *MEMORY[0x1E0CB28A8];
        v50 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v140, CFSTR("property"), objc_msgSend(*(id *)(v19 + 24), "destinationEntityName"), CFSTR("entity"), CFSTR("Type Transformation expects NSBinaryDataAttributeType NOT to be stored externally"), CFSTR("reason"), 0);
        v51 = v48;
        v52 = v49;
LABEL_151:
        *(_QWORD *)(v19 + 32) = objc_msgSend(v51, "initWithDomain:code:userInfo:", v52, 134190, v50);
        goto LABEL_152;
      }
      v137 = objc_msgSend(v8, "name");
      +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", objc_msgSend(v8, "attributeType"));
      objc_msgSend(a2, "name");
      +[NSAttributeDescription stringForAttributeType:](NSAttributeDescription, "stringForAttributeType:", objc_msgSend(a2, "attributeType"));
      _NSCoreDataLog(2, (uint64_t)CFSTR("Transforming %@ (%@) to %@ (%@), was %@"), v91, v92, v93, v94, v95, v96, v137);
      v31 = v140;
    }
LABEL_113:
    if (a3)
      v97 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, objc_msgSend(v8, "name"));
    else
      v97 = objc_msgSend(v8, "name");
    v98 = v97;
    if (!objc_msgSend(v8, "isOptional") || (objc_msgSend(a2, "isOptional") & 1) != 0)
    {
      if (objc_msgSend(a2, "attributeType") == 1000
        && objc_msgSend(a2, "storesBinaryDataExternally")
        && (objc_msgSend(v8, "storesBinaryDataExternally") & 1) == 0)
      {
        v104 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v98);
        v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObject:", v104);
        v99 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:selectorName:arguments:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject"), CFSTR("_prependExternalBlobToken:"), v105);

        goto LABEL_125;
      }
      if (objc_msgSend(a2, "attributeType") != 1000
        || !objc_msgSend(v8, "storesBinaryDataExternally")
        || objc_msgSend(a2, "storesBinaryDataExternally"))
      {
        v99 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v98);
LABEL_125:
        v100 = (void *)MEMORY[0x1E0CB35D0];
        v101 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("source"));
        v39 = objc_msgSend(v100, "expressionForFunction:selectorName:arguments:", v101, CFSTR("valueForKey:"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v98)));
        v143 = -[NSPropertyTransform initWithPropertyName:valueExpression:]([NSPropertyTransform alloc], "initWithPropertyName:valueExpression:", v140, v99);
        v31 = v140;
        v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &v143, 1);

        v102 = 0;
        goto LABEL_142;
      }
      v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v69 = *MEMORY[0x1E0CB28A8];
      v122 = (void *)MEMORY[0x1E0C99D80];
      v123 = objc_msgSend(*(id *)(v19 + 24), "destinationEntityName");
      v133 = CFSTR("Reason");
      v134 = 0;
LABEL_158:
      v124 = CFSTR("Unable to use inferred mapping to move external reference into store.");
      goto LABEL_149;
    }
    if (objc_msgSend(a2, "defaultValue"))
    {
      v103 = 0;
    }
    else
    {
      if ((int)objc_msgSend((id)objc_opt_class(), "migrationDebugLevel") >= 2)
      {
        v106 = objc_msgSend(*(id *)(v19 + 24), "sourceEntityName");
        objc_msgSend(*(id *)(v19 + 24), "destinationEntityName");
        _NSCoreDataLog(2, (uint64_t)CFSTR("(migration) attribute mapping for (%@->%@ to %@->%@) requires data validation during store migration, mapping a previously optional attribute to a mandatory attribute without a default value.\n"), v107, v108, v109, v110, v111, v112, v106);
      }
      v103 = 1;
    }
    if (objc_msgSend(a2, "attributeType") == 1000
      && objc_msgSend(a2, "storesBinaryDataExternally")
      && (objc_msgSend(v8, "storesBinaryDataExternally") & 1) == 0)
    {
      v141 = v103;
      v131 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v98);
      v132 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObject:", v131);
      v138 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForFunction:selectorName:arguments:", objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject"), CFSTR("_prependExternalBlobToken:"), v132);

    }
    else
    {
      if (objc_msgSend(a2, "attributeType") == 1000
        && objc_msgSend(v8, "storesBinaryDataExternally")
        && !objc_msgSend(a2, "storesBinaryDataExternally"))
      {
        v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v69 = *MEMORY[0x1E0CB28A8];
        v122 = (void *)MEMORY[0x1E0C99D80];
        v123 = objc_msgSend(*(id *)(v19 + 24), "destinationEntityName");
        v133 = 0;
        goto LABEL_158;
      }
      v141 = v103;
      v138 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", v98);
    }
    v113 = (void *)MEMORY[0x1E0CB35D0];
    v135 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("entityPolicy"));
    v114 = (void *)MEMORY[0x1E0C99D20];
    v115 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v31);
    v116 = objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("source"));
    v39 = objc_msgSend(v113, "expressionForFunction:selectorName:arguments:", v135, CFSTR("_nonNilValueOrDefaultValueForAttribute:source:destination:"), objc_msgSend(v114, "arrayWithObjects:", v115, v116, objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForVariable:", CFSTR("destination")), 0));
    v117 = -[NSPropertyTransform initWithPropertyName:valueExpression:]([NSPropertyTransform alloc], "initWithPropertyName:valueExpression:", v31, v138);
    v118 = [NSPropertyTransform alloc];
    v119 = -[NSPropertyTransform initWithPropertyName:valueExpression:](v118, "initWithPropertyName:valueExpression:", v31, objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", objc_msgSend(a2, "defaultValue")));
    v121 = v119;
    if (v119)
    {
      objc_setProperty_nonatomic(v119, v120, v117, 24);
      v121->_replaceMissingValueOnly = 1;
    }
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v117, v121, 0);

    v102 = v141;
LABEL_142:
    v36 = v102 != 0;
    if (!v38)
    {
LABEL_143:
      v68 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v69 = *MEMORY[0x1E0CB28A8];
      v70 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v31, CFSTR("property"), objc_msgSend(*(id *)(v19 + 24), "destinationEntityName"), CFSTR("entity"), CFSTR("Unable to infer mapping for attribute"), CFSTR("reason"), 0);
      goto LABEL_150;
    }
    goto LABEL_49;
  }
  if ((objc_msgSend(a2, "isOptional") & 1) != 0 || objc_msgSend(a2, "defaultValue"))
  {
    v36 = 0;
  }
  else
  {
    if ((int)objc_msgSend((id)objc_opt_class(), "migrationDebugLevel") >= 2)
    {
      v83 = objc_msgSend(*(id *)(v19 + 24), "destinationEntityName");
      _NSCoreDataLog(2, (uint64_t)CFSTR("(migration) attribute mapping for (%@->%@) requires data validation during store migration, mapping a new, mandatory attribute without a default value.\n"), v84, v85, v86, v87, v88, v89, v83);
    }
    v36 = 1;
  }
  v37 = [NSPropertyTransform alloc];
  v143 = -[NSPropertyTransform initWithPropertyName:valueExpression:](v37, "initWithPropertyName:valueExpression:", v31, objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", objc_msgSend(a2, "defaultValue")));
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", &v143, 1);

  v39 = 0;
  if (!v38)
    goto LABEL_143;
LABEL_49:
  v40 = objc_alloc_init(NSPropertyMapping);
  -[NSPropertyMapping setName:](v40, "setName:", v31);
  -[NSPropertyMapping setValueExpression:](v40, "setValueExpression:", v39);
  -[NSPropertyMapping _setPropertyTransforms:](v40, v38);

  if (v36)
  {
    v41 = objc_alloc(MEMORY[0x1E0C99D80]);
    v42 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v43 = (void *)objc_msgSend(v41, "initWithObjectsAndKeys:", v42, _NSInferredMappingCouldFailValidation, 0);
    -[NSPropertyMapping setUserInfo:](v40, "setUserInfo:", v43);
    v144[0] = NSPropertyTransformMandatoryPropertyValidation;
    -[NSPropertyMapping _setTransformValidations:](v40, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v144, 1));
    v44 = (void *)objc_msgSend(*(id *)(v19 + 24), "userInfo");
    if (v44)
    {
      v45 = v44;
      if ((objc_msgSend((id)objc_msgSend(v44, "objectForKey:", _NSInferredMappingCouldFailValidation), "BOOLValue") & 1) == 0)
      {
        v46 = (void *)objc_msgSend(v45, "mutableCopy");
        v47 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        objc_msgSend(v46, "setObject:forKey:", v47, _NSInferredMappingCouldFailValidation);
        objc_msgSend(*(id *)(v19 + 24), "setUserInfo:", v46);

      }
    }
    else
    {
      objc_msgSend(*(id *)(v19 + 24), "setUserInfo:", v43);
    }

  }
  if (!v40)
    goto LABEL_152;
  v90 = (id *)(a1 + 72);
LABEL_96:
  objc_msgSend(*v90, "addObject:", v40);

  if (v8)
    objc_msgSend(*(id *)(a1 + 88), "removeObject:", objc_msgSend(v8, "name"));
}

uint64_t __64___NSMappingModelBuilder_inferPropertyMappingsForEntityMapping___block_invoke_4(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v22;
    v20 = a1;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(a2);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isNSArray"))
        {
          v11 = a1[5];
LABEL_8:
          (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(*(_QWORD *)(v11 + 8) + 40) + 16))(*(_QWORD *)(*(_QWORD *)(v11 + 8) + 40), v10, a3);
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v10, "renamingIdentifier")
            && (objc_msgSend((id)objc_msgSend(v10, "renamingIdentifier"), "isEqualToString:", objc_msgSend(v10, "name")) & 1) == 0)
          {
            v19 = (void *)a1[4];
            v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, objc_msgSend(v10, "name"));
            objc_msgSend(v19, "setObject:forKey:", v16, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, objc_msgSend(v10, "renamingIdentifier")));
            v12 = *(_QWORD *)(*(_QWORD *)(v20[5] + 8) + 40);
            v13 = objc_msgSend(v10, "elements");
            v14 = (void *)MEMORY[0x1E0CB3940];
            v15 = objc_msgSend(v10, "renamingIdentifier");
          }
          else
          {
            v12 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
            v13 = objc_msgSend(v10, "elements");
            v14 = (void *)MEMORY[0x1E0CB3940];
            v15 = objc_msgSend(v10, "name");
          }
          v17 = objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@"), a3, v15);
          v18 = v13;
          a1 = v20;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v18, v17);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = a1[6];
            goto LABEL_8;
          }
        }
LABEL_17:
        ++v9;
      }
      while (v7 != v9);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

@end
