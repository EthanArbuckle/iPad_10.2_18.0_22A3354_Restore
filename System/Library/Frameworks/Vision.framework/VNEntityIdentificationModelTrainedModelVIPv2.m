@implementation VNEntityIdentificationModelTrainedModelVIPv2

- (VNEntityIdentificationModelTrainedModelVIPv2)initWithFaceIDModel:(shared_ptr<vision:(id)a4 :(unint64_t)a5 mod:(id)a6 :(id)a7 FaceIDModel>)a3 entityPrintOriginatingRequestSpecifier:maximumElementsPerID:entityUniqueIdentifiers:entityPrintCounts:
{
  FaceIDModel *ptr;
  __shared_weak_count *v12;
  id v13;
  id v14;
  VNEntityIdentificationModelTrainedModelVIPv2 *v15;
  VNEntityIdentificationModelTrainedModelVIPv2 *v16;
  uint64_t v17;
  VNRequestSpecifier *entityPrintOriginatingRequestSpecifier;
  int v19;
  uint64_t v20;
  NSArray *entityUniqueIdentifiers;
  uint64_t v22;
  NSArray *entityPrintCounts;
  objc_super v25;

  ptr = a3.__ptr_;
  v12 = a3.__cntrl_;
  v13 = (id)a5;
  v14 = a6;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", objc_msgSend(v13, "count") == objc_msgSend(v14, "count"), CFSTR("entity unique identifier / print count mismatch"));
  v25.receiver = self;
  v25.super_class = (Class)VNEntityIdentificationModelTrainedModelVIPv2;
  v15 = -[VNEntityIdentificationModelTrainedModelVIPv2 init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    std::shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>::operator=[abi:ne180100](&v15->_faceIDModel.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
    v17 = -[__shared_weak_count copy](v12, "copy");
    entityPrintOriginatingRequestSpecifier = v16->_entityPrintOriginatingRequestSpecifier;
    v16->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v17;

    v19 = 0x7FFFFFFF;
    if ((unint64_t)a4 < 0x7FFFFFFF)
      v19 = (int)a4;
    v16->_maximumElementsPerID = v19;
    v20 = objc_msgSend(v13, "copy");
    entityUniqueIdentifiers = v16->_entityUniqueIdentifiers;
    v16->_entityUniqueIdentifiers = (NSArray *)v20;

    v22 = objc_msgSend(v14, "copy");
    entityPrintCounts = v16->_entityPrintCounts;
    v16->_entityPrintCounts = (NSArray *)v22;

  }
  return v16;
}

- (id)entityPrintOriginatingRequestSpecifier
{
  return self->_entityPrintOriginatingRequestSpecifier;
}

- (id)trainingEntityPrintsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSUInteger v7;
  int v9;
  void *IdentityTrainingData;
  vision::mod::ImageDescriptorBufferAbstract *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  id v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  void *v24;
  vision::mod::ImageDescriptorBufferAbstract *v25;
  std::__shared_weak_count *v26;

  v6 = a3;
  if (!self)
    goto LABEL_5;
  v7 = -[NSArray indexOfObject:](self->_entityUniqueIdentifiers, "indexOfObject:", v6);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      VNEntityIdentificationModelErrorForUnknownEntityUniqueIdentifier((uint64_t)v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_5:

    return 0;
  }
  v9 = v7 + 1;

  v25 = 0;
  v26 = 0;
  IdentityTrainingData = (void *)vision::mod::FaceIDModel::getIdentityTrainingData(self->_faceIDModel.__ptr_, v9, &v25);
  if (IdentityTrainingData == 128)
  {
    v11 = v25;
    v12 = *((_QWORD *)v25 + 9);
    if (v12)
    {
      -[VNEntityIdentificationModelTrainedModelVIPv2 entityPrintOriginatingRequestSpecifier](self, "entityPrintOriginatingRequestSpecifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v24, "requestClassAndReturnError:", a4);
      if (v13)
      {
        v14 = objc_msgSend(v24, "requestRevision");
        v15 = *((_QWORD *)v11 + 8);
        v16 = *((_QWORD *)v11 + 12);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
        v18 = 0;
        while (1)
        {
          objc_msgSend(v13, "createVNEntityIdentificationModelEntryPrintForRevision:fromDescriptorData:length:elementCount:error:", v14, vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v11, v18), v15, v16, a4);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
            break;
          objc_msgSend(v17, "addObject:", v19);

          if (v12 == ++v18)
          {
            v20 = v17;
            goto LABEL_19;
          }
        }
        v20 = 0;
LABEL_19:

      }
      else
      {
        v20 = 0;
      }

    }
    else
    {
      v20 = (id)MEMORY[0x1E0C9AA60];
    }
  }
  else if (a4)
  {
    VNErrorForCVMLStatus(IdentityTrainingData);
    v20 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v21 = v26;
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v23 = __ldaxr(p_shared_owners);
    while (__stlxr(v23 - 1, p_shared_owners));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  return v20;
}

- (id)predictionsForObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6
{
  id v10;
  VNCanceller *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  _QWORD **v30;
  uint64_t *v31;
  void (**v32)(vision::mod::ImageDescriptorBufferFloat32 *__hidden);
  _QWORD v33[3];
  uint64_t v34[3];
  __int128 v35;
  __int128 v36;
  char v37;
  __int128 v38;
  void *v39;
  unint64_t v40;
  _QWORD *v41;
  _QWORD **v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  uint64_t (*v45)();
  const char *v46;
  uint64_t (**v47)(vision::mod::CVMLCanceller *__hidden);
  char v48;
  int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  void (**v62)(vision::mod::ImageDescriptorBufferFloat32 *__hidden);
  const void *v63;
  uint64_t v64;
  _BYTE v65[40];
  __int128 v66;
  char v67;
  __int128 v68;
  void *v69;

  v10 = a3;
  v11 = (VNCanceller *)a5;
  -[VNEntityIdentificationModelTrainedModelVIPv2 entityPrintOriginatingRequestSpecifier](self, "entityPrintOriginatingRequestSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (+[VNEntityIdentificationModel validateAceptableObservation:forEntityPrintOriginatingRequestSpecifier:error:](VNEntityIdentificationModel, "validateAceptableObservation:forEntityPrintOriginatingRequestSpecifier:error:", v10, v12, a6))
    {
      objc_msgSend(v10, "VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:error:", v12, a6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v13)
      {
        v20 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v23 = v13;
      objc_msgSend(v13, "VNEntityIdentificationModelPrintData");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v15 = operator new(8uLL);
      *v15 = 1;
      v42 = (_QWORD **)(v15 + 1);
      v43 = (uint64_t)(v15 + 1);
      v41 = v15;
      v25 = objc_retainAutorelease(v24);
      v16 = (void *)objc_msgSend(v25, "bytes");
      v17 = objc_msgSend(v25, "length");
      vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)&v62, &v41, v16, v17, 1, 0);
      DWORD2(v68) = 1;
      v69 = 0;
      v62 = &off_1E453A8D0;
      *(_QWORD *)&v68 = v17 >> 2;
      operator delete(v15);
      if (!v11)
        v11 = objc_alloc_init(VNCanceller);
      v56 = 0;
      v57 = &v56;
      v58 = 0x3032000000;
      v59 = __Block_byref_object_copy__33;
      v60 = __Block_byref_object_dispose__34;
      v61 = 0;
      v50 = 0;
      v51 = &v50;
      v52 = 0x3032000000;
      v53 = __Block_byref_object_copy__33;
      v54 = __Block_byref_object_dispose__34;
      v55 = 0;
      v41 = 0;
      v42 = &v41;
      v43 = 0x4012000000;
      v44 = __Block_byref_object_copy__25215;
      v45 = __Block_byref_object_dispose__25216;
      v46 = "";
      v47 = &off_1E453A1B8;
      v49 = -1;
      v48 = 0;
      v18 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3321888768;
      v27[2] = __96__VNEntityIdentificationModelTrainedModelVIPv2_predictionsForObservation_limit_canceller_error___block_invoke;
      v27[3] = &unk_1E453C168;
      v29 = &v56;
      v27[4] = self;
      v28 = v10;
      memset(v33, 0, sizeof(v33));
      std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(v33, v63, v64, (v64 - (uint64_t)v63) >> 3);
      std::map<long long,int>::map[abi:ne180100](v34, (uint64_t)v65);
      v35 = *(_OWORD *)&v65[24];
      v36 = v66;
      v37 = v67;
      v38 = v68;
      v39 = v69;
      v40 = a4;
      v30 = &v41;
      v31 = &v50;
      v32 = &off_1E453A8D0;
      v26[0] = v18;
      v26[1] = 3221225472;
      v26[2] = __96__VNEntityIdentificationModelTrainedModelVIPv2_predictionsForObservation_limit_canceller_error___block_invoke_39;
      v26[3] = &unk_1E4548FA8;
      v26[4] = &v41;
      if (-[VNCanceller tryToPerformBlock:usingSignallingBlock:](v11, "tryToPerformBlock:usingSignallingBlock:", v27, v26))
      {
        v19 = (void *)v57[5];
        if (v19)
        {
          v20 = v19;
LABEL_18:
          v32 = &off_1E453A8D0;
          free(v39);
          vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract((void **)&v32);

          _Block_object_dispose(&v41, 8);
          _Block_object_dispose(&v50, 8);

          _Block_object_dispose(&v56, 8);
          v62 = &off_1E453A8D0;
          free(v69);
          vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract((void **)&v62);

          v14 = v23;
          goto LABEL_19;
        }
        if (a6)
        {
          v21 = objc_retainAutorelease((id)v51[5]);
          goto LABEL_16;
        }
      }
      else if (a6)
      {
        VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(4, CFSTR("operation was cancelled"), 0);
        v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
        v20 = 0;
        *a6 = v21;
        goto LABEL_18;
      }
      v20 = 0;
      goto LABEL_18;
    }
    v20 = 0;
  }
  else
  {
    v20 = (id)MEMORY[0x1E0C9AA60];
  }
LABEL_20:

  return v20;
}

- (unint64_t)entityCount
{
  return -[NSArray count](self->_entityUniqueIdentifiers, "count");
}

- (id)entityUniqueIdentifiers
{
  return self->_entityUniqueIdentifiers;
}

- (id)uniqueIdentifierOfEntityAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_entityUniqueIdentifiers, "objectAtIndex:", a3);
}

- (unint64_t)indexOfEntityWithUniqueIdentifier:(id)a3
{
  return -[NSArray indexOfObject:](self->_entityUniqueIdentifiers, "indexOfObject:", a3);
}

- (unint64_t)printCountForEntityWithUniqueIdentifier:(id)a3
{
  id v4;
  NSUInteger v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  v5 = -[NSArray indexOfObject:](self->_entityUniqueIdentifiers, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_entityPrintCounts, "objectAtIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "unsignedIntegerValue");

  }
  return v6;
}

- (id)printCountsForEntitiesWithUniqueIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *entityUniqueIdentifiers;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  VNEntityIdentificationModelTrainedModelVIPv2 *v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v4);
  entityUniqueIdentifiers = self->_entityUniqueIdentifiers;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__VNEntityIdentificationModelTrainedModelVIPv2_printCountsForEntitiesWithUniqueIdentifiers___block_invoke;
  v12[3] = &unk_1E4547570;
  v13 = v6;
  v8 = v5;
  v14 = v8;
  v15 = self;
  v9 = v6;
  -[NSArray enumerateObjectsUsingBlock:](entityUniqueIdentifiers, "enumerateObjectsUsingBlock:", v12);
  v10 = v8;

  return v10;
}

- (id)printCountsForAllEntities
{
  void *v3;
  NSArray *entityUniqueIdentifiers;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  VNEntityIdentificationModelTrainedModelVIPv2 *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](self->_entityUniqueIdentifiers, "count"));
  entityUniqueIdentifiers = self->_entityUniqueIdentifiers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__VNEntityIdentificationModelTrainedModelVIPv2_printCountsForAllEntities__block_invoke;
  v8[3] = &unk_1E4547598;
  v5 = v3;
  v9 = v5;
  v10 = self;
  -[NSArray enumerateObjectsUsingBlock:](entityUniqueIdentifiers, "enumerateObjectsUsingBlock:", v8);
  v6 = v5;

  return v6;
}

- (VNEntityIdentificationModelTrainedModelVIPv2)initWithCoder:(id)a3
{
  id v4;
  VNEntityIdentificationModelTrainedModelVIPv2 *v5;
  uint64_t v6;
  NSArray *entityUniqueIdentifiers;
  uint64_t v8;
  NSArray *entityPrintCounts;
  uint64_t v10;
  uint64_t v11;
  VNRequestSpecifier *entityPrintOriginatingRequestSpecifier;
  int v13;
  id v14;
  uint64_t *p_faceIDModel;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  void *v20;
  NSData *v21;
  void *v22;
  int v23;
  void *v24;
  VNEntityIdentificationModelTrainedModelVIPv2 *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  std::ios_base v33;
  uint64_t v34;
  int v35;
  _BYTE __sb[64];
  id v37;
  id v38;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)VNEntityIdentificationModelTrainedModelVIPv2;
  v5 = -[VNEntityIdentificationModelTrainedModelVIPv2 init](&v39, sel_init);
  if (!v5)
    goto LABEL_19;
  objc_msgSend(v4, "vn_decodeEntityUniqueIdentifierArrayForKey:", CFSTR("entityUniqueIdentifiers"));
  v6 = objc_claimAutoreleasedReturnValue();
  entityUniqueIdentifiers = v5->_entityUniqueIdentifiers;
  v5->_entityUniqueIdentifiers = (NSArray *)v6;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("entityPrintCounts"));
  v8 = objc_claimAutoreleasedReturnValue();
  entityPrintCounts = v5->_entityPrintCounts;
  v5->_entityPrintCounts = (NSArray *)v8;

  v10 = -[NSArray count](v5->_entityUniqueIdentifiers, "count");
  if (v10 != -[NSArray count](v5->_entityPrintCounts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entity unique identifier counts (%lu) do not agree with the print counts (%lu)"), -[NSArray count](v5->_entityUniqueIdentifiers, "count"), -[NSArray count](v5->_entityPrintCounts, "count"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v14, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v24);

LABEL_15:
    goto LABEL_16;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityPrintOriginatingRequestSpecifier"));
  v11 = objc_claimAutoreleasedReturnValue();
  entityPrintOriginatingRequestSpecifier = v5->_entityPrintOriginatingRequestSpecifier;
  v5->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v11;

  v13 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("maximumElementsPerID"));
  v5->_maximumElementsPerID = v13;
  v38 = 0;
  _newFaceIDModel(&v32, v13, (uint64_t)&v38);
  v14 = v38;
  p_faceIDModel = (uint64_t *)&v5->_faceIDModel;
  v16 = std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)&v5->_faceIDModel, &v32);
  v17 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
  if (*((_QWORD *)&v32 + 1))
  {
    v18 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (!*p_faceIDModel)
  {
    objc_msgSend(v4, "failWithError:", v14);
    goto LABEL_15;
  }
  v20 = (void *)MEMORY[0x1A1B0B060](v16);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceIDModel"));
  v21 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
LABEL_12:
    v23 = 1;
    goto LABEL_18;
  }
  VNNSDataStreambuf::VNNSDataStreambuf((VNNSDataStreambuf *)__sb, v21);
  v33.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E0DE4F98] + 64);
  v32 = (unint64_t)(MEMORY[0x1E0DE4F98] + 24);
  std::ios_base::init(&v33, __sb);
  v34 = 0;
  v35 = -1;
  v22 = (void *)vision::mod::FaceIDModel::deserialize(*p_faceIDModel);
  if (v22 == 128)
  {
    std::istream::~istream();

    std::streambuf::~streambuf();
    goto LABEL_12;
  }
  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("Face ID model data deserialization failed with code %@"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  VNErrorForCVMLStatus(v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v30);

  std::istream::~istream();
  std::streambuf::~streambuf();
  v23 = 0;
LABEL_18:

  objc_autoreleasePoolPop(v20);
  if (v23)
  {
LABEL_19:
    v25 = v5;
    goto LABEL_20;
  }
LABEL_16:
  v25 = 0;
LABEL_20:

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  std::ios_base v8;
  uint64_t v9;
  int v10;
  _BYTE __sb[64];
  id v12;

  v4 = a3;
  objc_msgSend(v4, "vn_encodeEntityUniqueIdentifierArray:forKey:", self->_entityUniqueIdentifiers, CFSTR("entityUniqueIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_entityPrintCounts, CFSTR("entityPrintCounts"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_entityPrintOriginatingRequestSpecifier, CFSTR("entityPrintOriginatingRequestSpecifier"));
  v5 = (void *)MEMORY[0x1A1B0B060](objc_msgSend(v4, "encodeInt:forKey:", self->_maximumElementsPerID, CFSTR("maximumElementsPerID")));
  VNNSMutableDataStreambuf::VNNSMutableDataStreambuf((VNNSMutableDataStreambuf *)__sb);
  v8.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E0DE4FA0] + 64);
  std::ios_base::init(&v8, __sb);
  v9 = 0;
  v10 = -1;
  v6 = (void *)vision::mod::FaceIDModel::serialize(self->_faceIDModel.__ptr_);
  if (v6 == 128)
  {
    std::ostream::flush();
    v7 = v12;
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("faceIDModel"));
  }
  else
  {
    VNErrorForCVMLStatus(v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v7);
  }

  std::ostream::~ostream();
  std::streambuf::~streambuf();
  objc_autoreleasePoolPop(v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityPrintCounts, 0);
  objc_storeStrong((id *)&self->_entityUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_entityPrintOriginatingRequestSpecifier, 0);
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_faceIDModel);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

void __73__VNEntityIdentificationModelTrainedModelVIPv2_printCountsForAllEntities__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __92__VNEntityIdentificationModelTrainedModelVIPv2_printCountsForEntitiesWithUniqueIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);

    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v8);
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
      *a4 = 1;
  }

}

void __96__VNEntityIdentificationModelTrainedModelVIPv2_predictionsForObservation_limit_canceller_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  double **v10;
  double **v11;
  double *v12;
  uint64_t v13;
  void *v14;
  double v15;
  VNEntityIdentificationModelPrediction *v16;
  double v17;
  VNEntityIdentificationModelPrediction *v18;
  double *v19;
  double **v20;
  BOOL v21;
  id v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  double **i;
  void *v30;
  id v31;
  double **v32;
  double **v33;
  uint64_t v34;
  double ***v35;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 192);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  v31 = *(id *)(a1 + 40);
  if (v2)
  {
    if (objc_msgSend(*(id *)(v2 + 40), "count"))
    {
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v8 = (void *)vision::mod::FaceIDModel::predict(*(_QWORD *)(v2 + 8), (_QWORD *)(a1 + 72), (uint64_t *)&v32);
      if (v8 == 128)
      {
        v28 = v3;
        v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v30 = (void *)objc_msgSend(v9, "initWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (v33 - v32));
        v11 = v32;
        v10 = v33;
        for (i = v33; ; v10 = i)
        {
          if (v11 == v10)
          {
            v23 = v30;
            objc_msgSend(v30, "sortUsingComparator:", &__block_literal_global_25220);
            if (v28)
            {
              v24 = objc_msgSend(v30, "count");
              if (v24 > v28)
                objc_msgSend(v30, "removeObjectsInRange:", v28, v24 - v28);
            }
            v22 = v30;
            goto LABEL_27;
          }
          v12 = *v11;
          if (*v11 != (double *)(v11 + 1))
            break;
LABEL_17:
          v11 += 3;
        }
        while (1)
        {
          v13 = *((unsigned int *)v12 + 8);
          if ((int)v13 < 1 || v13 - 1 >= (unint64_t)objc_msgSend(*(id *)(v2 + 40), "count"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No entity for identity serial number %d"), v13);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v30;
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v25);
            v6 = (id)objc_claimAutoreleasedReturnValue();

            v22 = 0;
            goto LABEL_27;
          }
          objc_msgSend(*(id *)(v2 + 40), "objectAtIndex:");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v14)
            break;
          v15 = v12[5];
          v16 = [VNEntityIdentificationModelPrediction alloc];
          *(float *)&v17 = v15;
          v18 = -[VNEntityIdentificationModelPrediction initWithObservation:entityUniqueIdentifier:confidence:](v16, "initWithObservation:entityUniqueIdentifier:confidence:", v31, v14, v17);
          if (!v18)
          {
            +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
            v6 = (id)objc_claimAutoreleasedReturnValue();

            break;
          }
          objc_msgSend(v30, "addObject:", v18);

          v19 = (double *)*((_QWORD *)v12 + 1);
          if (v19)
          {
            do
            {
              v20 = (double **)v19;
              v19 = *(double **)v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              v20 = (double **)*((_QWORD *)v12 + 2);
              v21 = *v20 == v12;
              v12 = (double *)v20;
            }
            while (!v21);
          }
          v12 = (double *)v20;
          if (v20 == v11 + 1)
            goto LABEL_17;
        }
        v22 = 0;
        v23 = v30;
LABEL_27:

      }
      else
      {
        VNErrorForCVMLStatus(v8);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        v22 = 0;
      }
      v35 = &v32;
      std::vector<std::map<int,double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
    }
    else
    {
      v22 = (id)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v22 = 0;
  }

  objc_storeStrong(v5, v6);
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v22;

}

uint64_t __96__VNEntityIdentificationModelTrainedModelVIPv2_predictionsForObservation_limit_canceller_error___block_invoke_39(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56) = 1;
  return result;
}

uint64_t __129__VNEntityIdentificationModelTrainedModelVIPv2__predictionsForObservation_withEntityPrintDescriptor_limit_faceIDCanceller_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v5, "confidence");
  if (v7 <= v8)
  {
    if (v7 < v8)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v4, "entityUniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "entityUniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v11, "compare:", v13);
    }
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5
{
  *a3 = 1953326188;
  return 1;
}

+ (id)trainedModelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
{
  id v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  size_t v26;
  int v27;
  _QWORD *v28;
  void *v29;
  __int128 v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  unint64_t v39;
  void *v40;
  void *v41;
  vision::mod::ImageDescriptorBufferAbstract *v42;
  void *DataForKthDescriptor;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  int v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t *p_shared_owners;
  unint64_t v61;
  unint64_t *v62;
  unint64_t v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  std::__shared_weak_count *v86;
  unint64_t *v87;
  unint64_t v88;
  id v89;
  unint64_t *v90;
  unint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  uint64_t v95;
  void *v96;
  void *context;
  char *v98;
  void *v100;
  void *v101;
  void *v103;
  void *v104;
  VNCanceller *v105;
  void *v106;
  id v107;
  uint64_t v108;
  std::__shared_weak_count *v109;
  size_t __n;
  id v111;
  __int128 v112;
  unint64_t v113;
  uint64_t v114;
  std::__shared_weak_count *v115;
  _QWORD v116[5];
  _QWORD v117[7];
  std::__shared_weak_count *v118;
  uint64_t v119;
  std::__shared_weak_count *v120;
  void *__p;
  void *v122;
  uint64_t v123;
  __int128 v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  _QWORD *v129;
  _QWORD **v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  uint64_t (*v133)();
  const char *v134;
  uint64_t (**v135)(vision::mod::CVMLCanceller *__hidden);
  char v136;
  int v137;
  uint64_t v138;
  std::__shared_weak_count *v139;
  __int128 v140;
  id v141;
  __int128 v142;

  v8 = a3;
  v107 = a4;
  v105 = (VNCanceller *)a5;
  v101 = v8;
  if (!v105)
    v105 = objc_alloc_init(VNCanceller);
  objc_msgSend(v8, "entityPrintOriginatingRequestSpecifier");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (char *)objc_msgSend(v107, "trainedModelEntityCount");
  v142 = 0uLL;
  v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
  v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
  if (!v9)
  {
    v10 = 0;
LABEL_67:
    v57 = objc_msgSend(v101, "faceIDModelMaximumElementsPerID");
    _newFaceIDModel(&v138, v57, (uint64_t)a6);
    if (!v138)
      goto LABEL_100;
    v58 = v142;
    if ((_QWORD)v142)
    {
      v129 = 0;
      v130 = &v129;
      v131 = 0x4012000000;
      v132 = __Block_byref_object_copy__25215;
      v133 = __Block_byref_object_dispose__25216;
      v134 = "";
      v135 = &off_1E453A1B8;
      v137 = -1;
      v136 = 0;
      *(_QWORD *)&v124 = 0;
      *((_QWORD *)&v124 + 1) = &v124;
      v125 = 0x3032000000;
      v126 = __Block_byref_object_copy__33;
      v127 = __Block_byref_object_dispose__34;
      v128 = 0;
      v59 = MEMORY[0x1E0C809B0];
      v117[0] = MEMORY[0x1E0C809B0];
      v117[1] = 3321888768;
      v117[2] = __112__VNEntityIdentificationModelTrainedModelVIPv2_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke;
      v117[3] = &unk_1E453C0F8;
      v117[6] = v138;
      v118 = v139;
      if (v139)
      {
        p_shared_owners = (unint64_t *)&v139->__shared_owners_;
        do
          v61 = __ldxr(p_shared_owners);
        while (__stxr(v61 + 1, p_shared_owners));
      }
      v119 = v58;
      v120 = (std::__shared_weak_count *)*((_QWORD *)&v142 + 1);
      if (*((_QWORD *)&v142 + 1))
      {
        v62 = (unint64_t *)(*((_QWORD *)&v142 + 1) + 8);
        do
          v63 = __ldxr(v62);
        while (__stxr(v63 + 1, v62));
      }
      __p = 0;
      v122 = 0;
      v123 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v10, (uint64_t)v9, (v9 - v10) >> 2);
      v117[4] = &v129;
      v117[5] = &v124;
      v116[0] = v59;
      v116[1] = 3221225472;
      v116[2] = __112__VNEntityIdentificationModelTrainedModelVIPv2_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_36;
      v116[3] = &unk_1E4548FA8;
      v116[4] = &v129;
      if (!-[VNCanceller tryToPerformBlock:usingSignallingBlock:](v105, "tryToPerformBlock:usingSignallingBlock:", v117, v116))
      {
        if (a6)
        {
          VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(4, CFSTR("operation was cancelled"), 0);
          v65 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_86;
        }
LABEL_87:
        if (__p)
        {
          v122 = __p;
          operator delete(__p);
        }
        v70 = v120;
        if (v120)
        {
          v71 = (unint64_t *)&v120->__shared_owners_;
          do
            v72 = __ldaxr(v71);
          while (__stlxr(v72 - 1, v71));
          if (!v72)
          {
            ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
            std::__shared_weak_count::__release_weak(v70);
          }
        }
        v73 = v118;
        if (v118)
        {
          v74 = (unint64_t *)&v118->__shared_owners_;
          do
            v75 = __ldaxr(v74);
          while (__stlxr(v75 - 1, v74));
          if (!v75)
          {
            ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
            std::__shared_weak_count::__release_weak(v73);
          }
        }
        _Block_object_dispose(&v124, 8);

        _Block_object_dispose(&v129, 8);
LABEL_100:
        v69 = 0;
LABEL_101:
        v76 = v139;
        if (v139)
        {
          v77 = (unint64_t *)&v139->__shared_owners_;
          do
            v78 = __ldaxr(v77);
          while (__stlxr(v78 - 1, v77));
          if (!v78)
          {
            ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
            std::__shared_weak_count::__release_weak(v76);
          }
        }
        goto LABEL_108;
      }
      v64 = *(void **)(*((_QWORD *)&v124 + 1) + 40);
      if (v64)
      {
        if (a6)
        {
          v65 = objc_retainAutorelease(v64);
LABEL_86:
          *a6 = v65;
          goto LABEL_87;
        }
        goto LABEL_87;
      }
      if (__p)
      {
        v122 = __p;
        operator delete(__p);
      }
      v83 = v120;
      if (v120)
      {
        v84 = (unint64_t *)&v120->__shared_owners_;
        do
          v85 = __ldaxr(v84);
        while (__stlxr(v85 - 1, v84));
        if (!v85)
        {
          ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
          std::__shared_weak_count::__release_weak(v83);
        }
      }
      v86 = v118;
      if (v118)
      {
        v87 = (unint64_t *)&v118->__shared_owners_;
        do
          v88 = __ldaxr(v87);
        while (__stlxr(v88 - 1, v87));
        if (!v88)
        {
          ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
          std::__shared_weak_count::__release_weak(v86);
        }
      }
      _Block_object_dispose(&v124, 8);

      _Block_object_dispose(&v129, 8);
    }
    v89 = objc_alloc((Class)a1);
    v114 = v138;
    v115 = v139;
    if (v139)
    {
      v90 = (unint64_t *)&v139->__shared_owners_;
      do
        v91 = __ldxr(v90);
      while (__stxr(v91 + 1, v90));
    }
    v69 = (void *)objc_msgSend(v89, "initWithFaceIDModel:entityPrintOriginatingRequestSpecifier:maximumElementsPerID:entityUniqueIdentifiers:entityPrintCounts:", &v114, v106, v57, v104, v103);
    v92 = v115;
    if (v115)
    {
      v93 = (unint64_t *)&v115->__shared_owners_;
      do
        v94 = __ldaxr(v93);
      while (__stlxr(v94 - 1, v93));
      if (!v94)
      {
        ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
        std::__shared_weak_count::__release_weak(v92);
      }
    }
    goto LABEL_101;
  }
  v98 = v9;
  v10 = 0;
  v9 = 0;
  v113 = 0;
  v11 = 0;
  while (!-[VNCanceller wasSignalled](v105, "wasSignalled"))
  {
    objc_msgSend(v107, "trainedModelUniqueIdentifierOfEntityAtIndex:", v11);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "addObject:", v100);
    v12 = objc_msgSend(v107, "trainedModelNumberOfObservationsForEntityAtIndex:", v11);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "addObject:", v13);

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
    if (v12)
    {
      v15 = 0;
      while (1)
      {
        objc_msgSend(v107, "trainedModelObservationAtIndex:forEntityAtIndex:", v15, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (!v16 || (VNEntityIdentificationModelObservationConformingObject(v16) & 1) == 0)
          break;
        v141 = 0;
        objc_msgSend(v17, "VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:error:", v106, &v141);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v141;
        if (!v18)
        {
          if (a6)
          {
            v66 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v17, "originatingRequestSpecifier");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "stringWithFormat:", CFSTR("entity index %lu, observation index %lu was generated by %@, which is not compatible with the model requirement of %@"), v11, v15, v67, v106);
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v68, v19);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_81;
        }
        objc_msgSend(v14, "addObject:", v18);

        if (v12 == ++v15)
          goto LABEL_12;
      }
      if (!a6)
        goto LABEL_82;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid observation at index %lu for entity at index %lu"), v15, v11);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v19);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_81:

LABEL_82:
      goto LABEL_83;
    }
LABEL_12:
    context = (void *)MEMORY[0x1A1B0B060]();
    v21 = (std::__shared_weak_count *)*((_QWORD *)&v142 + 1);
    v20 = v142;
    v140 = v142;
    if (*((_QWORD *)&v142 + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&v142 + 1) + 8);
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }
    v24 = v14;
    v111 = v24;
    objc_opt_self();
    v25 = objc_msgSend(v24, "count");
    if (v25)
    {
      objc_msgSend(v24, "firstObject");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v96, "VNEntityIdentificationModelPrintByteLength");
      v109 = v21;
      if (v20)
      {
        v27 = *(_DWORD *)(v20 + 72);
      }
      else
      {
        v28 = operator new(8uLL);
        *v28 = 1;
        v130 = (_QWORD **)(v28 + 1);
        v131 = (uint64_t)(v28 + 1);
        v129 = v28;
        v29 = malloc_type_malloc(v26, 0x5687EFB9uLL);
        std::allocate_shared[abi:ne180100]<vision::mod::ImageDescriptorBufferFloat32,std::allocator<vision::mod::ImageDescriptorBufferFloat32>,std::vector<long long> &,void *,unsigned long const&,int,BOOL,void>((uint64_t *)&v124, &v129, v29, v26, 1, 1);
        v30 = v124;
        v124 = 0uLL;
        v140 = v30;
        if (v21)
        {
          v31 = (unint64_t *)&v21->__shared_owners_;
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }
        v33 = (std::__shared_weak_count *)*((_QWORD *)&v124 + 1);
        if (*((_QWORD *)&v124 + 1))
        {
          v34 = (unint64_t *)(*((_QWORD *)&v124 + 1) + 8);
          do
            v35 = __ldaxr(v34);
          while (__stlxr(v35 - 1, v34));
          if (!v35)
          {
            ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
            std::__shared_weak_count::__release_weak(v33);
          }
        }
        if (v129)
          operator delete(v129);
        v27 = 0;
        v20 = v140;
      }
      __n = v26;
      v108 = v25;
      v36 = v25 + v27;
      vision::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount((vision::mod::ImageDescriptorBufferAbstract *)v20, v36, v27 > 0);
      std::vector<long long>::resize((char **)(v20 + 8), v36);
      v37 = 0;
      v95 = v11;
      v38 = v11 + 1;
      v39 = v27;
      do
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", v37);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "VNEntityIdentificationModelPrintData");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (vision::mod::ImageDescriptorBufferAbstract *)v140;
        DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor((vision::mod::ImageDescriptorBufferAbstract *)v140, v39);
        v44 = objc_retainAutorelease(v41);
        memcpy(DataForKthDescriptor, (const void *)objc_msgSend(v44, "bytes"), __n);
        vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor(v42, v39, v38);
        if ((unint64_t)v9 >= v113)
        {
          v45 = (v9 - v10) >> 2;
          v46 = v45 + 1;
          if ((unint64_t)(v45 + 1) >> 62)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v113 - (_QWORD)v10) >> 1 > v46)
            v46 = (uint64_t)(v113 - (_QWORD)v10) >> 1;
          if (v113 - (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL)
            v47 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v47 = v46;
          if (v47)
            v47 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v47);
          else
            v48 = 0;
          v49 = (char *)(v47 + 4 * v45);
          *(_DWORD *)v49 = v38;
          v50 = v49 + 4;
          while (v9 != v10)
          {
            v51 = *((_DWORD *)v9 - 1);
            v9 -= 4;
            *((_DWORD *)v49 - 1) = v51;
            v49 -= 4;
          }
          v113 = v47 + 4 * v48;
          if (v10)
            operator delete(v10);
          v10 = v49;
          v9 = v50;
        }
        else
        {
          *(_DWORD *)v9 = v38;
          v9 += 4;
        }
        v24 = v111;
        v21 = v109;
        ++v39;

        ++v37;
      }
      while (v37 != v108);
      v112 = v140;
      v140 = 0uLL;

      v11 = v95;
    }
    else
    {
      v112 = v140;
      v140 = 0uLL;
    }

    v142 = v112;
    if (v21)
    {
      v52 = (unint64_t *)&v21->__shared_owners_;
      do
        v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    v54 = (std::__shared_weak_count *)*((_QWORD *)&v140 + 1);
    if (*((_QWORD *)&v140 + 1))
    {
      v55 = (unint64_t *)(*((_QWORD *)&v140 + 1) + 8);
      do
        v56 = __ldaxr(v55);
      while (__stlxr(v56 - 1, v55));
      if (!v56)
      {
        ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
        std::__shared_weak_count::__release_weak(v54);
      }
    }
    objc_autoreleasePoolPop(context);

    if ((char *)++v11 == v98)
      goto LABEL_67;
  }
  if (!a6)
  {
LABEL_83:
    v69 = 0;
    goto LABEL_108;
  }
  VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(4, CFSTR("operation was cancelled"), 0);
  v69 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_108:

  if (v10)
    operator delete(v10);
  v79 = (std::__shared_weak_count *)*((_QWORD *)&v142 + 1);
  if (*((_QWORD *)&v142 + 1))
  {
    v80 = (unint64_t *)(*((_QWORD *)&v142 + 1) + 8);
    do
      v81 = __ldaxr(v80);
    while (__stlxr(v81 - 1, v80));
    if (!v81)
    {
      ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
      std::__shared_weak_count::__release_weak(v79);
    }
  }

  return v69;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __112__VNEntityIdentificationModelTrainedModelVIPv2_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)vision::mod::FaceIDModel::buildModel(*(_QWORD *)(a1 + 48), *(_QWORD **)(a1 + 64), (_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  if (v2 != 128)
  {
    VNErrorForCVMLStatus(v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

uint64_t __112__VNEntityIdentificationModelTrainedModelVIPv2_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_36(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56) = 1;
  return result;
}

@end
