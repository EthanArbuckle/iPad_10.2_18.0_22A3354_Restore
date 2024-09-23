@implementation AVMetadataMachineReadableCodeObject

+ (AVMetadataMachineReadableCodeObject)machineReadableCodeObjectWithFigEmbeddedCaptureDeviceMachineReadableCodeDictionary:(id)a3 input:(id)a4
{
  return (AVMetadataMachineReadableCodeObject *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigEmbeddedCaptureDeviceMachineReadableCodeDictionary:input:", a3, a4);
}

+ (AVMetadataMachineReadableCodeObject)machineReadableCodeObjectWithAppClipCodeDictionary:(id)a3 input:(id)a4
{
  return (AVMetadataMachineReadableCodeObject *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAppClipCodeDictionary:input:", a3, a4);
}

- (AVMetadataMachineReadableCodeObject)initWithFigEmbeddedCaptureDeviceMachineReadableCodeDictionary:(id)a3 input:(id)a4
{
  CMTimeEpoch v7;
  double *v8;
  const __CFDictionary *v9;
  double x;
  double y;
  double height;
  double width;
  const __CFDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  AVMetadataMachineReadableCodeObject *v18;
  AVMetadataMachineReadableCodeObjectInternal *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  CMTimeEpoch v40;
  objc_super v41;
  CGRect rect;
  CMTime v43;

  v38 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&v43.value = *MEMORY[0x1E0CA2E18];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v43.epoch = v7;
  v8 = (double *)MEMORY[0x1E0C9D648];
  v9 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03ED8]);
  if (v9)
    CMTimeMakeFromDictionary(&v43, v9);
  x = *v8;
  y = v8[1];
  width = v8[2];
  height = v8[3];
  v14 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E80]);
  if (v14)
  {
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v14, &rect))
    {
      x = rect.origin.x;
      y = rect.origin.y;
      width = rect.size.width;
      height = rect.size.height;
    }
  }
  v15 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E70]);
  v16 = v15;
  if (v15)
  {
    v17 = (void *)objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E88]);
    if (v17)
    {
      if (figBarcodeTypeToAVFMachineReadableCodeType_sFigBarcodeToAVFMRCTypesToken != -1)
        dispatch_once(&figBarcodeTypeToAVFMachineReadableCodeType_sFigBarcodeToAVFMRCTypesToken, &__block_literal_global_12);
      v17 = (void *)objc_msgSend((id)figBarcodeTypeToAVFMachineReadableCodeType_sFigBarcodeToAVFMRCTypes, "objectForKeyedSubscript:", v17);
    }
  }
  else
  {
    v17 = 0;
  }
  v41.receiver = self;
  v41.super_class = (Class)AVMetadataMachineReadableCodeObject;
  rect.origin = *(CGPoint *)&v43.value;
  *(_QWORD *)&rect.size.width = v43.epoch;
  v39 = v38;
  v40 = v7;
  v18 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v41, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, v17, &rect, &v39, 0, 0, a4, x, y, width, height);
  if (v18)
  {
    v19 = objc_alloc_init(AVMetadataMachineReadableCodeObjectInternal);
    v18->_internal = v19;
    if (v19)
    {
      v20 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E68]);
      if (v20)
        -[AVMetadataMachineReadableCodeObjectInternal setCorners:](v18->_internal, "setCorners:", v20);
      if (v16)
        -[AVMetadataMachineReadableCodeObjectInternal setBasicDescriptor:](v18->_internal, "setBasicDescriptor:", v16);
      v21 = objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E78]);
      if (v21)
      {
        v22 = v21;
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("org.iso.QRCode")) & 1) == 0
          && !objc_msgSend(v17, "isEqualToString:", CFSTR("org.iso.MicroPDF417")))
        {
          if (objc_msgSend(v17, "isEqualToString:", CFSTR("org.iso.Aztec")))
          {
            v28 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E60]);
            v29 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E58]);
            v30 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E50]);
            v27 = objc_msgSend(MEMORY[0x1E0C9DD60], "descriptorWithPayload:isCompact:layerCount:dataCodewordCount:", v22, objc_msgSend(v28, "BOOLValue"), objc_msgSend(v29, "integerValue"), objc_msgSend(v30, "integerValue"));
          }
          else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("org.iso.PDF417")) & 1) != 0
                 || objc_msgSend(v17, "isEqualToString:", CFSTR("org.iso.MicroPDF417")))
          {
            v31 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03EB8]);
            v32 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03EB0]);
            v33 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03EA8]);
            v27 = objc_msgSend(MEMORY[0x1E0C9DDD8], "descriptorWithPayload:isCompact:rowCount:columnCount:", v22, objc_msgSend(v31, "BOOLValue"), objc_msgSend(v33, "integerValue"), objc_msgSend(v32, "integerValue"));
          }
          else
          {
            if (!objc_msgSend(v17, "isEqualToString:", CFSTR("org.iso.DataMatrix")))
              return v18;
            v35 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E90]);
            v36 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03EA0]);
            v37 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03E98]);
            v27 = objc_msgSend(MEMORY[0x1E0C9DDA0], "descriptorWithPayload:rowCount:columnCount:eccVersion:", v22, objc_msgSend(v37, "integerValue"), objc_msgSend(v36, "integerValue"), objc_msgSend(v35, "integerValue"));
          }
          goto LABEL_29;
        }
        v23 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03EC0]);
        v24 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03EC8]);
        v25 = (void *)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D03ED0]);
        v26 = objc_msgSend(v23, "integerValue");
        if (v26 <= 3)
        {
          v27 = objc_msgSend(MEMORY[0x1E0C9DDE0], "descriptorWithPayload:symbolVersion:maskPattern:errorCorrectionLevel:", v22, (int)objc_msgSend(v25, "charValue"), objc_msgSend(v24, "charValue"), qword_19EEEA730[v26]);
LABEL_29:
          -[AVMetadataMachineReadableCodeObjectInternal setDescriptor:](v18->_internal, "setDescriptor:", v27);
        }
      }
    }
    else
    {

      return 0;
    }
  }
  return v18;
}

- (AVMetadataMachineReadableCodeObject)initWithAppClipCodeDictionary:(id)a3 input:(id)a4
{
  CMTimeEpoch v7;
  double *v8;
  const __CFDictionary *v9;
  double x;
  double y;
  double width;
  double height;
  const __CFDictionary *v14;
  AVMetadataMachineReadableCodeObject *v15;
  AVMetadataMachineReadableCodeObjectInternal *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  CMTimeEpoch v26;
  objc_super v27;
  CGRect rect;
  CMTime v29;

  v24 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&v29.value = *MEMORY[0x1E0CA2E18];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v29.epoch = v7;
  v8 = (double *)MEMORY[0x1E0C9D648];
  v9 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F40]);
  if (v9)
    CMTimeMakeFromDictionary(&v29, v9);
  x = *v8;
  y = v8[1];
  width = v8[2];
  height = v8[3];
  v14 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F28]);
  if (v14)
  {
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v14, &rect))
    {
      x = rect.origin.x;
      y = rect.origin.y;
      width = rect.size.width;
      height = rect.size.height;
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)AVMetadataMachineReadableCodeObject;
  rect.origin = *(CGPoint *)&v29.value;
  *(_QWORD *)&rect.size.width = v29.epoch;
  v25 = v24;
  v26 = v7;
  v15 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v27, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("com.apple.AppClipCode"), &rect, &v25, 0, 0, a4, x, y, width, height);
  if (v15)
  {
    v16 = objc_alloc_init(AVMetadataMachineReadableCodeObjectInternal);
    v15->_internal = v16;
    if (v16)
    {
      v17 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F30]);
      if (v17)
        -[AVMetadataMachineReadableCodeObjectInternal setCorners:](v15->_internal, "setCorners:", v17);
      v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v19 = *MEMORY[0x1E0D03F38];
      v20 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F38]);
      if (v20)
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, v19);
      v21 = *MEMORY[0x1E0D03F48];
      v22 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D03F48]);
      if (v22)
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, v21);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("com.apple.AppClipCode"), *MEMORY[0x1E0D03E88]);
      -[AVMetadataMachineReadableCodeObjectInternal setBasicDescriptor:](v15->_internal, "setBasicDescriptor:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v18));
    }
    else
    {

      return 0;
    }
  }
  return v15;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  uint64_t v9;
  CGSize v10;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  AVMetadataMachineReadableCodeObject *v17;
  AVMetadataMachineReadableCodeObjectInternal *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFDictionary *v25;
  CGPoint v26;
  CGFloat y;
  CFDictionaryRef DictionaryRepresentation;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  objc_super v36;
  CGPoint point;
  __int128 v38;
  __int128 v39;
  CGRect v40;
  __int128 v41;
  uint64_t v42;
  CGPoint v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend(a3, "type", a6);
  v43 = (CGPoint)0;
  v44 = 0;
  if (a3)
  {
    objc_msgSend(a3, "time");
    v41 = 0uLL;
    v42 = 0;
    objc_msgSend(a3, "duration");
  }
  else
  {
    v41 = 0uLL;
    v42 = 0;
  }
  v10 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v40.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v40.size = v10;
  objc_msgSend(a3, "bounds");
  v11 = *(_OWORD *)&a4->c;
  point = *(CGPoint *)&a4->a;
  v38 = v11;
  v39 = *(_OWORD *)&a4->tx;
  if (!AVMetadataObjectAdjustBaseClassProperties((uint64_t)&point, &v40, v12, v13, v14, v15))
  {

    return 0;
  }
  v16 = objc_msgSend(a3, "input");
  v36.receiver = self;
  v36.super_class = (Class)AVMetadataMachineReadableCodeObject;
  point = v43;
  *(_QWORD *)&v38 = v44;
  v34 = v41;
  v35 = v42;
  v17 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v36, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, v9, &point, &v34, 0, a3, v16, *(_OWORD *)&v40.origin, *(_OWORD *)&v40.size);
  if (!v17)
    return v17;
  v18 = objc_alloc_init(AVMetadataMachineReadableCodeObjectInternal);
  v17->_internal = v18;
  if (!v18)
  {

    return 0;
  }
  v19 = (void *)objc_msgSend(a3, "corners");
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v31;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(v19);
        v25 = *(const __CFDictionary **)(*((_QWORD *)&v30 + 1) + 8 * v24);
        point.x = 0.0;
        point.y = 0.0;
        if (CGPointMakeWithDictionaryRepresentation(v25, &point))
        {
          v26 = (CGPoint)vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, point.y), *(float64x2_t *)&a4->a, point.x));
          y = v26.y;
          DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v26);
          objc_msgSend(v20, "addObject:", DictionaryRepresentation);
          CFRelease(DictionaryRepresentation);
        }
        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
    }
    while (v22);
  }
  -[AVMetadataMachineReadableCodeObjectInternal setCorners:](v17->_internal, "setCorners:", v20);
  -[AVMetadataMachineReadableCodeObjectInternal setBasicDescriptor:](v17->_internal, "setBasicDescriptor:", objc_msgSend(*((id *)a3 + 2), "basicDescriptor"));
  -[AVMetadataMachineReadableCodeObjectInternal setStringValue:](v17->_internal, "setStringValue:", objc_msgSend(*((id *)a3 + 2), "stringValue"));
  -[AVMetadataMachineReadableCodeObjectInternal setDecoded:](v17->_internal, "setDecoded:", objc_msgSend(*((id *)a3 + 2), "decoded"));
  -[AVMetadataMachineReadableCodeObjectInternal setDescriptor:](v17->_internal, "setDescriptor:", objc_msgSend(*((id *)a3 + 2), "descriptor"));
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetadataMachineReadableCodeObject;
  -[AVMetadataObject dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  const __CFDictionary *v18;
  uint64_t v19;
  uint64_t v21;
  CGPoint point;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[AVMetadataObject bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 100);
  v12 = (objc_class *)objc_opt_class();
  objc_msgSend(v11, "appendFormat:", CFSTR("<%@: %p, type=\"%@\", bounds={ %.1f,%.1f %.1fx%.1f }>"), NSStringFromClass(v12), self, -[AVMetadataObject type](self, "type"), v4, v6, v8, v10);
  v13 = -[AVMetadataMachineReadableCodeObject corners](self, "corners");
  objc_msgSend(v11, "appendString:", CFSTR("corners { "));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(const __CFDictionary **)(*((_QWORD *)&v23 + 1) + 8 * i);
        point.x = 0.0;
        point.y = 0.0;
        if (CGPointMakeWithDictionaryRepresentation(v18, &point))
          objc_msgSend(v11, "appendFormat:", CFSTR("%.1f,%.1f "), *(_QWORD *)&point.x, *(_QWORD *)&point.y);
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }
  if (self)
  {
    -[AVMetadataObject time](self, "time");
    v19 = v21;
  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v11, "appendFormat:", CFSTR("}, time %lld, stringValue \"%@\"), v19, -[AVMetadataMachineReadableCodeObject stringValue](self, "stringValue"));
  return v11;
}

- (NSArray)corners
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", -[AVMetadataMachineReadableCodeObjectInternal corners](self->_internal, "corners"));
}

- (NSString)stringValue
{
  AVMetadataMachineReadableCodeObjectInternal *internal;
  NSString *v4;
  const void *v5;

  internal = self->_internal;
  objc_sync_enter(internal);
  v4 = -[AVMetadataMachineReadableCodeObjectInternal stringValue](self->_internal, "stringValue");
  if (!v4)
  {
    if (-[AVMetadataMachineReadableCodeObjectInternal decoded](self->_internal, "decoded"))
    {
      v4 = 0;
    }
    else
    {
      if (-[AVMetadataMachineReadableCodeObjectInternal basicDescriptor](self->_internal, "basicDescriptor"))
      {
        v5 = (const void *)MRCDescriptorCreateWithAttributes();
        v4 = (NSString *)(id)MRCDescriptorDecodePayload();
        if (v5)
          CFRelease(v5);
      }
      else
      {
        v4 = 0;
      }
      -[AVMetadataMachineReadableCodeObjectInternal setStringValue:](self->_internal, "setStringValue:", v4);
      -[AVMetadataMachineReadableCodeObjectInternal setDecoded:](self->_internal, "setDecoded:", 1);
    }
  }
  objc_sync_exit(internal);
  return v4;
}

- (id)basicDescriptor
{
  return -[AVMetadataMachineReadableCodeObjectInternal basicDescriptor](self->_internal, "basicDescriptor");
}

- (CIBarcodeDescriptor)descriptor
{
  return -[AVMetadataMachineReadableCodeObjectInternal descriptor](self->_internal, "descriptor");
}

@end
