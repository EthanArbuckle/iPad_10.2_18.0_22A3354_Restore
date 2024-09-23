@implementation MLTreeEnsembleClassifier

- (const)modelData
{
  if (self->_model_data)
    return (const char *)-[NSData bytes](self->_model_data, "bytes");
  else
    return self->_cached_model.__begin_;
}

- (void)_setSingleArrayLookupField
{
  NSString **p_single_array_key;
  NSString *single_array_key;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  p_single_array_key = &self->_single_array_key;
  single_array_key = self->_single_array_key;
  self->_single_array_key = 0;

  -[MLModel modelDescription](self, "modelDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputDescriptionsByName");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type");

    if (v9 == 5)
      objc_storeStrong((id *)p_single_array_key, v7);

  }
}

- (id)_buildClassificationClasses:(double *)a3 topk:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  unint64_t num_dimensions;
  NSArray *v11;
  NSArray *class_values;
  unint64_t v13;
  double v14;
  int64_t class_type;
  NSArray *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  int v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  double v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  double v50;
  double v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  double v55;
  double v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BOOL4 v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _BOOL4 v70;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  _BOOL4 v77;
  uint64_t v78;
  unint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *__p;
  uint64_t *v106;
  id v107;
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  _QWORD v119[2];

  v119[1] = *MEMORY[0x1E0C80C00];
  if (!self->_class_values)
  {
    v9 = (void *)objc_opt_class();
    num_dimensions = self->num_dimensions;
    v107 = 0;
    objc_msgSend(v9, "_convertStringClassVector:int64ClassVector:dimensions:toClassLabel:classType:andReturnError:", &self->_classes_by_string, &self->_classes_by_int64_t, num_dimensions, &v107, &self->_class_type, a5);
    v11 = (NSArray *)v107;
    if (!v11)
      return 0;
    class_values = self->_class_values;
    self->_class_values = v11;

  }
  if (!a4)
  {
    if (self->_class_type == 1)
      +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", MEMORY[0x1E0C9AA70], a4, a5);
    else
      +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", MEMORY[0x1E0C9AA70], a4, a5);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = self->num_dimensions;
  if (v13 == 1)
  {
    if (a4 == 1)
    {
      v14 = *a3;
      class_type = self->_class_type;
      v16 = self->_class_values;
      if (*a3 <= 0.5)
      {
        v77 = class_type == 1;
        -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 0, a4, a5, v14);
        v78 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v78;
        if (v77)
        {
          v114 = v78;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - *a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", v21);
        }
        else
        {
          v112 = v78;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - *a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v113 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", v21);
        }
      }
      else
      {
        v17 = class_type == 1;
        -[NSArray objectAtIndexedSubscript:](v16, "objectAtIndexedSubscript:", 1, a4, a5, v14);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v17)
        {
          v118 = v18;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v119[0] = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, &v118, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", v21);
        }
        else
        {
          v116 = v18;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", v21);
        }
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      return v22;
    }
    else
    {
      v62 = self->_class_type == 1;
      -[NSArray objectAtIndexedSubscript:](self->_class_values, "objectAtIndexedSubscript:", 0, a4, a5);
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = (void *)v63;
      if (v62)
      {
        v110[0] = v63;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - *a3);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v111[0] = v65;
        -[NSArray objectAtIndexedSubscript:](self->_class_values, "objectAtIndexedSubscript:", 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v110[1] = v66;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *a3);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v111[1] = v67;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, v110, 2);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", v68);
      }
      else
      {
        v108[0] = v63;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - *a3);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v109[0] = v65;
        -[NSArray objectAtIndexedSubscript:](self->_class_values, "objectAtIndexedSubscript:", 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v108[1] = v66;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *a3);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v109[1] = v67;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 2);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", v68);
      }
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      return v69;
    }
  }
  if (v13 <= a4)
  {
    v70 = self->_class_type == 1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", self->num_dimensions, a4, a5);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = self->num_dimensions;
    if (v70)
    {
      if (v72)
      {
        v73 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[v73]);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndexedSubscript:](self->_class_values, "objectAtIndexedSubscript:", v73);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "setObject:forKey:", v74, v75);

          ++v73;
        }
        while (v73 < self->num_dimensions);
      }
      +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", v71);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      return v76;
    }
    else
    {
      if (v72)
      {
        v79 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[v79]);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndexedSubscript:](self->_class_values, "objectAtIndexedSubscript:", v79);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "setValue:forKey:", v80, v81);

          ++v79;
        }
        while (v79 < self->num_dimensions);
      }
      +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", v71);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      return v82;
    }
  }
  std::vector<unsigned long>::vector(&__p, v13);
  v24 = (uint64_t *)__p;
  v25 = v106;
  if (__p != v106)
  {
    v26 = 0;
    v27 = (uint64_t *)__p;
    do
      *v27++ = v26++;
    while (v27 != v25);
  }
  v28 = &v24[a4];
  if (v28 == v25)
    goto LABEL_101;
  while (1)
  {
    v29 = v25 - v24;
    if (v29 < 2)
      goto LABEL_101;
    if (v29 == 3)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v24, v24 + 1, v25 - 1, (uint64_t)a3);
      goto LABEL_101;
    }
    if (v29 == 2)
    {
      v83 = *(v25 - 1);
      v84 = *v24;
      if (a3[v83] > a3[*v24])
      {
        *v24 = v83;
        *(v25 - 1) = v84;
      }
      goto LABEL_101;
    }
    if ((char *)v25 - (char *)v24 <= 63)
    {
      if (v25 - 1 == v24)
        goto LABEL_101;
      while (1)
      {
        v85 = v25;
        if (v24 == v25)
          goto LABEL_98;
        v86 = v24 + 1;
        if (v24 + 1 != v25)
          break;
LABEL_100:
        if (++v24 == v25 - 1)
          goto LABEL_101;
      }
      v87 = *v24;
      v85 = v24;
      v88 = v24 + 1;
      do
      {
        v90 = *v88++;
        v89 = v90;
        if (a3[v90] > a3[v87])
        {
          v87 = v89;
          v85 = v86;
        }
        v86 = v88;
      }
      while (v88 != v25);
LABEL_98:
      if (v85 != v24)
      {
        v91 = *v24;
        *v24 = *v85;
        *v85 = v91;
      }
      goto LABEL_100;
    }
    v30 = &v24[v29 >> 1];
    v31 = v25 - 1;
    v32 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v24, v30, v25 - 1, (uint64_t)a3);
    v33 = *v24;
    v34 = a3[*v24];
    v35 = a3[*v30];
    if (v34 <= v35)
      break;
LABEL_27:
    v40 = v24 + 1;
    if (v24 + 1 >= v31)
    {
      v43 = v24 + 1;
    }
    else
    {
      v41 = v24 + 1;
      while (1)
      {
        v42 = a3[*v30];
        do
        {
          v43 = v41;
          v45 = *v41++;
          v44 = v45;
        }
        while (a3[v45] > v42);
        do
        {
          v47 = *--v31;
          v46 = v47;
        }
        while (a3[v47] <= v42);
        if (v43 >= v31)
          break;
        *v43 = v46;
        *v31 = v44;
        ++v32;
        if (v30 == v43)
          v30 = v31;
      }
    }
    if (v43 != v30)
    {
      v48 = *v43;
      if (a3[*v30] > a3[*v43])
      {
        *v43 = *v30;
        *v30 = v48;
        ++v32;
      }
    }
    if (v43 == v28)
      goto LABEL_101;
    if (!v32)
    {
      if (v43 <= v28)
      {
        v54 = v43 + 1;
        while (v54 != v25)
        {
          v55 = a3[*v54];
          v56 = a3[*(v54++ - 1)];
          if (v55 > v56)
            goto LABEL_42;
        }
      }
      else
      {
        while (v40 != v43)
        {
          v50 = a3[*v40];
          v51 = a3[*(v40++ - 1)];
          if (v50 > v51)
            goto LABEL_42;
        }
      }
      goto LABEL_101;
    }
LABEL_42:
    if (v43 <= v28)
    {
      v49 = v43 + 1;
    }
    else
    {
      v25 = v43;
      v49 = v24;
    }
LABEL_66:
    v24 = v49;
    if (v25 == v28)
      goto LABEL_101;
  }
  v36 = v25 - 2;
  while (v36 != v24)
  {
    v37 = v36;
    v39 = *v36--;
    v38 = v39;
    if (a3[v39] > v35)
    {
      *v24 = v38;
      *v37 = v33;
      ++v32;
      v31 = v37;
      goto LABEL_27;
    }
  }
  v52 = v24 + 1;
  if (v34 > a3[*v31])
  {
LABEL_58:
    if (v52 == v31)
      goto LABEL_101;
    while (1)
    {
      v57 = a3[*v24];
      do
      {
        v49 = v52;
        v59 = *v52++;
        v58 = v59;
      }
      while (v57 <= a3[v59]);
      do
      {
        v61 = *--v31;
        v60 = v61;
      }
      while (v57 > a3[v61]);
      if (v49 >= v31)
        break;
      *v49 = v60;
      *v31 = v58;
    }
    if (v49 > v28)
      goto LABEL_101;
    goto LABEL_66;
  }
  while (v52 != v31)
  {
    v53 = *v52;
    if (v34 > a3[*v52])
    {
      *v52++ = *v31;
      *v31 = v53;
      goto LABEL_58;
    }
    ++v52;
  }
LABEL_101:
  std::vector<unsigned long>::resize(&__p, a4);
  if (self->_class_type == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", a4);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    if (a4 <= 1)
      v94 = 1;
    else
      v94 = a4;
    do
    {
      v95 = *((_QWORD *)__p + v93);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[v95]);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_class_values, "objectAtIndexedSubscript:", v95);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setObject:forKey:", v96, v97);

      ++v93;
    }
    while (v94 != v93);
    +[MLClassifierResult resultWithIntClassProbability:](MLClassifierResult, "resultWithIntClassProbability:", v92);
    v98 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", a4);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = 0;
    if (a4 <= 1)
      v100 = 1;
    else
      v100 = a4;
    do
    {
      v101 = *((_QWORD *)__p + v99);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3[v101]);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_class_values, "objectAtIndexedSubscript:", v101);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setValue:forKey:", v102, v103);

      ++v99;
    }
    while (v100 != v99);
    +[MLClassifierResult resultWithStringClassProbability:](MLClassifierResult, "resultWithStringClassProbability:", v92);
    v98 = objc_claimAutoreleasedReturnValue();
  }
  v104 = (void *)v98;

  if (__p)
  {
    v106 = (uint64_t *)__p;
    operator delete(__p);
  }
  return v104;
}

- (id)prepareInput:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = v6;
  if (self->_single_array_key)
  {
    objc_msgSend(v6, "featureValueForName:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "multiArrayValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "dataType");

      if (v11 == 65600)
      {
        objc_msgSend(v9, "multiArrayValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[MLModel signpostID](self, "signpostID");
        kdebug_trace();
        objc_msgSend(v9, "multiArrayValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLMultiArray doubleMultiArrayWithCopyOfMultiArray:](MLMultiArray, "doubleMultiArrayWithCopyOfMultiArray:", v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[MLModel signpostID](self, "signpostID");
        kdebug_trace();
      }

    }
    else if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("INTERNAL ERROR -- feature not present that should have been."));
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    -[MLModel signpostID](self, "signpostID");
    kdebug_trace();
    -[MLModel vectorizeInput:error:](self, "vectorizeInput:error:", v7, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLModel signpostID](self, "signpostID");
    kdebug_trace();
  }

  return v12;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLPredictionEvent *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD);
  unint64_t num_dimensions;
  char *v17;
  const unsigned __int8 *v18;
  const double *v19;
  void *v20;
  CoreML::TreeEnsembles::Internal *v21;
  char *v22;
  const unsigned __int8 *v23;
  const double *v24;
  void *__p[3];
  _QWORD aBlock[6];
  id v28[7];

  v8 = a3;
  v9 = a4;
  -[MLModel predictionEvent](self, "predictionEvent");
  v10 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  ElapsedTimeRecorder::ElapsedTimeRecorder((ElapsedTimeRecorder *)v28, v10, 28, -[MLModel signpostID](self, "signpostID"), objc_msgSend(v9, "parentSignpostID"), -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID"));

  v11 = objc_msgSend(v9, "classifyTopK");
  -[MLTreeEnsembleClassifier prepareInput:error:](self, "prepareInput:error:", v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = -[MLModel signpostID](self, "signpostID");
    v14 = objc_msgSend(v9, "parentSignpostID");
    kdebug_trace();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__MLTreeEnsembleClassifier_classify_options_error___block_invoke;
    aBlock[3] = &__block_descriptor_48_e5_v8__0l;
    aBlock[4] = v13;
    aBlock[5] = v14;
    v15 = (void (**)(_QWORD))_Block_copy(aBlock);
    num_dimensions = self->num_dimensions;
    if (num_dimensions == 1)
    {
      v17 = -[MLTreeEnsembleClassifier modelData](self, "modelData", 0);
      v18 = (const unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
      CoreML::TreeEnsembles::Internal::predict((CoreML::TreeEnsembles::Internal *)__p, (double *)v17, v18, v19);
      -[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:](self, "_buildClassificationClasses:topk:error:", __p, v11, a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      std::vector<double>::vector(__p, num_dimensions);
      v21 = (CoreML::TreeEnsembles::Internal *)__p[0];
      v22 = -[MLTreeEnsembleClassifier modelData](self, "modelData");
      v23 = (const unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
      CoreML::TreeEnsembles::Internal::predict(v21, (double *)v22, v23, v24);
      -[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:](self, "_buildClassificationClasses:topk:error:", __p[0], v11, a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
    v15[2](v15);

  }
  else
  {
    v20 = 0;
  }

  ElapsedTimeRecorder::~ElapsedTimeRecorder(v28);
  return v20;
}

- (void).cxx_destruct
{
  int64_t *begin;
  char *v4;
  vector<std::string, std::allocator<std::string>> *p_classes_by_string;

  objc_storeStrong((id *)&self->_single_array_key, 0);
  objc_storeStrong((id *)&self->_class_values, 0);
  begin = self->_classes_by_int64_t.__begin_;
  if (begin)
  {
    self->_classes_by_int64_t.__end_ = begin;
    operator delete(begin);
  }
  p_classes_by_string = &self->_classes_by_string;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_classes_by_string);
  objc_storeStrong((id *)&self->_model_data, 0);
  v4 = self->_cached_model.__begin_;
  if (v4)
  {
    self->_cached_model.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 22) = 0;
  *((_QWORD *)self + 20) = 0;
  return self;
}

uint64_t __51__MLTreeEnsembleClassifier_classify_options_error___block_invoke()
{
  return kdebug_trace();
}

+ (BOOL)_convertStringClassVector:(const void *)a3 int64ClassVector:(const void *)a4 dimensions:(unint64_t)a5 toClassLabel:(id *)a6 classType:(int64_t *)a7 andReturnError:(id *)a8
{
  unint64_t v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  int64_t v16;
  uint64_t *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint8_t *v24;
  BOOL v25;
  __int16 v27;
  uint8_t buf[2];

  if (a5 == 1)
    v11 = 2;
  else
    v11 = a5;
  v12 = *((_QWORD *)a3 + 1);
  if (*(_QWORD *)a3 == v12)
  {
    v20 = *((_QWORD *)a4 + 1);
    if (*(_QWORD *)a4 == v20)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", &unk_1E3DA2158);
      objc_msgSend(v14, "addObject:", &unk_1E3DA2170);
    }
    else
    {
      if (v11 != (v20 - *(_QWORD *)a4) >> 3)
      {
        if (a8)
        {
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Incorrect number of classes given (TreeEnsembleClassifier)."));
          *a8 = (id)objc_claimAutoreleasedReturnValue();
        }
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          goto LABEL_32;
        *(_WORD *)buf = 0;
        v24 = buf;
        goto LABEL_37;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v21 = 0;
        v16 = 1;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)a4 + 8 * v21));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v22);

          ++v21;
        }
        while (v11 != v21);
        goto LABEL_24;
      }
    }
    v16 = 1;
    goto LABEL_24;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((v12 - *(_QWORD *)a3) >> 3) != v11)
  {
    if (a8)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Incorrect number of classes given (TreeEnsembleClassifier)."), a4);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    v27 = 0;
    v24 = (uint8_t *)&v27;
LABEL_37:
    _os_log_error_impl(&dword_19C486000, v23, OS_LOG_TYPE_ERROR, "Incorrect number of classes given (TreeEnsembleClassifier).", v24, 2u);
LABEL_32:

    v14 = 0;
    v25 = 0;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v16 = 3;
    if (!a6)
      goto LABEL_26;
    goto LABEL_25;
  }
  v15 = 0;
  v16 = 3;
  do
  {
    v17 = (uint64_t *)(*(_QWORD *)a3 + v15);
    if (*((char *)v17 + 23) < 0)
      v17 = (uint64_t *)*v17;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

    v15 += 24;
    --v11;
  }
  while (v11);
LABEL_24:
  if (a6)
LABEL_25:
    *a6 = objc_retainAutorelease(v14);
LABEL_26:
  if (a7)
    *a7 = v16;
  v25 = 1;
LABEL_33:

  return v25;
}

+ (id)loadModelFromSpecificationWithCompilationOptions:(void *)a3 options:(id)a4 error:(id *)a5
{
  MLTreeEnsembleClassifier *v8;
  MLModelConfiguration *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  _OWORD *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  _QWORD *v23;
  void *v24;
  unint64_t *v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  id v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  id v41;
  id v42;
  id v43[3];
  void *__p[2];
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD *v50;
  std::__shared_weak_count *v51;
  void **v52;
  _BYTE v53[128];
  uint64_t *v54;
  _QWORD *v55[5];

  v55[3] = *(_QWORD **)MEMORY[0x1E0C80C00];
  v42 = a4;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 402)
  {
    v41 = a1;
    v8 = [MLTreeEnsembleClassifier alloc];
    v9 = objc_alloc_init(MLModelConfiguration);
    v10 = -[MLClassifier initDescriptionOnlyWithSpecification:configuration:error:](v8, "initDescriptionOnlyWithSpecification:configuration:error:", a3, v9, a5);

    if (v10)
    {
      CoreML::TreeEnsembles::constructAndValidateTreeEnsembleFromSpec((CoreML::TreeEnsembles *)&v50, *(const CoreML::Specification::Model **)a3);
      v55[0] = 0;
      v55[1] = 0;
      v54 = (uint64_t *)v55;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v11 = v42;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v47 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v11, "objectForKeyedSubscript:", v15);
            v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v17 = objc_msgSend(v16, "UTF8String");
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
            v52 = __p;
            v18 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v54, __p, (_OWORD **)&v52);
            MEMORY[0x1A1AD5EAC]((char *)v18 + 56, v17);
            if (SHIBYTE(v45) < 0)
              operator delete(__p[0]);

          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
        }
        while (v12);
      }

      v19 = (uint64_t)v50;
      v20 = v51;
      v43[1] = v50;
      v43[2] = v51;
      if (v51)
      {
        p_shared_owners = (unint64_t *)&v51->__shared_owners_;
        do
          v22 = __ldxr(p_shared_owners);
        while (__stxr(v22 + 1, p_shared_owners));
      }
      CoreML::TreeEnsembles::buildTreeEnsembleModelFromSpec((uint64_t)__p, v19, v20, (uint64_t)&v54);
      v23 = (_QWORD *)(v10 + 96);
      v24 = *(void **)(v10 + 96);
      if (v24)
      {
        *(_QWORD *)(v10 + 104) = v24;
        operator delete(v24);
        *v23 = 0;
        *(_QWORD *)(v10 + 104) = 0;
        *(_QWORD *)(v10 + 112) = 0;
      }
      *(_OWORD *)v23 = *(_OWORD *)__p;
      *(_QWORD *)(v10 + 112) = v45;
      __p[0] = 0;
      __p[1] = 0;
      v45 = 0;
      if (v20)
      {
        v25 = (unint64_t *)&v20->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      v27 = v50;
      *(_QWORD *)(v10 + 128) = v50[2];
      if ((_QWORD *)(v10 + 136) != v27 + 10)
      {
        std::vector<std::string>::__assign_with_size[abi:ne180100]<std::string*,std::string*>(v10 + 136, (std::string *)v27[10], (__int128 *)v27[11], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27[11] - v27[10]) >> 3));
        v27 = v50;
      }
      if ((_QWORD *)(v10 + 160) != v27 + 13)
        std::vector<long long>::__assign_with_size[abi:ne180100]<long long *,long long *>((char *)(v10 + 160), (char *)v27[13], v27[14], (uint64_t)(v27[14] - v27[13]) >> 3);
      v28 = *(_QWORD *)(v10 + 128);
      v43[0] = 0;
      objc_msgSend(v41, "_convertStringClassVector:int64ClassVector:dimensions:toClassLabel:classType:andReturnError:", v10 + 136, v10 + 160, v28, v43, v10 + 184, a5);
      v29 = v43[0];
      v30 = v43[0];
      if (v30)
      {
        v31 = v30;
        objc_storeStrong((id *)(v10 + 192), v29);
        objc_msgSend((id)v10, "modelDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setClassLabels:", v31);

        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v55[0]);
        v33 = v51;
        if (v51)
        {
          v34 = (unint64_t *)&v51->__shared_owners_;
          do
            v35 = __ldaxr(v34);
          while (__stlxr(v35 - 1, v34));
          if (!v35)
          {
            ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
            std::__shared_weak_count::__release_weak(v33);
          }
        }
        objc_msgSend((id)v10, "_setSingleArrayLookupField");
        v36 = (id)v10;
        goto LABEL_42;
      }
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v55[0]);
      v37 = v51;
      if (v51)
      {
        v38 = (unint64_t *)&v51->__shared_owners_;
        do
          v39 = __ldaxr(v38);
        while (__stlxr(v39 - 1, v38));
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
        }
      }
    }
    v36 = 0;
LABEL_42:

    goto LABEL_43;
  }
  if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:](MLModelErrorUtils, "IOErrorWithFormat:", CFSTR("Interface type is not an TreeEnsembleClassifier"));
    v36 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }
LABEL_43:

  return v36;
}

+ (id)loadModelFromSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  +[MLTreeEnsembleClassifier loadModelFromSpecificationWithCompilationOptions:options:error:](MLTreeEnsembleClassifier, "loadModelFromSpecificationWithCompilationOptions:options:error:", a3, MEMORY[0x1E0C9AA70], a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  void *v9;
  uint64_t *v10;
  _QWORD *v11;
  void *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  _QWORD *v17;
  std::__shared_weak_count *v18;
  void *__p[2];
  uint64_t v20;

  +[MLModel serializeInterfaceAndMetadata:toArchive:error:](MLModel, "serializeInterfaceAndMetadata:toArchive:error:", a3, a4, a6);
  v9 = (void *)objc_opt_new();
  +[MLTreeEnsembleClassifier loadModelFromSpecification:configuration:error:](MLTreeEnsembleClassifier, "loadModelFromSpecification:configuration:error:", a3, v9, a6);
  v10 = (uint64_t *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    __p[0] = 0;
    __p[1] = 0;
    v20 = 0;
    operator<<<unsigned char>((uint64_t)a4, (uint64_t *)__p);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_19CB39696);
    OArchive::uniqueBlob(&v17, *((_QWORD **)a4 + 1), (const void **)__p);
    if (SHIBYTE(v20) < 0)
      operator delete(__p[0]);
    v11 = v17;
    operator<<((uint64_t)a4, v17 + 72);
    if ((unint64_t)(v10[13] - v10[12]) >> 31)
    {
      if (a6)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Internal error: model too large to be compiled."));
        v12 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      if (!*(_BYTE *)v11 && !v11[78])
        Archiver::_ODataBlobImpl::_openAsStream(v11);
      std::ostream::write();
      operator<<((uint64_t)a4, v10[16]);
      operator<<<std::string>((uint64_t)a4, v10 + 17);
      operator<<<long long>((uint64_t)a4, v10 + 20);
      +[MLCompilerResult resultWithArchive:](MLCompilerResult, "resultWithArchive:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v18;
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v15 = __ldaxr(p_shared_owners);
      while (__stlxr(v15 - 1, p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 0, 0, CFSTR("generic"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  MLTreeEnsembleXGBoostClassifier *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  std::string *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  char v40;
  MLTreeEnsembleXGBoostClassifier *v41;
  void *v42;
  id v43;
  MLTreeEnsembleXGBoostClassifier *v44;
  void *v46;
  MLTreeEnsembleXGBoostClassifier *v47;
  void *v48;
  void *v49;
  id v50;
  void *__p;
  void *v52;
  uint64_t v53;
  std::string v54;
  id v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  std::string v58;

  v11 = a5;
  v12 = a6;
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 1, 0, 0, CFSTR("generic"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "majorVersion");
  if (v14 >= objc_msgSend(v11, "majorVersion"))
  {
    v18 = -[MLModel initInterfaceAndMetadataWithCompiledArchive:error:]([MLTreeEnsembleClassifier alloc], "initInterfaceAndMetadataWithCompiledArchive:error:", a3, a7);
    v19 = v18;
    if (v18)
    {
      operator>><unsigned char>((uint64_t)a3, v18 + 12);
      if (v19[12] == v19[13])
      {
        memset(&v58, 0, sizeof(v58));
        operator>>((uint64_t)a3, &v58);
        IArchive::blob(&v56, *(_QWORD *)a3, (uint64_t)&v58);
        (*(void (**)(uint64_t))(*(_QWORD *)v56 + 32))(v56);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v19[15];
        v19[15] = v20;

        v22 = v57;
        if (v57)
        {
          p_shared_owners = (unint64_t *)&v57->__shared_owners_;
          do
            v24 = __ldaxr(p_shared_owners);
          while (__stlxr(v24 - 1, p_shared_owners));
          if (!v24)
          {
            ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
            std::__shared_weak_count::__release_weak(v22);
          }
        }
        if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v58.__r_.__value_.__l.__data_);
      }
      operator>>((uint64_t)a3);
      operator>><std::string>((uint64_t)a3, (std::vector<std::string> *)(v19 + 17));
      operator>><long long>((uint64_t)a3, (char **)v19 + 20);
      v25 = v19[16];
      v55 = 0;
      objc_msgSend(a1, "_convertStringClassVector:int64ClassVector:dimensions:toClassLabel:classType:andReturnError:", v19 + 17, v19 + 20, v25, &v55, v19 + 23, a7);
      v26 = v55;
      v27 = v55;
      if (v27)
      {
        objc_storeStrong((id *)v19 + 24, v26);
        objc_msgSend(v19, "modelDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setClassLabels:", v27);

        if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)a3 + 56))(*(_QWORD *)a3) == 1)
          goto LABEL_35;
        v29 = (void *)MEMORY[0x1E0C99E98];
        v30 = (void *)MEMORY[0x1E0CB3940];
        v31 = *(_QWORD *)a3;
        if (*(char *)(*(_QWORD *)a3 + 31) < 0)
        {
          std::string::__init_copy_ctor_external(&v58, *(const std::string::value_type **)(v31 + 8), *(_QWORD *)(v31 + 16));
        }
        else
        {
          v32 = *(_OWORD *)(v31 + 8);
          v58.__r_.__value_.__r.__words[2] = *(_QWORD *)(v31 + 24);
          *(_OWORD *)&v58.__r_.__value_.__l.__data_ = v32;
        }
        if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v33 = &v58;
        else
          v33 = (std::string *)v58.__r_.__value_.__r.__words[0];
        objc_msgSend(v30, "stringWithUTF8String:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "fileURLWithPath:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v58.__r_.__value_.__l.__data_);
        v48 = v35;
        objc_msgSend(v35, "lastPathComponent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".mlmodelc"), CFSTR(".xgboost"));
        v17 = (MLTreeEnsembleXGBoostClassifier *)objc_claimAutoreleasedReturnValue();

        v47 = v17;
        objc_msgSend(v35, "path");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringByAppendingPathComponent:", v17);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "fileExistsAtPath:", v49);
        v40 = v39;
        if (v39)
        {
          v41 = [MLTreeEnsembleXGBoostClassifier alloc];
          objc_msgSend(v19, "modelDescription");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          memset(&v54, 0, sizeof(v54));
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v54, (__int128 *)v19[17], (__int128 *)v19[18], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19[18] - v19[17]) >> 3));
          v52 = 0;
          v53 = 0;
          __p = 0;
          std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, (const void *)v19[20], v19[21], (uint64_t)(v19[21] - v19[20]) >> 3);
          v42 = v38;
          v50 = 0;
          v17 = -[MLTreeEnsembleXGBoostClassifier initWithDescription:configuration:indexToStringLabelArray:indexToIntLabelArray:modelURL:error:](v41, "initWithDescription:configuration:indexToStringLabelArray:indexToIntLabelArray:modelURL:error:", v46, v12, &v54, &__p, v48, &v50);
          v43 = v50;
          if (__p)
          {
            v52 = __p;
            operator delete(__p);
          }
          v58.__r_.__value_.__r.__words[0] = (std::string::size_type)&v54;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);

          if (v17)
          {
            v44 = v17;
          }
          else if (a7)
          {
            +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v43, CFSTR("Cannot initialize Tree Ensemble Classifier model which contains a trained model."));
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }

          v38 = v42;
        }

        if ((v40 & 1) == 0)
        {
LABEL_35:
          objc_msgSend(v19, "_setSingleArrayLookupField");
          v17 = v19;
        }
      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    if (a7)
    {
      objc_msgSend(v11, "versionNumberString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "versionNumberString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("compiler major version for compiled model is %@ and is more recent than this framework major version %@."), v15, v16);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0;
  }

  return v17;
}

@end
