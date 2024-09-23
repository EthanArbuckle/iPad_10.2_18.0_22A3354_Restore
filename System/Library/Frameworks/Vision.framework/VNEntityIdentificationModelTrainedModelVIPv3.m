@implementation VNEntityIdentificationModelTrainedModelVIPv3

- (VNEntityIdentificationModelTrainedModelVIPv3)initWithFaceIDModel:(shared_ptr<vision:(id)a4 :(id)a5 mod:(id)a6 :FaceID3Model>)a3 entityPrintOriginatingRequestSpecifier:entityUniqueIdentifiers:entityPrintCounts:
{
  FaceID3Model *ptr;
  __shared_weak_count *v10;
  id v11;
  id v12;
  VNEntityIdentificationModelTrainedModelVIPv3 *v13;
  VNEntityIdentificationModelTrainedModelVIPv3 *v14;
  uint64_t v15;
  VNRequestSpecifier *entityPrintOriginatingRequestSpecifier;
  uint64_t v17;
  NSArray *entityUniqueIdentifiers;
  uint64_t v19;
  NSArray *entityPrintCounts;
  objc_super v22;

  ptr = a3.__ptr_;
  v10 = a3.__cntrl_;
  v11 = a4;
  v12 = a5;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", objc_msgSend(v11, "count") == objc_msgSend(v12, "count"), CFSTR("entity unique identifier / print count mismatch"));
  v22.receiver = self;
  v22.super_class = (Class)VNEntityIdentificationModelTrainedModelVIPv3;
  v13 = -[VNEntityIdentificationModelTrainedModelVIPv3 init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    std::shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>::operator=[abi:ne180100](&v13->_faceIDModel.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
    v15 = -[__shared_weak_count copy](v10, "copy");
    entityPrintOriginatingRequestSpecifier = v14->_entityPrintOriginatingRequestSpecifier;
    v14->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v15;

    v17 = objc_msgSend(v11, "copy");
    entityUniqueIdentifiers = v14->_entityUniqueIdentifiers;
    v14->_entityUniqueIdentifiers = (NSArray *)v17;

    v19 = objc_msgSend(v12, "copy");
    entityPrintCounts = v14->_entityPrintCounts;
    v14->_entityPrintCounts = (NSArray *)v19;

  }
  return v14;
}

- (id)entityPrintOriginatingRequestSpecifier
{
  return self->_entityPrintOriginatingRequestSpecifier;
}

- (id)trainingEntityPrintsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSUInteger v7;
  uint64_t *v9;
  vision::mod::ImageDescriptorBufferAbstract *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  vision::mod::ImageDescriptorBufferAbstract *v21;
  id v22;

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
  v9 = (uint64_t *)(v7 + 1);

  v22 = (id)-38;
  vision::mod::FaceID3Model::getIdentityTrainingData((vision::mod::FaceID3Model *)&v21, (vision::mod::FaceID3Model *)self->_faceIDModel.__ptr_, v9, (uint64_t *)&v22);
  v10 = v21;
  if (v21)
  {
    v11 = *((_QWORD *)v21 + 9);
    if (v11)
    {
      -[VNEntityIdentificationModelTrainedModelVIPv3 entityPrintOriginatingRequestSpecifier](self, "entityPrintOriginatingRequestSpecifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v20, "requestClassAndReturnError:", a4);
      if (v12)
      {
        v13 = objc_msgSend(v20, "requestRevision");
        v14 = *((_QWORD *)v10 + 8);
        v15 = *((_QWORD *)v10 + 12);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
        v17 = 0;
        while (1)
        {
          objc_msgSend(v12, "createVNEntityIdentificationModelEntryPrintForRevision:fromDescriptorData:length:elementCount:error:", v13, vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v10, v17), v14, v15, a4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18)
            break;
          objc_msgSend(v16, "addObject:", v18);

          if (v11 == ++v17)
          {
            v19 = v16;
            goto LABEL_19;
          }
        }
        v19 = 0;
LABEL_19:

        if (!v10)
          return v19;
      }
      else
      {

        v19 = 0;
      }
    }
    else
    {
      v19 = (id)MEMORY[0x1E0C9AA60];
    }
    (*(void (**)(vision::mod::ImageDescriptorBufferAbstract *))(*(_QWORD *)v10 + 8))(v10);
    return v19;
  }
  if (!a4)
    return 0;
  VNErrorForCVMLStatus(v22);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  return 0;
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
  -[VNEntityIdentificationModelTrainedModelVIPv3 entityPrintOriginatingRequestSpecifier](self, "entityPrintOriginatingRequestSpecifier");
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
      v59 = __Block_byref_object_copy__37;
      v60 = __Block_byref_object_dispose__38;
      v61 = 0;
      v50 = 0;
      v51 = &v50;
      v52 = 0x3032000000;
      v53 = __Block_byref_object_copy__37;
      v54 = __Block_byref_object_dispose__38;
      v55 = 0;
      v41 = 0;
      v42 = &v41;
      v43 = 0x4012000000;
      v44 = __Block_byref_object_copy__15549;
      v45 = __Block_byref_object_dispose__15550;
      v46 = "";
      v47 = &off_1E453A1B8;
      v49 = -1;
      v48 = 0;
      v18 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3321888768;
      v27[2] = __96__VNEntityIdentificationModelTrainedModelVIPv3_predictionsForObservation_limit_canceller_error___block_invoke;
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
      v26[2] = __96__VNEntityIdentificationModelTrainedModelVIPv3_predictionsForObservation_limit_canceller_error___block_invoke_43;
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
  VNEntityIdentificationModelTrainedModelVIPv3 *v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v4);
  entityUniqueIdentifiers = self->_entityUniqueIdentifiers;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__VNEntityIdentificationModelTrainedModelVIPv3_printCountsForEntitiesWithUniqueIdentifiers___block_invoke;
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
  VNEntityIdentificationModelTrainedModelVIPv3 *v10;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](self->_entityUniqueIdentifiers, "count"));
  entityUniqueIdentifiers = self->_entityUniqueIdentifiers;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__VNEntityIdentificationModelTrainedModelVIPv3_printCountsForAllEntities__block_invoke;
  v8[3] = &unk_1E4547598;
  v5 = v3;
  v9 = v5;
  v10 = self;
  -[NSArray enumerateObjectsUsingBlock:](entityUniqueIdentifiers, "enumerateObjectsUsingBlock:", v8);
  v6 = v5;

  return v6;
}

- (VNEntityIdentificationModelTrainedModelVIPv3)initWithCoder:(id)a3
{
  id v4;
  VNEntityIdentificationModelTrainedModelVIPv3 *v5;
  VNEntityIdentificationModelTrainedModelVIPv3 *v6;
  uint64_t v7;
  NSArray *entityUniqueIdentifiers;
  uint64_t v9;
  NSArray *entityPrintCounts;
  uint64_t v11;
  uint64_t v12;
  VNRequestSpecifier *entityPrintOriginatingRequestSpecifier;
  void *v14;
  NSData *v15;
  vision::mod::FaceID3Model *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  VNEntityIdentificationModelTrainedModelVIPv3 *v26;
  vision::mod::FaceID3Model *v28;
  vision::mod::FaceID3Model *v29;
  uint64_t v30;
  _QWORD v31[2];
  std::ios_base v32;
  uint64_t v33;
  int v34;
  _BYTE __sb[64];
  id v36;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)VNEntityIdentificationModelTrainedModelVIPv3;
  v5 = -[VNEntityIdentificationModelTrainedModelVIPv3 init](&v37, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v4, "vn_decodeEntityUniqueIdentifierArrayForKey:", CFSTR("entityUniqueIdentifiers"));
    v7 = objc_claimAutoreleasedReturnValue();
    entityUniqueIdentifiers = v5->_entityUniqueIdentifiers;
    v5->_entityUniqueIdentifiers = (NSArray *)v7;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("entityPrintCounts"));
    v9 = objc_claimAutoreleasedReturnValue();
    entityPrintCounts = v5->_entityPrintCounts;
    v5->_entityPrintCounts = (NSArray *)v9;

    v11 = -[NSArray count](v5->_entityUniqueIdentifiers, "count");
    if (v11 == -[NSArray count](v5->_entityPrintCounts, "count"))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityPrintOriginatingRequestSpecifier"));
      v12 = objc_claimAutoreleasedReturnValue();
      entityPrintOriginatingRequestSpecifier = v5->_entityPrintOriginatingRequestSpecifier;
      v5->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v12;

      v14 = (void *)MEMORY[0x1A1B0B060]();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceIDModel"));
      v15 = (NSData *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_10;
      VNNSDataStreambuf::VNNSDataStreambuf((VNNSDataStreambuf *)__sb, v15);
      v31[1] = 0;
      v32.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E0DE4F98] + 64);
      v31[0] = MEMORY[0x1E0DE4F98] + 24;
      std::ios_base::init(&v32, __sb);
      v33 = 0;
      v34 = -1;
      v29 = 0;
      v30 = 11125;
      vision::mod::FaceID3Model::deserialize(&v28, (uint64_t)v31, &v30);
      v16 = v28;
      v29 = v28;
      if (v28)
      {
        std::shared_ptr<vision::mod::FaceID3Model>::operator=[abi:ne180100]<vision::mod::FaceID3Model,std::default_delete<vision::mod::FaceID3Model>,void>(&v5->_faceIDModel.__ptr_, (uint64_t *)&v29);
        if (v29)
        {
          vision::mod::FaceID3Model::~FaceID3Model(v29);
          MEMORY[0x1A1B0A898]();
        }
      }
      else
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        v20 = (void *)v30;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v30);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("Face ID model data deserialization failed with code %@"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        VNErrorForCVMLStatus(v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "failWithError:", v24);

      }
      std::istream::~istream();

      std::streambuf::~streambuf();
      if (!v16)
        v25 = 0;
      else
LABEL_10:
        v25 = 1;

      objc_autoreleasePoolPop(v14);
      if (v25)
        goto LABEL_13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("entity unique identifier counts (%lu) do not agree with the print counts (%lu)"), -[NSArray count](v5->_entityUniqueIdentifiers, "count"), -[NSArray count](v5->_entityPrintCounts, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v18);

    }
    v26 = 0;
    goto LABEL_15;
  }
LABEL_13:
  v26 = v6;
LABEL_15:

  return v26;
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
  v5 = (void *)MEMORY[0x1A1B0B060](objc_msgSend(v4, "encodeObject:forKey:", self->_entityPrintOriginatingRequestSpecifier, CFSTR("entityPrintOriginatingRequestSpecifier")));
  VNNSMutableDataStreambuf::VNNSMutableDataStreambuf((VNNSMutableDataStreambuf *)__sb);
  v8.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E0DE4FA0] + 64);
  std::ios_base::init(&v8, __sb);
  v9 = 0;
  v10 = -1;
  v6 = (void *)vision::mod::FaceID3Model::serialize(self->_faceIDModel.__ptr_);
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

void __73__VNEntityIdentificationModelTrainedModelVIPv3_printCountsForAllEntities__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __92__VNEntityIdentificationModelTrainedModelVIPv3_printCountsForEntitiesWithUniqueIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 40), "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);

    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v8);
    if (!objc_msgSend(*(id *)(a1 + 32), "count"))
      *a4 = 1;
  }

}

void __96__VNEntityIdentificationModelTrainedModelVIPv3_predictionsForObservation_limit_canceller_error___block_invoke(uint64_t a1)
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
    if (objc_msgSend(*(id *)(v2 + 32), "count"))
    {
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v8 = (void *)vision::mod::FaceID3Model::predict(*(_QWORD *)(v2 + 8), a1 + 72, (uint64_t *)&v32);
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
            objc_msgSend(v30, "sortUsingComparator:", &__block_literal_global_15555);
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
          if ((int)v13 < 1 || v13 - 1 >= (unint64_t)objc_msgSend(*(id *)(v2 + 32), "count"))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No entity for identity serial number %d"), v13);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v30;
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v25);
            v6 = (id)objc_claimAutoreleasedReturnValue();

            v22 = 0;
            goto LABEL_27;
          }
          objc_msgSend(*(id *)(v2 + 32), "objectAtIndex:");
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

uint64_t __96__VNEntityIdentificationModelTrainedModelVIPv3_predictionsForObservation_limit_canceller_error___block_invoke_43(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56) = 1;
  return result;
}

uint64_t __129__VNEntityIdentificationModelTrainedModelVIPv3__predictionsForObservation_withEntityPrintDescriptor_limit_faceIDCanceller_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
  *a3 = 1447645235;
  return 1;
}

+ (id)trainedModelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
{
  id v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  vision::mod::ImageDescriptorBufferAbstract *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  size_t v25;
  unint64_t v26;
  _QWORD *v27;
  void *v28;
  __int128 v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  std::__shared_weak_count *v39;
  void *v40;
  void *DataForKthDescriptor;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  int v49;
  unint64_t *v50;
  unint64_t v51;
  id v52;
  unsigned int v53;
  unsigned int v54;
  int v55;
  int v56;
  uint64_t v57;
  void *v58;
  std::__shared_weak_count *v59;
  unint64_t *p_shared_owners;
  unint64_t v61;
  std::__shared_weak_count *v62;
  unint64_t *v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t *v66;
  unint64_t v67;
  unint64_t *v68;
  unint64_t v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  std::__shared_weak_count *v85;
  unint64_t *v86;
  unint64_t v87;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  std::__shared_weak_count *v92;
  unint64_t *v93;
  unint64_t v94;
  id v95;
  unint64_t *v96;
  unint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  void *v101;
  void *context;
  char *v103;
  void *v105;
  void *v106;
  void *v108;
  void *v109;
  VNCanceller *v110;
  void *v111;
  uint64_t v112;
  id v113;
  int v114;
  uint64_t v115;
  size_t __n;
  size_t __na[2];
  unint64_t v118;
  _QWORD *v119;
  std::__shared_weak_count *v120;
  _QWORD v121[5];
  _QWORD v122[7];
  std::__shared_weak_count *v123;
  uint64_t v124;
  std::__shared_weak_count *v125;
  void *__p;
  void *v127;
  uint64_t v128;
  _QWORD *v129;
  std::__shared_weak_count *v130;
  vision::mod::ImageDescriptorBufferAbstract *v131[2];
  id v132;
  __int128 v133;
  __int128 aBlock;
  uint64_t v135;
  uint64_t (*v136)(uint64_t, uint64_t);
  void (*v137)(uint64_t);
  id v138;
  int v139;
  int v140;
  _QWORD *v141;
  _QWORD **v142;
  uint64_t v143;
  void *v144;
  uint64_t (*v145)(uint64_t);
  const char *v146;
  uint64_t (**v147)(vision::mod::CVMLCanceller *__hidden);
  std::__shared_weak_count *v148;

  v8 = a3;
  v113 = a4;
  v110 = (VNCanceller *)a5;
  v106 = v8;
  if (!v110)
    v110 = objc_alloc_init(VNCanceller);
  objc_msgSend(v8, "entityPrintOriginatingRequestSpecifier");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (char *)objc_msgSend(v113, "trainedModelEntityCount");
  v133 = 0uLL;
  v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
  v108 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
  if (!v9)
  {
    v10 = 0;
LABEL_62:
    v52 = v106;
    v53 = objc_msgSend(v52, "faceID3ModelMaximumIDs");
    v54 = objc_msgSend(v52, "faceID3ModelMaximumElementsPerID");
    v55 = objc_msgSend(v52, "faceID3ModelSeed");
    v56 = objc_msgSend(v52, "faceID3IndexMode");
    v141 = 0;
    v142 = &v141;
    v143 = 0x4012000000;
    v144 = __Block_byref_object_copy__102;
    v145 = __Block_byref_object_dispose__103;
    v147 = 0;
    v148 = 0;
    v146 = "";
    v57 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 3221225472;
    v135 = (uint64_t)___ZL15_newFaceIDModelP40VNEntityIdentificationModelConfigurationPU15__autoreleasingP7NSError_block_invoke;
    v136 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4548868;
    v137 = (void (*)(uint64_t))&v141;
    v138 = (id)__PAIR64__(v53, v54);
    v139 = v55;
    v140 = v56;
    v58 = _Block_copy(&aBlock);
    if ((VNExecuteBlock(v58, (uint64_t)a6) & 1) != 0)
    {
      v59 = (std::__shared_weak_count *)v142[7];
      v129 = v142[6];
      v130 = v59;
      if (v59)
      {
        p_shared_owners = (unint64_t *)&v59->__shared_owners_;
        do
          v61 = __ldxr(p_shared_owners);
        while (__stxr(v61 + 1, p_shared_owners));
      }
    }
    else
    {
      v129 = 0;
      v130 = 0;
    }

    _Block_object_dispose(&v141, 8);
    v62 = v148;
    if (v148)
    {
      v63 = (unint64_t *)&v148->__shared_owners_;
      do
        v64 = __ldaxr(v63);
      while (__stlxr(v64 - 1, v63));
      if (!v64)
      {
        ((void (*)(std::__shared_weak_count *))v62->__on_zero_shared)(v62);
        std::__shared_weak_count::__release_weak(v62);
      }
    }

    if (!v129)
      goto LABEL_106;
    v65 = v133;
    if ((_QWORD)v133)
    {
      v141 = 0;
      v142 = &v141;
      v143 = 0x4012000000;
      v144 = __Block_byref_object_copy__15549;
      v145 = (uint64_t (*)(uint64_t))__Block_byref_object_dispose__15550;
      v146 = "";
      v147 = &off_1E453A1B8;
      HIDWORD(v148) = -1;
      LOBYTE(v148) = 0;
      *(_QWORD *)&aBlock = 0;
      *((_QWORD *)&aBlock + 1) = &aBlock;
      v135 = 0x3032000000;
      v136 = __Block_byref_object_copy__37;
      v137 = __Block_byref_object_dispose__38;
      v138 = 0;
      v122[0] = v57;
      v122[1] = 3321888768;
      v122[2] = __112__VNEntityIdentificationModelTrainedModelVIPv3_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke;
      v122[3] = &unk_1E453C130;
      v122[6] = v129;
      v123 = v130;
      if (v130)
      {
        v66 = (unint64_t *)&v130->__shared_owners_;
        do
          v67 = __ldxr(v66);
        while (__stxr(v67 + 1, v66));
      }
      v124 = v65;
      v125 = (std::__shared_weak_count *)*((_QWORD *)&v133 + 1);
      if (*((_QWORD *)&v133 + 1))
      {
        v68 = (unint64_t *)(*((_QWORD *)&v133 + 1) + 8);
        do
          v69 = __ldxr(v68);
        while (__stxr(v69 + 1, v68));
      }
      __p = 0;
      v127 = 0;
      v128 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v10, (uint64_t)v9, (v9 - v10) >> 2);
      v122[4] = &v141;
      v122[5] = &aBlock;
      v121[0] = v57;
      v121[1] = 3221225472;
      v121[2] = __112__VNEntityIdentificationModelTrainedModelVIPv3_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_40;
      v121[3] = &unk_1E4548FA8;
      v121[4] = &v141;
      if (!-[VNCanceller tryToPerformBlock:usingSignallingBlock:](v110, "tryToPerformBlock:usingSignallingBlock:", v122, v121))
      {
        if (a6)
        {
          VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(4, CFSTR("operation was cancelled"), 0);
          v71 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_92;
        }
LABEL_93:
        if (__p)
        {
          v127 = __p;
          operator delete(__p);
        }
        v76 = v125;
        if (v125)
        {
          v77 = (unint64_t *)&v125->__shared_owners_;
          do
            v78 = __ldaxr(v77);
          while (__stlxr(v78 - 1, v77));
          if (!v78)
          {
            ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
            std::__shared_weak_count::__release_weak(v76);
          }
        }
        v79 = v123;
        if (v123)
        {
          v80 = (unint64_t *)&v123->__shared_owners_;
          do
            v81 = __ldaxr(v80);
          while (__stlxr(v81 - 1, v80));
          if (!v81)
          {
            ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
            std::__shared_weak_count::__release_weak(v79);
          }
        }
        _Block_object_dispose(&aBlock, 8);

        _Block_object_dispose(&v141, 8);
LABEL_106:
        v75 = 0;
LABEL_107:
        v82 = v130;
        if (v130)
        {
          v83 = (unint64_t *)&v130->__shared_owners_;
          do
            v84 = __ldaxr(v83);
          while (__stlxr(v84 - 1, v83));
          if (!v84)
          {
            ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
            std::__shared_weak_count::__release_weak(v82);
          }
        }
        goto LABEL_114;
      }
      v70 = *(void **)(*((_QWORD *)&aBlock + 1) + 40);
      if (v70)
      {
        if (a6)
        {
          v71 = objc_retainAutorelease(v70);
LABEL_92:
          *a6 = v71;
          goto LABEL_93;
        }
        goto LABEL_93;
      }
      if (__p)
      {
        v127 = __p;
        operator delete(__p);
      }
      v89 = v125;
      if (v125)
      {
        v90 = (unint64_t *)&v125->__shared_owners_;
        do
          v91 = __ldaxr(v90);
        while (__stlxr(v91 - 1, v90));
        if (!v91)
        {
          ((void (*)(std::__shared_weak_count *))v89->__on_zero_shared)(v89);
          std::__shared_weak_count::__release_weak(v89);
        }
      }
      v92 = v123;
      if (v123)
      {
        v93 = (unint64_t *)&v123->__shared_owners_;
        do
          v94 = __ldaxr(v93);
        while (__stlxr(v94 - 1, v93));
        if (!v94)
        {
          ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
          std::__shared_weak_count::__release_weak(v92);
        }
      }
      _Block_object_dispose(&aBlock, 8);

      _Block_object_dispose(&v141, 8);
    }
    v95 = objc_alloc((Class)a1);
    v119 = v129;
    v120 = v130;
    if (v130)
    {
      v96 = (unint64_t *)&v130->__shared_owners_;
      do
        v97 = __ldxr(v96);
      while (__stxr(v97 + 1, v96));
    }
    v75 = (void *)objc_msgSend(v95, "initWithFaceIDModel:entityPrintOriginatingRequestSpecifier:entityUniqueIdentifiers:entityPrintCounts:", &v119, v111, v109, v108);
    v98 = v120;
    if (v120)
    {
      v99 = (unint64_t *)&v120->__shared_owners_;
      do
        v100 = __ldaxr(v99);
      while (__stlxr(v100 - 1, v99));
      if (!v100)
      {
        ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
        std::__shared_weak_count::__release_weak(v98);
      }
    }
    goto LABEL_107;
  }
  v103 = v9;
  v10 = 0;
  v9 = 0;
  v118 = 0;
  v112 = 0;
  while (!-[VNCanceller wasSignalled](v110, "wasSignalled"))
  {
    objc_msgSend(v113, "trainedModelUniqueIdentifierOfEntityAtIndex:", v112);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "addObject:", v105);
    v11 = objc_msgSend(v113, "trainedModelNumberOfObservationsForEntityAtIndex:", v112);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "addObject:", v12);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
    if (v11)
    {
      v14 = 0;
      while (1)
      {
        objc_msgSend(v113, "trainedModelObservationAtIndex:forEntityAtIndex:", v14, v112);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15 || (VNEntityIdentificationModelObservationConformingObject(v15) & 1) == 0)
          break;
        v132 = 0;
        objc_msgSend(v16, "VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:error:", v111, &v132);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v132;
        if (!v17)
        {
          if (a6)
          {
            v72 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v16, "originatingRequestSpecifier");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "stringWithFormat:", CFSTR("entity index %lu, observation index %lu was generated by %@, which is not compatible with the model requirement of %@"), v112, v14, v73, v111);
            v74 = (void *)objc_claimAutoreleasedReturnValue();

            VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v74, v18);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_87;
        }
        objc_msgSend(v13, "addObject:", v17);

        if (v11 == ++v14)
          goto LABEL_12;
      }
      if (!a6)
        goto LABEL_88;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid observation at index %lu for entity at index %lu"), v14, v112);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v18);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_87:

LABEL_88:
      goto LABEL_89;
    }
LABEL_12:
    context = (void *)MEMORY[0x1A1B0B060]();
    v20 = (std::__shared_weak_count *)*((_QWORD *)&v133 + 1);
    v19 = (vision::mod::ImageDescriptorBufferAbstract *)v133;
    *(_OWORD *)v131 = v133;
    if (*((_QWORD *)&v133 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v133 + 1) + 8);
      do
        v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
    }
    v23 = v13;
    objc_opt_self();
    v24 = objc_msgSend(v23, "count");
    if (v24)
    {
      objc_msgSend(v23, "firstObject");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v101, "VNEntityIdentificationModelPrintByteLength");
      __n = v25;
      if (v19)
      {
        LODWORD(v26) = *((_DWORD *)v19 + 18);
      }
      else
      {
        v27 = operator new(8uLL);
        *v27 = 1;
        v142 = (_QWORD **)(v27 + 1);
        v143 = (uint64_t)(v27 + 1);
        v141 = v27;
        v28 = malloc_type_malloc(v25, 0x3B8CBC45uLL);
        std::allocate_shared[abi:ne180100]<vision::mod::ImageDescriptorBufferFloat32,std::allocator<vision::mod::ImageDescriptorBufferFloat32>,std::vector<long long> &,void *,unsigned long const&,int,BOOL,void>((uint64_t *)&aBlock, &v141, v28, v25, 1, 1);
        v29 = aBlock;
        aBlock = 0uLL;
        *(_OWORD *)v131 = v29;
        if (v20)
        {
          v30 = (unint64_t *)&v20->__shared_owners_;
          do
            v31 = __ldaxr(v30);
          while (__stlxr(v31 - 1, v30));
          if (!v31)
          {
            ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
            std::__shared_weak_count::__release_weak(v20);
          }
        }
        v32 = (std::__shared_weak_count *)*((_QWORD *)&aBlock + 1);
        if (*((_QWORD *)&aBlock + 1))
        {
          v33 = (unint64_t *)(*((_QWORD *)&aBlock + 1) + 8);
          do
            v34 = __ldaxr(v33);
          while (__stlxr(v34 - 1, v33));
          if (!v34)
          {
            ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
            std::__shared_weak_count::__release_weak(v32);
          }
        }
        if (v141)
          operator delete(v141);
        LODWORD(v26) = 0;
        v19 = v131[0];
      }
      v115 = v24;
      v35 = v24 + (int)v26;
      vision::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount(v19, v35, (int)v26 > 0);
      std::vector<long long>::resize((char **)v19 + 1, v35);
      v36 = 0;
      v26 = (int)v26;
      v114 = v112 + 1;
      do
      {
        v37 = v23;
        objc_msgSend(v23, "objectAtIndexedSubscript:", v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v20;
        objc_msgSend(v38, "VNEntityIdentificationModelPrintData");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v131[0], v26);
        v42 = objc_retainAutorelease(v40);
        memcpy(DataForKthDescriptor, (const void *)objc_msgSend(v42, "bytes"), __n);
        vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor(v131[0], v26, v114);
        if ((unint64_t)v9 >= v118)
        {
          v43 = (v9 - v10) >> 2;
          v44 = v43 + 1;
          if ((unint64_t)(v43 + 1) >> 62)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          if ((uint64_t)(v118 - (_QWORD)v10) >> 1 > v44)
            v44 = (uint64_t)(v118 - (_QWORD)v10) >> 1;
          if (v118 - (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL)
            v45 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v45 = v44;
          if (v45)
            v45 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v45);
          else
            v46 = 0;
          v47 = (char *)(v45 + 4 * v43);
          *(_DWORD *)v47 = v114;
          v48 = v47 + 4;
          while (v9 != v10)
          {
            v49 = *((_DWORD *)v9 - 1);
            v9 -= 4;
            *((_DWORD *)v47 - 1) = v49;
            v47 -= 4;
          }
          v118 = v45 + 4 * v46;
          if (v10)
            operator delete(v10);
          v10 = v47;
          v9 = v48;
          v20 = v39;
        }
        else
        {
          *(_DWORD *)v9 = v114;
          v9 += 4;
        }
        ++v26;

        ++v36;
        v23 = v37;
      }
      while (v36 != v115);
      *(_OWORD *)__na = *(_OWORD *)v131;
      v131[0] = 0;
      v131[1] = 0;

    }
    else
    {
      *(_OWORD *)__na = *(_OWORD *)v131;
      v131[0] = 0;
      v131[1] = 0;
    }

    v133 = *(_OWORD *)__na;
    if (v20)
    {
      v50 = (unint64_t *)&v20->__shared_owners_;
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    objc_autoreleasePoolPop(context);

    if ((char *)++v112 == v103)
      goto LABEL_62;
  }
  if (!a6)
  {
LABEL_89:
    v75 = 0;
    goto LABEL_114;
  }
  VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(4, CFSTR("operation was cancelled"), 0);
  v75 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_114:

  if (v10)
    operator delete(v10);
  v85 = (std::__shared_weak_count *)*((_QWORD *)&v133 + 1);
  if (*((_QWORD *)&v133 + 1))
  {
    v86 = (unint64_t *)(*((_QWORD *)&v133 + 1) + 8);
    do
      v87 = __ldaxr(v86);
    while (__stlxr(v87 - 1, v86));
    if (!v87)
    {
      ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
      std::__shared_weak_count::__release_weak(v85);
    }
  }

  return v75;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __112__VNEntityIdentificationModelTrainedModelVIPv3_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)vision::mod::FaceID3Model::buildModel(*(_QWORD *)(a1 + 48), *(vision::mod::ImageDescriptorBufferAbstract **)(a1 + 64), (uint64_t *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  if (v2 != 128)
  {
    VNErrorForCVMLStatus(v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

uint64_t __112__VNEntityIdentificationModelTrainedModelVIPv3_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_40(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56) = 1;
  return result;
}

@end
