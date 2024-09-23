@implementation MediaConversionServiceCommandLineDriver

- (MediaConversionServiceCommandLineDriver)init
{
  MediaConversionServiceCommandLineDriver *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableArray *conversionOptionSets;
  uint64_t v7;
  PAImageConversionServiceClient *imageConversionServiceClient;
  uint64_t v9;
  PAVideoConversionServiceClient *videoConversionServiceClient;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MediaConversionServiceCommandLineDriver;
  v2 = -[MediaConversionServiceCommandLineDriver init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C99DE8];
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "arrayWithObject:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    conversionOptionSets = v2->_conversionOptionSets;
    v2->_conversionOptionSets = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    imageConversionServiceClient = v2->_imageConversionServiceClient;
    v2->_imageConversionServiceClient = (PAImageConversionServiceClient *)v7;

    v9 = objc_opt_new();
    videoConversionServiceClient = v2->_videoConversionServiceClient;
    v2->_videoConversionServiceClient = (PAVideoConversionServiceClient *)v9;

  }
  return v2;
}

- (BOOL)processOption:(int)a3 arg:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSMutableArray *conversionOptionSets;
  void *v12;

  v6 = a4;
  -[NSMutableArray lastObject](self->_conversionOptionSets, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 0;
  switch(a3)
  {
    case 'c':
      objc_msgSend(v7, "setRepeatCount:", objc_msgSend(v6, "integerValue"));
      if (objc_msgSend(v8, "repeatCount") > 1)
      {
LABEL_6:
        v9 = 1;
        self->_replaceExistingOutput = 1;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "outputError:", CFSTR("Repeat count '%@' is invalid, must be 2 or higher\n"), v6);
        v9 = 0;
      }
      break;
    case 'd':
      objc_msgSend(v7, "setDestinationPath:", v6);
      goto LABEL_22;
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'q':
    case 'u':
      break;
    case 'o':
      if (v6)
      {
        objc_msgSend(v7, "conversionOptionInputKeyValuePairs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v6);

      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "outputError:", CFSTR("-o/--option requires a value\n"));
      }
      goto LABEL_22;
    case 'p':
      v9 = 1;
      self->_showProgress = 1;
      break;
    case 'r':
      objc_msgSend(v7, "setPresetName:", v6);
      goto LABEL_22;
    case 's':
      objc_msgSend(v7, "setSourcePath:", v6);
      goto LABEL_22;
    case 't':
      objc_msgSend(v7, "setConversionType:", v6);
LABEL_22:
      v9 = 1;
      break;
    case 'v':
      v9 = 1;
      self->_verbose = 1;
      break;
    default:
      switch(a3)
      {
        case 1000:
          v9 = 1;
          self->_waitForSignalAfterCompletion = 1;
          break;
        case 1001:
          goto LABEL_6;
        case 1002:
          objc_msgSend(v7, "setSourcePathVideoComplement:", v6);
          goto LABEL_22;
        case 1003:
          objc_msgSend(v7, "setDestinationPathVideoComplement:", v6);
          goto LABEL_22;
        case 1004:
          v9 = 1;
          self->_pauseAtStart = 1;
          break;
        case 1005:
          v9 = 1;
          self->_launchServiceAtStart = 1;
          break;
        case 1006:
          *(_WORD *)&self->_launchServiceAtStart = 257;
          goto LABEL_22;
        case 1007:
          conversionOptionSets = self->_conversionOptionSets;
          v12 = (void *)objc_opt_new();
          -[NSMutableArray addObject:](conversionOptionSets, "addObject:", v12);

          goto LABEL_22;
        default:
          goto LABEL_23;
      }
      break;
  }
LABEL_23:

  return v9;
}

- (BOOL)hasConversionOfType:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_conversionOptionSets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "conversionType", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v4);

        if ((v10 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int)run
{
  int v3;
  pid_t v4;
  uint64_t i;
  void *v6;
  uint64_t j;
  void *v8;
  void *v9;
  int v10;
  NSMutableArray *obj;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = -[MediaConversionServiceCommandLineDriver validateAndProcessArgumentValues](self, "validateAndProcessArgumentValues");
  if (!v3)
  {
    if (self->_pauseAtStart)
    {
      v4 = getpid();
      printf("Client process identifier %d - press return to continue\n", v4);
      getchar();
    }
    if (self->_launchServiceAtStart)
      -[MediaConversionServiceCommandLineDriver sendMessageToLaunchService](self, "sendMessageToLaunchService");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    obj = self->_conversionOptionSets;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v16;
      v3 = 70;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v16 != v14)
            objc_enumerationMutation(obj);
          v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v6, "repeatCount") >= 1)
          {
            for (j = 0; j < objc_msgSend(v6, "repeatCount"); ++j)
            {
              v8 = (void *)MEMORY[0x1D8270370]();
              objc_msgSend(v6, "conversionType");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v9, "isEqualToString:", CFSTR("image")))
              {
                v10 = -[MediaConversionServiceCommandLineDriver runImageConversionWithConversionOptionSet:](self, "runImageConversionWithConversionOptionSet:", v6);
              }
              else if (objc_msgSend(v9, "isEqualToString:", CFSTR("video")))
              {
                v10 = -[MediaConversionServiceCommandLineDriver runVideoConversionWithConversionOptionSet:](self, "runVideoConversionWithConversionOptionSet:", v6);
              }
              else
              {
                if (!objc_msgSend(v9, "isEqualToString:", CFSTR("still")))
                {
                  objc_msgSend((id)objc_opt_class(), "outputError:", CFSTR("Conversion type %@ is unsupported\n"), v9);

                  objc_autoreleasePoolPop(v8);
                  return 70;
                }
                v10 = -[MediaConversionServiceCommandLineDriver runVideoStillExtractionConversionWithConversionOptionSet:](self, "runVideoStillExtractionConversionWithConversionOptionSet:", v6);
              }
              v3 = v10;

              objc_autoreleasePoolPop(v8);
            }
          }
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v13);
    }
    else
    {
      v3 = 70;
    }

    if (self->_waitForSignalAfterCompletion)
      -[MediaConversionServiceCommandLineDriver waitForSigInt](self, "waitForSigInt");
    -[PAVideoConversionServiceClient invalidateAfterPendingRequestCompletion](self->_videoConversionServiceClient, "invalidateAfterPendingRequestCompletion");
  }
  return v3;
}

- (void)sendMessageToLaunchService
{
  _BOOL4 v3;
  uint64_t v4;
  dispatch_semaphore_t v5;
  PAImageConversionServiceClient *imageConversionServiceClient;
  NSObject *v7;
  dispatch_semaphore_t v8;
  PAVideoConversionServiceClient *videoConversionServiceClient;
  NSObject *v10;
  _QWORD v11[5];
  NSObject *v12;
  uint64_t *v13;
  _QWORD v14[5];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v3 = -[MediaConversionServiceCommandLineDriver hasConversionOfType:](self, "hasConversionOfType:", CFSTR("image"));
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = dispatch_semaphore_create(0);
    imageConversionServiceClient = self->_imageConversionServiceClient;
    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __69__MediaConversionServiceCommandLineDriver_sendMessageToLaunchService__block_invoke;
    v14[3] = &unk_1E9953BC0;
    v16 = &v17;
    v14[4] = self;
    v7 = v5;
    v15 = v7;
    -[PAImageConversionServiceClient requestStatusWithCompletionHandler:](imageConversionServiceClient, "requestStatusWithCompletionHandler:", v14);
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (-[MediaConversionServiceCommandLineDriver hasConversionOfType:](self, "hasConversionOfType:", CFSTR("video"))
    || -[MediaConversionServiceCommandLineDriver hasConversionOfType:](self, "hasConversionOfType:", CFSTR("still")))
  {
    v8 = dispatch_semaphore_create(0);
    videoConversionServiceClient = self->_videoConversionServiceClient;
    v11[0] = v4;
    v11[1] = 3221225472;
    v11[2] = __69__MediaConversionServiceCommandLineDriver_sendMessageToLaunchService__block_invoke_2;
    v11[3] = &unk_1E9953BC0;
    v13 = &v17;
    v11[4] = self;
    v10 = v8;
    v12 = v10;
    -[PAVideoConversionServiceClient requestStatusWithCompletionHandler:](videoConversionServiceClient, "requestStatusWithCompletionHandler:", v11);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (*((_DWORD *)v18 + 6) && self->_pauseAfterLaunchingService)
  {
    printf("Service process identifier %d - press return to continue\n", *((_DWORD *)v18 + 6));
    getchar();
  }
  _Block_object_dispose(&v17, 8);
}

- (int)runImageConversionWithConversionOptionSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_semaphore_t v21;
  PAImageConversionServiceClient *imageConversionServiceClient;
  void *v23;
  NSObject *v24;
  _QWORD v26[5];
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "sourcePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:](PAMediaConversionServiceResourceURLCollection, "collectionWithMainResourceURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourcePathVideoComplement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "sourcePathVideoComplement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setResourceURL:forRole:", v12, CFSTR("PAMediaConversionResourceRoleVideoComplement"));
  }
  v13 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "destinationPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[PAMediaConversionServiceResourceURLCollection collectionWithMainResourceURL:](PAMediaConversionServiceResourceURLCollection, "collectionWithMainResourceURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinationPathVideoComplement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "destinationPathVideoComplement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fileURLWithPath:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setResourceURL:forRole:", v20, CFSTR("PAMediaConversionResourceRoleVideoComplement"));
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v21 = dispatch_semaphore_create(0);
  imageConversionServiceClient = self->_imageConversionServiceClient;
  objc_msgSend(v4, "conversionOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __85__MediaConversionServiceCommandLineDriver_runImageConversionWithConversionOptionSet___block_invoke;
  v26[3] = &unk_1E9953BF8;
  v26[4] = self;
  v28 = &v29;
  v24 = v21;
  v27 = v24;
  -[PAImageConversionServiceClient convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:](imageConversionServiceClient, "convertImageAtSourceURLCollection:toDestinationURLCollection:options:completionHandler:", v8, v16, v23, v26);

  dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v23) = *((_DWORD *)v30 + 6);

  _Block_object_dispose(&v29, 8);
  return (int)v23;
}

- (int)runVideoConversionWithConversionOptionSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  dispatch_semaphore_t v14;
  PAVideoConversionServiceClient *videoConversionServiceClient;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSProgress *v19;
  NSProgress *conversionProgress;
  void (__cdecl *v21)(int);
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  _QWORD handler[5];
  _QWORD v29[5];
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  id v36[2];

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "sourcePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "destinationPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = 0;
  v12 = objc_msgSend(v11, "writeToURL:options:error:", v10, 1, v36);
  v13 = v36[0];

  if ((v12 & 1) != 0)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 70;
    v14 = dispatch_semaphore_create(0);
    videoConversionServiceClient = self->_videoConversionServiceClient;
    objc_msgSend(v4, "conversionOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __85__MediaConversionServiceCommandLineDriver_runVideoConversionWithConversionOptionSet___block_invoke;
    v29[3] = &unk_1E9953BF8;
    v29[4] = self;
    v31 = &v32;
    v18 = v14;
    v30 = v18;
    -[PAVideoConversionServiceClient convertVideoAtSourceURL:toDestinationURL:options:completionHandler:](videoConversionServiceClient, "convertVideoAtSourceURL:toDestinationURL:options:completionHandler:", v7, v10, v16, v29);
    v19 = (NSProgress *)objc_claimAutoreleasedReturnValue();
    conversionProgress = self->_conversionProgress;
    self->_conversionProgress = v19;

    v21 = signal(2, (void (__cdecl *)(int))1);
    if (v21 == (void (__cdecl *)(int))-1)
    {
      v23 = 0;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = dispatch_source_create(MEMORY[0x1E0C80DC0], 2uLL, 0, v22);

      handler[0] = v17;
      handler[1] = 3221225472;
      handler[2] = __85__MediaConversionServiceCommandLineDriver_runVideoConversionWithConversionOptionSet___block_invoke_2;
      handler[3] = &unk_1E9953C20;
      handler[4] = self;
      dispatch_source_set_event_handler(v23, handler);
      dispatch_activate(v23);
    }
    -[NSProgress addObserver:forKeyPath:options:context:](self->_conversionProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, 0);
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    if (v21 != (void (__cdecl *)(int))-1)
    {
      dispatch_source_cancel(v23);
      signal(2, v21);
    }
    v26 = *((_DWORD *)v33 + 6);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v24 = (void *)objc_opt_class();
    objc_msgSend(v4, "destinationPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "outputError:", CFSTR("Unable to create output file '%@': %@\n"), v25, v13);

    v26 = 73;
  }

  return v26;
}

- (int)runVideoStillExtractionConversionWithConversionOptionSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  dispatch_semaphore_t v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  id v29;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "sourcePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v4, "destinationPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v13 = objc_msgSend(v12, "writeToURL:options:error:", v11, 1, &v29);
  v14 = v29;

  if ((v13 & 1) != 0)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 70;
    v15 = dispatch_semaphore_create(0);
    objc_msgSend(v4, "conversionOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __100__MediaConversionServiceCommandLineDriver_runVideoStillExtractionConversionWithConversionOptionSet___block_invoke;
    v22[3] = &unk_1E9953BF8;
    v22[4] = self;
    v24 = &v25;
    v17 = v15;
    v23 = v17;
    objc_msgSend(v5, "extractStillImageFromVideoAtSourceURL:toDestinationURL:options:completionHandler:", v8, v11, v16, v22);

    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    v18 = *((_DWORD *)v26 + 6);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v19 = (void *)objc_opt_class();
    objc_msgSend(v4, "destinationPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "outputError:", CFSTR("Unable to create output file '%@': %@\n"), v20, v14);

    v18 = 73;
  }

  return v18;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSProgress *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v9 = (NSProgress *)a4;
  v10 = a5;
  if (self->_showProgress && self->_conversionProgress == v9)
  {
    v11 = (void *)objc_opt_class();
    -[NSProgress fractionCompleted](self->_conversionProgress, "fractionCompleted");
    objc_msgSend(v11, "outputError:", CFSTR("Progress: %f\n"), v12, v13);
  }

}

- (int)validateAndProcessArgumentValues
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  int v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_conversionOptionSets;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "setReplaceExistingOutput:", self->_replaceExistingOutput, (_QWORD)v12);
        objc_msgSend(v8, "setVerbose:", self->_verbose);
        v9 = objc_msgSend(v8, "validateAndProcess");
        if (v9)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)waitForSigInt
{
  void (__cdecl *v4)(int);
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int *v10;
  _QWORD handler[4];
  dispatch_semaphore_t v12;

  v4 = signal(2, (void (__cdecl *)(int))1);
  if (v4 == (void (__cdecl *)(int))-1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = __error();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MediaConversionServiceCommandLineDriver.m"), 987, CFSTR("Unable to wait for SIGINT: %s\n"), strerror(*v10));

  }
  v5 = dispatch_semaphore_create(0);
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_source_create(MEMORY[0x1E0C80DC0], 2uLL, 0, v6);

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __56__MediaConversionServiceCommandLineDriver_waitForSigInt__block_invoke;
  handler[3] = &unk_1E9953C20;
  v12 = v5;
  v8 = v5;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(v7);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_source_cancel(v7);
  signal(2, v4);

}

- (NSMutableArray)conversionOptionSets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConversionOptionSets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSProgress)conversionProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConversionProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (BOOL)showProgress
{
  return self->_showProgress;
}

- (void)setShowProgress:(BOOL)a3
{
  self->_showProgress = a3;
}

- (BOOL)replaceExistingOutput
{
  return self->_replaceExistingOutput;
}

- (void)setReplaceExistingOutput:(BOOL)a3
{
  self->_replaceExistingOutput = a3;
}

- (BOOL)waitForSignalAfterCompletion
{
  return self->_waitForSignalAfterCompletion;
}

- (void)setWaitForSignalAfterCompletion:(BOOL)a3
{
  self->_waitForSignalAfterCompletion = a3;
}

- (BOOL)pauseAtStart
{
  return self->_pauseAtStart;
}

- (void)setPauseAtStart:(BOOL)a3
{
  self->_pauseAtStart = a3;
}

- (BOOL)launchServiceAtStart
{
  return self->_launchServiceAtStart;
}

- (void)setLaunchServiceAtStart:(BOOL)a3
{
  self->_launchServiceAtStart = a3;
}

- (BOOL)pauseAfterLaunchingService
{
  return self->_pauseAfterLaunchingService;
}

- (void)setPauseAfterLaunchingService:(BOOL)a3
{
  self->_pauseAfterLaunchingService = a3;
}

- (PAImageConversionServiceClient)imageConversionServiceClient
{
  return (PAImageConversionServiceClient *)objc_getProperty(self, a2, 32, 1);
}

- (void)setImageConversionServiceClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PAVideoConversionServiceClient)videoConversionServiceClient
{
  return (PAVideoConversionServiceClient *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVideoConversionServiceClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_conversionProgress, 0);
  objc_storeStrong((id *)&self->_conversionOptionSets, 0);
}

intptr_t __56__MediaConversionServiceCommandLineDriver_waitForSigInt__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __100__MediaConversionServiceCommandLineDriver_runVideoStillExtractionConversionWithConversionOptionSet___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (a2 == 1)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
      objc_msgSend((id)objc_opt_class(), "output:", CFSTR("Raw output information: %@\n"), v10);
    if (objc_msgSend((id)objc_opt_class(), "outputJSONDataForConversionOutputInformation:", v10))
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "outputConversionError:status:", v7, a2);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), CFSTR("fractionCompleted"));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = 0;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __85__MediaConversionServiceCommandLineDriver_runVideoConversionWithConversionOptionSet___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (a2 == 1)
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
      objc_msgSend((id)objc_opt_class(), "output:", CFSTR("Raw output information: %@\n"), v10);
    if (objc_msgSend((id)objc_opt_class(), "outputJSONDataForConversionOutputInformation:", v10))
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "outputConversionError:status:", v7, a2);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 32), CFSTR("fractionCompleted"));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = 0;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __85__MediaConversionServiceCommandLineDriver_runVideoConversionWithConversionOptionSet___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_opt_class(), "outputError:", CFSTR("Received SIGINT, cancelling conversion\n"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cancel");
}

void __85__MediaConversionServiceCommandLineDriver_runImageConversionWithConversionOptionSet___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (a2 != 1)
  {
    objc_msgSend((id)objc_opt_class(), "outputConversionError:status:", v7, a2);
    v11 = 70;
LABEL_10:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
    goto LABEL_11;
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceResultDataKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("(NSData removed)"), CFSTR("PAMediaConversionServiceResultDataKey"));

    v10 = v9;
  }
  else
  {
    v10 = v12;
  }
  v12 = v10;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
    objc_msgSend((id)objc_opt_class(), "output:", CFSTR("Raw output information: %@\n"), v10);
  if ((objc_msgSend((id)objc_opt_class(), "outputJSONDataForConversionOutputInformation:", v12) & 1) != 0)
  {
    v11 = 0;
    goto LABEL_10;
  }
LABEL_11:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __69__MediaConversionServiceCommandLineDriver_sendMessageToLaunchService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceProcessIdentifierKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "intValue");

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "outputError:", CFSTR("Unable to get image conversion service status: %@\n"), v6);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __69__MediaConversionServiceCommandLineDriver_sendMessageToLaunchService__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PAMediaConversionServiceProcessIdentifierKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "intValue");

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "outputError:", CFSTR("Unable to get video conversion service status: %@\n"), v6);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (id)usage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "usagesummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@\n%@"), v3, CFSTR("\n\timage:       Convert an image\n\tvideo:       Convert a video\n\tstill:       Extract a still image from a video\n\n\t--replace:             Overwrite existing output file\n\t--wait:                On completion, suspend the process until a SIGINT signal is received instead of exiting right away. This lets you inspect the state of the client and service processes after completion, especially for memory investigations.\n\t--option:              Pass a conversion option key/value pair. Key and value are separated by a = character. The keys are as defined in PAMediaConversionServiceCommonDefinitions.h, with the 'PAMediaConversion' prefix and the 'Key' suffix omitted. You can pass this option multiple times.\n\t--preset:              Apply a pre-defined set of conversion options for common cases. Pass '?' to get a list of preset names.\n\t--count:               Repeat the conversion n times, for memory or other performance investigations. Implies --replace.\n\t--progress:            Print progress for video conversion to stderr\n\t--pause:               Print the client PID and wait for keyboard input before sending any requests to the service. On macOS this lets you manipulate the launch environment of the service process with 'launchctl debug pid/<client PID>/com.apple.photos.ImageConversionService' (or VideoConversionService).\n\t--launch:              Send an initial XPC message to the service to ensure it is launched when the main conversion request is sent. This lets you measure request performance without process launch time.\n\t--launch-and-pause:    Like --launch, but additionally waits for keyboard input before sending any requests to the service. This lets you attach to the service process with perf tools or the debugger before the main conversion request is processed.\n\t--next:                Capture all options given so far as a conversion request and start a new request. All following options apply to the next request. This lets you execute multiple independent requests back-to-back."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)usagesummary
{
  void *v2;
  void *v3;
  void *v4;

  +[ConversionOptionSet knownConversionTypes](ConversionOptionSet, "knownConversionTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("|"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-t|--type [%@] -s|--source <input media path> -d|--destination <output media path> [--source-video-complement <input media path>] [--destination-video-complement <output media path>] [--replace] [[-o|--option <key>=<value>], ...] [-r|--preset <preset>] [-c|--count <count>] [-v|--verbose] [--wait] [-p|--progress] [--pause] [--launch] [--launch-and-pause] [--next]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (const)optstring
{
  return "t:s:d:o:r:c:vp";
}

+ (option)longopts
{
  return (option *)&longopts__opts;
}

+ (BOOL)outputJSONDataForConversionOutputInformation:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v12;

  objc_msgSend(a1, "replacementObjectForObject:valueConversionHandler:", a3, &__block_literal_global_330);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 0, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardOutput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v5);
    objc_msgSend(CFSTR("\n"), "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v9);

    v10 = 1;
  }
  else
  {
    objc_msgSend(a1, "outputError:", CFSTR("Conversion successful but unable to convert output information to JSON: %@\n"), v6);
    v10 = 0;
  }

  return v10;
}

+ (id)replacementObjectForObject:(id)a3 valueConversionHandler:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  void (**v28)(_QWORD, _QWORD);
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MediaConversionServiceCommandLineDriver.m"), 938, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MediaConversionServiceCommandLineDriver.m"), 939, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueConversionHandler"));

LABEL_3:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(a1, "replacementObjectForObject:valueConversionHandler:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v16), v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v14);
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)MEMORY[0x1E0C99E08];
      v19 = v7;
      objc_msgSend(v18, "dictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __93__MediaConversionServiceCommandLineDriver_replacementObjectForObject_valueConversionHandler___block_invoke;
      v26[3] = &unk_1E9953C88;
      v21 = v20;
      v27 = v21;
      v29 = a1;
      v28 = v9;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v26);

      v22 = v28;
      v11 = v21;

    }
    else
    {
      ((void (**)(_QWORD, id))v9)[2](v9, v7);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v11;
}

+ (void)outputConversionError:(id)a3 status:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PAMediaConversionServiceErrorDomain"));

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_msgSend(v15, "code");
    if (v9 > 0xC)
      v10 = 0;
    else
      v10 = off_1E9953408[v9];
    v12 = v10;
    objc_msgSend(v8, "stringWithFormat:", CFSTR(" (%@)"), v12);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = &stru_1E9955DB0;
  }
  if ((unint64_t)a4 > 6)
    v13 = 0;
  else
    v13 = off_1E9953470[a4];
  v14 = v13;
  objc_msgSend(a1, "outputError:", CFSTR("Conversion unsuccessful (status %ld - %@): %@%@\n"), a4, v14, v15, v11);

}

+ (void)outputError:(id)a3
{
  uint64_t v3;

  +[MediaConversionServiceCommandLineDriver _output:arguments:file:]((uint64_t)a1, a3, (uint64_t)&v3, (FILE *)*MEMORY[0x1E0C80C10]);
}

+ (void)output:(id)a3
{
  uint64_t v3;

  +[MediaConversionServiceCommandLineDriver _output:arguments:file:]((uint64_t)a1, a3, (uint64_t)&v3, (FILE *)*MEMORY[0x1E0C80C20]);
}

+ (void)_output:(uint64_t)a3 arguments:(FILE *)a4 file:
{
  id v6;
  void *v7;
  id v8;

  v6 = a2;
  objc_opt_self();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v6, a3);

  v8 = objc_retainAutorelease(v7);
  fputs((const char *)objc_msgSend(v8, "UTF8String"), a4);

}

void __93__MediaConversionServiceCommandLineDriver_replacementObjectForObject_valueConversionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = a2;
  objc_msgSend(v5, "replacementObjectForObject:valueConversionHandler:", a3, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

}

id __88__MediaConversionServiceCommandLineDriver_outputJSONDataForConversionOutputInformation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0CB36A8];
    objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromDate:timeZone:formatOptions:", v2, v4, 4083);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v5;
  }
  return v2;
}

@end
