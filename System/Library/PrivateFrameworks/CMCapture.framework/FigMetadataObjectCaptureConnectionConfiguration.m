@implementation FigMetadataObjectCaptureConnectionConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigMetadataObjectCaptureConnectionConfiguration;
  v4 = -[FigCaptureConnectionConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setMetadataIdentifiers:", -[FigMetadataObjectCaptureConnectionConfiguration metadataIdentifiers](self, "metadataIdentifiers"));
  -[FigMetadataObjectCaptureConnectionConfiguration metadataRectOfInterest](self, "metadataRectOfInterest");
  objc_msgSend(v4, "setMetadataRectOfInterest:");
  objc_msgSend(v4, "setFaceTrackingMaxFaces:", -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingMaxFaces](self, "faceTrackingMaxFaces"));
  objc_msgSend(v4, "setFaceTrackingUsesFaceRecognition:", -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingUsesFaceRecognition](self, "faceTrackingUsesFaceRecognition"));
  objc_msgSend(v4, "setFaceTrackingPlusEnabled:", -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingPlusEnabled](self, "faceTrackingPlusEnabled"));
  -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingNetworkFailureThresholdMultiplier](self, "faceTrackingNetworkFailureThresholdMultiplier");
  objc_msgSend(v4, "setFaceTrackingNetworkFailureThresholdMultiplier:");
  -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingFailureFieldOfViewModifier](self, "faceTrackingFailureFieldOfViewModifier");
  objc_msgSend(v4, "setFaceTrackingFailureFieldOfViewModifier:");
  objc_msgSend(v4, "setAttentionDetectionEnabled:", -[FigMetadataObjectCaptureConnectionConfiguration attentionDetectionEnabled](self, "attentionDetectionEnabled"));
  objc_msgSend(v4, "setAttachMetadataToVideoBuffers:", -[FigMetadataObjectCaptureConnectionConfiguration attachMetadataToVideoBuffers](self, "attachMetadataToVideoBuffers"));
  return v4;
}

- (void)setMetadataRectOfInterest:(CGRect)a3
{
  self->_metadataRectOfInterest = a3;
}

- (void)setMetadataIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setFaceTrackingUsesFaceRecognition:(BOOL)a3
{
  self->_faceTrackingUsesFaceRecognition = a3;
}

- (void)setFaceTrackingPlusEnabled:(BOOL)a3
{
  self->_faceTrackingPlusEnabled = a3;
}

- (void)setFaceTrackingNetworkFailureThresholdMultiplier:(float)a3
{
  self->_faceTrackingNetworkFailureThresholdMultiplier = a3;
}

- (void)setFaceTrackingMaxFaces:(int)a3
{
  self->_faceTrackingMaxFaces = a3;
}

- (void)setAttentionDetectionEnabled:(BOOL)a3
{
  self->_attentionDetectionEnabled = a3;
}

- (id)copyXPCEncoding
{
  id v3;
  CFDictionaryRef DictionaryRepresentation;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigMetadataObjectCaptureConnectionConfiguration;
  v3 = -[FigCaptureConnectionConfiguration copyXPCEncoding](&v6, sel_copyXPCEncoding);
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(self->_metadataRectOfInterest);
  FigXPCMessageSetCFArray();
  FigXPCMessageSetCFDictionary();
  xpc_dictionary_set_int64(v3, "faceTrackingMaxFaces", self->_faceTrackingMaxFaces);
  xpc_dictionary_set_BOOL(v3, "faceTrackingUsesFaceRecognition", self->_faceTrackingUsesFaceRecognition);
  xpc_dictionary_set_BOOL(v3, "faceTrackingPlusEnabled", self->_faceTrackingPlusEnabled);
  xpc_dictionary_set_double(v3, "faceTrackingNetworkFailureThresholdMultiplier", self->_faceTrackingNetworkFailureThresholdMultiplier);
  xpc_dictionary_set_double(v3, "faceTrackingFailureFieldOfViewModifier", self->_faceTrackingFailureFieldOfViewModifier);
  xpc_dictionary_set_BOOL(v3, "attentionDetectionEnabled", self->_attentionDetectionEnabled);
  xpc_dictionary_set_BOOL(v3, "attachMetadataToVideoBuffers", -[FigMetadataObjectCaptureConnectionConfiguration attachMetadataToVideoBuffers](self, "attachMetadataToVideoBuffers"));
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigMetadataObjectCaptureConnectionConfiguration;
  -[FigCaptureConnectionConfiguration dealloc](&v3, sel_dealloc);
}

- (id)description
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v3 = -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType");
  v4 = &stru_1E4928818;
  if (v3 != -[FigCaptureSourceConfiguration sourceDeviceType](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "sourceDeviceType"))v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (SUB-DEVICE:%@)"), +[FigCaptureSourceConfiguration stringForSourceDeviceType:](FigCaptureSourceConfiguration, "stringForSourceDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType")));
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", attentionDetection:%d"), self->_attentionDetectionEnabled);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MOC %p: <%@>%@ -> <%@> E:%d MetadataIdentifiers:%lu rectOfInterest:{{%.2f,%.2f}{%.2fx%.2f}} maxFaces:%d usesFaceRecognition:%d faceTrackingPlusEnabled:%d, faceTrackingNetworkFailureThresholdMultiplier:%.2f, faceTrackingFailureFieldOfViewModifier:%.2f attachMetadataToVideoBuffers:%d%@%@%@%@%@"), self, -[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), v4, -[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"), -[FigCaptureConnectionConfiguration enabled](self, "enabled"), -[NSArray count](-[FigMetadataObjectCaptureConnectionConfiguration metadataIdentifiers](self, "metadataIdentifiers"), "count"), *(_QWORD *)&self->_metadataRectOfInterest.origin.x, *(_QWORD *)&self->_metadataRectOfInterest.origin.y, *(_QWORD *)&self->_metadataRectOfInterest.size.width, *(_QWORD *)&self->_metadataRectOfInterest.size.height, self->_faceTrackingMaxFaces, self->_faceTrackingUsesFaceRecognition, self->_faceTrackingPlusEnabled, self->_faceTrackingNetworkFailureThresholdMultiplier,
               self->_faceTrackingFailureFieldOfViewModifier,
               self->_attachMetadataToVideoBuffers,
               v5,
               &stru_1E4928818,
               &stru_1E4928818,
               &stru_1E4928818,
               &stru_1E4928818);
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSArray *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  int v19;
  int v20;
  int v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  int v28;
  BOOL v29;
  objc_super v31;
  CGRect v32;
  CGRect v33;

  v31.receiver = self;
  v31.super_class = (Class)FigMetadataObjectCaptureConnectionConfiguration;
  v5 = -[FigCaptureConnectionConfiguration isEqual:](&v31, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_12:
      LOBYTE(v5) = 0;
      return v5;
    }
    v6 = -[FigMetadataObjectCaptureConnectionConfiguration metadataIdentifiers](self, "metadataIdentifiers");
    if (v6 == (NSArray *)objc_msgSend(a3, "metadataIdentifiers")
      || (v5 = -[NSArray isEqual:](-[FigMetadataObjectCaptureConnectionConfiguration metadataIdentifiers](self, "metadataIdentifiers"), "isEqual:", objc_msgSend(a3, "metadataIdentifiers"))) != 0)
    {
      -[FigMetadataObjectCaptureConnectionConfiguration metadataRectOfInterest](self, "metadataRectOfInterest");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(a3, "metadataRectOfInterest");
      v33.origin.x = v15;
      v33.origin.y = v16;
      v33.size.width = v17;
      v33.size.height = v18;
      v32.origin.x = v8;
      v32.origin.y = v10;
      v32.size.width = v12;
      v32.size.height = v14;
      v5 = CGRectEqualToRect(v32, v33);
      if (v5)
      {
        v19 = -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingMaxFaces](self, "faceTrackingMaxFaces");
        if (v19 != objc_msgSend(a3, "faceTrackingMaxFaces"))
          goto LABEL_12;
        v20 = -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingUsesFaceRecognition](self, "faceTrackingUsesFaceRecognition");
        if (v20 != objc_msgSend(a3, "faceTrackingUsesFaceRecognition"))
          goto LABEL_12;
        v21 = -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingPlusEnabled](self, "faceTrackingPlusEnabled");
        if (v21 != objc_msgSend(a3, "faceTrackingPlusEnabled"))
          goto LABEL_12;
        -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingNetworkFailureThresholdMultiplier](self, "faceTrackingNetworkFailureThresholdMultiplier");
        v23 = v22;
        objc_msgSend(a3, "faceTrackingNetworkFailureThresholdMultiplier");
        if (v23 != v24)
          goto LABEL_12;
        -[FigMetadataObjectCaptureConnectionConfiguration faceTrackingFailureFieldOfViewModifier](self, "faceTrackingFailureFieldOfViewModifier");
        v26 = v25;
        objc_msgSend(a3, "faceTrackingFailureFieldOfViewModifier");
        if (v26 != v27)
          goto LABEL_12;
        v28 = -[FigMetadataObjectCaptureConnectionConfiguration attentionDetectionEnabled](self, "attentionDetectionEnabled");
        if (v28 != objc_msgSend(a3, "attentionDetectionEnabled"))
          goto LABEL_12;
        v29 = -[FigMetadataObjectCaptureConnectionConfiguration attachMetadataToVideoBuffers](self, "attachMetadataToVideoBuffers");
        LOBYTE(v5) = v29 ^ objc_msgSend(a3, "attachMetadataToVideoBuffers") ^ 1;
      }
    }
  }
  return v5;
}

- (BOOL)attentionDetectionEnabled
{
  return self->_attentionDetectionEnabled;
}

- (NSArray)metadataIdentifiers
{
  return self->_metadataIdentifiers;
}

- (CGRect)metadataRectOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_metadataRectOfInterest.origin.x;
  y = self->_metadataRectOfInterest.origin.y;
  width = self->_metadataRectOfInterest.size.width;
  height = self->_metadataRectOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)faceTrackingUsesFaceRecognition
{
  return self->_faceTrackingUsesFaceRecognition;
}

- (BOOL)faceTrackingPlusEnabled
{
  return self->_faceTrackingPlusEnabled;
}

- (float)faceTrackingNetworkFailureThresholdMultiplier
{
  return self->_faceTrackingNetworkFailureThresholdMultiplier;
}

- (int)faceTrackingMaxFaces
{
  return self->_faceTrackingMaxFaces;
}

- (FigMetadataObjectCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  FigMetadataObjectCaptureConnectionConfiguration *v4;
  float v5;
  float v6;
  objc_super v8;

  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)FigMetadataObjectCaptureConnectionConfiguration;
    v4 = -[FigCaptureConnectionConfiguration initWithXPCEncoding:](&v8, sel_initWithXPCEncoding_);
    if (v4)
    {
      FigXPCMessageCopyCFArray();
      FigXPCMessageCopyCFDictionary();
      CGRectMakeWithDictionaryRepresentation(0, &v4->_metadataRectOfInterest);
      v4->_faceTrackingMaxFaces = xpc_dictionary_get_int64(a3, "faceTrackingMaxFaces");
      v4->_faceTrackingUsesFaceRecognition = xpc_dictionary_get_BOOL(a3, "faceTrackingUsesFaceRecognition");
      v4->_faceTrackingPlusEnabled = xpc_dictionary_get_BOOL(a3, "faceTrackingPlusEnabled");
      v5 = xpc_dictionary_get_double(a3, "faceTrackingNetworkFailureThresholdMultiplier");
      v4->_faceTrackingNetworkFailureThresholdMultiplier = v5;
      v6 = xpc_dictionary_get_double(a3, "faceTrackingFailureFieldOfViewModifier");
      v4->_faceTrackingFailureFieldOfViewModifier = v6;
      v4->_attentionDetectionEnabled = xpc_dictionary_get_BOOL(a3, "attentionDetectionEnabled");
      v4->_attachMetadataToVideoBuffers = xpc_dictionary_get_BOOL(a3, "attachMetadataToVideoBuffers");
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (float)faceTrackingFailureFieldOfViewModifier
{
  return self->_faceTrackingFailureFieldOfViewModifier;
}

- (void)setFaceTrackingFailureFieldOfViewModifier:(float)a3
{
  self->_faceTrackingFailureFieldOfViewModifier = a3;
}

- (BOOL)attachMetadataToVideoBuffers
{
  return self->_attachMetadataToVideoBuffers;
}

- (void)setAttachMetadataToVideoBuffers:(BOOL)a3
{
  self->_attachMetadataToVideoBuffers = a3;
}

@end
