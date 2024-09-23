@implementation VNMutableEntityIdentificationModel

+ (BOOL)canCreateModelOfClass:(Class)a3 withObjects:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v8 = a4;
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    if (a5)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass((Class)a1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ cannot be created from a read-only model"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      VNEntityIdentificationModelErrorForReadOnlyModelWithLocalizedDescription(v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___VNMutableEntityIdentificationModel;
    LOBYTE(a5) = objc_msgSendSuper2(&v13, sel_canCreateModelOfClass_withObjects_error_, a3, v8, a5);
  }

  return (char)a5;
}

+ (id)modelWithConfiguration:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;

  if (a5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromClass((Class)a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ cannot be created with a data source"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(2, v8, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (id)newModelForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E459C7C0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass((Class)a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ cannot open a read-only model"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      VNEntityIdentificationModelErrorForReadOnlyModelWithLocalizedDescription(v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }
  }
  else
  {
    objc_msgSend(a1, "modelConfigurationForVersion:modelObjects:error:", a3, v8, a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v25 = v14;
      v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:", v14);
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E459C7D8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v16, "keyEnumerator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v27 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v16, "objectForKey:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v22) = objc_msgSend(v15, "addObservations:toEntityWithUniqueIdentifier:error:", v23, v22, a5);

            if (!(_DWORD)v22)
            {

              a5 = 0;
              goto LABEL_15;
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v19)
            continue;
          break;
        }
      }

      a5 = v15;
LABEL_15:

      v14 = v25;
    }
    else
    {
      a5 = 0;
    }

  }
  return a5;
}

+ (id)modelWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (objc_msgSend(a1, "validateConfiguration:error:", v6, a4))
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)validateWithCanceller:(id)a3 error:(id *)a4
{
  return -[VNEntityIdentificationModelTrainingData validateWithCanceller:error:](self->_trainingData, "validateWithCanceller:error:", a3, a4);
}

- (VNMutableEntityIdentificationModel)initWithConfiguration:(id)a3
{
  id v4;
  VNEntityIdentificationModelTrainingData *v5;
  VNMutableEntityIdentificationModel *v6;
  objc_super v8;

  v4 = a3;
  v5 = -[VNEntityIdentificationModelTrainingData initWithModelConfiguration:]([VNEntityIdentificationModelTrainingData alloc], "initWithModelConfiguration:", v4);
  v8.receiver = self;
  v8.super_class = (Class)VNMutableEntityIdentificationModel;
  v6 = -[VNEntityIdentificationModel initWithConfiguration:dataSource:](&v8, sel_initWithConfiguration_dataSource_, v4, v5);

  if (v6)
  {
    -[VNEntityIdentificationModelTrainingData setDelegate:](v5, "setDelegate:", v6);
    objc_storeStrong((id *)&v6->_trainingData, v5);
  }

  return v6;
}

- (BOOL)addObservations:(id)a3 toEntityWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  return -[VNEntityIdentificationModelTrainingData addObservations:toEntityWithUniqueIdentifier:error:](self->_trainingData, "addObservations:toEntityWithUniqueIdentifier:error:", a3, a4, a5);
}

- (BOOL)removeObservations:(id)a3 fromEntityWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  return -[VNEntityIdentificationModelTrainingData removeObservations:fromEntityWithUniqueIdentifier:error:](self->_trainingData, "removeObservations:fromEntityWithUniqueIdentifier:error:", a3, a4, a5);
}

- (BOOL)removeAllObservationsFromEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  return -[VNEntityIdentificationModelTrainingData removeAllObservationsFromEntityWithUniqueIdentifier:error:](self->_trainingData, "removeAllObservationsFromEntityWithUniqueIdentifier:error:", a3, a4);
}

- (BOOL)removeEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  return -[VNEntityIdentificationModelTrainingData removeEntityWithUniqueIdentifier:error:](self->_trainingData, "removeEntityWithUniqueIdentifier:error:", a3, a4);
}

- (void)entityIdentificationModelTrainingDataWasModified:(id)a3
{
  -[VNEntityIdentificationModel dropTrainedModelAndReturnError:](self, "dropTrainedModelAndReturnError:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingData, 0);
}

- (BOOL)addAllPersonsFromPersonsModel:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "personUniqueIdentifiers");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (!-[VNMutableEntityIdentificationModel addPersonWithUniqueIdentifier:fromPersonsModel:error:](self, "addPersonWithUniqueIdentifier:fromPersonsModel:error:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v6, a4, (_QWORD)v14))
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)addPersonWithUniqueIdentifier:(id)a3 fromPersonsModel:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  BOOL v10;

  v8 = a3;
  objc_msgSend(a4, "faceObservationsForPersonWithUniqueIdentifier:error:", v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = -[VNMutableEntityIdentificationModel addObservations:toEntityWithUniqueIdentifier:error:](self, "addObservations:toEntityWithUniqueIdentifier:error:", v9, v8, a5);
  else
    v10 = 0;

  return v10;
}

+ (id)modelFromPersonsModel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  VNCreateFaceprintRequest *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  objc_msgSend(v6, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(VNCreateFaceprintRequest);
  if (-[VNRequest setRevision:error:](v8, "setRevision:error:", objc_msgSend(v7, "faceprintRequestRevision"), a4))
  {
    v9 = +[VNEntityIdentificationModelConfiguration newConfigurationForEntityPrintsGeneratedByRequest:error:](VNEntityIdentificationModelConfiguration, "newConfigurationForEntityPrintsGeneratedByRequest:error:", v8, a4);
    if (v9)
    {
      objc_msgSend(v9, "setMaximumEntities:", objc_msgSend(v7, "maximumIdentities"));
      objc_msgSend(v9, "setMaximumTrainingPrintsPerEntity:", objc_msgSend(v7, "maximumTrainingFaceprintsPerIdentity"));
      objc_msgSend(a1, "modelWithConfiguration:error:", v9, a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && objc_msgSend(v10, "addAllPersonsFromPersonsModel:error:", v6, a4))
        v12 = v11;
      else
        v12 = 0;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
