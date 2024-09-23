@implementation _ATXScoreInterpreter

- (NSSet)subscoreNames
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[NSDictionary allKeys](self->_bytecode, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  return (NSSet *)v5;
}

- (_ATXScoreInterpreter)initWithParseRoot:(id)a3
{
  id v4;
  _ATXScoreInterpreter *v5;
  uint64_t v6;
  NSMutableArray *bytecodeDependencies;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ATXScoreInterpreter;
  v5 = -[_ATXScoreInterpreter init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    bytecodeDependencies = v5->_bytecodeDependencies;
    v5->_bytecodeDependencies = (NSMutableArray *)v6;

    -[_ATXScoreInterpreter _compileBytecode:]((uint64_t)v5, v4);
  }

  return v5;
}

- (void)_compileBytecode:(uint64_t)a1
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  if (a1)
  {
    v3 = (objc_class *)MEMORY[0x1E0C99E08];
    v4 = a2;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41___ATXScoreInterpreter__compileBytecode___block_invoke;
    v9[3] = &unk_1E82DD130;
    v9[4] = a1;
    v6 = v5;
    v10 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

    v7 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = v6;
    v8 = v6;

  }
}

+ (uint64_t)operatorFromFunctionName:(uint64_t)a1
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(&unk_1E83D08D8, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = -1;

  return v4;
}

+ (void)_expectedArity:(uint64_t)a1
{
  NSObject *v3;

  objc_opt_self();
  if ((unint64_t)(a2 + 1) >= 0x14)
  {
    __atxlog_handle_default();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[_ATXScoreInterpreter _expectedArity:].cold.1();

    __break(1u);
  }
}

- (void)_runOperator:(unint64_t)a3 arity:(void *)a4 context:
{
  _QWORD *v7;
  _QWORD *v8;
  char v9;
  double i;
  double v11;
  char v12;
  double v13;
  int v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  int v19;
  _QWORD *v20;
  long double v21;
  long double v22;
  NSObject *v23;
  int v24;
  double *v25;
  double v26;
  double v27;
  int v28;
  long double v29;
  NSObject *v30;
  int v31;
  _QWORD *v32;
  long double v33;
  long double v34;
  int v35;
  double *v36;
  double v37;
  double v38;
  double v39;
  NSObject *v40;
  int v41;
  double *v42;
  long double v43;
  long double v44;
  NSObject *v45;
  int v46;
  double *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  int v52;
  double *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  NSObject *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  BOOL v65;
  double v66;
  int v67;
  void *v68;
  int v69;
  void *v70;
  unint64_t v71;
  double v72;
  int v73;
  double v74;
  uint64_t v75;
  double v76;
  void *v77;
  void *v78;
  double v79;
  int v80;
  double *v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  uint64_t v97;
  void *v98;
  double v99;
  NSObject *v100;
  NSObject *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  NSObject *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  uint8_t buf[4];
  double v136;
  __int16 v137;
  double v138;
  __int16 v139;
  double v140;
  __int16 v141;
  double v142;
  __int16 v143;
  double v144;
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (a1)
  {
    switch(a2)
    {
      case 0:
        shouldReturnUndefined(v7, a3);
        if ((v9 & 1) != 0)
          goto LABEL_93;
        for (i = 0.0; a3; --a3)
        {
          pop(v8);
          i = i + v11;
        }
        goto LABEL_84;
      case 1:
        shouldReturnUndefined(v7, a3);
        if ((v12 & 1) != 0)
          goto LABEL_93;
        for (i = 1.0; a3; --a3)
        {
          pop(v8);
          i = i * v13;
        }
        goto LABEL_84;
      case 2:
        shouldReturnUndefined(v7, 2uLL);
        if (v14)
          goto LABEL_93;
        v15 = (double *)&v8[v8[1] - a3];
        v16 = v15[2];
        v17 = v15[3];
        drop(v8, a3);
        v18 = 0.0;
        if (v16 >= v17)
          v18 = 1.0;
        goto LABEL_95;
      case 3:
        shouldReturnUndefined(v7, 2uLL);
        if (v19)
          goto LABEL_93;
        v20 = &v8[v8[1] - a3];
        v22 = *((double *)v20 + 2);
        v21 = *((double *)v20 + 3);
        drop(v8, a3);
        if (v22 <= 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "handleFailureInFunction:file:lineNumber:description:", v104, CFSTR("_ATXScoreInterpreter.m"), 407, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value > 0"));

        }
        if (v21 <= 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "handleFailureInFunction:file:lineNumber:description:", v106, CFSTR("_ATXScoreInterpreter.m"), 408, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("base > 0"));

        }
        if (v22 <= 0.0)
        {
          __atxlog_handle_default();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[_ATXScoreInterpreter _runOperator:arity:context:].cold.3();
        }
        else
        {
          if (v21 > 0.0)
            goto LABEL_107;
          __atxlog_handle_default();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[_ATXScoreInterpreter _runOperator:arity:context:].cold.2();
        }

LABEL_107:
        v49 = log10(v22);
        v51 = log10(v21);
LABEL_108:
        v18 = v49 / v51;
        goto LABEL_95;
      case 4:
        shouldReturnUndefined(v7, 2uLL);
        if (v24)
          goto LABEL_93;
        v25 = (double *)&v8[v8[1] - a3];
        v26 = v25[2];
        v27 = v25[3];
        drop(v8, a3);
        if (v27 != 0.0)
        {
          v18 = v26 / v27;
          goto LABEL_95;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "handleFailureInFunction:file:lineNumber:description:", v108, CFSTR("_ATXScoreInterpreter.m"), 427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("denominator != 0"));

        __atxlog_handle_default();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[_ATXScoreInterpreter _runOperator:arity:context:].cold.4();
        goto LABEL_133;
      case 5:
        shouldReturnUndefined(v7, 1uLL);
        if (v28)
          goto LABEL_93;
        v29 = *(double *)&v8[v8[1] - a3 + 2];
        drop(v8, a3);
        if (v29 <= 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "handleFailureInFunction:file:lineNumber:description:", v110, CFSTR("_ATXScoreInterpreter.m"), 438, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value > 0"));

          __atxlog_handle_default();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[_ATXScoreInterpreter _runOperator:arity:context:].cold.5();

        }
        v18 = log(v29);
        goto LABEL_95;
      case 6:
        shouldReturnUndefined(v7, 2uLL);
        if (v31)
          goto LABEL_93;
        v32 = &v8[v8[1] - a3];
        v33 = *((double *)v32 + 2);
        v34 = *((double *)v32 + 3);
        drop(v8, a3);
        if (v33 <= 0.0 && (v33 != 0.0 || v34 <= 0.0) && v34 != (double)(int)v34)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v125, "handleFailureInFunction:file:lineNumber:description:", v126, CFSTR("_ATXScoreInterpreter.m"), 450, CFSTR("Attempted to compute pow(%f, %f)"), *(_QWORD *)&v33, *(_QWORD *)&v34);

          __atxlog_handle_default();
          v127 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
            -[_ATXScoreInterpreter _runOperator:arity:context:].cold.6();

        }
        v18 = pow(v33, v34);
        goto LABEL_95;
      case 8:
        shouldReturnUndefined(v7, 3uLL);
        if (v35)
          goto LABEL_93;
        v36 = (double *)&v8[v8[1] - a3];
        v38 = v36[2];
        v37 = v36[3];
        v39 = v36[4];
        drop(v8, a3);
        if (v38 < 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "handleFailureInFunction:file:lineNumber:description:", v112, CFSTR("_ATXScoreInterpreter.m"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("age >= 0"));

        }
        if (v37 <= 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "handleFailureInFunction:file:lineNumber:description:", v114, CFSTR("_ATXScoreInterpreter.m"), 466, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("halflife > 0"));

        }
        if (v38 < 0.0)
        {
          __atxlog_handle_default();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            -[_ATXScoreInterpreter _runOperator:arity:context:].cold.7();

          goto LABEL_110;
        }
        if (v37 > 0.0)
        {
LABEL_110:
          v84 = exp(v38 * (-0.693147181 / v37));
          goto LABEL_130;
        }
        __atxlog_handle_default();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[_ATXScoreInterpreter _runOperator:arity:context:].cold.8();
LABEL_133:

LABEL_94:
        v18 = -31337.0;
LABEL_95:
        v68 = v8;
LABEL_96:
        push(v68, v18);
        break;
      case 9:
        shouldReturnUndefined(v7, 3uLL);
        if (v41)
          goto LABEL_93;
        v42 = (double *)&v8[v8[1] - a3];
        v43 = v42[2];
        v39 = v42[3];
        v44 = v42[4];
        drop(v8, a3);
        if (v44 == 1.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "handleFailureInFunction:file:lineNumber:description:", v116, CFSTR("_ATXScoreInterpreter.m"), 481, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ratio != 1"));

        }
        if (v44 < 0.0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "handleFailureInFunction:file:lineNumber:description:", v118, CFSTR("_ATXScoreInterpreter.m"), 482, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ratio >= 0"));

        }
        if (v44 == 1.0)
        {
          __atxlog_handle_default();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            -[_ATXScoreInterpreter _runOperator:arity:context:].cold.9();
          goto LABEL_133;
        }
        if (v44 < 0.0 && v43 != (double)(int)v43)
        {
          __atxlog_handle_default();
          v100 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
            -[_ATXScoreInterpreter _runOperator:arity:context:].cold.10();

        }
        v84 = (1.0 - pow(v44, v43)) / (1.0 - v44);
LABEL_130:
        v18 = v39 * v84;
        goto LABEL_95;
      case 10:
        shouldReturnUndefined(v7, 3uLL);
        if (v46)
          goto LABEL_93;
        v47 = (double *)&v8[v8[1] - a3];
        v48 = v47[2];
        v49 = v47[3];
        v50 = v47[4];
        drop(v8, a3);
        v51 = exp(-(v50 * v48)) + 1.0;
        goto LABEL_108;
      case 12:
        shouldReturnUndefined(v7, 4uLL);
        if (v52)
          goto LABEL_93;
        v53 = (double *)&v8[v8[1] - a3];
        v55 = v53[2];
        v54 = v53[3];
        v57 = v53[4];
        v56 = v53[5];
        drop(v8, a3);
        if (v54 > v56)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "handleFailureInFunction:file:lineNumber:description:", v120, CFSTR("_ATXScoreInterpreter.m"), 515, CFSTR("ClampToRange: minVal (%f) must be <= defaultVal (%f) "), *(_QWORD *)&v54, *(_QWORD *)&v56);

        }
        if (v56 > v57)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "handleFailureInFunction:file:lineNumber:description:", v122, CFSTR("_ATXScoreInterpreter.m"), 516, CFSTR("ClampToRange: defaultVal (%f) must be <= maxVal (%f) "), *(_QWORD *)&v56, *(_QWORD *)&v57);

        }
        v58 = v55;
        if (v55 < v54)
          v58 = v54;
        if (v58 >= v57)
          i = v57;
        else
          i = v58;
        if (i != v55)
        {
          __atxlog_handle_default();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134219008;
            v136 = v55;
            v137 = 2048;
            v138 = v54;
            v139 = 2048;
            v140 = v57;
            v141 = 2048;
            v142 = v56;
            v143 = 2048;
            v144 = i;
            _os_log_debug_impl(&dword_1C9A3B000, v59, OS_LOG_TYPE_DEBUG, "ClampToRange(input=%f, min=%f, max=%f, default=%f): input coerced to %f", buf, 0x34u);
          }

        }
        goto LABEL_84;
      case 13:
        pop(v7);
        v61 = v60;
        pop(v8);
        v63 = fabs(v61);
        v65 = v61 == -31337.0 || v63 == INFINITY;
        v66 = 1.0;
        if (!v65)
          v66 = v61;
        if (v62 >= 0.0)
          v18 = v62 * v66;
        else
          v18 = v62 / fmax(v66, 0.0000001);
        goto LABEL_95;
      case 14:
        shouldReturnUndefined(v7, a3);
        if (v67)
          goto LABEL_93;
        i = *(double *)&v8[v8[1] - a3 + 3 + (unint64_t)*(double *)&v8[v8[1] - a3 + 2]];
        drop(v8, a3);
LABEL_84:
        v68 = v8;
        v18 = i;
        goto LABEL_96;
      case 15:
        shouldReturnUndefined(v7, a3);
        if (v69)
          goto LABEL_93;
        objc_msgSend(*(id *)(a1 + 16), "objectAtIndexedSubscript:", (unint64_t)*(double *)&v8[v8[1] - a3 + 2]);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = (unint64_t)((double)(unint64_t)v8[1] - (double)(a3 - 1));
        drop(v8, a3);
        objc_msgSend(v70, "predict:", &v8[v71 + 2]);
        push(v8, v72);
        goto LABEL_142;
      case 16:
        shouldReturnUndefined(v7, a3);
        if (v73)
          goto LABEL_93;
        objc_msgSend(*(id *)(a1 + 16), "objectAtIndexedSubscript:", (unint64_t)*(double *)&v8[v8[1] - a3 + 2]);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v70, "hasOutputIndexedSubscript"))
        {
          pop(v8);
          v75 = (uint64_t)v74;
        }
        else
        {
          v75 = -1;
        }
        v129 = v75;
        v85 = (void *)objc_opt_new();
        v86 = objc_msgSend(v70, "numberOfFeatures");
        if (!v86)
          goto LABEL_123;
        v87 = v86;
        v88 = 0;
        v130 = v70;
        v131 = v85;
        while (2)
        {
          objc_msgSend(v70, "featureAtIndex:", v87 + ~v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "featureName");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v89, "featureType") == 2)
          {
            pop(v8);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_122;
          }
          if (objc_msgSend(v89, "featureType") == 5)
          {
            v132 = v90;
            v92 = objc_msgSend(v89, "multiArraySize");
            v93 = objc_alloc(MEMORY[0x1E0C9E970]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v92);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = v94;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = 0;
            v91 = (void *)objc_msgSend(v93, "initWithShape:dataType:error:", v95, 65600, &v133);
            v96 = v133;

            if (!v96)
            {
              if (v92)
              {
                v97 = v92 - 1;
                do
                {
                  pop(v8);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v91, "setObject:atIndexedSubscript:", v98, v97);

                  --v97;
                }
                while (v97 != -1);
              }
              v70 = v130;
              v85 = v131;
              v90 = v132;
LABEL_122:
              objc_msgSend(v85, "setObject:forKeyedSubscript:", v91, v90);

              if (++v88 == v87)
              {
LABEL_123:
                drop(v8, 1uLL);
                objc_msgSend(v70, "predictionForEvaluatedFeatures:withOutputIndexedSubscript:", v85, v129);
                push(v8, v99);
                goto LABEL_141;
              }
              continue;
            }
            __atxlog_handle_default();
            v102 = objc_claimAutoreleasedReturnValue();
            v90 = v132;
            if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              -[_ATXScoreInterpreter _runOperator:arity:context:].cold.11();

            push(v8, -31337.0);
            v70 = v130;
            v85 = v131;
          }
          else
          {
            __atxlog_handle_default();
            v101 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
              -[_ATXScoreInterpreter _runOperator:arity:context:].cold.12();

            push(v8, -31337.0);
          }
          break;
        }

LABEL_141:
LABEL_142:

        break;
      case 17:
        pop(v7);
        objc_msgSend(*(id *)(a1 + 16), "objectAtIndexedSubscript:", (unint64_t)v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v77;
        if (v8[504])
          v79 = (double)objc_msgSend(v77, "containsObject:");
        else
          v79 = 0.0;
        push(v8, v79);

        break;
      case 18:
        shouldReturnUndefined(v7, 2uLL);
        if (v80)
        {
LABEL_93:
          drop(v8, a3);
          goto LABEL_94;
        }
        v81 = (double *)&v8[v8[1] - a3];
        v82 = v81[2];
        v83 = v81[3];
        drop(v8, a3);
        if (v82 > v83)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _runOperator:arity:context:]");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "handleFailureInFunction:file:lineNumber:description:", v124, CFSTR("_ATXScoreInterpreter.m"), 631, CFSTR("RandomUniform: start (%f) must be <= end (%f) "), *(_QWORD *)&v82, *(_QWORD *)&v83);

        }
        v18 = v82 + (v83 - v82) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0);
        goto LABEL_95;
      default:
        __atxlog_handle_default();
        v128 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          -[_ATXScoreInterpreter _runOperator:arity:context:].cold.1();

        __break(1u);
        return;
    }
  }

}

- (void)_runBytecode:(void *)a3 context:
{
  id v5;
  id *v6;
  id v7;
  double *v8;
  uint64_t v9;
  double *v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  double v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int v18;
  double v19;
  void *v20;
  double v21;
  unint64_t v22;
  double *v23;
  unint64_t v24;
  double v25;
  NSObject *v26;
  unint64_t v27;
  uint8_t buf[4];
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_retainAutorelease(v5);
    v8 = (double *)objc_msgSend(v7, "bytes");
    v9 = objc_msgSend(v7, "length");
    if (v9 >= 1)
    {
      v10 = (double *)((char *)v8 + v9);
      v11 = (double *)((char *)v8 + 1);
      v12 = 2;
      while (1)
      {
        v13 = *(unsigned __int8 *)v8;
        switch(*(_BYTE *)v8)
        {
          case 0xFC:
            if (v12 != 2)
              -[_ATXScoreInterpreter _runBytecode:context:].cold.1();
            v12 = 4;
            goto LABEL_41;
          case 0xFD:
            pop(v6);
            if (v15 != -31337.0)
            {
              v16 = (*(_QWORD *)&v15 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
              v17 = ((*(_QWORD *)&v15 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
              if (v15 >= 0.0)
              {
                v17 = 0;
                v16 = 0;
              }
              if ((*(_QWORD *)&v15 & 0x7FFFFFFFFFFFFFFFLL) == 0)
                v16 = 1;
              v18 = (*(_QWORD *)&v15 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v16;
              if ((*(_QWORD *)&v15 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000)
                v18 = 1;
              if (((v18 | v17) & 1) == 0)
                goto LABEL_37;
            }
            goto LABEL_26;
          case 0xFE:
            pop(v6);
            if (v19 == -31337.0 || fabs(v19) == INFINITY)
            {
LABEL_37:
              v14 = (double *)((char *)v11 + v12);
              if ((double *)((char *)v11 + v12) > v10)
                goto LABEL_48;
              __memcpy_chk();
LABEL_39:
              v12 = 2;
LABEL_40:
              v11 = v14;
            }
            else
            {
              push(v6, v19);
LABEL_26:
              if ((double *)((char *)v11 + v12) > v10)
                goto LABEL_48;
              __memcpy_chk();
              v11 = (double *)((char *)v11 + v12);
              if (v11 >= v10)
                goto LABEL_48;
              v12 = 2;
            }
LABEL_41:
            v8 = v11;
            v11 = (double *)((char *)v11 + 1);
            if (v11 > v10)
              goto LABEL_48;
            break;
          case 0xFF:
            goto LABEL_26;
          default:
            if ((_DWORD)v13 == 201)
            {
              v14 = (double *)((char *)v11 + v12);
              if ((double *)((char *)v11 + v12) > v10)
                goto LABEL_48;
              __memcpy_chk();
              objc_msgSend(*(id *)(a1 + 16), "objectAtIndexedSubscript:", 0);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              buf[0] = 0;
              objc_msgSend(v6[502], "scoreForKey:found:", v20, buf);
              if (!buf[0])
              {
                objc_msgSend(v6[503], "scoreForKey:found:", v20, buf);
                if (!buf[0])
                  v21 = -[_ATXScoreInterpreter _evalVariable:withCtx:](a1, v20, v6);
              }
              push(v6, v21);

              goto LABEL_39;
            }
            if ((_DWORD)v13 == 202)
            {
              v14 = (double *)((char *)v8 + 9);
              if (v14 > v10)
                goto LABEL_48;
              push(v6, *v11);
              goto LABEL_40;
            }
            +[_ATXScoreInterpreter _expectedArity:]((uint64_t)_ATXScoreInterpreter, *(unsigned __int8 *)v8);
            if (v22 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v23 = (double *)((char *)v11 + v12);
              if ((double *)((char *)v11 + v12) > v10)
                goto LABEL_48;
              __memcpy_chk();
              v24 = 0;
              v12 = 2;
              v11 = v23;
            }
            else
            {
              v24 = v22;
            }
            v25 = (double)(unint64_t)v6[1];
            -[_ATXScoreInterpreter _runOperator:arity:context:](a1, v13, v24, v6);
            if ((double)(unint64_t)v6[1] > v25)
            {
              __atxlog_handle_default();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              {
                v27 = (unint64_t)((double)(unint64_t)v6[1] - v25);
                *(_DWORD *)buf = 134217984;
                v29 = v27;
                _os_log_fault_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_FAULT, "Stack size after op > old stack size! This is an issue. Diff = %lu", buf, 0xCu);
              }

            }
            goto LABEL_41;
        }
      }
    }
  }
LABEL_48:

}

- (double)_evalVariable:(void *)a3 withCtx:
{
  id v5;
  id *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  void *v20;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _evalVariable:withCtx:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("_ATXScoreInterpreter.m"), 1040, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("varName"));

    }
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ATXScoreInterpreter _runBytecode:context:](a1, v7, v6);

    pop(v6);
    v9 = v8;
    v10 = fabs(v8);
    if (v10 >= INFINITY && v10 <= INFINITY)
    {
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[_ATXScoreInterpreter _evalVariable:withCtx:].cold.1((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);

    }
    objc_msgSend(v6[503], "setScore:forKey:", v5, v9);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (id)_compileToBytecode:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  uint64_t v10;
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
  _ATXNeuralNetwork *v24;
  void *v25;
  _ATXNeuralNetwork *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD);
  _ATXScoreInterpreterCoreMLModel *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (**v40)(_QWORD);
  unint64_t i;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void (**v54)(_QWORD);
  uint64_t v55;
  char v56;
  _QWORD aBlock[6];
  _QWORD v58[5];
  id v59;
  _QWORD v60[6];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;

  v3 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_39;
  }
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, 202, 0, v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_ATXScoreInterpreter retainBytecodeDependencyObject:](a1, (uint64_t)v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, 201, v7, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_38;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v3, "count") != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[_ATXScoreInterpreter _compileToBytecode:]");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("_ATXScoreInterpreter.m"), 810, CFSTR("Dictionary must be of size 1, not %lu"), objc_msgSend(v3, "count"));

      }
      v67 = 0;
      v68 = &v67;
      v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__13;
      v71 = __Block_byref_object_dispose__13;
      v72 = 0;
      v61 = 0;
      v62 = &v61;
      v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__13;
      v65 = __Block_byref_object_dispose__13;
      v66 = 0;
      v8 = MEMORY[0x1E0C809B0];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __43___ATXScoreInterpreter__compileToBytecode___block_invoke;
      v60[3] = &unk_1E82DD0E0;
      v60[4] = &v67;
      v60[5] = &v61;
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v60);
      v58[0] = 0;
      v58[1] = v58;
      v58[2] = 0x3032000000;
      v58[3] = __Block_byref_object_copy__13;
      v58[4] = __Block_byref_object_dispose__13;
      v59 = 0;
      aBlock[0] = v8;
      aBlock[1] = 3221225472;
      aBlock[2] = __43___ATXScoreInterpreter__compileToBytecode___block_invoke_2;
      aBlock[3] = &unk_1E82DD108;
      aBlock[4] = v58;
      aBlock[5] = &v61;
      v9 = (void (**)(_QWORD))_Block_copy(aBlock);
      v10 = +[_ATXScoreInterpreter operatorFromFunctionName:]((uint64_t)_ATXScoreInterpreter, (void *)v68[5]);
      switch(v10)
      {
        case 7:
          if (objc_msgSend((id)v62[5], "count") != 3)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_, a1, CFSTR("_ATXScoreInterpreter.m"), 834, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("argArray.count == 3"));

          }
          objc_msgSend((id)v62[5], "objectAtIndexedSubscript:", 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ATXScoreInterpreter _compileToBytecode:](a1, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)v62[5], "objectAtIndexedSubscript:", 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ATXScoreInterpreter _compileToBytecode:](a1, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, 255, v15, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v9;

          objc_msgSend((id)v62[5], "objectAtIndexedSubscript:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ATXScoreInterpreter _compileToBytecode:](a1, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "length") + objc_msgSend(v12, "length"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, 253, v19, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = (void *)objc_msgSend(v18, "mutableCopy");
          objc_msgSend(v6, "appendData:", v20);
          objc_msgSend(v6, "appendData:", v12);
          objc_msgSend(v6, "appendData:", v16);
          objc_msgSend(v6, "appendData:", v14);

          v9 = v54;
          goto LABEL_18;
        case 11:
          if (objc_msgSend((id)v62[5], "count") != 2)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_, a1, CFSTR("_ATXScoreInterpreter.m"), 862, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("argArray.count == 2"));

          }
          objc_msgSend((id)v62[5], "objectAtIndexedSubscript:", 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ATXScoreInterpreter _compileToBytecode:](a1, v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "length"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, 254, v22, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)v62[5], "objectAtIndexedSubscript:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ATXScoreInterpreter _compileToBytecode:](a1, v23);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = (void *)objc_msgSend(v16, "mutableCopy");
          objc_msgSend(v6, "appendData:", v14);
          objc_msgSend(v6, "appendData:", v12);
LABEL_18:

          goto LABEL_37;
        case 15:
          if ((unint64_t)objc_msgSend((id)v62[5], "count") <= 1)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_, a1, CFSTR("_ATXScoreInterpreter.m"), 890, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("argArray.count >= 2"));

          }
          v24 = [_ATXNeuralNetwork alloc];
          objc_msgSend((id)v62[5], "objectAtIndexedSubscript:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[_ATXNeuralNetwork initWithData:](v24, "initWithData:", v25);

          -[_ATXScoreInterpreter retainBytecodeDependencyObject:](a1, (uint64_t)v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:atIndexedSubscript:", v27, 0);
          goto LABEL_26;
        case 16:
          objc_msgSend((id)v62[5], "objectAtIndexedSubscript:", 0);
          v26 = (_ATXNeuralNetwork *)objc_claimAutoreleasedReturnValue();
          v55 = v10;
          objc_msgSend((id)v62[5], "objectAtIndexedSubscript:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v9;
          objc_msgSend((id)v62[5], "objectAtIndexedSubscript:", 2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[_ATXScoreInterpreterCoreMLModel initWithModelName:features:outputSpecification:]([_ATXScoreInterpreterCoreMLModel alloc], "initWithModelName:features:outputSpecification:", v26, v27, v28);
          -[_ATXScoreInterpreterCoreMLModel getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures:outputSpecification:](v30, "getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures:outputSpecification:", v27, v28);
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)v62[5];
          v62[5] = v31;

          v29[2](v29);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[_ATXScoreInterpreter retainBytecodeDependencyObject:](a1, (uint64_t)v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "insertObject:atIndex:", v34, 0);

          v9 = v29;
          v10 = v55;
          goto LABEL_26;
        case 17:
          if ((unint64_t)objc_msgSend((id)v62[5], "count") <= 1)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_, a1, CFSTR("_ATXScoreInterpreter.m"), 880, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("argArray.count >= 2"));

          }
          v35 = objc_alloc(MEMORY[0x1E0C99E60]);
          v26 = (_ATXNeuralNetwork *)objc_msgSend(v35, "initWithArray:", v62[5]);
          v36 = (void *)MEMORY[0x1E0C99D20];
          -[_ATXScoreInterpreter retainBytecodeDependencyObject:](a1, (uint64_t)v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "arrayWithObject:", v27);
          v37 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v62[5];
          v62[5] = v37;
LABEL_26:

          break;
        default:
          break;
      }
      +[_ATXScoreInterpreter _expectedArity:]((uint64_t)_ATXScoreInterpreter, v10);
      v39 = v38;
      if (v38 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend((id)v62[5], "count") != v38)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", sel__compileToBytecode_, a1, CFSTR("_ATXScoreInterpreter.m"), 922, CFSTR("expected argArray.count (%tu) == expected count (%tu) for operator %hu"), objc_msgSend((id)v62[5], "count"), v39, v10);

      }
      v56 = v10;
      v40 = v9;
      v6 = (void *)objc_opt_new();
      for (i = 0; i < objc_msgSend((id)v62[5], "count"); ++i)
      {
        v42 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend((id)v62[5], "objectAtIndexedSubscript:", i);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[_ATXScoreInterpreter _compileToBytecode:](a1, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendData:", v44);

        objc_autoreleasePoolPop(v42);
      }
      if (v39 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = v40;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)v62[5], "count"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, v56, v45, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]((uint64_t)_ATXScoreInterpreter, v56, 0, 0);
        v9 = v40;
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "appendData:", v12);
LABEL_37:

      _Block_object_dispose(v58, 8);
      _Block_object_dispose(&v61, 8);

      _Block_object_dispose(&v67, 8);
      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_38:
  objc_autoreleasePoolPop(v4);
LABEL_39:

  return v6;
}

+ (id)_bytecodeInstructionForOp:(void *)a3 unsignedIntegerArgument:(void *)a4 doubleArgument:
{
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  id v9;
  char *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v6 = a3;
  v7 = a4;
  objc_opt_self();
  v8 = v6 != 0;
  if (v7)
    ++v8;
  if (v8 >= 2)
    +[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:].cold.1();
  if (v6 | v7)
  {
    if (v6)
    {
      v12 = objc_msgSend((id)v6, "unsignedIntValue");
      if (HIWORD(v12))
      {
        v17 = -4;
        LOBYTE(v18) = a2;
        *(_DWORD *)((char *)&v18 + 1) = v12;
        v9 = objc_alloc(MEMORY[0x1E0C99D50]);
        v10 = &v17;
        v11 = 6;
      }
      else
      {
        v17 = a2;
        LOWORD(v18) = v12;
        v9 = objc_alloc(MEMORY[0x1E0C99D50]);
        v10 = &v17;
        v11 = 3;
      }
    }
    else
    {
      v17 = a2;
      objc_msgSend((id)v7, "doubleValue");
      v18 = v13;
      v9 = objc_alloc(MEMORY[0x1E0C99D50]);
      v10 = &v17;
      v11 = 9;
    }
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D50]);
    v10 = &v16;
    v11 = 1;
  }
  v14 = (void *)objc_msgSend(v9, "initWithBytes:length:", v10, v11);

  return v14;
}

- (id)retainBytecodeDependencyObject:(id *)a1
{
  id *v2;

  if (a1)
  {
    v2 = a1;
    objc_msgSend(a1[2], "addObject:", a2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2[2], "count") - 1);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)evaluateWithInputScores:(id)a3 intentType:(id)a4
{
  id v6;
  id v7;
  _ATXScoreInterpreterCtx *v8;
  void *v9;
  id *v10;
  NSDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [_ATXScoreInterpreterCtx alloc];
  +[ATXScoreDict scoreDictFromDictionary:](ATXScoreDict, "scoreDictFromDictionary:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_ATXScoreInterpreterCtx initWithInputScores:intentType:](v8, "initWithInputScores:intentType:", v9, v7);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = self->_bytecode;
  v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = -[_ATXScoreInterpreter _evalVariable:withCtx:]((uint64_t)self, *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15++), v10);
      }
      while (v13 != v15);
      v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16, v16);
    }
    while (v13);
  }

  objc_msgSend(v10[503], "toDictionary", (_QWORD)v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)evaluateWithInputScoreDict:(id)a3 intentType:(id)a4
{
  id v6;
  id v7;
  _ATXScoreInterpreterCtx *v8;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  ATXScoreDict *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[_ATXScoreInterpreterCtx initWithInputScores:intentType:]([_ATXScoreInterpreterCtx alloc], "initWithInputScores:intentType:", v6, v7);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_bytecode;
  v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = -[_ATXScoreInterpreter _evalVariable:withCtx:]((uint64_t)self, *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13++), v8);
      }
      while (v11 != v13);
      v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v14);
    }
    while (v11);
  }

  v15 = v8->subscores;
  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bytecodeDependencies, 0);
  objc_storeStrong((id *)&self->_bytecode, 0);
}

+ (void)_expectedArity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Arity not specified for op %tu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runOperator:arity:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Undefined operator of value %tu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runOperator:arity:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Attempted to compute log10 of non-positive number %f (base arg of Logarithm operator) -- output is NaN", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runOperator:arity:context:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Attempted to compute log10 of non-positive number %f (value arg of Logarithm operator) --  output is NaN", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runOperator:arity:context:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "Divide by zero error (%f / %f) -- setting output to _ATXScoreNotSet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runOperator:arity:context:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Attempted to compute NatLog of non-positive number %f -- output is NaN", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runOperator:arity:context:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "Attempted to compute pow(%f,%f) -- output is NaN", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runOperator:arity:context:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Attempted to compute ExpDecay with negative age: %f  -- output is NaN", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runOperator:arity:context:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Attempted to compute ExpDecay with non-positive half-life: %f -- forcing output to _ATXScoreNotSet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runOperator:arity:context:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Attempted to compute GeometricSum with a ratio of 1 -- setting output to _ATXScoreNotSet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_runOperator:arity:context:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "Attempted to compute GeometricSum with ratio of %f and terms of %f -- result will be NaN", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runOperator:arity:context:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "ScoreInterpreter - CoreMLModel - Error in initializing MLMultiArray: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runOperator:arity:context:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "ScoreInterpreter - CoreMLModel - input feature with name %@ is not of type Double or MLMultiArray", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_runBytecode:context:.cold.1()
{
  __assert_rtn("-[_ATXScoreInterpreter _runBytecode:context:]", "_ATXScoreInterpreter.m", 687, "nextUIntArgumentSize == sizeof(uint16_t)");
}

- (void)_evalVariable:(uint64_t)a3 withCtx:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, a2, a3, "Score for variable %@ returned Nan or Inf: %f", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:.cold.1()
{
  __assert_rtn("+[_ATXScoreInterpreter _bytecodeInstructionForOp:unsignedIntegerArgument:doubleArgument:]", "_ATXScoreInterpreter.m", 1002, "(nil != unsignedIntegerArgument ? 1 : 0) + (nil != doubleArgument ? 1 : 0) <= 1");
}

@end
