@implementation HFCameraVideoDownloadOperation

- (HFCameraVideoDownloadOperation)init
{
  HFCameraVideoDownloadOperation *v2;
  HFCameraAnalyticsCameraTimelapseLoadEvent *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFCameraVideoDownloadOperation;
  v2 = -[NSBlockOperation init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HFCameraAnalyticsCameraTimelapseLoadEvent);
    -[HFCameraVideoDownloadOperation setTimelapseLoadEvent:](v2, "setTimelapseLoadEvent:", v3);

  }
  return v2;
}

- (BOOL)fileAlreadyExists
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraVideoDownloadOperation destinationURL](self, "destinationURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  return v6;
}

+ (id)downloadOperationForClip:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setClip:", v4);
  +[HFCameraUtilities videoDestinationURLForCameraClip:](HFCameraUtilities, "videoDestinationURLForCameraClip:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDestinationURL:", v6);

  objc_initWeak(&location, v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__HFCameraVideoDownloadOperation_downloadOperationForClip___block_invoke;
  v8[3] = &unk_1EA728AE8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "addExecutionBlock:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v5;
}

void __59__HFCameraVideoDownloadOperation_downloadOperationForClip___block_invoke(uint64_t a1)
{
  void (**v1)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "fileAlreadyExists"))
  {
    objc_msgSend(WeakRetained, "fileDownloadNotNeeded");
  }
  else
  {
    objc_msgSend(WeakRetained, "downloadBlock");
    v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v1[2]();

  }
}

- (void)fileDownloadNotNeeded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x1DuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    -[HFCameraVideoDownloadOperation clip](self, "clip");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_prettyDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315394;
    v16 = "-[HFCameraVideoDownloadOperation fileDownloadNotNeeded]";
    v17 = 2112;
    v18 = v14;
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v15, 0x16u);

  }
  -[HFCameraVideoDownloadOperation clip](self, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "quality");

  if (v5 == 1)
  {
    -[HFCameraVideoDownloadOperation timelapseLoadEvent](self, "timelapseLoadEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "sendEventForState:", 1);

  }
  -[HFCameraVideoDownloadOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[HFCameraVideoDownloadOperation delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraVideoDownloadOperation clip](self, "clip");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraVideoDownloadOperation destinationURL](self, "destinationURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "foundVideoFileForClip:atURL:", v11, v12);

  }
}

- (void)fileDownloadFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x1DuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    -[HFCameraVideoDownloadOperation clip](self, "clip");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hf_prettyDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315650;
    v17 = "-[HFCameraVideoDownloadOperation fileDownloadFailedWithError:]";
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v15;
    _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "%s %@ fetching clip: %@", (uint8_t *)&v16, 0x20u);

  }
  -[HFCameraVideoDownloadOperation clip](self, "clip");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "quality");

  if (v7 == 1)
  {
    -[HFCameraVideoDownloadOperation timelapseLoadEvent](self, "timelapseLoadEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "sendEventForState:", 0);

  }
  -[HFCameraVideoDownloadOperation delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[HFCameraVideoDownloadOperation delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraVideoDownloadOperation clip](self, "clip");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "failedToDownloadVideoFileForClip:", v13);

  }
}

- (void)fileDownloadFinishedWithElapsedTime:(double)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x1DuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraVideoDownloadOperation clip](self, "clip");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraVideoDownloadOperation clip](self, "clip");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "duration");
    v19 = 136315906;
    v20 = "-[HFCameraVideoDownloadOperation fileDownloadFinishedWithElapsedTime:]";
    v21 = 2112;
    v22 = v7;
    v23 = 2048;
    v24 = v9;
    v25 = 2048;
    v26 = a3;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%s %@; duration: %.2f in %.2f", (uint8_t *)&v19, 0x2Au);

  }
  -[HFCameraVideoDownloadOperation clip](self, "clip");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "quality");

  if (v11 == 1)
  {
    -[HFCameraVideoDownloadOperation timelapseLoadEvent](self, "timelapseLoadEvent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "sendEventForState:", 2);

  }
  -[HFCameraVideoDownloadOperation delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[HFCameraVideoDownloadOperation delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraVideoDownloadOperation clip](self, "clip");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraVideoDownloadOperation destinationURL](self, "destinationURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didDownloadVideoFileForClip:toURL:", v17, v18);

  }
}

- (void)fileDownloadProgress:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x1DuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraVideoDownloadOperation clip](self, "clip");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[HFCameraVideoDownloadOperation fileDownloadProgress:]";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%s %@; download progress: %@", (uint8_t *)&v13, 0x20u);

  }
  -[HFCameraVideoDownloadOperation delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[HFCameraVideoDownloadOperation delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraVideoDownloadOperation clip](self, "clip");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "downloadProgress:forClip:", a3, v12);

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCameraVideoDownloadOperation clip](self, "clip");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("clipUUID"));

  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFCameraVideoDownloadOperation isFinished](self, "isFinished"), CFSTR("isFinished"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFCameraVideoDownloadOperation isCancelled](self, "isCancelled"), CFSTR("isCancelled"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFCameraVideoDownloadOperation isExecuting](self, "isExecuting"), CFSTR("isExecuting"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HFCameraVideoDownloaderDelegate)delegate
{
  return (HFCameraVideoDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)downloadBlock
{
  return self->_downloadBlock;
}

- (void)setDownloadBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (HMCameraClip)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
  objc_storeStrong((id *)&self->_clip, a3);
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (void)setDestinationURL:(id)a3
{
  objc_storeStrong((id *)&self->_destinationURL, a3);
}

- (void)setFileAlreadyExists:(BOOL)a3
{
  self->_fileAlreadyExists = a3;
}

- (HFCameraAnalyticsCameraTimelapseLoadEvent)timelapseLoadEvent
{
  return self->_timelapseLoadEvent;
}

- (void)setTimelapseLoadEvent:(id)a3
{
  objc_storeStrong((id *)&self->_timelapseLoadEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelapseLoadEvent, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_clip, 0);
  objc_storeStrong(&self->_downloadBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
