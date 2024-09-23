@implementation FigCaptureVideoDataSinkConfiguration

- (int)sinkType
{
  return 6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  -[FigCaptureSinkConfiguration dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setDiscardsLateVideoFrames:", -[FigCaptureVideoDataSinkConfiguration discardsLateVideoFrames](self, "discardsLateVideoFrames"));
  objc_msgSend(v4, "setOptimizedForPreview:", -[FigCaptureVideoDataSinkConfiguration optimizedForPreview](self, "optimizedForPreview"));
  objc_msgSend(v4, "setSceneStabilityMetadataEnabled:", -[FigCaptureVideoDataSinkConfiguration sceneStabilityMetadataEnabled](self, "sceneStabilityMetadataEnabled"));
  objc_msgSend(v4, "setRequestedBufferAttachments:", -[FigCaptureVideoDataSinkConfiguration requestedBufferAttachments](self, "requestedBufferAttachments"));
  objc_msgSend(v4, "setCinematicFramingEnabled:", -[FigCaptureVideoDataSinkConfiguration cinematicFramingEnabled](self, "cinematicFramingEnabled"));
  return v4;
}

- (void)setSceneStabilityMetadataEnabled:(BOOL)a3
{
  self->_sceneStabilityMetadataEnabled = a3;
}

- (void)setRequestedBufferAttachments:(id)a3
{
  NSArray *requestedBufferAttachments;

  requestedBufferAttachments = self->_requestedBufferAttachments;
  self->_requestedBufferAttachments = (NSArray *)a3;
  if (a3)
    CFRetain(a3);
  if (requestedBufferAttachments)
    CFRelease(requestedBufferAttachments);

  self->_requestedBufferAttachmentsTrie = 0;
}

- (void)setOptimizedForPreview:(BOOL)a3
{
  self->_optimizedForPreview = a3;
}

- (void)setDiscardsLateVideoFrames:(BOOL)a3
{
  self->_discardsLateVideoFrames = a3;
}

- (FigCaptureTrie)requestedBufferAttachmentsTrie
{
  FigCaptureTrie *result;

  result = self->_requestedBufferAttachmentsTrie;
  if (!result)
  {
    if (self->_requestedBufferAttachments)
    {
      result = -[FigCaptureTrie initWithPathArray:]([FigCaptureTrie alloc], "initWithPathArray:", self->_requestedBufferAttachments);
      self->_requestedBufferAttachmentsTrie = result;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)copyXPCEncoding
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  v3 = -[FigCaptureSinkConfiguration copyXPCEncoding](&v7, sel_copyXPCEncoding);
  xpc_dictionary_set_BOOL(v3, "videoDataDiscardsLateVideoFrames", -[FigCaptureVideoDataSinkConfiguration discardsLateVideoFrames](self, "discardsLateVideoFrames"));
  xpc_dictionary_set_BOOL(v3, "videoDataOptimizedForPreview", -[FigCaptureVideoDataSinkConfiguration optimizedForPreview](self, "optimizedForPreview"));
  xpc_dictionary_set_BOOL(v3, "sceneStabilityMetadataEnabled", -[FigCaptureVideoDataSinkConfiguration sceneStabilityMetadataEnabled](self, "sceneStabilityMetadataEnabled"));
  -[FigCaptureVideoDataSinkConfiguration requestedBufferAttachments](self, "requestedBufferAttachments");
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    v5 = v4;
    xpc_dictionary_set_value(v3, "requestedBufferAttachments", v4);
    xpc_release(v5);
  }
  xpc_dictionary_set_BOOL(v3, "cinematicFramingEnabled", -[FigCaptureVideoDataSinkConfiguration cinematicFramingEnabled](self, "cinematicFramingEnabled"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  NSArray *v9;
  BOOL v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  v5 = -[FigCaptureSinkConfiguration isEqual:](&v12, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v6 = -[FigCaptureVideoDataSinkConfiguration discardsLateVideoFrames](self, "discardsLateVideoFrames"),
          v6 == objc_msgSend(a3, "discardsLateVideoFrames"))
      && (v7 = -[FigCaptureVideoDataSinkConfiguration optimizedForPreview](self, "optimizedForPreview"),
          v7 == objc_msgSend(a3, "optimizedForPreview"))
      && (v8 = -[FigCaptureVideoDataSinkConfiguration sceneStabilityMetadataEnabled](self, "sceneStabilityMetadataEnabled"), v8 == objc_msgSend(a3, "sceneStabilityMetadataEnabled")))
    {
      v9 = -[FigCaptureVideoDataSinkConfiguration requestedBufferAttachments](self, "requestedBufferAttachments");
      if (v9 == (NSArray *)objc_msgSend(a3, "requestedBufferAttachments")
        || (v5 = -[NSArray isEqual:](-[FigCaptureVideoDataSinkConfiguration requestedBufferAttachments](self, "requestedBufferAttachments"), "isEqual:", objc_msgSend(a3, "requestedBufferAttachments"))) != 0)
      {
        v10 = -[FigCaptureVideoDataSinkConfiguration cinematicFramingEnabled](self, "cinematicFramingEnabled");
        LOBYTE(v5) = v10 ^ objc_msgSend(a3, "cinematicFramingEnabled") ^ 1;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ discards:%d, preview:%d, stability:%d, requestedBufferAttachments.count:%d"), -[FigCaptureSinkConfiguration description](&v3, sel_description), -[FigCaptureVideoDataSinkConfiguration discardsLateVideoFrames](self, "discardsLateVideoFrames"), -[FigCaptureVideoDataSinkConfiguration optimizedForPreview](self, "optimizedForPreview"), -[FigCaptureVideoDataSinkConfiguration sceneStabilityMetadataEnabled](self, "sceneStabilityMetadataEnabled"), -[NSArray count](-[FigCaptureVideoDataSinkConfiguration requestedBufferAttachments](self, "requestedBufferAttachments"), "count"));
}

- (BOOL)sceneStabilityMetadataEnabled
{
  return self->_sceneStabilityMetadataEnabled;
}

- (BOOL)optimizedForPreview
{
  return self->_optimizedForPreview;
}

- (BOOL)discardsLateVideoFrames
{
  return self->_discardsLateVideoFrames;
}

- (NSArray)requestedBufferAttachments
{
  return self->_requestedBufferAttachments;
}

- (FigCaptureVideoDataSinkConfiguration)initWithXPCEncoding:(id)a3
{
  FigCaptureVideoDataSinkConfiguration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureVideoDataSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v6, sel_initWithXPCEncoding_);
  if (v4)
  {
    v4->_discardsLateVideoFrames = xpc_dictionary_get_BOOL(a3, "videoDataDiscardsLateVideoFrames");
    v4->_optimizedForPreview = xpc_dictionary_get_BOOL(a3, "videoDataOptimizedForPreview");
    v4->_sceneStabilityMetadataEnabled = xpc_dictionary_get_BOOL(a3, "sceneStabilityMetadataEnabled");
    xpc_dictionary_get_array(a3, "requestedBufferAttachments");
    v4->_requestedBufferAttachments = (NSArray *)_CFXPCCreateCFObjectFromXPCObject();
    v4->_cinematicFramingEnabled = xpc_dictionary_get_BOOL(a3, "cinematicFramingEnabled");
  }
  return v4;
}

- (BOOL)cinematicFramingEnabled
{
  return self->_cinematicFramingEnabled;
}

- (void)setCinematicFramingEnabled:(BOOL)a3
{
  self->_cinematicFramingEnabled = a3;
}

@end
