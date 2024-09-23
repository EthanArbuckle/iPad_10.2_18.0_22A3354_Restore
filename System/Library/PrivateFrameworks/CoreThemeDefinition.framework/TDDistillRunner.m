@implementation TDDistillRunner

- (TDDistillRunner)init
{
  TDDistillRunner *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TDDistillRunner;
  result = -[TDDistillRunner init](&v3, sel_init);
  if (result)
    result->_assetStoreVersionNumber = 17;
  return result;
}

- (id)carScratchURL
{
  id result;
  int v4;
  size_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char __s[1024];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  result = self->_carScratchURL;
  if (!result)
  {
    -[NSString getFileSystemRepresentation:maxLength:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("CoreThemeThemeDistillXXXXXX.car")), "getFileSystemRepresentation:maxLength:", __s, 1024);
    v4 = mkstemps(__s, 4);
    v5 = strlen(__s);
    self->_carScratchURL = (NSURL *)CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)__s, v5, 0);
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", objc_msgSend(v6, "attributesOfItemAtPath:error:", -[NSURL path](self->_carScratchURL, "path"), 0));
    v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 420);
    objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x24BDD0CC8]);
    objc_msgSend(v6, "setAttributes:ofItemAtPath:error:", v7, -[NSURL path](self->_carScratchURL, "path"), 0);
    close(v4);
    return self->_carScratchURL;
  }
  return result;
}

- (void)_removeScratchPath
{
  id v2;

  v2 = -[TDDistillRunner carScratchURL](self, "carScratchURL");
  if (objc_msgSend(v2, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtURL:error:", v2, 0);
}

- (void)_moveScratchToOutputPath
{
  id v4;
  void *v5;
  NSURL *v6;
  TDLogger *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = -[TDDistillRunner carScratchURL](self, "carScratchURL");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  if ((objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TDDistillRunner.m"), 79, CFSTR("-[TPDistillerController _moveScratchToOutputPath] called with no file at %@"), objc_msgSend(v4, "path"));
  v6 = -[TDDistillRunner outputURL](self, "outputURL");
  if (-[NSURL checkResourceIsReachableAndReturnError:](v6, "checkResourceIsReachableAndReturnError:", 0))
    objc_msgSend(v5, "removeItemAtURL:error:", v6, 0);
  v10 = 0;
  if ((objc_msgSend(v5, "moveItemAtURL:toURL:error:", v4, v6, &v10) & 1) == 0)
  {
    v7 = -[TDDistillRunner logger](self, "logger");
    v8 = objc_msgSend(v4, "path");
    v9 = -[NSURL path](v6, "path");
    -[TDLogger logErrorWithFormat:](v7, "logErrorWithFormat:", CFSTR("move from %@ toPath: %@ failed: %@"), v8, v9, v10);
  }
}

- (BOOL)_isDistillUnnecessaryForDocument:(id)a3
{
  NSURL *v4;
  TDProMergeableCommonAssetStorage *v5;
  int v6;
  void *v7;
  int v8;

  v4 = -[TDDistillRunner outputURL](self, "outputURL");
  if (-[NSURL checkResourceIsReachableAndReturnError:](v4, "checkResourceIsReachableAndReturnError:", 0))
  {
    v5 = -[TDProMergeableCommonAssetStorage initWithPath:]([TDProMergeableCommonAssetStorage alloc], "initWithPath:", -[NSURL path](v4, "path"));
    v6 = objc_msgSend(a3, "checksum");
    if (v5 && v6 == -[CUICommonAssetStorage associatedChecksum](v5, "associatedChecksum"))
    {
      v7 = (void *)objc_msgSend(a3, "historian");
      v8 = objc_msgSend(v7, "foundDataChangesSinceDate:", objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)-[CUICommonAssetStorage storageTimestamp](v5, "storageTimestamp"))) ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)packImagesInDocument
{
  return self->_packDocument;
}

- (void)setPackImagesInDocument:(BOOL)a3
{
  self->_packDocument = a3;
}

- (BOOL)runDistillWithDocumentURL:(id)a3 outputURL:(id)a4 attemptIncremental:(BOOL)a5 forceDistill:(BOOL)a6
{
  _BOOL8 v7;
  uint64_t v11;
  _copyfile_state *v12;
  int v13;
  TDLogger *v14;
  uint64_t v15;
  id v16;
  CoreThemeDocument *v17;
  void *v18;
  id v19;
  CoreThemeDocument *v20;
  id v21;
  TDLogger *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  TDDistiller *v28;
  TDDistiller *distiller;
  _QWORD v30[8];
  _QWORD v31[5];
  uint64_t v32;
  void *v33;
  id v34;
  char to[1024];
  uint64_t v36;

  v7 = a5;
  v36 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  v34 = 0;
  v11 = objc_msgSend(a3, "pathExtension");
  v32 = 0;
  -[TDDistillRunner setOutputURL:](self, "setOutputURL:", a4);
  -[NSString getFileSystemRepresentation:maxLength:](-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", CFSTR("CoreThemeDefinitionMigrationXXXXXX")), "getFileSystemRepresentation:maxLength:", to, 1024);
  mktemp(to);
  v12 = copyfile_state_alloc();
  v13 = copyfile((const char *)objc_msgSend(a3, "fileSystemRepresentation"), to, v12, 0x1000000u);
  copyfile_state_free(v12);
  v14 = -[TDDistillRunner logger](self, "logger");
  v15 = objc_msgSend(a3, "fileSystemRepresentation");
  if (v13 < 0)
  {
    -[TDLogger logErrorWithFormat:](v14, "logErrorWithFormat:", CFSTR("Unable to copy '%s' to '%s' distil failed."), v15, to);
    return 0;
  }
  -[TDLogger logInfoWithFormat:](v14, "logInfoWithFormat:", CFSTR("Distiling document '%s' to '%s."), v15, to);
  v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", to, 0, 0);
  v17 = -[CoreThemeDocument initWithContentsOfURL:ofType:error:]([CoreThemeDocument alloc], "initWithContentsOfURL:ofType:error:", v16, v11, &v34);
  -[CoreThemeDocument setPathToRepresentedDocument:](v17, "setPathToRepresentedDocument:", objc_msgSend(a3, "path"));
  if (v17)
  {
    -[CoreThemeDocument setMinimumDeploymentVersion:](v17, "setMinimumDeploymentVersion:", -[TDDistillRunner minDeploymentTarget](self, "minDeploymentTarget"));
    if (!-[TDDistillRunner packImagesInDocument](self, "packImagesInDocument"))
      goto LABEL_17;
    -[CoreThemeDocument packRenditionsError:](v17, "packRenditionsError:", &v33);
    objc_msgSend(-[TDPersistentDocument managedObjectContext](v17, "managedObjectContext"), "save:", &v34);
    if (v34)
      goto LABEL_17;
    v18 = v33;
    if (!v33)
      goto LABEL_17;
    goto LABEL_15;
  }
  if (-[__CFString isEqualToString:](CoreThemeDefinitionErrorDomain[0], "isEqualToString:", objc_msgSend(v34, "domain"))&& objc_msgSend(v34, "code") == 101)
  {
    v32 = 0;
    v16 = +[CoreThemeDocument migrateDocumentAtURL:ofType:error:](CoreThemeDocument, "migrateDocumentAtURL:ofType:error:", v16, v11, &v32);
    v19 = v16;
    if (v16)
    {
      v17 = -[CoreThemeDocument initWithContentsOfURL:ofType:error:]([CoreThemeDocument alloc], "initWithContentsOfURL:ofType:error:", v16, v11, &v32);
      if (v17)
      {
        -[CoreThemeDocument setPathToRepresentedDocument:](v17, "setPathToRepresentedDocument:", objc_msgSend(a3, "path"));
        -[CoreThemeDocument setMinimumDeploymentVersion:](v17, "setMinimumDeploymentVersion:", -[TDDistillRunner minDeploymentTarget](self, "minDeploymentTarget"));
        if (-[TDDistillRunner packImagesInDocument](self, "packImagesInDocument"))
        {
          -[CoreThemeDocument packRenditionsError:](v17, "packRenditionsError:", &v33);
          objc_msgSend(-[TDPersistentDocument managedObjectContext](v17, "managedObjectContext"), "save:", &v34);
        }
      }
      v18 = v33;
LABEL_15:
      v34 = v18;
      goto LABEL_17;
    }
    v17 = 0;
  }
  else
  {
    v17 = 0;
    v34 = 0;
  }
LABEL_17:
  v20 = v17;
  v21 = v34;
  if (!v17 || v34)
  {
    if (!v17)
    {
      -[TDLogger logErrorWithFormat:](-[TDDistillRunner logger](self, "logger"), "logErrorWithFormat:", CFSTR("Unable to open theme definition file %@."), objc_msgSend(a3, "path"));
      v21 = v34;
    }
    if (v21)
    {
      v23 = -[TDDistillRunner logger](self, "logger");
      -[TDLogger logErrorWithFormat:](v23, "logErrorWithFormat:", CFSTR("Error: %@\n"), objc_msgSend(v34, "localizedDescription"));
      v24 = (void *)objc_msgSend(v34, "userInfo");
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __87__TDDistillRunner_runDistillWithDocumentURL_outputURL_attemptIncremental_forceDistill___block_invoke;
      v31[3] = &unk_24EF2C790;
      v31[4] = self;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v31);
    }
  }
  else
  {
    +[CoreThemeDocument _addThemeDocument:](CoreThemeDocument, "_addThemeDocument:", v17);
    if (!a6 && -[TDDistillRunner _isDistillUnnecessaryForDocument:](self, "_isDistillUnnecessaryForDocument:", v17))
    {
      -[TDLogger logInfoWithFormat:](-[TDDistillRunner logger](self, "logger"), "logInfoWithFormat:", CFSTR("No changes to distill."));

      return 1;
    }
    v25 = -[TDDistillRunner carScratchURL](self, "carScratchURL");
    v26 = v25;
    if (v7)
      v25 = a4;
    v27 = objc_msgSend(v25, "path");

    self->_distiller = 0;
    v28 = -[TDDistiller initWithDocument:outputPath:attemptIncremental:]([TDDistiller alloc], "initWithDocument:outputPath:attemptIncremental:", v17, v27, v7);
    self->_distiller = v28;
    if (!v28 && v7)
    {
      v28 = -[TDDistiller initWithDocument:outputPath:attemptIncremental:]([TDDistiller alloc], "initWithDocument:outputPath:attemptIncremental:", v17, objc_msgSend(v26, "path"), 0);
      self->_distiller = v28;
    }
    if (v28)
    {
      -[TDDistiller setDontPackRenditionsBeforeDistilling:](v28, "setDontPackRenditionsBeforeDistilling:", 1);
      -[TDDistiller setAssetStoreVersionNumber:](self->_distiller, "setAssetStoreVersionNumber:", -[TDDistillRunner assetStoreVersionNumber](self, "assetStoreVersionNumber"));
      -[TDDistiller setAssetStoreVersionString:](self->_distiller, "setAssetStoreVersionString:", -[TDDistillRunner assetStoreVersionString](self, "assetStoreVersionString"));
      -[TDDistiller setLogger:](self->_distiller, "setLogger:", -[TDDistillRunner logger](self, "logger"));
      distiller = self->_distiller;
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __87__TDDistillRunner_runDistillWithDocumentURL_outputURL_attemptIncremental_forceDistill___block_invoke_2;
      v30[3] = &unk_24EF2C7B8;
      v30[4] = self;
      v30[5] = a3;
      v30[6] = v16;
      v30[7] = v17;
      -[TDDistiller saveAndDistillWithCompletionHandler:](distiller, "saveAndDistillWithCompletionHandler:", v30);
      -[TDDistiller waitUntilFinished](self->_distiller, "waitUntilFinished");

      return -[TDDistiller isSuccessful](self->_distiller, "isSuccessful");
    }
    -[TDLogger logErrorWithFormat:](-[TDDistillRunner logger](self, "logger"), "logErrorWithFormat:", CFSTR("Error:  Aborting distillation"));
  }

  return 0;
}

uint64_t __87__TDDistillRunner_runDistillWithDocumentURL_outputURL_attemptIncremental_forceDistill___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "logger"), "logErrorWithFormat:", CFSTR("%@ = %@"), a2, a3);
}

uint64_t __87__TDDistillRunner_runDistillWithDocumentURL_outputURL_attemptIncremental_forceDistill___block_invoke_2(id *a1, int a2, void *a3)
{
  char v6;
  uint64_t result;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v6 = objc_msgSend(*((id *)a1[4] + 2), "isIncremental");
  if (a2)
  {
    if ((v6 & 1) == 0)
      objc_msgSend(a1[4], "_moveScratchToOutputPath");
  }
  else
  {
    if ((v6 & 1) == 0)
      objc_msgSend(a1[4], "_removeScratchPath");
    objc_msgSend((id)objc_msgSend(a1[4], "logger"), "logErrorWithFormat:", CFSTR("Failed to distill document '%@'"), objc_msgSend(a1[5], "path"));
    objc_msgSend((id)objc_msgSend(a1[4], "logger"), "logError:", objc_msgSend(a3, "localizedDescription"));
  }
  result = objc_msgSend((id)objc_msgSend(a1[6], "lastPathComponent"), "hasPrefix:", CFSTR("CoreThemeDefinitionMigration"));
  if ((_DWORD)result)
  {
    v12 = 0;
    objc_msgSend(a1[7], "close");

    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtURL:error:", a1[6], &v12);
    v9 = (void *)objc_msgSend(a1[4], "logger");
    v10 = objc_msgSend(a1[6], "path");
    if (v8)
    {
      return objc_msgSend(v9, "logInfoWithFormat:", CFSTR("Removed temporary migration file at path: %@"), v10);
    }
    else
    {
      objc_msgSend(v9, "logErrorWithFormat:", CFSTR("Failed to remove temporary migration file at path: %@"), v10);
      v11 = (void *)objc_msgSend(a1[4], "logger");
      return objc_msgSend(v11, "logError:", objc_msgSend(v12, "localizedDescription"));
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TDDistillRunner;
  -[TDDistillRunner dealloc](&v3, sel_dealloc);
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TDLogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)assetStoreVersionString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAssetStoreVersionString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (int64_t)assetStoreVersionNumber
{
  return self->_assetStoreVersionNumber;
}

- (void)setAssetStoreVersionNumber:(int64_t)a3
{
  self->_assetStoreVersionNumber = a3;
}

- (NSString)minDeploymentTarget
{
  return self->_minDeploymentTarget;
}

- (void)setMinDeploymentTarget:(id)a3
{
  self->_minDeploymentTarget = (NSString *)a3;
}

@end
