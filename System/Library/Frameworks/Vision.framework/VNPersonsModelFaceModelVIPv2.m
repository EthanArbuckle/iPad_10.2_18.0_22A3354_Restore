@implementation VNPersonsModelFaceModelVIPv2

- (VNPersonsModelFaceModelVIPv2)initWithFaceIDModel:(shared_ptr<vision:(unint64_t)a4 :(unint64_t)a5 mod:(id)a6 :FaceIDModel>)a3 faceprintRequestRevision:maximumElementsPerID:personUniqueIdentifierToSerialNumberMapping:
{
  __shared_weak_count *cntrl;
  FaceIDModel *ptr;
  id v10;
  VNPersonsModelFaceModelVIPv2 *v11;
  VNPersonsModelFaceModelVIPv2 *v12;
  int v13;
  uint64_t v14;
  NSMapTable *serialNumberToPersonUniqueIdentifierMapTable;
  _QWORD v17[4];
  VNPersonsModelFaceModelVIPv2 *v18;
  objc_super v19;

  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v10 = (id)a5;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", a4 >> 31 == 0, CFSTR("maximumElementsPerID should be less or equal than INT32_MAX"));
  v19.receiver = self;
  v19.super_class = (Class)VNPersonsModelFaceModelVIPv2;
  v11 = -[VNPersonsModelFaceModelVIPv2 init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    std::shared_ptr<vision::mod::ImageDescriptorProcessorAbstract>::operator=[abi:ne180100](&v11->_faceIDModel.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
    v12->_faceprintRequestRevision = (unint64_t)cntrl;
    v13 = 0x7FFFFFFF;
    if (a4 < 0x7FFFFFFF)
      v13 = a4;
    v12->_maximumElementsPerID = v13;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v14 = objc_claimAutoreleasedReturnValue();
    serialNumberToPersonUniqueIdentifierMapTable = v12->_serialNumberToPersonUniqueIdentifierMapTable;
    v12->_serialNumberToPersonUniqueIdentifierMapTable = (NSMapTable *)v14;

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __142__VNPersonsModelFaceModelVIPv2_initWithFaceIDModel_faceprintRequestRevision_maximumElementsPerID_personUniqueIdentifierToSerialNumberMapping___block_invoke;
    v17[3] = &unk_1E45487B0;
    v18 = v12;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v17);

  }
  return v12;
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
    v11 = (void *)vision::mod::FaceIDModel::predict((uint64_t)self->_faceIDModel.__ptr_, a4, (uint64_t *)&v32);
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
        objc_msgSend(v12, "sortUsingComparator:", &__block_literal_global_7417);
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
  v40 = __Block_byref_object_copy__16;
  v41 = __Block_byref_object_dispose__17;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__16;
  v35 = __Block_byref_object_dispose__17;
  v36 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x4012000000;
  v28[3] = __Block_byref_object_copy__7411;
  v28[4] = __Block_byref_object_dispose__7412;
  v28[5] = "";
  v28[6] = &off_1E453A1B8;
  v30 = -1;
  v29 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __94__VNPersonsModelFaceModelVIPv2_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke;
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
  v20[2] = __94__VNPersonsModelFaceModelVIPv2_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke_2;
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
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[VNPersonsModelFaceModelVIPv2 faceCountsForAllPersons](self, "faceCountsForAllPersons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  -[VNPersonsModelFaceModelVIPv2 faceCountsForAllPersons](self, "faceCountsForAllPersons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)faceCountsForAllPersons
{
  NSDictionary *cachedPersonUniqueIdentifierToFaceprintCountMapping;
  void *v4;
  FaceIDModel *ptr;
  uint64_t *i;
  int v7;
  id v8;
  void *v9;
  uint64_t **j;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *v15;
  __int128 v17;
  __int128 v18;
  int v19;
  int v20;

  cachedPersonUniqueIdentifierToFaceprintCountMapping = self->_cachedPersonUniqueIdentifierToFaceprintCountMapping;
  if (!cachedPersonUniqueIdentifierToFaceprintCountMapping)
  {
    v4 = (void *)MEMORY[0x1A1B0B060](0, a2);
    ptr = self->_faceIDModel.__ptr_;
    v17 = 0u;
    v18 = 0u;
    v19 = 1065353216;
    for (i = (uint64_t *)*((_QWORD *)ptr + 30); i; i = (uint64_t *)*i)
    {
      v20 = *((_DWORD *)i + 4);
      v7 = *((_DWORD *)i + 6);
      *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v17, v20, &v20)+ 5) = v7;
    }
    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    v9 = (void *)objc_msgSend(v8, "initWithCapacity:", *((_QWORD *)&v18 + 1), v17);
    for (j = (uint64_t **)v18; j; j = (uint64_t **)*j)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)j + 4));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](self->_serialNumberToPersonUniqueIdentifierMapTable, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)j + 5));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v12);

      }
    }
    v14 = (NSDictionary *)objc_msgSend(v9, "copy");
    v15 = self->_cachedPersonUniqueIdentifierToFaceprintCountMapping;
    self->_cachedPersonUniqueIdentifierToFaceprintCountMapping = v14;

    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v17);
    objc_autoreleasePoolPop(v4);
    cachedPersonUniqueIdentifierToFaceprintCountMapping = self->_cachedPersonUniqueIdentifierToFaceprintCountMapping;
  }
  return cachedPersonUniqueIdentifierToFaceprintCountMapping;
}

- (id)trainingFaceprintsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  void *IdentityTrainingData;
  vision::mod::ImageDescriptorBufferAbstract *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t i;
  unint64_t DataForKthDescriptor;
  VNFaceprint *v15;
  double v16;
  VNFaceprint *v17;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  vision::mod::ImageDescriptorBufferAbstract *v22;
  std::__shared_weak_count *v23;
  int v24;

  v24 = 0;
  if (!-[VNPersonsModelFaceModelVIPv2 _getSerialNumber:forPersonUniqueIdentifier:error:](self, "_getSerialNumber:forPersonUniqueIdentifier:error:", &v24, a3, a4))return 0;
  v22 = 0;
  v23 = 0;
  IdentityTrainingData = (void *)vision::mod::FaceIDModel::getIdentityTrainingData(self->_faceIDModel.__ptr_, v24, &v22);
  if (IdentityTrainingData == 128)
  {
    v7 = v22;
    v8 = *((_QWORD *)v22 + 9);
    if (v8)
    {
      v9 = *((_QWORD *)v22 + 8);
      v10 = *((_QWORD *)v22 + 12);
      v11 = -[VNPersonsModelFaceModelVIPv2 faceprintRequestRevision](self, "faceprintRequestRevision");
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
      for (i = 0; i != v8; ++i)
      {
        DataForKthDescriptor = vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v7, i);
        v15 = [VNFaceprint alloc];
        LODWORD(v16) = 1.0;
        v17 = -[VNFaceprint initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:](v15, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", DataForKthDescriptor, v10, 1, v9, v11, v16);
        objc_msgSend(v12, "addObject:", v17);

      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else if (a4)
  {
    VNErrorForCVMLStatus(IdentityTrainingData);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v19 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  return v12;
}

- (VNPersonsModelFaceModelVIPv2)initWithCoder:(id)a3
{
  id v4;
  VNPersonsModelFaceModelVIPv2 *v5;
  VNPersonsModelFaceModelVIPv2 *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMapTable *serialNumberToPersonUniqueIdentifierMapTable;
  int maximumElementsPerID;
  id v12;
  shared_ptr<vision::mod::FaceIDModel> *p_faceIDModel;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  VNPersonsModelFaceModelVIPv2 *v24;
  id v26;
  _QWORD aBlock[4];
  id v28;
  VNPersonsModelFaceModelVIPv2 *v29;
  id v30;
  __int128 v31;
  _QWORD v32[4];
  VNPersonsModelFaceModelVIPv2 *v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VNPersonsModelFaceModelVIPv2;
  v5 = -[VNPersonsModelFaceModelVIPv2 init](&v34, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1B0B060]();
    if (_serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::onceToken != -1)
      dispatch_once(&_serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::onceToken, &__block_literal_global_91);
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
      v32[2] = __46__VNPersonsModelFaceModelVIPv2_initWithCoder___block_invoke;
      v32[3] = &unk_1E4548840;
      v33 = v5;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v32);

    }
    objc_autoreleasePoolPop(v7);
    if (v8)
    {
      v5->_maximumElementsPerID = objc_msgSend(v4, "decodeIntForKey:", CFSTR("maximumElementsPerID"));
      v5->_faceprintRequestRevision = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("faceprintRequestRevision"));
      maximumElementsPerID = v5->_maximumElementsPerID;
      v30 = 0;
      _newFaceIDModel(&v31, maximumElementsPerID, (uint64_t)&v30);
      v12 = v30;
      p_faceIDModel = &v5->_faceIDModel;
      v14 = std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)p_faceIDModel, &v31);
      v15 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
      if (*((_QWORD *)&v31 + 1))
      {
        v16 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
        do
          v17 = __ldaxr(v16);
        while (__stlxr(v17 - 1, v16));
        if (!v17)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      if (p_faceIDModel->__ptr_)
      {
        v18 = (void *)MEMORY[0x1A1B0B060](v14);
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceIDModel"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __46__VNPersonsModelFaceModelVIPv2_initWithCoder___block_invoke_2;
          aBlock[3] = &unk_1E45488F0;
          v28 = v19;
          v29 = v6;
          v21 = _Block_copy(aBlock);
          v26 = 0;
          v22 = VNExecuteBlock(v21, (uint64_t)&v26);
          v23 = v26;
          if ((v22 & 1) == 0)
            objc_msgSend(v4, "failWithError:", v23);

        }
        else
        {
          v22 = 1;
        }

        objc_autoreleasePoolPop(v18);
        if (v22)
          goto LABEL_20;
      }
      else
      {
        objc_msgSend(v4, "failWithError:", v12);

      }
    }
    v24 = 0;
    goto LABEL_22;
  }
LABEL_20:
  v24 = v6;
LABEL_22:

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  _QWORD aBlock[5];
  id v14;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", self->_maximumElementsPerID, CFSTR("maximumElementsPerID"));
  v5 = (void *)MEMORY[0x1A1B0B060](objc_msgSend(v4, "encodeInteger:forKey:", self->_faceprintRequestRevision, CFSTR("faceprintRequestRevision")));
  -[NSMapTable dictionaryRepresentation](self->_serialNumberToPersonUniqueIdentifierMapTable, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("serialNumberToIdentifier"));

  objc_autoreleasePoolPop(v5);
  v7 = (void *)MEMORY[0x1A1B0B060]();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__VNPersonsModelFaceModelVIPv2_encodeWithCoder___block_invoke;
  aBlock[3] = &unk_1E45488F0;
  aBlock[4] = self;
  v8 = v4;
  v14 = v8;
  v9 = _Block_copy(aBlock);
  v12 = 0;
  v10 = VNExecuteBlock(v9, (uint64_t)&v12);
  v11 = v12;
  if ((v10 & 1) == 0)
    objc_msgSend(v8, "failWithError:", v11);

  objc_autoreleasePoolPop(v7);
}

- (void).cxx_destruct
{
  std::shared_ptr<rtcv::Logger::Target>::~shared_ptr[abi:nn180100]((uint64_t)&self->_faceIDModel);
  objc_storeStrong((id *)&self->_cachedPersonUniqueIdentifierToFaceprintCountMapping, 0);
  objc_storeStrong((id *)&self->_serialNumberToPersonUniqueIdentifierMapTable, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

BOOL __48__VNPersonsModelFaceModelVIPv2_encodeWithCoder___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  std::ios_base v11;
  uint64_t v12;
  int v13;
  _BYTE __sb[64];
  id v15;

  VNNSMutableDataStreambuf::VNNSMutableDataStreambuf((VNNSMutableDataStreambuf *)__sb);
  v10 = MEMORY[0x1E0DE4FA0] + 24;
  v11.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E0DE4FA0] + 64);
  std::ios_base::init(&v11, __sb);
  v12 = 0;
  v13 = -1;
  v4 = (void *)vision::mod::FaceIDModel::serialize(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 24));
  if (v4 == 128)
  {
    std::ostream::flush();
    v5 = v15;
    objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v5, CFSTR("faceIDModel"));
LABEL_5:

    goto LABEL_6;
  }
  if (a2)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Face ID model data serialization failed with code %@"), v7, v10);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    VNErrorForCVMLStatus(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v5, v8);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
LABEL_6:
  std::ostream::~ostream();

  std::streambuf::~streambuf();
  return v4 == 128;
}

uint64_t __46__VNPersonsModelFaceModelVIPv2_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", a3, a2);
}

BOOL __46__VNPersonsModelFaceModelVIPv2_initWithCoder___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  std::ios_base v11;
  uint64_t v12;
  int v13;
  _BYTE __sb[64];
  id v15;

  VNNSDataStreambuf::VNNSDataStreambuf((VNNSDataStreambuf *)__sb, *(NSData **)(a1 + 32));
  v11.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E0DE4F98] + 64);
  std::ios_base::init(&v11, __sb);
  v12 = 0;
  v13 = -1;
  v4 = (void *)vision::mod::FaceIDModel::deserialize(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v5 = v4;
  if (a2 && v4 != 128)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Face ID model data deserialization failed with code %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    VNErrorForCVMLStatus(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInternalErrorWithLocalizedDescription:underlyingError:](VNError, "errorForInternalErrorWithLocalizedDescription:underlyingError:", v8, v9);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  std::istream::~istream();

  std::streambuf::~streambuf();
  return v5 == 128;
}

void __94__VNPersonsModelFaceModelVIPv2_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke(_QWORD *a1)
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

uint64_t __94__VNPersonsModelFaceModelVIPv2_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56) = 1;
  return result;
}

uint64_t __101__VNPersonsModelFaceModelVIPv2__personPredictionsForFace_withDescriptor_limit_faceIDCanceller_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
      objc_msgSend(v4, "predictedPersonUniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "predictedPersonUniqueIdentifier");
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

uint64_t __142__VNPersonsModelFaceModelVIPv2_initWithFaceIDModel_faceprintRequestRevision_maximumElementsPerID_personUniqueIdentifierToSerialNumberMapping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", a2, a3);
}

+ (shared_ptr<vision::mod::ImageDescriptorBufferFloat32>)_concatenateFaceprintImageDescriptorBuffer:(shared_ptr<vision:(id)a4 :(int)a5 mod:(void *)a6 :(id *)a7 ImageDescriptorBufferFloat32>)a3 withFaceprints:forIdentityWithSerialNumber:faceprintLabels:error:
{
  ImageDescriptorBufferFloat32 *v7;
  uint64_t v9;
  ImageDescriptorBufferFloat32 *var0;
  void *v11;
  uint64_t v12;
  size_t v13;
  vision::mod::ImageDescriptorBufferAbstract *v14;
  uint64_t v15;
  int v16;
  _QWORD *v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *DataForKthDescriptor;
  id v29;
  unint64_t v30;
  _DWORD *v31;
  _DWORD *v32;
  _DWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  BOOL v37;
  unint64_t v38;
  uint64_t v39;
  _DWORD *v40;
  int v41;
  void *v42;
  ImageDescriptorBufferFloat32 *v43;
  __shared_weak_count *v44;
  ImageDescriptorBufferFloat32 *v45;
  void *v46;
  int v47;
  __shared_weak_count *v48;
  __int128 v49;
  void *__p[3];
  shared_ptr<vision::mod::ImageDescriptorBufferFloat32> result;

  v9 = *(_QWORD *)&a5;
  v47 = (int)a4;
  var0 = a3.var0;
  v45 = v7;
  v48 = a3.var1;
  -[__shared_weak_count firstObject](v48, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v11;
  v12 = objc_msgSend(v11, "lengthInBytes");
  v13 = v12;
  v14 = *(vision::mod::ImageDescriptorBufferAbstract **)var0;
  if (!*(_QWORD *)var0)
  {
    v17 = operator new(8uLL);
    *v17 = 1;
    __p[1] = v17 + 1;
    __p[2] = v17 + 1;
    __p[0] = v17;
    v18 = malloc_type_malloc(v13, 0x9A450019uLL);
    std::allocate_shared[abi:ne180100]<vision::mod::ImageDescriptorBufferFloat32,std::allocator<vision::mod::ImageDescriptorBufferFloat32>,std::vector<long long> &,void *,unsigned long,int,BOOL,void>((uint64_t *)&v49, (_QWORD **)__p, v18, v13, 1, 1);
    std::shared_ptr<vision::mod::ImageAnalyzer>::operator=[abi:ne180100]((uint64_t)var0, &v49);
    v19 = (std::__shared_weak_count *)*((_QWORD *)&v49 + 1);
    if (*((_QWORD *)&v49 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v49 + 1) + 8);
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    if (__p[0])
      operator delete(__p[0]);
    v16 = 0;
    goto LABEL_12;
  }
  v15 = *((_QWORD *)v14 + 8);
  if (v15 == v12)
  {
    v16 = *((_DWORD *)v14 + 18);
LABEL_12:
    v22 = -[__shared_weak_count count](v48, "count");
    v23 = v22 + v16;
    vision::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount(*(vision::mod::ImageDescriptorBufferAbstract **)var0, v23, v16 > 0);
    std::vector<long long>::resize((char **)(*(_QWORD *)var0 + 8), v23);
    if (v22)
    {
      v24 = 0;
      v25 = v16;
      do
      {
        -[__shared_weak_count objectAtIndexedSubscript:](v48, "objectAtIndexedSubscript:", v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "descriptorData");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)var0, v25);
        v29 = objc_retainAutorelease(v27);
        memcpy(DataForKthDescriptor, (const void *)objc_msgSend(v29, "bytes"), v13);
        vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)var0, v25, v47);
        v31 = *(_DWORD **)(v9 + 8);
        v30 = *(_QWORD *)(v9 + 16);
        if ((unint64_t)v31 >= v30)
        {
          v33 = *(_DWORD **)v9;
          v34 = ((uint64_t)v31 - *(_QWORD *)v9) >> 2;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          v36 = v30 - (_QWORD)v33;
          if (v36 >> 1 > v35)
            v35 = v36 >> 1;
          v37 = (unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL;
          v38 = 0x3FFFFFFFFFFFFFFFLL;
          if (!v37)
            v38 = v35;
          if (v38)
          {
            v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v38);
            v33 = *(_DWORD **)v9;
            v31 = *(_DWORD **)(v9 + 8);
          }
          else
          {
            v39 = 0;
          }
          v40 = (_DWORD *)(v38 + 4 * v34);
          *v40 = v47;
          v32 = v40 + 1;
          while (v31 != v33)
          {
            v41 = *--v31;
            *--v40 = v41;
          }
          *(_QWORD *)v9 = v40;
          *(_QWORD *)(v9 + 8) = v32;
          *(_QWORD *)(v9 + 16) = v38 + 4 * v39;
          if (v33)
            operator delete(v33);
        }
        else
        {
          *v31 = v47;
          v32 = v31 + 1;
        }
        *(_QWORD *)(v9 + 8) = v32;
        ++v25;

        ++v24;
        v11 = v46;
      }
      while (v24 != v22);
    }
    *(_OWORD *)v45 = *(_OWORD *)var0;
    goto LABEL_34;
  }
  if (a6)
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The model is expecting a faceprint size of %lu instead of %lu"), v15, v12);
    VNPersonsModelErrorForIncompatibleFaceprint(v42);
    *(_QWORD *)a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  var0 = v45;
LABEL_34:
  *(_QWORD *)var0 = 0;
  *((_QWORD *)var0 + 1) = 0;

  result.var1 = v44;
  result.var0 = v43;
  return result;
}

+ (id)modelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  __int128 v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  std::__shared_weak_count *v54;
  unint64_t *v55;
  unint64_t v56;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  id v64;
  unint64_t *v65;
  unint64_t v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  uint64_t v70;
  void *v72;
  id v73;
  VNCanceller *v74;
  uint64_t v75;
  void *v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  _QWORD v80[5];
  _QWORD v81[7];
  std::__shared_weak_count *v82;
  uint64_t v83;
  std::__shared_weak_count *v84;
  void *__p;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  __int128 v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  uint64_t (*v97)();
  const char *v98;
  uint64_t (**v99)(vision::mod::CVMLCanceller *__hidden);
  char v100;
  int v101;
  uint64_t v102;
  std::__shared_weak_count *v103;
  uint64_t v104;
  std::__shared_weak_count *v105;
  id v106;
  void *v107;
  _BYTE *v108;
  uint64_t v109;
  __int128 v110;

  v73 = a3;
  v8 = a4;
  v74 = (VNCanceller *)a5;
  v77 = v8;
  v9 = objc_msgSend(v8, "faceModelPersonsCount");
  v110 = 0uLL;
  v107 = 0;
  v108 = 0;
  v109 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v9);
  v72 = v10;
  if (!v9)
  {
    v75 = 0;
    v11 = 0;
LABEL_31:
    v34 = objc_msgSend(v73, "faceID2ModelMaximumElementsPerID");
    _newFaceIDModel(&v102, v34, (uint64_t)a6);
    v35 = v102;
    if (!v102)
      goto LABEL_68;
    if (v75)
    {
      if (!v74)
        v74 = objc_alloc_init(VNCanceller);
      *(_QWORD *)&v94 = 0;
      *((_QWORD *)&v94 + 1) = &v94;
      v95 = 0x4012000000;
      v96 = __Block_byref_object_copy__7411;
      v97 = __Block_byref_object_dispose__7412;
      v98 = "";
      v99 = &off_1E453A1B8;
      v101 = -1;
      v100 = 0;
      v88 = 0;
      v89 = &v88;
      v90 = 0x3032000000;
      v91 = __Block_byref_object_copy__16;
      v92 = __Block_byref_object_dispose__17;
      v93 = 0;
      v36 = MEMORY[0x1E0C809B0];
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3321888768;
      v81[2] = __89__VNPersonsModelFaceModelVIPv2_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke;
      v81[3] = &unk_1E453C0F8;
      v81[6] = v35;
      v82 = v103;
      if (v103)
      {
        p_shared_owners = (unint64_t *)&v103->__shared_owners_;
        do
          v38 = __ldxr(p_shared_owners);
        while (__stxr(v38 + 1, p_shared_owners));
      }
      v83 = v75;
      v84 = (std::__shared_weak_count *)*((_QWORD *)&v110 + 1);
      if (*((_QWORD *)&v110 + 1))
      {
        v39 = (unint64_t *)(*((_QWORD *)&v110 + 1) + 8);
        do
          v40 = __ldxr(v39);
        while (__stxr(v40 + 1, v39));
      }
      __p = 0;
      v86 = 0;
      v87 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v107, (uint64_t)v108, (v108 - (_BYTE *)v107) >> 2);
      v81[4] = &v94;
      v81[5] = &v88;
      v80[0] = v36;
      v80[1] = 3221225472;
      v80[2] = __89__VNPersonsModelFaceModelVIPv2_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_19;
      v80[3] = &unk_1E4548FA8;
      v80[4] = &v94;
      if (!-[VNCanceller tryToPerformBlock:usingSignallingBlock:](v74, "tryToPerformBlock:usingSignallingBlock:", v81, v80))
      {
        if (a6)
        {
          VNPersonsModelErrorCancelledOperation();
          v42 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_54;
        }
LABEL_55:
        if (__p)
        {
          v86 = __p;
          operator delete(__p);
        }
        v45 = v84;
        if (v84)
        {
          v46 = (unint64_t *)&v84->__shared_owners_;
          do
            v47 = __ldaxr(v46);
          while (__stlxr(v47 - 1, v46));
          if (!v47)
          {
            ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
            std::__shared_weak_count::__release_weak(v45);
          }
        }
        v48 = v82;
        if (v82)
        {
          v49 = (unint64_t *)&v82->__shared_owners_;
          do
            v50 = __ldaxr(v49);
          while (__stlxr(v50 - 1, v49));
          if (!v50)
          {
            ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
            std::__shared_weak_count::__release_weak(v48);
          }
        }
        _Block_object_dispose(&v88, 8);

        _Block_object_dispose(&v94, 8);
LABEL_68:
        v44 = 0;
LABEL_69:
        v51 = v103;
        if (v103)
        {
          v52 = (unint64_t *)&v103->__shared_owners_;
          do
            v53 = __ldaxr(v52);
          while (__stlxr(v53 - 1, v52));
          if (!v53)
          {
            ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
            std::__shared_weak_count::__release_weak(v51);
          }
        }
        goto LABEL_74;
      }
      v41 = (void *)v89[5];
      if (v41)
      {
        if (a6)
        {
          v42 = objc_retainAutorelease(v41);
LABEL_54:
          *a6 = v42;
          goto LABEL_55;
        }
        goto LABEL_55;
      }
      if (__p)
      {
        v86 = __p;
        operator delete(__p);
      }
      v58 = v84;
      if (v84)
      {
        v59 = (unint64_t *)&v84->__shared_owners_;
        do
          v60 = __ldaxr(v59);
        while (__stlxr(v60 - 1, v59));
        if (!v60)
        {
          ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
          std::__shared_weak_count::__release_weak(v58);
        }
      }
      v61 = v82;
      if (v82)
      {
        v62 = (unint64_t *)&v82->__shared_owners_;
        do
          v63 = __ldaxr(v62);
        while (__stlxr(v63 - 1, v62));
        if (!v63)
        {
          ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
          std::__shared_weak_count::__release_weak(v61);
        }
      }
      _Block_object_dispose(&v88, 8);

      _Block_object_dispose(&v94, 8);
    }
    v64 = objc_alloc((Class)a1);
    v78 = v102;
    v79 = v103;
    if (v103)
    {
      v65 = (unint64_t *)&v103->__shared_owners_;
      do
        v66 = __ldxr(v65);
      while (__stxr(v66 + 1, v65));
    }
    v44 = (void *)objc_msgSend(v64, "initWithFaceIDModel:faceprintRequestRevision:maximumElementsPerID:personUniqueIdentifierToSerialNumberMapping:", &v78, v11, v34, v10);
    v67 = v79;
    if (v79)
    {
      v68 = (unint64_t *)&v79->__shared_owners_;
      do
        v69 = __ldaxr(v68);
      while (__stlxr(v69 - 1, v68));
      if (!v69)
      {
        ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
        std::__shared_weak_count::__release_weak(v67);
      }
    }
    goto LABEL_69;
  }
  v70 = v9;
  v75 = 0;
  v11 = 0;
  v12 = 0;
  while (1)
  {
    objc_msgSend(v77, "faceModelUniqueIdentifierOfPersonAtIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v12 + 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v13);

    v15 = objc_msgSend(v77, "faceModelNumberOfFaceObservationsForPersonAtIndex:", v12);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15);
    if (v15)
      break;
LABEL_8:
    if (objc_msgSend(v16, "count"))
    {
      v22 = (void *)MEMORY[0x1A1B0B060]();
      v23 = (std::__shared_weak_count *)*((_QWORD *)&v110 + 1);
      v104 = v75;
      v105 = (std::__shared_weak_count *)*((_QWORD *)&v110 + 1);
      if (*((_QWORD *)&v110 + 1))
      {
        v24 = (unint64_t *)(*((_QWORD *)&v110 + 1) + 8);
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      objc_msgSend(a1, "_concatenateFaceprintImageDescriptorBuffer:withFaceprints:forIdentityWithSerialNumber:faceprintLabels:error:", &v104, v16, (v12 + 1), &v107, a6);
      v26 = v94;
      v94 = 0uLL;
      v110 = v26;
      if (v23)
      {
        v27 = (unint64_t *)&v23->__shared_owners_;
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
      }
      if (*((_QWORD *)&v94 + 1))
      {
        v29 = (unint64_t *)(*((_QWORD *)&v94 + 1) + 8);
        do
          v30 = __ldaxr(v29);
        while (__stlxr(v30 - 1, v29));
        if (!v30)
        {
          (*(void (**)(_QWORD))(**((_QWORD **)&v94 + 1) + 16))(*((_QWORD *)&v94 + 1));
          std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v94 + 1));
        }
      }
      v31 = v105;
      if (v105)
      {
        v32 = (unint64_t *)&v105->__shared_owners_;
        do
          v33 = __ldaxr(v32);
        while (__stlxr(v33 - 1, v32));
        if (!v33)
        {
          ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
          std::__shared_weak_count::__release_weak(v31);
        }
      }
      v75 = v110;
      objc_autoreleasePoolPop(v22);
      if (!v75)
        goto LABEL_51;
    }

    ++v12;
    v10 = v72;
    if (v12 == v70)
      goto LABEL_31;
  }
  v17 = 0;
  while (1)
  {
    objc_msgSend(v77, "faceModelFaceObservationAtIndex:forPersonAtIndex:", v17, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
      break;
    v106 = 0;
    objc_msgSend(v18, "VNPersonsModelFaceprintWithRequestRevision:error:", v11, &v106);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v106;
    if (!v20)
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mismatched faceprint request revision for observation at index %lu, person at index %lu"), v17, v12);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInvalidModelWithLocalizedDescription:underlyingError:](VNError, "errorForInvalidModelWithLocalizedDescription:underlyingError:", v43, v21);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_50;
    }
    v11 = objc_msgSend(v20, "requestRevision");
    objc_msgSend(v16, "addObject:", v20);

    if (v15 == ++v17)
      goto LABEL_8;
  }
  if (!a6)
    goto LABEL_51;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid face observation at index %lu for person at index %lu"), v17, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v19);
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:

LABEL_51:
  v44 = 0;
  v10 = v72;
LABEL_74:

  if (v107)
  {
    v108 = v107;
    operator delete(v107);
  }
  v54 = (std::__shared_weak_count *)*((_QWORD *)&v110 + 1);
  if (*((_QWORD *)&v110 + 1))
  {
    v55 = (unint64_t *)(*((_QWORD *)&v110 + 1) + 8);
    do
      v56 = __ldaxr(v55);
    while (__stlxr(v56 - 1, v55));
    if (!v56)
    {
      ((void (*)(std::__shared_weak_count *))v54->__on_zero_shared)(v54);
      std::__shared_weak_count::__release_weak(v54);
    }
  }

  return v44;
}

+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5
{
  *a3 = 1919895117;
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __89__VNPersonsModelFaceModelVIPv2_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke(uint64_t a1)
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

uint64_t __89__VNPersonsModelFaceModelVIPv2_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_19(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 56) = 1;
  return result;
}

@end
