@implementation BWCMPhotoEncoderManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWCMPhotoEncoderManager)initWithDeferredPhotoProcessorEnabled:(BOOL)a3
{
  _BOOL4 v3;
  BWCMPhotoEncoderManager *v4;
  BWCMPhotoEncoderManager *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;
  CFTypeRef cf;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v3 = a3;
  v21[2] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)BWCMPhotoEncoderManager;
  cf = 0;
  v4 = -[BWCMPhotoEncoderManager init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_asyncEncoding = 1;
    v6 = *MEMORY[0x1E0D09470];
    v20[0] = *MEMORY[0x1E0D09480];
    v20[1] = v6;
    v21[0] = MEMORY[0x1E0C9AAB0];
    v21[1] = MEMORY[0x1E0C9AAB0];
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    v8 = v7;
    if (v3)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E49FB0B8, *MEMORY[0x1E0D09468]);
    v9 = FigCapturePlatformIOSurfaceWiringAssertionEnabled() != 0;
    v18[0] = *MEMORY[0x1E0D09638];
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v18[1] = *MEMORY[0x1E0D09630];
    v19[0] = v10;
    v19[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
    v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = *MEMORY[0x1E0D09660];
    v16[0] = *MEMORY[0x1E0D09668];
    v16[1] = v12;
    v17[0] = v11;
    v17[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    if (!CMPhotoSurfacePoolCreate())
      objc_msgSend(v8, "setObject:forKeyedSubscript:", cf, *MEMORY[0x1E0D09478]);
    if (CMPhotoCompressionSessionCreate())
    {

      v5 = 0;
    }
  }
  if (cf)
    CFRelease(cf);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_photoCompressionSession)
  {
    CMPhotoCompressionSessionReleaseHardwareResources();
    CMPhotoCompressionSessionFlushCachedBuffers();
    CMPhotoCompressionSessionInvalidate();
    CFRelease(self->_photoCompressionSession);
  }
  v3.receiver = self;
  v3.super_class = (Class)BWCMPhotoEncoderManager;
  -[BWCMPhotoEncoderManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  CMPhotoCompressionSession *photoCompressionSession;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  photoCompressionSession = self->_photoCompressionSession;
  if (-[BWCMPhotoEncoderManager isContainerOpen](self, "isContainerOpen"))
    v6 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (open for captureID:%lld)"), self->_currentSettingsID);
  else
    v6 = &stru_1E4928818;
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: CMPhotoCompressionSession: %p%@"), v4, self, photoCompressionSession, v6);
}

- (BOOL)isContainerOpen
{
  return CMPhotoCompressionSessionIsContainerOpen() == 1;
}

- (int)openExistingContainer:(__IOSurface *)a3 options:(id)a4
{
  return CMPhotoCompressionSessionOpenExistingContainer();
}

- (int)openContainerWithOptions:(id)a3 settingsID:(int64_t)a4
{
  int v7;

  v7 = CMPhotoCompressionSessionOpenEmptyContainer();
  if (!v7)
    self->_currentSettingsID = a4;
  self->_containerFormat = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D09318]), "intValue");
  return v7;
}

- (int)addMainImage:(__CVBuffer *)a3 metadata:(id)a4 options:(id)a5 imageHandleOut:(int64_t *)a6
{
  if (self->_asyncEncoding)
    return CMPhotoCompressionSessionAddImageAsync();
  else
    return CMPhotoCompressionSessionAddImage();
}

- (int)addThumbnailImage:(__CVBuffer *)a3 options:(id)a4 parentImageHandle:(int64_t)a5
{
  if (self->_asyncEncoding)
    return CMPhotoCompressionSessionAddThumbnailAsync();
  else
    return CMPhotoCompressionSessionAddThumbnail();
}

- (int)addCompressedThumbnailImage:(__IOSurface *)a3 thumbnailImageSize:(unint64_t)a4 options:(id)a5
{
  return -12782;
}

- (unint64_t)thumbnailImageSize
{
  return 0;
}

- (int)addAuxImage:(__CVBuffer *)a3 type:(int)a4 auxImageMetadata:(CGImageMetadata *)a5 options:(id)a6 parentImageHandle:(int64_t)a7 auxImageHandleOut:(int64_t *)a8
{
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;

  v12 = pem_cmPhotoAuxImageTypeForPhotoEncoderNodeAuxImageType(a4);
  if (v12 == 4)
  {
    v14 = pem_cmPhotoAuxImageCustomTypeURNForPhotoEncoderNodeAuxImageType(a4);
    if (v14)
    {
      v15 = v14;
      v16 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a6);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D09358]);
    }
  }
  else if (!v12)
  {
    return -12780;
  }
  if (self->_asyncEncoding)
    v17 = CMPhotoCompressionSessionAddAuxiliaryImageAsync();
  else
    v17 = CMPhotoCompressionSessionAddAuxiliaryImage();
  v13 = v17;
  if (v17)
  {
    FigDebugAssert3();
  }
  else
  {
    v13 = 0;
    if (a8)
      *a8 = 0;
  }
  return v13;
}

- (int)addAuxImageMetadata:(CGImageMetadata *)a3 type:(int)a4 auxImageHandle:(int64_t)a5 options:(id)a6 parentImageHandle:(int64_t)a7
{
  int v7;

  if (!pem_cmPhotoAuxImageTypeForPhotoEncoderNodeAuxImageType(a4))
    return -12780;
  v7 = CMPhotoCompressionSessionAddAuxiliaryImageMetadata();
  if (v7)
    FigDebugAssert3();
  return v7;
}

- (int)addAlternateImageWithDerivedImageHandles:(id)a3 options:(id)a4 parentImageHandle:(int64_t)a5 alternateGroupHandleInOut:(int64_t *)a6
{
  int v9;
  int v10;
  int v11;
  int v12;

  if (a6)
  {
    if (*a6 != -1)
      goto LABEL_6;
    v9 = CMPhotoCompressionSessionAddGroup();
    if (!v9)
    {
      *a6 = -1;
      goto LABEL_6;
    }
LABEL_18:
    v11 = v9;
    goto LABEL_19;
  }
  v9 = CMPhotoCompressionSessionAddGroup();
  if (v9)
    goto LABEL_18;
LABEL_6:
  if (!objc_msgSend(a3, "count"))
    return 0;
  if (self->_asyncEncoding)
    v10 = CMPhotoCompressionSessionAddImageAsync();
  else
    v10 = CMPhotoCompressionSessionAddImage();
  v11 = v10;
  if (v10)
  {
LABEL_19:
    FigDebugAssert3();
    return v11;
  }
  v12 = CMPhotoCompressionSessionAddImageHandleToGroup();
  if (v12)
  {
    v11 = v12;
    goto LABEL_19;
  }
  v11 = CMPhotoCompressionSessionAddImageHandleToGroup();
  if (v11)
    goto LABEL_19;
  return v11;
}

- (unint64_t)auxiliaryImagesSize
{
  return 0;
}

- (int)addMetadata:(id)a3 parentImageHandle:(int64_t)a4
{
  return CMPhotoCompressionSessionAddMetadataFromImageProperties();
}

- (int)addCustomMetadataContents:(id)a3 URI:(id)a4 name:(id)a5
{
  int v5;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v5 = 0;
  v12[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        v8 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:");
        objc_msgSend(0, "code");
        v9 = *MEMORY[0x1E0D094A0];
        v11[0] = *MEMORY[0x1E0D09490];
        v11[1] = v9;
        v12[0] = v8;
        v12[1] = a4;
        v11[2] = *MEMORY[0x1E0D09498];
        v12[2] = a5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
        v5 = CMPhotoCompressionSessionAddCustomMetadata();
        if (v5)
          FigDebugAssert3();
      }
    }
  }
  return v5;
}

- (int)tagStereoPairGroupWithStereoPhotoImageHandles:(id *)a3 groupMetadata:(id)a4
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v4 = CMPhotoCompressionSessionAddGroup();
  if (v4)
  {
    v8 = v4;
    goto LABEL_11;
  }
  v5 = CMPhotoCompressionSessionAddImageHandleToGroup();
  if (v5)
  {
    v8 = v5;
    goto LABEL_11;
  }
  v6 = CMPhotoCompressionSessionAddImageHandleToGroup();
  if (v6)
  {
    v8 = v6;
    goto LABEL_11;
  }
  v7 = CMPhotoCompressionSessionAddImageHandleToGroup();
  if (v7)
  {
    v8 = v7;
    goto LABEL_11;
  }
  v8 = CMPhotoCompressionSessionAddGroupProperties();
  if (v8)
LABEL_11:
    FigDebugAssert3();
  return v8;
}

- (int)closeContainerAndCopySurfaceOut:(__IOSurface *)a3
{
  int v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v7;

  if (a3)
  {
    v4 = CMPhotoCompressionSessionCloseContainerAndCopyBacking();
    if (!v4)
    {
      v7 = -12780;
      goto LABEL_4;
    }
    v7 = v4;
  }
  else
  {
    v7 = -12780;
  }
  -[BWCMPhotoEncoderManager closeContainer](self, "closeContainer");
LABEL_4:
  if (dword_1EE6BE878)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_currentSettingsID = 0;
  return v7;
}

- (int)closeContainer
{
  int v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = CMPhotoCompressionSessionCloseContainer();
  if (dword_1EE6BE878)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_currentSettingsID = 0;
  self->_containerSize = 0;
  return v3;
}

- (unint64_t)containerSize
{
  return self->_containerSize;
}

@end
