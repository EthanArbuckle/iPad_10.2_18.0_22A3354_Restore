@implementation FigCaptureVideoThumbnailSinkConfiguration

- (int)sinkType
{
  return 12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoThumbnailSinkConfiguration;
  -[FigCaptureSinkConfiguration dealloc](&v3, sel_dealloc);
}

- (id)copyXPCEncoding
{
  id v3;
  CFDictionaryRef DictionaryRepresentation;
  NSArray *smartStyles;
  void *v6;
  void *v7;
  xpc_object_t v8;
  const char *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FigCaptureVideoThumbnailSinkConfiguration;
  v3 = -[FigCaptureSinkConfiguration copyXPCEncoding](&v12, sel_copyXPCEncoding);
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(self->_thumbnailSize);
  FigXPCMessageSetCFDictionary();
  if (-[NSArray count](self->_smartStyles, "count"))
  {
    smartStyles = self->_smartStyles;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v6, "encodeObject:forKey:", smartStyles, *MEMORY[0x1E0CB2CD0]);
    v7 = (void *)objc_msgSend(v6, "encodedData");

    v8 = xpc_data_create((const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
    v9 = "smartStyles";
  }
  else
  {
    if (!-[NSArray count](self->_filters, "count"))
      goto LABEL_6;
    v10 = (void *)csr_serializeObjectUsingNSSecureCoding((uint64_t)self->_filters);
    v8 = xpc_data_create((const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
    v9 = "filters";
  }
  xpc_dictionary_set_value(v3, v9, v8);
  xpc_release(v8);
LABEL_6:
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureVideoThumbnailSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[FigCaptureVideoThumbnailSinkConfiguration thumbnailSize](self, "thumbnailSize");
  objc_msgSend(v4, "setThumbnailSize:");
  objc_msgSend(v4, "setFilters:", -[FigCaptureVideoThumbnailSinkConfiguration filters](self, "filters"));
  objc_msgSend(v4, "setSmartStyles:", -[FigCaptureVideoThumbnailSinkConfiguration smartStyles](self, "smartStyles"));
  return v4;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
}

- (void)setFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CGSize)thumbnailSize
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailSize.width;
  height = self->_thumbnailSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)filters
{
  return self->_filters;
}

- (FigCaptureVideoThumbnailSinkConfiguration)initWithXPCEncoding:(id)a3
{
  uint64_t v3;
  FigCaptureVideoThumbnailSinkConfiguration *v5;
  const void *data;
  const void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  size_t v21;
  size_t length[2];
  objc_super v23;
  id v24;

  v23.receiver = self;
  v23.super_class = (Class)FigCaptureVideoThumbnailSinkConfiguration;
  v5 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v23, sel_initWithXPCEncoding_);
  if (v5)
  {
    length[1] = 0;
    FigXPCMessageCopyCFDictionary();
    CGSizeMakeWithDictionaryRepresentation(0, &v5->_thumbnailSize);
    length[0] = 0;
    data = xpc_dictionary_get_data(a3, "smartStyles", length);
    v21 = 0;
    v7 = xpc_dictionary_get_data(a3, "filters", &v21);
    if (data)
    {
      v8 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length[0], 0);
      v24 = 0;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, &v24);
      if (v24)
      {
        fig_log_get_emitter();
        LODWORD(v20) = 0;
        FigDebugAssert3();
        objc_msgSend(v24, "code", v20, v3);
        FigSignalErrorAt();
        v12 = 0;
      }
      else
      {
        v10 = (void *)MEMORY[0x1E0C99E60];
        v11 = objc_opt_class();
        v12 = (void *)objc_msgSend(v9, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), *MEMORY[0x1E0CB2CD0]);
        objc_msgSend(v9, "finishDecoding");
      }

      v13 = v12;
      v14 = 40;
    }
    else
    {
      if (!v7)
        return v5;
      v15 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v7, v21, 0);
      v16 = (void *)MEMORY[0x1E0C99E60];
      v17 = objc_opt_class();
      v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
      v13 = (objc_class *)(id)fcsc_deserializeDataUsingNSSecureCoding(v15, v18);
      v14 = 32;
    }
    *(Class *)((char *)&v5->super.super.isa + v14) = v13;
    if (!v13)
    {

      return 0;
    }
  }
  return v5;
}

- (NSArray)smartStyles
{
  return self->_smartStyles;
}

- (void)setSmartStyles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
