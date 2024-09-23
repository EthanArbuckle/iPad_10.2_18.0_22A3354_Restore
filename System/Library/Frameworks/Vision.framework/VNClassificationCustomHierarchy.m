@implementation VNClassificationCustomHierarchy

- (VNClassificationCustomHierarchy)initWithOriginatingRequestSpecifier:(id)a3 detectionLevel:(unint64_t)a4
{
  id v7;
  VNClassificationCustomHierarchy *v8;
  VNClassificationCustomHierarchy *v9;
  NSDictionary *v10;
  NSDictionary *additionalRelationships;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNClassificationCustomHierarchy;
  v8 = -[VNClassificationCustomHierarchy init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_originatingRequestSpecifier, a3);
    v9->_originatingRequestDetectionLevel = a4;
    v10 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    additionalRelationships = v9->_additionalRelationships;
    v9->_additionalRelationships = v10;

  }
  return v9;
}

- (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)hierarchicalModelAndReturnError:(id *)a3
{
  ImageClassifier_HierarchicalModel **v3;
  VNClassificationCustomHierarchy *v4;
  ImageClassifier_HierarchicalModel **v5;
  ImageClassifier_HierarchicalModel *ptr;
  __shared_weak_count *v8;
  VNClassificationCustomHierarchy *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  int v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  __shared_weak_count *cntrl;
  unint64_t *v20;
  unint64_t v21;
  VNClassificationCustomHierarchy *v22;
  std::__shared_weak_count *v23;
  shared_ptr<vision::mod::ImageClassifier_HierarchicalModel> result;

  v4 = self;
  v5 = v3;
  ptr = self->_hierarchicalModel_DO_NOT_ACCESS_DIRECTLY.__ptr_;
  if (ptr)
  {
LABEL_21:
    cntrl = v4->_hierarchicalModel_DO_NOT_ACCESS_DIRECTLY.__cntrl_;
    *v5 = ptr;
    v5[1] = (ImageClassifier_HierarchicalModel *)cntrl;
    if (cntrl)
    {
      v20 = (unint64_t *)((char *)cntrl + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    goto LABEL_24;
  }
  -[VNClassificationCustomHierarchy newHierarchicalModelAndReturnError:](self, "newHierarchicalModelAndReturnError:");
  self = v22;
  if (v22
    && (self = (VNClassificationCustomHierarchy *)_addRelationshipsToHierarchicalModel((uint64_t **)v22, v4->_additionalRelationships, a3), (self & 1) != 0))
  {
    v9 = v22;
    v8 = (__shared_weak_count *)v23;
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v11 = __ldxr(p_shared_owners);
      while (__stxr(v11 + 1, p_shared_owners));
    }
    v12 = (std::__shared_weak_count *)v4->_hierarchicalModel_DO_NOT_ACCESS_DIRECTLY.__cntrl_;
    v4->_hierarchicalModel_DO_NOT_ACCESS_DIRECTLY.__ptr_ = (ImageClassifier_HierarchicalModel *)v9;
    v4->_hierarchicalModel_DO_NOT_ACCESS_DIRECTLY.__cntrl_ = v8;
    if (v12)
    {
      v13 = (unint64_t *)&v12->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = 1;
  }
  else
  {
    v15 = 0;
    *v5 = 0;
    v5[1] = 0;
  }
  v16 = v23;
  if (v23)
  {
    v17 = (unint64_t *)&v23->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  if (v15)
  {
    ptr = v4->_hierarchicalModel_DO_NOT_ACCESS_DIRECTLY.__ptr_;
    goto LABEL_21;
  }
LABEL_24:
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ImageClassifier_HierarchicalModel *)self;
  return result;
}

- (shared_ptr<vision::mod::ImageClassifier_HierarchicalModel>)newHierarchicalModelAndReturnError:(id *)a3
{
  _QWORD *v3;
  _QWORD *v4;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  shared_ptr<vision::mod::ImageClassifier_HierarchicalModel> result;

  v4 = v3;
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ must provide an implementation for %@"), v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[VNError errorForUnimplementedFunctionWithLocalizedDescription:](VNError, "errorForUnimplementedFunctionWithLocalizedDescription:", v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  *v4 = 0;
  v4[1] = 0;
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (ImageClassifier_HierarchicalModel *)self;
  return result;
}

- (BOOL)_addRelationships:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *additionalRelationships;
  BOOL v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  uint64_t **v22;
  std::__shared_weak_count *v23;

  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    v11 = 1;
    goto LABEL_17;
  }
  -[VNClassificationCustomHierarchy hierarchicalModelAndReturnError:](self, "hierarchicalModelAndReturnError:", a4);
  if (!v22)
    goto LABEL_11;
  if (!_addRelationshipsToHierarchicalModel(v22, v6, a4))
  {
    v21 = 0uLL;
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&self->_hierarchicalModel_DO_NOT_ACCESS_DIRECTLY, &v21);
    v12 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
    if (*((_QWORD *)&v21 + 1))
    {
      v13 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v7 = (void *)-[NSDictionary mutableCopy](self->_additionalRelationships, "mutableCopy");
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__VNClassificationCustomHierarchy__addRelationships_error___block_invoke;
  v19[3] = &unk_1E4547E08;
  v8 = v7;
  v20 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v19);
  v9 = (NSDictionary *)objc_msgSend(v8, "copy");
  additionalRelationships = self->_additionalRelationships;
  self->_additionalRelationships = v9;

  v11 = 1;
LABEL_12:
  v15 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
LABEL_17:

  return v11;
}

- (NSDictionary)relationships
{
  return self->_additionalRelationships;
}

- (VNClassificationCustomHierarchy)customHierarchyWithAdditionalParent:(id)a3 children:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "count"))
  {
    v13 = v8;
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNClassificationCustomHierarchy customHierarchyWithAdditionalRelationships:error:](self, "customHierarchyWithAdditionalRelationships:error:", v10, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", CFSTR("additional relationships must have at least one child identifier"));
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return (VNClassificationCustomHierarchy *)v11;
}

- (VNClassificationCustomHierarchy)customHierarchyWithAdditionalRelationships:(id)a3 error:(id *)a4
{
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  VNClassificationCustomHierarchy *v11;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = -[VNClassificationCustomHierarchy requestDetectionLevel](self, "requestDetectionLevel");
    v8 = objc_alloc((Class)objc_opt_class());
    -[VNClassificationCustomHierarchy originatingRequestSpecifier](self, "originatingRequestSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithOriginatingRequestSpecifier:detectionLevel:", v9, v7);

    if (v10)
    {
      if (objc_msgSend(v10, "_addRelationships:error:", v6, a4))
      {
        v11 = v10;
LABEL_9:

        goto LABEL_10;
      }
    }
    else if (a4)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v11 = 0;
    goto LABEL_9;
  }
  v11 = self;
LABEL_10:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[VNClassificationCustomHierarchy requestRevision](self, "requestRevision");
  -[VNClassificationCustomHierarchy relationships](self, "relationships");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VNClassificationCustomHierarchy *v4;
  VNClassificationCustomHierarchy *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (VNClassificationCustomHierarchy *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNClassificationCustomHierarchy requestRevision](self, "requestRevision");
      if (v6 == -[VNClassificationCustomHierarchy requestRevision](v5, "requestRevision"))
      {
        -[VNClassificationCustomHierarchy relationships](self, "relationships");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNClassificationCustomHierarchy relationships](v5, "relationships");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToDictionary:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNClassificationCustomHierarchy originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@, %@"), v5, v6, self->_additionalRelationships);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_originatingRequestSpecifier, CFSTR("Req"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_originatingRequestDetectionLevel, CFSTR("SCRDL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_additionalRelationships, CFSTR("AR"));

}

- (VNClassificationCustomHierarchy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  VNClassificationCustomHierarchy *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  VNClassificationCustomHierarchy *v14;
  void *v15;
  id v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Req"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VNClassificationCustomHierarchy initWithOriginatingRequestSpecifier:detectionLevel:](self, "initWithOriginatingRequestSpecifier:detectionLevel:", v5, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SCRDL")));
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("AR"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v17 = 0;
      v12 = -[VNClassificationCustomHierarchy _addRelationships:error:](v6, "_addRelationships:error:", v11, &v17);
      v13 = v17;
      if (v12)
      {
        v14 = v6;
      }
      else
      {
        objc_msgSend(v4, "failWithError:", v13);
        v14 = 0;
      }

    }
    else
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("could not decode additional relationships"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v15);

      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)requestDetectionLevel
{
  return self->_originatingRequestDetectionLevel;
}

- (NSString)requestClassName
{
  void *v2;
  void *v3;

  -[VNClassificationCustomHierarchy originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (Class)requestClassAndReturnError:(id *)a3
{
  void *v4;
  void *v5;

  -[VNClassificationCustomHierarchy originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestClassAndReturnError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (unint64_t)requestRevision
{
  void *v2;
  unint64_t v3;

  -[VNClassificationCustomHierarchy originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requestRevision");

  return v3;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_additionalRelationships, 0);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_hierarchicalModel_DO_NOT_ACCESS_DIRECTLY);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

void __59__VNClassificationCustomHierarchy__addRelationships_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v5, 1);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

}

+ (id)customHierarchyForRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _VNImageAnalyzerMultiDetectorClassificationCustomHierarchy *v10;

  v5 = a3;
  objc_msgSend(v5, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class()))
  {
    v7 = v5;
    v8 = objc_msgSend(v6, "requestRevision");
    if (v8 > 3737841663)
    {
      if (v8 != 3737841664)
      {
        if (v8 != 3737841665)
        {
LABEL_5:
          if (a4)
          {
            v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unable to determine classification hierarchy for a given request revision: %lu"), v8);
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v9);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_16;
        }
        goto LABEL_11;
      }
    }
    else if (v8 != 1)
    {
      if (v8 != 2)
        goto LABEL_5;
LABEL_11:
      v10 = (_VNImageAnalyzerMultiDetectorClassificationCustomHierarchy *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOriginatingRequestSpecifier:detectionLevel:", v6, objc_msgSend(v7, "detectionLevel"));
      goto LABEL_17;
    }
    if (!a4)
    {
LABEL_16:
      v10 = 0;
      goto LABEL_17;
    }
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:", v8, v7);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

    goto LABEL_18;
  }
  if (objc_msgSend(v6, "specifiesRequestClass:", objc_opt_class()))
  {
    v10 = -[VNClassificationCustomHierarchy initWithOriginatingRequestSpecifier:detectionLevel:]([_VNImageAnalyzerMultiDetectorClassificationCustomHierarchy alloc], "initWithOriginatingRequestSpecifier:detectionLevel:", v6, objc_msgSend(v5, "detectionLevel"));
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedConfigurationOfRequest:](VNError, "errorForUnsupportedConfigurationOfRequest:", v5);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_18:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
