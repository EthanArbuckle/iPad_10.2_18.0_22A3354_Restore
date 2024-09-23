@implementation MLSVMEngine

- (MLSVMEngine)initWithLibSVMFile:(id)a3 classLabels:(id)a4
{
  id v6;
  id v7;
  id v8;
  char *model;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  unsigned int v15;
  int v16;
  int v17;
  MLSVMEngine *v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  model = svm_load_model((const char *)objc_msgSend(v8, "UTF8String"));
  if (model)
  {
    v10 = *((unsigned int *)model + 27);
    if ((int)v10 < 1)
    {
      v12 = 0;
    }
    else
    {
      v11 = 0;
      LODWORD(v12) = 0;
      do
      {
        v13 = *(_QWORD *)(*((_QWORD *)model + 14) + 8 * v11);
        v14 = (int *)(v13 + 16);
        v15 = -1;
        do
        {
          v16 = *v14;
          v14 += 4;
          ++v15;
        }
        while (v16 != -1);
        v17 = *(_DWORD *)(v13 + 16 * v15);
        if ((int)v12 <= v17)
          v12 = v17;
        else
          v12 = v12;
        ++v11;
      }
      while (v11 != v10);
    }
    self = -[MLSVMEngine initWithSVMModel:freeOnDealloc:isInputSizeLowerBoundOnly:inputSize:classLabels:](self, "initWithSVMModel:freeOnDealloc:isInputSizeLowerBoundOnly:inputSize:classLabels:", model, 1, 1, v12, v7);
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (MLSVMEngine)initWithSVMModel:(svm_model *)a3 freeOnDealloc:(BOOL)a4 isInputSizeLowerBoundOnly:(BOOL)a5 inputSize:(unint64_t)a6 classLabels:(id)a7
{
  id v13;
  MLSVMEngine *v14;
  MLSVMEngine *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)MLSVMEngine;
  v14 = -[MLSVMEngine init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_freeModelOnDealloc = a4;
    v14->_isInputSizeLowerBoundOnly = a5;
    v14->_model = a3;
    v14->_inputSize = a6;
    objc_storeStrong((id *)&v14->_classLabels, a7);
  }

  return v15;
}

- (void)dealloc
{
  svm_model *model;
  svm_model **p_model;
  uint64_t v5;
  objc_super v6;

  if (self->_freeModelOnDealloc)
  {
    p_model = &self->_model;
    model = self->_model;
    if (!model->var11 && model->var2 >= 1)
    {
      v5 = 0;
      do
      {
        free(model->var3[v5++]);
        model = *p_model;
      }
      while (v5 < (*p_model)->var2);
    }
    svm_free_and_destroy_model((void **)&self->_model);
  }
  v6.receiver = self;
  v6.super_class = (Class)MLSVMEngine;
  -[MLSVMEngine dealloc](&v6, sel_dealloc);
}

- (unint64_t)numberOfClasses
{
  return self->_model->var1;
}

- (svm_node)allocSVMNodeVector:(unint64_t)a3
{
  svm_node *result;
  svm_node *v5;

  result = (svm_node *)malloc_type_malloc(16 * a3 + 16, 0x1000040F7F8B94BuLL);
  v5 = &result[a3];
  v5->var0 = -1;
  v5->var1 = NAN;
  return result;
}

- (void)fillSVMNodeVector:(svm_node *)a3 values:(const double *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  double *p_var1;
  double v7;

  if (a5)
  {
    v5 = 0;
    p_var1 = &a3->var1;
    do
    {
      v7 = a4[v5];
      *((_DWORD *)p_var1 - 2) = v5 + 1;
      *p_var1 = v7;
      p_var1 += 2;
      ++v5;
    }
    while (a5 != v5);
  }
}

- (void)deallocSVMNodeVector:(svm_node *)a3
{
  free(a3);
}

- (id)predict:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  svm_node *v11;
  MLMultiArray *v12;
  void *v13;
  void *v14;
  MLMultiArray *v15;
  id v16;
  uint64_t v17;
  MLMultiArray *v18;
  uint64_t v19;
  double *v20;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(v22, "shape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v22, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v22, "shape");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

  }
  else
  {
    v10 = 1;
  }

  v11 = -[MLSVMEngine allocSVMNodeVector:](self, "allocSVMNodeVector:", v6);
  v12 = [MLMultiArray alloc];
  v23[0] = &unk_1E3DA2020;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MLMultiArray initWithShape:dataType:error:](v12, "initWithShape:dataType:error:", v14, 65600, 0);

  v16 = objc_retainAutorelease(v22);
  v17 = objc_msgSend(v16, "bytes");
  v18 = objc_retainAutorelease(v15);
  v19 = -[MLMultiArray mutableBytes](v18, "mutableBytes");
  if (v10)
  {
    v20 = (double *)v19;
    do
    {
      -[MLSVMEngine fillSVMNodeVector:values:count:](self, "fillSVMNodeVector:values:count:", v11, v17, v6);
      *v20++ = svm_predict((uint64_t)self->_model, (Kernel *)v11);
      v17 += 8 * v6;
      --v10;
    }
    while (v10);
  }
  -[MLSVMEngine deallocSVMNodeVector:](self, "deallocSVMNodeVector:", v11);

  return v18;
}

- (BOOL)hasProbabilityPredictionEnabled
{
  svm_model *model;

  model = self->_model;
  return model->var6 && model->var7 != 0;
}

- (void)predictProbabilities:(id)a3 probabilities:(double *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  svm_node *v10;
  id v11;

  v6 = a3;
  objc_msgSend(v6, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = -[MLSVMEngine allocSVMNodeVector:](self, "allocSVMNodeVector:", v9);
  v11 = objc_retainAutorelease(v6);
  -[MLSVMEngine fillSVMNodeVector:values:count:](self, "fillSVMNodeVector:values:count:", v10, objc_msgSend(v11, "bytes"), v9);
  -[MLSVMEngine deallocSVMNodeVector:](self, "deallocSVMNodeVector:", v10, svm_predict_probability((uint64_t)self->_model, (Kernel *)v10, a4));

}

- (MLSVMEngine)initWithSpecification:(void *)a3 error:(id *)a4
{
  MLSVMEngine *v6;
  uint64_t *v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  CoreML::Specification::Kernel *v17;
  int v18;
  CoreML::Specification::SparseSupportVectors *v19;
  CoreML::Specification::protobuf_SVM_2eproto *v20;
  const CoreML::Specification::SparseSupportVectors *v21;
  CoreML::Specification::DenseSupportVectors *v22;
  CoreML::Specification::protobuf_SVM_2eproto *v23;
  const CoreML::Specification::DenseSupportVectors *v24;
  int v25;
  CoreML::Specification::StringVector *v26;
  CoreML::Specification::protobuf_DataStructures_2eproto *v27;
  const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *v28;
  CoreML::Specification::Int64Vector *v29;
  CoreML::Specification::protobuf_DataStructures_2eproto *v30;
  const CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts *v31;
  const CoreML::Specification::Kernel *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  int *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  unint64_t *inited;
  unint64_t *v51;
  uint64_t *v52;
  int v53;
  uint64_t j;
  uint64_t *v55;
  uint64_t *v56;
  void *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  void *v61;
  uint64_t i;
  uint64_t *v63;
  uint64_t *v64;
  void *v65;
  uint64_t *v66;
  uint64_t *v67;
  void *v68;
  int v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t *v73;
  _DWORD *v74;
  uint64_t v75;
  int v76;
  CoreML::Specification::protobuf_SVM_2eproto *v77;
  uint64_t v78;
  int *v79;
  int v80;
  CoreML::Specification::SparseSupportVectors *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  void *v92;
  MLSVMEngine *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  _QWORD *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  uint64_t v105;
  _BYTE v107[32];
  uint64_t v108;
  _BYTE v109[16];
  uint64_t v110;
  int v111;
  void (**v112)(CoreML::Specification::SupportVectorClassifier *__hidden);
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  _DWORD *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  CoreML::Specification::Kernel *v125;
  CoreML::Specification::SparseSupportVectors *v126;
  CoreML::Specification::Int64Vector *v127;
  int v128;
  int v129;
  int v130;

  v6 = self;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 401)
  {
    v7 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)self);
    v7 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
  }
  v114 = 0;
  v115 = 0;
  v112 = &off_1E3D547C0;
  v113 = 0;
  v8 = *((_DWORD *)v7 + 4);
  if (v8)
  {
    google::protobuf::RepeatedField<float>::Reserve((unsigned int *)&v114, v8);
    memcpy((void *)(v115 + 8), (const void *)(v7[3] + 8), 4 * *((int *)v7 + 4));
    LODWORD(v114) = *((_DWORD *)v7 + 4);
  }
  v117 = 0;
  v118 = 0;
  v116 = 0;
  v9 = *((_DWORD *)v7 + 12);
  if (v9)
  {
    v10 = v7[7];
    v11 = google::protobuf::internal::RepeatedPtrFieldBase::InternalExtend((google::protobuf::internal::RepeatedPtrFieldBase *)&v116, *((_DWORD *)v7 + 12));
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFromInnerLoop<google::protobuf::RepeatedPtrField<CoreML::Specification::Coefficients>::TypeHandler>(&v116, (CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts **)v11, (CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts **)(v10 + 8), v9, *v118 - v117);
    v12 = v117 + v9;
    LODWORD(v117) = v12;
    if (*v118 < v12)
      *v118 = v12;
  }
  v119 = 0;
  v120 = 0;
  v13 = *((_DWORD *)v7 + 16);
  if (v13)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v119, v13);
    memcpy((void *)(v120 + 8), (const void *)(v7[9] + 8), 8 * *((int *)v7 + 16));
    LODWORD(v119) = *((_DWORD *)v7 + 16);
  }
  v121 = 0;
  v122 = 0;
  v14 = *((_DWORD *)v7 + 22);
  if (v14)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v121, v14);
    memcpy((void *)(v122 + 8), (const void *)(v7[12] + 8), 8 * *((int *)v7 + 22));
    LODWORD(v121) = *((_DWORD *)v7 + 22);
  }
  v123 = 0;
  v124 = 0;
  v15 = *((_DWORD *)v7 + 28);
  if (v15)
  {
    google::protobuf::RepeatedField<double>::Reserve((unsigned int *)&v123, v15);
    memcpy((void *)(v124 + 8), (const void *)(v7[15] + 8), 8 * *((int *)v7 + 28));
    LODWORD(v123) = *((_DWORD *)v7 + 28);
  }
  v128 = 0;
  v16 = v7[1];
  if ((v16 & 1) != 0)
    google::protobuf::internal::InternalMetadataWithArenaLite::DoMergeFrom(&v113, v16 & 0xFFFFFFFFFFFFFFFELL);
  v17 = 0;
  if (v7 != &CoreML::Specification::_SupportVectorClassifier_default_instance_ && v7[17])
  {
    v17 = (CoreML::Specification::Kernel *)operator new();
    CoreML::Specification::Kernel::Kernel(v17, (const CoreML::Specification::Kernel *)v7[17]);
  }
  v125 = v17;
  v129 = 0;
  v18 = *((_DWORD *)v7 + 41);
  if (v18 == 4)
  {
    v129 = 4;
    v22 = (CoreML::Specification::DenseSupportVectors *)operator new();
    v23 = CoreML::Specification::DenseSupportVectors::DenseSupportVectors(v22);
    v126 = v22;
    if (*((_DWORD *)v7 + 41) == 4)
    {
      v24 = (const CoreML::Specification::DenseSupportVectors *)v7[18];
    }
    else
    {
      CoreML::Specification::protobuf_SVM_2eproto::InitDefaults(v23);
      v24 = (const CoreML::Specification::DenseSupportVectors *)&CoreML::Specification::_DenseSupportVectors_default_instance_;
    }
    CoreML::Specification::DenseSupportVectors::MergeFrom((std::string *)v22, v24);
  }
  else if (v18 == 3)
  {
    v129 = 3;
    v19 = (CoreML::Specification::SparseSupportVectors *)operator new();
    v20 = CoreML::Specification::SparseSupportVectors::SparseSupportVectors(v19);
    v126 = v19;
    if (*((_DWORD *)v7 + 41) == 3)
    {
      v21 = (const CoreML::Specification::SparseSupportVectors *)v7[18];
    }
    else
    {
      CoreML::Specification::protobuf_SVM_2eproto::InitDefaults(v20);
      v21 = (const CoreML::Specification::SparseSupportVectors *)&CoreML::Specification::_SparseSupportVectors_default_instance_;
    }
    CoreML::Specification::SparseSupportVectors::MergeFrom((std::string *)v19, v21);
  }
  v130 = 0;
  v25 = *((_DWORD *)v7 + 42);
  if (v25 == 101)
  {
    v130 = 101;
    v29 = (CoreML::Specification::Int64Vector *)operator new();
    v30 = CoreML::Specification::Int64Vector::Int64Vector(v29);
    v127 = v29;
    if (*((_DWORD *)v7 + 42) == 101)
    {
      v31 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts *)v7[19];
    }
    else
    {
      CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(v30);
      v31 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts *)&CoreML::Specification::_Int64Vector_default_instance_;
    }
    CoreML::Specification::MILSpec::TensorValue_RepeatedLongInts::MergeFrom((uint64_t *)v29, v31);
  }
  else if (v25 == 100)
  {
    v130 = 100;
    v26 = (CoreML::Specification::StringVector *)operator new();
    v27 = CoreML::Specification::StringVector::StringVector(v26);
    v127 = v26;
    if (*((_DWORD *)v7 + 42) == 100)
    {
      v28 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *)v7[19];
    }
    else
    {
      CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults(v27);
      v28 = (const CoreML::Specification::MILSpec::TensorValue_RepeatedStrings *)&CoreML::Specification::_StringVector_default_instance_;
    }
    CoreML::Specification::MILSpec::TensorValue_RepeatedStrings::MergeFrom((std::string *)v26, v28);
  }
  if (v125)
    v32 = v125;
  else
    v32 = (const CoreML::Specification::Kernel *)&CoreML::Specification::_Kernel_default_instance_;
  CoreML::Specification::Kernel::Kernel((CoreML::Specification::Kernel *)v109, v32);
  v33 = 0;
  if (v111 == 2)
  {
    v34 = 0;
    v35 = *(_QWORD *)(v110 + 16);
    v36 = 2;
  }
  else if (v111 == 3)
  {
    v34 = *(_DWORD *)(v110 + 32);
    v33 = *(_QWORD *)(v110 + 16);
    v35 = *(_QWORD *)(v110 + 24);
    v36 = 1;
  }
  else
  {
    v34 = 0;
    if (v111 == 4)
    {
      v35 = *(_QWORD *)(v110 + 16);
      v33 = *(_QWORD *)(v110 + 24);
      v36 = 3;
    }
    else
    {
      v36 = 0;
      v35 = 0;
    }
  }
  v37 = (int *)malloc_type_malloc(0xB8uLL, 0x109004003BC950CuLL);
  *v37 = 0;
  v37[1] = v36;
  v37[2] = v34;
  *((_QWORD *)v37 + 2) = v35;
  *((_QWORD *)v37 + 3) = v33;
  *((_QWORD *)v37 + 19) = 0;
  v38 = malloc_type_malloc(8 * (int)v119, 0x100004000313F17uLL);
  *((_QWORD *)v37 + 16) = v38;
  v39 = v119;
  if ((int)v119 >= 1)
  {
    v40 = (uint64_t *)(v120 + 8);
    do
    {
      v41 = *v40++;
      *v38++ = v41;
      --v39;
    }
    while (v39);
  }
  if ((int)v121 <= 0)
  {
    *((_QWORD *)v37 + 17) = 0;
  }
  else
  {
    v42 = malloc_type_malloc(8 * v121, 0x100004000313F17uLL);
    *((_QWORD *)v37 + 17) = v42;
    v43 = v121;
    if ((int)v121 >= 1)
    {
      v44 = (uint64_t *)(v122 + 8);
      do
      {
        v45 = *v44++;
        *v42++ = v45;
        --v43;
      }
      while (v43);
    }
  }
  if ((int)v123 < 1)
  {
    *((_QWORD *)v37 + 18) = 0;
  }
  else
  {
    v46 = malloc_type_malloc(8 * v123, 0x100004000313F17uLL);
    *((_QWORD *)v37 + 18) = v46;
    v47 = v123;
    if ((int)v123 >= 1)
    {
      v48 = (uint64_t *)(v124 + 8);
      do
      {
        v49 = *v48++;
        *v46++ = v49;
        --v47;
      }
      while (v47);
    }
  }
  inited = (unint64_t *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = inited;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 401)
  {
    v52 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
    v52 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
  }
  v53 = *((_DWORD *)v52 + 42);
  switch(v53)
  {
    case 0:
      if (a4)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("class labels not set."));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (!v37)
        goto LABEL_149;
      goto LABEL_148;
    case 101:
      for (i = 0; ; ++i)
      {
        if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 401)
        {
          v63 = *(uint64_t **)(*(_QWORD *)a3 + 32);
        }
        else
        {
          inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
          v63 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
        }
        if (*((_DWORD *)v63 + 42) == 101)
        {
          v64 = (uint64_t *)v63[19];
        }
        else
        {
          inited = CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v64 = &CoreML::Specification::_Int64Vector_default_instance_;
        }
        if (i >= *((int *)v64 + 4))
          break;
        v65 = (void *)MEMORY[0x1E0CB37E8];
        if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 401)
        {
          v66 = *(uint64_t **)(*(_QWORD *)a3 + 32);
        }
        else
        {
          inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
          v66 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
        }
        if (*((_DWORD *)v66 + 42) == 101)
        {
          v67 = (uint64_t *)v66[19];
        }
        else
        {
          CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v67 = &CoreML::Specification::_Int64Vector_default_instance_;
        }
        objc_msgSend(v65, "numberWithLongLong:", *(_QWORD *)(v67[3] + 8 * i + 8));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObject:", v68);

      }
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 401)
      {
        v71 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
        v71 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
      }
      if (*((_DWORD *)v71 + 42) == 101)
      {
        v73 = (uint64_t *)v71[19];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
        v73 = &CoreML::Specification::_Int64Vector_default_instance_;
      }
      v69 = *((_DWORD *)v73 + 4);
      break;
    case 100:
      for (j = 0; ; ++j)
      {
        if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 401)
        {
          v55 = *(uint64_t **)(*(_QWORD *)a3 + 32);
        }
        else
        {
          inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
          v55 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
        }
        if (*((_DWORD *)v55 + 42) == 100)
        {
          v56 = (uint64_t *)v55[19];
        }
        else
        {
          inited = CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v56 = &CoreML::Specification::_StringVector_default_instance_;
        }
        if (j >= *((int *)v56 + 6))
          break;
        v57 = (void *)MEMORY[0x1E0CB3940];
        if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 401)
        {
          v58 = *(uint64_t **)(*(_QWORD *)a3 + 32);
        }
        else
        {
          inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
          v58 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
        }
        if (*((_DWORD *)v58 + 42) == 100)
        {
          v59 = (uint64_t *)v58[19];
        }
        else
        {
          CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
          v59 = &CoreML::Specification::_StringVector_default_instance_;
        }
        v60 = *(uint64_t **)(v59[4] + 8 * j + 8);
        if (*((char *)v60 + 23) < 0)
          v60 = (uint64_t *)*v60;
        objc_msgSend(v57, "stringWithUTF8String:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "addObject:", v61);

      }
      if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 401)
      {
        v70 = *(uint64_t **)(*(_QWORD *)a3 + 32);
      }
      else
      {
        inited = CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)inited);
        v70 = &CoreML::Specification::_SupportVectorClassifier_default_instance_;
      }
      if (*((_DWORD *)v70 + 42) == 100)
      {
        v72 = (uint64_t *)v70[19];
      }
      else
      {
        CoreML::Specification::protobuf_DataStructures_2eproto::InitDefaults((CoreML::Specification::protobuf_DataStructures_2eproto *)inited);
        v72 = &CoreML::Specification::_StringVector_default_instance_;
      }
      v69 = *((_DWORD *)v72 + 6);
      break;
    default:
      v69 = v37[26];
      goto LABEL_123;
  }
  v37[26] = v69;
LABEL_123:
  v74 = malloc_type_malloc(4 * v69, 0x100004052888210uLL);
  *((_QWORD *)v37 + 20) = v74;
  if (v37[26] >= 1)
  {
    v75 = 0;
    do
    {
      v74[v75] = v75;
      ++v75;
    }
    while (v75 < v37[26]);
  }
  v76 = v114;
  v77 = (CoreML::Specification::protobuf_SVM_2eproto *)malloc_type_malloc(4 * (int)v114, 0x100004052888210uLL);
  v78 = v76;
  *((_QWORD *)v37 + 21) = v77;
  if (v76 >= 1)
  {
    v79 = (int *)(v115 + 8);
    do
    {
      v80 = *v79++;
      *(_DWORD *)v77 = v80;
      v77 = (CoreML::Specification::protobuf_SVM_2eproto *)((char *)v77 + 4);
      --v78;
    }
    while (v78);
  }
  if (v129 == 3 || v129 == 4)
  {
    v81 = v126;
  }
  else
  {
    CoreML::Specification::protobuf_SVM_2eproto::InitDefaults(v77);
    v81 = (CoreML::Specification::SparseSupportVectors *)&CoreML::Specification::_SparseSupportVectors_default_instance_;
  }
  v82 = *((unsigned int *)v81 + 6);
  v37[27] = v82;
  if ((int)v82 <= 0)
  {
    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("SVM has invalid number of support vectors or clases"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_147:
      *a4 = v92;
    }
LABEL_148:
    svm_free_model_content((uint64_t)v37);
    free(v37);
LABEL_149:
    v93 = 0;
    goto LABEL_166;
  }
  *((_QWORD *)v37 + 14) = malloc_type_malloc(8 * v82, 0x2004093837F09uLL);
  switch(v129)
  {
    case 0:
      if (a4)
      {
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Internal error: support vectors not set."));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_147;
      }
      goto LABEL_148;
    case 3:
      CoreML::Specification::SparseSupportVectors::SparseSupportVectors((CoreML::Specification::SparseSupportVectors *)v107, v126);
      v94 = 0;
      v84 = -1;
      do
      {
        v95 = *(unsigned int *)(*(_QWORD *)(v108 + 8 * v94 + 8) + 24);
        v96 = (char *)malloc_type_malloc(16 * ((int)v95 + 1), 0x1000040F7F8B94BuLL);
        if ((int)v95 >= 1)
        {
          v97 = v96 + 8;
          v98 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(v108 + 8 * v94 + 8) + 32) + 8);
          v99 = v95;
          do
          {
            v100 = *v98++;
            *((_DWORD *)v97 - 2) = *(_DWORD *)(v100 + 24);
            *v97 = *(_QWORD *)(v100 + 16);
            v97 += 2;
            --v99;
          }
          while (v99);
        }
        v101 = &v96[16 * (int)v95];
        *(_DWORD *)v101 = -1;
        *((_QWORD *)v101 + 1) = 0x7FF8000000000000;
        if ((_DWORD)v95 && v84 <= *(int *)&v96[16 * (int)v95 - 16])
          v84 = *(int *)&v96[16 * (int)v95 - 16];
        *(_QWORD *)(*((_QWORD *)v37 + 14) + 8 * v94++) = v96;
      }
      while (v94 != v82);
      CoreML::Specification::SparseSupportVectors::~SparseSupportVectors((CoreML::Specification::SparseSupportVectors *)v107);
      v91 = 1;
      break;
    case 4:
      CoreML::Specification::DenseSupportVectors::DenseSupportVectors((CoreML::Specification::DenseSupportVectors *)v107, v126);
      v83 = 0;
      v84 = *(int *)(*(_QWORD *)(v108 + 8) + 16);
      do
      {
        v85 = *(unsigned int *)(*(_QWORD *)(v108 + 8 * v83 + 8) + 16);
        v86 = (char *)malloc_type_malloc(16 * ((int)v85 + 1), 0x1000040F7F8B94BuLL);
        if ((int)v85 >= 1)
        {
          v87 = 0;
          v88 = v86 + 8;
          v89 = *(_QWORD *)(*(_QWORD *)(v108 + 8 * v83 + 8) + 24) + 8;
          do
          {
            *((_DWORD *)v88 - 2) = v87 + 1;
            *v88 = *(_QWORD *)(v89 + 8 * v87);
            v88 += 2;
            ++v87;
          }
          while (v85 != v87);
        }
        v90 = &v86[16 * (int)v85];
        *(_DWORD *)v90 = -1;
        *((_QWORD *)v90 + 1) = 0x7FF8000000000000;
        *(_QWORD *)(*((_QWORD *)v37 + 14) + 8 * v83++) = v86;
      }
      while (v83 != v82);
      CoreML::Specification::DenseSupportVectors::~DenseSupportVectors((CoreML::Specification::DenseSupportVectors *)v107);
      v91 = 0;
      break;
    default:
      v91 = 0;
      v84 = 0;
      break;
  }
  *((_QWORD *)v37 + 15) = malloc_type_malloc(8 * (int)v117, 0x80040B8603338uLL);
  if ((int)v117 >= 1)
  {
    v102 = 0;
    do
    {
      v103 = malloc_type_malloc(8 * v82, 0x100004000313F17uLL);
      v104 = 0;
      v105 = *(_QWORD *)(*(_QWORD *)&v118[2 * v102 + 2] + 24) + 8;
      do
      {
        v103[v104] = *(_QWORD *)(v105 + 8 * v104);
        ++v104;
      }
      while (v82 != v104);
      *(_QWORD *)(*((_QWORD *)v37 + 15) + 8 * v102++) = v103;
    }
    while (v102 < (int)v117);
  }
  v37[44] = 0;
  v6 = -[MLSVMEngine initWithSVMModel:freeOnDealloc:isInputSizeLowerBoundOnly:inputSize:classLabels:](v6, "initWithSVMModel:freeOnDealloc:isInputSizeLowerBoundOnly:inputSize:classLabels:", v37, 1, v91, v84, v51);
  v93 = v6;
LABEL_166:

  CoreML::Specification::Kernel::~Kernel((CoreML::Specification::Kernel *)v109);
  CoreML::Specification::SupportVectorClassifier::~SupportVectorClassifier((CoreML::Specification::SupportVectorClassifier *)&v112);

  return v93;
}

- (svm_model)model
{
  return self->_model;
}

- (void)setModel:(svm_model *)a3
{
  self->_model = a3;
}

- (BOOL)freeModelOnDealloc
{
  return self->_freeModelOnDealloc;
}

- (void)setFreeModelOnDealloc:(BOOL)a3
{
  self->_freeModelOnDealloc = a3;
}

- (BOOL)isInputSizeLowerBoundOnly
{
  return self->_isInputSizeLowerBoundOnly;
}

- (void)setIsInputSizeLowerBoundOnly:(BOOL)a3
{
  self->_isInputSizeLowerBoundOnly = a3;
}

- (unint64_t)inputSize
{
  return self->_inputSize;
}

- (void)setInputSize:(unint64_t)a3
{
  self->_inputSize = a3;
}

- (NSArray)classLabels
{
  return self->_classLabels;
}

- (void)setClassLabels:(id)a3
{
  objc_storeStrong((id *)&self->_classLabels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classLabels, 0);
}

@end
