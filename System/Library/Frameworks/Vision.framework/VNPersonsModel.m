@implementation VNPersonsModel

- (VNPersonsModel)initWithConfiguration:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  VNPersonsModel *v8;
  uint64_t v9;
  VNPersonsModelConfiguration *configuration;
  VNPersonsModelConfiguration *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNPersonsModel;
  v8 = -[VNPersonsModel init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (VNPersonsModelConfiguration *)v9;

    v11 = v8->_configuration;
    -[VNPersonsModelConfiguration resolvedAlgorithmAndReturnError:](v11, "resolvedAlgorithmAndReturnError:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNPersonsModelConfiguration setAlgorithm:](v11, "setAlgorithm:", v12);

    objc_storeWeak((id *)&v8->_dataSource, v7);
  }

  return v8;
}

- (BOOL)updateInternalConfigurationWithModelFaceprintRequestRevision:(unint64_t)a3 error:(id *)a4
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;

  if (!a3)
    return 1;
  v7 = -[VNPersonsModelConfiguration faceprintRequestRevision](self->_configuration, "faceprintRequestRevision");
  if (v7 == a3)
    return 1;
  v8 = v7;
  if (!v7)
  {
    -[VNPersonsModelConfiguration setFaceprintRequestRevision:](self->_configuration, "setFaceprintRequestRevision:", a3);
    return 1;
  }
  if (a4)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = (objc_class *)objc_opt_class();
    VNRequestRevisionString(v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    VNRequestRevisionString(v12, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("configuration has already been resolved to %@ and cannot be set to %@"), v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 64);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p> %lu identities"), v5, self, -[VNPersonsModel personCount](self, "personCount"));

  return v3;
}

- (BOOL)dropCurrentFaceModelAndReturnError:(id *)a3
{
  VNPersonsModelFaceModel *faceModel_DO_NOT_ACCESS_DIRECTLY;

  faceModel_DO_NOT_ACCESS_DIRECTLY = self->_faceModel_DO_NOT_ACCESS_DIRECTLY;
  self->_faceModel_DO_NOT_ACCESS_DIRECTLY = 0;

  return 1;
}

- (id)upToDateFaceModelWithCanceller:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  VNPersonsModelFaceModel *faceModel_DO_NOT_ACCESS_DIRECTLY;
  _VNPersonsModelDataSourceBasedDataProvider *v10;
  VNPersonsModelFaceModel *v11;
  VNPersonsModelFaceModel *v12;
  VNPersonsModelFaceModel *v13;

  v6 = a3;
  -[VNPersonsModel _dataSourceAndReturnError:]((uint64_t)self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_12;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "lastDataChangeSequenceNumberForPersonsModel:", self);
    if (v8 != self->_lastDataChangeSequenceNumber
      && !-[VNPersonsModel dropCurrentFaceModelAndReturnError:](self, "dropCurrentFaceModelAndReturnError:", a4))
    {
      goto LABEL_12;
    }
  }
  else
  {
    v8 = 0;
  }
  faceModel_DO_NOT_ACCESS_DIRECTLY = self->_faceModel_DO_NOT_ACCESS_DIRECTLY;
  if (!faceModel_DO_NOT_ACCESS_DIRECTLY)
  {
    v10 = -[_VNPersonsModelDataSourceBasedDataProvider initWithPersonsModel:dataSource:]([_VNPersonsModelDataSourceBasedDataProvider alloc], "initWithPersonsModel:dataSource:", self, v7);
    +[VNPersonsModelFaceModel modelBuiltFromConfiguration:dataProvider:canceller:error:](VNPersonsModelFaceModel, "modelBuiltFromConfiguration:dataProvider:canceller:error:", self->_configuration, v10, v6, a4);
    v11 = (VNPersonsModelFaceModel *)objc_claimAutoreleasedReturnValue();
    v12 = self->_faceModel_DO_NOT_ACCESS_DIRECTLY;
    self->_faceModel_DO_NOT_ACCESS_DIRECTLY = v11;

    if (!self->_faceModel_DO_NOT_ACCESS_DIRECTLY)
    {

LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
    self->_lastDataChangeSequenceNumber = v8;

    faceModel_DO_NOT_ACCESS_DIRECTLY = self->_faceModel_DO_NOT_ACCESS_DIRECTLY;
  }
  v13 = faceModel_DO_NOT_ACCESS_DIRECTLY;
LABEL_13:

  return v13;
}

- (VNPersonsModelAlgorithm)algorithm
{
  void *v2;
  void *v3;

  -[VNPersonsModelConfiguration resolvedAlgorithmAndReturnError:](self->_configuration, "resolvedAlgorithmAndReturnError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (VNPersonsModelAlgorithm *)v3;
}

- (BOOL)convertToAlgorithm:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  BOOL v9;

  v6 = a3;
  -[VNPersonsModelConfiguration algorithm](self->_configuration, "algorithm");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    if (!-[VNPersonsModel dropCurrentFaceModelAndReturnError:](self, "dropCurrentFaceModelAndReturnError:", a4))
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[VNPersonsModelConfiguration setAlgorithm:](self->_configuration, "setAlgorithm:", v6);
  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (VNPersonsModelConfiguration)configuration
{
  return (VNPersonsModelConfiguration *)(id)-[VNPersonsModelConfiguration copy](self->_configuration, "copy");
}

- (id)predictPersonFromFaceObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  _QWORD *v25;
  void *v26[13];
  int v27;
  void *v28;

  v10 = a3;
  v11 = a5;
  if (v10)
  {
    -[VNPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v10, "VNPersonsModelFaceprintWithRequestRevision:error:", objc_msgSend(v12, "faceprintRequestRevision"), a6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "descriptorData");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = operator new(8uLL);
        *v16 = 1;
        v17 = objc_retainAutorelease(v24);
        v18 = (void *)objc_msgSend(v17, "bytes", v24, v16, v16 + 1, v16 + 1);
        v19 = objc_msgSend(v17, "length");
        vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v26, &v25, v18, v19, 1, 0);
        v27 = 1;
        v28 = 0;
        v26[0] = &off_1E453A8D0;
        v26[12] = (void *)(v19 >> 2);
        operator delete(v16);
        objc_msgSend(v13, "personPredictionsForFace:withDescriptor:limit:canceller:error:", v10, v26, a4, v11, a6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
          v22 = v20;

        v26[0] = &off_1E453A8D0;
        free(v28);
        vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v26);

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = 0;
    }

  }
  else if (a6)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("the face observation must not be nil"));
    v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (unint64_t)personCount
{
  id WeakRetained;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_msgSend(WeakRetained, "numberOfPersonsInPersonsModel:", self);

  return v4;
}

- (id)personUniqueIdentifiers
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_msgSend(WeakRetained, "numberOfPersonsInPersonsModel:", self);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(WeakRetained, "personsModel:uniqueIdentifierOfPersonAtIndex:", self, i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v6 = objc_msgSend(WeakRetained, "personsModel:indexOfPersonWithUniqueIdentifier:", self, v4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0;
  else
    v7 = objc_msgSend(WeakRetained, "personsModel:numberOfFaceObservationsForPersonAtIndex:", self, v6);

  return v7;
}

- (id)faceObservationsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;

  v6 = a3;
  -[VNPersonsModel _dataSourceAndReturnError:]((uint64_t)self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_5;
  v9 = objc_msgSend(v7, "personsModel:indexOfPersonWithUniqueIdentifier:", self, v6);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      VNPersonsModelErrorForUnknownPersonUniqueIdentifier((uint64_t)v6);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_5:
    v10 = 0;
    goto LABEL_13;
  }
  v11 = objc_msgSend(v8, "personsModel:numberOfFaceObservationsForPersonAtIndex:", self, v9);
  if (v11)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
    for (i = 0; i != v11; ++i)
    {
      objc_msgSend(v8, "personsModel:faceObservationAtIndex:forPersonAtIndex:", self, i, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v10, "addObject:", v13);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_13:

  return v10;
}

- (id)trainingFaceObservationsForPersonWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5
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
  id v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *, uint64_t, _BYTE *);
  void *v26;
  VNPersonsModel *v27;
  id v28;
  id v29;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  -[VNPersonsModel faceObservationsForPersonWithUniqueIdentifier:error:](self, "faceObservationsForPersonWithUniqueIdentifier:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if (objc_msgSend(v10, "count"))
    {
      -[VNPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", v9, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "trainingFaceprintsForPersonWithUniqueIdentifier:error:", v8, a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = objc_msgSend(v14, "count");
          if (v16)
          {
            v17 = objc_msgSend(v13, "faceprintRequestRevision");
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, v16);
            v23 = MEMORY[0x1E0C809B0];
            v24 = 3221225472;
            v25 = __88__VNPersonsModel_trainingFaceObservationsForPersonWithUniqueIdentifier_canceller_error___block_invoke;
            v26 = &unk_1E4544848;
            v30 = v17;
            v27 = self;
            v28 = v15;
            v19 = v18;
            v29 = v19;
            objc_msgSend(v11, "indexesOfObjectsPassingTest:", &v23);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectsAtIndexes:", v20, v23, v24, v25, v26, v27);
            v21 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v21 = (id)MEMORY[0x1E0C9AA60];
          }
        }
        else
        {
          v21 = 0;
        }

      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      v21 = v11;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)trainingFaceprintsForPersonWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a3;
  -[VNPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "trainingFaceprintsForPersonWithUniqueIdentifier:error:", v8, a5);
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

- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v15;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(WeakRetained, "personsModel:indexOfPersonWithUniqueIdentifier:", self, v10);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v12 = objc_msgSend(WeakRetained, "personsModel:numberOfFaceObservationsForPersonAtIndex:", self, v11);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v10);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)faceCountsForAllPersons
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_msgSend(WeakRetained, "numberOfPersonsInPersonsModel:", self);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v4);
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(WeakRetained, "personsModel:uniqueIdentifierOfPersonAtIndex:", self, i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(WeakRetained, "personsModel:numberOfFaceObservationsForPersonAtIndex:", self, i);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v7);

    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_faceModel_DO_NOT_ACCESS_DIRECTLY, 0);
}

uint64_t __88__VNPersonsModel_trainingFaceObservationsForPersonWithUniqueIdentifier_canceller_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;

  objc_msgSend(a2, "VNPersonsModelFaceprintWithRequestRevision:error:", *(_QWORD *)(a1 + 56), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_4;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = v6;
  if (v7)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__VNPersonsModel__indexOfFaceprints_equivalentToFaceprint___block_invoke;
    v14[3] = &unk_1E45447D8;
    v10 = v9;
    v15 = v10;
    v11 = objc_msgSend(v8, "indexOfObjectPassingTest:", v14);

    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_4:
      v12 = 0;
      goto LABEL_8;
    }
  }
  else
  {

    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "removeIndex:", v11);
  v12 = 1;
  if (!objc_msgSend(*(id *)(a1 + 48), "count"))
    *a4 = 1;
LABEL_8:

  return v12;
}

uint64_t __59__VNPersonsModel__indexOfFaceprints_equivalentToFaceprint___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasEquivalentDescriptorToImageprint:", *(_QWORD *)(a1 + 32));
}

- (id)_dataSourceAndReturnError:(uint64_t)a1
{
  id WeakRetained;
  void *v4;
  id v5;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v4 = WeakRetained;
    if (WeakRetained)
    {
      v5 = WeakRetained;
    }
    else if (a2)
    {
      VNPersonsModelErrorForInvalidModelData(CFSTR("the data source is no longer available"));
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)isReadOnly
{
  return 0;
}

+ (id)configurationFromLoadedObjects:(id)a3 error:(id *)a4
{
  id v4;
  VNPersonsModelConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(VNPersonsModelConfiguration);
  -[VNPersonsModelConfiguration setFaceprintRequestRevision:](v5, "setFaceprintRequestRevision:", 0);
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E459C820);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    -[VNPersonsModelConfiguration setMaximumIdentities:](v5, "setMaximumIdentities:", objc_msgSend(v6, "unsignedIntegerValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E459C838);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    -[VNPersonsModelConfiguration setMaximumTrainingFaceprintsPerIdentity:](v5, "setMaximumTrainingFaceprintsPerIdentity:", objc_msgSend(v8, "unsignedIntegerValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E459C850);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[VNPersonsModelConfiguration setAlgorithm:](v5, "setAlgorithm:", v10);

  return v5;
}

+ (id)versionNumbersEncodedInClass:(Class)a3 withMethodNamePrefix:(id)a4 suffix:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  Method *v11;
  unint64_t i;
  const char *Name;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned int outCount;

  v7 = a4;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v10 = objc_msgSend(v7, "length");
  outCount = 0;
  v11 = class_copyMethodList(a3, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Name = method_getName(v11[i]);
      NSStringFromSelector(Name);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "hasPrefix:", v7) && objc_msgSend(v14, "hasSuffix:", v8))
      {
        objc_msgSend(v14, "substringWithRange:", v10, objc_msgSend(v14, "length") - (v10 + objc_msgSend(v8, "length")));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");
        if (v16 >= 1)
          objc_msgSend(v9, "addIndex:", v16);

      }
    }
  }
  free(v11);

  return v9;
}

+ (id)supportedReadVersions
{
  if (+[VNPersonsModel supportedReadVersions]::onceToken != -1)
    dispatch_once(&+[VNPersonsModel supportedReadVersions]::onceToken, &__block_literal_global_8192);
  return (id)+[VNPersonsModel supportedReadVersions]::ourSupportedReadVersions;
}

+ (id)modelFromStream:(id)a3 options:(id)a4 error:(id *)a5
{
  +[VNPersonsModel _modelFromStream:options:error:]((uint64_t)a1, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)modelFromData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithData:", v8);
  +[VNPersonsModel _modelFromUnopenedStream:options:error:]((uint64_t)a1, v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)modelFromURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", v8);
  +[VNPersonsModel _modelFromUnopenedStream:options:error:]((uint64_t)a1, v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)informationForModelWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithData:", v6);
  +[VNPersonsModel _modelInformationFromUnopenedStream:error:]((uint64_t)a1, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)informationForModelWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", v6);
  +[VNPersonsModel _modelInformationFromUnopenedStream:error:]((uint64_t)a1, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)newModelFromVersion:(unint64_t)a3 objects:(id)a4 error:(id *)a5
{
  void *v6;

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot create model with version %u"), a4, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VNPersonsModelErrorForInvalidModelData(v6);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (BOOL)readObjectForModelVersion:(unint64_t)a3 tag:(unsigned int)a4 fromInputStream:(id)a5 intoObjectDictionary:(id)a6 md5Context:(CC_MD5state_st *)a7 error:(id *)a8
{
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  BOOL v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  char v57;
  id v58;
  uint64_t v59;
  unsigned int *v60;
  CC_MD5state_st *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t aBlock;
  uint64_t v68;
  void *v69;
  void *v70;
  CC_MD5state_st *v71;
  id *v72;
  uint64_t v73;
  int v74;
  id v75;
  id *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;

  v11 = *(_QWORD *)&a4;
  v12 = a5;
  v13 = a6;
  if ((int)v11 <= 1833250632)
  {
    if ((_DWORD)v11 == 1227572778)
    {
      v14 = v12;
      v17 = v13;
      objc_msgSend(v17, "objectForKeyedSubscript:", &unk_1E459C868);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, &unk_1E459C868);
      }
      VNPersonsModelIOReadNSDataFromInputStream(v14, a7, a8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v58 = objc_retainAutorelease(v19);
        v21 = (unsigned int *)objc_msgSend(v58, "bytes");
        v22 = *v21;
        objc_msgSend(v58, "VNPersonsModelSubdataWithRange:rangeDescription:error:", 4, v22, CFSTR("person identifier data"), a8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v60 = v21;
          v55 = v20;
          v24 = (void *)MEMORY[0x1E0CB3710];
          VNEntityUniqueIdentifierClasses();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "unarchivedObjectOfClasses:fromData:error:", v25, v23, a8);
          a7 = (CC_MD5state_st *)objc_claimAutoreleasedReturnValue();

          v61 = a7;
          if (a7)
          {
            v59 = *(unsigned int *)((char *)v60 + v22 + 4);
            objc_msgSend(v18, "objectForKey:", a7);
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (!v26)
            {
              v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v59);
              v26 = objc_msgSend(v18, "setObject:forKey:", v27, a7);
            }
            v56 = (void *)v27;
            if ((_DWORD)v59)
            {
              v51 = v23;
              v52 = v18;
              v53 = v17;
              v54 = v14;
              v62 = v13;
              v64 = v12;
              v28 = 0;
              v29 = 0;
              v57 = 0;
              v30 = v22 + 8;
              v31 = v58;
              do
              {
                v32 = (void *)MEMORY[0x1A1B0B060](v26);
                v33 = *(unsigned int *)((char *)v60 + v30);
                v30 += 4;
                aBlock = MEMORY[0x1E0C809B0];
                v68 = 3221225472;
                v69 = ___ZL43_readVersion1PersonAndFaceObservationsChunkP13NSInputStreamP19NSMutableDictionaryP14CC_MD5state_stPU15__autoreleasingP7NSError_block_invoke;
                v70 = &unk_1E4544898;
                v72 = v28;
                v73 = v59;
                v71 = v61;
                v75 = v29;
                objc_msgSend(v31, "VNPersonsModelSubdataWithRange:rangeDescriptionProvidingBlock:error:", v30, v33, &aBlock, &v75);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = v75;

                if (v34)
                {
                  v36 = (void *)MEMORY[0x1E0CB3710];
                  v37 = objc_opt_class();
                  v66 = v35;
                  objc_msgSend(v36, "unarchivedObjectOfClass:fromData:error:", v37, v34, &v66);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = v66;

                  if (v38)
                  {
                    objc_msgSend(v56, "addObject:", v38);
                    v39 = 0;
                  }
                  else
                  {
                    v39 = 2;
                    v57 = 1;
                  }
                  v30 += v33;

                  v31 = v58;
                }
                else
                {
                  v39 = 2;
                  v57 = 1;
                  v29 = v35;
                }

                objc_autoreleasePoolPop(v32);
                if (v39)
                  break;
                v40 = v59 - 1 == (_QWORD)v28;
                v28 = (id *)((char *)v28 + 1);
              }
              while (!v40);
              LOBYTE(a7) = v57 ^ 1;
              v23 = v51;
              if (((a8 != 0) & v57) != 0)
              {
                v29 = objc_retainAutorelease(v29);
                *a8 = v29;
              }
              v13 = v62;
              v12 = v64;
              v17 = v53;
              v14 = v54;
              v18 = v52;
            }
            else
            {
              v29 = 0;
              LOBYTE(a7) = 1;
            }

          }
          v20 = v55;

        }
        else
        {
          LOBYTE(a7) = 0;
        }

      }
      else
      {
        LOBYTE(a7) = 0;
      }

      goto LABEL_55;
    }
    if ((_DWORD)v11 != 1634494319 && (_DWORD)v11 != 1819111268)
      goto LABEL_43;
    goto LABEL_37;
  }
  if ((int)v11 > 1919895090)
  {
    if ((_DWORD)v11 != 1919895091 && (_DWORD)v11 != 1919895117)
      goto LABEL_43;
LABEL_37:
    v41 = objc_opt_class();
    v65 = v12;
    v42 = v12;
    v63 = v13;
    v43 = v13;
    VNPersonsModelIOReadNSDataFromInputStream(v42, a7, a8);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v44)
    {
      v75 = 0;
      v76 = &v75;
      v77 = 0x3032000000;
      v78 = __Block_byref_object_copy__8142;
      v79 = __Block_byref_object_dispose__8143;
      v80 = 0;
      aBlock = MEMORY[0x1E0C809B0];
      v68 = 3221225472;
      v69 = ___ZL24_readTaggedObjectOfClassP13NSInputStreamjP10objc_classP19NSMutableDictionaryP14CC_MD5state_stPU15__autoreleasingP7NSError_block_invoke;
      v70 = &unk_1E4544870;
      v74 = v11;
      v72 = &v75;
      v73 = v41;
      v71 = v44;
      v46 = _Block_copy(&aBlock);
      LOBYTE(a7) = VNExecuteBlock(v46, (uint64_t)a8);
      if ((a7 & 1) != 0)
      {
        v47 = v76[5];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v47, v48);

      }
      _Block_object_dispose(&v75, 8);

    }
    else
    {
      LOBYTE(a7) = 0;
    }

    v13 = v63;
    v12 = v65;
    goto LABEL_56;
  }
  if ((_DWORD)v11 != 1833250633 && (_DWORD)v11 != 1835104329)
  {
LABEL_43:
    LOBYTE(a7) = VNPersonsModelIOReadPastUnknownTagData(v12, a7, a8);
    goto LABEL_56;
  }
  LODWORD(v75) = 0;
  v14 = v12;
  LODWORD(aBlock) = 0;
  if (!VNPersonsModelIOReadTagFromInputStream(v14, &aBlock, a7, a8))
  {
LABEL_46:
    LOBYTE(a7) = 0;
    goto LABEL_55;
  }
  if ((_DWORD)aBlock != 4)
  {
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("encountered unexpected length of %u, instead of %u"), aBlock, 4);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      VNPersonsModelErrorForIOError(v49);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_46;
  }
  v15 = VNPersonsModelIOReadBufferFromInputStream(v14, 4u, &v75, a7, a8);

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v75);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v16);

    LOBYTE(a7) = 1;
LABEL_55:

    goto LABEL_56;
  }
  LOBYTE(a7) = 0;
LABEL_56:

  return a7 & 1;
}

+ (VNPersonsModelInformation)_modelInformationFromUnopenedStream:(_QWORD *)a3 error:
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  VNPersonsModelReadOptions *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  VNPersonsModelInformation *v16;
  VNPersonsModelInformation *v17;
  id v19;
  uint64_t v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a2;
  v5 = objc_opt_self();
  objc_msgSend(v4, "open");
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.vis.VNPersonsModelLoader"), 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__8142;
  v29 = __Block_byref_object_dispose__8143;
  v30 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__VNPersonsModel__modelInformationFromUnopenedStream_error___block_invoke_130;
  aBlock[3] = &unk_1E4544820;
  v24 = &v25;
  v7 = v6;
  v23 = v7;
  v8 = _Block_copy(aBlock);
  v9 = objc_alloc_init(VNPersonsModelReadOptions);
  v20 = 0;
  v21 = 0;
  v19 = 0;
  +[VNPersonsModel _readModelObjectsFromStream:options:actionBlock:progressBlock:modelClass:version:error:](v5, v4, v9, &__block_literal_global_127, v8, &v21, &v20, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  v12 = v11;
  if (v10 || (objc_msgSend(v11, "isEqual:", v7) & 1) != 0)
  {
    if (!v26[5])
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v26[5];
      v26[5] = v13;

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E459C850);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = [VNPersonsModelInformation alloc];
    v17 = -[VNPersonsModelInformation initWithVersion:lastModificationDate:algorithm:readOnly:](v16, "initWithVersion:lastModificationDate:algorithm:readOnly:", v20, v26[5], v15, objc_msgSend(v21, "isReadOnly"));

  }
  else
  {
    v17 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v12);
  }

  _Block_object_dispose(&v25, 8);
  objc_msgSend(v4, "close");

  return v17;
}

BOOL __60__VNPersonsModel__modelInformationFromUnopenedStream_error___block_invoke_130(uint64_t a1, int a2, void *a3, _QWORD *a4)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  if (a2 == 1819111268)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
      if (a4)
        *a4 = objc_retainAutorelease(*(id *)(a1 + 32));
    }
    else if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      VNPersonsModelIOStringForTag(1819111268);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ read as %@"), v10, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      VNPersonsModelErrorForInvalidModelData(v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return a2 != 1819111268;
}

+ (id)_readModelObjectsFromStream:(void *)a3 options:(void *)a4 actionBlock:(void *)a5 progressBlock:(_QWORD *)a6 modelClass:(_QWORD *)a7 version:(_QWORD *)a8 error:
{
  id v14;
  unsigned int (**v15)(id, _QWORD);
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  int v21;
  void *v22;
  BOOL v23;
  id v24;
  id v25;
  int v26;
  int v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  BOOL v42;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t (**v48)(id, _QWORD, void *, id *);
  id v49;
  id v50;
  id v51;
  id v52;
  unsigned int v53;
  unsigned int v54;
  CC_MD5_CTX c;
  _QWORD v56[2];
  unsigned __int8 md[8];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v47 = a3;
  v15 = a4;
  v48 = a5;
  objc_opt_self();
  CC_MD5_Init(&c);
  v54 = 0;
  if (!VNPersonsModelIOReadTagFromInputStream(v14, &v54, &c, a8))
    goto LABEL_34;
  v16 = v54;
  objc_opt_self();
  if ((_DWORD)v16 != 1886217324 && (_DWORD)v16 != 1886220911)
  {
    if (a8)
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      VNPersonsModelIOStringForTag(v16);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("unknown model kind '%@'"), v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      VNPersonsModelErrorForInvalidModelData(v34);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v35 = 0;
    goto LABEL_34;
  }
  objc_opt_class();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_34;
  v18 = v17;
  if (a6)
    *a6 = v17;
  v53 = 0;
  if (!VNPersonsModelIOReadTagFromInputStream(v14, &v53, &c, a8))
  {
LABEL_34:
    v36 = 0;
    goto LABEL_35;
  }
  v19 = v53;
  if (a7)
    *a7 = v53;
  objc_msgSend(v47, "acceptableVersions");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44 && (objc_msgSend(v44, "containsIndex:", v19) & 1) == 0)
  {
    if (a8)
    {
      VNPersonsModelErrorForUnacceptableModelVersion(v19);
      v36 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = 0;
    }
    goto LABEL_54;
  }
  v45 = v19;
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0;
  LOBYTE(v21) = 1;
  do
  {
    v22 = (void *)MEMORY[0x1A1B0B060]();
    *(_DWORD *)md = 0;
    v52 = v20;
    v23 = VNPersonsModelIOReadTagFromInputStream(v14, md, &c, &v52);
    v24 = v52;

    v20 = v24;
    if (!v23)
    {
LABEL_24:
      LOBYTE(v21) = 0;
LABEL_25:
      v26 = 3;
      goto LABEL_26;
    }
    if (*(_DWORD *)md == v54)
      goto LABEL_25;
    if (v15 && v15[2](v15, *(unsigned int *)md) == 1)
    {
      v51 = v24;
      v21 = VNPersonsModelIOReadPastUnknownTagData(v14, &c, &v51);
      v25 = v51;

      if (v21)
        v26 = 2;
      else
        v26 = 3;
      v20 = v25;
    }
    else
    {
      v50 = v24;
      v27 = objc_msgSend(v18, "readObjectForModelVersion:tag:fromInputStream:intoObjectDictionary:md5Context:error:", v45);
      v28 = v50;

      if (v27)
      {
        if (v48)
        {
          v29 = *(unsigned int *)md;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)md);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectForKeyedSubscript:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v28;
          LOBYTE(v29) = v48[2](v48, v29, v31, &v49);
          v20 = v49;

          if ((v29 & 1) == 0)
            goto LABEL_24;
        }
        else
        {
          v20 = v28;
        }
        v26 = 0;
        LOBYTE(v21) = 1;
      }
      else
      {
        LOBYTE(v21) = 0;
        v26 = 3;
        v20 = v28;
      }
    }
LABEL_26:
    objc_autoreleasePoolPop(v22);
  }
  while (v26 != 3);
  if ((v21 & 1) == 0)
  {
    if (a8)
    {
      v41 = objc_retainAutorelease(v20);
      v20 = v41;
      goto LABEL_42;
    }
    goto LABEL_52;
  }
  CC_MD5_Final(md, &c);
  v38 = v14;
  v39 = objc_msgSend(v38, "read:maxLength:", v56, 16);
  if (v39 != 16 && a8)
  {
    objc_msgSend(v38, "streamError");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    VNPersonsModelErrorWithLocalizedDescriptionAndUnderlyingError(1, CFSTR("unexpected end of data stream"), v40);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_52;
  }
  v42 = v39 == 16;

  if (!v42)
    goto LABEL_52;
  if (v56[0] == *(_QWORD *)md && v56[1] == v58)
  {
    v36 = v46;
    goto LABEL_53;
  }
  if (!a8)
  {
LABEL_52:
    v36 = 0;
    goto LABEL_53;
  }
  VNPersonsModelErrorWithLocalizedDescription(2, CFSTR("model data cannot be verified due to mismatched checksums"));
  v41 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:
  v36 = 0;
  *a8 = v41;
LABEL_53:

LABEL_54:
LABEL_35:

  return v36;
}

BOOL __60__VNPersonsModel__modelInformationFromUnopenedStream_error___block_invoke(uint64_t a1, int a2)
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
  +[VNPersonsModel _modelFromStream:options:error:](v8, v6, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "close");

  return v9;
}

+ (id)_modelFromStream:(void *)a3 options:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  id v15;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  v14 = 0;
  v15 = 0;
  +[VNPersonsModel _readModelObjectsFromStream:options:actionBlock:progressBlock:modelClass:version:error:](v8, v6, v7, 0, 0, &v15, &v14, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)objc_msgSend(v15, "newModelFromVersion:objects:error:", v14, v9, a4);
    v11 = v10;
    if (v10)
      v12 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __39__VNPersonsModel_supportedReadVersions__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", 1);
  v1 = (void *)+[VNPersonsModel supportedReadVersions]::ourSupportedReadVersions;
  +[VNPersonsModel supportedReadVersions]::ourSupportedReadVersions = v0;

}

@end
