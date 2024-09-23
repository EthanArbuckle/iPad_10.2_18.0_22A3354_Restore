@implementation DESGaussianAlgorithmParameters

- (DESGaussianAlgorithmParameters)initWith:(id)a3 recipe:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  NSObject *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  void *v31;
  char v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  DESGaussianAlgorithmParameters *v39;
  NSObject *v40;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "recipeUserInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maxNorm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[DESGaussianAlgorithmParameters initWith:recipe:].cold.5(v7);
    goto LABEL_25;
  }
  objc_msgSend(v7, "recipeUserInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("maxNorm"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v7, "recipeUserInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DifferentialPrivacyParameters"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v17 = objc_opt_isKindOfClass();

  objc_msgSend(v7, "recipeUserInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((v17 & 1) != 0)
  {
    v20 = CFSTR("DifferentialPrivacyParameters");
  }
  else
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("LocalDifferentialPrivacyParameters"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) == 0)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[DESGaussianAlgorithmParameters initWith:recipe:].cold.4(v7, v21);
      goto LABEL_25;
    }
    objc_msgSend(v7, "recipeUserInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = CFSTR("LocalDifferentialPrivacyParameters");
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", v20);
  v21 = objc_claimAutoreleasedReturnValue();

  -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("mechanism"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("mechanism"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("gaussian"));

    if ((v26 & 1) != 0)
    {
      -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("epsilon"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("delta"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v29 = objc_opt_isKindOfClass();

        if ((v29 & 1) != 0)
        {
          -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("MomentsAccountantParameters"));
          v30 = objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("MomentsAccountantParameters"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v32 = objc_opt_isKindOfClass();

            if ((v32 & 1) == 0)
            {
              +[DESLogging coreChannel](DESLogging, "coreChannel");
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                -[DESGaussianAlgorithmParameters initWith:recipe:].cold.1(v7);
              v39 = 0;
              goto LABEL_30;
            }
            -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("MomentsAccountantParameters"));
            v30 = objc_claimAutoreleasedReturnValue();
          }
          -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("epsilon"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v35 = v34;

          -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("delta"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "doubleValue");
          v38 = v37;

          self = -[DESGaussianAlgorithmParameters initWith:epsilon:delta:clippingBound:momentsAccountantParameters:](self, "initWith:epsilon:delta:clippingBound:momentsAccountantParameters:", v6, v30, v35, v38, v14);
          v39 = self;
LABEL_30:

          goto LABEL_26;
        }
      }
      else
      {

      }
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[DESGaussianAlgorithmParameters initWith:recipe:].cold.2(v7, v40);
      goto LABEL_24;
    }
  }
  else
  {

  }
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    -[DESGaussianAlgorithmParameters initWith:recipe:].cold.3(v7);
LABEL_24:

LABEL_25:
  v39 = 0;
LABEL_26:

  return v39;
}

- (DESGaussianAlgorithmParameters)initWith:(id)a3 epsilon:(double)a4 delta:(double)a5 clippingBound:(double)a6
{
  return -[DESGaussianAlgorithmParameters initWith:epsilon:delta:clippingBound:momentsAccountantParameters:](self, "initWith:epsilon:delta:clippingBound:momentsAccountantParameters:", a3, 0, a4, a5, a6);
}

- (DESGaussianAlgorithmParameters)initWith:(id)a3 epsilon:(double)a4 delta:(double)a5 clippingBound:(double)a6 momentsAccountantParameters:(id)a7
{
  id v11;
  id v13;
  id v14;
  DESGaussianAlgorithmParameters *v15;
  DESGaussianAlgorithmParameters *v16;
  NSDictionary *momentsAccountantParameters;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char isKindOfClass;
  uint64_t v29;
  NSDictionary *v30;
  void *v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  DESGaussianAlgorithmParameters *v41;
  double sigma;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSMutableDictionary *parameters;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  DESGaussianAlgorithmParameters *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _QWORD v77[4];
  _QWORD v78[4];
  _BYTE v79[128];
  _QWORD v80[8];

  v11 = a3;
  v80[6] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  v76.receiver = self;
  v76.super_class = (Class)DESGaussianAlgorithmParameters;
  v15 = -[DESGaussianAlgorithmParameters init](&v76, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_24;
  v15->_epsilon = a4;
  v15->_delta = a5;
  v15->_clippingBound = a6;
  momentsAccountantParameters = v15->_momentsAccountantParameters;
  v15->_momentsAccountantParameters = 0;

  if (!v14)
  {
    calculateSigmaFromEpsilonAndDeltaForUnitL2Norm(a4, a5);
    v16->_sigma = sigma;
LABEL_20:
    v41 = 0;
    if (fabs(sigma) == INFINITY)
      goto LABEL_25;
    objc_storeStrong((id *)&v16->_key, v11);
    v78[0] = CFSTR("GaussianFromSigma");
    v77[0] = CFSTR("Mechanism");
    v77[1] = CFSTR("OverallEpsilon");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v43;
    v77[2] = CFSTR("OverallDelta");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v78[2] = v44;
    v77[3] = CFSTR("OverallClippingBound");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v78[3] = v45;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 4);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = objc_msgSend(v46, "mutableCopy");
    parameters = v16->_parameters;
    v16->_parameters = (NSMutableDictionary *)v47;

    if (v16->_momentsAccountantParameters)
      -[NSMutableDictionary addEntriesFromDictionary:](v16->_parameters, "addEntriesFromDictionary:");

LABEL_24:
    v41 = v16;
    goto LABEL_25;
  }
  v69 = v11;
  v80[0] = CFSTR("RenyiOrder");
  v80[1] = CFSTR("CohortSigma");
  v80[2] = CFSTR("NumIterations");
  v80[3] = CFSTR("MaxCohortSize");
  v80[4] = CFSTR("CurrentCohortSize");
  v80[5] = CFSTR("PopulationSize");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 6);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v73;
    v70 = v16;
    v71 = v13;
    while (2)
    {
      v22 = v18;
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v73 != v21)
          objc_enumerationMutation(v22);
        v24 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v24);
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)v25;
          objc_msgSend(v14, "objectForKeyedSubscript:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            continue;
        }
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[DESGaussianAlgorithmParameters initWith:epsilon:delta:clippingBound:momentsAccountantParameters:].cold.4(v24, v34, v35, v36, v37, v38, v39, v40);

        v18 = v22;
        v33 = v22;
        v16 = v70;
        v13 = v71;
        goto LABEL_18;
      }
      v18 = v22;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      v16 = v70;
      v13 = v71;
      if (v20)
        continue;
      break;
    }
  }

  objc_msgSend(v14, "dictionaryWithValuesForKeys:", v18);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v16->_momentsAccountantParameters;
  v16->_momentsAccountantParameters = (NSDictionary *)v29;

  -[NSDictionary objectForKeyedSubscript:](v16->_momentsAccountantParameters, "objectForKeyedSubscript:", CFSTR("RenyiOrder"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "intValue");

  if ((v32 - 33) > 0xFFFFFFE0)
  {
    -[NSDictionary objectForKeyedSubscript:](v16->_momentsAccountantParameters, "objectForKeyedSubscript:", CFSTR("NumIterations"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "longLongValue");

    if (v51 <= 0)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[DESGaussianAlgorithmParameters initWith:epsilon:delta:clippingBound:momentsAccountantParameters:].cold.2(v33, v60, v61, v62, v63, v64, v65, v66);
      goto LABEL_18;
    }
    -[NSDictionary objectForKeyedSubscript:](v16->_momentsAccountantParameters, "objectForKeyedSubscript:", CFSTR("MaxCohortSize"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "longLongValue");

    -[NSDictionary objectForKeyedSubscript:](v16->_momentsAccountantParameters, "objectForKeyedSubscript:", CFSTR("CurrentCohortSize"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "longLongValue");

    -[NSDictionary objectForKeyedSubscript:](v16->_momentsAccountantParameters, "objectForKeyedSubscript:", CFSTR("PopulationSize"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "longLongValue");

    if (v53 < 1 || v55 < 1 || v57 < 1 || v55 > v53 || v53 > v57)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[DESGaussianAlgorithmParameters initWith:epsilon:delta:clippingBound:momentsAccountantParameters:].cold.3(v33, v67, v68);
      goto LABEL_18;
    }
    -[NSDictionary objectForKeyedSubscript:](v16->_momentsAccountantParameters, "objectForKeyedSubscript:", CFSTR("CohortSigma"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "doubleValue");
    v16->_sigma = v59;

    sigma = v16->_sigma;
    v11 = v69;
    goto LABEL_20;
  }
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    -[DESGaussianAlgorithmParameters initWith:epsilon:delta:clippingBound:momentsAccountantParameters:].cold.1(v33);
LABEL_18:

  v41 = 0;
LABEL_25:

  return v41;
}

- (void)addPerChunkParametersWith:(double)a3 numChunks:(unint64_t)a4
{
  double v7;
  void *v8;
  void *v9;
  id v10;

  -[DESGaussianAlgorithmParameters sigma](self, "sigma");
  if (a4 != 1)
    v7 = v7 * self->_clippingBound / a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parameters, "setObject:forKeyedSubscript:", v8, CFSTR("SigmaAfterNormalizing"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parameters, "setObject:forKeyedSubscript:", v9, CFSTR("ClippingBound"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_parameters, "setObject:forKeyedSubscript:", v10, CFSTR("NumChunks"));

}

- (BOOL)calculateAndVerifyPerChunkClippingBoundsIn:(id)a3 withOverallClippingBound:(double)a4
{
  id v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  char v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  BOOL v23;
  NSObject *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    v12 = a4 / sqrt((double)v7);
    v13 = 0.0;
    v14 = 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v16, "clippingBound", (_QWORD)v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17 && (objc_msgSend(v17, "doubleValue"), v19 != 0.0))
        {
          objc_msgSend(v18, "doubleValue");
          objc_msgSend(v18, "doubleValue");
        }
        else
        {
          v14 = 0;
          v20 = v12;
        }
        v13 = v13 + v20 * v20;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setClippingBound:", v21);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v10);

    if ((v14 & 1) == 0)
      goto LABEL_16;
    v22 = sqrt(v13);
  }
  else
  {

    v22 = 0.0;
  }
  if (almostEqualDBLWithAccuracy(v22, a4, 0.0001))
  {
LABEL_16:
    v23 = 1;
    goto LABEL_20;
  }
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    -[DESGaussianAlgorithmParameters key](self, "key");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v32 = v22;
    v33 = 2048;
    v34 = a4;
    v35 = 2112;
    v36 = v26;
    _os_log_error_impl(&dword_1B96E5000, v24, OS_LOG_TYPE_ERROR, "Per chunk clipping bound root sum squared does not match overall clipping bound: %f vs. %f, for %@", buf, 0x20u);

  }
  v23 = 0;
LABEL_20:

  return v23;
}

- (NSDictionary)parameters
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_parameters, "copy");
}

- (NSString)key
{
  return self->_key;
}

- (double)sigma
{
  return self->_sigma;
}

- (double)clippingBound
{
  return self->_clippingBound;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_momentsAccountantParameters, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)initWith:(void *)a1 recipe:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "recipeID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_0(&dword_1B96E5000, v2, v3, "Recipe content '%@' is malformed for Dedisco, for recipe: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)initWith:(void *)a1 recipe:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recipeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412802;
  v6 = CFSTR("epsilon");
  v7 = 2112;
  v8 = CFSTR("delta");
  v9 = 2112;
  v10 = v3;
  OUTLINED_FUNCTION_2_3(&dword_1B96E5000, a2, v4, "Recipe content %@ or %@ is malformed for recipe: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_6_0();
}

- (void)initWith:(void *)a1 recipe:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "recipeID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_0(&dword_1B96E5000, v2, v3, "Recipe content '%@' malformed for Dedisco, for recipe: %@, only Gaussian is supported as local DP mechanism.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)initWith:(void *)a1 recipe:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "recipeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412802;
  v6 = CFSTR("DifferentialPrivacyParameters");
  v7 = 2112;
  v8 = CFSTR("LocalDifferentialPrivacyParameters");
  v9 = 2112;
  v10 = v3;
  OUTLINED_FUNCTION_2_3(&dword_1B96E5000, a2, v4, "Recipe content '%@' or '%@' malformed for Dedisco, for recipe: %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_6_0();
}

- (void)initWith:(void *)a1 recipe:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "recipeID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_0(&dword_1B96E5000, v2, v3, "Recipe content '%@' malformed for Dedisco, for recipe: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6();
}

- (void)initWith:(os_log_t)log epsilon:delta:clippingBound:momentsAccountantParameters:.cold.1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = 138412802;
  v2 = CFSTR("RenyiOrder");
  v3 = 1024;
  v4 = 2;
  v5 = 1024;
  v6 = 32;
  _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "Moments accountant parameter '%@' must be between %d and %d.", (uint8_t *)&v1, 0x18u);
  OUTLINED_FUNCTION_1();
}

- (void)initWith:(uint64_t)a3 epsilon:(uint64_t)a4 delta:(uint64_t)a5 clippingBound:(uint64_t)a6 momentsAccountantParameters:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B96E5000, a1, a3, "Moments accountant parameter '%@' must be greater than 0.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWith:(uint64_t)a3 epsilon:delta:clippingBound:momentsAccountantParameters:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 138412802;
  v4 = CFSTR("CurrentCohortSize");
  v5 = 2112;
  v6 = CFSTR("MaxCohortSize");
  v7 = 2112;
  v8 = CFSTR("PopulationSize");
  OUTLINED_FUNCTION_2_3(&dword_1B96E5000, a1, a3, "Moments accountant parameters require 0 <= %@ <= %@ <= %@.", (uint8_t *)&v3);
}

- (void)initWith:(uint64_t)a3 epsilon:(uint64_t)a4 delta:(uint64_t)a5 clippingBound:(uint64_t)a6 momentsAccountantParameters:(uint64_t)a7 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B96E5000, a2, a3, "Moments accountant parameter '%@' is malformed.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
