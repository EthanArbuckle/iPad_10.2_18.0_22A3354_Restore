@implementation PHMediaFormatConversionDestination

- (unint64_t)length
{
  objc_super v4;

  if (-[PHMediaFormatConversionDestination usesSinglePassVideoConversion](self, "usesSinglePassVideoConversion"))
    return -[PHMediaFormatConversionDestination singlePassVideoConversionTargetLength](self, "singlePassVideoConversionTargetLength");
  v4.receiver = self;
  v4.super_class = (Class)PHMediaFormatConversionDestination;
  return -[PHMediaFormatConversionContent length](&v4, sel_length);
}

- (id)temporaryDirectoryPrefix
{
  return CFSTR("PHMediaFormatConversionRequest");
}

- (void)generateTemporaryOutputFileURLForRequest:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSURL *v11;
  NSURL *temporaryOutputDirectoryURL;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSURL *v20;
  NSURL *temporaryOutputFileURL;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  if ((objc_msgSend(v26, "preflighted") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 590, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request.preflighted"));

  }
  objc_msgSend(v26, "directoryForTemporaryFiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 591, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request.directoryForTemporaryFiles"));

  }
  objc_msgSend(v26, "directoryForTemporaryFiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[PHMediaFormatConversionDestination temporaryDirectoryPrefix](self, "temporaryDirectoryPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@/"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v10, 1);
  v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
  temporaryOutputDirectoryURL = self->_temporaryOutputDirectoryURL;
  self->_temporaryOutputDirectoryURL = v11;

  objc_msgSend(v26, "outputFilename");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if (!objc_msgSend(v13, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 598, CFSTR("Unexpected nil or zero-length requested output filename"));

    }
    v15 = v14;
  }
  else
  {
    objc_msgSend(v26, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "lastPathComponent");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v15, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 603, CFSTR("Unexpected nil or zero-length input filename"));

    }
  }
  if (self->_outputPathExtension)
  {
    objc_msgSend(v15, "stringByDeletingPathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingPathExtension:", self->_outputPathExtension);
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v19;
  }
  -[NSURL URLByAppendingPathComponent:](self->_temporaryOutputDirectoryURL, "URLByAppendingPathComponent:", v15);
  v20 = (NSURL *)objc_claimAutoreleasedReturnValue();
  temporaryOutputFileURL = self->_temporaryOutputFileURL;
  self->_temporaryOutputFileURL = v20;

  objc_storeStrong((id *)&self->super._fileURL, self->_temporaryOutputFileURL);
}

- (BOOL)createTemporaryOutputDirectoryWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!self->_temporaryOutputDirectoryURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 617, CFSTR("You must call generateTemporaryOutputFileURLForRequest before calling %@"), v13);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_temporaryOutputDirectoryURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CB2A98];
  v18[0] = CFSTR("mobile");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, v7, &v14);
  v9 = v14;

  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create format conversion output temporary directory: %@", buf, 0xCu);
      if (!a3)
        goto LABEL_8;
    }
    else if (!a3)
    {
      goto LABEL_8;
    }
    *a3 = objc_retainAutorelease(v9);
    goto LABEL_8;
  }
  objc_storeStrong((id *)&self->_temporaryFilesURLToDelete, self->_temporaryOutputDirectoryURL);
LABEL_8:

  return v8;
}

- (BOOL)createTemporaryOutputFileWithErrorError:(id *)a3
{
  void *v5;
  NSURL *temporaryOutputFileURL;
  char v7;
  id v8;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_temporaryOutputFileURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 635, CFSTR("You must call generateTemporaryOutputFileURLForRequest before calling %@"), v12);

  }
  if (!-[PHMediaFormatConversionDestination createTemporaryOutputDirectoryWithError:](self, "createTemporaryOutputDirectoryWithError:", a3))return 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  temporaryOutputFileURL = self->_temporaryOutputFileURL;
  v13 = 0;
  v7 = objc_msgSend(v5, "writeToURL:options:error:", temporaryOutputFileURL, 0, &v13);
  v8 = v13;

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create format conversion output temporary file: %@", buf, 0xCu);
      if (!a3)
        goto LABEL_8;
      goto LABEL_7;
    }
    if (a3)
LABEL_7:
      *a3 = objc_retainAutorelease(v8);
  }
LABEL_8:

  return v7;
}

- (NSURL)temporaryOutputDirectoryURL
{
  NSURL *temporaryOutputDirectoryURL;
  void *v6;
  void *v7;

  temporaryOutputDirectoryURL = self->_temporaryOutputDirectoryURL;
  if (!temporaryOutputDirectoryURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 655, CFSTR("You must call generateTemporaryOutputFileURLForRequest before calling %@"), v7);

    temporaryOutputDirectoryURL = self->_temporaryOutputDirectoryURL;
  }
  return temporaryOutputDirectoryURL;
}

- (NSURL)temporaryOutputFileURL
{
  NSURL *temporaryOutputFileURL;
  void *v6;
  void *v7;

  temporaryOutputFileURL = self->_temporaryOutputFileURL;
  if (!temporaryOutputFileURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 661, CFSTR("You must call generateTemporaryOutputFileURLForRequest before calling %@"), v7);

    temporaryOutputFileURL = self->_temporaryOutputFileURL;
  }
  return temporaryOutputFileURL;
}

- (void)removeTemporaryFiles
{
  NSURL *temporaryFilesURLToDelete;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  PHMediaFormatConversionDestination *v9;
  NSURL *v10;
  void *v11;
  NSURL *v12;
  int v13;
  PHMediaFormatConversionDestination *v14;
  NSURL *v15;
  NSURL *v16;
  id v17;
  uint8_t buf[4];
  PHMediaFormatConversionDestination *v19;
  __int16 v20;
  _BYTE v21[18];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  temporaryFilesURLToDelete = self->_temporaryFilesURLToDelete;
  if (temporaryFilesURLToDelete)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      v19 = self;
      v20 = 2112;
      *(_QWORD *)v21 = self;
      *(_WORD *)&v21[8] = 2112;
      *(_QWORD *)&v21[10] = temporaryFilesURLToDelete;
      _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Delete temporary output %p %@ %@", buf, 0x20u);
      temporaryFilesURLToDelete = self->_temporaryFilesURLToDelete;
    }
    -[NSURL lastPathComponent](temporaryFilesURLToDelete, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMediaFormatConversionDestination temporaryDirectoryPrefix](self, "temporaryDirectoryPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hasPrefix:", v5);

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("PHMediaFormatConversionKeepTemporaryFiles"));

      if (v8)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          -[NSURL path](self->_temporaryFilesURLToDelete, "path");
          v9 = (PHMediaFormatConversionDestination *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v19 = v9;
          v20 = 2112;
          *(_QWORD *)v21 = CFSTR("PHMediaFormatConversionKeepTemporaryFiles");
          _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Not deleting temporary media conversion files at %{public}@ because the %@ user defaults key is set", buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = self->_temporaryFilesURLToDelete;
        v17 = 0;
        v13 = objc_msgSend(v11, "removeItemAtURL:error:", v12, &v17);
        v14 = (PHMediaFormatConversionDestination *)v17;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v15 = self->_temporaryFilesURLToDelete;
          *(_DWORD *)buf = 138412802;
          v19 = (PHMediaFormatConversionDestination *)v15;
          v20 = 1024;
          *(_DWORD *)v21 = v13;
          *(_WORD *)&v21[4] = 2112;
          *(_QWORD *)&v21[6] = v14;
          _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Deleted temporary output: %@ %d %@", buf, 0x1Cu);
        }
        if ((v13 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v14;
          _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to delete temporary output: %@", buf, 0xCu);
        }

      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = self->_temporaryFilesURLToDelete;
      *(_DWORD *)buf = 138412290;
      v19 = (PHMediaFormatConversionDestination *)v10;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Won't delete temporary output outside of temporary directory: %@", buf, 0xCu);
    }
    v16 = self->_temporaryFilesURLToDelete;
    self->_temporaryFilesURLToDelete = 0;

  }
}

- (void)removeTemporaryFilesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedCleanupQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PHMediaFormatConversionDestination_removeTemporaryFilesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E99537A8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)dealloc
{
  PFVideoExportRangeCoordinator *singlePassVideoExportRangeCoordinator;
  objc_super v4;

  singlePassVideoExportRangeCoordinator = self->_singlePassVideoExportRangeCoordinator;
  if (singlePassVideoExportRangeCoordinator)
    -[PFVideoExportRangeCoordinator cancel](singlePassVideoExportRangeCoordinator, "cancel");
  -[PHMediaFormatConversionDestination removeTemporaryFiles](self, "removeTemporaryFiles");
  v4.receiver = self;
  v4.super_class = (Class)PHMediaFormatConversionDestination;
  -[PHMediaFormatConversionDestination dealloc](&v4, sel_dealloc);
}

- (BOOL)padToLength:(unint64_t)a3 error:(id *)a4
{
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (-[PHMediaFormatConversionDestination length](self, "length") != a3)
  {
    v8 = (void *)MEMORY[0x1E0CB3608];
    -[PHMediaFormatConversionContent fileURL](self, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v8, "fileHandleForUpdatingURL:error:", v9, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;

    if (v10)
    {
      if (-[PHMediaFormatConversionContent isVideo](self, "isVideo"))
      {
        v12 = -[PHMediaFormatConversionDestination padVideoToLength:fileHandle:error:](self, "padVideoToLength:fileHandle:error:", a3, v10, a4);
      }
      else
      {
        if (!-[PHMediaFormatConversionContent isImage](self, "isImage"))
        {
          objc_msgSend(v10, "closeFile");
          v7 = 0;
          goto LABEL_13;
        }
        v12 = -[PHMediaFormatConversionDestination padImageToLength:fileHandle:error:](self, "padImageToLength:fileHandle:error:", a3, v10, a4);
      }
      v7 = v12;
LABEL_13:
      v15 = v11;
      goto LABEL_14;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB3388];
    v21[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 1, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to open image filehandle for padding: %@", buf, 0xCu);
      if (a4)
        goto LABEL_8;
    }
    else if (a4)
    {
LABEL_8:
      v15 = objc_retainAutorelease(v15);
      v7 = 0;
      *a4 = v15;
LABEL_14:

      return v7;
    }
    v7 = 0;
    goto LABEL_14;
  }
  return 1;
}

- (BOOL)padVideoToLength:(unint64_t)a3 fileHandle:(id)a4 error:(id *)a5
{
  id v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v17;

  v8 = a4;
  v9 = -[PHMediaFormatConversionDestination length](self, "length") + 8;
  if (v9 > a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a5)
      *a5 = objc_retainAutorelease(v14);

  }
  else
  {
    v10 = a3 - -[PHMediaFormatConversionDestination length](self, "length");
    v11 = v10 - 8;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = bswap32(v10);
    objc_msgSend(v12, "appendBytes:length:", &v17, 4);
    objc_msgSend(v12, "appendBytes:length:", "free", 4);
    objc_msgSend(v8, "seekToEndOfFile");
    objc_msgSend(v8, "writeData:", v12);
    objc_msgSend(v12, "setLength:", 0);
    if (v10 != 8)
    {
      LODWORD(v13) = 0x80000;
      do
      {
        if (v13 >= v11)
          v13 = v11;
        else
          v13 = v13;
        objc_msgSend(v12, "setLength:", v13);
        objc_msgSend(v8, "writeData:", v12);
        v11 -= v13;
      }
      while (v11);
    }
    self->super._length = a3;

  }
  return v9 <= a3;
}

- (BOOL)padImageToLength:(unint64_t)a3 fileHandle:(id)a4 error:(id *)a5
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = -[PHMediaFormatConversionDestination length](self, "length");
  if (v9 > a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a5)
      *a5 = objc_retainAutorelease(v12);

  }
  else
  {
    v10 = a3 - -[PHMediaFormatConversionDestination length](self, "length");
    objc_msgSend(v8, "seekToEndOfFile");
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v11);

    self->super._length = a3;
  }

  return v9 <= a3;
}

- (void)enableSinglePassVideoConversionWithTargetLength:(unint64_t)a3
{
  PFVideoExportRangeCoordinator *v4;
  PFVideoExportRangeCoordinator *singlePassVideoExportRangeCoordinator;

  self->_singlePassVideoConversionTargetLength = a3;
  v4 = (PFVideoExportRangeCoordinator *)objc_opt_new();
  singlePassVideoExportRangeCoordinator = self->_singlePassVideoExportRangeCoordinator;
  self->_singlePassVideoExportRangeCoordinator = v4;

}

- (BOOL)usesSinglePassVideoConversion
{
  return self->_singlePassVideoExportRangeCoordinator != 0;
}

- (void)addAvailableRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint8_t v6[16];

  length = a3.length;
  location = a3.location;
  if (-[PHMediaFormatConversionDestination usesSinglePassVideoConversion](self, "usesSinglePassVideoConversion"))
  {
    -[PFVideoExportRangeCoordinator updateAvailableRange:](self->_singlePassVideoExportRangeCoordinator, "updateAvailableRange:", 0, location + length);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected nil single pass video conversion range coordinator", v6, 2u);
  }
}

- (BOOL)waitForAvailabilityOfRange:(_NSRange)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  PFVideoExportRangeCoordinator *singlePassVideoExportRangeCoordinator;
  char v12;
  id v13;
  void *v15;
  id v16;

  length = a3.length;
  location = a3.location;
  if (!-[PHMediaFormatConversionDestination usesSinglePassVideoConversion](self, "usesSinglePassVideoConversion"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversion.m"), 810, CFSTR("Unexpected nil single pass video conversion range coordinator"));

  }
  singlePassVideoExportRangeCoordinator = self->_singlePassVideoExportRangeCoordinator;
  v16 = 0;
  v12 = -[PFVideoExportRangeCoordinator waitForAvailabilityOfRange:timeout:error:](singlePassVideoExportRangeCoordinator, "waitForAvailabilityOfRange:timeout:error:", location, length, a4, &v16);
  v13 = v16;
  if (a5 && (v12 & 1) == 0)
  {
    -[PHMediaFormatConversionDestination errorForSinglePassVideoConversionError:](self, "errorForSinglePassVideoConversionError:", v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)errorForSinglePassVideoConversionError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D75A98]);

    if (v6 && (v7 = objc_msgSend(v4, "code"), (unint64_t)(v7 - 3) <= 2))
      v8 = qword_1D51FF728[v7 - 3];
    else
      v8 = 0;
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB3388];
    v14[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PHMediaFormatConversionErrorDomain"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PFVideoExportRangeCoordinator)singlePassVideoExportRangeCoordinator
{
  return (PFVideoExportRangeCoordinator *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSinglePassVideoExportRangeCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)outputPathExtension
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOutputPathExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)singlePassVideoConversionTargetLength
{
  return self->_singlePassVideoConversionTargetLength;
}

- (void)setSinglePassVideoConversionTargetLength:(unint64_t)a3
{
  self->_singlePassVideoConversionTargetLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputPathExtension, 0);
  objc_storeStrong((id *)&self->_singlePassVideoExportRangeCoordinator, 0);
  objc_storeStrong((id *)&self->_temporaryOutputFileURL, 0);
  objc_storeStrong((id *)&self->_temporaryOutputDirectoryURL, 0);
  objc_storeStrong((id *)&self->_temporaryFilesURLToDelete, 0);
}

uint64_t __80__PHMediaFormatConversionDestination_removeTemporaryFilesWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeTemporaryFiles");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)destinationForConversionReturningUnchangedSource:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = (_QWORD *)objc_opt_new();
  objc_msgSend(v3, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFileURL:", v5);

  v6 = objc_msgSend(v3, "length");
  v4[1] = v6;
  return v4;
}

+ (id)sharedCleanupQueue
{
  if (sharedCleanupQueue_onceToken != -1)
    dispatch_once(&sharedCleanupQueue_onceToken, &__block_literal_global_374);
  return (id)sharedCleanupQueue_sharedCleanupQueue;
}

void __56__PHMediaFormatConversionDestination_sharedCleanupQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.photos.mediaformatconversion.destination.cleanup", 0);
  v1 = (void *)sharedCleanupQueue_sharedCleanupQueue;
  sharedCleanupQueue_sharedCleanupQueue = (uint64_t)v0;

}

@end
