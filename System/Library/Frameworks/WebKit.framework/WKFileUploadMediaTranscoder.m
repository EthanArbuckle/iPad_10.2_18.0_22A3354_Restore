@implementation WKFileUploadMediaTranscoder

- (WKFileUploadMediaTranscoder)initWithItems:(id)a3 videoCount:(unint64_t)a4 completionHandler:(void *)a5
{
  WKFileUploadMediaTranscoder *v8;
  void *m_ptr;
  void *v10;
  void *value;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WKFileUploadMediaTranscoder;
  v8 = -[WKFileUploadMediaTranscoder init](&v13, sel_init);
  if (v8)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v8->_items.m_ptr;
    v8->_items.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    v8->_processedVideoCount = 0;
    v10 = *(void **)a5;
    *(_QWORD *)a5 = 0;
    value = v8->_completionHandler.m_callableWrapper.__ptr_.__value_;
    v8->_completionHandler.m_callableWrapper.__ptr_.__value_ = v10;
    v8->_videoCount = a4;
    if (value)
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  }
  return v8;
}

- (void)start
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[3], "cancelExport");
    objc_msgSend(v2, "_dismissProgress");
    CFRelease(v2);
  }
}

- (void)_processItemAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  id v12;
  void *v13;
  void *m_ptr;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  id to;
  unint64_t v20;

  if ((objc_msgSend(self->_progressController.m_ptr, "isCancelled") & 1) != 0)
    return;
  if (objc_msgSend(self->_items.m_ptr, "count") <= a3)
    goto LABEL_12;
  v5 = (void *)objc_msgSend(self->_items.m_ptr, "objectAtIndex:", a3);
  if ((objc_msgSend(v5, "isVideo") & 1) == 0)
  {
    while (++a3 != objc_msgSend(self->_items.m_ptr, "count"))
    {
      v5 = (void *)objc_msgSend(self->_items.m_ptr, "objectAtIndex:", a3);
      if (objc_msgSend(v5, "isVideo"))
        goto LABEL_7;
    }
    goto LABEL_12;
  }
LABEL_7:
  v6 = -[WKFileUploadMediaTranscoder _temporaryDirectoryCreateIfNecessary](self, "_temporaryDirectoryCreateIfNecessary");
  if (!v6)
  {
LABEL_12:
    -[WKFileUploadMediaTranscoder _finishedProcessing](self, "_finishedProcessing");
    return;
  }
  v7 = v6;
  v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "fileURL"), "lastPathComponent"), "stringByDeletingPathExtension");
  v9 = objc_msgSend(v7, "stringByAppendingPathComponent:", objc_msgSend(v8, "stringByAppendingPathExtension:", objc_msgSend((id)objc_msgSend((id)*MEMORY[0x1E0CEC5B0], "preferredFilenameExtension"), "uppercaseString")));
  v10 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
  v11 = (const void *)objc_msgSend(objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E0DCDF58])()), "initWithURL:options:", objc_msgSend(v5, "fileURL"), 0);
  v12 = objc_alloc((Class)((uint64_t (*)(void))*MEMORY[0x1E0DCE0A0])());
  v13 = (void *)objc_msgSend(v12, "initWithAsset:presetName:", v11, PAL::get_AVFoundation_AVAssetExportPresetHighestQuality((PAL *)v12));
  m_ptr = self->_exportSession.m_ptr;
  self->_exportSession.m_ptr = v13;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v13 = self->_exportSession.m_ptr;
  }
  objc_msgSend(self->_exportSession.m_ptr, "setOutputFileType:", PAL::get_AVFoundation_AVFileTypeQuickTimeMovie((PAL *)objc_msgSend(v13, "setOutputURL:", v10)));
  v15 = self->_exportSession.m_ptr;
  v17 = 0;
  objc_initWeak(&v17, self);
  v18 = a3;
  to = 0;
  objc_moveWeak(&to, &v17);
  v20 = v18;
  v16 = malloc_type_malloc(0x30uLL, 0x10E004088CBC95FuLL);
  *(_QWORD *)v16 = MEMORY[0x1E0C809A0];
  *((_QWORD *)v16 + 1) = 50331650;
  *((_QWORD *)v16 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKFileUploadMediaTranscoder _processItemAtIndex:]::$_4>(-[WKFileUploadMediaTranscoder _processItemAtIndex:]::$_4)::{lambda(void *)#1}::__invoke;
  *((_QWORD *)v16 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKFileUploadMediaTranscoder _processItemAtIndex:]::$_4>(-[WKFileUploadMediaTranscoder _processItemAtIndex:]::$_4)::descriptor;
  *((_QWORD *)v16 + 4) = 0;
  objc_moveWeak((id *)v16 + 4, &to);
  *((_QWORD *)v16 + 5) = v20;
  objc_destroyWeak(&to);
  objc_msgSend(v15, "exportAsynchronouslyWithCompletionHandler:", v16);
  _Block_release(v16);
  objc_destroyWeak(&v17);
  if (v11)
    CFRelease(v11);
}

- (void)_finishedProcessing
{
  void *value;

  -[WKFileUploadMediaTranscoder _dismissProgress](self, "_dismissProgress");
  value = self->_completionHandler.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
  {
    (*(void (**)(void *, void *))(*(_QWORD *)value + 16))(value, self->_items.m_ptr);
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  }
}

- (void)_dismissProgress
{
  objc_msgSend(self->_progressTimer.m_ptr, "invalidate");
  objc_msgSend(self->_progressController.m_ptr, "hideAnimated:allowDelay:", 0, 0);
}

- (void)_updateProgress:(id)a3
{
  float v4;

  objc_msgSend(self->_exportSession.m_ptr, "progress", a3);
  objc_msgSend(self->_progressController.m_ptr, "setFractionCompleted:", (float)((float)(v4 + (float)self->_processedVideoCount) / (float)self->_videoCount));
}

- (id)_temporaryDirectoryCreateIfNecessary
{
  void *TemporaryDirectory;
  void *v5;
  void *m_ptr;
  char v8;

  if (self->_temporaryDirectoryPath.m_ptr)
  {
    v8 = 0;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:isDirectory:", self->_temporaryDirectoryPath.m_ptr, &v8)&& v8 != 0)
    {
      return self->_temporaryDirectoryPath.m_ptr;
    }
  }
  TemporaryDirectory = (void *)WTF::FileSystemImpl::createTemporaryDirectory((WTF::FileSystemImpl *)CFSTR("WKVideoUpload"), (NSString *)a2);
  v5 = TemporaryDirectory;
  if (TemporaryDirectory)
    CFRetain(TemporaryDirectory);
  m_ptr = self->_temporaryDirectoryPath.m_ptr;
  self->_temporaryDirectoryPath.m_ptr = v5;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    return self->_temporaryDirectoryPath.m_ptr;
  }
  return v5;
}

- (void).cxx_destruct
{
  void *value;
  void *m_ptr;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  value = self->_completionHandler.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *, SEL))(*(_QWORD *)value + 8))(value, a2);
  m_ptr = self->_temporaryDirectoryPath.m_ptr;
  self->_temporaryDirectoryPath.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v5 = self->_items.m_ptr;
  self->_items.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_exportSession.m_ptr;
  self->_exportSession.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->_progressController.m_ptr;
  self->_progressController.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  v8 = self->_progressTimer.m_ptr;
  self->_progressTimer.m_ptr = 0;
  if (v8)
    CFRelease(v8);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)_processItemAtIndex:
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 8));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v4 = objc_msgSend(WeakRetained[3], "status");
    if (v4 == 3)
    {
      objc_msgSend((id)objc_msgSend(v3[4], "objectAtIndex:", *(_QWORD *)(a1 + 16)), "setFileURL:", objc_msgSend(v3[3], "outputURL"));
    }
    else if (v4 == 5)
    {
LABEL_10:
      CFRelease(v3);
      return;
    }
    v5 = v3[3];
    v3[3] = 0;
    if (v5)
      CFRelease(v5);
    v3[8] = (char *)v3[8] + 1;
    objc_msgSend(v3, "_processItemAtIndex:", *(_QWORD *)(a1 + 16) + 1);
    goto LABEL_10;
  }
}

- (uint64_t)_processItemAtIndex:
{
  void *v2;

  *a1 = off_1E34CED80;
  objc_destroyWeak(a1 + 1);
  return WTF::fastFree((WTF *)a1, v2);
}

@end
