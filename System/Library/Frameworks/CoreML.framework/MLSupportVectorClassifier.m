@implementation MLSupportVectorClassifier

- (MLSupportVectorClassifier)initWithEngine:(id)a3 description:(id)a4 configuration:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  MLSupportVectorClassifier *v14;
  MLSupportVectorClassifier *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MLSupportVectorClassifier;
  v14 = -[MLClassifier initWithDescription:configuration:error:](&v19, sel_initWithDescription_configuration_error_, v12, v13, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_engine, a3);
    objc_msgSend(v11, "classLabels");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLModel modelDescription](v15, "modelDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClassLabels:", v16);

  }
  return v15;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  MLPredictionEvent *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  int v30;
  uint64_t v31;
  double *v32;
  double v33;
  double v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  double v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  double v49;
  double v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  double *v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void (**v95)(_QWORD);
  id v96;
  void *v97;
  void *v98;
  id v99;
  void *__p;
  char *v101;
  void *v102[3];
  _QWORD aBlock[6];
  id v104[7];
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  _QWORD v110[3];

  v110[1] = *MEMORY[0x1E0C80C00];
  v96 = a3;
  v99 = a4;
  -[MLModel predictionEvent](self, "predictionEvent");
  v8 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v104, v8, 26, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v99, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v9 = -[MLModel signpostID](self, "signpostID");
  v10 = objc_msgSend(v99, "parentSignpostID");
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__MLSupportVectorClassifier_classify_options_error___block_invoke;
  aBlock[3] = &__block_descriptor_48_e5_v8__0l;
  aBlock[4] = v9;
  aBlock[5] = v10;
  v95 = (void (**)(_QWORD))_Block_copy(aBlock);
  v11 = objc_msgSend(v99, "classifyTopK");
  v12 = -[MLSVMEngine numberOfClasses](self->_engine, "numberOfClasses");
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  -[MLModel modelDescription](self, "modelDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputFeatureNames");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:featureNames:error:](MLFeatureProviderUtils, "vectorizeFeaturesProvidedBy:featureNames:error:", v96, v16, a5);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v98)
    goto LABEL_71;
  if (-[MLSVMEngine isInputSizeLowerBoundOnly](self->_engine, "isInputSizeLowerBoundOnly"))
  {
    v17 = objc_msgSend(v98, "count");
    if (v17 < (int64_t)-[MLSVMEngine inputSize](self->_engine, "inputSize"))
    {
      if (a5)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Input feature length mismatch. Got features of length %d expected length of at least %d"), objc_msgSend(v98, "count"), -[MLSVMEngine inputSize](self->_engine, "inputSize"));
        v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_70:
        v61 = 0;
        *a5 = v18;
        goto LABEL_109;
      }
      goto LABEL_71;
    }
  }
  else
  {
    v19 = objc_msgSend(v98, "count");
    if (v19 != -[MLSVMEngine inputSize](self->_engine, "inputSize"))
    {
      if (a5)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Input feature length mismatch. Got features of length %d expected length of %d"), objc_msgSend(v98, "count"), -[MLSVMEngine inputSize](self->_engine, "inputSize"));
        v18 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_70;
      }
LABEL_71:
      v61 = 0;
      goto LABEL_109;
    }
  }
  if (!-[MLSVMEngine hasProbabilityPredictionEnabled](self->_engine, "hasProbabilityPredictionEnabled"))
  {
    -[MLSVMEngine predict:](self->_engine, "predict:", v98);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "objectAtIndexedSubscript:", 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "integerValue");

    -[MLSupportVectorClassifier engine](self, "engine");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "classLabels");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v66 == 0;

    if (v67)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v64);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v71;
      v106 = &unk_1E3DA1D68;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", v72);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MLSupportVectorClassifier engine](self, "engine");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "classLabels");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "objectAtIndexedSubscript:", v64);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLSupportVectorClassifier featureValueWithObject:](MLSupportVectorClassifier, "featureValueWithObject:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v71, "type") == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v71, "int64Value"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v72;
        v110[0] = &unk_1E3DA1D68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, &v109, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", v73);
      }
      else
      {
        objc_msgSend(v71, "stringValue");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = v72;
        v108 = &unk_1E3DA1D68;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", v73);
      }
      v61 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_109;
  }
  std::vector<double>::vector(v102, -[MLSVMEngine numberOfClasses](self->_engine, "numberOfClasses"));
  -[MLSVMEngine predictProbabilities:probabilities:](self->_engine, "predictProbabilities:probabilities:", v98, v102[0]);
  v20 = -[MLSVMEngine numberOfClasses](self->_engine, "numberOfClasses");
  if (v20 < v13)
    v13 = v20;
  std::vector<unsigned long>::vector(&__p, -[MLSVMEngine numberOfClasses](self->_engine, "numberOfClasses"));
  v21 = __p;
  v22 = v101;
  if (__p != v101)
  {
    v23 = 0;
    do
      *v21++ = v23++;
    while (v21 != v22);
  }
  if (v13 >= -[MLSVMEngine numberOfClasses](self->_engine, "numberOfClasses"))
    goto LABEL_94;
  v25 = (uint64_t *)__p;
  v24 = (uint64_t *)v101;
  v26 = (uint64_t *)((char *)__p + 8 * v13);
  if (v26 == (uint64_t *)v101)
    goto LABEL_93;
  while (1)
  {
    v27 = v24 - v25;
    if (v27 < 2)
      goto LABEL_93;
    if (v27 == 3)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v25, v25 + 1, v24 - 1, (uint64_t)v102[0]);
      goto LABEL_93;
    }
    if (v27 == 2)
    {
      v74 = *(v24 - 1);
      v75 = *v25;
      if (*((double *)v102[0] + v74) > *((double *)v102[0] + *v25))
      {
        *v25 = v74;
        *(v24 - 1) = v75;
      }
      goto LABEL_93;
    }
    if ((char *)v24 - (char *)v25 <= 63)
    {
      if (v24 - 1 == v25)
        goto LABEL_93;
      v76 = (double *)v102[0];
      while (1)
      {
        v77 = v24;
        if (v25 == v24)
          goto LABEL_90;
        v78 = v25 + 1;
        if (v25 + 1 != v24)
          break;
LABEL_92:
        if (++v25 == v24 - 1)
          goto LABEL_93;
      }
      v79 = *v25;
      v77 = v25;
      v80 = v25 + 1;
      do
      {
        v82 = *v80++;
        v81 = v82;
        if (v76[v82] > v76[v79])
        {
          v79 = v81;
          v77 = v78;
        }
        v78 = v80;
      }
      while (v80 != v24);
LABEL_90:
      if (v77 != v25)
      {
        v83 = *v25;
        *v25 = *v77;
        *v77 = v83;
      }
      goto LABEL_92;
    }
    v28 = &v25[v27 >> 1];
    v29 = v24 - 1;
    v30 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v25, v28, v24 - 1, (uint64_t)v102[0]);
    v31 = *v25;
    v32 = (double *)v102[0];
    v33 = *((double *)v102[0] + *v25);
    v34 = *((double *)v102[0] + *v28);
    if (v33 <= v34)
      break;
LABEL_27:
    v39 = v25 + 1;
    if (v25 + 1 >= v29)
    {
      v42 = v25 + 1;
    }
    else
    {
      v40 = v25 + 1;
      while (1)
      {
        v41 = v32[*v28];
        do
        {
          v42 = v40;
          v44 = *v40++;
          v43 = v44;
        }
        while (v32[v44] > v41);
        do
        {
          v46 = *--v29;
          v45 = v46;
        }
        while (v32[v46] <= v41);
        if (v42 >= v29)
          break;
        *v42 = v45;
        *v29 = v43;
        ++v30;
        if (v28 == v42)
          v28 = v29;
      }
    }
    if (v42 != v28)
    {
      v47 = *v42;
      if (v32[*v28] > v32[*v42])
      {
        *v42 = *v28;
        *v28 = v47;
        ++v30;
      }
    }
    if (v42 == v26)
      goto LABEL_93;
    if (!v30)
    {
      if (v42 <= v26)
      {
        v53 = v42 + 1;
        while (v53 != v24)
        {
          v54 = v32[*v53];
          v55 = v32[*(v53++ - 1)];
          if (v54 > v55)
            goto LABEL_42;
        }
      }
      else
      {
        while (v39 != v42)
        {
          v49 = v32[*v39];
          v50 = v32[*(v39++ - 1)];
          if (v49 > v50)
            goto LABEL_42;
        }
      }
      goto LABEL_93;
    }
LABEL_42:
    if (v42 <= v26)
    {
      v48 = v42 + 1;
    }
    else
    {
      v24 = v42;
      v48 = v25;
    }
LABEL_66:
    v25 = v48;
    if (v24 == v26)
      goto LABEL_93;
  }
  v35 = v24 - 2;
  while (v35 != v25)
  {
    v36 = v35;
    v38 = *v35--;
    v37 = v38;
    if (*((double *)v102[0] + v38) > v34)
    {
      *v25 = v37;
      *v36 = v31;
      ++v30;
      v29 = v36;
      goto LABEL_27;
    }
  }
  v51 = v25 + 1;
  if (v33 > *((double *)v102[0] + *v29))
  {
LABEL_58:
    if (v51 == v29)
      goto LABEL_93;
    while (1)
    {
      v56 = v32[*v25];
      do
      {
        v48 = v51;
        v58 = *v51++;
        v57 = v58;
      }
      while (v56 <= v32[v58]);
      do
      {
        v60 = *--v29;
        v59 = v60;
      }
      while (v56 > v32[v60]);
      if (v48 >= v29)
        break;
      *v48 = v59;
      *v29 = v57;
    }
    if (v48 > v26)
      goto LABEL_93;
    goto LABEL_66;
  }
  while (v51 != v29)
  {
    v52 = *v51;
    if (v33 > *((double *)v102[0] + *v51))
    {
      *v51++ = *v29;
      *v29 = v52;
      goto LABEL_58;
    }
    ++v51;
  }
LABEL_93:
  std::vector<unsigned long>::resize(&__p, v13);
LABEL_94:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v13);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v84 = v13;
    v85 = 0;
    v86 = 0;
    do
    {
      v87 = *((_QWORD *)__p + v85);
      -[MLSupportVectorClassifier engine](self, "engine");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "classLabels");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "objectAtIndexedSubscript:", v87);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLSupportVectorClassifier featureValueWithObject:](MLSupportVectorClassifier, "featureValueWithObject:", v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v102[0] + v87));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v91, "type") == 1)
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v91, "int64Value"));
      else
        objc_msgSend(v91, "stringValue");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setObject:forKeyedSubscript:", v92, v93);

      ++v85;
      v86 = v91;
    }
    while (v84 != v85);
  }
  else
  {
    v91 = 0;
  }
  if (objc_msgSend(v91, "type") == 1)
    +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", v97);
  else
    +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", v97);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v101 = (char *)__p;
    operator delete(__p);
  }
  if (v102[0])
  {
    v102[1] = v102[0];
    operator delete(v102[0]);
  }
LABEL_109:

  v95[2](v95);
  ElapsedTimeRecorder::~ElapsedTimeRecorder(v104);

  return v61;
}

- (MLSVMEngine)engine
{
  return (MLSVMEngine *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEngine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
}

uint64_t __52__MLSupportVectorClassifier_classify_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (id)featureValueWithObject:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[MLFeatureValue featureValueWithString:](MLFeatureValue, "featureValueWithString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    +[MLFeatureValue featureValueWithInt64:](MLFeatureValue, "featureValueWithInt64:", objc_msgSend(v3, "longLongValue"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_7:

  return v5;
}

@end
