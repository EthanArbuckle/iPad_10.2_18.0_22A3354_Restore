@implementation VNEntityIdentificationModel

- (BOOL)writeVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  CC_MD5state_st *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  _BOOL4 v32;
  BOOL v33;
  void *v35;
  id *v36;
  id v37;
  id v38;
  VNEntityIdentificationModel *v39;
  id v40;
  BOOL v41;
  unint64_t v42;
  void *context;
  id v44;
  BOOL v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  CC_MD5state_st *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;

  v10 = a3;
  v11 = a4;
  if (!-[VNEntityIdentificationModel _writePreambleAndCommonTagsForModelKind:version:toOutputStream:md5Context:error:]((id *)&self->super.isa, 1701405805, v10, a5, a6)|| !-[VNEntityIdentificationModel _writeVersion1ConfigurationToOutputStream:options:md5Context:error:](self, v10, a5, a6))
  {
    goto LABEL_23;
  }
  v12 = v10;
  v13 = v11;
  v14 = v13;
  if (!self)
  {

LABEL_23:
    v33 = 0;
    goto LABEL_24;
  }
  v42 = -[VNEntityIdentificationModel entityCount](self, "entityCount");
  if (v42)
  {
    v35 = v14;
    v36 = a6;
    v37 = v11;
    v38 = v10;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v39 = self;
    v40 = v12;
    while (1)
    {
      v41 = v15;
      v18 = (void *)MEMORY[0x1A1B0B060]();
      -[VNEntityIdentificationModel uniqueIdentifierForEntityAtIndex:](self, "uniqueIdentifierForEntityAtIndex:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v17;
      -[VNEntityIdentificationModel observationsForEntityWithUniqueIdentifier:error:](self, "observationsForEntityWithUniqueIdentifier:error:", v19, &v44);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v44;

      if (!v20)
      {

        objc_autoreleasePoolPop(v18);
        v17 = v21;
        goto LABEL_15;
      }
      context = v18;
      v22 = v19;
      v23 = v20;
      v24 = v12;
      v58 = 0;
      v59 = &v58;
      v60 = 0x2020000000;
      v61 = 1;
      v52 = 0;
      v53 = &v52;
      v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__29432;
      v56 = __Block_byref_object_dispose__29433;
      v57 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = ___writeVersion1EntityAndObservations_block_invoke;
      aBlock[3] = &unk_1E4548348;
      v25 = v22;
      v47 = v25;
      v26 = v24;
      v48 = v26;
      v49 = &v52;
      v27 = a5;
      v50 = &v58;
      v51 = a5;
      v28 = _Block_copy(aBlock);
      v29 = (void *)MEMORY[0x1A1B0B060]();
      objc_msgSend(v23, "vn_enumerateObjectsAsSubarraysOfCount:usingBlock:", 20, v28);
      objc_autoreleasePoolPop(v29);
      v30 = *((unsigned __int8 *)v59 + 24);
      v31 = v21;
      if (!*((_BYTE *)v59 + 24))
        v31 = objc_retainAutorelease((id)v53[5]);

      _Block_object_dispose(&v52, 8);
      _Block_object_dispose(&v58, 8);

      v17 = v31;
      objc_autoreleasePoolPop(context);
      if (!v30)
        break;
      v15 = ++v16 >= v42;
      a5 = v27;
      self = v39;
      v12 = v40;
      if (v42 == v16)
        goto LABEL_16;
    }
    a5 = v27;
    v12 = v40;
LABEL_15:
    v15 = v41;
LABEL_16:
    v14 = v35;
    a6 = v36;
    if (v36)
    {
      v11 = v37;
      v10 = v38;
      if (!v15)
      {
        v17 = objc_retainAutorelease(v17);
        v15 = 0;
        *v36 = v17;
      }
    }
    else
    {
      v11 = v37;
      v10 = v38;
    }
  }
  else
  {
    v17 = 0;
    v15 = 1;
  }
  v45 = v15;

  v32 = v45;
  if (!v32)
    goto LABEL_23;
  v33 = VNEntityIdentificationModelIOWriteUInt32ToOutputStream(1701405805, v12, a5, a6);
LABEL_24:

  return v33;
}

- (BOOL)writeReadOnlyVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  int v15;
  int v16;

  v10 = a3;
  v11 = a4;
  -[VNEntityIdentificationModel trainedModelWithCanceller:error:](self, "trainedModelWithCanceller:error:", 0, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_8;
  v15 = 0;
  v13 = 0;
  if (objc_msgSend((id)objc_opt_class(), "getStoredRepresentationTag:forModelVersion:error:", &v15, 1, a6))
  {
    if (-[VNEntityIdentificationModel _writePreambleAndCommonTagsForModelKind:version:toOutputStream:md5Context:error:]((id *)&self->super.isa, 1701409391, v10, a5, a6))
    {
      if (-[VNEntityIdentificationModel _writeVersion1ConfigurationToOutputStream:options:md5Context:error:](self, v10, a5, a6))
      {
        v16 = 1497715488;
        if (VNEntityIdentificationModelIOWriteTaggedBufferToOutputStream(1378832160, &v16, 4u, v10, a5, a6))
        {
          if (VNEntityIdentificationModelIOWriteTaggedNSObjectToOutputStream(v15, v12, v10, a5, (uint64_t)a6))
          {
            v13 = VNEntityIdentificationModelIOWriteUInt32ToOutputStream(1701409391, v10, a5, a6);
            goto LABEL_9;
          }
        }
      }
    }
LABEL_8:
    v13 = 0;
  }
LABEL_9:

  return v13;
}

- (VNEntityIdentificationModel)initWithConfiguration:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  VNEntityIdentificationModel *v8;
  uint64_t v9;
  VNEntityIdentificationModelConfiguration *configuration;
  VNEntityIdentificationModelConfiguration *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNEntityIdentificationModel;
  v8 = -[VNEntityIdentificationModel init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (VNEntityIdentificationModelConfiguration *)v9;

    v11 = v8->_configuration;
    -[VNEntityIdentificationModelConfiguration resolvedAlgorithmAndReturnError:](v11, "resolvedAlgorithmAndReturnError:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNEntityIdentificationModelConfiguration setAlgorithm:](v11, "setAlgorithm:", v12);

    objc_storeWeak((id *)&v8->_dataSource_DO_NOT_ACCESS_DIRECTLY, v7);
  }

  return v8;
}

- (id)trainedModelWithCanceller:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  VNEntityIdentificationModelTrainedModel *v9;
  void *v10;
  void *v11;
  _VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider *v12;
  void *v13;
  VNEntityIdentificationModelTrainedModel *v14;
  id v15;
  VNEntityIdentificationModelTrainedModel *trainedModel_DO_NOT_ACCESS_DIRECTLY;
  VNEntityIdentificationModelTrainedModel *v17;
  id v19;

  v6 = a3;
  -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_22;
  if (!self->_trainedModel_DO_NOT_ACCESS_DIRECTLY)
  {
    v8 = 0;
LABEL_10:
    -[VNEntityIdentificationModel delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
      objc_msgSend(v10, "willTrainEntityIdentificationModel:withCanceller:", self, v6);
    v12 = -[_VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider initWithEntityIdentificationModel:dataSource:]([_VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider alloc], "initWithEntityIdentificationModel:dataSource:", self, v7);
    -[VNEntityIdentificationModel configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    +[VNEntityIdentificationModelTrainedModel trainedModelBuiltFromConfiguration:dataProvider:canceller:error:](VNEntityIdentificationModelTrainedModel, "trainedModelBuiltFromConfiguration:dataProvider:canceller:error:", v13, v12, v6, &v19);
    v14 = (VNEntityIdentificationModelTrainedModel *)objc_claimAutoreleasedReturnValue();
    v15 = v19;
    trainedModel_DO_NOT_ACCESS_DIRECTLY = self->_trainedModel_DO_NOT_ACCESS_DIRECTLY;
    self->_trainedModel_DO_NOT_ACCESS_DIRECTLY = v14;

    if (!self->_trainedModel_DO_NOT_ACCESS_DIRECTLY)
    {
      if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
        objc_msgSend(v11, "entityIdentificationModel:trainingFailedWithError:", self, v15);
      if (a4)
        *a4 = objc_retainAutorelease(v15);

      goto LABEL_22;
    }
    self->_lastDataChangeSequenceNumber = v8;
    if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
      objc_msgSend(v11, "didTrainEntityIdentificationModel:", self);

    v9 = self->_trainedModel_DO_NOT_ACCESS_DIRECTLY;
    goto LABEL_16;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "lastDataChangeSequenceNumberForEntityIdentificationModel:", self);
    if (v8 != self->_lastDataChangeSequenceNumber
      && !-[VNEntityIdentificationModel dropTrainedModelAndReturnError:](self, "dropTrainedModelAndReturnError:", a4))
    {
LABEL_22:
      v17 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = self->_trainedModel_DO_NOT_ACCESS_DIRECTLY;
  if (!v9)
    goto LABEL_10;
LABEL_16:
  v17 = v9;
LABEL_23:

  return v17;
}

- (BOOL)dropTrainedModelAndReturnError:(id *)a3
{
  void *v4;
  void *v5;
  VNEntityIdentificationModelTrainedModel *trainedModel_DO_NOT_ACCESS_DIRECTLY;

  if (self->_trainedModel_DO_NOT_ACCESS_DIRECTLY)
  {
    -[VNEntityIdentificationModel delegate](self, "delegate", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
      objc_msgSend(v4, "entityIdentificationModelWillDropTrainingData:", self);
    trainedModel_DO_NOT_ACCESS_DIRECTLY = self->_trainedModel_DO_NOT_ACCESS_DIRECTLY;
    self->_trainedModel_DO_NOT_ACCESS_DIRECTLY = 0;

    if ((*(_BYTE *)&self->_delegateFlags & 0x10) != 0)
      objc_msgSend(v5, "entityIdentificationModelDidDropTrainingData:", self);

  }
  return 1;
}

- (VNEntityIdentificationModelDelegate)delegate
{
  return (VNEntityIdentificationModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate_DO_NOT_ACCESS_DIRECTLY);
}

- (void)setDelegate:(id)a3
{
  VNEntityIdentificationModelDelegate **p_delegate_DO_NOT_ACCESS_DIRECTLY;
  id v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;

  p_delegate_DO_NOT_ACCESS_DIRECTLY = &self->_delegate_DO_NOT_ACCESS_DIRECTLY;
  v5 = a3;
  objc_storeWeak((id *)p_delegate_DO_NOT_ACCESS_DIRECTLY, v5);
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 4;
  else
    v7 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 8;
  else
    v8 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v8;
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
    v10 = 16;
  else
    v10 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xEF | v10;
}

- (BOOL)writeToStream:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A1B0B060]();
  v14 = 0;
  v11 = -[VNEntityIdentificationModel _writeToOutputStream:options:error:]((_BOOL8)self, v8, v9, &v14);
  v12 = v14;
  objc_autoreleasePoolPop(v10);
  if (a5 && !v11)
    *a5 = objc_retainAutorelease(v12);

  return v11;
}

- (id)dataWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v15;

  v6 = a3;
  v7 = (void *)MEMORY[0x1A1B0B060]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToMemory");
  v15 = 0;
  v9 = -[VNEntityIdentificationModel _writeToUnopenedOutputStream:options:error:]((_BOOL8)self, v8, v6, &v15);
  v10 = v15;
  if (v9)
  {
    objc_msgSend(v8, "propertyForKey:", *MEMORY[0x1E0C99868]);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;

      objc_autoreleasePoolPop(v7);
      goto LABEL_8;
    }
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(1, CFSTR("failed to obtain the data"), 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v13;
  }

  objc_autoreleasePoolPop(v7);
  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    v12 = 0;
    *a4 = v10;
  }
  else
  {
    v12 = 0;
  }
LABEL_8:

  return v12;
}

- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A1B0B060]();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initWithURL:append:", v8, 0);
  v15 = 0;
  v12 = -[VNEntityIdentificationModel _writeToUnopenedOutputStream:options:error:]((_BOOL8)self, v11, v9, &v15);
  v13 = v15;

  objc_autoreleasePoolPop(v10);
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (VNEntityIdentificationModelConfiguration)configuration
{
  return (VNEntityIdentificationModelConfiguration *)(id)-[VNEntityIdentificationModelConfiguration copy](self->_configuration, "copy");
}

- (VNEntityIdentificationModelInformation)information
{
  void *v3;
  void *v4;
  void *v5;
  VNEntityIdentificationModelInformation *v6;

  -[VNEntityIdentificationModelConfiguration resolvedAlgorithmAndReturnError:](self->_configuration, "resolvedAlgorithmAndReturnError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "lastModificationDateForEntityIdentificationModel:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = -[VNEntityIdentificationModelInformation initWithVersion:algorithm:lastModificationDate:readOnly:]([VNEntityIdentificationModelInformation alloc], "initWithVersion:algorithm:lastModificationDate:readOnly:", 1, v3, v5, objc_msgSend((id)objc_opt_class(), "isReadOnly"));

  return v6;
}

- (BOOL)validateWithCanceller:(id)a3 error:(id *)a4
{
  void *v4;
  BOOL v5;

  -[VNEntityIdentificationModel trainedModelWithCanceller:error:](self, "trainedModelWithCanceller:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (unint64_t)entityCount
{
  void *v3;
  unint64_t v4;

  -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfEntitiesInEntityIdentificationModel:", self);

  return v4;
}

- (id)entityUniqueIdentifiers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;

  -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfEntitiesInEntityIdentificationModel:", self);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v3, "entityIdentificationModel:uniqueIdentifierOfEntityAtIndex:", self, i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)uniqueIdentifierForEntityAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "entityIdentificationModel:uniqueIdentifierOfEntityAtIndex:", self, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)observationCountForEntityWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5
    && (v7 = objc_msgSend(v5, "entityIdentificationModel:indexOfEntityWithUniqueIdentifier:", self, v4),
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = objc_msgSend(v6, "entityIdentificationModel:numberOfObservationsForEntityAtIndex:", self, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)observationsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;

  v6 = a3;
  -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_5;
  v9 = objc_msgSend(v7, "entityIdentificationModel:indexOfEntityWithUniqueIdentifier:", self, v6);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      VNEntityIdentificationModelErrorForUnknownEntityUniqueIdentifier((uint64_t)v6);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_5:
    v10 = 0;
    goto LABEL_9;
  }
  v11 = v9;
  v12 = objc_msgSend(v8, "entityIdentificationModel:numberOfObservationsForEntityAtIndex:", self, v9);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
  if (v12)
  {
    for (i = 0; i != v12; ++i)
    {
      objc_msgSend(v8, "entityIdentificationModel:observationAtIndex:forEntityAtIndex:", self, i, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v14);

    }
  }
LABEL_9:

  return v10;
}

- (id)observationCountsForEntitiesWithUniqueIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v13 = objc_msgSend(v5, "entityIdentificationModel:indexOfEntityWithUniqueIdentifier:", self, v12);
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v14 = objc_msgSend(v5, "entityIdentificationModel:numberOfObservationsForEntityAtIndex:", self, v13);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKey:", v15, v12);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v4 = v17;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v6;
}

- (id)observationCountsForAllEntities
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;

  -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfEntitiesInEntityIdentificationModel:", self);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v4);
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v3, "entityIdentificationModel:uniqueIdentifierOfEntityAtIndex:", self, i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v3, "entityIdentificationModel:numberOfObservationsForEntityAtIndex:", self, i);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v10, v8);

    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v6;
}

- (id)trainingObservationsForEntityWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  -[VNEntityIdentificationModel observationsForEntityWithUniqueIdentifier:error:](self, "observationsForEntityWithUniqueIdentifier:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "count"))
    {
      -[VNEntityIdentificationModel trainedModelWithCanceller:error:](self, "trainedModelWithCanceller:error:", v9, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "trainingEntityPrintsForEntityWithUniqueIdentifier:error:", v8, a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = objc_msgSend(v14, "count");
          if (v16)
          {
            v17 = v16;
            -[VNEntityIdentificationModel configuration](self, "configuration");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "entityPrintOriginatingRequestSpecifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, v17);
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __97__VNEntityIdentificationModel_trainingObservationsForEntityWithUniqueIdentifier_canceller_error___block_invoke;
            v26[3] = &unk_1E45482F8;
            v27 = v19;
            v28 = v15;
            v29 = v20;
            v21 = v20;
            v22 = v19;
            objc_msgSend(v11, "indexesOfObjectsPassingTest:", v26);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectsAtIndexes:", v23);
            v24 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v24 = (id)MEMORY[0x1E0C9AA60];
          }
        }
        else
        {
          v24 = 0;
        }

      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = v11;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)trainingPrintsForEntityWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  -[VNEntityIdentificationModel trainedModelWithCanceller:error:](self, "trainedModelWithCanceller:error:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "trainingEntityPrintsForEntityWithUniqueIdentifier:error:", v8, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v13 = v11;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (VNEntityIdentificationModelAlgorithm)algorithm
{
  void *v2;
  void *v3;

  -[VNEntityIdentificationModelConfiguration resolvedAlgorithmAndReturnError:](self->_configuration, "resolvedAlgorithmAndReturnError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (VNEntityIdentificationModelAlgorithm *)v3;
}

- (BOOL)convertToAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;

  v6 = a3;
  -[VNEntityIdentificationModelConfiguration algorithm](self->_configuration, "algorithm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    if (!-[VNEntityIdentificationModel dropTrainedModelAndReturnError:](self, "dropTrainedModelAndReturnError:", a4))
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[VNEntityIdentificationModelConfiguration setAlgorithm:](self->_configuration, "setAlgorithm:", v6);
  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (id)entityPredictionsForObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a3;
  v11 = a5;
  -[VNEntityIdentificationModel trainedModelWithCanceller:error:](self, "trainedModelWithCanceller:error:", v11, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "predictionsForObservation:limit:canceller:error:", v10, a4, v11, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainedModel_DO_NOT_ACCESS_DIRECTLY, 0);
  objc_destroyWeak((id *)&self->_dataSource_DO_NOT_ACCESS_DIRECTLY);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate_DO_NOT_ACCESS_DIRECTLY);
}

BOOL __97__VNEntityIdentificationModel_trainingObservationsForEntityWithUniqueIdentifier_canceller_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(a2, "VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:error:", *(_QWORD *)(a1 + 32), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __97__VNEntityIdentificationModel_trainingObservationsForEntityWithUniqueIdentifier_canceller_error___block_invoke_2;
    v12[3] = &unk_1E45482D0;
    v13 = v6;
    v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v12);
    v10 = v9 != 0x7FFFFFFFFFFFFFFFLL;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(*(id *)(a1 + 48), "removeIndex:", v9);
      if (!objc_msgSend(*(id *)(a1 + 48), "count"))
        *a4 = 1;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __97__VNEntityIdentificationModel_trainingObservationsForEntityWithUniqueIdentifier_canceller_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEquivalentToVNEntityIdentificationModelPrint:", *(_QWORD *)(a1 + 32));
}

- (id)_dataSourceAndReturnError:(uint64_t)a1
{
  id WeakRetained;
  void *v4;
  id v5;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      v5 = WeakRetained;
    }
    else if (a2)
    {
      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, CFSTR("the data source is no longer available"), 0);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_writeToUnopenedOutputStream:(void *)a3 options:(_QWORD *)a4 error:
{
  id v7;
  id v8;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    objc_msgSend(v7, "open");
    LOBYTE(a1) = -[VNEntityIdentificationModel _writeToOutputStream:options:error:](a1, v7, v8, a4);
    objc_msgSend(v7, "close");
  }

  return a1;
}

- (BOOL)_writeToOutputStream:(void *)a3 options:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v24;
  id v26;
  CC_MD5_CTX c;
  uint64_t v28;
  unsigned int (*v29)(_BOOL8, uint64_t, id, id, CC_MD5_CTX *, _QWORD *);
  unsigned __int8 md[8];
  unsigned __int8 *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  v7 = a3;
  v8 = v7;
  if (a1)
  {
    v28 = 0;
    v29 = 0;
    v9 = v7;
    v10 = objc_msgSend(v9, "version");
    if (v10)
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", v10);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "supportedWriteVersions");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    if ((objc_msgSend(v9, "readOnly") & 1) != 0)
    {
      v13 = 1;
    }
    else
    {
      objc_msgSend((id)a1, "information");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v14, "isReadOnly");

    }
    *(_QWORD *)md = 0;
    v31 = md;
    v32 = 0x2020000000;
    v33 = 0;
    *(_QWORD *)&c.A = MEMORY[0x1E0C809B0];
    *(_QWORD *)&c.C = 3221225472;
    *(_QWORD *)&c.Nl = __96__VNEntityIdentificationModel__getModelWritingImplementation_selector_version_forOptions_error___block_invoke;
    *(_QWORD *)c.data = &unk_1E4548268;
    *(_QWORD *)&c.data[6] = &v29;
    *(_QWORD *)&c.data[8] = &v28;
    LOBYTE(c.data[10]) = v13;
    *(_QWORD *)&c.data[2] = a1;
    *(_QWORD *)&c.data[4] = md;
    objc_msgSend(v12, "enumerateIndexesWithOptions:usingBlock:", 2, &c);
    v15 = *((_QWORD *)v31 + 3);
    if (!v15 && a4)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ does not support writing version %@"), v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(5, v20, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(md, 8);

    if (v15 && (memset(&c, 0, sizeof(c)), CC_MD5_Init(&c), v29(a1, v28, v26, v9, &c, a4)))
    {
      CC_MD5_Final(md, &c);
      v21 = v26;
      v22 = objc_msgSend(v21, "write:maxLength:", md, 16);
      a1 = v22 == 16;
      if (v22 != 16 && a4 != 0)
      {
        objc_msgSend(v21, "streamError");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(1, CFSTR("failed to write to data stream"), v24);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __96__VNEntityIdentificationModel__getModelWritingImplementation_selector_version_forOptions_error___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  int v6;
  IMP *v7;
  const char **v8;
  const __CFString *v9;
  const char *v10;
  objc_class *v11;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSString *v14;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(unsigned __int8 *)(a1 + 64);
    v7 = *(IMP **)(a1 + 48);
    v8 = *(const char ***)(a1 + 56);
    *v7 = 0;
    *v8 = 0;
    if (v6)
      v9 = CFSTR("writeReadOnlyVersion");
    else
      v9 = CFSTR("writeVersion");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%lu%@"), v9, a2, CFSTR("ToOutputStream:options:md5Context:error:"));
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = NSSelectorFromString(v14);
    *v8 = v10;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (v11 = (objc_class *)objc_opt_class(), (InstanceMethod = class_getInstanceMethod(v11, v10)) != 0)
      && (Implementation = method_getImplementation(InstanceMethod)) != 0)
    {
      *v7 = Implementation;

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
      *a3 = 1;
    }
    else
    {

    }
  }
}

- (uint64_t)_writePreambleAndCommonTagsForModelKind:(id *)a1 version:(int)a2 toOutputStream:(void *)a3 md5Context:(CC_MD5_CTX *)a4 error:(_QWORD *)a5
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v9 = a3;
  if (a1
    && VNEntityIdentificationModelIOWriteUInt32ToOutputStream(a2, v9, a4, a5)
    && VNEntityIdentificationModelIOWriteUInt32ToOutputStream(1, v9, a4, a5))
  {
    objc_msgSend(a1, "information");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastModificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = VNEntityIdentificationModelIOWriteTaggedNSObjectToOutputStream(1819111268, v11, v9, a4, (uint64_t)a5);

    if (v12)
    {
      objc_msgSend(a1[3], "resolvedAlgorithmAndReturnError:", a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        v14 = VNEntityIdentificationModelIOWriteTaggedNSObjectToOutputStream(1634494319, v13, v9, a4, (uint64_t)a5);
      else
        v14 = 0;

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (uint64_t)_writeVersion1ConfigurationToOutputStream:(void *)a1 options:(void *)a2 md5Context:(CC_MD5_CTX *)a3 error:(_QWORD *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  uint64_t v17;

  v7 = a2;
  if (a1)
  {
    objc_msgSend(a1, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entityPrintOriginatingRequestSpecifier");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = v7;
      v12 = v10;
      v16 = objc_msgSend(v12, "requestClassCode");
      v13 = objc_msgSend(v12, "requestRevision");

      v17 = v13;
      LODWORD(v13) = VNEntityIdentificationModelIOWriteTaggedBufferToOutputStream(1701995889, &v16, 0xCu, v11, a3, a4);

      if (!(_DWORD)v13)
        goto LABEL_6;
    }
    if (VNEntityIdentificationModelIOWriteTaggedUInt32ToOutputStream(1835104325, objc_msgSend(v8, "maximumEntities"), v7, a3, a4))v14 = VNEntityIdentificationModelIOWriteTaggedUInt32ToOutputStream(1833971525, objc_msgSend(v8, "maximumTrainingPrintsPerEntity"), v7, a3, a4);
    else
LABEL_6:
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)readObjectForVersion1Tag:(unsigned int)a3 fromInputStream:(id)a4 intoObjectDictionary:(id)a5 md5Context:(CC_MD5state_st *)a6 error:(id *)a7
{
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  const void *v25;
  id v26;
  id v27;
  void *v28;
  char TaggedObjectOfClass;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[2];

  v10 = *(_QWORD *)&a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((int)v10 <= 1701995888)
  {
    if ((int)v10 > 1447645234)
    {
      if ((_DWORD)v10 == 1447645235)
      {
        v14 = objc_opt_class();
        v15 = v11;
        v16 = 1447645235;
        goto LABEL_30;
      }
      if ((_DWORD)v10 == 1634494319)
      {
        v14 = objc_opt_class();
        v15 = v11;
        v16 = 1634494319;
        goto LABEL_30;
      }
      goto LABEL_32;
    }
    if ((_DWORD)v10 != 1160466208)
    {
      if ((_DWORD)v10 != 1378832160)
        goto LABEL_32;
      LODWORD(v52[0]) = 0;
      if (VNEntityIdentificationModelIOReadBufferOfExpectedLengthFromInputStream(v11, 4, v52, a6, a7))
      {
        if (LODWORD(v52[0]) == 1497715488)
        {
          v17 = 1;
          goto LABEL_51;
        }
        if (LODWORD(v52[0]) == 1313808416)
        {
          v17 = 0;
LABEL_51:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1378832160);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v42, v43);

          LOBYTE(v18) = 1;
          goto LABEL_69;
        }
        if (a7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("corrupted BOOLean value: %02X"), LODWORD(v52[0]));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v44, 0);
          *a7 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      LOBYTE(v18) = 0;
      goto LABEL_69;
    }
    v21 = v12;
    v22 = v11;
    LODWORD(v52[0]) = 0;
    if (!VNEntityIdentificationModelIOReadUInt32FromInputStream(v22, v52, a6, a7))
    {

      v26 = 0;
      goto LABEL_47;
    }
    v23 = objc_alloc(MEMORY[0x1E0C99DF0]);
    v24 = objc_retainAutorelease((id)objc_msgSend(v23, "initWithLength:", LODWORD(v52[0])));
    v25 = (const void *)objc_msgSend(v24, "mutableBytes");
    if (v25)
    {
      if (VNEntityIdentificationModelIOReadBufferFromInputStream(v22, v52[0], v25, a6, a7))
      {
        v26 = v24;
        goto LABEL_38;
      }
    }
    else if (a7)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v26 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    v26 = 0;
LABEL_38:

    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1160466208);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1160466208);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v31, v32);

      }
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v26, a7);
      v34 = v33;
      if (!v33)
      {
        LOBYTE(v18) = 0;
LABEL_67:

        goto LABEL_68;
      }
      objc_msgSend(v33, "vn_decodeEntityUniqueIdentifierForKey:", CFSTR("E"));
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      if (!v35)
      {
        if (!a7)
        {
          LOBYTE(v18) = 0;
          goto LABEL_66;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to decode entity unique identifier for tag %@"), VisionCoreFourCharCodeToString());
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "error");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v51, v39);
        LOBYTE(v18) = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        v45 = v51;
LABEL_65:

LABEL_66:
        goto LABEL_67;
      }
      v49 = (void *)v35;
      v37 = (void *)MEMORY[0x1E0C99E60];
      v38 = objc_opt_class();
      objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
      v50 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "decodeObjectOfClasses:forKey:");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        objc_msgSend(v34, "finishDecoding");
        objc_msgSend(v34, "error");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v40)
        {
          objc_msgSend(v31, "objectForKey:", v49);
          v47 = (id)objc_claimAutoreleasedReturnValue();
          if (!v47)
          {
            v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v31, "setObject:forKey:", v47, v49);
          }
          objc_msgSend(v47, "addObjectsFromArray:", v39);

          v41 = 0;
          LOBYTE(v18) = 1;
          goto LABEL_64;
        }
        v41 = v40;
        if (a7)
        {
          v41 = objc_retainAutorelease(v40);
          LOBYTE(v18) = 0;
          *a7 = v41;
LABEL_64:
          v45 = (void *)v50;

          v36 = v49;
          goto LABEL_65;
        }
      }
      else
      {
        if (!a7)
        {
          v39 = 0;
          LOBYTE(v18) = 0;
          v36 = v49;
          v45 = (void *)v50;
          goto LABEL_65;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to decode observations for tag %@"), VisionCoreFourCharCodeToString());
        v41 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "error");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v41, v46);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      LOBYTE(v18) = 0;
      goto LABEL_64;
    }
LABEL_47:
    LOBYTE(v18) = 0;
LABEL_68:

    goto LABEL_69;
  }
  if ((int)v10 <= 1833971524)
  {
    if ((_DWORD)v10 != 1701995889)
    {
      if ((_DWORD)v10 == 1819111268)
      {
        v14 = objc_opt_class();
        v15 = v11;
        v16 = 1819111268;
        goto LABEL_30;
      }
LABEL_32:
      TaggedObjectOfClass = VNEntityIdentificationModelIOReadPastUnknownTagData(v11, a6, a7);
      goto LABEL_31;
    }
    v27 = v11;
    memset(v52, 0, 12);
    if (VNEntityIdentificationModelIOReadBufferOfExpectedLengthFromInputStream(v27, 12, v52, a6, a7))
    {
      +[VNRequestSpecifier specifierForRequestClassCode:revision:error:](VNRequestSpecifier, "specifierForRequestClassCode:revision:error:", LODWORD(v52[0]), *(_QWORD *)((char *)v52 + 4), a7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1701995889);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v28);

        LOBYTE(v18) = 1;
      }
      else
      {
        LOBYTE(v18) = 0;
      }
    }
    else
    {

      LOBYTE(v18) = 0;
      v19 = 0;
    }
LABEL_49:

    goto LABEL_69;
  }
  if ((_DWORD)v10 != 1833971525 && (_DWORD)v10 != 1835104325)
  {
    if ((_DWORD)v10 == 1953326188)
    {
      v14 = objc_opt_class();
      v15 = v11;
      v16 = 1953326188;
LABEL_30:
      TaggedObjectOfClass = _readTaggedObjectOfClass(v15, v16, v14, v13, a6, a7);
LABEL_31:
      LOBYTE(v18) = TaggedObjectOfClass;
      goto LABEL_69;
    }
    goto LABEL_32;
  }
  LODWORD(v52[0]) = 0;
  v18 = VNEntityIdentificationModelIOReadBufferOfExpectedLengthFromInputStream(v11, 4, v52, a6, a7);
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v52[0]));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v20);

    goto LABEL_49;
  }
LABEL_69:

  return v18;
}

+ (id)modelConfigurationForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  VNEntityIdentificationModelConfiguration *v8;
  objc_class *v9;
  objc_class *v10;
  VNEntityIdentificationModelConfiguration *v11;

  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E459D000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[VNEntityIdentificationModelConfiguration initWithEntityPrintOriginatingRequestSpecifier:]([VNEntityIdentificationModelConfiguration alloc], "initWithEntityPrintOriginatingRequestSpecifier:", v7);
    v9 = (objc_class *)objc_opt_class();
    if (VNEntityIdentificationModelApplyTagValue(v6, 1835104325, v9, v8, CFSTR("maximumEntities"), (uint64_t)a5)&& (v10 = (objc_class *)objc_opt_class(), VNEntityIdentificationModelApplyTagValue(v6, 1833971525, v10, v8, CFSTR("maximumTrainingPrintsPerEntity"), (uint64_t)a5)))
    {
      v11 = v8;
    }
    else
    {
      v11 = 0;
    }

  }
  else if (a5)
  {
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, CFSTR("no entity print originating request specifier is defined"), 0);
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)validateConfiguration:(id)a3 error:(id *)a4
{
  void *v5;

  objc_msgSend(a3, "entityPrintOriginatingRequestSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v5)
  {
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(2, CFSTR("an entity print originating request specifier must be configured"), 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5 != 0;
}

+ (BOOL)canCreateModelOfClass:(Class)a3 withObjects:(id)a4 error:(id *)a5
{
  char v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", a1, a4);
  v9 = v8;
  if (a5 && (v8 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass((Class)a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ cannot be created from a %@"), v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    VNEntityIdentificationModelErrorForReadOnlyModelWithLocalizedDescription(v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)newModelForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5
{
  if (a5)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)validateAceptableObservation:(id)a3 forEntityPrintOriginatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v7 = a3;
  v8 = a4;
  v13 = 0;
  objc_msgSend(v7, "VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:error:", v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;
  if (a5 && !v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is generated by %@ instead of %@"), v7, v8, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(8, v11, v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 != 0;
}

+ (BOOL)isReadOnly
{
  return 0;
}

+ (id)supportedRequestSpecifiers
{
  void *v2;
  void *v3;
  void *v4;

  VNEntityUniqueIdentifierSupportedRequestSpecifiers();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_161);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)modelWithConfiguration:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(a1, "validateConfiguration:error:", v8, a5))
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:dataSource:", v8, v9);
  else
    v10 = 0;

  return v10;
}

+ (id)supportedReadVersions
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", 1);
}

+ (id)modelFromStream:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A1B0B060]();
  v15 = 0;
  +[VNEntityIdentificationModel _modelFromInputStream:options:error:]((uint64_t)a1, v8, v9, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  objc_autoreleasePoolPop(v10);
  if (v11)
  {
    v13 = v11;
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease(v12);
  }

  return v11;
}

+ (id)modelFromData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A1B0B060]();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithData:", v8);
  v16 = 0;
  +[VNEntityIdentificationModel _modelFromUnopenedStream:options:error:]((uint64_t)a1, v11, v9, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  objc_autoreleasePoolPop(v10);
  if (v12)
  {
    v14 = v12;
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease(v13);
  }

  return v12;
}

+ (id)modelFromURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A1B0B060]();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", v8);
  v16 = 0;
  +[VNEntityIdentificationModel _modelFromUnopenedStream:options:error:]((uint64_t)a1, v11, v9, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  objc_autoreleasePoolPop(v10);
  if (v12)
  {
    v14 = v12;
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease(v13);
  }

  return v12;
}

+ (id)informationForModelWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v13;

  v6 = a3;
  v7 = (void *)MEMORY[0x1A1B0B060]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithData:", v6);
  v13 = 0;
  +[VNEntityIdentificationModel _modelInformationFromUnopenedStream:error:]((uint64_t)a1, v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;

  objc_autoreleasePoolPop(v7);
  if (v9)
  {
    v11 = v9;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v10);
  }

  return v9;
}

+ (id)informationForModelWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v13;

  v6 = a3;
  v7 = (void *)MEMORY[0x1A1B0B060]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", v6);
  v13 = 0;
  +[VNEntityIdentificationModel _modelInformationFromUnopenedStream:error:]((uint64_t)a1, v8, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;

  objc_autoreleasePoolPop(v7);
  if (v9)
  {
    v11 = v9;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v10);
  }

  return v9;
}

+ (id)supportedWriteVersions
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", 1);
}

+ (VNEntityIdentificationModelInformation)_modelInformationFromUnopenedStream:(_QWORD *)a3 error:
{
  id v4;
  id v5;
  uint64_t v6;
  VNEntityIdentificationModelReadOptions *v7;
  void *v8;
  void *v9;
  VNEntityIdentificationModelInformation *v10;
  uint64_t v11;
  void *v12;
  VNEntityIdentificationModelInformation *v13;
  uint64_t v15;
  objc_class *v16;

  v4 = a2;
  objc_opt_self();
  objc_msgSend(v4, "open");
  v5 = v4;
  v6 = objc_opt_self();
  v7 = objc_alloc_init(VNEntityIdentificationModelReadOptions);
  v15 = 0;
  v16 = 0;
  +[VNEntityIdentificationModel _readModelObjectsFromStream:options:actionBlock:progressBlock:modelClass:version:error:](v6, v5, v7, &__block_literal_global_29461, &v16, &v15, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E459CFD0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = [VNEntityIdentificationModelInformation alloc];
    v11 = v15;
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E459CFE8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VNEntityIdentificationModelInformation initWithVersion:algorithm:lastModificationDate:readOnly:](v10, "initWithVersion:algorithm:lastModificationDate:readOnly:", v11, v12, v9, -[objc_class isReadOnly](v16, "isReadOnly"));

  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v4, "close");
  return v13;
}

+ (id)_readModelObjectsFromStream:(uint64_t)a1 options:(void *)a2 actionBlock:(void *)a3 progressBlock:(void *)a4 modelClass:(objc_class *)a5 version:(_QWORD *)a6 error:(_QWORD *)a7
{
  id v12;
  id v13;
  unsigned int (**v14)(id, _QWORD);
  id v15;
  uint64_t v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  const char *v21;
  objc_method *ClassMethod;
  id v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  NSString *v36;
  id v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
  void *v42;
  NSString *v43;
  IMP Implementation;
  id v45;
  void *v46;
  id v47;
  id v48;
  unsigned int v49;
  unsigned int v50;
  CC_MD5_CTX c;
  _QWORD v52[2];
  unsigned __int8 md[8];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a3;
  v14 = a4;
  objc_opt_self();
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  v50 = 0;
  v15 = 0;
  if (!VNEntityIdentificationModelIOReadUInt32FromInputStream(v12, &v50, &c, a7))
    goto LABEL_51;
  v16 = v50;
  objc_opt_self();
  if ((_DWORD)v16 != 1701405805 && (_DWORD)v16 != 1701409391)
  {
    if (a7)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      VNPersonsModelIOStringForTag(v16);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("unknown model kind %@"), v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v31, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v32 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  v17 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_25;
  v18 = v17;
  if (a5)
    *a5 = v17;
  v49 = 0;
  if (!VNEntityIdentificationModelIOReadUInt32FromInputStream(v12, &v49, &c, a7))
  {
LABEL_25:
    v15 = 0;
    goto LABEL_51;
  }
  if (a6)
    *a6 = v49;
  objc_msgSend(v13, "acceptableVersions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19 && (objc_msgSend(v19, "containsIndex:", v49) & 1) == 0)
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot accept model version %lu"), v49);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v33, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = v34;
      v15 = 0;
      *a7 = v35;
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("readObjectForVersion%uTag:fromInputStream:intoObjectDictionary:md5Context:error:"), v49);
  v43 = (NSString *)objc_claimAutoreleasedReturnValue();
  v21 = NSSelectorFromString(v43);
  ClassMethod = class_getClassMethod(v18, v21);
  if (!ClassMethod)
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot read model version %u"), v49);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v46, 0);
      v15 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      v36 = v43;

    }
    else
    {
      v15 = 0;
      v36 = v43;
    }
    goto LABEL_49;
  }
  v42 = v20;
  Implementation = method_getImplementation(ClassMethod);
  v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = 0;
  while (1)
  {
    v24 = (void *)MEMORY[0x1A1B0B060]();
    *(_DWORD *)md = 0;
    v48 = v23;
    v25 = VNEntityIdentificationModelIOReadUInt32FromInputStream(v12, md, &c, &v48);
    v26 = v48;

    if (!v25)
    {
      v23 = v26;
LABEL_31:
      objc_autoreleasePoolPop(v24);
      if (a7)
      {
        v26 = objc_retainAutorelease(v23);
        v15 = 0;
        *a7 = v26;
      }
      else
      {
        v15 = 0;
        v26 = v23;
      }
LABEL_47:
      v36 = v43;
      goto LABEL_48;
    }
    if (*(_DWORD *)md == v50)
      break;
    if (v14 && v14[2](v14, *(unsigned int *)md) == 1)
    {
      v47 = v26;
      v27 = VNEntityIdentificationModelIOReadPastUnknownTagData(v12, &c, &v47);
      v28 = v47;
    }
    else
    {
      v27 = ((uint64_t (*)(objc_class *, const char *))Implementation)(v18, v21);
      v28 = v26;
    }
    v23 = v28;

    if ((v27 & 1) == 0)
      goto LABEL_31;
    objc_autoreleasePoolPop(v24);
  }
  objc_autoreleasePoolPop(v24);
  CC_MD5_Final(md, &c);
  v37 = v12;
  v38 = objc_msgSend(v37, "read:maxLength:", v52, 16);
  if (v38 != 16 && a7)
  {
    objc_msgSend(v37, "streamError");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(1, CFSTR("unexpected end of data stream"), v39);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_46;
  }

  if (v38 != 16)
  {
LABEL_46:
    v15 = 0;
    goto LABEL_47;
  }
  v40 = v52[0] == *(_QWORD *)md && v52[1] == v54;
  v36 = v43;
  if (v40)
  {
    v15 = v45;
  }
  else if (a7)
  {
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, CFSTR("model data fails checksum validation"), 0);
    v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
LABEL_48:

  v20 = v42;
LABEL_49:

LABEL_50:
LABEL_51:

  return v15;
}

BOOL __70__VNEntityIdentificationModel__modelInformationFromInputStream_error___block_invoke(uint64_t a1, int a2)
{
  return a2 != 1819111268 && a2 != 1634494319;
}

+ (id)_modelFromUnopenedStream:(void *)a3 options:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  objc_msgSend(v6, "open");
  +[VNEntityIdentificationModel _modelFromInputStream:options:error:](v8, v6, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "close");

  return v9;
}

+ (id)_modelFromInputStream:(void *)a3 options:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  objc_class *v13;

  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_opt_self();
  v12 = 0;
  v13 = 0;
  +[VNEntityIdentificationModel _readModelObjectsFromStream:options:actionBlock:progressBlock:modelClass:version:error:]((uint64_t)v8, v7, v6, 0, &v13, &v12, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v8, "canCreateModelOfClass:withObjects:error:", v13, v9, a4))
    v10 = (void *)-[objc_class newModelForVersion:modelObjects:error:](v13, "newModelForVersion:modelObjects:error:", v12, v9, a4);
  else
    v10 = 0;

  return v10;
}

uint64_t __57__VNEntityIdentificationModel_supportedRequestSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "requestClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);
  if (!v8)
  {
    v9 = objc_msgSend(v4, "requestRevision");
    v10 = objc_msgSend(v5, "requestRevision");
    if (v9 < v10)
      v8 = -1;
    else
      v8 = v9 > v10;
  }

  return v8;
}

@end
