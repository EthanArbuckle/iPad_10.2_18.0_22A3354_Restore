@implementation HMDManagedObjectCodingModel

- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntityName:(id)a5
{
  return -[HMDManagedObjectCodingModel initWithModel:configNamespace:rootEntityName:options:](self, "initWithModel:configNamespace:rootEntityName:options:", a3, a4, a5, objc_msgSend((id)objc_opt_class(), "defaultOptions"));
}

- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntityName:(id)a5 options:(unint64_t)a6
{
  void *v11;
  void *v12;
  HMDManagedObjectCodingModel *v13;

  objc_msgSend(a3, "entitiesByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDManagedObjectCodingModel initWithModel:configNamespace:rootEntity:options:](self, "initWithModel:configNamespace:rootEntity:options:", a3, a4, v12, a6);

  return v13;
}

- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntity:(id)a5
{
  return -[HMDManagedObjectCodingModel initWithModel:configNamespace:rootEntity:options:](self, "initWithModel:configNamespace:rootEntity:options:", a3, a4, a5, objc_msgSend((id)objc_opt_class(), "defaultOptions"));
}

- (HMDManagedObjectCodingModel)initWithModel:(id)a3 configNamespace:(id)a4 rootEntity:(id)a5 options:(unint64_t)a6
{
  HMDManagedObjectCodingModel *result;
  uint64_t v10;
  NSString *typeIDConfigKey;
  uint64_t v12;
  NSString *keyAttributesConfigKey;
  uint64_t v14;
  NSString *refContextConfigKey;
  uint64_t v16;
  NSString *includeConfigKey;
  uint64_t v18;
  NSString *codingKeyConfigKey;
  uint64_t v20;
  NSString *transformerConfigKey;
  uint64_t v22;
  NSString *inlineConfigKey;
  uint64_t v24;
  NSString *conditionalConfigKey;
  NSString *v26;
  NSString *v27;
  NSOrderedSet *v28;
  NSOrderedSet *conditions;
  void *v30;
  void *v31;
  void *v32;
  HMDEntityCodingDescription *v33;
  HMDManagedObjectCodingModel *v34;
  uint64_t v35;
  void *options;
  __CFString *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HMDManagedObjectCodingModel *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSString *v62;
  uint64_t v63;
  NSString *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  NSString *v69;
  uint64_t v70;
  NSString *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  NSString *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  NSDictionary *v81;
  NSDictionary *v82;
  NSDictionary *v83;
  uint64_t v84;
  HMDManagedObjectCodingModel *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t v91;
  NSDictionary *descriptions;
  NSDictionary *v93;
  void *v94;
  NSString *v95;
  Class v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t i;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t j;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  HMDEntityCodingDescription *root;
  uint64_t v121;
  NSDictionary *v122;
  uint64_t v123;
  NSOrderedSet *v124;
  HMDManagedObjectCodingModel *v125;
  void *v126;
  __CFString *v127;
  id v129;
  void *v130;
  void *v131;
  HMDManagedObjectCodingModel *v132;
  HMDManagedObjectCodingModel *v133;
  void *v134;
  void *v135;
  id v136;
  void *v137;
  HMDManagedObjectCodingModel *v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  objc_super v147;
  objc_super v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t (*v156)(uint64_t, uint64_t);
  void (*v157)(uint64_t);
  id v158;
  _BYTE v159[128];
  uint8_t v160[128];
  _BYTE buf[24];
  void *v162;
  HMDManagedObjectCodingModel *v163;
  id v164;
  uint64_t *v165;
  __int128 *v166;
  uint64_t v167;
  uint64_t v168;

  v168 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    _HMFPreconditionFailure();
    goto LABEL_84;
  }
  if (!a4)
  {
LABEL_84:
    _HMFPreconditionFailure();
LABEL_85:
    _HMFPreconditionFailure();
LABEL_86:
    objc_msgSend(v130, "name");
    objc_claimAutoreleasedReturnValue();
    _HMFPreconditionFailureWithFormat();
LABEL_89:
    __break(1u);
  }
  if (!a5)
    goto LABEL_85;
  v147.receiver = self;
  v147.super_class = (Class)HMDManagedObjectCodingModel;
  result = -[HMDManagedObjectCodingModel init](&v147, sel_init);
  v138 = result;
  if (result)
  {
    objc_storeStrong((id *)&result->_model, a3);
    v138->_options = a6;
    objc_msgSend(a4, "stringByAppendingString:", CFSTR("TypeID"));
    v10 = objc_claimAutoreleasedReturnValue();
    typeIDConfigKey = v138->_typeIDConfigKey;
    v138->_typeIDConfigKey = (NSString *)v10;

    objc_msgSend(a4, "stringByAppendingString:", CFSTR("KeyAttributes"));
    v12 = objc_claimAutoreleasedReturnValue();
    keyAttributesConfigKey = v138->_keyAttributesConfigKey;
    v138->_keyAttributesConfigKey = (NSString *)v12;

    objc_msgSend(a4, "stringByAppendingString:", CFSTR("RefContext"));
    v14 = objc_claimAutoreleasedReturnValue();
    refContextConfigKey = v138->_refContextConfigKey;
    v138->_refContextConfigKey = (NSString *)v14;

    objc_msgSend(a4, "stringByAppendingString:", CFSTR("Include"));
    v16 = objc_claimAutoreleasedReturnValue();
    includeConfigKey = v138->_includeConfigKey;
    v138->_includeConfigKey = (NSString *)v16;

    objc_msgSend(a4, "stringByAppendingString:", CFSTR("Key"));
    v18 = objc_claimAutoreleasedReturnValue();
    codingKeyConfigKey = v138->_codingKeyConfigKey;
    v138->_codingKeyConfigKey = (NSString *)v18;

    objc_msgSend(a4, "stringByAppendingFormat:", CFSTR("Transformer"));
    v20 = objc_claimAutoreleasedReturnValue();
    transformerConfigKey = v138->_transformerConfigKey;
    v138->_transformerConfigKey = (NSString *)v20;

    objc_msgSend(a4, "stringByAppendingString:", CFSTR("Inline"));
    v22 = objc_claimAutoreleasedReturnValue();
    inlineConfigKey = v138->_inlineConfigKey;
    v138->_inlineConfigKey = (NSString *)v22;

    objc_msgSend(a4, "stringByAppendingString:", CFSTR("Conditional"));
    v24 = objc_claimAutoreleasedReturnValue();
    conditionalConfigKey = v138->_conditionalConfigKey;
    v138->_conditionalConfigKey = (NSString *)v24;

    objc_msgSend(a4, "stringByAppendingString:", CFSTR("ContextualizeConditions:userContext:"));
    v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    v138->_contextualizeConditionsSelector = NSSelectorFromString(v26);

    objc_msgSend(a4, "stringByAppendingString:", CFSTR("AttributeValueForKey:userContext:"));
    v27 = (NSString *)objc_claimAutoreleasedReturnValue();
    v138->_attributeValueForKeySelector = NSSelectorFromString(v27);

    v28 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    conditions = v138->_conditions;
    v138->_conditions = v28;

    v129 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", a5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "count"))
    {
      while (1)
      {
        objc_msgSend(v30, "lastObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeLastObject");
        objc_msgSend(v31, "name");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "objectForKeyedSubscript:", v131);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
          break;
LABEL_75:

        if (!objc_msgSend(v30, "count"))
          goto LABEL_76;
      }
      v33 = [HMDEntityCodingDescription alloc];
      if (!v33
        || (v148.receiver = v33,
            v148.super_class = (Class)HMDEntityCodingDescription,
            v34 = -[HMDManagedObjectCodingModel init](&v148, sel_init),
            (v132 = v34) == 0))
      {
        v44 = 0;
LABEL_55:
        v133 = v44;
        objc_msgSend(v129, "setObject:forKeyedSubscript:");
        v145 = 0u;
        v146 = 0u;
        v143 = 0u;
        v144 = 0u;
        -[HMDManagedObjectCodingModel concreteSubentitiesByTypeID](v133, "concreteSubentitiesByTypeID");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "allValues");
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v143, v160, 16);
        if (v107)
        {
          v108 = *(_QWORD *)v144;
          do
          {
            for (i = 0; i != v107; ++i)
            {
              if (*(_QWORD *)v144 != v108)
                objc_enumerationMutation(v106);
              if (*(void **)(*((_QWORD *)&v143 + 1) + 8 * i) != v31)
                objc_msgSend(v30, "addObject:");
            }
            v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v143, v160, 16);
          }
          while (v107);
        }

        v141 = 0u;
        v142 = 0u;
        v139 = 0u;
        v140 = 0u;
        -[HMDManagedObjectCodingModel relationshipsByCodingKey](v133, "relationshipsByCodingKey");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "allValues");
        v111 = (void *)objc_claimAutoreleasedReturnValue();

        v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v139, v159, 16);
        if (v112)
        {
          v113 = *(_QWORD *)v140;
          do
          {
            for (j = 0; j != v112; ++j)
            {
              if (*(_QWORD *)v140 != v113)
                objc_enumerationMutation(v111);
              v115 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * j);
              objc_msgSend(v115, "relationship");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "destinationEntity");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v117);

              if (!v138->_hasAnyReferenceRelationships && objc_msgSend(v115, "isReference"))
                v138->_hasAnyReferenceRelationships = 1;
            }
            v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v139, v159, 16);
          }
          while (v112);
        }

        goto LABEL_75;
      }
      objc_storeStrong((id *)&v34->_model, v31);
      -[HMDManagedObjectCodingModel typeIdForEntity:]((uint64_t)v138, v31);
      v35 = objc_claimAutoreleasedReturnValue();
      options = (void *)v132->_options;
      v132->_options = v35;

      v37 = v138->_keyAttributesConfigKey;
      v38 = v31;
      v130 = v38;
      if (v38)
      {
        v127 = v37;
        v39 = v38;
        do
        {
          objc_msgSend(v39, "userInfo");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", v138->_keyAttributesConfigKey);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v42 = v41;
          else
            v42 = 0;
          v136 = v42;

          objc_msgSend(v39, "superentity");
          v134 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = v134;
        }
        while (v134 && !v136);
        if (v136)
        {
          objc_msgSend(v136, "componentsSeparatedByString:", CFSTR(","));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
      }
      else
      {
        v134 = 0;
      }

      objc_msgSend(v130, "uniquenessConstraints");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v136 = 0;
      v127 = CFSTR("unique constraint");
LABEL_21:
      if (!objc_msgSend(v43, "count"))
        goto LABEL_86;
      objc_msgSend(v130, "attributesByName");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v43, "count"));
      v151 = 0u;
      v152 = 0u;
      v149 = 0u;
      v150 = 0u;
      v48 = v43;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v149, buf, 16);
      if (v49)
      {
        v50 = *(_QWORD *)v150;
        do
        {
          for (k = 0; k != v49; ++k)
          {
            if (*(_QWORD *)v150 != v50)
              objc_enumerationMutation(v48);
            objc_msgSend(v46, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * k));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = v52;
            if (!v52)
              goto LABEL_86;
            if (objc_msgSend(v52, "isOptional"))
            {
              objc_msgSend(v130, "name");
              objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "name");
              objc_claimAutoreleasedReturnValue();
              _HMFPreconditionFailureWithFormat();
              goto LABEL_89;
            }
            objc_msgSend(v47, "addObject:", v53);

          }
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v149, buf, 16);
        }
        while (v49);
      }

      v126 = (void *)objc_msgSend(v47, "copy");
      -[HMDManagedObjectCodingModel mutableCodingKeyTableForProperties:]((uint64_t)v138, v126);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "copy");
      v56 = *(void **)&v132->_hasAnyReferenceRelationships;
      *(_QWORD *)&v132->_hasAnyReferenceRelationships = v55;

      objc_msgSend(*(id *)&v132->_hasAnyReferenceRelationships, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_59423);
      objc_msgSend(v130, "attributesByName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "allValues");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __57__HMDManagedObjectCodingModel_syncedAttributesForEntity___block_invoke;
      v162 = &unk_24E77DF28;
      v163 = v138;
      objc_msgSend(v58, "hmf_objectsPassingTest:", buf);
      v137 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDManagedObjectCodingModel mutableCodingKeyTableForProperties:]((uint64_t)v138, v137);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)&v132->_hasAnyReferenceRelationships, "allKeys");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "removeObjectsForKeys:", v60);

      v61 = objc_msgSend(v59, "copy");
      v62 = v132->_typeIDConfigKey;
      v132->_typeIDConfigKey = (NSString *)v61;

      -[HMDManagedObjectCodingModel reverseLookupTableForCodingKeyTable:](v132->_typeIDConfigKey);
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = v132->_keyAttributesConfigKey;
      v132->_keyAttributesConfigKey = (NSString *)v63;

      objc_msgSend(v130, "relationshipsByName");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "allValues");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __60__HMDManagedObjectCodingModel_syncedRelationshipsForEntity___block_invoke;
      v162 = &unk_24E77DF50;
      v163 = v138;
      v164 = v130;
      objc_msgSend(v66, "hmf_objectsPassingTest:", buf);
      v135 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDManagedObjectCodingModel mutableCodingKeyTableForProperties:]((uint64_t)v138, v135);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "copy");
      v69 = v132->_refContextConfigKey;
      v132->_refContextConfigKey = (NSString *)v68;

      -[HMDManagedObjectCodingModel reverseLookupTableForCodingKeyTable:](v132->_refContextConfigKey);
      v70 = objc_claimAutoreleasedReturnValue();
      v71 = v132->_includeConfigKey;
      v132->_includeConfigKey = (NSString *)v70;

      objc_msgSend(v130, "relationshipsByName");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "allValues");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __60__HMDManagedObjectCodingModel_parentRelationshipsForEntity___block_invoke;
      v162 = &unk_24E77DF50;
      v163 = v138;
      v164 = v130;
      objc_msgSend(v73, "hmf_objectsPassingTest:", buf);
      v74 = objc_claimAutoreleasedReturnValue();

      v75 = v132->_codingKeyConfigKey;
      v132->_codingKeyConfigKey = (NSString *)v74;

      v76 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __68__HMDManagedObjectCodingModel_concreteSubentitiesByTypeIDForEntity___block_invoke;
      v162 = &unk_24E77DED8;
      v163 = v138;
      v164 = v76;
      v165 = (uint64_t *)v130;
      v77 = v76;
      objc_msgSend(v130, "hmd_recursivelyEnumerateSubentitiesUsingBlock:", buf);
      v78 = (void *)objc_msgSend(v77, "copy");

      if ((unint64_t)objc_msgSend(v78, "count") > 1 || objc_msgSend(v130, "isAbstract"))
        v79 = v78;
      else
        v79 = 0;
      objc_storeStrong((id *)&v132->_transformerConfigKey, v79);
      objc_msgSend(v130, "userInfo");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "objectForKeyedSubscript:", v138->_refContextConfigKey);
      v81 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v82 = v81;
      else
        v82 = 0;
      v83 = v82;

      if (v83)
      {
        *(_QWORD *)&v149 = 0;
        *((_QWORD *)&v149 + 1) = &v149;
        *(_QWORD *)&v150 = 0x3032000000;
        *((_QWORD *)&v150 + 1) = __Block_byref_object_copy__59431;
        *(_QWORD *)&v151 = __Block_byref_object_dispose__59432;
        *((_QWORD *)&v151 + 1) = 0;
        v84 = -[NSDictionary rangeOfString:](v83, "rangeOfString:", CFSTR("="));
        v85 = v138;
        v86 = v84;
        if (v84 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!v84 || v84 + 1 >= (unint64_t)-[NSDictionary length](v83, "length"))
            goto LABEL_86;
          -[NSDictionary substringToIndex:](v83, "substringToIndex:", v86);
          v87 = objc_claimAutoreleasedReturnValue();
          v88 = *(void **)(*((_QWORD *)&v149 + 1) + 40);
          *(_QWORD *)(*((_QWORD *)&v149 + 1) + 40) = v87;

          -[NSDictionary substringFromIndex:](v83, "substringFromIndex:", v86 + 1);
          v81 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

          v85 = v138;
        }
        v153 = 0;
        v154 = &v153;
        v155 = 0x3032000000;
        v156 = __Block_byref_object_copy__59431;
        v157 = __Block_byref_object_dispose__59432;
        v89 = v130;
        v158 = v89;
        -[NSDictionary componentsSeparatedByString:](v81, "componentsSeparatedByString:", CFSTR("."));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = objc_msgSend(v90, "count");
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __76__HMDManagedObjectCodingModel_refContextCodingKey_keyPath_entity_forEntity___block_invoke;
        v162 = &unk_24E77DF00;
        v163 = v85;
        v164 = v89;
        v165 = &v153;
        v166 = &v149;
        v167 = v91 - 1;
        objc_msgSend(v90, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
        objc_storeStrong((id *)&v132->_root, *(id *)(*((_QWORD *)&v149 + 1) + 40));
        descriptions = v132->_descriptions;
        v132->_descriptions = v81;
        v93 = v81;

        objc_storeStrong((id *)&v132->_conditions, (id)v154[5]);
        _Block_object_dispose(&v153, 8);

        _Block_object_dispose(&v149, 8);
        objc_msgSend(*(id *)&v132->_hasAnyReferenceRelationships, "objectForKeyedSubscript:", v132->_root);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(descriptions) = v94 == 0;

        if ((descriptions & 1) == 0)
        {
          objc_msgSend(v89, "name");
          objc_claimAutoreleasedReturnValue();
          _HMFPreconditionFailureWithFormat();
          goto LABEL_89;
        }
      }
      objc_msgSend(v130, "managedObjectClassName");
      v95 = (NSString *)objc_claimAutoreleasedReturnValue();
      v96 = NSClassFromString(v95);

      if ((-[objc_class instancesRespondToSelector:](v96, "instancesRespondToSelector:", v138->_contextualizeConditionsSelector) & 1) == 0&& !class_addMethod(v96, v138->_contextualizeConditionsSelector, (IMP)defaultContextualizeIMP, "v@:@@"))
      {
        v97 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(v138->_contextualizeConditionsSelector);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v99;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v96;
          *(_WORD *)&buf[22] = 2114;
          v162 = v100;
          _os_log_impl(&dword_2218F0000, v98, OS_LOG_TYPE_ERROR, "%{public}@Failed to add default -[%{public}@ %{public}@] implementation", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v97);
      }
      if ((-[objc_class instancesRespondToSelector:](v96, "instancesRespondToSelector:", v138->_attributeValueForKeySelector) & 1) == 0&& !class_addMethod(v96, v138->_attributeValueForKeySelector, (IMP)defaultAttributeValueForKeyIMP, "@@:@@"))
      {
        v101 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v102 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(v138->_attributeValueForKeySelector);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v103;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v96;
          *(_WORD *)&buf[22] = 2114;
          v162 = v104;
          _os_log_impl(&dword_2218F0000, v102, OS_LOG_TYPE_ERROR, "%{public}@Failed to add default -[%{public}@ %{public}@] implementation", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v101);
      }

      v44 = v132;
      goto LABEL_55;
    }
LABEL_76:
    objc_msgSend(a5, "name");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "objectForKeyedSubscript:", v118);
    v119 = objc_claimAutoreleasedReturnValue();
    root = v138->_root;
    v138->_root = (HMDEntityCodingDescription *)v119;

    v121 = objc_msgSend(v129, "copy");
    v122 = v138->_descriptions;
    v138->_descriptions = (NSDictionary *)v121;

    v123 = -[NSOrderedSet count](v138->_conditions, "count");
    v124 = v138->_conditions;
    if (v123)
    {
      v123 = -[NSOrderedSet copy](v124, "copy");
      v125 = v138;
      v124 = v138->_conditions;
    }
    else
    {
      v125 = v138;
    }
    v125->_conditions = (NSOrderedSet *)v123;

    return v138;
  }
  return result;
}

- (BOOL)hasOnlyParentChildRelationships
{
  return !self->_hasAnyReferenceRelationships;
}

- (NSManagedObjectModel)objectModel
{
  return self->_model;
}

- (HMDEntityCodingDescription)rootDescription
{
  return self->_root;
}

- (NSArray)allDescriptions
{
  return -[NSDictionary allValues](self->_descriptions, "allValues");
}

- (id)descriptionForEntity:(id)a3
{
  NSDictionary *descriptions;
  void *v4;
  void *v5;

  descriptions = self->_descriptions;
  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](descriptions, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)descriptionForManagedObject:(id)a3
{
  NSDictionary *descriptions;
  void *v4;
  void *v5;
  void *v6;

  descriptions = self->_descriptions;
  objc_msgSend(a3, "entity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](descriptions, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)descriptionForAttribute:(id)a3
{
  NSDictionary *descriptions;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  descriptions = self->_descriptions;
  objc_msgSend(a3, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](descriptions, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionForAttribute:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)descriptionForRelationship:(id)a3
{
  NSDictionary *descriptions;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  descriptions = self->_descriptions;
  objc_msgSend(a3, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](descriptions, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionForRelationship:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)descriptionForDestinationOfRelationship:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "relationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDManagedObjectCodingModel descriptionForEntity:](self, "descriptionForEntity:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)subentityOfDescription:(id)a3 withTypeID:(id)a4
{
  void *v6;
  void *v7;
  NSDictionary *descriptions;
  void *v9;
  void *v10;

  objc_msgSend(a3, "concreteSubentitiesByTypeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    descriptions = self->_descriptions;
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](descriptions, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isValidCondition:(id)a3
{
  return +[HMDCodingConditionSet resolve:fromSet:]((uint64_t)HMDCodingConditionSet, (uint64_t)a3, self->_conditions) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionalConfigKey, 0);
  objc_storeStrong((id *)&self->_inlineConfigKey, 0);
  objc_storeStrong((id *)&self->_transformerConfigKey, 0);
  objc_storeStrong((id *)&self->_codingKeyConfigKey, 0);
  objc_storeStrong((id *)&self->_includeConfigKey, 0);
  objc_storeStrong((id *)&self->_refContextConfigKey, 0);
  objc_storeStrong((id *)&self->_keyAttributesConfigKey, 0);
  objc_storeStrong((id *)&self->_typeIDConfigKey, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_descriptions, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (id)typeIdForEntity:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  if (a1)
  {
    objc_msgSend(a2, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      v8 = v5;
    }
    else
    {
      objc_msgSend(a2, "name");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)mutableCodingKeyTableForProperties:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HMDAttributeCodingDescription *v12;
  id *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HMDRelationshipCodingDescription *v20;
  BOOL v21;
  int *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(a2, "count"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = a2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(void **)v46;
    v42 = (void *)*MEMORY[0x24BDD0E90];
    do
    {
      v8 = 0;
      v43 = v6;
      do
      {
        if (*(void **)v46 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v8);
        -[HMDManagedObjectCodingModel codingKeyForProperty:](a1, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v34 = (void *)v11;
          objc_msgSend(v9, "entity");
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "name");
          a1 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "name");
          v35 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v40 = v35;
          v41 = objc_claimAutoreleasedReturnValue();
          v38 = a1;
          v39 = (uint64_t)v10;
          _HMFPreconditionFailureWithFormat();
LABEL_50:
          v36 = *(_QWORD *)(a1 + 96);
LABEL_52:
          objc_msgSend(v9, "entity", v38, v39, v40, v41);
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "name");
          v37 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v39 = v37;
          v40 = objc_claimAutoreleasedReturnValue();
          v38 = v36;
          _HMFPreconditionFailureWithFormat();
LABEL_53:
          objc_msgSend(v9, "entity", v38, v39, v40);
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "name");
          objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = (uint64_t)v7;
          _HMFPreconditionFailureWithFormat();
LABEL_54:
          v38 = objc_opt_class();
          _HMFPreconditionFailureWithFormat();
LABEL_55:
          objc_msgSend(v9, "entity", v38, v39, v40);
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "name");
          objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "name");
          objc_claimAutoreleasedReturnValue();
          _HMFPreconditionFailureWithFormat();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = [HMDAttributeCodingDescription alloc];
          if (v12)
          {
            v13 = -[HMDPropertyCodingDescription initWithModel:property:](v12, a1, v9);
            if (!v13)
              goto LABEL_44;
            v14 = v7;
            v15 = objc_msgSend(v9, "attributeType");
            objc_msgSend(v9, "userInfo");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 96));
            v7 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v17 = v7;
            else
              v17 = 0;
            v18 = v17;

            if (v18 && v15 != 1800)
              goto LABEL_50;
            if (v15 != 1800)
            {
              v19 = 0;
              goto LABEL_30;
            }
            if (v18)
            {
              v23 = CFSTR("HMDIdentityTransformer");
              if ((objc_msgSend(v18, "isEqualToString:", CFSTR("none")) & 1) == 0)
                goto LABEL_28;
            }
            else
            {
              objc_msgSend(v9, "valueTransformerName");
              v24 = objc_claimAutoreleasedReturnValue();
              v18 = (id)v24;
              v25 = v42;
              if (v24)
                v25 = (void *)v24;
              v23 = v25;
            }

            v7 = (void *)v23;
LABEL_28:
            +[HMDValueTransformer valueTransformerForName:](HMDValueTransformer, "valueTransformerForName:", v7);
            v26 = objc_claimAutoreleasedReturnValue();
            if (!v26)
              goto LABEL_53;
            v19 = (void *)v26;
            v18 = v7;
LABEL_30:

            v27 = v13[5];
            v13[5] = v19;

            v28 = objc_msgSend(v9, "attributeType");
            objc_msgSend(v9, "userInfo");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 104));
            v7 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v30 = v7;
            else
              v30 = 0;
            v31 = v30;

            if (v31 && v28 != 1800)
            {
              v36 = *(_QWORD *)(a1 + 104);
              goto LABEL_52;
            }
            if (v31)
            {
              v7 = v14;
              if ((objc_msgSend(v31, "isEqualToString:", CFSTR("YES")) & 1) != 0)
              {
                v21 = 1;
                goto LABEL_39;
              }
              v6 = v43;
              if ((objc_msgSend(v31, "isEqualToString:", CFSTR("NO")) & 1) == 0)
                goto LABEL_55;
              v21 = 0;
            }
            else
            {
              v21 = 1;
              v7 = v14;
LABEL_39:
              v6 = v43;
            }

            v22 = &OBJC_IVAR___HMDAttributeCodingDescription__shouldInline;
LABEL_43:
            *((_BYTE *)v13 + *v22) = v21;
            goto LABEL_44;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_54;
          v20 = [HMDRelationshipCodingDescription alloc];
          if (v20)
          {
            v13 = -[HMDPropertyCodingDescription initWithModel:property:](v20, a1, v9);
            if (!v13)
              goto LABEL_44;
            v21 = -[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](a1, v9, 0) == 1;
            v22 = &OBJC_IVAR___HMDRelationshipCodingDescription__parentChild;
            goto LABEL_43;
          }
        }
        v13 = 0;
LABEL_44:
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v10);

        ++v8;
      }
      while (v6 != v8);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      v6 = v32;
    }
    while (v32);
  }

  return v4;
}

- (id)reverseLookupTableForCodingKeyTable:(void *)a1
{
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__59431;
  v8 = __Block_byref_object_dispose__59432;
  v9 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__HMDManagedObjectCodingModel_reverseLookupTableForCodingKeyTable___block_invoke;
  v3[3] = &unk_24E77DF78;
  v3[4] = &v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

void __76__HMDManagedObjectCodingModel_refContextCodingKey_keyPath_entity_forEntity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "relationshipsByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", a2);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15 || objc_msgSend(v15, "isToMany"))
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "name");
    objc_claimAutoreleasedReturnValue();
    v13 = _HMFPreconditionFailureWithFormat();
    -[HMDManagedObjectCodingModel codingKeyForPropertyName:](v13, v14);
  }
  else
  {
    objc_msgSend(v15, "destinationEntity");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) && *(_QWORD *)(a1 + 64) == a3)
    {
      -[HMDManagedObjectCodingModel codingKeyForPropertyName:](*(_QWORD *)(a1 + 32), a2);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
  }
}

- (id)codingKeyForPropertyName:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    v2 = a2;
    if ((unint64_t)objc_msgSend(v2, "length") >= 2 && objc_msgSend(v2, "hasSuffix:", CFSTR("_")))
    {
      objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") - 1);
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v3;
    }
    if ((unint64_t)objc_msgSend(v2, "length") >= 2 && objc_msgSend(v2, "hasPrefix:", CFSTR("_")))
    {
      objc_msgSend(v2, "substringFromIndex:", 1);
      v4 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v4;
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __68__HMDManagedObjectCodingModel_concreteSubentitiesByTypeIDForEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  if ((objc_msgSend(a2, "isAbstract") & 1) == 0)
  {
    -[HMDManagedObjectCodingModel typeIdForEntity:](*(_QWORD *)(a1 + 32), a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(*(id *)(a1 + 48), "name");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "name");
      objc_claimAutoreleasedReturnValue();
      v6 = _HMFPreconditionFailureWithFormat();
      __60__HMDManagedObjectCodingModel_parentRelationshipsForEntity___block_invoke(v6);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", a2, v7);

    }
  }
}

uint64_t __60__HMDManagedObjectCodingModel_parentRelationshipsForEntity___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a2, "inverseRelationship");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = *(_QWORD *)(a1 + 32)) == 0
    || -[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](v5, v4, 0) != 1)
  {
    v7 = 0;
    goto LABEL_8;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (!v6 || !-[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](v6, a2, 0))
  {
    v7 = 1;
LABEL_8:

    return v7;
  }
  objc_msgSend(*(id *)(a1 + 40), "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  objc_claimAutoreleasedReturnValue();
  v9 = _HMFPreconditionFailureWithFormat();
  return -[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](v9, v10, v11);
}

- (uint64_t)includeModeForProperty:(uint64_t)a3 withDefault:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;

  objc_msgSend(a2, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 80));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (!v9)
    goto LABEL_11;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("NO")) & 1) != 0)
  {
    a3 = 0;
LABEL_11:

    return a3;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("YES")) & 1) != 0)
  {
    a3 = 1;
    goto LABEL_11;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("REF")) & 1) != 0)
  {
    a3 = 2;
    goto LABEL_11;
  }
  objc_msgSend(a2, "entity");
  objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  objc_claimAutoreleasedReturnValue();
  v11 = _HMFPreconditionFailureWithFormat();
  return __60__HMDManagedObjectCodingModel_syncedRelationshipsForEntity___block_invoke(v11);
}

void __60__HMDManagedObjectCodingModel_syncedRelationshipsForEntity___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 && -[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](v4, a2, 0) == 1)
  {
    objc_msgSend(a2, "inverseRelationship");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v2 = v6;
      if (!objc_msgSend(v6, "isToMany"))
      {

        return;
      }
    }
    else
    {
      objc_msgSend(*(id *)(v3 + 40), "name");
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "name");
      v10 = v3;
      v11 = objc_claimAutoreleasedReturnValue();
      _HMFPreconditionFailureWithFormat();
    }
    objc_msgSend(*(id *)(v3 + 40), "name", v10, v11);
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "name");
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "name");
    objc_claimAutoreleasedReturnValue();
    v7 = _HMFPreconditionFailureWithFormat();
    __67__HMDManagedObjectCodingModel_reverseLookupTableForCodingKeyTable___block_invoke(v7, v8, v9);
  }
}

void __67__HMDManagedObjectCodingModel_reverseLookupTableForCodingKeyTable___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "name");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a2, "isEqualToString:") & 1) == 0)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (v5)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", a2, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", a2, v9);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }

}

uint64_t __57__HMDManagedObjectCodingModel_syncedAttributesForEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  int v5;
  char isKindOfClass;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return 0;
  v4 = objc_msgSend(a2, "attributeType");
  v5 = 1;
  if (v4 <= 699)
  {
    if (v4 > 399)
    {
      if (v4 != 400 && v4 != 500 && v4 != 600)
        goto LABEL_23;
    }
    else if (v4 != 100 && v4 != 200 && v4 != 300)
    {
      goto LABEL_23;
    }
  }
  else if (v4 <= 999)
  {
    if (v4 != 700 && v4 != 800 && v4 != 900)
      goto LABEL_23;
  }
  else if (v4 > 1199)
  {
    if (v4 != 1200 && v4 != 1800)
      goto LABEL_23;
  }
  else if (v4 != 1000 && v4 != 1100)
  {
LABEL_23:
    v5 = 0;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v5 && !(((*(_BYTE *)(v2 + 16) & 1) == 0) | isKindOfClass & 1))
    v7 = objc_msgSend(a2, "isTransient") ^ 1;
  else
    v7 = 0;
  v8 = -[HMDManagedObjectCodingModel includeModeForProperty:withDefault:](v2, a2, v7);
  if (v8 == 1)
  {
    if ((v5 & 1) != 0)
      return 1;
    objc_msgSend(a2, "entity");
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "name");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a2, "name");
    v12 = v10;
    v13 = objc_claimAutoreleasedReturnValue();
    _HMFPreconditionFailureWithFormat();
  }
  else if (v8 != 2)
  {
    return 0;
  }
  objc_msgSend(a2, "entity", v12, v13);
  objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "name");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "name");
  objc_claimAutoreleasedReturnValue();
  v11 = _HMFPreconditionFailureWithFormat();
  return __51__HMDEntityCodingDescription_initWithModel_entity___block_invoke(v11);
}

- (id)codingKeyForProperty:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(a2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 88));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(a2, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDManagedObjectCodingModel codingKeyForPropertyName:](a1, v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (unint64_t)defaultOptions
{
  return 1;
}

- (BOOL)encodeRootObject:(id)a3 withWriter:(id)a4
{
  return -[HMDManagedObjectCodingModel encodeRootObject:withWriter:changes:conditions:userContext:](self, "encodeRootObject:withWriter:changes:conditions:userContext:", a3, a4, 0, 0, 0);
}

- (BOOL)encodeRootObject:(id)a3 withWriter:(id)a4 changes:(id)a5 conditions:(id)a6 userContext:(id)a7
{
  void *v13;
  void *v14;
  void *v15;
  char v16;
  HMDManagedObjectCodingModel *v17;
  void *v18;
  id v19;
  HMDCodingConditionSet *v20;
  HMDCodingConditionSet *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  BOOL v26;
  _Unwind_Exception *v28;
  id v29;
  id v30;
  HMDCodingConditionSet *v31;
  id v32;
  uint64_t v33;
  id v34;

  -[HMDManagedObjectCodingModel rootDescription](self, "rootDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "entity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "entity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isKindOfEntity:", v15);

  if ((v16 & 1) == 0)
  {
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  if (!a4)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (a6)
  {
    v17 = (HMDManagedObjectCodingModel *)*((id *)a6 + 1);

    if (v17 != self)
    {
LABEL_17:
      v28 = (_Unwind_Exception *)_HMFPreconditionFailure();
      __destructor_8_s0_s8_s16_s24_s40(&v29);
      _Unwind_Resume(v28);
    }
  }
  v18 = (void *)MEMORY[0x227676638]();
  v33 = 0;
  v19 = a4;
  v29 = v19;
  v30 = a5;
  v20 = (HMDCodingConditionSet *)a6;
  if (!a6)
    v20 = -[HMDCodingConditionSet initWithModel:]([HMDCodingConditionSet alloc], "initWithModel:", self, v29, v30);
  v21 = v20;
  v31 = v21;
  v32 = a7;
  v22 = v32;
  if (objc_msgSend(v22, "conformsToProtocol:", &unk_255850B70))
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  v34 = v24;
  if (!a6)

  if (self)
    ((void (*)(id, SEL, HMDCodingConditionSet *, id))objc_msgSend(a3, "methodForSelector:", self->_contextualizeConditionsSelector))(a3, self->_contextualizeConditionsSelector, v21, v22);
  -[HMDManagedObjectCodingModel _encodeManagedObject:withDescription:byReference:useDynamicType:context:](self, a3, v13, 0, objc_msgSend(v13, "hasConcreteSubentities", v29), (uint64_t)&v29);
  objc_msgSend(v19, "error");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  __destructor_8_s0_s8_s16_s24_s40(&v29);
  objc_autoreleasePoolPop(v18);

  return v26;
}

- (BOOL)isRelevantChanges:(id)a3 withRootObject:(id)a4 conditions:(id)a5 userContext:(id)a6
{
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  HMDManagedObjectCodingModel *v16;
  void *v17;
  HMDCodingConditionSet *v18;
  HMDCodingConditionSet *v19;
  id v20;
  void *v21;
  id v22;
  BOOL v23;
  _Unwind_Exception *v25;
  __int128 v26;
  __int128 v27;
  _BOOL8 v28;
  id v29;

  -[HMDManagedObjectCodingModel rootDescription](self, "rootDescription");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  v12 = (void *)v11;
  objc_msgSend(a4, "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isKindOfEntity:", v14);

  if ((v15 & 1) == 0)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  if (a5)
  {
    v16 = (HMDManagedObjectCodingModel *)*((id *)a5 + 1);

    if (v16 != self)
    {
LABEL_17:
      v25 = (_Unwind_Exception *)_HMFPreconditionFailure();
      __destructor_8_s0_s8_s16_s24_s40((id *)&v26);
      _Unwind_Resume(v25);
    }
  }
  v17 = (void *)MEMORY[0x227676638]();
  v28 = 0;
  *(_QWORD *)&v26 = 0;
  v27 = 0u;
  *((_QWORD *)&v26 + 1) = a3;
  v18 = (HMDCodingConditionSet *)a5;
  if (!a5)
    v18 = -[HMDCodingConditionSet initWithModel:]([HMDCodingConditionSet alloc], "initWithModel:", self, v26, v27, v28);
  v19 = v18;
  *(_QWORD *)&v27 = v19;
  *((_QWORD *)&v27 + 1) = a6;
  LOBYTE(v28) = 0;
  v20 = *((id *)&v27 + 1);
  if (objc_msgSend(v20, "conformsToProtocol:", &unk_255850B70))
    v21 = v20;
  else
    v21 = 0;
  v22 = v21;

  v29 = v22;
  if (!a5)

  if (self)
    ((void (*)(id, SEL, HMDCodingConditionSet *, id))objc_msgSend(a4, "methodForSelector:", self->_contextualizeConditionsSelector))(a4, self->_contextualizeConditionsSelector, v19, v20);
  -[HMDManagedObjectCodingModel _encodeManagedObject:withDescription:byReference:useDynamicType:context:](self, a4, v12, 0, objc_msgSend(v12, "hasConcreteSubentities", (_QWORD)v26), (uint64_t)&v26);
  v23 = v28;
  __destructor_8_s0_s8_s16_s24_s40((id *)&v26);
  objc_autoreleasePoolPop(v17);

  return v23;
}

- (id)decodeRootObjectFromReader:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _Unwind_Exception *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  if (!-[HMDManagedObjectCodingModel hasOnlyParentChildRelationships](self, "hasOnlyParentChildRelationships"))
  {
    _HMFPreconditionFailure();
LABEL_8:
    v14 = (_Unwind_Exception *)_HMFPreconditionFailure();
    __destructor_8_s0_s8_sb16(&v16);
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v14);
  }
  if (!a3)
    goto LABEL_8;
  -[HMDManagedObjectCodingModel rootDescription](self, "rootDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__141478;
  v23 = __Block_byref_object_dispose__141479;
  v24 = 0;
  v7 = a3;
  v17 = 0;
  v18 = 0;
  v16 = v7;
  v8 = objc_msgSend(v5, "hasConcreteSubentities");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __73__HMDManagedObjectCodingModel_Transmutation__decodeRootObjectFromReader___block_invoke;
  v15[3] = &unk_24E788618;
  v15[4] = &v19;
  v9 = -[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:candidates:context:orEmplaceWithBlock:](self, v5, 0, v8, 0, (uint64_t)&v16, (uint64_t)v15);
  objc_msgSend(v7, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = 0;
  else
    v11 = (void *)v20[5];
  v12 = v11;

  _Block_object_dispose(&v19, 8);
  objc_autoreleasePoolPop(v6);

  return v12;
}

- (BOOL)updateRootObject:(id)a3 fromReader:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDManagedObjectCodingModel *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  BOOL v30;
  _QWORD v32[6];
  id v33;
  id v34;
  _QWORD aBlock[4];
  id v36;
  _BYTE buf[24];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[HMDManagedObjectCodingModel rootDescription](self, "rootDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isKindOfEntity:", v9);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a3, "entity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "entity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2114;
      v38 = v16;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected root entity: %{public}@, expecting %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }
  objc_msgSend(a3, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isKindOfEntity:", v18);

  if ((v19 & 1) == 0
    || (objc_msgSend(a3, "managedObjectContext"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = v20 == 0,
        v20,
        v21)
    || !a4)
  {
    _HMFPreconditionFailure();
    __break(1u);
  }
  v22 = (void *)MEMORY[0x227676638]();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = a4;
  *(_QWORD *)buf = v24;
  objc_msgSend(a3, "managedObjectContext");
  *(_QWORD *)&buf[8] = objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__HMDManagedObjectCodingModel_Transmutation__updateRootObject_fromReader___block_invoke;
  aBlock[3] = &unk_24E788640;
  v26 = v23;
  v36 = v26;
  *(_QWORD *)&buf[16] = _Block_copy(aBlock);
  v32[0] = v25;
  v32[1] = 3221225472;
  v32[2] = __74__HMDManagedObjectCodingModel_Transmutation__updateRootObject_fromReader___block_invoke_2;
  v32[3] = &unk_24E788668;
  v32[4] = self;
  v32[5] = a3;
  v27 = v7;
  v33 = v27;
  v34 = v24;
  v28 = _Block_copy(v32);
  v29 = -[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:context:lookupBlock:emplaceBlock:](self, v27, 0, objc_msgSend(v27, "hasConcreteSubentities"), (uint64_t)buf, (uint64_t)v28, 0);
  v30 = -[HMDManagedObjectCodingModel _processDeferredBlocks:context:]((uint64_t)self, v26, (id *)buf);

  objc_autoreleasePoolPop(v22);
  return v30;
}

- (id)insertOrUpdateRootObjectInContext:(id)a3 fromReader:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _Unwind_Exception *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[5];
  id v29;
  id *v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;
  id v35;

  -[HMDManagedObjectCodingModel rootDescription](self, "rootDescription");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    _HMFPreconditionFailure();
LABEL_10:
    v20 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v22, 8);
    __destructor_8_s0_s8_sb16(&v33);
    _Unwind_Resume(v20);
  }
  if (!a4)
    goto LABEL_10;
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x227676638]();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = a4;
  v34 = a3;
  v11 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke;
  aBlock[3] = &unk_24E788640;
  v12 = v10;
  v32 = v12;
  v35 = _Block_copy(aBlock);
  v28[0] = v11;
  v28[1] = 3221225472;
  v28[2] = __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke_2;
  v28[3] = &unk_24E788690;
  v28[4] = self;
  v13 = v8;
  v29 = v13;
  v30 = &v33;
  v14 = _Block_copy(v28);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__141478;
  v26 = __Block_byref_object_dispose__141479;
  v27 = 0;
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke_3;
  v21[3] = &unk_24E788618;
  v21[4] = &v22;
  v15 = _Block_copy(v21);
  -[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:context:lookupBlock:emplaceBlock:](self, v13, 0, objc_msgSend(v13, "hasConcreteSubentities"), (uint64_t)&v33, (uint64_t)v14, (uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDManagedObjectCodingModel _processDeferredBlocks:context:]((uint64_t)self, v12, &v33))
  {
    v17 = v16;
    if (!v16)
      v17 = (void *)v23[5];
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v22, 8);
  objc_autoreleasePoolPop(v9);

  return v18;
}

void __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke(uint64_t a1, void *aBlock)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = _Block_copy(aBlock);
  objc_msgSend(v2, "addObject:", v3);

}

id __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke_2(uint64_t a1, void *a2)
{
  return -[HMDManagedObjectCodingModel _managedObjectWithDescription:matchingKeyAttributes:context:](*(void **)(a1 + 32), *(void **)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

void __91__HMDManagedObjectCodingModel_Transmutation__insertOrUpdateRootObjectInContext_fromReader___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)_decodeManagedObjectWithDescription:(int)a3 byReference:(int)a4 useDynamicType:(uint64_t)a5 context:(uint64_t)a6 lookupBlock:(uint64_t)a7 emplaceBlock:
{
  id v7;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  id *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  void *v71;
  id v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  BOOL v93;
  int v94;
  void *v95;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id *v104;
  void *v105;
  void *v106;
  id *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  _QWORD v112[5];
  id v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[24];
  void *v123;
  void *v124;
  id v125;
  id v126;
  id *v127;
  char v128;
  _BYTE buf[24];
  void *v130;
  __int128 v131;
  void *v132;
  id v133;
  id *v134;
  char v135;
  uint64_t v136;

  v7 = a1;
  v136 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if ((a3 & 1) == 0)
      objc_msgSend(*(id *)a5, "beginArray");
    v107 = (id *)a5;
    v111 = v7;
    if (a4)
    {
      v117 = 0;
      -[HMDManagedObjectCodingModel _readKeyAttributesWithDescription:typeID:byReference:context:](v7, a2, &v117, a3, (id *)a5);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v117;
      if (v14)
      {
        objc_msgSend(v7, "subentityOfDescription:withTypeID:", a2, v15);
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v37 = *(id *)a5;
          objc_msgSend(a2, "name");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "failWithReason:", CFSTR("%@: Missing or invalid type ID '%@'"), v17, v15);
          goto LABEL_29;
        }
        v17 = (id)v16;
LABEL_10:
        (*(void (**)(uint64_t, id))(a6 + 16))(a6, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v19;
        v106 = v17;
        if (v19)
        {
          if ((a3 & 1) == 0)
          {
            objc_msgSend(v19, "entity");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "entity");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20 == v21)
            {
              v103 = v15;
              v22 = v7;
              v101 = v22;
LABEL_40:
              v51 = v107;
              objc_msgSend(*v107, "beginDictionary");
              if (objc_msgSend(*v107, "tokenType") == 5)
              {
                do
                {
                  objc_msgSend(*v51, "readDictionaryKey");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "attributesByCodingKey");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:", v52);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v54)
                  {
                    -[HMDManagedObjectCodingModel _readValueForAttribute:context:](v54, v51);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "name");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "valueForKey:", v56);
                    v57 = (void *)objc_claimAutoreleasedReturnValue();

                    if ((HMFEqualObjects() & 1) == 0)
                    {
                      objc_msgSend(v54, "name");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v22, "setValue:forKey:", v55, v58);

                    }
                    v51 = v107;
                  }
                  else
                  {
                    v59 = (void *)MEMORY[0x227676638]();
                    v60 = v111;
                    HMFGetOSLogHandle();
                    v61 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v106, "name");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v122 = 138543874;
                      *(_QWORD *)&v122[4] = v62;
                      *(_WORD *)&v122[12] = 2114;
                      *(_QWORD *)&v122[14] = v52;
                      *(_WORD *)&v122[22] = 2114;
                      v123 = v63;
                      _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_INFO, "%{public}@Skipping unexpected attribute '%{public}@' for %{public}@", v122, 0x20u);

                    }
                    objc_autoreleasePoolPop(v59);
                    v51 = v107;
                    objc_msgSend(*v107, "skipLogicalValue");
                    v17 = v106;
                  }

                }
                while (objc_msgSend(*v51, "tokenType") == 5);
              }
              objc_msgSend(*v51, "endDictionary");
              objc_msgSend(*v51, "error");
              v64 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v64)
              {
                objc_msgSend(*v51, "beginDictionary");
                if (objc_msgSend(*v51, "tokenType") == 5)
                {
                  v99 = v14;
                  do
                  {
                    objc_msgSend(*v51, "readDictionaryKey");
                    v65 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "relationshipsByCodingKey");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    v105 = (void *)v65;
                    objc_msgSend(v66, "objectForKeyedSubscript:", v65);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!v67)
                    {
                      v71 = (void *)MEMORY[0x227676638]();
                      v72 = v111;
                      HMFGetOSLogHandle();
                      v73 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v17, "name");
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)v122 = 138543874;
                        *(_QWORD *)&v122[4] = v74;
                        *(_WORD *)&v122[12] = 2114;
                        *(_QWORD *)&v122[14] = v105;
                        *(_WORD *)&v122[22] = 2114;
                        v123 = v75;
                        _os_log_impl(&dword_2218F0000, v73, OS_LOG_TYPE_INFO, "%{public}@Skipping unexpected key attribute '%{public}@' for %{public}@", v122, 0x20u);

                        v67 = 0;
                      }

                      objc_autoreleasePoolPop(v71);
                      objc_msgSend(*v51, "skipLogicalValue");
                      goto LABEL_95;
                    }
                    objc_msgSend(v111, "descriptionForDestinationOfRelationship:", v67);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    v69 = objc_msgSend(v67, "isParentChild");
                    v108 = v68;
                    if (v69)
                      v70 = objc_msgSend(v68, "hasConcreteSubentities");
                    else
                      v70 = 0;
                    objc_msgSend(v67, "relationship");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    v77 = objc_msgSend(v76, "isToMany");

                    v110 = v67;
                    objc_msgSend(v67, "name");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v77)
                    {
                      objc_msgSend(v22, "mutableSetValueForKey:", v78);
                      v79 = (void *)objc_claimAutoreleasedReturnValue();

                      v80 = (void *)objc_msgSend(v79, "mutableCopy");
                      objc_msgSend(*v51, "beginArray");
                      while (1)
                      {
                        v81 = objc_msgSend(*v51, "tokenType");
                        if (v81 == -2)
                          break;
                        if (v81 == 2)
                        {
                          objc_msgSend(*v51, "endArray");
                          v120 = 0u;
                          v121 = 0u;
                          v118 = 0u;
                          v119 = 0u;
                          v84 = v80;
                          v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v118, v122, 16);
                          if (v85)
                          {
                            v86 = v85;
                            v87 = *(_QWORD *)v119;
                            do
                            {
                              for (i = 0; i != v86; ++i)
                              {
                                if (*(_QWORD *)v119 != v87)
                                  objc_enumerationMutation(v84);
                                v89 = *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * i);
                                objc_msgSend(v79, "removeObject:", v89);
                                if (v69)
                                {
                                  objc_msgSend(v22, "managedObjectContext");
                                  v90 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v90, "deleteObject:", v89);

                                }
                              }
                              v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v118, v122, 16);
                            }
                            while (v86);
                          }

                          v14 = v99;
                          v51 = v107;
                          break;
                        }
                        *(_QWORD *)buf = MEMORY[0x24BDAC760];
                        *(_QWORD *)&buf[8] = 3221225472;
                        *(_QWORD *)&buf[16] = __90__HMDManagedObjectCodingModel_Transmutation___updateRelationship_ofManagedObject_context___block_invoke;
                        v130 = &unk_24E7887A0;
                        *(_QWORD *)&v131 = v111;
                        *((_QWORD *)&v131 + 1) = v22;
                        v135 = v69;
                        v132 = v110;
                        v134 = v51;
                        v133 = v79;
                        -[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:candidates:context:orEmplaceWithBlock:](v111, v108, v69 ^ 1u, v70, v80, v51, buf);
                        v82 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v82)
                          objc_msgSend(v80, "removeObject:", v82);

                      }
                      v17 = v106;
                      goto LABEL_94;
                    }
                    objc_msgSend(v22, "valueForKey:", v78);
                    v79 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(*v51, "tokenType") == 6)
                    {
                      objc_msgSend(*v51, "readNull");
                      if (!v79)
                        goto LABEL_94;
                      objc_msgSend(v110, "name");
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v22, "setValue:forKey:", 0, v83);

                      if (!v69)
                        goto LABEL_94;
                    }
                    else
                    {
                      if (v79)
                      {
                        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v79);
                        v91 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        v91 = 0;
                      }
                      *(_QWORD *)v122 = MEMORY[0x24BDAC760];
                      *(_QWORD *)&v122[8] = 3221225472;
                      *(_QWORD *)&v122[16] = __90__HMDManagedObjectCodingModel_Transmutation___updateRelationship_ofManagedObject_context___block_invoke_2;
                      v123 = &unk_24E7887C8;
                      v124 = v111;
                      v125 = v22;
                      v128 = v69;
                      v126 = v110;
                      v127 = v51;
                      ((void (*)(void))-[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:candidates:context:orEmplaceWithBlock:])();
                      v92 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v79)
                        v93 = v92 == 0;
                      else
                        v93 = 0;
                      if (v93)
                        v94 = v69;
                      else
                        v94 = 0;

                      if (v79)
                      if (!v94)
                        goto LABEL_94;
                    }
                    objc_msgSend(v22, "managedObjectContext");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v95, "deleteObject:", v79);

LABEL_94:
                    v67 = v110;
LABEL_95:

                  }
                  while (objc_msgSend(*v51, "tokenType") == 5);
                }
                objc_msgSend(*v51, "endDictionary");
              }
              objc_msgSend(*v51, "endArray");
              v7 = v101;

              v15 = v103;
              goto LABEL_98;
            }
LABEL_19:
            v103 = v15;
            v25 = objc_alloc(MEMORY[0x24BDBB698]);
            objc_msgSend(v17, "entity");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (id)objc_msgSend(v25, "initWithEntity:insertIntoManagedObjectContext:", v26, *(_QWORD *)(a5 + 8));

            objc_msgSend(v22, "setValuesForKeysWithDictionary:", v14);
            if (v7)
            {
              v109 = a7;
              objc_msgSend(v17, "entity");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "entity");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = v27;
              v30 = v28;
              v31 = v30;
              v32 = 0;
              v33 = v29;
              v34 = v30;
              if (v29 && v30)
              {
                v35 = v30;
                v36 = v29;
                v32 = 0;
                while (1)
                {
                  if ((objc_msgSend(v36, "isKindOfEntity:", v35) & 1) != 0)
                  {
                    v38 = v35;
                    goto LABEL_32;
                  }
                  if ((objc_msgSend(v35, "isKindOfEntity:", v36) & 1) != 0)
                    break;
                  objc_msgSend(v36, "superentity");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v35, "superentity");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v33)
                  {
                    v35 = v34;
                    v36 = v33;
                    if (v34)
                      continue;
                  }
                  goto LABEL_33;
                }
                v38 = v36;
LABEL_32:
                v32 = v38;
                v33 = v36;
                v34 = v35;
              }
LABEL_33:

              HMFGetOSLogHandle();
              v39 = objc_claimAutoreleasedReturnValue();
              v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG);

              if (v40)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v41 = 0;
              }
              objc_msgSend(v32, "relationshipsByName");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)v122 = MEMORY[0x24BDAC760];
              *(_QWORD *)&v122[8] = 3221225472;
              *(_QWORD *)&v122[16] = __113__HMDManagedObjectCodingModel_Transmutation___prepareReplacementObject_withDescription_forExistingManagedObject___block_invoke;
              v123 = &unk_24E7887F0;
              v124 = v111;
              v125 = v7;
              v126 = v22;
              v43 = v41;
              v127 = v43;
              objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v122);

              v44 = (void *)MEMORY[0x227676638]();
              v45 = v111;
              HMFGetOSLogHandle();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "objectID");
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v102, "URIRepresentation");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "entity");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v100, "name");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "sortedArrayUsingSelector:", sel_compare_);
                v104 = v43;
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "componentsJoinedByString:", CFSTR(", "));
                v49 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                *(_QWORD *)&buf[4] = v98;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v97;
                *(_WORD *)&buf[22] = 2114;
                v130 = v47;
                LOWORD(v131) = 2114;
                *(_QWORD *)((char *)&v131 + 2) = v49;
                v50 = (void *)v49;
                _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Recreating <%{public}@> as %{public}@, migrated relationships: %{public}@", buf, 0x2Au);

                v43 = v104;
              }

              objc_autoreleasePoolPop(v44);
              v17 = v106;
              a7 = v109;
            }
            (*(void (**)(uint64_t, id))(a7 + 16))(a7, v22);
            v101 = 0;
            goto LABEL_40;
          }
LABEL_98:

          goto LABEL_99;
        }
        objc_msgSend(*(id *)a5, "error");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          if ((a3 & 1) == 0)
            goto LABEL_19;
          v24 = *(_QWORD *)(a5 + 16);
          v112[0] = MEMORY[0x24BDAC760];
          v112[1] = 3221225472;
          v112[2] = __142__HMDManagedObjectCodingModel_Transmutation___decodeManagedObjectWithDescription_byReference_useDynamicType_context_lookupBlock_emplaceBlock___block_invoke;
          v112[3] = &unk_24E793520;
          v115 = a7;
          v112[4] = v111;
          v17 = v17;
          v113 = v17;
          v14 = v14;
          v114 = v14;
          v116 = a5;
          (*(void (**)(uint64_t, _QWORD *))(v24 + 16))(v24, v112);

        }
LABEL_29:
        v7 = 0;
        goto LABEL_98;
      }
    }
    else
    {
      -[HMDManagedObjectCodingModel _readKeyAttributesWithDescription:typeID:byReference:context:](v7, a2, 0, a3, (id *)a5);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v14 = (id)v18;
        v17 = a2;
        v15 = 0;
        goto LABEL_10;
      }
      v15 = 0;
    }
    v7 = 0;
LABEL_99:

  }
  return v7;
}

- (BOOL)_processDeferredBlocks:(id *)a3 context:
{
  void *v4;
  _BOOL8 v5;
  _QWORD v7[5];

  if (!a1)
    return 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__HMDManagedObjectCodingModel_Transmutation___processDeferredBlocks_context___block_invoke;
  v7[3] = &__block_descriptor_40_e21_v32__0___v___8Q16_B24l;
  v7[4] = a3;
  objc_msgSend(a2, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);
  objc_msgSend(*a3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

void __77__HMDManagedObjectCodingModel_Transmutation___processDeferredBlocks_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(**(id **)(a1 + 32), "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    *a4 = 1;
  else
    (*(void (**)(uint64_t))(a2 + 16))(a2);
}

- (id)_readKeyAttributesWithDescription:(_QWORD *)a3 typeID:(int)a4 byReference:(id *)a5 context:
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
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
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  _QWORD *v38;
  void *context;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v8 = a2;
  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "keyAttributesByCodingKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(v8, "refContextCodingKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(v9, "count");
  if (v10)
    v12 = v11 + 1;
  else
    v12 = v11;
  v36 = v12;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v12);
  objc_msgSend(*a5, "beginDictionary");
  if (objc_msgSend(*a5, "tokenType") == 5)
  {
    v37 = v8;
    v38 = a3;
    do
    {
      objc_msgSend(*a5, "readDictionaryKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v10 && objc_msgSend(v14, "isEqualToString:", v10))
      {
        objc_msgSend(v8, "refContextEntity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "descriptionForEntity:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDManagedObjectCodingModel _readKeyAttributesWithDescription:typeID:byReference:context:](a1, v17, 0, 1, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("$context"));

      }
      else if (a3 && objc_msgSend(v15, "isEqualToString:", CFSTR("$type")))
      {
        objc_msgSend(*a5, "readString");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          -[HMDManagedObjectCodingModel _readValueForAttribute:context:](v19, a5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v20, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, v22);

            a3 = v38;
          }

        }
        else
        {
          context = (void *)MEMORY[0x227676638]();
          v23 = a1;
          HMFGetOSLogHandle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "name");
            v26 = v13;
            v27 = v9;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v42 = v25;
            v43 = 2114;
            v44 = v15;
            v45 = 2114;
            v46 = v28;
            _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Skipping unexpected key attribute '%{public}@' for %{public}@", buf, 0x20u);

            v9 = v27;
            v13 = v26;
            v8 = v37;

            a3 = v38;
          }

          objc_autoreleasePoolPop(context);
          objc_msgSend(*a5, "skipLogicalValue");
        }

      }
    }
    while (objc_msgSend(*a5, "tokenType") == 5);
  }
  objc_msgSend(*a5, "endDictionary");
  objc_msgSend(*a5, "error");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    goto LABEL_28;
  if (objc_msgSend(v13, "count") != v36)
  {
    v31 = *a5;
    objc_msgSend(v8, "name");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "componentsJoinedByString:", CFSTR(", "));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "failWithReason:", CFSTR("%@: Incomplete key attributes (%@)"), v32, v34);

LABEL_28:
    v30 = 0;
    goto LABEL_29;
  }
  v30 = (void *)objc_msgSend(v13, "copy");
LABEL_29:

  return v30;
}

void __142__HMDManagedObjectCodingModel_Transmutation___decodeManagedObjectWithDescription_byReference_useDynamicType_context_lookupBlock_emplaceBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 56);
  -[HMDManagedObjectCodingModel _managedObjectWithDescription:matchingKeyAttributes:context:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 64));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (id)_managedObjectWithDescription:(void *)a3 matchingKeyAttributes:(uint64_t)a4 context:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBB678]);
    objc_msgSend(a2, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEntity:", v9);

    objc_msgSend(v8, "setIncludesPropertyValues:", 0);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(a3, "count"));
    -[HMDManagedObjectCodingModel _buildPredicateAtoms:withDescription:keyPathPrefix:values:](a1, (uint64_t)v10, a2, 0, a3);
    if (objc_msgSend(v10, "count") == 1)
      objc_msgSend(v10, "firstObject");
    else
      objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setPredicate:", v11);
    objc_msgSend(v8, "setFetchLimit:", 2);
    v12 = *(void **)(a4 + 8);
    v32 = 0;
    objc_msgSend(v12, "executeFetchRequest:error:", v8, &v32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v32;
    if (v13)
    {
      if ((unint64_t)objc_msgSend(v13, "count") < 2)
      {
        objc_msgSend(v13, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      objc_msgSend(a3, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sortedArrayUsingSelector:", sel_compare_);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR(", "));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x227676638]();
      v19 = a1;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a2, "entity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v21;
        v35 = 2114;
        v36 = v23;
        v37 = 2114;
        v38 = v17;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%{public}@: Fetch request with key(s) %{public}@ returned more than one result", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);

    }
    else
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a2, "entity");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v27;
        v35 = 2114;
        v36 = v29;
        v37 = 2114;
        v38 = v14;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@%{public}@: Fetch request failed: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v24);
    }
    v30 = 0;
LABEL_15:

    return v30;
  }
  return 0;
}

- (void)_buildPredicateAtoms:(void *)a3 withDescription:(uint64_t)a4 keyPathPrefix:(void *)a5 values:
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[8];

  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("$context"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(a3, "refContextEntity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "descriptionForEntity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "refContextKeyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDManagedObjectCodingModel _buildPredicateAtoms:withDescription:keyPathPrefix:values:](a1, a2, v11, v12, v14);

  }
  objc_msgSend(a3, "keyAttributesByCodingKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __104__HMDManagedObjectCodingModel_Transmutation___buildPredicateAtoms_withDescription_keyPathPrefix_values___block_invoke;
  v15[3] = &unk_24E788818;
  v15[4] = a2;
  v15[5] = a1;
  v15[6] = a4;
  v15[7] = a5;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);

}

void __104__HMDManagedObjectCodingModel_Transmutation___buildPredicateAtoms_withDescription_keyPathPrefix_values___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v14 = (id)v4;
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(".%@"), v14);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v14;
    }
    v10 = v9;
    v11 = (void *)MEMORY[0x24BDD14B8];
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v12, v13, 0, 4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "addObject:", v6);

}

uint64_t __90__HMDManagedObjectCodingModel_Transmutation___updateRelationship_ofManagedObject_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = -[HMDManagedObjectCodingModel _prepareRelatedObject:ofManagedObject:relationship:byReference:context:](*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_BYTE *)(a1 + 72) == 0, *(_QWORD *)(a1 + 64));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 56), "addObject:", a2);
  return result;
}

- (id)_decodeManagedObjectWithDescription:(int)a3 byReference:(int)a4 useDynamicType:(uint64_t)a5 candidates:(uint64_t)a6 context:(uint64_t)a7 orEmplaceWithBlock:
{
  void *v13;
  void *v14;
  _QWORD aBlock[7];

  if (!a1)
    return 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __147__HMDManagedObjectCodingModel_Transmutation___decodeManagedObjectWithDescription_byReference_useDynamicType_candidates_context_orEmplaceWithBlock___block_invoke;
  aBlock[3] = &unk_24E788700;
  aBlock[4] = a1;
  aBlock[5] = a5;
  aBlock[6] = a2;
  v13 = _Block_copy(aBlock);
  -[HMDManagedObjectCodingModel _decodeManagedObjectWithDescription:byReference:useDynamicType:context:lookupBlock:emplaceBlock:](a1, a2, a3, a4, a6, (uint64_t)v13, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __90__HMDManagedObjectCodingModel_Transmutation___updateRelationship_ofManagedObject_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  if (-[HMDManagedObjectCodingModel _prepareRelatedObject:ofManagedObject:relationship:byReference:context:](*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_BYTE *)(a1 + 64) == 0, *(_QWORD *)(a1 + 56)))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "name");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", a2, v5);

  }
}

- (uint64_t)_prepareRelatedObject:(uint64_t)a3 ofManagedObject:(void *)a4 relationship:(char)a5 byReference:(uint64_t)a6 context:
{
  _BOOL8 v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (result)
  {
    v8 = a2 != 0;
    if (!a2)
    {
      v13 = *(void **)a6;
      objc_msgSend(a4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a4, "relationship");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "destinationEntity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "failWithReason:", CFSTR("%@: Failed to resolve referenced %@"), v11, v15);

      goto LABEL_8;
    }
    result = 1;
    if (!*(_QWORD *)(a6 + 8) && (a5 & 1) == 0)
    {
      objc_msgSend(a4, "relationship");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "inverseRelationship");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v8 = 1;
        goto LABEL_9;
      }
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a2, "setValue:forKey:", a3, v12);
LABEL_8:

LABEL_9:
      return v8;
    }
  }
  return result;
}

id __147__HMDManagedObjectCodingModel_Transmutation___decodeManagedObjectWithDescription_byReference_useDynamicType_candidates_context_orEmplaceWithBlock___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v2 = a1[4];
  if (!v2)
    return 0;
  v3 = (void *)a1[5];
  v4 = a1[6];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__141478;
  v12 = __Block_byref_object_dispose__141479;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __106__HMDManagedObjectCodingModel_Transmutation___managedObjectFromSet_withDescription_matchingKeyAttributes___block_invoke;
  v7[3] = &unk_24E788840;
  v7[4] = v2;
  v7[5] = v4;
  v7[6] = a2;
  v7[7] = &v8;
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __106__HMDManagedObjectCodingModel_Transmutation___managedObjectFromSet_withDescription_matchingKeyAttributes___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  if (-[HMDManagedObjectCodingModel _managedObject:withDescription:matchesKeyAttributes:](*(_QWORD *)(a1 + 32), (uint64_t)a2, *(_QWORD *)(a1 + 40), *(void **)(a1 + 48)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (BOOL)_managedObject:(uint64_t)a3 withDescription:(void *)a4 matchesKeyAttributes:
{
  _BOOL8 v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (!a1)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __98__HMDManagedObjectCodingModel_Transmutation___managedObject_withDescription_matchesKeyAttributes___block_invoke;
  v6[3] = &unk_24E788868;
  v6[4] = a2;
  v6[5] = a3;
  v6[6] = a1;
  v6[7] = &v7;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __98__HMDManagedObjectCodingModel_Transmutation___managedObject_withDescription_matchesKeyAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;

  v8 = objc_msgSend(a2, "isEqualToString:", CFSTR("$context"));
  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "refContextKeyPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKeyPath:", v10);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v11 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "refContextEntity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptionForEntity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16
      || (-[HMDManagedObjectCodingModel _managedObject:withDescription:matchesKeyAttributes:](*(_QWORD *)(a1 + 48), v16, v13, a3) & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", a3);

    if ((v15 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
}

- (id)_readValueForAttribute:(void *)a1 context:(id *)a2
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  if (objc_msgSend(*a2, "tokenType") == 6)
  {
    objc_msgSend(*a2, "readNull");
    return 0;
  }
  objc_msgSend(a1, "attribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "attributeType");

  if (v6 <= 699)
  {
    if (v6 > 399)
    {
      if (v6 != 400 && v6 != 500 && v6 != 600)
        goto LABEL_50;
    }
    else if (v6 != 100 && v6 != 200 && v6 != 300)
    {
      goto LABEL_50;
    }
    objc_msgSend(*a2, "readNumber");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v6 <= 999)
  {
    switch(v6)
    {
      case 700:
        objc_msgSend(*a2, "readString");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 800:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*a2, "readBoolean"));
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 900:
        objc_msgSend(*a2, "readDate");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
    }
LABEL_50:
    v22 = (void *)MEMORY[0x24BDBCE88];
    v23 = *MEMORY[0x24BDBCAB0];
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1, "attribute");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("Attribute type not supported: %zd"), objc_msgSend(v25, "attributeType"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, v26, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v27);
  }
  if (v6 > 1199)
  {
    if (v6 == 1200)
    {
      objc_msgSend(*a2, "readString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v12;
        if (v12)
        {
          v13 = v12;
        }
        else
        {
          v16 = *a2;
          objc_msgSend(a1, "shortDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "failWithReason:", CFSTR("%@: Invalid / malformed URI value"), v17);

        }
        goto LABEL_49;
      }
    }
    else
    {
      if (v6 != 1800)
        goto LABEL_50;
      objc_msgSend(*a2, "readLogicalValueAsObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v28 = 0;
        objc_msgSend(a1, "transformer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(a1, "shouldInline")
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && objc_msgSend((id)objc_opt_class(), "isStructuredDataCompatible"))
        {
          objc_msgSend(v10, "valueFromOPACK:error:", v9, &v28);
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v10, "reverseTransformedValue:error:", v9, &v28);
          v11 = objc_claimAutoreleasedReturnValue();
        }
        v8 = (void *)v11;

        v14 = v28;
        if (v8)
        {
          v15 = v8;
        }
        else
        {
          objc_msgSend(a1, "transformer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "isKindOfTransformer:", objc_opt_class()))
          {
            v19 = +[HMDSecureUnarchiveFromDataTransformer isEncodedNilValue:](HMDSecureUnarchiveFromDataTransformer, "isEncodedNilValue:", v9);

            if (v19)
              goto LABEL_48;
          }
          else
          {

          }
          v20 = *a2;
          objc_msgSend(a1, "shortDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "failWithReason:", CFSTR("%@: Failed to transform attribute value: %@"), v21, v14);

        }
LABEL_48:

        goto LABEL_49;
      }
    }
    v8 = 0;
LABEL_49:

    return v8;
  }
  if (v6 == 1000)
  {
    objc_msgSend(*a2, "readData");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v6 != 1100)
    goto LABEL_50;
  objc_msgSend(*a2, "readUUID");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v8 = (void *)v7;
  return v8;
}

void __113__HMDManagedObjectCodingModel_Transmutation___prepareReplacementObject_withDescription_forExistingManagedObject___block_invoke(id *a1, uint64_t a2, void *a3)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  objc_msgSend(a3, "inverseRelationship");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "descriptionForRelationship:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_3;
  }
  if (v10)
  {
    objc_msgSend(a1[4], "descriptionForRelationship:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isReference");

    if (v9)
    {
LABEL_3:
      objc_msgSend(a1[5], "valueForKey:", a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(a3, "isToMany"))
      {
        if (!objc_msgSend(v7, "count"))
          goto LABEL_11;
      }
      else if (!v7)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(a1[5], "setValue:forKey:", 0, a2);
      objc_msgSend(a1[6], "setValue:forKey:", v7, a2);
      objc_msgSend(a1[7], "addObject:", a2);
      goto LABEL_11;
    }
  }
LABEL_12:

}

void __74__HMDManagedObjectCodingModel_Transmutation__updateRootObject_fromReader___block_invoke(uint64_t a1, void *aBlock)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = _Block_copy(aBlock);
  objc_msgSend(v2, "addObject:", v3);

}

id __74__HMDManagedObjectCodingModel_Transmutation__updateRootObject_fromReader___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  if (-[HMDManagedObjectCodingModel _managedObject:withDescription:matchesKeyAttributes:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2))
  {
    v3 = *(id *)(a1 + 40);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "failWithReason:", CFSTR("Decoded key attributes do not match object to update"));
    v3 = 0;
  }
  return v3;
}

void __73__HMDManagedObjectCodingModel_Transmutation__decodeRootObjectFromReader___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)_encodeManagedObject:(void *)a3 withDescription:(int)a4 byReference:(int)a5 useDynamicType:(uint64_t)a6 context:
{
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  id v42[2];

  if (a1)
  {
    if ((a4 & 1) == 0)
      objc_msgSend(*(id *)a6, "beginArrayOfSize:", 3);
    if (a5)
    {
      objc_msgSend(a1, "descriptionForManagedObject:", a2);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "typeID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDManagedObjectCodingModel _encodeKeyAttributesOfManagedObject:withDescription:typeID:byReference:context:](a1, a2, a3, (uint64_t)v12, a4, (id *)a6);

      if ((a4 & 1) != 0)
        goto LABEL_21;
    }
    else
    {
      -[HMDManagedObjectCodingModel _encodeKeyAttributesOfManagedObject:withDescription:typeID:byReference:context:](a1, a2, a3, 0, a4, (id *)a6);
      v24 = a3;
      if ((a4 & 1) != 0)
      {
LABEL_21:

        return;
      }
    }
    v13 = *(id *)(a6 + 8);
    if (v13)
    {
      objc_msgSend(a2, "objectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      v42[0] = 0;
      v15 = objc_msgSend(v13, "changeScopeForObjectWithID:attributeKeys:relationshipKeys:", v14, v42, &v41);
      v13 = v42[0];
      v16 = v41;

      if (v15 == 2)
      {
        objc_msgSend(v24, "attributesByCodingKey");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)a6, "beginDictionaryOfSize:", objc_msgSend(v13, "count"));
        v21 = MEMORY[0x24BDAC760];
        v33 = MEMORY[0x24BDAC760];
        v34 = 3221225472;
        v35 = __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke;
        v36 = &unk_24E788728;
        v40 = a6;
        v37 = a1;
        v17 = v20;
        v38 = v17;
        v39 = a2;
        objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v33);
        objc_msgSend(*(id *)a6, "endDictionary");
        if (*(_QWORD *)a6 || !*(_BYTE *)(a6 + 32))
        {
          objc_msgSend(v24, "relationshipsByCodingKey");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)a6, "beginDictionaryOfSize:", objc_msgSend(v16, "count"));
          v25 = v21;
          v26 = 3221225472;
          v27 = __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_2;
          v28 = &unk_24E788728;
          v29 = a1;
          v30 = v22;
          v31 = a2;
          v32 = a6;
          v23 = v22;
          objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v25);
          objc_msgSend(*(id *)a6, "endDictionary");

        }
        goto LABEL_19;
      }
      if (v15 == 1)
      {
        objc_msgSend(*(id *)a6, "beginDictionaryOfSize:", 0);
        objc_msgSend(*(id *)a6, "endDictionary");
        objc_msgSend(*(id *)a6, "beginDictionaryOfSize:", 0);
        objc_msgSend(*(id *)a6, "endDictionary");
LABEL_20:

        objc_msgSend(*(id *)a6, "endArray");
        goto LABEL_21;
      }
    }
    else
    {
      v16 = 0;
    }
    *(_BYTE *)(a6 + 32) = 1;
    if (!*(_QWORD *)a6)
      goto LABEL_20;
    objc_msgSend(v24, "attributesByCodingKey");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)a6, "beginDictionaryOfSize:", objc_msgSend(v17, "count"));
    v18 = MEMORY[0x24BDAC760];
    v33 = MEMORY[0x24BDAC760];
    v34 = 3221225472;
    v35 = __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_3;
    v36 = &unk_24E788750;
    v38 = a2;
    v39 = (void *)a6;
    v37 = a1;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", &v33);
    objc_msgSend(*(id *)a6, "endDictionary");
    objc_msgSend(v24, "relationshipsByCodingKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)a6, "beginDictionaryOfSize:", objc_msgSend(v19, "count"));
    v25 = v18;
    v26 = 3221225472;
    v27 = __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_4;
    v28 = &unk_24E788778;
    v30 = a2;
    v31 = (void *)a6;
    v29 = a1;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", &v25);
    objc_msgSend(*(id *)a6, "endDictionary");

LABEL_19:
    goto LABEL_20;
  }
}

- (void)_encodeKeyAttributesOfManagedObject:(void *)a3 withDescription:(uint64_t)a4 typeID:(int)a5 byReference:(id *)a6 context:
{
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[8];

  if (*a6)
  {
    objc_msgSend(*a6, "beginDictionaryOfSize:", -1);
    if (a5)
    {
      objc_msgSend(a3, "refContextKeyPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v21 = v12;
        objc_msgSend(a2, "valueForKeyPath:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *a6;
        if (!v13)
        {
          objc_msgSend(a3, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "failWithReason:", CFSTR("%@: Missing required REF context (%@)"), v20, v21);

          return;
        }
        v15 = (void *)v13;
        objc_msgSend(a3, "refContextCodingKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "writeDictionaryKey:", v16);

        objc_msgSend(a3, "refContextEntity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "descriptionForEntity:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDManagedObjectCodingModel _encodeKeyAttributesOfManagedObject:withDescription:typeID:byReference:context:](a1, v15, v18, 0, 1, a6);

        v12 = v21;
      }

    }
    if (a4)
    {
      objc_msgSend(*a6, "writeDictionaryKey:", CFSTR("$type"));
      objc_msgSend(*a6, "writeString:", a4);
    }
    objc_msgSend(a3, "keyAttributesByCodingKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __125__HMDManagedObjectCodingModel_Transmutation___encodeKeyAttributesOfManagedObject_withDescription_typeID_byReference_context___block_invoke;
    v22[3] = &unk_24E7886D8;
    v22[4] = a2;
    v22[5] = a3;
    v22[6] = a1;
    v22[7] = a6;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v22);

    objc_msgSend(*a6, "endDictionary");
  }
}

void __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  void *v8;
  int v9;
  id v10;

  v5 = **(void ***)(a1 + 56);
  if (v5)
  {
    objc_msgSend(v5, "writeDictionaryKey:", a2);
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDManagedObjectCodingModel _encodeAttribute:ofManagedObject:context:](v6, v10, *(void **)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else if ((objc_msgSend(a2, "isEqualToString:", CFSTR("writerTimestamp")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldIncludeWithConditions:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16));

    if (v9)
    {
      *a3 = 1;
      *(_BYTE *)(*(_QWORD *)(a1 + 56) + 32) = 1;
    }
  }
}

void __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_2(uint64_t a1, uint64_t a2, BOOL *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  objc_msgSend(**(id **)(a1 + 56), "writeDictionaryKey:", a2);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDManagedObjectCodingModel _encodeRelationship:ofManagedObject:context:](v6, v7, *(void **)(a1 + 48), *(_QWORD *)(a1 + 56));

  v8 = *(_QWORD *)(a1 + 56);
  if (*(_QWORD *)v8)
    v9 = 0;
  else
    v9 = *(_BYTE *)(v8 + 32) != 0;
  *a3 = v9;
}

void __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(**(id **)(a1 + 48), "writeDictionaryKey:", a2);
  -[HMDManagedObjectCodingModel _encodeAttribute:ofManagedObject:context:](*(_QWORD *)(a1 + 32), a3, *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __103__HMDManagedObjectCodingModel_Transmutation___encodePropertiesOfManagedObject_withDescription_context___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  objc_msgSend(**(id **)(a1 + 48), "writeDictionaryKey:", a2);
  -[HMDManagedObjectCodingModel _encodeRelationship:ofManagedObject:context:](*(void **)(a1 + 32), a3, *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_encodeRelationship:(void *)a3 ofManagedObject:(uint64_t)a4 context:
{
  void *v8;
  int v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  char v30;
  id obj;
  uint64_t v32;
  unsigned int v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    objc_msgSend(a1, "descriptionForDestinationOfRelationship:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(a2, "isParentChild");
    if (v9)
      v33 = objc_msgSend(v8, "hasConcreteSubentities");
    else
      v33 = 0;
    objc_msgSend(a2, "relationship");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isToMany");

    if (v11)
    {
      v12 = objc_msgSend(a2, "isConditional");
      objc_msgSend(a2, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a3, "valueForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = *(id *)a4;
      if ((v12 & 1) != 0)
        v16 = -1;
      else
        v16 = objc_msgSend(v14, "count");
      objc_msgSend(v15, "beginArrayOfSize:", v16);
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v19 = v14;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v20)
      {
        v21 = v20;
        obj = v19;
        v32 = (uint64_t)v8;
        v22 = (uint64_t)a1;
        v30 = 0;
        v23 = *(_QWORD *)v35;
        v24 = v9 ^ 1u;
LABEL_14:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v25);
          v27 = *(void **)(a4 + 8);
          objc_msgSend(v26, "objectID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "changeScopeForObjectWithID:attributeKeys:relationshipKeys:", v28, 0, 0);

          if (v29 != 1)
            break;
          if (*(_QWORD *)a4)
            goto LABEL_21;
LABEL_23:
          if (v21 == ++v25)
          {
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
            if (v21)
              goto LABEL_14;
            v19 = obj;

            v8 = (void *)v32;
            if ((v30 & 1) != 0)
              goto LABEL_32;
            goto LABEL_31;
          }
        }
        v30 = 1;
LABEL_21:
        -[HMDManagedObjectCodingModel _conditionallyEncodeChildObject:withDescription:forRelationship:byReference:useDynamicType:context:](v22, v26, v32, a2, v24, v33, a4);
        if (!*(_QWORD *)a4 && *(_BYTE *)(a4 + 32))
        {
          v19 = obj;

          v8 = (void *)v32;
          goto LABEL_33;
        }
        goto LABEL_23;
      }

LABEL_31:
      *(_BYTE *)(a4 + 32) = 1;
LABEL_32:
      objc_msgSend(*(id *)a4, "endArray");
LABEL_33:

    }
    else
    {
      objc_msgSend(a2, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a3, "valueForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        if ((-[HMDManagedObjectCodingModel _conditionallyEncodeChildObject:withDescription:forRelationship:byReference:useDynamicType:context:]((uint64_t)a1, v18, (uint64_t)v8, a2, v9 ^ 1u, v33, a4) & 1) == 0)objc_msgSend(*(id *)a4, "writeNull");
      }
      else
      {
        objc_msgSend(*(id *)a4, "writeNull");
        *(_BYTE *)(a4 + 32) = 1;
      }

    }
  }
}

- (uint64_t)_conditionallyEncodeChildObject:(uint64_t)a3 withDescription:(void *)a4 forRelationship:(uint64_t)a5 byReference:(uint64_t)a6 useDynamicType:(uint64_t)a7 context:
{
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  v14 = *(_QWORD *)(a7 + 16);
  if (v14)
  {
    v15 = *(_QWORD *)(v14 + 16);
    if (!a1)
      goto LABEL_4;
    goto LABEL_3;
  }
  v15 = 0;
  if (a1)
  {
LABEL_3:
    ((void (*)(void *, _QWORD, uint64_t, _QWORD))objc_msgSend(a2, "methodForSelector:", *(_QWORD *)(a1 + 120)))(a2, *(_QWORD *)(a1 + 120), v14, *(_QWORD *)(a7 + 24));
    v14 = *(_QWORD *)(a7 + 16);
  }
LABEL_4:
  result = objc_msgSend(a4, "shouldIncludeWithConditions:", v14);
  if ((_DWORD)result)
  {
    if ((objc_msgSend(*(id *)(a7 + 40), "shouldExcludeObject:context:", a2, *(_QWORD *)(a7 + 24)) & 1) != 0)
    {
      result = 0;
    }
    else if (*(_QWORD *)a7 || !(_DWORD)a5)
    {
      -[HMDManagedObjectCodingModel _encodeManagedObject:withDescription:byReference:useDynamicType:context:](a1, a2, a3, a5, a6, a7);
      result = 1;
    }
    else
    {
      result = 1;
      *(_BYTE *)(a7 + 32) = 1;
    }
  }
  v17 = *(_QWORD *)(a7 + 16);
  if (v17)
    *(_QWORD *)(v17 + 16) = v15;
  return result;
}

- (void)_encodeAttribute:(void *)a3 ofManagedObject:(uint64_t)a4 context:
{
  void *v8;
  id v9;

  if (a1)
  {
    if ((objc_msgSend(a2, "shouldIncludeWithConditions:", *(_QWORD *)(a4 + 16)) & 1) != 0)
    {
      objc_msgSend(a2, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void *, _QWORD, void *, _QWORD))objc_msgSend(a3, "methodForSelector:", *(_QWORD *)(a1 + 128)))(a3, *(_QWORD *)(a1 + 128), v8, *(_QWORD *)(a4 + 24));
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[HMDManagedObjectCodingModel _encodeValue:forAttribute:context:](a1, v9, a2, (id *)a4);
    }
    else
    {
      objc_msgSend(*(id *)a4, "writeNull");
    }
  }
}

- (void)_encodeValue:(void *)a3 forAttribute:(id *)a4 context:
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  if (a1)
  {
    if (a2)
    {
      objc_msgSend(a3, "attribute");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "attributeType");

      if (v8 <= 699)
      {
        if (v8 > 399)
        {
          if (v8 != 400 && v8 != 500 && v8 != 600)
            goto LABEL_42;
        }
        else if (v8 != 100 && v8 != 200 && v8 != 300)
        {
          goto LABEL_42;
        }
        objc_msgSend(*a4, "writeNumber:", a2);
      }
      else if (v8 <= 999)
      {
        switch(v8)
        {
          case 700:
            objc_msgSend(*a4, "writeString:", a2);
            break;
          case 800:
            objc_msgSend(*a4, "writeBoolean:", objc_msgSend(a2, "BOOLValue"));
            break;
          case 900:
            objc_msgSend(*a4, "writeDate:", a2);
            break;
          default:
            goto LABEL_42;
        }
      }
      else if (v8 > 1199)
      {
        if (v8 == 1200)
        {
          objc_msgSend(a2, "absoluteString");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = *a4;
          v24 = (id)v11;
          if (v11)
          {
            objc_msgSend(v12, "writeString:", v11);
          }
          else
          {
            objc_msgSend(a3, "shortDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "failWithReason:", CFSTR("%@: Invalid / malformed URI value"), v16);

          }
        }
        else
        {
          if (v8 != 1800)
            goto LABEL_42;
          v25 = 0;
          objc_msgSend(a3, "transformer");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(a3, "shouldInline")
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && objc_msgSend((id)objc_opt_class(), "isStructuredDataCompatible"))
          {
            objc_msgSend(v9, "OPACKFromValue:error:", a2, &v25);
            v10 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v9, "transformedValue:error:", a2, &v25);
            v10 = objc_claimAutoreleasedReturnValue();
          }
          v13 = (void *)v10;

          v14 = v25;
          v15 = *a4;
          if (v13)
          {
            objc_msgSend(v15, "writeLogicalValue:validateAndCopy:", v13, 0);
          }
          else
          {
            objc_msgSend(a3, "shortDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "failWithReason:", CFSTR("%@: Failed to transform attribute value: %@"), v17, v14);

          }
        }
      }
      else
      {
        if (v8 != 1000)
        {
          if (v8 == 1100)
          {
            objc_msgSend(*a4, "writeUUID:", a2);
            return;
          }
LABEL_42:
          v18 = (void *)MEMORY[0x24BDBCE88];
          v19 = *MEMORY[0x24BDBCAB0];
          v20 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(a3, "attribute");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("Attribute type not supported: %zd"), objc_msgSend(v21, "attributeType"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v22, 0);
          v23 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v23);
        }
        objc_msgSend(*a4, "writeData:", a2);
      }
    }
    else
    {
      objc_msgSend(*a4, "writeNull");
    }
  }
}

void __125__HMDManagedObjectCodingModel_Transmutation___encodeKeyAttributesOfManagedObject_withDescription_typeID_byReference_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v6;
  void *v7;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = *(id **)(a1 + 56);
  v9 = *v8;
  if (v12)
  {
    objc_msgSend(*v8, "writeDictionaryKey:", a2);
    -[HMDManagedObjectCodingModel _encodeValue:forAttribute:context:](*(_QWORD *)(a1 + 48), v12, a3, *(id **)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a3, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "failWithReason:", CFSTR("%@: Key attribute '%@' is missing"), v10, v11);

  }
}

@end
