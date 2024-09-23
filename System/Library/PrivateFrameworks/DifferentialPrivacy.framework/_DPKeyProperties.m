@implementation _DPKeyProperties

+ (void)initialize
{
  if (initialize_onceToken_2 != -1)
    dispatch_once(&initialize_onceToken_2, &__block_literal_global_15);
}

+ (id)parametersForAlgorithm:(id)a3 properties:(id)a4 epsilon:(id)a5 fragmentWidth:(unint64_t)a6 fragmentCount:(unint64_t)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *context;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  context = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AlgorithmParameters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DPAlgorithmParameters algorithmParametersForKey:](_DPAlgorithmParameters, "algorithmParametersForKey:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v17);
  }

  v22 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  if (objc_msgSend((id)kAlgorithmsWithEpsilon, "containsObject:", v9))
  {
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v11, CFSTR("epsilon"));
    objc_msgSend(v22, "addEntriesFromDictionary:", v14);
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SequenceFragmentPuzzle+CountMedianSketch")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("SequenceFragmentPuzzle+HadamardCountMedianSketch")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("fragmentWidth"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("fragmentCount"));

  }
  v25 = (void *)objc_msgSend(v22, "copy");

  objc_autoreleasePoolPop(context);
  return v25;
}

- (_DPKeyProperties)init
{

  return 0;
}

- (_DPKeyProperties)initWithPropertyName:(id)a3 dictionary:(id)a4
{
  id v7;
  id v8;
  _DPKeyProperties *v9;
  _DPKeyProperties *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _DPKeyProperties *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSString *serverAlgorithmString;
  uint64_t v42;
  NSDictionary *parameterDictionary;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  void *v50;
  char isKindOfClass;
  int v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  _DPValueRange *possibleRange;
  void *v59;
  id *p_noiseDistribution;
  NSObject *v61;
  void *v62;
  NSString *v63;
  void *v64;
  NSString *huffmanTableClass;
  NSNumber *v66;
  NSNumber *acceptableError;
  _DPValueRange *v68;
  _DPValueRange *trimmedScale;
  _DPValueRange *v70;
  uint64_t v71;
  NSString *namespaceName;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSNumber *v97;
  NSString *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  NSObject *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  objc_super v111;
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v111.receiver = self;
  v111.super_class = (Class)_DPKeyProperties;
  v9 = -[_DPKeyProperties init](&v111, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_80;
  if (!v7)
  {
    +[_DPLog framework](_DPLog, "framework");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_DPKeyProperties initWithPropertyName:dictionary:].cold.1();

    goto LABEL_33;
  }
  objc_storeStrong((id *)&v9->_propertiesName, a3);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Transport"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
    goto LABEL_13;
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("parsec")))
  {
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("PrivateCloud")))
    {
      v13 = 3;
      goto LABEL_14;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("Dedisco")))
    {
      v13 = 4;
      goto LABEL_14;
    }
LABEL_13:
    v13 = 1;
    goto LABEL_14;
  }
  v13 = 2;
LABEL_14:
  v10->_transport = v13;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DirectUpload"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_directUpload = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DataAlgorithm"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[_DPLog framework](_DPLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[_DPKeyProperties initWithPropertyName:dictionary:].cold.2();
    goto LABEL_32;
  }
  objc_msgSend((id)kDataAlgorithmsMap, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_dataAlgorithm = objc_msgSend(v17, "unsignedIntegerValue");

  if (!v10->_dataAlgorithm)
  {
    +[_DPLog framework](_DPLog, "framework");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[_DPKeyProperties initWithPropertyName:dictionary:].cold.3((uint64_t)&v10->_dataAlgorithm, v20, v29, v30, v31, v32, v33, v34);
    goto LABEL_32;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FragmentWidth"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_fragmentWidth = objc_msgSend(v18, "unsignedIntegerValue");

  if (!v10->_fragmentWidth)
    v10->_fragmentWidth = 2;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FragmentCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_fragmentCount = objc_msgSend(v19, "unsignedIntegerValue");

  if (!v10->_fragmentCount)
    v10->_fragmentCount = 7;
  if (v10->_transport != 3)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PrivacyParameter"));
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[_DPLog framework](_DPLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[_DPKeyProperties initWithPropertyName:dictionary:].cold.8();
      goto LABEL_31;
    }
    objc_storeStrong((id *)&v10->_privacyParameter, v20);
    -[NSNumber doubleValue](v10->_privacyParameter, "doubleValue");
    if (isInvalidEpsilon(v21))
    {
      +[_DPLog framework](_DPLog, "framework");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[_DPKeyProperties initWithPropertyName:dictionary:].cold.9((uint64_t)&v10->_privacyParameter, v22, v23, v24, v25, v26, v27, v28);
LABEL_31:

LABEL_32:
      goto LABEL_33;
    }

  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("KeyPatternsAllowed"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_keyPatternsAllowed = objc_msgSend(v36, "BOOLValue");

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SubmissionPriority"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v10->_submissionPriority = objc_msgSend(v37, "unsignedIntegerValue");

  if (!v10->_submissionPriority)
    v10->_submissionPriority = kLowestSubmissionPriority;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ServerAlgorithmString"));
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  if (!v38)
  {
    +[_DPLog framework](_DPLog, "framework");
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      -[_DPKeyProperties initWithPropertyName:dictionary:].cold.4();
    v52 = 1;
    goto LABEL_79;
  }
  v102 = (void *)v38;
  v103 = v16;
  v104 = v12;
  v105 = v7;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ServerAlgorithmString"));
  v40 = objc_claimAutoreleasedReturnValue();
  serverAlgorithmString = v10->_serverAlgorithmString;
  v10->_serverAlgorithmString = (NSString *)v40;

  objc_msgSend((id)objc_opt_class(), "parametersForAlgorithm:properties:epsilon:fragmentWidth:fragmentCount:", v10->_serverAlgorithmString, v8, v10->_privacyParameter, v10->_fragmentWidth, v10->_fragmentCount);
  v42 = objc_claimAutoreleasedReturnValue();
  parameterDictionary = v10->_parameterDictionary;
  v10->_parameterDictionary = (NSDictionary *)v42;

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PrivatizationAlgorithm"));
  v106 = objc_claimAutoreleasedReturnValue();
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v110 = 0u;
  v44 = (id)kAlgorithmStringsMap;
  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v107, v112, 16);
  if (!v45)
    goto LABEL_49;
  v46 = v45;
  v47 = *(_QWORD *)v108;
  while (2)
  {
    for (i = 0; i != v46; ++i)
    {
      if (*(_QWORD *)v108 != v47)
        objc_enumerationMutation(v44);
      v49 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
      objc_msgSend((id)kAlgorithmStringsMap, "objectForKeyedSubscript:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqual:](v106, "isEqual:", v50))
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v53 = v49;

          if (!v53)
            goto LABEL_65;
          v10->_privatizationAlgorithm = -[NSObject unsignedIntegerValue](v53, "unsignedIntegerValue");
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MinimumPossible"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MaximumPossible"));
          v55 = objc_claimAutoreleasedReturnValue();
          v56 = (void *)v55;
          if (v54 && v55)
          {
            +[_DPValueRange rangeWithMin:max:](_DPValueRange, "rangeWithMin:max:", v54, v55);
            v57 = objc_claimAutoreleasedReturnValue();
            possibleRange = v10->_possibleRange;
            v10->_possibleRange = (_DPValueRange *)v57;

          }
          if (v10->_dataAlgorithm == 1 && !v10->_possibleRange)
          {
            v52 = 1;
            v39 = v102;
LABEL_77:

            v12 = v104;
            v7 = v105;
            v16 = v103;
            goto LABEL_78;
          }
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NoiseDistribution"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          p_noiseDistribution = (id *)&v10->_noiseDistribution;
          objc_storeStrong((id *)&v10->_noiseDistribution, v59);
          v39 = v102;
          if (v10->_dataAlgorithm != 1
            || (objc_msgSend(*p_noiseDistribution, "isEqualToString:", CFSTR("Laplace")) & 1) != 0
            || (objc_msgSend(*p_noiseDistribution, "isEqualToString:", CFSTR("Uniform")) & 1) != 0)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BudgetKeyName"));
            v61 = objc_claimAutoreleasedReturnValue();
            if (v61)
            {
              +[_DPPrivacyBudget budgetWithName:](_DPPrivacyBudget, "budgetWithName:", v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_storeStrong((id *)&v10->_budget, v62);
              if (v10->_budget)
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HuffmanTableClass"));
                v63 = (NSString *)objc_claimAutoreleasedReturnValue();
                v101 = v62;
                v64 = v59;
                huffmanTableClass = v10->_huffmanTableClass;
                v10->_huffmanTableClass = v63;
                v98 = v63;

                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AcceptableError"));
                v66 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                acceptableError = v10->_acceptableError;
                v10->_acceptableError = v66;
                v97 = v66;

                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MinimumTrimmed"));
                v100 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MaximumTrimmed"));
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                +[_DPValueRange rangeWithMin:max:](_DPValueRange, "rangeWithMin:max:", v100, v99);
                v68 = (_DPValueRange *)objc_claimAutoreleasedReturnValue();
                trimmedScale = v10->_trimmedScale;
                v10->_trimmedScale = v68;
                v70 = v68;

                v59 = v64;
                v62 = v101;
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Namespace"));
                v71 = objc_claimAutoreleasedReturnValue();
                namespaceName = v10->_namespaceName;
                v10->_namespaceName = (NSString *)v71;

                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ApprovedForNonDNU"));
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v10->_approvedForNonDNU = objc_msgSend(v73, "BOOLValue");

                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TelemetryAllowed"));
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v10->_telemetryAllowed = objc_msgSend(v74, "BOOLValue");

                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TransparencyLogLifetime"));
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v10->_transparencyLogLifetime = objc_msgSend(v75, "unsignedIntegerValue");

                v76 = (void *)v100;
                v52 = 0;
              }
              else
              {
                +[_DPLog framework](_DPLog, "framework");
                v83 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
                  -[_DPKeyProperties initWithPropertyName:dictionary:].cold.6((uint64_t)v61, v83, v84, v85, v86, v87, v88, v89);
                v76 = v83;
                v52 = 1;
              }

              goto LABEL_76;
            }
          }
          else
          {
            +[_DPLog framework](_DPLog, "framework");
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              -[_DPKeyProperties initWithPropertyName:dictionary:].cold.7((uint64_t)v59, v61, v90, v91, v92, v93, v94, v95);
          }
          v52 = 1;
LABEL_76:

          goto LABEL_77;
        }
      }
      else
      {

      }
    }
    v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v107, v112, 16);
    if (v46)
      continue;
    break;
  }
LABEL_49:

LABEL_65:
  +[_DPLog framework](_DPLog, "framework");
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    -[_DPKeyProperties initWithPropertyName:dictionary:].cold.5((uint64_t)v106, v53, v77, v78, v79, v80, v81, v82);
  v52 = 1;
  v12 = v104;
  v39 = v102;
  v16 = v103;
LABEL_78:

LABEL_79:
  if (!v52)
  {
LABEL_80:
    v35 = v10;
    goto LABEL_81;
  }
LABEL_33:
  v35 = 0;
LABEL_81:

  return v35;
}

+ (_DPKeyProperties)keyPropertiesWithName:(id)a3 fromDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPropertyName:dictionary:", v7, v6);

  return (_DPKeyProperties *)v8;
}

+ (id)keyPropertiesForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[_DPStrings keyPropertiesPath](_DPStrings, "keyPropertiesPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertiesFromFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSNumber *privacyParameter;
  unint64_t transport;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)&self->_acceptableError;
  v13 = *(_OWORD *)&self->_propertiesName;
  v11 = *(_OWORD *)&self->_noiseDistribution;
  privacyParameter = self->_privacyParameter;
  transport = self->_transport;
  -[_DPKeyProperties privatizationAlgorithmString](self, "privatizationAlgorithmString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { propertiesName=%@ ; possibleRange=%@ ; acceptableError=%@ ; trimmedScale=%@ ; noiseDistribution=%@ ; budget=%@ ; privacyParameter=%@ ; transport=%ld ; privatizationAlgorithm=%@ ; keyPatternsAllowed=%d ; submissionPriority=%lu ; parameterDictionary=%@ ;  }"),
    v5,
    v13,
    v12,
    v11,
    privacyParameter,
    transport,
    v8,
    self->_keyPatternsAllowed,
    self->_submissionPriority,
    self->_parameterDictionary);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)propertiesFromFile:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39___DPKeyProperties_propertiesFromFile___block_invoke;
  v9[3] = &unk_1E95D92C0;
  v10 = v4;
  v11 = a1;
  v5 = propertiesFromFile__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&propertiesFromFile__onceToken, v9);
  v7 = (id)allKeyProperties;

  return v7;
}

- (id)privatizationAlgorithmString
{
  void *v2;
  void *v3;
  uint64_t v4;
  __CFString *v5;

  v2 = (void *)kAlgorithmStringsMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[_DPKeyProperties privatizationAlgorithm](self, "privatizationAlgorithm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("UNKNOWN");
  return v5;
}

- (NSString)propertiesName
{
  return self->_propertiesName;
}

- (_DPValueRange)possibleRange
{
  return self->_possibleRange;
}

- (NSNumber)acceptableError
{
  return self->_acceptableError;
}

- (_DPValueRange)trimmedScale
{
  return self->_trimmedScale;
}

- (NSString)noiseDistribution
{
  return self->_noiseDistribution;
}

- (_DPPrivacyBudget)budget
{
  return self->_budget;
}

- (NSNumber)privacyParameter
{
  return self->_privacyParameter;
}

- (unint64_t)fragmentWidth
{
  return self->_fragmentWidth;
}

- (unint64_t)fragmentCount
{
  return self->_fragmentCount;
}

- (BOOL)directUpload
{
  return self->_directUpload;
}

- (BOOL)bitStringAlgorithm
{
  return self->_bitStringAlgorithm;
}

- (NSString)serverAlgorithmString
{
  return self->_serverAlgorithmString;
}

- (NSDictionary)parameterDictionary
{
  return self->_parameterDictionary;
}

- (BOOL)keyPatternsAllowed
{
  return self->_keyPatternsAllowed;
}

- (unint64_t)submissionPriority
{
  return self->_submissionPriority;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (BOOL)approvedForNonDNU
{
  return self->_approvedForNonDNU;
}

- (BOOL)telemetryAllowed
{
  return self->_telemetryAllowed;
}

- (unint64_t)transparencyLogLifetime
{
  return self->_transparencyLogLifetime;
}

- (unint64_t)dataAlgorithm
{
  return self->_dataAlgorithm;
}

- (unint64_t)privatizationAlgorithm
{
  return self->_privatizationAlgorithm;
}

- (unint64_t)transport
{
  return self->_transport;
}

- (NSString)huffmanTableClass
{
  return self->_huffmanTableClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_huffmanTableClass, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_parameterDictionary, 0);
  objc_storeStrong((id *)&self->_serverAlgorithmString, 0);
  objc_storeStrong((id *)&self->_privacyParameter, 0);
  objc_storeStrong((id *)&self->_budget, 0);
  objc_storeStrong((id *)&self->_noiseDistribution, 0);
  objc_storeStrong((id *)&self->_trimmedScale, 0);
  objc_storeStrong((id *)&self->_acceptableError, 0);
  objc_storeStrong((id *)&self->_possibleRange, 0);
  objc_storeStrong((id *)&self->_propertiesName, 0);
}

- (void)initWithPropertyName:dictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "nil propertiesName", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPropertyName:dictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "nil dataAlgorithmString", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPropertyName:(uint64_t)a3 dictionary:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "unknown dataAlgorithmString = %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithPropertyName:dictionary:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "nil serverAlgorithmString", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPropertyName:(uint64_t)a3 dictionary:(uint64_t)a4 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Unknown privatization algorithm string = %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithPropertyName:(uint64_t)a3 dictionary:(uint64_t)a4 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Fail to find budget for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithPropertyName:(uint64_t)a3 dictionary:(uint64_t)a4 .cold.7(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "Unknown noise distribution = %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithPropertyName:dictionary:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "nil privacyParameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithPropertyName:(uint64_t)a3 dictionary:(uint64_t)a4 .cold.9(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a2, a3, "invalid epsilon = %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
