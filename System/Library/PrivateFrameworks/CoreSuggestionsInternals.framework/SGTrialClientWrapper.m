@implementation SGTrialClientWrapper

- (SGTrialClientWrapper)initWithClientIdentifier:(int)a3
{
  uint64_t v3;
  SGTrialClientWrapper *v4;
  uint64_t v5;
  TRIClient *triClient;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  OS_dispatch_queue *serialQueue;
  objc_super v16;

  v3 = *(_QWORD *)&a3;
  v16.receiver = self;
  v16.super_class = (Class)SGTrialClientWrapper;
  v4 = -[SGTrialClientWrapper init](&v16, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    triClient = v4->_triClient;
    v4->_triClient = (TRIClient *)v5;

    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("com.apple.suggestd.%@.serialQueue"), v9);

    v11 = (void *)MEMORY[0x1E0D81598];
    v12 = objc_retainAutorelease(v10);
    objc_msgSend(v11, "autoreleasingSerialQueueWithLabel:qosClass:", objc_msgSend(v12, "UTF8String"), 9);
    v13 = objc_claimAutoreleasedReturnValue();
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v13;

  }
  return v4;
}

- (BOOL)refreshEnrollmentInformationForNamespace:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  NSString *experimentId;
  NSString *v8;
  NSString *treatmentId;
  NSObject *v10;
  uint8_t v12[16];

  -[TRIClient experimentIdentifiersWithNamespaceName:](self->_triClient, "experimentIdentifiersWithNamespaceName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "experimentId");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    experimentId = self->_experimentId;
    self->_experimentId = v6;

    self->_deploymentId = objc_msgSend(v5, "deploymentId");
    objc_msgSend(v5, "treatmentId");
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    treatmentId = self->_treatmentId;
    self->_treatmentId = v8;

  }
  else
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_INFO, "SGTrialClientWrapper: Unable to fetch experimentId, deploymentId, treatmentId", v12, 2u);
    }

  }
  return v5 != 0;
}

- (BOOL)refreshRolloutIdentifiersForNamespace:(id)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  -[TRIClient rolloutIdentifiersWithNamespaceName:](self->_triClient, "rolloutIdentifiersWithNamespaceName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_storeStrong((id *)&self->_rolloutIdentifiers, v4);
  }
  else
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "SGTrialClientWrapper: Unable to fetch rolloutIdentifiers", v7, 2u);
    }

  }
  return v4 != 0;
}

- (id)treatmentId
{
  return self->_treatmentId;
}

- (id)experimentId
{
  return self->_experimentId;
}

- (id)deploymentId
{
  void *v2;

  if (self->_deploymentId == -1)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)rolloutIdentifiers
{
  return self->_rolloutIdentifiers;
}

- (id)baseModelName
{
  return &stru_1E7DB83A8;
}

- (void)uncompressModelAndUpdateFactors:(id)a3 destinationPath:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__SGTrialClientWrapper_uncompressModelAndUpdateFactors_destinationPath___block_invoke;
  block[3] = &unk_1E7DB7800;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialQueue, block);

}

- (BOOL)_uncompressModelAtPath:(id)a3 toPath:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  char v14;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  NSObject *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v6);

  if (v9)
  {
    -[SGTrialClientWrapper modelPathForCurrentEnrollment](self, "modelPathForCurrentEnrollment");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "fileExistsAtPath:", v10),
          v11,
          (v12 & 1) == 0))
    {
      -[SGTrialClientWrapper cleanExperimentModelsFromTrialModelsFolder](self, "cleanExperimentModelsFromTrialModelsFolder");
      sgRemindersLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_debug_impl(&dword_1C3607000, v16, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: Unzipping model override at path: %@", buf, 0xCu);
      }

      -[SGTrialClientWrapper _modelDirectoryPathCreateIfNeeded:](self, "_modelDirectoryPathCreateIfNeeded:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SGTrialClientWrapper _unarchiveFrom:to:](self, "_unarchiveFrom:to:", v6, v17);

      if (v18)
      {
        -[SGTrialClientWrapper _modelDirectoryPathCreateIfNeeded:](self, "_modelDirectoryPathCreateIfNeeded:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SGTrialClientWrapper baseModelName](self, "baseModelName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByAppendingPathComponent:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "stringByAppendingPathExtension:", CFSTR("mlmodelc"));
        v13 = objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
          objc_msgSend(v22, "moveItemAtPath:toPath:error:", v13, v7, &v25);
          v23 = v25;

          if (v23)
          {
            sgRemindersLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v27 = v10;
              v28 = 2112;
              v29 = v23;
              _os_log_debug_impl(&dword_1C3607000, v24, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: Cannot move model to %@. Error %@", buf, 0x16u);
            }
            v14 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v24 = objc_claimAutoreleasedReturnValue();
            v14 = -[NSObject fileExistsAtPath:](v24, "fileExistsAtPath:", v7);
          }

        }
        else
        {
          sgRemindersLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C3607000, v23, OS_LOG_TYPE_DEFAULT, "SGReminderTrialClientWrapper: unable to fetch origin path.", buf, 2u);
          }
          v14 = 0;
        }

        goto LABEL_7;
      }
      sgRemindersLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: Error while unzipping the model override.", buf, 2u);
      }
    }
    else
    {
      sgRemindersLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_debug_impl(&dword_1C3607000, v13, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: Model override is already in uncompressed at path: %@", buf, 0xCu);
      }
    }
    v14 = 0;
LABEL_7:

    goto LABEL_11;
  }
  sgRemindersLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v6;
    _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "SGReminderTrialClientWrapper: No file found at source path: %@", buf, 0xCu);
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)_unarchiveFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSURL *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v5);
  v8 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v6);
  v9 = (void *)MEMORY[0x1C3BD4F6C]();
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v7, 1, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  objc_autoreleasePoolPop(v9);
  if (v10)
  {
    v12 = objc_retainAutorelease(v10);
    v13 = SGUnarchiverZip((const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), v8);
  }
  else
  {
    sgLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v7;
      v19 = 2112;
      v20 = v11;
      _os_log_error_impl(&dword_1C3607000, v14, OS_LOG_TYPE_ERROR, "Unable to the source data from file URL: %@. (Error: %@)", buf, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (void)cleanExperimentModelsFromTrialModelsFolder
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  void *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGPaths suggestionsSubdirectory:creatingDirectoriesIfNeeded:](SGPaths, "suggestionsSubdirectory:creatingDirectoriesIfNeeded:", CFSTR("TrialModels"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v3;
  objc_msgSend(v3, "enumeratorAtPath:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = (void *)v5;
    *(_QWORD *)&v6 = 138412290;
    v19 = v6;
    while (1)
    {
      objc_msgSend(v7, "pathExtension", v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("mlmodelc")))
        goto LABEL_10;
      objc_msgSend(v7, "pathComponents");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByDeletingPathExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGTrialClientWrapper baseModelName](self, "baseModelName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "containsString:", v12);

      if (v13)
        break;
LABEL_11:
      objc_msgSend(v4, "nextObject");
      v18 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v18;
      if (!v18)
        goto LABEL_12;
    }
    objc_msgSend(v20, "stringByAppendingPathComponent:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v15 = objc_msgSend(v21, "removeItemAtPath:error:", v14, &v22);
    v16 = v22;

    if (!v15 || (v8 = 0, v16))
    {
      sgLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v19;
        v24 = v7;
        _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "SGReminderTrialClientWrapper: Couldn't delete model override file: %@", buf, 0xCu);
      }

      v8 = v16;
    }
LABEL_10:

    goto LABEL_11;
  }
LABEL_12:

}

- (id)modelPath
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  -[SGTrialClientWrapper modelPathForCurrentEnrollment](self, "modelPathForCurrentEnrollment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "fileExistsAtPath:", v2),
        v3,
        v4))
  {
    v5 = v2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)modelPathForCurrentEnrollment
{
  void *v3;
  void *v4;
  void *v5;

  -[SGTrialClientWrapper _modelNameForCurrentEnrollment](self, "_modelNameForCurrentEnrollment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SGTrialClientWrapper _modelDirectoryPathCreateIfNeeded:](self, "_modelDirectoryPathCreateIfNeeded:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)modelPathForTriClient:(id)a3 andNamespace:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "experimentIdentifiersWithNamespaceName:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "deploymentId") == -1)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v6, "deploymentId"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "experimentId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "treatmentId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGTrialClientWrapper _modelPathForExperimentId:treatmentId:deploymentId:createIfNeeded:](self, "_modelPathForExperimentId:treatmentId:deploymentId:createIfNeeded:", v9, v10, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)modelPathForExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(id)a5
{
  return -[SGTrialClientWrapper _modelPathForExperimentId:treatmentId:deploymentId:createIfNeeded:](self, "_modelPathForExperimentId:treatmentId:deploymentId:createIfNeeded:", a3, a4, a5, 0);
}

- (id)_modelPathForExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(id)a5 createIfNeeded:(BOOL)a6
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;

  v6 = a6;
  -[SGTrialClientWrapper _modelNameForExperimentId:treatmentId:deploymentId:](self, "_modelNameForExperimentId:treatmentId:deploymentId:", a3, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SGTrialClientWrapper _modelDirectoryPathCreateIfNeeded:](self, "_modelDirectoryPathCreateIfNeeded:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_modelDirectoryPathCreateIfNeeded:(BOOL)a3
{
  return +[SGPaths suggestionsSubdirectory:creatingDirectoriesIfNeeded:](SGPaths, "suggestionsSubdirectory:creatingDirectoriesIfNeeded:", CFSTR("TrialModels"), a3);
}

- (id)_modelNameForCurrentEnrollment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SGTrialClientWrapper experimentId](self, "experimentId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGTrialClientWrapper treatmentId](self, "treatmentId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGTrialClientWrapper deploymentId](self, "deploymentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGTrialClientWrapper _modelNameForExperimentId:treatmentId:deploymentId:](self, "_modelNameForExperimentId:treatmentId:deploymentId:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_modelNameForExperimentId:(id)a3 treatmentId:(id)a4 deploymentId:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a4;
  v11 = a3;
  v12 = [v9 alloc];
  -[SGTrialClientWrapper baseModelName](self, "baseModelName");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v8)
    v15 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@_%@_%@_%@"), v13, v10, v11, v8);
  else
    v15 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@_%@_%@"), v13, v10, v11, v19);
  v16 = (void *)v15;

  objc_msgSend(v16, "stringByAppendingPathExtension:", CFSTR("mlmodelc"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_triClient, 0);
}

uint64_t __72__SGTrialClientWrapper_uncompressModelAndUpdateFactors_destinationPath___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_uncompressModelAtPath:toPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "refresh");
    return objc_msgSend(*(id *)(a1 + 32), "updateFactors");
  }
  return result;
}

@end
