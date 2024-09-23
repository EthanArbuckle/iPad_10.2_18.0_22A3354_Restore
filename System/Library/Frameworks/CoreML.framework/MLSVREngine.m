@implementation MLSVREngine

- (MLSVREngine)initWithLibSVMFile:(id)a3
{
  id v4;
  char *model;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  unsigned int v11;
  int v12;
  int v13;
  MLSVREngine *v14;

  v4 = objc_retainAutorelease(a3);
  model = svm_load_model((const char *)objc_msgSend(v4, "UTF8String"));
  if (model)
  {
    v6 = *((unsigned int *)model + 27);
    if ((int)v6 < 1)
    {
      v8 = 0;
    }
    else
    {
      v7 = 0;
      LODWORD(v8) = 0;
      do
      {
        v9 = *(_QWORD *)(*((_QWORD *)model + 14) + 8 * v7);
        v10 = (int *)(v9 + 16);
        v11 = -1;
        do
        {
          v12 = *v10;
          v10 += 4;
          ++v11;
        }
        while (v12 != -1);
        v13 = *(_DWORD *)(v9 + 16 * v11);
        if ((int)v8 <= v13)
          v8 = v13;
        else
          v8 = v8;
        ++v7;
      }
      while (v7 != v6);
    }
    self = -[MLSVREngine initWithSVMModel:freeOnDealloc:isInputSizeLowerBoundOnly:inputSize:](self, "initWithSVMModel:freeOnDealloc:isInputSizeLowerBoundOnly:inputSize:", model, 1, 1, v8);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (MLSVREngine)initWithSVMModel:(svm_model *)a3 freeOnDealloc:(BOOL)a4 isInputSizeLowerBoundOnly:(BOOL)a5 inputSize:(unint64_t)a6
{
  MLSVREngine *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MLSVREngine;
  result = -[MLSVREngine init](&v11, sel_init);
  if (result)
  {
    result->_freeModelOnDealloc = a4;
    result->_isInputSizeLowerBoundOnly = a5;
    result->_inputSize = a6;
    result->_model = a3;
  }
  return result;
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
  v6.super_class = (Class)MLSVREngine;
  -[MLSVREngine dealloc](&v6, sel_dealloc);
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

  v11 = -[MLSVREngine allocSVMNodeVector:](self, "allocSVMNodeVector:", v6);
  v12 = [MLMultiArray alloc];
  v23[0] = &unk_1E3DA1EE8;
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
      -[MLSVREngine fillSVMNodeVector:values:count:](self, "fillSVMNodeVector:values:count:", v11, v17, v6);
      *v20++ = svm_predict((uint64_t)self->_model, (Kernel *)v11);
      v17 += 8 * v6;
      --v10;
    }
    while (v10);
  }
  -[MLSVREngine deallocSVMNodeVector:](self, "deallocSVMNodeVector:", v11);

  return v18;
}

- (MLSVREngine)initWithSpecification:(void *)a3 error:(id *)a4
{
  MLSVREngine *v5;
  uint64_t *v6;
  const CoreML::Specification::Kernel *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  char *v12;
  CoreML::Specification::protobuf_SVM_2eproto *v13;
  uint64_t *v14;
  uint64_t v15;
  size_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  MLSVREngine *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t *v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  _BYTE v42[32];
  uint64_t v43;
  _BYTE v44[16];
  uint64_t v45;
  int v46;

  v5 = self;
  if (*(_DWORD *)(*(_QWORD *)a3 + 44) == 301)
  {
    v6 = *(uint64_t **)(*(_QWORD *)a3 + 32);
  }
  else
  {
    CoreML::Specification::protobuf_SVM_2eproto::InitDefaults((CoreML::Specification::protobuf_SVM_2eproto *)self);
    v6 = &CoreML::Specification::_SupportVectorRegressor_default_instance_;
  }
  if (v6[2])
    v7 = (const CoreML::Specification::Kernel *)v6[2];
  else
    v7 = (const CoreML::Specification::Kernel *)&CoreML::Specification::_Kernel_default_instance_;
  CoreML::Specification::Kernel::Kernel((CoreML::Specification::Kernel *)v44, v7);
  v8 = 0;
  if (v46 == 2)
  {
    v9 = 0;
    v10 = *(_QWORD *)(v45 + 16);
    v11 = 2;
  }
  else if (v46 == 3)
  {
    v9 = *(_DWORD *)(v45 + 32);
    v8 = *(_QWORD *)(v45 + 16);
    v10 = *(_QWORD *)(v45 + 24);
    v11 = 1;
  }
  else
  {
    v9 = 0;
    if (v46 == 4)
    {
      v10 = *(_QWORD *)(v45 + 16);
      v8 = *(_QWORD *)(v45 + 24);
      v11 = 3;
    }
    else
    {
      v11 = 0;
      v10 = 0;
    }
  }
  v12 = (char *)malloc_type_malloc(0xB8uLL, 0x109004003BC950CuLL);
  *(_DWORD *)v12 = 4;
  *((_DWORD *)v12 + 1) = v11;
  *((_DWORD *)v12 + 2) = v9;
  *((_QWORD *)v12 + 2) = v10;
  *((_QWORD *)v12 + 3) = v8;
  *(_OWORD *)(v12 + 136) = 0u;
  *(_OWORD *)(v12 + 152) = 0u;
  *((_DWORD *)v12 + 26) = 2;
  *((_QWORD *)v12 + 21) = 0;
  v13 = (CoreML::Specification::protobuf_SVM_2eproto *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  *((_QWORD *)v12 + 16) = v13;
  *(_QWORD *)v13 = v6[4];
  if ((*((_DWORD *)v6 + 13) & 0xFFFFFFFE) == 2)
  {
    v14 = (uint64_t *)v6[5];
  }
  else
  {
    CoreML::Specification::protobuf_SVM_2eproto::InitDefaults(v13);
    v14 = &CoreML::Specification::_SparseSupportVectors_default_instance_;
  }
  v15 = *((int *)v14 + 6);
  *((_DWORD *)v12 + 27) = v15;
  v16 = 8 * v15;
  *((_QWORD *)v12 + 14) = malloc_type_malloc(8 * v15, 0x2004093837F09uLL);
  v17 = *((_DWORD *)v6 + 13);
  if (v17)
  {
    v18 = v15;
    if (v17 == 2)
    {
      CoreML::Specification::SparseSupportVectors::SparseSupportVectors((CoreML::Specification::SparseSupportVectors *)v42, (const CoreML::Specification::SparseSupportVectors *)v6[5]);
      if ((int)v15 < 1)
      {
        v19 = -1;
      }
      else
      {
        v29 = 0;
        v19 = -1;
        do
        {
          v30 = *(unsigned int *)(*(_QWORD *)(v43 + 8 * v29 + 8) + 24);
          v31 = (char *)malloc_type_malloc(16 * ((int)v30 + 1), 0x1000040F7F8B94BuLL);
          if ((int)v30 >= 1)
          {
            v32 = v31 + 8;
            v33 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(v43 + 8 * v29 + 8) + 32) + 8);
            v34 = v30;
            do
            {
              v35 = *v33++;
              *((_DWORD *)v32 - 2) = *(_DWORD *)(v35 + 24);
              *v32 = *(_QWORD *)(v35 + 16);
              v32 += 2;
              --v34;
            }
            while (v34);
          }
          v36 = &v31[16 * (int)v30];
          *(_DWORD *)v36 = -1;
          *((_QWORD *)v36 + 1) = 0x7FF8000000000000;
          if (v19 <= *(int *)&v31[16 * (int)v30 - 16])
            v19 = *(int *)&v31[16 * (int)v30 - 16];
          *(_QWORD *)(*((_QWORD *)v12 + 14) + 8 * v29++) = v31;
        }
        while (v29 != v18);
      }
      CoreML::Specification::SparseSupportVectors::~SparseSupportVectors((CoreML::Specification::SparseSupportVectors *)v42);
      v27 = 1;
    }
    else if (v17 == 3)
    {
      CoreML::Specification::DenseSupportVectors::DenseSupportVectors((CoreML::Specification::DenseSupportVectors *)v42, (const CoreML::Specification::DenseSupportVectors *)v6[5]);
      v19 = *(int *)(*(_QWORD *)(v43 + 8) + 16);
      if ((int)v15 >= 1)
      {
        v20 = 0;
        do
        {
          v21 = *(unsigned int *)(*(_QWORD *)(v43 + 8 * v20 + 8) + 16);
          v22 = (char *)malloc_type_malloc(16 * ((int)v21 + 1), 0x1000040F7F8B94BuLL);
          if ((int)v21 >= 1)
          {
            v23 = 0;
            v24 = v22 + 8;
            v25 = *(_QWORD *)(*(_QWORD *)(v43 + 8 * v20 + 8) + 24) + 8;
            do
            {
              *((_DWORD *)v24 - 2) = v23 + 1;
              *v24 = *(_QWORD *)(v25 + 8 * v23);
              v24 += 2;
              ++v23;
            }
            while (v21 != v23);
          }
          v26 = &v22[16 * (int)v21];
          *(_DWORD *)v26 = -1;
          *((_QWORD *)v26 + 1) = 0x7FF8000000000000;
          *(_QWORD *)(*((_QWORD *)v12 + 14) + 8 * v20++) = v22;
        }
        while (v20 != v18);
      }
      CoreML::Specification::DenseSupportVectors::~DenseSupportVectors((CoreML::Specification::DenseSupportVectors *)v42);
      v27 = 0;
    }
    else
    {
      v27 = 0;
      v19 = 0;
    }
    if (v6[3])
      v37 = (uint64_t *)v6[3];
    else
      v37 = &CoreML::Specification::_Coefficients_default_instance_;
    *((_QWORD *)v12 + 15) = malloc_type_malloc(8uLL, 0x80040B8603338uLL);
    **((_QWORD **)v12 + 15) = malloc_type_malloc(v16, 0x100004000313F17uLL);
    if ((int)v18 >= 1)
    {
      v38 = (_QWORD *)**((_QWORD **)v12 + 15);
      v39 = (uint64_t *)(v37[3] + 8);
      do
      {
        v40 = *v39++;
        *v38++ = v40;
        --v18;
      }
      while (v18);
    }
    *((_DWORD *)v12 + 44) = 0;
    v5 = -[MLSVREngine initWithSVMModel:freeOnDealloc:isInputSizeLowerBoundOnly:inputSize:](v5, "initWithSVMModel:freeOnDealloc:isInputSizeLowerBoundOnly:inputSize:", v12, 1, v27, v19);
    v28 = v5;
  }
  else
  {
    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Internal error: support vectors not set."));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    svm_free_model_content((uint64_t)v12);
    free(v12);
    v28 = 0;
  }
  CoreML::Specification::Kernel::~Kernel((CoreML::Specification::Kernel *)v44);

  return v28;
}

- (BOOL)isInputSizeLowerBoundOnly
{
  return self->_isInputSizeLowerBoundOnly;
}

- (unint64_t)inputSize
{
  return self->_inputSize;
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

@end
