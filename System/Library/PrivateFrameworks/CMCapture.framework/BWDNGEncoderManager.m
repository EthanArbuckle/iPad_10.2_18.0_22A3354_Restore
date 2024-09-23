@implementation BWDNGEncoderManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  objc_super v3;

  if (-[BWDNGEncoderManager isContainerOpen](self, "isContainerOpen"))
    -[BWDNGEncoderManager closeContainer](self, "closeContainer");
  v3.receiver = self;
  v3.super_class = (Class)BWDNGEncoderManager;
  -[BWDNGEncoderManager dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  CMPhotoDNGCompressor *dngCompressor;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  dngCompressor = self->_dngCompressor;
  if (-[BWDNGEncoderManager isContainerOpen](self, "isContainerOpen"))
    v6 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (open for captureID:%lld)"), self->_currentSettingsID);
  else
    v6 = &stru_1E4928818;
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: CMPhotoDNGCompressor: %p%@"), v4, self, dngCompressor, v6);
}

- (BOOL)isContainerOpen
{
  return self->_dngCompressor != 0;
}

- (int)openContainerWithOptions:(id)a3 settingsID:(int64_t)a4
{
  int result;

  if (!-[BWDNGEncoderManager isContainerOpen](self, "isContainerOpen")
    || (result = -[BWDNGEncoderManager closeContainer](self, "closeContainer")) == 0)
  {
    result = CMPhotoDNGCompressorCreate();
    if (!result)
    {
      self->_currentSettingsID = a4;
      self->_previewImageSize = 0;
      self->_auxiliaryImagesSize = 0;
      self->_containerSize = 0;
    }
  }
  return result;
}

- (int)openExistingContainer:(__IOSurface *)a3 options:(id)a4
{
  return -12788;
}

- (int)addMainImage:(__CVBuffer *)a3 metadata:(id)a4 options:(id)a5 imageHandleOut:(int64_t *)a6
{
  return CMPhotoDNGCompressorSetMainImage();
}

- (int)addThumbnailImage:(__CVBuffer *)a3 options:(id)a4 parentImageHandle:(int64_t)a5
{
  return CMPhotoDNGCompressorSetPreviewImage();
}

- (int)addCompressedThumbnailImage:(__IOSurface *)a3 thumbnailImageSize:(unint64_t)a4 options:(id)a5
{
  void *v6;
  uint64_t v7;

  if (a3 && a4)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a5);
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D094C8]);
    CMPhotoDNGCompressorSetCompressedPreviewImage();
  }
  return 0;
}

- (unint64_t)thumbnailImageSize
{
  return self->_previewImageSize;
}

- (int)addAuxImage:(__CVBuffer *)a3 type:(int)a4 auxImageMetadata:(CGImageMetadata *)a5 options:(id)a6 parentImageHandle:(int64_t)a7 auxImageHandleOut:(int64_t *)a8
{
  if (pem_cmPhotoAuxImageCustomTypeURNForPhotoEncoderNodeAuxImageType(a4))
    return CMPhotoDNGCompressorAddAuxiliaryImage();
  else
    return -12780;
}

- (int)addAuxImageMetadata:(CGImageMetadata *)a3 type:(int)a4 auxImageHandle:(int64_t)a5 options:(id)a6 parentImageHandle:(int64_t)a7
{
  return -12782;
}

- (int)addAlternateImageWithDerivedImageHandles:(id)a3 options:(id)a4 parentImageHandle:(int64_t)a5 alternateGroupHandleInOut:(int64_t *)a6
{
  return -12782;
}

- (unint64_t)auxiliaryImagesSize
{
  return self->_auxiliaryImagesSize;
}

- (int)addMetadata:(id)a3 parentImageHandle:(int64_t)a4
{
  return -12782;
}

- (int)addCustomMetadataContents:(id)a3 URI:(id)a4 name:(id)a5
{
  return -12782;
}

- (int)tagStereoPairGroupWithStereoPhotoImageHandles:(id *)a3 groupMetadata:(id)a4
{
  return -12782;
}

- (int)closeContainerAndCopySurfaceOut:(__IOSurface *)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  int FinalizedSize;
  int Surface;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMPhotoDNGCompressor *dngCompressor;

  v5 = -[BWDNGEncoderManager isContainerOpen](self, "isContainerOpen");
  v6 = v5;
  FinalizedSize = -12780;
  if (a3 && v5)
  {
    Surface = CMPhotoDNGCompressorFinalizeAndCreateSurface();
    if (Surface)
    {
      FinalizedSize = Surface;
    }
    else
    {
      FinalizedSize = CMPhotoDNGCompressorGetFinalizedSize();
      if (!FinalizedSize)
      {
        IOSurfaceDecrementUseCount(0);
        *a3 = 0;
        goto LABEL_6;
      }
    }
  }
  if (v6)
    -[BWDNGEncoderManager closeContainer](self, "closeContainer");
LABEL_6:
  if (dword_1EE6BE878)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  self->_currentSettingsID = 0;
  dngCompressor = self->_dngCompressor;
  if (dngCompressor)
  {
    CFRelease(dngCompressor);
    self->_dngCompressor = 0;
  }
  return FinalizedSize;
}

- (int)closeContainer
{
  int Data;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CMPhotoDNGCompressor *dngCompressor;

  if (-[BWDNGEncoderManager isContainerOpen](self, "isContainerOpen"))
  {
    Data = CMPhotoDNGCompressorFinalizeAndCreateData();

  }
  else
  {
    Data = -12780;
  }
  if (dword_1EE6BE878)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(_OWORD *)&self->_currentSettingsID = 0u;
  *(_OWORD *)&self->_auxiliaryImagesSize = 0u;
  dngCompressor = self->_dngCompressor;
  if (dngCompressor)
  {
    CFRelease(dngCompressor);
    self->_dngCompressor = 0;
  }
  return Data;
}

- (unint64_t)containerSize
{
  return self->_containerSize;
}

@end
