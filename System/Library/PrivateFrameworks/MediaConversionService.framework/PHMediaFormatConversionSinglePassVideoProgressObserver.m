@implementation PHMediaFormatConversionSinglePassVideoProgressObserver

- (void)startObservingProgress:(id)a3 forRequest:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSURL *v12;
  NSURL *observedFileURL;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;

  obj = a3;
  v7 = a4;
  if (obj)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversionSinglePassVideoProgressObserver.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("progress"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversionSinglePassVideoProgressObserver.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

LABEL_3:
  objc_msgSend(v7, "singlePassVideoConversionUpdateHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversionSinglePassVideoProgressObserver.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request.singlePassVideoConversionUpdateHandler"));

  }
  objc_msgSend(v7, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHMediaFormatConversionSinglePassVideoProgressObserver.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request.destination.fileURL"));

  }
  objc_storeWeak((id *)&self->_progress, obj);
  objc_storeWeak((id *)&self->_request, v7);
  objc_msgSend(v7, "destination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURL");
  v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
  observedFileURL = self->_observedFileURL;
  self->_observedFileURL = v12;

  objc_msgSend(obj, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 0, &PHMediaFormatConversionSinglePassVideoProgressObserverContext);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id WeakRetained;
  void *v8;
  NSFileHandle *observedFileHandle;
  unint64_t v10;
  NSURL *observedFileURL;
  void *v12;
  char v13;
  NSURL *v14;
  NSFileHandle *v15;
  id v16;
  NSFileHandle *v17;
  NSURL *v18;
  NSURL *v19;
  id v20;
  uint8_t buf[4];
  NSURL *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a6 == &PHMediaFormatConversionSinglePassVideoProgressObserverContext)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_request);
    if (!WeakRetained)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        observedFileURL = self->_observedFileURL;
        *(_DWORD *)buf = 138412290;
        v22 = observedFileURL;
        _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Ignoring progress update for deallocated request for URL %@", buf, 0xCu);
      }
      -[PHMediaFormatConversionSinglePassVideoProgressObserver stopObserving](self, "stopObserving");
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    observedFileHandle = self->_observedFileHandle;
    if (!observedFileHandle)
    {
      -[NSURL path](self->_observedFileURL, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v8, "fileExistsAtPath:", v12);

      if ((v13 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          -[NSURL path](self->_observedFileURL, "path");
          v18 = (NSURL *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v22 = v18;
          _os_log_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Ignoring progress update for output file %@ that doesn't exist", buf, 0xCu);

        }
        goto LABEL_17;
      }
      v14 = self->_observedFileURL;
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v14, &v20);
      v15 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
      v16 = v20;
      if (!v15)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[NSURL path](self->_observedFileURL, "path");
          v19 = (NSURL *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v22 = v19;
          v23 = 2112;
          v24 = v16;
          _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to open file handle for output file %@: %@", buf, 0x16u);

        }
        goto LABEL_17;
      }
      v17 = self->_observedFileHandle;
      self->_observedFileHandle = v15;

      observedFileHandle = self->_observedFileHandle;
    }
    v10 = -[NSFileHandle seekToEndOfFile](observedFileHandle, "seekToEndOfFile");
    if (v10 != self->_lastFileSize)
    {
      self->_lastFileSize = v10;
      objc_msgSend(WeakRetained, "updateSinglePassVideoConversionStatus:addedRange:error:", 2);
    }
LABEL_17:

LABEL_18:
  }
}

- (void)stopObserving
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_progress);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), &PHMediaFormatConversionSinglePassVideoProgressObserverContext);

}

- (NSProgress)progress
{
  return (NSProgress *)objc_loadWeakRetained((id *)&self->_progress);
}

- (void)setProgress:(id)a3
{
  objc_storeWeak((id *)&self->_progress, a3);
}

- (PHMediaFormatConversionRequest)request
{
  return (PHMediaFormatConversionRequest *)objc_loadWeakRetained((id *)&self->_request);
}

- (void)setRequest:(id)a3
{
  objc_storeWeak((id *)&self->_request, a3);
}

- (NSURL)observedFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setObservedFileURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSFileHandle)observedFileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObservedFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)lastFileSize
{
  return self->_lastFileSize;
}

- (void)setLastFileSize:(unint64_t)a3
{
  self->_lastFileSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedFileHandle, 0);
  objc_storeStrong((id *)&self->_observedFileURL, 0);
  objc_destroyWeak((id *)&self->_request);
  objc_destroyWeak((id *)&self->_progress);
}

@end
