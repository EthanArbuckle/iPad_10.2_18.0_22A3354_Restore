@implementation FigCaptureVideoPreviewSinkConfiguration

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (BOOL)portraitAutoSuggestEnabled
{
  return self->_portraitAutoSuggestEnabled;
}

- (int)sinkType
{
  return 1;
}

- (BOOL)primaryCaptureRectModificationEnabled
{
  return self->_primaryCaptureRectModificationEnabled;
}

- (FigCaptureVideoPreviewSinkConfiguration)init
{
  FigCaptureVideoPreviewSinkConfiguration *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  result = -[FigCaptureVideoPreviewSinkConfiguration init](&v8, sel_init);
  if (result)
  {
    result->_portraitLightingEffectStrength = NAN;
    __asm { FMOV            V0.2D, #0.5 }
    result->_primaryCaptureRectCenter = _Q0;
  }
  return result;
}

- (id)copyXPCEncoding
{
  id v3;
  NSArray *filters;
  void *v5;
  xpc_object_t v6;
  float v7;
  float v8;
  FigCaptureSemanticStyle *semanticStyle;
  id v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  v3 = -[FigCaptureSinkConfiguration copyXPCEncoding](&v15, sel_copyXPCEncoding);
  xpc_dictionary_set_BOOL(v3, "depthDataDeliveryEnabled", -[FigCaptureVideoPreviewSinkConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"));
  xpc_dictionary_set_BOOL(v3, "filterRenderingEnabled", -[FigCaptureVideoPreviewSinkConfiguration filterRenderingEnabled](self, "filterRenderingEnabled"));
  xpc_dictionary_set_BOOL(v3, "portraitAutoSuggestEnabled", -[FigCaptureVideoPreviewSinkConfiguration portraitAutoSuggestEnabled](self, "portraitAutoSuggestEnabled"));
  filters = self->_filters;
  if (filters)
  {
    v5 = (void *)csr_serializeObjectUsingNSSecureCoding((uint64_t)filters);
    v6 = xpc_data_create((const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
    xpc_dictionary_set_value(v3, "filters", v6);
    xpc_release(v6);
    -[FigCaptureVideoPreviewSinkConfiguration simulatedAperture](self, "simulatedAperture");
    xpc_dictionary_set_double(v3, "simulatedAperture", v7);
    -[FigCaptureVideoPreviewSinkConfiguration portraitLightingEffectStrength](self, "portraitLightingEffectStrength");
    xpc_dictionary_set_double(v3, "portraitLightingEffectStrength", v8);
  }
  xpc_dictionary_set_BOOL(v3, "semanticStyleRenderingEnabled", -[FigCaptureVideoPreviewSinkConfiguration semanticStyleRenderingEnabled](self, "semanticStyleRenderingEnabled"));
  semanticStyle = self->_semanticStyle;
  if (semanticStyle)
  {
    v10 = -[FigCaptureSemanticStyle copyXPCEncoding](semanticStyle, "copyXPCEncoding");
    xpc_dictionary_set_value(v3, "semanticStyle", v10);
    xpc_release(v10);
  }
  xpc_dictionary_set_BOOL(v3, "primaryCaptureRectModificationEnabled", -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectModificationEnabled](self, "primaryCaptureRectModificationEnabled"));
  -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectAspectRatio](self, "primaryCaptureRectAspectRatio");
  xpc_dictionary_set_double(v3, "primaryCaptureRectAspectRatio", v11);
  -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectCenter](self, "primaryCaptureRectCenter");
  xpc_dictionary_set_double(v3, "primaryCaptureRectCenterX", v12);
  -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectCenter](self, "primaryCaptureRectCenter");
  xpc_dictionary_set_double(v3, "primaryCaptureRectCenterY", v13);
  xpc_dictionary_set_int64(v3, "primaryCaptureRectUniqueID", -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectUniqueID](self, "primaryCaptureRectUniqueID"));
  xpc_dictionary_set_BOOL(v3, "zoomPIPOverlayEnabled", -[FigCaptureVideoPreviewSinkConfiguration zoomPIPOverlayEnabled](self, "zoomPIPOverlayEnabled"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setDepthDataDeliveryEnabled:", -[FigCaptureVideoPreviewSinkConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"));
  objc_msgSend(v4, "setFilterRenderingEnabled:", -[FigCaptureVideoPreviewSinkConfiguration filterRenderingEnabled](self, "filterRenderingEnabled"));
  objc_msgSend(v4, "setFilters:", -[FigCaptureVideoPreviewSinkConfiguration filters](self, "filters"));
  -[FigCaptureVideoPreviewSinkConfiguration simulatedAperture](self, "simulatedAperture");
  objc_msgSend(v4, "setSimulatedAperture:");
  -[FigCaptureVideoPreviewSinkConfiguration portraitLightingEffectStrength](self, "portraitLightingEffectStrength");
  objc_msgSend(v4, "setPortraitLightingEffectStrength:");
  objc_msgSend(v4, "setSemanticStyleRenderingEnabled:", -[FigCaptureVideoPreviewSinkConfiguration semanticStyleRenderingEnabled](self, "semanticStyleRenderingEnabled"));
  objc_msgSend(v4, "setSemanticStyle:", -[FigCaptureVideoPreviewSinkConfiguration semanticStyle](self, "semanticStyle"));
  objc_msgSend(v4, "setPrimaryCaptureRectModificationEnabled:", -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectModificationEnabled](self, "primaryCaptureRectModificationEnabled"));
  -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectAspectRatio](self, "primaryCaptureRectAspectRatio");
  objc_msgSend(v4, "setPrimaryCaptureRectAspectRatio:");
  -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectCenter](self, "primaryCaptureRectCenter");
  objc_msgSend(v4, "setPrimaryCaptureRectCenter:");
  objc_msgSend(v4, "setPrimaryCaptureRectUniqueID:", -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectUniqueID](self, "primaryCaptureRectUniqueID"));
  objc_msgSend(v4, "setZoomPIPOverlayEnabled:", -[FigCaptureVideoPreviewSinkConfiguration zoomPIPOverlayEnabled](self, "zoomPIPOverlayEnabled"));
  objc_msgSend(v4, "setPortraitAutoSuggestEnabled:", -[FigCaptureVideoPreviewSinkConfiguration portraitAutoSuggestEnabled](self, "portraitAutoSuggestEnabled"));
  return v4;
}

- (void)setZoomPIPOverlayEnabled:(BOOL)a3
{
  self->_zoomPIPOverlayEnabled = a3;
}

- (void)setSimulatedAperture:(float)a3
{
  self->_simulatedAperture = a3;
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  self->_semanticStyleRenderingEnabled = a3;
}

- (void)setSemanticStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setPrimaryCaptureRectUniqueID:(int64_t)a3
{
  self->_primaryCaptureRectUniqueID = a3;
}

- (void)setPrimaryCaptureRectModificationEnabled:(BOOL)a3
{
  self->_primaryCaptureRectModificationEnabled = a3;
}

- (void)setPrimaryCaptureRectCenter:(CGPoint)a3
{
  self->_primaryCaptureRectCenter = a3;
}

- (void)setPrimaryCaptureRectAspectRatio:(double)a3
{
  self->_primaryCaptureRectAspectRatio = a3;
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  self->_portraitLightingEffectStrength = a3;
}

- (void)setPortraitAutoSuggestEnabled:(BOOL)a3
{
  self->_portraitAutoSuggestEnabled = a3;
}

- (void)setFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFilterRenderingEnabled:(BOOL)a3
{
  self->_filterRenderingEnabled = a3;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (id)description
{
  float simulatedAperture;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  FigCaptureSemanticStyle *semanticStyle;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  objc_super v15;

  v14 = BWCIFilterArrayDescription(self->_filters);
  simulatedAperture = self->_simulatedAperture;
  if (simulatedAperture <= 0.0)
    v4 = &stru_1E4928818;
  else
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" simulated aperture: %.1f"), simulatedAperture);
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" Portrait Lighting effect strength: %.1f"), self->_portraitLightingEffectStrength);
  if (self->_semanticStyleRenderingEnabled)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    semanticStyle = self->_semanticStyle;
    if (semanticStyle)
      v8 = -[FigCaptureSemanticStyle debugDescription](semanticStyle, "debugDescription");
    else
      v8 = CFSTR("None");
    v9 = (const __CFString *)objc_msgSend(v6, "stringWithFormat:", CFSTR(", Semantic Style:{%@}"), v8);
  }
  else
  {
    v9 = &stru_1E4928818;
  }
  v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" PrimaryCaptureRectModification:%d, Aspect:%.3f:1, Center:%.3f %.3f, UniqueID:%lld"), self->_primaryCaptureRectModificationEnabled, *(_QWORD *)&self->_primaryCaptureRectAspectRatio, *(_QWORD *)&self->_primaryCaptureRectCenter.x, *(_QWORD *)&self->_primaryCaptureRectCenter.y, self->_primaryCaptureRectUniqueID);
  v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" ZoomPIP:%d"), self->_zoomPIPOverlayEnabled);
  v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" PortraitAutoSuggest:%d"), self->_portraitAutoSuggestEnabled);
  v15.receiver = self;
  v15.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ depth:%d filters:%d [%@]%@%@%@%@%@%@"), -[FigCaptureSinkConfiguration description](&v15, sel_description), -[FigCaptureVideoPreviewSinkConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"), -[FigCaptureVideoPreviewSinkConfiguration filterRenderingEnabled](self, "filterRenderingEnabled"), v14, v4, v5, v9, v10, v11, v12);
}

- (BOOL)filterRenderingEnabled
{
  return self->_filterRenderingEnabled;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  int v6;
  int v7;
  NSArray *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  int v15;
  FigCaptureSemanticStyle *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int64_t v27;
  int v28;
  BOOL v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  v5 = -[FigCaptureSinkConfiguration isEqual:](&v31, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_15;
    v6 = -[FigCaptureVideoPreviewSinkConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled");
    if (v6 != objc_msgSend(a3, "depthDataDeliveryEnabled"))
      goto LABEL_15;
    v7 = -[FigCaptureVideoPreviewSinkConfiguration filterRenderingEnabled](self, "filterRenderingEnabled");
    if (v7 != objc_msgSend(a3, "filterRenderingEnabled"))
      goto LABEL_15;
    v8 = -[FigCaptureVideoPreviewSinkConfiguration filters](self, "filters");
    if (v8 == (NSArray *)objc_msgSend(a3, "filters")
      || (v5 = -[NSArray isEqual:](-[FigCaptureVideoPreviewSinkConfiguration filters](self, "filters"), "isEqual:", objc_msgSend(a3, "filters"))) != 0)
    {
      -[FigCaptureVideoPreviewSinkConfiguration simulatedAperture](self, "simulatedAperture");
      v10 = v9;
      objc_msgSend(a3, "simulatedAperture");
      if (v10 != v11)
      {
LABEL_15:
        LOBYTE(v5) = 0;
        return v5;
      }
      -[FigCaptureVideoPreviewSinkConfiguration portraitLightingEffectStrength](self, "portraitLightingEffectStrength");
      v13 = v12;
      objc_msgSend(a3, "portraitLightingEffectStrength");
      if (v13 != v14)
      {
        -[FigCaptureVideoPreviewSinkConfiguration portraitLightingEffectStrength](self, "portraitLightingEffectStrength");
        goto LABEL_15;
      }
      v15 = -[FigCaptureVideoPreviewSinkConfiguration semanticStyleRenderingEnabled](self, "semanticStyleRenderingEnabled");
      if (v15 != objc_msgSend(a3, "semanticStyleRenderingEnabled"))
        goto LABEL_15;
      v16 = -[FigCaptureVideoPreviewSinkConfiguration semanticStyle](self, "semanticStyle");
      if (v16 == (FigCaptureSemanticStyle *)objc_msgSend(a3, "semanticStyle")
        || (v5 = -[FigCaptureSemanticStyle isEqual:](-[FigCaptureVideoPreviewSinkConfiguration semanticStyle](self, "semanticStyle"), "isEqual:", objc_msgSend(a3, "semanticStyle"))) != 0)
      {
        v17 = -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectModificationEnabled](self, "primaryCaptureRectModificationEnabled");
        if (v17 != objc_msgSend(a3, "primaryCaptureRectModificationEnabled"))
          goto LABEL_15;
        -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectAspectRatio](self, "primaryCaptureRectAspectRatio");
        v19 = v18;
        objc_msgSend(a3, "primaryCaptureRectAspectRatio");
        if (v19 != v20)
          goto LABEL_15;
        -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectCenter](self, "primaryCaptureRectCenter");
        v22 = v21;
        v24 = v23;
        objc_msgSend(a3, "primaryCaptureRectCenter");
        LOBYTE(v5) = 0;
        if (v22 == v26 && v24 == v25)
        {
          v27 = -[FigCaptureVideoPreviewSinkConfiguration primaryCaptureRectUniqueID](self, "primaryCaptureRectUniqueID");
          if (v27 != objc_msgSend(a3, "primaryCaptureRectUniqueID"))
            goto LABEL_15;
          v28 = -[FigCaptureVideoPreviewSinkConfiguration zoomPIPOverlayEnabled](self, "zoomPIPOverlayEnabled");
          if (v28 != objc_msgSend(a3, "zoomPIPOverlayEnabled"))
            goto LABEL_15;
          v29 = -[FigCaptureVideoPreviewSinkConfiguration portraitAutoSuggestEnabled](self, "portraitAutoSuggestEnabled");
          LOBYTE(v5) = v29 ^ objc_msgSend(a3, "portraitAutoSuggestEnabled") ^ 1;
        }
      }
    }
  }
  return v5;
}

- (FigCaptureSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (CGPoint)primaryCaptureRectCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_primaryCaptureRectCenter.x;
  y = self->_primaryCaptureRectCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSArray)filters
{
  return self->_filters;
}

- (int64_t)primaryCaptureRectUniqueID
{
  return self->_primaryCaptureRectUniqueID;
}

- (double)primaryCaptureRectAspectRatio
{
  return self->_primaryCaptureRectAspectRatio;
}

- (float)simulatedAperture
{
  return self->_simulatedAperture;
}

- (float)portraitLightingEffectStrength
{
  return self->_portraitLightingEffectStrength;
}

- (BOOL)zoomPIPOverlayEnabled
{
  return self->_zoomPIPOverlayEnabled;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  -[FigCaptureSinkConfiguration dealloc](&v3, sel_dealloc);
}

- (BOOL)semanticStyleRenderingEnabled
{
  return self->_semanticStyleRenderingEnabled;
}

- (FigCaptureVideoPreviewSinkConfiguration)initWithXPCEncoding:(id)a3
{
  FigCaptureVideoPreviewSinkConfiguration *v4;
  const void *data;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  float v11;
  float v12;
  xpc_object_t dictionary;
  double v14;
  double v15;
  size_t length;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FigCaptureVideoPreviewSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v18, sel_initWithXPCEncoding_);
  if (v4)
  {
    v4->_depthDataDeliveryEnabled = xpc_dictionary_get_BOOL(a3, "depthDataDeliveryEnabled");
    v4->_filterRenderingEnabled = xpc_dictionary_get_BOOL(a3, "filterRenderingEnabled");
    v4->_portraitAutoSuggestEnabled = xpc_dictionary_get_BOOL(a3, "portraitAutoSuggestEnabled");
    length = 0;
    data = xpc_dictionary_get_data(a3, "filters", &length);
    v4->_portraitLightingEffectStrength = NAN;
    if (data)
    {
      v6 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = objc_opt_class();
      v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      v10 = (NSArray *)(id)fcsc_deserializeDataUsingNSSecureCoding(v6, v9);
      v4->_filters = v10;
      if (!v10)
      {

        return 0;
      }
      v11 = xpc_dictionary_get_double(a3, "simulatedAperture");
      v4->_simulatedAperture = v11;
      v12 = xpc_dictionary_get_double(a3, "portraitLightingEffectStrength");
      v4->_portraitLightingEffectStrength = v12;
    }
    v4->_semanticStyleRenderingEnabled = xpc_dictionary_get_BOOL(a3, "semanticStyleRenderingEnabled");
    dictionary = xpc_dictionary_get_dictionary(a3, "semanticStyle");
    if (dictionary)
      v4->_semanticStyle = -[FigCaptureSemanticStyle initWithXPCEncoding:]([FigCaptureSemanticStyle alloc], "initWithXPCEncoding:", dictionary);
    v4->_primaryCaptureRectModificationEnabled = xpc_dictionary_get_BOOL(a3, "primaryCaptureRectModificationEnabled");
    v4->_primaryCaptureRectAspectRatio = xpc_dictionary_get_double(a3, "primaryCaptureRectAspectRatio");
    v14 = xpc_dictionary_get_double(a3, "primaryCaptureRectCenterX");
    v15 = xpc_dictionary_get_double(a3, "primaryCaptureRectCenterY");
    v4->_primaryCaptureRectCenter.x = v14;
    v4->_primaryCaptureRectCenter.y = v15;
    v4->_primaryCaptureRectUniqueID = xpc_dictionary_get_int64(a3, "primaryCaptureRectUniqueID");
    v4->_zoomPIPOverlayEnabled = xpc_dictionary_get_BOOL(a3, "zoomPIPOverlayEnabled");
  }
  return v4;
}

@end
