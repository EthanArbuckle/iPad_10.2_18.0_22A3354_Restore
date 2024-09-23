@implementation VNBarcodeObservation

- (VNBarcodeObservation)initWithOriginatingRequestSpecifier:(id)a3 symbology:(id)a4 descriptor:(id)a5 topLeft:(CGPoint)a6 topRight:(CGPoint)a7 bottomRight:(CGPoint)a8 bottomLeft:(CGPoint)a9
{
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  objc_super v34;

  y = a9.y;
  x = a9.x;
  v11 = a8.y;
  v12 = a8.x;
  v13 = a7.y;
  v14 = a7.x;
  v15 = a6.y;
  v16 = a6.x;
  v20 = a3;
  v21 = a5;
  _validatedVNBarcodeSymbology(a4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    VNValidatedLog(4, (uint64_t)CFSTR("invalid barcode symbology"), v22, v23, v24, v25, v26, v27, (uint64_t)v34.receiver);
    v29 = 0;
    goto LABEL_5;
  }
  v34.receiver = self;
  v34.super_class = (Class)VNBarcodeObservation;
  v29 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:topLeft:topRight:bottomRight:bottomLeft:](&v34, sel_initWithOriginatingRequestSpecifier_topLeft_topRight_bottomRight_bottomLeft_, v20, v16, v15, v14, v13, v12, v11, x, y);
  if (v29)
  {
    v30 = objc_msgSend(v28, "copy");
    v31 = (void *)*((_QWORD *)v29 + 36);
    *((_QWORD *)v29 + 36) = v30;

    v32 = v21;
    self = (VNBarcodeObservation *)*((_QWORD *)v29 + 37);
    *((_QWORD *)v29 + 37) = v32;
LABEL_5:

  }
  return (VNBarcodeObservation *)v29;
}

- (VNBarcodeObservation)initWithOriginatingRequestSpecifier:(id)a3 symbology:(id)a4 descriptor:(id)a5 mrcDescriptor:(__MRCDescriptor *)a6 topLeft:(CGPoint)a7 topRight:(CGPoint)a8 bottomRight:(CGPoint)a9 bottomLeft:(CGPoint)a10
{
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v22;
  id v23;
  id v24;

  y = a10.y;
  x = a10.x;
  v12 = a9.y;
  v13 = a9.x;
  v14 = a8.y;
  v15 = a8.x;
  v16 = a7.y;
  v17 = a7.x;
  v22 = a3;
  v23 = a4;
  v24 = a5;
  if (a6)
  {
    self = -[VNBarcodeObservation initWithOriginatingRequestSpecifier:symbology:descriptor:topLeft:topRight:bottomRight:bottomLeft:](self, "initWithOriginatingRequestSpecifier:symbology:descriptor:topLeft:topRight:bottomRight:bottomLeft:", v22, v23, v24, v17, v16, v15, v14, v13, v12, x, y);
    if (self)
    {
      self->_mrcDescriptor = (__MRCDescriptor *)CFRetain(a6);
      -[VNBarcodeObservation _cacheMRCDescriptorValues](self, "_cacheMRCDescriptorValues");
      self = self;
      a6 = (__MRCDescriptor *)self;
    }
    else
    {
      a6 = 0;
    }
  }

  return (VNBarcodeObservation *)a6;
}

- (VNBarcodeObservation)initWithOriginatingRequestSpecifier:(id)a3 symbology:(id)a4 descriptor:(id)a5 boundingBox:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  objc_super v27;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  v14 = a5;
  _validatedVNBarcodeSymbology(a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    VNValidatedLog(4, (uint64_t)CFSTR("invalid barcode symbology"), v15, v16, v17, v18, v19, v20, (uint64_t)v27.receiver);
    v22 = 0;
    goto LABEL_5;
  }
  v27.receiver = self;
  v27.super_class = (Class)VNBarcodeObservation;
  v22 = -[VNRectangleObservation initWithOriginatingRequestSpecifier:boundingBox:](&v27, sel_initWithOriginatingRequestSpecifier_boundingBox_, v13, x, y, width, height);
  if (v22)
  {
    v23 = objc_msgSend(v21, "copy");
    v24 = (void *)*((_QWORD *)v22 + 36);
    *((_QWORD *)v22 + 36) = v23;

    v25 = v14;
    self = (VNBarcodeObservation *)*((_QWORD *)v22 + 37);
    *((_QWORD *)v22 + 37) = v25;
LABEL_5:

  }
  return (VNBarcodeObservation *)v22;
}

- (void)dealloc
{
  __MRCDescriptor *mrcDescriptor;
  objc_super v4;

  mrcDescriptor = self->_mrcDescriptor;
  if (mrcDescriptor)
    CFRelease(mrcDescriptor);
  v4.receiver = self;
  v4.super_class = (Class)VNBarcodeObservation;
  -[VNBarcodeObservation dealloc](&v4, sel_dealloc);
}

- (void)setMrcDescriptor:(__MRCDescriptor *)a3
{
  __MRCDescriptor *mrcDescriptor;

  mrcDescriptor = self->_mrcDescriptor;
  if (mrcDescriptor != a3)
  {
    if (mrcDescriptor)
    {
      CFRelease(mrcDescriptor);
      self->_mrcDescriptor = 0;
    }
    if (a3)
    {
      self->_mrcDescriptor = (__MRCDescriptor *)CFRetain(a3);
      -[VNBarcodeObservation _cacheMRCDescriptorValues](self, "_cacheMRCDescriptorValues");
    }
  }
}

- (void)_cacheMRCDescriptorValues
{
  NSData *v3;
  NSData *cachedPayloadData;
  NSNumber *v5;
  NSNumber *cachedAppClipCodeMetadataValue;
  NSNumber *v7;
  NSNumber *cachedIsColorInverted;
  NSNumber *v9;
  NSNumber *cachedIsGS1DataCarrier;
  NSData *v11;
  NSData *cachedSupplementalPayloadRawData;
  id v13;
  uint64_t v14;
  NSNumber *v15;
  NSNumber *cachedSupplementalCompositeType;
  id v17;

  if (self->_mrcDescriptor)
  {
    -[VNBarcodeObservation _cachePayloadAndSupplementalPayload](self, "_cachePayloadAndSupplementalPayload");
    v3 = (NSData *)MRCDescriptorCopyAttribute();
    cachedPayloadData = self->_cachedPayloadData;
    self->_cachedPayloadData = v3;

    v5 = (NSNumber *)MRCDescriptorCopyAttribute();
    cachedAppClipCodeMetadataValue = self->_cachedAppClipCodeMetadataValue;
    self->_cachedAppClipCodeMetadataValue = v5;

    v7 = (NSNumber *)MRCDescriptorCopyAttribute();
    cachedIsColorInverted = self->_cachedIsColorInverted;
    self->_cachedIsColorInverted = v7;

    v9 = (NSNumber *)MRCDescriptorCopyAttribute();
    cachedIsGS1DataCarrier = self->_cachedIsGS1DataCarrier;
    self->_cachedIsGS1DataCarrier = v9;

    v11 = (NSData *)MRCDescriptorCopyAttribute();
    cachedSupplementalPayloadRawData = self->_cachedSupplementalPayloadRawData;
    self->_cachedSupplementalPayloadRawData = v11;

    v17 = (id)MRCDescriptorCopyAttribute();
    switch(objc_msgSend(v17, "integerValue"))
    {
      case 2:
        v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v14 = 1;
        break;
      case 3:
        v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v14 = 2;
        break;
      case 4:
        v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v14 = 3;
        break;
      case 5:
        v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v14 = 4;
        break;
      default:
        v13 = objc_alloc(MEMORY[0x1E0CB37E8]);
        v14 = 0;
        break;
    }
    v15 = (NSNumber *)objc_msgSend(v13, "initWithInteger:", v14);
    cachedSupplementalCompositeType = self->_cachedSupplementalCompositeType;
    self->_cachedSupplementalCompositeType = v15;

  }
}

- (VNBarcodeObservation)initWithCoder:(id)a3
{
  id v4;
  VNBarcodeObservation *v5;
  void *v6;
  uint64_t v7;
  NSString *symbology;
  uint64_t v9;
  CIBarcodeDescriptor *barcodeDescriptor;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *acbsBarcodeInfo;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  VNBarcodeObservation *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)VNBarcodeObservation;
  v5 = -[VNRectangleObservation initWithCoder:](&v30, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbology"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    symbology = v5->_symbology;
    v5->_symbology = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("barcodeDescriptor"));
    v9 = objc_claimAutoreleasedReturnValue();
    barcodeDescriptor = v5->_barcodeDescriptor;
    v5->_barcodeDescriptor = (CIBarcodeDescriptor *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("ACBSBarcodeInfo"));
    v18 = objc_claimAutoreleasedReturnValue();
    acbsBarcodeInfo = v5->_acbsBarcodeInfo;
    v5->_acbsBarcodeInfo = (NSDictionary *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, v24, v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("MRCDescriptorAttributes"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      -[VNBarcodeObservation setMrcDescriptor:](v5, "setMrcDescriptor:", MRCDescriptorCreateWithAttributes());
    v28 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNBarcodeObservation;
  -[VNRectangleObservation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_symbology, CFSTR("symbology"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_barcodeDescriptor, CFSTR("barcodeDescriptor"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_acbsBarcodeInfo, CFSTR("ACBSBarcodeInfo"));
  if (self->_mrcDescriptor)
  {
    v5 = (const void *)MRCDescriptorCopyAttributes();
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MRCDescriptorAttributes"));
    CFRelease(v5);
  }

}

- (id)vn_cloneObject
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)VNBarcodeObservation;
  -[VNRectangleObservation vn_cloneObject](&v23, sel_vn_cloneObject);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NSString copy](self->_symbology, "copy");
    v5 = *(void **)(v3 + 288);
    *(_QWORD *)(v3 + 288) = v4;

    objc_storeStrong((id *)(v3 + 296), self->_barcodeDescriptor);
    objc_msgSend((id)v3, "setACBSBarcodeInfo:", self->_acbsBarcodeInfo);
    objc_msgSend((id)v3, "setMrcDescriptor:", self->_mrcDescriptor);
    v6 = -[NSString copy](self->_cachedPayloadStringValue, "copy");
    v7 = *(void **)(v3 + 224);
    *(_QWORD *)(v3 + 224) = v6;

    v8 = -[NSData copy](self->_cachedPayloadData, "copy");
    v9 = *(void **)(v3 + 232);
    *(_QWORD *)(v3 + 232) = v8;

    v10 = -[NSNumber copy](self->_cachedAppClipCodeMetadataValue, "copy");
    v11 = *(void **)(v3 + 240);
    *(_QWORD *)(v3 + 240) = v10;

    v12 = -[NSNumber copy](self->_cachedIsColorInverted, "copy");
    v13 = *(void **)(v3 + 248);
    *(_QWORD *)(v3 + 248) = v12;

    v14 = -[NSNumber copy](self->_cachedIsGS1DataCarrier, "copy");
    v15 = *(void **)(v3 + 256);
    *(_QWORD *)(v3 + 256) = v14;

    v16 = -[NSString copy](self->_cachedSupplementalPayload, "copy");
    v17 = *(void **)(v3 + 264);
    *(_QWORD *)(v3 + 264) = v16;

    v18 = -[NSData copy](self->_cachedSupplementalPayloadRawData, "copy");
    v19 = *(void **)(v3 + 280);
    *(_QWORD *)(v3 + 280) = v18;

    v20 = -[NSNumber copy](self->_cachedSupplementalCompositeType, "copy");
    v21 = *(void **)(v3 + 272);
    *(_QWORD *)(v3 + 272) = v20;

  }
  return (id)v3;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  __MRCDescriptor *mrcDescriptor;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VNBarcodeObservation;
  v3 = -[VNRectangleObservation hash](&v12, sel_hash);
  -[VNBarcodeObservation symbology](self, "symbology");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ __ROR8__(v3, 51);

  -[VNBarcodeObservation barcodeDescriptor](self, "barcodeDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") ^ __ROR8__(v5, 51);

  -[VNBarcodeObservation acbsBarcodeInfo](self, "acbsBarcodeInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") ^ __ROR8__(v7, 51);

  mrcDescriptor = self->_mrcDescriptor;
  if (mrcDescriptor)
    return CFHash(mrcDescriptor) ^ __ROR8__(v9, 51);
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  VNBarcodeObservation *v4;
  VNBarcodeObservation *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  __MRCDescriptor *v15;
  BOOL v16;
  objc_super v18;

  v4 = (VNBarcodeObservation *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)VNBarcodeObservation;
    if (-[VNRectangleObservation isEqual:](&v18, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNBarcodeObservation symbology](self, "symbology");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNBarcodeObservation symbology](v5, "symbology");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = VisionCoreEqualOrNilObjects();

      if (!v8)
        goto LABEL_12;
      -[VNBarcodeObservation barcodeDescriptor](self, "barcodeDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNBarcodeObservation barcodeDescriptor](v5, "barcodeDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = VisionCoreEqualOrNilObjects();

      if (!v11)
        goto LABEL_12;
      -[VNBarcodeObservation acbsBarcodeInfo](self, "acbsBarcodeInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNBarcodeObservation acbsBarcodeInfo](v5, "acbsBarcodeInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = VisionCoreEqualOrNilObjects();

      if (!v14)
        goto LABEL_12;
      v15 = -[VNBarcodeObservation mrcDescriptor](self, "mrcDescriptor");
      if (v15 == -[VNBarcodeObservation mrcDescriptor](v5, "mrcDescriptor")
        || CFEqual(-[VNBarcodeObservation mrcDescriptor](self, "mrcDescriptor"), -[VNBarcodeObservation mrcDescriptor](v5, "mrcDescriptor")))
      {
        v16 = 1;
      }
      else
      {
LABEL_12:
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)VNBarcodeObservation;
  -[VNDetectedObjectObservation description](&v20, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), self->_symbology);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VNBarcodeObservation barcodeDescriptor](self, "barcodeDescriptor");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" %@"), v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  -[VNBarcodeObservation payloadStringValue](self, "payloadStringValue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" (%@)"), v8);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }
  -[VNBarcodeObservation payloadData](self, "payloadData");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" (%@)"), v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
  }
  -[VNBarcodeObservation supplementalPayloadString](self, "supplementalPayloadString");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" (%@)"), v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v16;
  }
  -[VNBarcodeObservation supplementalPayloadData](self, "supplementalPayloadData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" (%@)"), v12);
    v18 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v18;
  }

  return v4;
}

- (void)_cachePayloadAndSupplementalPayload
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *cachedPayloadStringValue;
  NSString *cachedSupplementalPayload;
  CFStringRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (void *)MRCDescriptorDecodePayloadAndSupplementalPayload();
  v4 = v3;
  if (v3)
  {
    v5 = (NSString *)objc_msgSend(v3, "copy");
    cachedPayloadStringValue = self->_cachedPayloadStringValue;
    self->_cachedPayloadStringValue = v5;

    cachedSupplementalPayload = self->_cachedSupplementalPayload;
    self->_cachedSupplementalPayload = 0;

  }
  else
  {
    v8 = CFErrorCopyDescription(0);
    VNValidatedLog(4, (uint64_t)CFSTR("Could not decode payload from MRCDescriptor %@"), v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    CFRelease(v8);
  }

}

- (NSString)payloadStringValue
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *cachedPayloadStringValue;

  if (!self->_cachedPayloadStringValue)
  {
    if (self->_acbsBarcodeInfo)
    {
      v3 = (void *)ACBSCreateSymbolDescriptorFromBasicDescriptor();
      objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D834A8]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (NSString *)objc_msgSend(v4, "copy");
      cachedPayloadStringValue = self->_cachedPayloadStringValue;
      self->_cachedPayloadStringValue = v5;

    }
    else if (self->_mrcDescriptor)
    {
      -[VNBarcodeObservation _cachePayloadAndSupplementalPayload](self, "_cachePayloadAndSupplementalPayload");
    }
  }
  return self->_cachedPayloadStringValue;
}

- (BOOL)_propertyAllowedForRevision
{
  void *v2;
  char v3;

  -[VNObservation originatingRequestSpecifier](self, "originatingRequestSpecifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "specifiesRequestClass:revision:", objc_opt_class(), 4);

  return v3;
}

- (BOOL)isGS1DataCarrier
{
  NSNumber *cachedIsGS1DataCarrier;

  return -[VNBarcodeObservation _propertyAllowedForRevision](self, "_propertyAllowedForRevision")
      && (cachedIsGS1DataCarrier = self->_cachedIsGS1DataCarrier) != 0
      && -[NSNumber BOOLValue](cachedIsGS1DataCarrier, "BOOLValue");
}

- (NSString)supplementalPayloadString
{
  NSString *v3;

  if (-[VNBarcodeObservation _propertyAllowedForRevision](self, "_propertyAllowedForRevision"))
    v3 = self->_cachedSupplementalPayload;
  else
    v3 = 0;
  return v3;
}

- (NSData)supplementalPayloadData
{
  NSData *v3;

  if (-[VNBarcodeObservation _propertyAllowedForRevision](self, "_propertyAllowedForRevision"))
    v3 = self->_cachedSupplementalPayloadRawData;
  else
    v3 = 0;
  return v3;
}

- (VNBarcodeCompositeType)supplementalCompositeType
{
  NSNumber *cachedSupplementalCompositeType;

  if (-[VNBarcodeObservation _propertyAllowedForRevision](self, "_propertyAllowedForRevision")
    && (cachedSupplementalCompositeType = self->_cachedSupplementalCompositeType) != 0)
  {
    return -[NSNumber integerValue](cachedSupplementalCompositeType, "integerValue");
  }
  else
  {
    return 0;
  }
}

- (NSData)payloadData
{
  return self->_cachedPayloadData;
}

- (NSNumber)appClipCodeMetadataValue
{
  return self->_cachedAppClipCodeMetadataValue;
}

- (BOOL)isColorInverted
{
  NSNumber *cachedIsColorInverted;

  return -[VNBarcodeObservation _propertyAllowedForRevision](self, "_propertyAllowedForRevision")
      && (cachedIsColorInverted = self->_cachedIsColorInverted) != 0
      && -[NSNumber BOOLValue](cachedIsColorInverted, "BOOLValue");
}

- (id)getDataDetectorResults:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  VNDataDetectorResult *v15;
  VNDataDetectorResult *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  VNDataDetectorResult *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  -[VNBarcodeObservation payloadStringValue](self, "payloadStringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNObservation getDataDetectorResultsForString:error:](self, "getDataDetectorResultsForString:error:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v7 = (void *)getBCSDetectedCodeClass_softClass;
  v26 = getBCSDetectedCodeClass_softClass;
  if (!getBCSDetectedCodeClass_softClass)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __getBCSDetectedCodeClass_block_invoke;
    v22[3] = &unk_1E4548FA8;
    v22[4] = &v23;
    __getBCSDetectedCodeClass_block_invoke((uint64_t)v22);
    v7 = (void *)v24[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v23, 8);
  objc_msgSend(v8, "detectedCodeWithBarcodeObservation:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "setDetectedBarcodeSupportCode:", v9, (_QWORD)v18);
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      }
      while (v11);
    }
    v14 = v10;
  }
  else
  {
    v15 = [VNDataDetectorResult alloc];
    -[VNBarcodeObservation payloadStringValue](self, "payloadStringValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v16 = -[VNDataDetectorResult initWithBCSDetectedCode:description:observation:](v15, "initWithBCSDetectedCode:description:observation:", v9, v10, self);
    v27 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  kdebug_trace();
  return v14;
}

- (VNBarcodeSymbology)symbology
{
  return self->_symbology;
}

- (CIBarcodeDescriptor)barcodeDescriptor
{
  return self->_barcodeDescriptor;
}

- (NSDictionary)acbsBarcodeInfo
{
  return self->_acbsBarcodeInfo;
}

- (void)setACBSBarcodeInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (__MRCDescriptor)mrcDescriptor
{
  return self->_mrcDescriptor;
}

- (void)setMRCDescriptor:(__MRCDescriptor *)a3
{
  self->_mrcDescriptor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acbsBarcodeInfo, 0);
  objc_storeStrong((id *)&self->_barcodeDescriptor, 0);
  objc_storeStrong((id *)&self->_symbology, 0);
  objc_storeStrong((id *)&self->_cachedSupplementalPayloadRawData, 0);
  objc_storeStrong((id *)&self->_cachedSupplementalCompositeType, 0);
  objc_storeStrong((id *)&self->_cachedSupplementalPayload, 0);
  objc_storeStrong((id *)&self->_cachedIsGS1DataCarrier, 0);
  objc_storeStrong((id *)&self->_cachedIsColorInverted, 0);
  objc_storeStrong((id *)&self->_cachedAppClipCodeMetadataValue, 0);
  objc_storeStrong((id *)&self->_cachedPayloadData, 0);
  objc_storeStrong((id *)&self->_cachedPayloadStringValue, 0);
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNDetectBarcodesRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
