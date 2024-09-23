@implementation VNPersonsModelFaceModelVIPv3

- (VNPersonsModelFaceModelVIPv3)initWithFaceIDModel:(shared_ptr<vision:(unint64_t)a4 :(id)a5 mod::FaceID3Model>)a3 faceprintRequestRevision:personUniqueIdentifierToSerialNumberMapping:
{
  __shared_weak_count *cntrl;
  FaceID3Model *ptr;
  id v8;
  VNPersonsModelFaceModelVIPv3 *v9;
  VNPersonsModelFaceModelVIPv3 *v10;
  uint64_t v11;
  NSMapTable *serialNumberToPersonUniqueIdentifierMapTable;
  _QWORD v14[4];
  VNPersonsModelFaceModelVIPv3 *v15;
  objc_super v16;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v8 = (id)a4;
  v16.receiver = self;
  v16.super_class = (Class)VNPersonsModelFaceModelVIPv3;
  v9 = -[VNPersonsModelFaceModelVIPv3 init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    std::shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>::operator=[abi:ne180100](&v9->_faceIDModel.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
    v10->_faceprintRequestRevision = (unint64_t)cntrl;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    serialNumberToPersonUniqueIdentifierMapTable = v10->_serialNumberToPersonUniqueIdentifierMapTable;
    v10->_serialNumberToPersonUniqueIdentifierMapTable = (NSMapTable *)v11;

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __121__VNPersonsModelFaceModelVIPv3_initWithFaceIDModel_faceprintRequestRevision_personUniqueIdentifierToSerialNumberMapping___block_invoke;
    v14[3] = &unk_1E45487B0;
    v15 = v10;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  }
  return v10;
}

- (BOOL)_getSerialNumber:(int *)a3 forPersonUniqueIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  int *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMapTable keyEnumerator](self->_serialNumberToPersonUniqueIdentifierMapTable, "keyEnumerator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = a3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_serialNumberToPersonUniqueIdentifierMapTable, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v7);

        if (v14)
        {
          *v17 = objc_msgSend(v12, "intValue");

          v15 = 1;
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (a5)
  {
    VNPersonsModelErrorForUnknownPersonUniqueIdentifier((uint64_t)v7);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_12:

  return v15;
}

- (id)_personPredictionsForFace:(id)a3 withDescriptor:(const void *)a4 limit:(unint64_t)a5 faceIDCanceller:(CVMLCanceller *)a6 error:(id *)a7
{
  void *v11;
  void *v12;
  _QWORD *v13;
  void **v14;
  void *v15;
  void *v16;
  double v17;
  VNPersonsModelPrediction *v18;
  double v19;
  VNPersonsModelPrediction *v20;
  void **v21;
  void **v22;
  BOOL v23;
  unint64_t v24;
  id v25;
  _QWORD *v27;
  id *v28;
  id v29;
  void **v30;
  _QWORD *v31[2];
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;

  v29 = a3;
  if (-[NSMapTable count](self->_serialNumberToPersonUniqueIdentifierMapTable, "count"))
  {
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v11 = (void *)vision::mod::FaceID3Model::predict((uint64_t)self->_faceIDModel.__ptr_, (uint64_t)a4, (uint64_t *)&v32);
    if (v11 == 128)
    {
      v28 = a7;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xAAAAAAAAAAAAAAABLL * (v33 - v32));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v32;
      v27 = v33;
      if (v32 == v33)
      {
LABEL_14:
        objc_msgSend(v12, "sortWithOptions:usingComparator:", 16, &__block_literal_global_30947);
        if (a5)
        {
          v24 = objc_msgSend(v12, "count");
          if (v24 > a5)
            objc_msgSend(v12, "removeObjectsInRange:", a5, v24 - a5);
        }
        v25 = v12;
      }
      else
      {
        while (1)
        {
          std::map<int,double>::map[abi:ne180100]((uint64_t)&v30, v13);
          v14 = v30;
          if (v30 != (void **)v31)
            break;
LABEL_13:
          std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v31[0]);
          v13 += 3;
          if (v13 == v27)
            goto LABEL_14;
        }
        while (1)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v14 + 8));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable objectForKey:](self->_serialNumberToPersonUniqueIdentifierMapTable, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
            break;
          v17 = *((double *)v14 + 5);
          v18 = [VNPersonsModelPrediction alloc];
          *(float *)&v19 = v17;
          v20 = -[VNPersonsModelPrediction initWithFaceObservation:predictedPersonUniqueIdentifier:confidence:](v18, "initWithFaceObservation:predictedPersonUniqueIdentifier:confidence:", v29, v16, v19);
          if (!v20)
          {
            if (v28)
            {
              +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
              *v28 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_26;
          }
          objc_msgSend(v12, "addObject:", v20);

          v21 = (void **)v14[1];
          if (v21)
          {
            do
            {
              v22 = v21;
              v21 = (void **)*v21;
            }
            while (v21);
          }
          else
          {
            do
            {
              v22 = (void **)v14[2];
              v23 = *v22 == v14;
              v14 = v22;
            }
            while (!v23);
          }
          v14 = v22;
          if (v22 == (void **)v31)
            goto LABEL_13;
        }
        if (!v28)
          goto LABEL_27;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("A prediction for an unknown identity with serial number %@ and confidence %f was provided"), v15, v14[5]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v16);
        *v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

LABEL_27:
        std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v31[0]);
        v25 = 0;
      }

    }
    else if (a7)
    {
      VNErrorForCVMLStatus(v11);
      v25 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v30 = (void **)&v32;
    std::vector<std::map<int,double>>::__destroy_vector::operator()[abi:ne180100](&v30);
  }
  else
  {
    v25 = (id)MEMORY[0x1E0C9AA60];
  }

  return v25;
}

- (id)personPredictionsForFace:(id)a3 withDescriptor:(const void *)a4 limit:(unint64_t)a5 canceller:(id)a6 error:(id *)a7
{
  id v12;
  VNCanceller *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  uint64_t *v25;
  const void *v26;
  unint64_t v27;
  _QWORD v28[7];
  char v29;
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v12 = a3;
  v13 = (VNCanceller *)a6;
  if (!v13)
    v13 = objc_alloc_init(VNCanceller);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__16_30940;
  v41 = __Block_byref_object_dispose__17_30941;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__16_30940;
  v35 = __Block_byref_object_dispose__17_30941;
  v36 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x4012000000;
  v28[3] = __Block_byref_object_copy__30942;
  v28[4] = __Block_byref_object_dispose__30943;
  v28[5] = "";
  v28[6] = &off_1E453A1B8;
  v30 = -1;
  v29 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __94__VNPersonsModelFaceModelVIPv3_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke;
  v21[3] = &unk_1E4548818;
  v23 = &v37;
  v21[4] = self;
  v15 = v12;
  v26 = a4;
  v27 = a5;
  v22 = v15;
  v24 = v28;
  v25 = &v31;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __94__VNPersonsModelFaceModelVIPv3_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke_2;
  v20[3] = &unk_1E4548FA8;
  v20[4] = v28;
  if (!-[VNCanceller tryToPerformBlock:usingSignallingBlock:](v13, "tryToPerformBlock:usingSignallingBlock:", v21, v20))
  {
    if (a7)
    {
      VNPersonsModelErrorCancelledOperation();
      v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v17 = 0;
      *a7 = v18;
      goto LABEL_12;
    }
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  v16 = (void *)v38[5];
  if (!v16)
  {
    if (a7)
    {
      v18 = objc_retainAutorelease((id)v32[5]);
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v17 = v16;
LABEL_12:

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v17;
}

- (unint64_t)faceprintRequestRevision
{
  return self->_faceprintRequestRevision;
}

- (unint64_t)personCount
{
  return -[NSMapTable count](self->_serialNumberToPersonUniqueIdentifierMapTable, "count");
}

- (id)personUniqueIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMapTable count](self->_serialNumberToPersonUniqueIdentifierMapTable, "count"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMapTable objectEnumerator](self->_serialNumberToPersonUniqueIdentifierMapTable, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return v3;
}

- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3
{
  return 0;
}

- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)faceCountsForAllPersons
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)trainingFaceprintsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  vision::mod::ImageDescriptorBufferAbstract *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t i;
  unint64_t DataForKthDescriptor;
  VNFaceprint *v14;
  double v15;
  VNFaceprint *v16;
  vision::mod::ImageDescriptorBufferAbstract *v18;
  id v19;
  uint64_t *v20;

  LODWORD(v20) = 0;
  if (!-[VNPersonsModelFaceModelVIPv3 _getSerialNumber:forPersonUniqueIdentifier:error:](self, "_getSerialNumber:forPersonUniqueIdentifier:error:", &v20, a3, a4))return 0;
  v19 = (id)-38;
  vision::mod::FaceID3Model::getIdentityTrainingData((vision::mod::FaceID3Model *)&v18, (vision::mod::FaceID3Model *)self->_faceIDModel.__ptr_, (uint64_t *)v20, (uint64_t *)&v19);
  v6 = v18;
  if (!v18)
  {
    if (a4)
    {
      VNErrorForCVMLStatus(v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    return 0;
  }
  v7 = *((_QWORD *)v18 + 9);
  if (v7)
  {
    v8 = *((_QWORD *)v18 + 8);
    v9 = *((_QWORD *)v18 + 12);
    v10 = -[VNPersonsModelFaceModelVIPv3 faceprintRequestRevision](self, "faceprintRequestRevision");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
    for (i = 0; i != v7; ++i)
    {
      DataForKthDescriptor = vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v6, i);
      v14 = [VNFaceprint alloc];
      LODWORD(v15) = 1.0;
      v16 = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](v14, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", DataForKthDescriptor, v9, 1, v8, v10, v15);
      objc_msgSend(v11, "addObject:", v16);

    }
    if (!v6)
      return v11;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  (*(void (**)(vision::mod::ImageDescriptorBufferAbstract *))(*(_QWORD *)v6 + 8))(v6);
  return v11;
}

- (VNPersonsModelFaceModelVIPv3)initWithCoder:(id)a3
{
  id v4;
  VNPersonsModelFaceModelVIPv3 *v5;
  VNPersonsModelFaceModelVIPv3 *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMapTable *serialNumberToPersonUniqueIdentifierMapTable;
  void *v11;
  NSData *v12;
  vision::mod::FaceID3Model *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  VNPersonsModelFaceModelVIPv3 *v21;
  vision::mod::FaceID3Model *v23;
  vision::mod::FaceID3Model *v24;
  uint64_t v25;
  _QWORD v26[2];
  std::ios_base v27;
  uint64_t v28;
  int v29;
  _BYTE __sb[64];
  id v31;
  _QWORD v32[4];
  VNPersonsModelFaceModelVIPv3 *v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VNPersonsModelFaceModelVIPv3;
  v5 = -[VNPersonsModelFaceModelVIPv3 init](&v34, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_16;
  v7 = (void *)MEMORY[0x1A1B0B060]();
  if (_serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::onceToken != -1)
    dispatch_once(&_serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::onceToken, &__block_literal_global_86);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", _serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::classes, CFSTR("serialNumberToIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    serialNumberToPersonUniqueIdentifierMapTable = v5->_serialNumberToPersonUniqueIdentifierMapTable;
    v5->_serialNumberToPersonUniqueIdentifierMapTable = (NSMapTable *)v9;

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __46__VNPersonsModelFaceModelVIPv3_initWithCoder___block_invoke;
    v32[3] = &unk_1E4548840;
    v33 = v5;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v32);

  }
  objc_autoreleasePoolPop(v7);
  if (!v8)
    goto LABEL_17;
  v5->_faceprintRequestRevision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("faceprintRequestRevision"));
  v11 = (void *)MEMORY[0x1A1B0B060]();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceIDModel"));
  v12 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_13;
  VNNSDataStreambuf::VNNSDataStreambuf((VNNSDataStreambuf *)__sb, v12);
  v26[1] = 0;
  v27.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E0DE4F98] + 64);
  v26[0] = MEMORY[0x1E0DE4F98] + 24;
  std::ios_base::init(&v27, __sb);
  v28 = 0;
  v29 = -1;
  v24 = 0;
  v25 = 11125;
  vision::mod::FaceID3Model::deserialize(&v23, (uint64_t)v26, &v25);
  v13 = v23;
  v24 = v23;
  if (v23)
  {
    std::shared_ptr<vision::mod::FaceID3Model>::operator=[abi:ne180100]<vision::mod::FaceID3Model,std::default_delete<vision::mod::FaceID3Model>,void>(&v5->_faceIDModel.__ptr_, (uint64_t *)&v24);
    if (v24)
    {
      vision::mod::FaceID3Model::~FaceID3Model(v24);
      MEMORY[0x1A1B0A898]();
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (void *)v25;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Face ID model data deserialization failed with code %@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    VNErrorForCVMLStatus(v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v19);

  }
  std::istream::~istream();

  std::streambuf::~streambuf();
  if (!v13)
    v20 = 0;
  else
LABEL_13:
    v20 = 1;

  objc_autoreleasePoolPop(v11);
  if (v20)
LABEL_16:
    v21 = v6;
  else
LABEL_17:
    v21 = 0;

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  std::ios_base v13;
  uint64_t v14;
  int v15;
  _BYTE __sb[64];
  id v17;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1B0B060](objc_msgSend(v4, "encodeInteger:forKey:", self->_faceprintRequestRevision, CFSTR("faceprintRequestRevision")));
  -[NSMapTable dictionaryRepresentation](self->_serialNumberToPersonUniqueIdentifierMapTable, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serialNumberToIdentifier"));

  objc_autoreleasePoolPop(v5);
  v7 = (void *)MEMORY[0x1A1B0B060]();
  VNNSMutableDataStreambuf::VNNSMutableDataStreambuf((VNNSMutableDataStreambuf *)__sb);
  v12 = MEMORY[0x1E0DE4FA0] + 24;
  v13.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E0DE4FA0] + 64);
  std::ios_base::init(&v13, __sb);
  v14 = 0;
  v15 = -1;
  v8 = vision::mod::FaceID3Model::serialize(self->_faceIDModel.__ptr_);
  if (v8 != 128)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise:format:", *MEMORY[0x1E0C99850], CFSTR("unable to serialize the face ID model (status = %@)"), v10, v12);

  }
  std::ostream::flush();
  v11 = v17;
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("faceIDModel"));

  std::ostream::~ostream();
  std::streambuf::~streambuf();
  objc_autoreleasePoolPop(v7);

}

- (void).cxx_destruct
{
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_faceIDModel);
  objc_storeStrong((id *)&self->_serialNumberToPersonUniqueIdentifierMapTable, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

uint64_t __46__VNPersonsModelFaceModelVIPv3_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", a3, a2);
}

void __94__VNPersonsModelFaceModelVIPv3_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[9];
  v5 = a1[10];
  v6 = *(_QWORD *)(a1[7] + 8) + 48;
  v7 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v2, "_personPredictionsForFace:withDescriptor:limit:faceIDCanceller:error:", v3, v4, v5, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

uint64_t __94__VNPersonsModelFaceModelVIPv3_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56) = 1;
  return result;
}

uint64_t __101__VNPersonsModelFaceModelVIPv3__personPredictionsForFace_withDescriptor_limit_faceIDCanceller_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  float v5;
  float v6;
  float v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "confidence");
  v6 = v5;
  objc_msgSend(v4, "confidence");
  if (v6 > v7)
    v8 = -1;
  else
    v8 = v6 < v7;

  return v8;
}

uint64_t __121__VNPersonsModelFaceModelVIPv3_initWithFaceIDModel_faceprintRequestRevision_personUniqueIdentifierToSerialNumberMapping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", a2, a3);
}

+ (shared_ptr<vision::mod::ImageDescriptorBufferFloat32>)_concatenateFaceprintImageDescriptorBuffer:(shared_ptr<vision:(id)a4 :(int)a5 mod:(void *)a6 :ImageDescriptorBufferFloat32>)a3 withFaceprints:forIdentityWithSerialNumber:faceprintLabels:
{
  _OWORD *v6;
  uint64_t v7;
  ImageDescriptorBufferFloat32 *var0;
  uint64_t v9;
  void *v10;
  size_t v11;
  vision::mod::ImageDescriptorBufferAbstract *v12;
  int v13;
  _QWORD *v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *DataForKthDescriptor;
  id v26;
  unint64_t v27;
  _DWORD *v28;
  _DWORD *v29;
  _DWORD *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  BOOL v34;
  unint64_t v35;
  uint64_t v36;
  _DWORD *v37;
  int v38;
  ImageDescriptorBufferFloat32 *v39;
  __shared_weak_count *v40;
  _OWORD *v41;
  size_t __n;
  int v43;
  __shared_weak_count *v44;
  __int128 v45;
  void *__p[3];
  shared_ptr<vision::mod::ImageDescriptorBufferFloat32> result;

  v7 = *(_QWORD *)&a5;
  v43 = (int)a4;
  var0 = a3.var0;
  v41 = v6;
  v44 = a3.var1;
  v9 = -[__shared_weak_count count](v44, "count");
  if (v9)
  {
    -[__shared_weak_count firstObject](v44, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "lengthInBytes");
    v12 = *(vision::mod::ImageDescriptorBufferAbstract **)var0;
    if (*(_QWORD *)var0)
    {
      v13 = *((_DWORD *)v12 + 18);
    }
    else
    {
      v14 = operator new(8uLL);
      *v14 = 1;
      __p[1] = v14 + 1;
      __p[2] = v14 + 1;
      __p[0] = v14;
      v15 = malloc_type_malloc(v11, 0x361D0256uLL);
      std::allocate_shared[abi:ne180100]<vision::mod::ImageDescriptorBufferFloat32,std::allocator<vision::mod::ImageDescriptorBufferFloat32>,std::vector<long long> &,void *,unsigned long,int,BOOL,void>((uint64_t *)&v45, (_QWORD **)__p, v15, v11, 1, 1);
      std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)var0, &v45);
      v16 = (std::__shared_weak_count *)*((_QWORD *)&v45 + 1);
      if (*((_QWORD *)&v45 + 1))
      {
        v17 = (unint64_t *)(*((_QWORD *)&v45 + 1) + 8);
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 - 1, v17));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
          std::__shared_weak_count::__release_weak(v16);
        }
      }
      if (__p[0])
        operator delete(__p[0]);
      v13 = 0;
      v12 = *(vision::mod::ImageDescriptorBufferAbstract **)var0;
    }
    __n = v11;
    v19 = v9;
    vision::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount(v12, v9 + v13, v13 > 0);
    std::vector<long long>::resize((char **)(*(_QWORD *)var0 + 8), v9 + v13);
    v20 = 0;
    v21 = v13;
    do
    {
      -[__shared_weak_count objectAtIndexedSubscript:](v44, "objectAtIndexedSubscript:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v10;
      objc_msgSend(v22, "descriptorData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)var0, v21);
      v26 = objc_retainAutorelease(v24);
      memcpy(DataForKthDescriptor, (const void *)objc_msgSend(v26, "bytes"), __n);
      vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)var0, v21, v43);
      v28 = *(_DWORD **)(v7 + 8);
      v27 = *(_QWORD *)(v7 + 16);
      if ((unint64_t)v28 >= v27)
      {
        v30 = *(_DWORD **)v7;
        v31 = ((uint64_t)v28 - *(_QWORD *)v7) >> 2;
        v32 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 62)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        v33 = v27 - (_QWORD)v30;
        if (v33 >> 1 > v32)
          v32 = v33 >> 1;
        v34 = (unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL;
        v35 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v34)
          v35 = v32;
        if (v35)
        {
          v35 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v35);
          v30 = *(_DWORD **)v7;
          v28 = *(_DWORD **)(v7 + 8);
        }
        else
        {
          v36 = 0;
        }
        v37 = (_DWORD *)(v35 + 4 * v31);
        *v37 = v43;
        v29 = v37 + 1;
        while (v28 != v30)
        {
          v38 = *--v28;
          *--v37 = v38;
        }
        *(_QWORD *)v7 = v37;
        *(_QWORD *)(v7 + 8) = v29;
        *(_QWORD *)(v7 + 16) = v35 + 4 * v36;
        if (v30)
          operator delete(v30);
      }
      else
      {
        *v28 = v43;
        v29 = v28 + 1;
      }
      *(_QWORD *)(v7 + 8) = v29;
      ++v21;

      ++v20;
      v10 = v23;
    }
    while (v20 != v19);
    *v41 = *(_OWORD *)var0;
    *(_QWORD *)var0 = 0;
    *((_QWORD *)var0 + 1) = 0;

  }
  else
  {
    *v41 = *(_OWORD *)var0;
    *(_QWORD *)var0 = 0;
    *((_QWORD *)var0 + 1) = 0;
  }

  result.var1 = v40;
  result.var0 = v39;
  return result;
}

+ (id)modelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v21;
  unint64_t *v22;
  unint64_t v23;
  __int128 v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  id v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  int v37;
  uint64_t v38;
  void *v39;
  std::__shared_weak_count *v40;
  unint64_t *p_shared_owners;
  unint64_t v42;
  void *v43;
  void *v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  unint64_t *v51;
  unint64_t v52;
  void *v53;
  id v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v68;
  unint64_t *v69;
  unint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  id v74;
  unint64_t *v75;
  unint64_t v76;
  std::__shared_weak_count *v77;
  unint64_t *v78;
  unint64_t v79;
  id v81;
  VNCanceller *v82;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  std::__shared_weak_count *v88;
  _QWORD v89[5];
  _QWORD v90[7];
  std::__shared_weak_count *v91;
  uint64_t v92;
  std::__shared_weak_count *v93;
  void *__p;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  std::__shared_weak_count *v98;
  __int128 v99;
  id v100;
  void *v101;
  _BYTE *v102;
  uint64_t v103;
  __int128 v104;
  uint64_t aBlock;
  uint64_t p_aBlock;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t);
  void (*v109)(uint64_t);
  id v110;
  int v111;
  int v112;
  __int128 v113;
  uint64_t v114;
  void *v115;
  uint64_t (*v116)(uint64_t);
  const char *v117;
  uint64_t (**v118)(vision::mod::CVMLCanceller *__hidden);
  std::__shared_weak_count *v119;

  v81 = a3;
  v8 = a4;
  v82 = (VNCanceller *)a5;
  v86 = v8;
  v9 = objc_msgSend(v8, "faceModelPersonsCount");
  v104 = 0uLL;
  v101 = 0;
  v102 = 0;
  v103 = 0;
  v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
  v10 = 0;
  if (!v9)
  {
LABEL_27:
    v33 = v81;
    v34 = objc_msgSend(v33, "faceID3ModelMaximumIDs");
    v35 = objc_msgSend(v33, "faceID3ModelMaximumElementsPerID");
    v36 = objc_msgSend(v33, "faceID3ModelSeed");
    v37 = objc_msgSend(v33, "faceID3IndexMode");
    *(_QWORD *)&v113 = 0;
    *((_QWORD *)&v113 + 1) = &v113;
    v114 = 0x4012000000;
    v115 = __Block_byref_object_copy__82;
    v116 = __Block_byref_object_dispose__83;
    v118 = 0;
    v119 = 0;
    v117 = "";
    v38 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    p_aBlock = 3221225472;
    v107 = (uint64_t)___ZL15_newFaceIDModelP27VNPersonsModelConfigurationPU15__autoreleasingP7NSError_block_invoke;
    v108 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4548868;
    v109 = (void (*)(uint64_t))&v113;
    v110 = (id)__PAIR64__(v34, v35);
    v111 = v36;
    v112 = v37;
    v39 = _Block_copy(&aBlock);
    if ((VNExecuteBlock(v39, (uint64_t)a6) & 1) != 0)
    {
      v40 = *(std::__shared_weak_count **)(*((_QWORD *)&v113 + 1) + 56);
      v97 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 48);
      v98 = v40;
      if (v40)
      {
        p_shared_owners = (unint64_t *)&v40->__shared_owners_;
        do
          v42 = __ldxr(p_shared_owners);
        while (__stxr(v42 + 1, p_shared_owners));
      }
    }
    else
    {
      v97 = 0;
      v98 = 0;
    }

    _Block_object_dispose(&v113, 8);
    v45 = v119;
    if (v119)
    {
      v46 = (unint64_t *)&v119->__shared_owners_;
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
        std::__shared_weak_count::__release_weak(v45);
      }
    }

    if (!v97)
      goto LABEL_75;
    v48 = v104;
    if ((_QWORD)v104)
    {
      if (!v82)
        v82 = objc_alloc_init(VNCanceller);
      *(_QWORD *)&v113 = 0;
      *((_QWORD *)&v113 + 1) = &v113;
      v114 = 0x4012000000;
      v115 = __Block_byref_object_copy__30942;
      v116 = (uint64_t (*)(uint64_t))__Block_byref_object_dispose__30943;
      v117 = "";
      v118 = &off_1E453A1B8;
      HIDWORD(v119) = -1;
      LOBYTE(v119) = 0;
      aBlock = 0;
      p_aBlock = (uint64_t)&aBlock;
      v107 = 0x3032000000;
      v108 = __Block_byref_object_copy__16_30940;
      v109 = __Block_byref_object_dispose__17_30941;
      v110 = 0;
      v90[0] = v38;
      v90[1] = 3321888768;
      v90[2] = __89__VNPersonsModelFaceModelVIPv3_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke;
      v90[3] = &unk_1E453C130;
      v90[6] = v97;
      v91 = v98;
      if (v98)
      {
        v49 = (unint64_t *)&v98->__shared_owners_;
        do
          v50 = __ldxr(v49);
        while (__stxr(v50 + 1, v49));
      }
      v92 = v48;
      v93 = (std::__shared_weak_count *)*((_QWORD *)&v104 + 1);
      if (*((_QWORD *)&v104 + 1))
      {
        v51 = (unint64_t *)(*((_QWORD *)&v104 + 1) + 8);
        do
          v52 = __ldxr(v51);
        while (__stxr(v52 + 1, v51));
      }
      __p = 0;
      v95 = 0;
      v96 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v101, (uint64_t)v102, (v102 - (_BYTE *)v101) >> 2);
      v90[4] = &v113;
      v90[5] = &aBlock;
      v89[0] = v38;
      v89[1] = 3221225472;
      v89[2] = __89__VNPersonsModelFaceModelVIPv3_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_19;
      v89[3] = &unk_1E4548FA8;
      v89[4] = &v113;
      if (!-[VNCanceller tryToPerformBlock:usingSignallingBlock:](v82, "tryToPerformBlock:usingSignallingBlock:", v90, v89))
      {
        if (a6)
        {
          VNPersonsModelErrorCancelledOperation();
          v54 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_61;
        }
LABEL_62:
        if (__p)
        {
          v95 = __p;
          operator delete(__p);
        }
        v55 = v93;
        if (v93)
        {
          v56 = (unint64_t *)&v93->__shared_owners_;
          do
            v57 = __ldaxr(v56);
          while (__stlxr(v57 - 1, v56));
          if (!v57)
          {
            ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
            std::__shared_weak_count::__release_weak(v55);
          }
        }
        v58 = v91;
        if (v91)
        {
          v59 = (unint64_t *)&v91->__shared_owners_;
          do
            v60 = __ldaxr(v59);
          while (__stlxr(v60 - 1, v59));
          if (!v60)
          {
            ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
            std::__shared_weak_count::__release_weak(v58);
          }
        }
        _Block_object_dispose(&aBlock, 8);

        _Block_object_dispose(&v113, 8);
LABEL_75:
        v44 = 0;
LABEL_76:
        v61 = v98;
        if (v98)
        {
          v62 = (unint64_t *)&v98->__shared_owners_;
          do
            v63 = __ldaxr(v62);
          while (__stlxr(v63 - 1, v62));
          if (!v63)
          {
            ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
            std::__shared_weak_count::__release_weak(v61);
          }
        }
        goto LABEL_81;
      }
      v53 = *(void **)(p_aBlock + 40);
      if (v53)
      {
        if (a6)
        {
          v54 = objc_retainAutorelease(v53);
LABEL_61:
          *a6 = v54;
          goto LABEL_62;
        }
        goto LABEL_62;
      }
      if (__p)
      {
        v95 = __p;
        operator delete(__p);
      }
      v68 = v93;
      if (v93)
      {
        v69 = (unint64_t *)&v93->__shared_owners_;
        do
          v70 = __ldaxr(v69);
        while (__stlxr(v70 - 1, v69));
        if (!v70)
        {
          ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
          std::__shared_weak_count::__release_weak(v68);
        }
      }
      v71 = v91;
      if (v91)
      {
        v72 = (unint64_t *)&v91->__shared_owners_;
        do
          v73 = __ldaxr(v72);
        while (__stlxr(v73 - 1, v72));
        if (!v73)
        {
          ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
          std::__shared_weak_count::__release_weak(v71);
        }
      }
      _Block_object_dispose(&aBlock, 8);

      _Block_object_dispose(&v113, 8);
    }
    v74 = objc_alloc((Class)a1);
    v87 = v97;
    v88 = v98;
    if (v98)
    {
      v75 = (unint64_t *)&v98->__shared_owners_;
      do
        v76 = __ldxr(v75);
      while (__stxr(v76 + 1, v75));
    }
    v44 = (void *)objc_msgSend(v74, "initWithFaceIDModel:faceprintRequestRevision:personUniqueIdentifierToSerialNumberMapping:", &v87, v10, v84);
    v77 = v88;
    if (v88)
    {
      v78 = (unint64_t *)&v88->__shared_owners_;
      do
        v79 = __ldaxr(v78);
      while (__stlxr(v79 - 1, v78));
      if (!v79)
      {
        ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
        std::__shared_weak_count::__release_weak(v77);
      }
    }
    goto LABEL_76;
  }
  v11 = 0;
  while (1)
  {
    objc_msgSend(v86, "faceModelUniqueIdentifierOfPersonAtIndex:", v11);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v11 + 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setObject:forKeyedSubscript:", v12, v85);

    v13 = objc_msgSend(v86, "faceModelNumberOfFaceObservationsForPersonAtIndex:", v11);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
    if (v13)
      break;
LABEL_8:
    v20 = (void *)MEMORY[0x1A1B0B060]();
    v21 = v104;
    v99 = v104;
    if (*((_QWORD *)&v104 + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&v104 + 1) + 8);
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }
    objc_msgSend(a1, "_concatenateFaceprintImageDescriptorBuffer:withFaceprints:forIdentityWithSerialNumber:faceprintLabels:", &v99, v14, (v11 + 1), &v101);
    v24 = v113;
    v113 = 0uLL;
    v104 = v24;
    if (*((_QWORD *)&v21 + 1))
    {
      v25 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v21 + 1) + 16))(*((_QWORD *)&v21 + 1));
        std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v21 + 1));
      }
    }
    v27 = (std::__shared_weak_count *)*((_QWORD *)&v113 + 1);
    if (*((_QWORD *)&v113 + 1))
    {
      v28 = (unint64_t *)(*((_QWORD *)&v113 + 1) + 8);
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
    v30 = (std::__shared_weak_count *)*((_QWORD *)&v99 + 1);
    if (*((_QWORD *)&v99 + 1))
    {
      v31 = (unint64_t *)(*((_QWORD *)&v99 + 1) + 8);
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
    objc_autoreleasePoolPop(v20);

    if (++v11 == v9)
      goto LABEL_27;
  }
  v15 = 0;
  while (1)
  {
    objc_msgSend(v86, "faceModelFaceObservationAtIndex:forPersonAtIndex:", v15, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
      break;
    v100 = 0;
    objc_msgSend(v16, "VNPersonsModelFaceprintWithRequestRevision:error:", v10, &v100);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v100;
    if (!v18)
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mismatched faceprint request revision for observation at index %lu, person at index %lu"), v15, v11);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInvalidModelWithLocalizedDescription:underlyingError:](VNError, "errorForInvalidModelWithLocalizedDescription:underlyingError:", v43, v19);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_37;
    }
    v10 = objc_msgSend(v18, "requestRevision");
    objc_msgSend(v14, "addObject:", v18);

    if (v13 == ++v15)
      goto LABEL_8;
  }
  if (!a6)
    goto LABEL_38;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid face observation at index %lu for person at index %lu"), v15, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v17);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:

LABEL_38:
  v44 = 0;
LABEL_81:

  if (v101)
  {
    v102 = v101;
    operator delete(v101);
  }
  v64 = (std::__shared_weak_count *)*((_QWORD *)&v104 + 1);
  if (*((_QWORD *)&v104 + 1))
  {
    v65 = (unint64_t *)(*((_QWORD *)&v104 + 1) + 8);
    do
      v66 = __ldaxr(v65);
    while (__stlxr(v66 - 1, v65));
    if (!v66)
    {
      ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
      std::__shared_weak_count::__release_weak(v64);
    }
  }

  return v44;
}

+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5
{
  *a3 = 1919895091;
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __89__VNPersonsModelFaceModelVIPv3_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke(uint64_t a1)
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

uint64_t __89__VNPersonsModelFaceModelVIPv3_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_19(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56) = 1;
  return result;
}

@end
