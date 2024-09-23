@implementation _DPRandomizerUtils

+ (BOOL)containValidDPParametersIn:(id)a3 maxCentralEpsilon:(double)a4 maxCentralDelta:(double)a5
{
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  long double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  int v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  signed int v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  _DPRenyiDP *v93;
  NSObject *v94;
  void *v95;
  NSObject *v96;
  _DPApproximateDP *v97;
  NSObject *v98;
  char isKindOfClass;
  NSObject *v100;
  NSObject *v101;
  id v102;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AlgorithmParameters"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.22();
    goto LABEL_31;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Mechanism"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_22:
    +[_DPLog framework](_DPLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.21(v34, v42, v43, v44, v45, v46, v47, v48);
    goto LABEL_31;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Mechanism"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("GaussianFromSigma"));

  if ((v10 & 1) == 0)
    goto LABEL_22;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OverallEpsilon"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_28:

LABEL_29:
    +[_DPLog framework](_DPLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.20();
    goto LABEL_31;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OverallDelta"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ClippingBound"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_26:

    goto LABEL_27;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OverallClippingBound"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_25;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_29;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OverallEpsilon"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OverallDelta"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SigmaAfterNormalizing"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NumChunks"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "intValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ClippingBound"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  v30 = v29;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OverallClippingBound"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  v33 = v32;

  if (v19 <= 0.0 || v22 <= 0.0 || v25 <= 0.0 || v30 <= 0.0 || v33 <= 0.0 || v27 <= 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.1();
    goto LABEL_31;
  }
  if (v25 < 0.5)
  {
    +[_DPLog framework](_DPLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.2(v34, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_31;
  }
  if (v19 > a4)
  {
    +[_DPLog framework](_DPLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.3();
    goto LABEL_31;
  }
  if (v22 > a5)
  {
    +[_DPLog framework](_DPLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.4();
    goto LABEL_31;
  }
  if (v27 >= 2)
  {
    if (v30 > v33)
    {
      +[_DPLog framework](_DPLog, "framework");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.5();
      goto LABEL_31;
    }
    v25 = v25 * v30 / v33;
    if (fabs(v25) == INFINITY || v25 < 0.5)
    {
      +[_DPLog framework](_DPLog, "framework");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.6(v34, v25, v68, v69);
      goto LABEL_31;
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CurrentCohortSize"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51
    || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MaxCohortSize")),
        (v51 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PopulationSize")),
        (v51 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RenyiOrder")),
        (v51 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NumIterations"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v70)
    {
      if (v22 + 0.000000238418579 >= _DPGaussianMechanismMinimumDelta(v19, v25, 1.0))
      {
        v49 = 1;
        goto LABEL_33;
      }
      +[_DPLog framework](_DPLog, "framework");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.7(v34, v71, v72, v73, v74, v75, v76, v77);
      goto LABEL_31;
    }
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CurrentCohortSize"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_70;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MaxCohortSize"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_69:

LABEL_70:
LABEL_71:
    +[_DPLog framework](_DPLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.19();
    goto LABEL_31;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PopulationSize"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_68:

    goto LABEL_69;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_68;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v57 = objc_opt_isKindOfClass();

  if ((v57 & 1) == 0)
    goto LABEL_71;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CurrentCohortSize"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "longLongValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MaxCohortSize"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "longLongValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PopulationSize"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "longLongValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NumIterations"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "longLongValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RenyiOrder"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "intValue");

  if (v65 < 1 || v59 < 1 || v61 < 1 || v63 <= 0)
  {
    +[_DPLog framework](_DPLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.8();
  }
  else if (v59 <= (unint64_t)v61)
  {
    if (v61 <= (unint64_t)v63)
    {
      if (fabs(v25) == INFINITY || v25 < 0.5)
      {
        +[_DPLog framework](_DPLog, "framework");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.11(v34, v78, v79, v80, v81, v82, v83, v84);
      }
      else if ((v67 - 33) > 0xFFFFFFE0)
      {
        if ((unint64_t)v63 < 0x53724E01)
        {
          if ((unint64_t)v65 > 9)
          {
            _DPMomentsAccountantSubSampledRenyiEpsilon(v67, (double)v61 / (double)v63, v25);
            v102 = 0;
            v93 = -[_DPRenyiDP initWithAlpha:tau:error:]([_DPRenyiDP alloc], "initWithAlpha:tau:error:", &v102, (double)v67, v92 * (double)v65);
            v94 = v102;
            v34 = v94;
            if (v93)
            {
              v101 = v94;
              -[_DPRenyiDP approximateDPForDelta:error:](v93, "approximateDPForDelta:error:", &v101, v22);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = v101;

              if (v95)
              {
                v100 = v96;
                v97 = -[_DPApproximateDP initWithEpsilon:delta:error:]([_DPApproximateDP alloc], "initWithEpsilon:delta:error:", &v100, (double)v19, v22);
                v34 = v100;

                if (v97)
                {
                  if (!objc_msgSend(v95, "exceed:", v97))
                  {

                    v49 = 1;
                    goto LABEL_32;
                  }
                  +[_DPLog framework](_DPLog, "framework");
                  v98 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                    +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.18();
                }
                else
                {
                  +[_DPLog framework](_DPLog, "framework");
                  v98 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                    +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.17();
                }

              }
              else
              {
                +[_DPLog framework](_DPLog, "framework");
                v97 = (_DPApproximateDP *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v97->super, OS_LOG_TYPE_ERROR))
                  +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.16();
                v34 = v96;
              }

            }
            else
            {
              +[_DPLog framework](_DPLog, "framework");
              v93 = (_DPRenyiDP *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v93->super, OS_LOG_TYPE_ERROR))
                +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.15();
            }

          }
          else
          {
            +[_DPLog framework](_DPLog, "framework");
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.14(v34);
          }
        }
        else
        {
          +[_DPLog framework](_DPLog, "framework");
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.13(v34, v85, v86, v87, v88, v89, v90, v91);
        }
      }
      else
      {
        +[_DPLog framework](_DPLog, "framework");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.12(v34);
      }
    }
    else
    {
      +[_DPLog framework](_DPLog, "framework");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.10();
    }
  }
  else
  {
    +[_DPLog framework](_DPLog, "framework");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      +[_DPRandomizerUtils containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:].cold.9();
  }
LABEL_31:
  v49 = 0;
LABEL_32:

LABEL_33:
  return v49;
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Invalid algorithm parameters values from donation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)containValidDPParametersIn:(uint64_t)a3 maxCentralEpsilon:(uint64_t)a4 maxCentralDelta:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Sigma from donation is less than %lf.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v0, v1, "Epsilon=%f from donation is more than allowed=%f.", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v0, v1, "Delta=%f from donation is more than allowed=%f.", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Chunking is used, but clipping bound is more than overall clipping bound.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)containValidDPParametersIn:(uint64_t)a3 maxCentralEpsilon:(uint64_t)a4 maxCentralDelta:.cold.6(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = 0x3FE0000000000000;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a1, a4, "Chunking is used, but calculated overallSigma %lf is not a positive finite number not less than %lf.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:(uint64_t)a3 maxCentralEpsilon:(uint64_t)a4 maxCentralDelta:(uint64_t)a5 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Sigma from donation %f is not within (overallEpsilon, overallDelta) for PrioPlusPlusAlgorithm.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Invalid moments accountant parameters values from donation; NumIterations, PopulationSize, MaxCohortSize and Current"
    "CohortSize size must be positive integers.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Invalid moments accountant parameters values from donation; CurrentCohortSize is greater than MaxCohortSize.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Invalid moments accountant parameters values from donation; MaxCohortSize is greater than PopulationSize.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)containValidDPParametersIn:(uint64_t)a3 maxCentralEpsilon:(uint64_t)a4 maxCentralDelta:(uint64_t)a5 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Invalid moments accountant parameters values from donation; SigmaAfterNormalizing must be a positive finite number n"
    "ot less than %lf.",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:(os_log_t)log maxCentralEpsilon:maxCentralDelta:.cold.12(os_log_t log)
{
  _DWORD v1[2];
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109376;
  v1[1] = 2;
  v2 = 1024;
  v3 = 32;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "Invalid moments accountant parameters values from donation; RenyiOrder must be between %d and %d.",
    (uint8_t *)v1,
    0xEu);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:(uint64_t)a3 maxCentralEpsilon:(uint64_t)a4 maxCentralDelta:(uint64_t)a5 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Invalid moments accountant parameters values from donation; PopulationSize cannot be greater than %lld.",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:(os_log_t)log maxCentralEpsilon:maxCentralDelta:.cold.14(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 10;
  _os_log_error_impl(&dword_1D3FAA000, log, OS_LOG_TYPE_ERROR, "Invalid moments accountant parameters values from donation; NumIterations cannot be less than %d.",
    (uint8_t *)v1,
    8u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Failed to analyze the Renyi-DP for subsampled moments accountant, error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Failed to convert Renyi-DP to approximate-DP for subsampled moments accountant, error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Failed to initialize target approximate-DP for subsampled moments accountant, error=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.18()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, v1, (uint64_t)v1, "Invalid moments accountant parameters values from donation; the calculated approximate-DP %@ is greater than the tar"
    "get approximate-DP %@.",
    v2);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.19()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Malformed moments accountant algorithm parameters from donation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1D3FAA000, v0, v1, "Malformed algorithm parameters from donation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)containValidDPParametersIn:(uint64_t)a3 maxCentralEpsilon:(uint64_t)a4 maxCentralDelta:(uint64_t)a5 .cold.21(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, a1, a3, "Only %@ mechanism is supported.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)containValidDPParametersIn:maxCentralEpsilon:maxCentralDelta:.cold.22()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1D3FAA000, v0, v1, "Malformed metadata entry %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
