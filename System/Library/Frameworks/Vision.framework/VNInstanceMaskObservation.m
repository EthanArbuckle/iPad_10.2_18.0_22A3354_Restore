@implementation VNInstanceMaskObservation

- (VNInstanceMaskObservation)initWithOriginatingRequestSpecifier:(id)a3 lowResMask:(__CVBuffer *)a4 instanceMask:(__CVBuffer *)a5 numComponents:(unint64_t)a6 regionOfInterest:(CGRect)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  VNInstanceMaskObservation *v16;
  _VNLowResAlphaMask *v17;
  _VNLowResAlphaMask *lowResAlphaMask;
  objc_super v20;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v15 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VNInstanceMaskObservation;
  v16 = -[VNObservation initWithOriginatingRequestSpecifier:](&v20, sel_initWithOriginatingRequestSpecifier_, v15);
  if (v16)
  {
    v17 = -[_VNLowResAlphaMask initWithSingleAlphaMask:]([_VNLowResAlphaMask alloc], "initWithSingleAlphaMask:", a4);
    lowResAlphaMask = v16->_lowResAlphaMask;
    v16->_lowResAlphaMask = v17;

    v16->_instanceMask = CVPixelBufferRetain(a5);
    v16->_numComponents = a6;
    v16->_regionOfInterest.origin.x = x;
    v16->_regionOfInterest.origin.y = y;
    v16->_regionOfInterest.size.width = width;
    v16->_regionOfInterest.size.height = height;
  }

  return v16;
}

- (VNInstanceMaskObservation)initWithOriginatingRequestSpecifier:(id)a3 instanceLowResMaskArray:(id)a4 instanceMask:(__CVBuffer *)a5 numComponents:(unint64_t)a6 regionOfInterest:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  VNInstanceMaskObservation *v18;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v15 = a3;
  v16 = a4;
  v17 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  v18 = -[VNInstanceMaskObservation initWithOriginatingRequestSpecifier:instanceLowResMaskArray:instanceFeatureKeyIndexMap:instanceMask:numComponents:regionOfInterest:](self, "initWithOriginatingRequestSpecifier:instanceLowResMaskArray:instanceFeatureKeyIndexMap:instanceMask:numComponents:regionOfInterest:", v15, v16, v17, a5, a6, x, y, width, height);

  return v18;
}

- (VNInstanceMaskObservation)initWithOriginatingRequestSpecifier:(id)a3 instanceLowResMaskArray:(id)a4 instanceFeatureKeyIndexMap:(id)a5 instanceMask:(__CVBuffer *)a6 numComponents:(unint64_t)a7 regionOfInterest:(CGRect)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v17;
  id v18;
  id v19;
  VNInstanceMaskObservation *v20;
  _VNLowResAlphaMask *v21;
  _VNLowResAlphaMask *lowResAlphaMask;
  VNInstanceMaskObservation *v23;
  objc_super v25;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v25.receiver = self;
  v25.super_class = (Class)VNInstanceMaskObservation;
  v20 = -[VNObservation initWithOriginatingRequestSpecifier:](&v25, sel_initWithOriginatingRequestSpecifier_, v17);
  if (v20)
  {
    if (objc_msgSend(v18, "count") != a7 - 1)
    {
      v23 = 0;
      goto LABEL_6;
    }
    v21 = -[_VNLowResAlphaMask initWithAlphaMaskArray:]([_VNLowResAlphaMask alloc], "initWithAlphaMaskArray:", v18);
    lowResAlphaMask = v20->_lowResAlphaMask;
    v20->_lowResAlphaMask = v21;

    v20->_instanceMask = CVPixelBufferRetain(a6);
    v20->_numComponents = a7;
    v20->_regionOfInterest.origin.x = x;
    v20->_regionOfInterest.origin.y = y;
    v20->_regionOfInterest.size.width = width;
    v20->_regionOfInterest.size.height = height;
    objc_storeStrong((id *)&v20->_instanceSegmentationMaskFeatureMap, a5);
  }
  v23 = v20;
LABEL_6:

  return v23;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_instanceMask);
  self->_instanceMask = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNInstanceMaskObservation;
  -[VNInstanceMaskObservation dealloc](&v3, sel_dealloc);
}

- (VNInstanceMaskObservation)initWithCoder:(id)a3
{
  id v4;
  VNInstanceMaskObservation *v5;
  VNInstanceMaskObservation *v6;
  __CVBuffer *v7;
  _VNLowResAlphaMask *v8;
  _VNLowResAlphaMask *lowResAlphaMask;
  uint64_t v10;
  _VNLowResAlphaMask *v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  VNInstanceMaskObservation *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VNInstanceMaskObservation;
  v5 = -[VNObservation initWithCoder:](&v19, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("lowResMask")))
    {
      v7 = (__CVBuffer *)objc_msgSend(v4, "vn_decodePixelBufferForKey:", CFSTR("lowResMask"));
      v8 = -[_VNLowResAlphaMask initWithSingleAlphaMask:]([_VNLowResAlphaMask alloc], "initWithSingleAlphaMask:", v7);
      lowResAlphaMask = v5->_lowResAlphaMask;
      v5->_lowResAlphaMask = v8;

      CVPixelBufferRelease(v7);
    }
    else
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lowAlphaResMask"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v5->_lowResAlphaMask;
      v5->_lowResAlphaMask = (_VNLowResAlphaMask *)v10;

    }
    v12 = objc_msgSend(v4, "vn_decodePixelBufferForKey:", CFSTR("instanceMask"));
    v5->_instanceMask = (__CVBuffer *)v12;
    if (!v12)
    {
      v17 = 0;
      goto LABEL_9;
    }
    v5->_numComponents = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("numComponents"));
    objc_msgSend(v4, "vn_decodeRectForKey:", CFSTR("regionOfInterest"));
    v5->_regionOfInterest.origin.x = v13;
    v5->_regionOfInterest.origin.y = v14;
    v5->_regionOfInterest.size.width = v15;
    v5->_regionOfInterest.size.height = v16;
  }
  v17 = v5;
LABEL_9:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNInstanceMaskObservation;
  -[VNObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_lowResAlphaMask, CFSTR("lowAlphaResMask"));
  objc_msgSend(v4, "vn_encodePixelBuffer:forKey:", self->_instanceMask, CFSTR("instanceMask"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_numComponents, CFSTR("numComponents"));
  objc_msgSend(v4, "vn_encodeRect:forKey:", CFSTR("regionOfInterest"), self->_regionOfInterest.origin.x, self->_regionOfInterest.origin.y, self->_regionOfInterest.size.width, self->_regionOfInterest.size.height);

}

- (unint64_t)hash
{
  unint64_t v3;
  double x;
  double y;
  uint64_t v6;
  double width;
  uint64_t v8;
  double height;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VNInstanceMaskObservation;
  v3 = self->_numComponents ^ __ROR8__(+[VNCVPixelBufferConversionHelpers computeHashForCVPixelBuffer:](VNCVPixelBufferConversionHelpers, "computeHashForCVPixelBuffer:", self->_instanceMask) ^ __ROR8__(+[_VNLowResAlphaMask hash](_VNLowResAlphaMask, "hash") ^ __ROR8__(-[VNObservation hash](&v11, sel_hash), 51), 51), 51);
  x = self->_regionOfInterest.origin.x;
  if (x == 0.0)
    x = 0.0;
  y = self->_regionOfInterest.origin.y;
  if (y == 0.0)
    y = 0.0;
  v6 = *(_QWORD *)&y ^ __ROR8__(*(_QWORD *)&x, 51);
  width = self->_regionOfInterest.size.width;
  if (width == 0.0)
    width = 0.0;
  v8 = *(_QWORD *)&width ^ __ROR8__(v6, 51);
  height = self->_regionOfInterest.size.height;
  if (height == 0.0)
    height = 0.0;
  return *(_QWORD *)&height ^ __ROR8__(v8, 51) ^ __ROR8__(v3, 51);
}

- (BOOL)isEqual:(id)a3
{
  VNInstanceMaskObservation *v4;
  VNInstanceMaskObservation *v5;
  BOOL v6;

  v4 = (VNInstanceMaskObservation *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[_VNLowResAlphaMask isEqual:](self->_lowResAlphaMask, "isEqual:", v5->_lowResAlphaMask)
        && +[VNCVPixelBufferConversionHelpers isCVPixelBuffer:equalToCVPixelBuffer:](VNCVPixelBufferConversionHelpers, "isCVPixelBuffer:equalToCVPixelBuffer:", self->_instanceMask, v5->_instanceMask)&& self->_numComponents == v5->_numComponents&& CGRectEqualToRect(self->_regionOfInterest, v5->_regionOfInterest);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  __CFString *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v7.receiver = self;
  v7.super_class = (Class)VNInstanceMaskObservation;
  -[VNObservation description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  v5 = (__CFString *)CFCopyDescription(self->_instanceMask);
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ %ld"), v5, self->_numComponents);

  return v3;
}

- (id)vn_cloneObject
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  CGSize size;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNInstanceMaskObservation;
  -[VNObservation vn_cloneObject](&v8, sel_vn_cloneObject);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[_VNLowResAlphaMask copy](self->_lowResAlphaMask, "copy");
    v5 = *(void **)(v3 + 96);
    *(_QWORD *)(v3 + 96) = v4;

    *(_QWORD *)(v3 + 104) = CVPixelBufferRetain(self->_instanceMask);
    size = self->_regionOfInterest.size;
    *(CGPoint *)(v3 + 120) = self->_regionOfInterest.origin;
    *(CGSize *)(v3 + 136) = size;
    *(_QWORD *)(v3 + 112) = self->_numComponents;
  }
  return (id)v3;
}

- (id)vn_deepCloneObjectWithError:(id *)a3
{
  uint64_t v5;
  __CVBuffer *instanceMask;
  int Width;
  size_t Height;
  OSType PixelFormatType;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  uint64_t v12;
  id v13;
  size_t BytesPerRow;
  void *BaseAddress;
  void *v16;
  CVBufferRef v17;
  uint64_t v18;
  void *v19;
  CGSize size;
  objc_super v22;
  CVBufferRef buffer;

  v22.receiver = self;
  v22.super_class = (Class)VNInstanceMaskObservation;
  -[VNObservation vn_cloneObject](&v22, sel_vn_cloneObject);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_11;
  instanceMask = self->_instanceMask;
  objc_opt_self();
  Width = CVPixelBufferGetWidth(instanceMask);
  Height = CVPixelBufferGetHeight(instanceMask);
  PixelFormatType = CVPixelBufferGetPixelFormatType(instanceMask);
  CVPixelBufferGetAttributes();
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = CVBufferCopyAttachments(instanceMask, kCVAttachmentMode_ShouldNotPropagate);
  buffer = 0;
  v12 = VNCVPixelBufferCreateUsingIOSurface(Width, (int)Height, PixelFormatType, v10, &buffer);
  if (!(_DWORD)v12)
  {
    if (v11)
      CVBufferSetAttachments(buffer, v11, kCVAttachmentMode_ShouldNotPropagate);
    CVPixelBufferLockBaseAddress(buffer, 0);
    CVPixelBufferLockBaseAddress(instanceMask, 0);
    BytesPerRow = CVPixelBufferGetBytesPerRow(instanceMask);
    BaseAddress = CVPixelBufferGetBaseAddress(instanceMask);
    v16 = CVPixelBufferGetBaseAddress(buffer);
    memcpy(BaseAddress, v16, (uint64_t)((Height << 32) * BytesPerRow) >> 32);
    CVPixelBufferUnlockBaseAddress(instanceMask, 0);
    CVPixelBufferUnlockBaseAddress(buffer, 0);
    v17 = buffer;

    if (!v17)
      goto LABEL_6;
    *(_QWORD *)(v5 + 104) = v17;
    v18 = -[_VNLowResAlphaMask copy](self->_lowResAlphaMask, "copy");
    v19 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v18;

    size = self->_regionOfInterest.size;
    *(CGPoint *)(v5 + 120) = self->_regionOfInterest.origin;
    *(CGSize *)(v5 + 136) = size;
    *(_QWORD *)(v5 + 112) = self->_numComponents;
LABEL_11:
    v13 = (id)v5;
    goto LABEL_12;
  }
  if (a3)
  {
    +[VNError errorForCVReturnCode:localizedDescription:](VNError, "errorForCVReturnCode:localizedDescription:", v12, CFSTR("failed to create pixel buffer"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  v13 = 0;
LABEL_12:

  return v13;
}

- (__CVBuffer)createMattedImageOfInstances:(id)a3 fromRequestHandler:(id)a4 croppedToInstancesExtent:(BOOL)a5 error:(id *)a6
{
  return -[VNInstanceMaskObservation generateMaskedImageOfInstances:fromRequestHandler:inPlace:croppedToInstancesExtent:error:](self, "generateMaskedImageOfInstances:fromRequestHandler:inPlace:croppedToInstancesExtent:error:", a3, a4, 0, a5, a6);
}

- (NSIndexSet)allInstances
{
  unint64_t numComponents;

  numComponents = self->_numComponents;
  if (numComponents > 1)
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 1, numComponents - 1);
  else
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
  return (NSIndexSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (CVPixelBufferRef)generateMaskForInstances:(NSIndexSet *)instances error:(NSError *)error
{
  _BOOL4 v6;
  NSIndexSet *v7;
  VNInstanceMaskObservation *v8;
  __CVBuffer *v9;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  uint64_t v13;
  size_t v14;
  size_t v15;
  void *v16;
  __CVBuffer *v17;
  __CVBuffer *v18;
  size_t v19;
  size_t v20;
  OSType v21;
  uint64_t UsingIOSurface;
  size_t v23;
  size_t v24;
  int v25;
  unint64_t numComponents;
  unint64_t v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSIndexSet *v32;
  _BYTE *BaseAddress;
  size_t BytesPerRow;
  size_t v35;
  size_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t i;
  int v43;
  uint64_t j;
  float *v45;
  size_t v46;
  size_t v47;
  size_t v48;
  size_t v49;
  char *v50;
  _VNLowResAlphaMask *lowResAlphaMask;
  uint64_t v52;
  NSIndexSet *v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  __CVBuffer *v57;
  char *v58;
  uint64_t k;
  float *v60;
  float *v61;
  size_t v62;
  float v63;
  float v64;
  _BOOL4 v65;
  uint64_t v66;
  float *v67;
  size_t v68;
  VNInstanceMaskObservation *v70;
  NSIndexSet *v71;
  unsigned __int8 v72;
  void *__p[3];
  CVPixelBufferRef pixelBuffer;

  v71 = instances;
  if (v71)
  {
    v6 = -[_VNLowResAlphaMask isSingleMask](self->_lowResAlphaMask, "isSingleMask");
    v7 = v71;
    if (v6)
    {
      pixelBuffer = 0;
      v8 = self;
      v9 = -[_VNLowResAlphaMask _alphaMaskAtIndex:](self->_lowResAlphaMask, "_alphaMaskAtIndex:", 0);
      Width = CVPixelBufferGetWidth(v9);
      Height = CVPixelBufferGetHeight(v9);
      PixelFormatType = CVPixelBufferGetPixelFormatType(v9);
      v13 = VNCVPixelBufferCreateUsingIOSurface(Width, Height, PixelFormatType, 0, &pixelBuffer);
      if (!(_DWORD)v13)
      {
        CVPixelBufferLockBaseAddress(self->_instanceMask, 1uLL);
        CVPixelBufferLockBaseAddress(v9, 1uLL);
        CVPixelBufferLockBaseAddress(pixelBuffer, 0);
        v25 = -[NSIndexSet containsIndex:](v7, "containsIndex:", 0);
        numComponents = self->_numComponents;
        v72 = 0;
        std::vector<BOOL>::vector(__p, numComponents, &v72);
        if (self->_numComponents >= 2)
        {
          v27 = 1;
          do
          {
            v28 = -[NSIndexSet containsIndex:](v7, "containsIndex:", v27);
            v29 = v27 >> 6;
            v30 = 1 << v27;
            if (v25 == v28)
              v31 = *((_QWORD *)__p[0] + v29) & ~v30;
            else
              v31 = *((_QWORD *)__p[0] + v29) | v30;
            *((_QWORD *)__p[0] + v29) = v31;
            ++v27;
          }
          while (v27 < self->_numComponents);
        }
        v32 = v7;
        BaseAddress = CVPixelBufferGetBaseAddress(v8->_instanceMask);
        BytesPerRow = CVPixelBufferGetBytesPerRow(v9);
        v35 = CVPixelBufferGetHeight(v9);
        v36 = CVPixelBufferGetWidth(v9);
        v37 = (char *)CVPixelBufferGetBaseAddress(v9);
        v38 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
        if (v35)
        {
          v39 = 0;
          v40 = (char *)__p[0];
          v41 = v38;
          do
          {
            if (v36)
            {
              for (i = 0; i != v36; ++i)
              {
                if (((*(_QWORD *)&v40[((unint64_t)BaseAddress[i] >> 3) & 0x18] >> BaseAddress[i]) & 1) != 0)
                  v43 = *(_DWORD *)&v37[4 * i];
                else
                  v43 = 0;
                *(_DWORD *)&v41[4 * i] = v43;
              }
            }
            ++v39;
            v41 += BytesPerRow;
            v37 += BytesPerRow;
            BaseAddress += v36;
          }
          while (v39 != v35);
          if (v25)
          {
            for (j = 0; j != v35; ++j)
            {
              if (v36)
              {
                v45 = (float *)&v38[j * BytesPerRow];
                v46 = v36;
                do
                {
                  *v45 = 1.0 - *v45;
                  ++v45;
                  --v46;
                }
                while (v46);
              }
            }
          }
        }
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
        CVPixelBufferUnlockBaseAddress(v8->_instanceMask, 1uLL);
        CVPixelBufferUnlockBaseAddress(v9, 1uLL);
        v17 = pixelBuffer;
        v7 = v32;
        if (__p[0])
          operator delete(__p[0]);
        goto LABEL_62;
      }
      if (error)
      {
        v14 = CVPixelBufferGetWidth(v9);
        v15 = CVPixelBufferGetHeight(v9);
        +[VNError errorForCVReturnCode:width:height:pixelFormat:localizedDescription:](VNError, "errorForCVReturnCode:width:height:pixelFormat:localizedDescription:", v13, v14, v15, CVPixelBufferGetPixelFormatType(v9), CFSTR("failed to create the combined mask for instances buffer"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v17 = 0;
        *error = (NSError *)v16;
LABEL_62:

        goto LABEL_63;
      }
    }
    else
    {
      __p[0] = 0;
      v70 = self;
      v18 = -[_VNLowResAlphaMask _alphaMaskAtIndex:](self->_lowResAlphaMask, "_alphaMaskAtIndex:", 0);
      v19 = CVPixelBufferGetWidth(v18);
      v20 = CVPixelBufferGetHeight(v18);
      v21 = CVPixelBufferGetPixelFormatType(v18);
      UsingIOSurface = VNCVPixelBufferCreateUsingIOSurface(v19, v20, v21, 0, (CVPixelBufferRef *)__p);
      if (!(_DWORD)UsingIOSurface)
      {
        CVPixelBufferLockBaseAddress((CVPixelBufferRef)__p[0], 0);
        v47 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)__p[0]);
        v48 = CVPixelBufferGetHeight((CVPixelBufferRef)__p[0]);
        v49 = CVPixelBufferGetWidth((CVPixelBufferRef)__p[0]);
        v50 = (char *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)__p[0]);
        bzero(v50, v48 * v47);
        lowResAlphaMask = self->_lowResAlphaMask;
        if (lowResAlphaMask)
          v52 = -[NSArray count](lowResAlphaMask->_instanceLowResMaskArray, "count");
        else
          v52 = 0;
        v53 = v7;
        v54 = -[NSIndexSet containsIndex:](v7, "containsIndex:", 0);
        if (v52)
        {
          v55 = 0;
          do
          {
            v56 = v55 + 1;
            if (v54 != -[NSIndexSet containsIndex:](v53, "containsIndex:", v55 + 1))
            {
              v57 = -[_VNLowResAlphaMask _alphaMaskAtIndex:](v70->_lowResAlphaMask, "_alphaMaskAtIndex:", v55);
              CVPixelBufferLockBaseAddress(v57, 1uLL);
              v58 = (char *)CVPixelBufferGetBaseAddress(v57);
              if (v48)
              {
                for (k = 0; k != v48; ++k)
                {
                  if (v49)
                  {
                    v60 = (float *)&v50[k * v47];
                    v61 = (float *)&v58[k * v47];
                    v62 = v49;
                    do
                    {
                      v63 = *v61++;
                      v64 = v63 + *v60;
                      if (v64 >= 1.0)
                        v64 = 1.0;
                      *v60++ = v64;
                      --v62;
                    }
                    while (v62);
                  }
                }
              }
              CVPixelBufferUnlockBaseAddress(v57, 1uLL);
            }
            v55 = v56;
          }
          while (v56 != v52);
        }
        if (v48)
          v65 = v54;
        else
          v65 = 0;
        if (v65)
        {
          v66 = 0;
          do
          {
            if (v49)
            {
              v67 = (float *)&v50[v66 * v47];
              v68 = v49;
              do
              {
                *v67 = 1.0 - *v67;
                ++v67;
                --v68;
              }
              while (v68);
            }
            ++v66;
          }
          while (v66 != v48);
        }
        CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)__p[0], 0);
        v17 = (__CVBuffer *)__p[0];
        v7 = v53;
        goto LABEL_62;
      }
      if (error)
      {
        v23 = CVPixelBufferGetWidth(v18);
        v24 = CVPixelBufferGetHeight(v18);
        +[VNError errorForCVReturnCode:width:height:pixelFormat:localizedDescription:](VNError, "errorForCVReturnCode:width:height:pixelFormat:localizedDescription:", UsingIOSurface, v23, v24, CVPixelBufferGetPixelFormatType(v18), CFSTR("failed to create the combined mask for instances buffer"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    v17 = 0;
    goto LABEL_62;
  }
  if (error)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("instances"));
    v17 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
LABEL_63:

  return v17;
}

- (CVPixelBufferRef)generateMaskedImageOfInstances:(NSIndexSet *)instances fromRequestHandler:(VNImageRequestHandler *)requestHandler croppedToInstancesExtent:(BOOL)cropResult error:(NSError *)error
{
  return -[VNInstanceMaskObservation generateMaskedImageOfInstances:fromRequestHandler:inPlace:croppedToInstancesExtent:error:](self, "generateMaskedImageOfInstances:fromRequestHandler:inPlace:croppedToInstancesExtent:error:", instances, requestHandler, 0, cropResult, error);
}

- (CVPixelBufferRef)generateScaledMaskForImageForInstances:(NSIndexSet *)instances fromRequestHandler:(VNImageRequestHandler *)requestHandler error:(NSError *)error
{
  NSIndexSet *v8;
  VNImageRequestHandler *v9;
  VNImageRequestHandler *v10;
  void *v11;

  v8 = instances;
  v9 = requestHandler;
  v10 = v9;
  if (self)
  {
    if (v9)
    {
      -[VNImageRequestHandler imageBuffer](v9, "imageBuffer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[VNInstanceMaskObservation generateScaledMaskForImageForInstances:imageBuffer:croppedToInstancesExtent:error:](self, "generateScaledMaskForImageForInstances:imageBuffer:croppedToInstancesExtent:error:", v8, v11, 0, error);

    }
    else if (error)
    {
      +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("requestHandler"));
      self = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      self = 0;
    }
  }

  return (CVPixelBufferRef)self;
}

- (__CVBuffer)generateScaledMaskForImageForInstances:(id)a3 imageBuffer:(id)a4 croppedToInstancesExtent:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  double y;
  double x;
  double height;
  double width;
  unint64_t v17;
  unint64_t v18;
  __CVBuffer *v19;
  __CVBuffer *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  size_t v25;
  size_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  uint64_t v33;
  CGRect v34;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (v10)
  {
    -[VNInstanceMaskObservation _maskProductionResourcesAndReturnError:](self, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v33 = 0;
      x = self->_regionOfInterest.origin.x;
      y = self->_regionOfInterest.origin.y;
      width = self->_regionOfInterest.size.width;
      height = self->_regionOfInterest.size.height;
      v17 = objc_msgSend(v11, "width");
      v18 = objc_msgSend(v11, "height");
      v19 = (__CVBuffer *)objc_msgSend(v11, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(width * (double)v17), (unint64_t)(height * (double)v18), 1111970369, 0, a6, x * (double)v17, y * (double)v18);
      if (v19)
      {
        v20 = -[VNInstanceMaskObservation generateMaskForInstances:error:](self, "generateMaskForInstances:error:", v10, a6);
        if (v20)
        {
          v33 = -[VNInstanceMaskObservation _upsampleLowResMask:reference:maskProductionResources:error:]((uint64_t)self, (uint64_t)v20, (uint64_t)v19, v12, (uint64_t)a6);
          if (!v7)
            goto LABEL_12;
          v34.origin.x = calculateCropSizeOfPixelBuffer(v20, a6, 0.0);
          v21 = v34.origin.x;
          v22 = v34.origin.y;
          v23 = v34.size.width;
          v24 = v34.size.height;
          if (CGRectIsNull(v34))
            goto LABEL_18;
          v25 = CVPixelBufferGetWidth(v20);
          v26 = CVPixelBufferGetHeight(v20);
          v27 = 0.0;
          v28 = 0.0;
          v29 = 0.0;
          if (v25)
          {
            v28 = v21 / (double)v25;
            v29 = v23 / (double)v25;
          }
          v30 = 0.0;
          if (v26)
          {
            v27 = v22 / (double)v26;
            v30 = v24 / (double)v26;
          }
          if (!-[VNInstanceMaskObservation _cropInOutPixelBuffer:normalizedBoundingBox:maskProductionResources:returnCropRect:error:]((uint64_t)self, (CVPixelBufferRef *)&v33, v12, 0, a6, v28, v27, v29, v30))LABEL_18:v31 = 1;
          else
LABEL_12:
            v31 = 0;
          CVPixelBufferRelease(v20);
        }
        else
        {
          v31 = 2;
        }
        CVPixelBufferRelease(v19);
        if (v31)
          v19 = 0;
        else
          v19 = (__CVBuffer *)v33;
      }
    }
    else
    {
      v19 = 0;
    }

  }
  else if (a6)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("instances"));
    v19 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (__CVBuffer)generateMaskedImageOfInstances:(id)a3 fromRequestHandler:(id)a4 inPlace:(BOOL)a5 croppedToInstancesExtent:(BOOL)a6 error:(id *)a7
{
  return -[VNInstanceMaskObservation generateMaskedImageOfInstances:fromRequestHandler:inPlace:croppedToInstancesExtent:returnCropRect:error:](self, "generateMaskedImageOfInstances:fromRequestHandler:inPlace:croppedToInstancesExtent:returnCropRect:error:", a3, a4, a5, a6, 0, a7);
}

- (__CVBuffer)generateMaskedImageOfInstances:(id)a3 imageBuffer:(id)a4 inPlace:(BOOL)a5 croppedToInstancesExtent:(BOOL)a6 error:(id *)a7
{
  return -[VNInstanceMaskObservation generateMaskedImageOfInstances:imageBuffer:inPlace:croppedToInstancesExtent:returnCropRect:error:]((uint64_t)self, a3, a4, a5, a6, 0, a7);
}

- (__CVBuffer)generateMaskedImageOfInstances:(id)a3 fromRequestHandler:(id)a4 inPlace:(BOOL)a5 croppedToInstancesExtent:(BOOL)a6 returnCropRect:(CGRect *)a7 error:(id *)a8
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v14;
  id v15;
  void *v16;
  void *v17;
  __CVBuffer *v18;

  v10 = a6;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "imageBuffer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[VNInstanceMaskObservation generateMaskedImageOfInstances:imageBuffer:inPlace:croppedToInstancesExtent:returnCropRect:error:]((uint64_t)self, v14, v17, v11, v10, &a7->origin.x, a8);

  }
  else if (a8)
  {
    +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("requestHandler"));
    v18 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)instanceAtPoint:(CGPoint)a3 error:(id *)a4
{
  CGFloat y;
  CGFloat x;
  __CVBuffer *v8;
  size_t Height;
  double v10;
  double v11;
  uint64_t v12;
  size_t v13;
  size_t v14;
  __CVBuffer *v15;
  __CVBuffer *v16;
  size_t v17;
  float v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  CGPoint v24;
  CGRect v25;

  y = a3.y;
  x = a3.x;
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = 1.0;
  v25.size.height = 1.0;
  v24.x = x;
  v24.y = y;
  if (CGRectContainsPoint(v25, v24))
  {
    v8 = -[VNInstanceMaskObservation instanceMask](self, "instanceMask");
    CVPixelBufferGetWidth(v8);
    Height = CVPixelBufferGetHeight(v8);
    VisionCoreImagePointForNormalizedPoint();
    if (self->_numComponents == 1)
    {
LABEL_9:
      v19 = objc_alloc(MEMORY[0x1E0CB36B8]);
      v20 = 0;
    }
    else
    {
      v12 = 0;
      v13 = (int)v10;
      v14 = (int)((double)Height - v11);
      while (1)
      {
        v15 = -[_VNLowResAlphaMask _alphaMaskAtIndex:](self->_lowResAlphaMask, "_alphaMaskAtIndex:", v12);
        if (((v13 | v14) & 0x80000000) == 0)
        {
          v16 = v15;
          if (CVPixelBufferGetWidth(v15) > v13 && CVPixelBufferGetHeight(v16) > v14)
          {
            CVPixelBufferLockBaseAddress(v16, 1uLL);
            v17 = CVPixelBufferGetBytesPerRow(v16) >> 2;
            v18 = *((float *)CVPixelBufferGetBaseAddress(v16) + (int)v17 * (int)v14 + v13);
            CVPixelBufferUnlockBaseAddress(v16, 0);
            if (v18 != 0.0)
              break;
          }
        }
        if (self->_numComponents - 1 <= ++v12)
          goto LABEL_9;
      }
      v19 = objc_alloc(MEMORY[0x1E0CB36B8]);
      v20 = (v12 + 1);
    }
    v21 = (void *)objc_msgSend(v19, "initWithIndex:", v20);
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" pointOfInterest value is out of bounds: %f,%f"), *(_QWORD *)&x, *(_QWORD *)&y);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 4, v22);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v21 = 0;
  }
  return v21;
}

- (id)instancesForFeature:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  int v9;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (self->_numComponents != 1)
  {
    v7 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_instanceSegmentationMaskFeatureMap, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", v5);

      ++v7;
      if (v9)
        objc_msgSend(v6, "addIndex:", v7);
    }
    while (self->_numComponents - 1 > v7);
  }

  return v6;
}

- (CVPixelBufferRef)instanceMask
{
  return self->_instanceMask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceSegmentationMaskFeatureMap, 0);
  objc_storeStrong((id *)&self->_maskProductionResources_DO_NOT_DIRECTLY_ACCESS, 0);
  objc_storeStrong((id *)&self->_lowResAlphaMask, 0);
}

- (CVPixelBufferRef)generateMaskedImageOfInstances:(void *)a3 imageBuffer:(int)a4 inPlace:(int)a5 croppedToInstancesExtent:(double *)a6 returnCropRect:(_QWORD *)a7 error:
{
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  void *v25;
  CVPixelBufferRef v26;
  id v27;
  void *v28;
  double x;
  double y;
  double width;
  double height;
  size_t v33;
  size_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  int v43;
  void *v44;
  _QWORD aBlock[4];
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  char v59;
  BOOL v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  CVPixelBufferRef *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  CGRect v81;
  CGRect v82;

  v13 = a2;
  v14 = a3;
  v15 = v14;
  if (!a1)
    goto LABEL_12;
  if (v13)
  {
    if (v14)
    {
      -[VNInstanceMaskObservation _maskProductionResourcesAndReturnError:]((void *)a1, a7);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (!v16)
      {
        v26 = 0;
LABEL_36:

        goto LABEL_37;
      }
      v44 = (void *)v16;
      v19 = *(double *)(a1 + 120);
      v18 = *(double *)(a1 + 128);
      v21 = *(double *)(a1 + 136);
      v20 = *(double *)(a1 + 144);
      v22 = objc_msgSend(v15, "width");
      v23 = objc_msgSend(v15, "height");
      v43 = a5;
      if (a4)
      {
        v82.origin.x = 0.0;
        v82.origin.y = 0.0;
        v82.size.width = 1.0;
        v82.size.height = 1.0;
        v24 = !CGRectEqualToRect(*(CGRect *)(a1 + 120), v82);
      }
      else
      {
        v24 = 0;
      }
      v77 = 0;
      v78 = &v77;
      v79 = 0x2020000000;
      v80 = 0;
      v73 = 0;
      v74 = &v73;
      v75 = 0x2020000000;
      v76 = 0;
      v69 = 0;
      v70 = &v69;
      v71 = 0x2020000000;
      v72 = 0;
      v65 = 0;
      v66 = (CVPixelBufferRef *)&v65;
      v67 = 0x2020000000;
      v68 = 0;
      v61 = 0;
      v62 = &v61;
      v63 = 0x2020000000;
      v64 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __126__VNInstanceMaskObservation_generateMaskedImageOfInstances_imageBuffer_inPlace_croppedToInstancesExtent_returnCropRect_error___block_invoke;
      aBlock[3] = &unk_1E4543970;
      v59 = a4;
      v50 = &v77;
      v55 = v19 * (double)v22;
      v56 = v18 * (double)v23;
      v57 = v21 * (double)v22;
      v58 = v20 * (double)v23;
      v51 = &v73;
      v46 = v15;
      v47 = a1;
      v60 = v24;
      v48 = v13;
      v52 = &v69;
      v17 = v44;
      v27 = v44;
      v49 = v27;
      v53 = &v65;
      v54 = &v61;
      v28 = _Block_copy(aBlock);
      if ((VNExecuteBlock(v28, (uint64_t)a7) & 1) == 0)
        goto LABEL_29;
      if (v43)
      {
        v81.origin.x = calculateCropSizeOfPixelBuffer((__CVBuffer *)v74[3], a7, 0.1);
        x = v81.origin.x;
        y = v81.origin.y;
        width = v81.size.width;
        height = v81.size.height;
        if (CGRectIsNull(v81))
          goto LABEL_29;
        v33 = CVPixelBufferGetWidth((CVPixelBufferRef)v74[3]);
        v34 = CVPixelBufferGetHeight((CVPixelBufferRef)v74[3]);
        v35 = 0.0;
        v36 = 0.0;
        v37 = 0.0;
        if (v33)
        {
          v36 = x / (double)v33;
          v37 = width / (double)v33;
        }
        if (v34)
        {
          v35 = y / (double)v34;
          v38 = height / (double)v34;
        }
        else
        {
          v38 = 0.0;
        }
      }
      else
      {
        v37 = 1.0;
        v36 = 0.0;
        v35 = 0.0;
        v38 = 1.0;
      }
      if (*((_BYTE *)v62 + 24))
      {
        objc_msgSend(v27, "completionSemaphore");
        v39 = objc_claimAutoreleasedReturnValue();
        dispatch_semaphore_wait(v39, 0xFFFFFFFFFFFFFFFFLL);

      }
      if (!v43
        || (a4 & 1) != 0
        || -[VNInstanceMaskObservation _cropInOutPixelBuffer:normalizedBoundingBox:maskProductionResources:returnCropRect:error:](a1, v66 + 3, v27, a6, a7, v36, v35, v37, v38))
      {
        v40 = 1;
LABEL_30:
        if (*((_BYTE *)v62 + 24))
        {
          objc_msgSend(v27, "completionSemaphore");
          v41 = objc_claimAutoreleasedReturnValue();
          dispatch_semaphore_wait(v41, 0);

        }
        CVPixelBufferRelease((CVPixelBufferRef)v70[3]);
        v70[3] = 0;
        CVPixelBufferRelease((CVPixelBufferRef)v74[3]);
        v74[3] = 0;
        CVPixelBufferRelease((CVPixelBufferRef)v78[3]);
        v78[3] = 0;
        if (v40)
          v26 = v66[3];
        else
          v26 = 0;

        _Block_object_dispose(&v61, 8);
        _Block_object_dispose(&v65, 8);
        _Block_object_dispose(&v69, 8);
        _Block_object_dispose(&v73, 8);
        _Block_object_dispose(&v77, 8);
        goto LABEL_36;
      }
LABEL_29:
      v40 = 0;
      goto LABEL_30;
    }
    if (a7)
    {
      +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("imageBuffer"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_12:
    v26 = 0;
    goto LABEL_37;
  }
  if (!a7)
    goto LABEL_12;
  +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", 0, CFSTR("instances"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v26 = 0;
  *a7 = v25;
LABEL_37:

  return v26;
}

- (id)_maskProductionResourcesAndReturnError:(void *)a1
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  dispatch_semaphore_t v16;
  void *v17;
  VNBGRBilinearUpsampler *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  id v26;

  if (!a1)
  {
    v26 = 0;
    return v26;
  }
  v3 = a1;
  objc_sync_enter(v3);
  v4 = (void *)v3[19];
  if (v4)
    goto LABEL_21;
  v5 = objc_alloc_init((Class)objc_opt_self());
  +[VNProcessingDevice defaultMetalDevice](VNProcessingDevice, "defaultMetalDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "metalDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  +[VNMetalContext metalContextForDevice:error:]((uint64_t)VNMetalContext, v8, a2);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v5[2];
  v5[2] = v9;

  v11 = v5[2];
  if (v11)
  {
    -[VNMetalContext computePipelineStateForFunctionWithName:error:](v11, CFSTR("removebkgnd_maskimage"), (uint64_t)a2);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v5[4];
    v5[4] = v12;

    if (v5[4])
    {
      -[VNMetalContext computePipelineStateForFunctionWithName:error:](v5[2], CFSTR("removebkgnd_copyCrop"), (uint64_t)a2);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v5[5];
      v5[5] = v14;

      if (v5[5])
      {
        v16 = dispatch_semaphore_create(0);
        v17 = (void *)v5[1];
        v5[1] = v16;

        if (v5[1])
        {
          v18 = [VNBGRBilinearUpsampler alloc];
          v19 = (_QWORD *)v5[2];
          if (v19)
            v19 = (_QWORD *)v19[1];
          v20 = v19;
          v21 = -[VNBGRBilinearUpsampler initWithMetalDevice:](v18, "initWithMetalDevice:", v20);
          v22 = (void *)v5[3];
          v5[3] = v21;

          if (v5[3])
          {
            v23 = v5;
            goto LABEL_20;
          }
          if (a2)
          {
            +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("failed to create bilinear upsampler"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_18;
          }
        }
        else if (a2)
        {
          +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("failed to create execution completion semaphore"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
          v23 = 0;
          *a2 = v24;
          goto LABEL_20;
        }
      }
    }
  }
  v23 = 0;
LABEL_20:

  v25 = (void *)v3[19];
  v3[19] = v23;

  v4 = (void *)v3[19];
  if (!v4)
  {
    v26 = 0;
    goto LABEL_22;
  }
LABEL_21:
  v26 = v4;
LABEL_22:
  objc_sync_exit(v3);

  return v26;
}

uint64_t __126__VNInstanceMaskObservation_generateMaskedImageOfInstances_imageBuffer_inPlace_croppedToInstancesExtent_returnCropRect_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  int v4;
  void *v5;
  __CVBuffer *v6;
  void *v7;
  uint64_t result;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  unint64_t v15;
  __CVBuffer *v16;
  _BOOL4 v17;
  id v18;
  double v19;
  double v20;
  int v21;
  size_t Width;
  size_t Height;
  uint64_t PixelFormatType;
  const __CFString *v25;
  CFTypeRef v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  int v37;
  int v38;
  CVAttachmentMode attachmentMode[2];
  uint64_t v40;
  BOOL (*v41)(uint64_t, _QWORD *);
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;

  v4 = *(unsigned __int8 *)(a1 + 136);
  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v5, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)*(double *)(a1 + 120), (unint64_t)*(double *)(a1 + 128), 1111970369, 0, a2, *(double *)(a1 + 104), *(double *)(a1 + 112));
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      if (a2)
      {
        +[VNError errorForMemoryAllocationFailureWithLocalizedDescription:](VNError, "errorForMemoryAllocationFailureWithLocalizedDescription:", CFSTR("Could not create target buffer"));
        v18 = (id)objc_claimAutoreleasedReturnValue();
        result = 0;
        *a2 = v18;
        return result;
      }
      return 0;
    }
LABEL_9:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "generateMaskForInstances:error:", *(_QWORD *)(a1 + 48), a2);
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      return 0;
    if (*(_BYTE *)(a1 + 137))
    {
      v9 = *(double **)(a1 + 40);
      v11 = v9[15];
      v10 = v9[16];
      v13 = v9[17];
      v12 = v9[18];
      v14 = objc_msgSend(*(id *)(a1 + 32), "width");
      v15 = objc_msgSend(*(id *)(a1 + 32), "height");
      v16 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 32), "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)(v13 * (double)v14), (unint64_t)(v12 * (double)v15), 1111970369, 0, a2, v11 * (double)v14, v10 * (double)v15);
      if (!v16)
      {
        v17 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      v16 = CVPixelBufferRetain(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = -[VNInstanceMaskObservation _upsampleLowResMask:reference:maskProductionResources:error:](*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)+ 24), (uint64_t)v16, *(void **)(a1 + 56), (uint64_t)a2);
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) != 0;
LABEL_17:
    CVPixelBufferRelease(v16);
    if (v17)
    {
      if (*(_BYTE *)(a1 + 136))
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = CVPixelBufferRetain(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
        goto LABEL_20;
      }
      Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
      PixelFormatType = CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, Width, Height, PixelFormatType, a2);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      {
        v25 = (const __CFString *)*MEMORY[0x1E0CA8CD8];
        if (CVBufferHasAttachment(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), (CFStringRef)*MEMORY[0x1E0CA8CD8]))
        {
          attachmentMode[0] = kCVAttachmentMode_ShouldNotPropagate;
          v26 = CVBufferCopyAttachment(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v25, attachmentMode);
          CVBufferSetAttachment(*(CVBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), v25, v26, attachmentMode[0]);
          CFRelease(v26);
        }
LABEL_20:
        if (*(_BYTE *)(a1 + 137))
        {
          objc_msgSend(*(id *)(a1 + 32), "width");
          objc_msgSend(*(id *)(a1 + 32), "height");
          VisionCoreImagePointForNormalizedPoint();
          HIWORD(v38) = (int)v20;
          LOWORD(v38) = (int)v19;
          v21 = v38;
        }
        else
        {
          v21 = 0;
        }
        v27 = *(_QWORD *)(a1 + 40);
        v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
        v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        v31 = *(id *)(a1 + 56);
        v32 = v31;
        if (v27)
        {
          objc_msgSend(v31, "metalContext");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)attachmentMode = MEMORY[0x1E0C809B0];
          v40 = 3221225472;
          v41 = __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke;
          v42 = &unk_1E45456F0;
          v43 = v33;
          v45 = v28;
          v46 = v29;
          v47 = v30;
          v34 = v32;
          v44 = v34;
          v48 = v21;
          v35 = v33;
          v36 = _Block_copy(attachmentMode);
          v37 = VNExecuteBlock(v36, (uint64_t)a2);

          if (v37)
          {
            result = 1;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
            return result;
          }
        }
        else
        {

        }
      }
    }
    return 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v5, "originalPixelBuffer"));
  v6 = *(__CVBuffer **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v6
    && CVPixelBufferGetPixelFormatType(v6) == 1111970369
    && CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)))
  {
    goto LABEL_9;
  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 136));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VNError errorForInvalidOption:named:localizedDescription:](VNError, "errorForInvalidOption:named:localizedDescription:", v7, CFSTR("inPlace"), CFSTR("Conditions for in-place execution not met"));
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  return result;
}

- (uint64_t)_cropInOutPixelBuffer:(void *)a3 normalizedBoundingBox:(double *)a4 maskProductionResources:(_QWORD *)a5 returnCropRect:(double)a6 error:(double)a7
{
  __CVBuffer *v16;
  size_t Width;
  size_t Height;
  double x;
  double y;
  double v21;
  double v22;
  size_t v23;
  void *v24;
  os_unfair_lock_s *v25;
  void *v26;
  id v27;
  __CVBuffer *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  __int16 v48;
  __int16 v49;
  id v50;
  id v51;
  id v52;
  id v53;
  unsigned __int8 v54;
  _QWORD v55[4];
  CGRect v56;
  CGRect v57;

  v55[2] = *MEMORY[0x1E0C80C00];
  v44 = a3;
  if (a1)
  {
    v16 = *a2;
    Width = CVPixelBufferGetWidth(*a2);
    Height = CVPixelBufferGetHeight(v16);
    v56.origin.x = a6 * (double)Width;
    v56.size.width = a8 * (double)Width;
    v56.origin.y = (1.0 - a7 - a9) * (double)Height;
    v56.size.height = a9 * (double)Height;
    v57 = CGRectIntegral(v56);
    x = v57.origin.x;
    y = v57.origin.y;
    v21 = v57.size.width;
    v22 = v57.size.height;
    if (a4)
    {
      v23 = CVPixelBufferGetHeight(v16);
      *a4 = x;
      a4[1] = (double)v23 - y - v22;
      a4[2] = v21;
      a4[3] = v22;
    }
    v24 = (void *)MEMORY[0x1A1B0B060]();
    objc_msgSend(v44, "metalContext");
    v25 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v25, v16, 80, &v53);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v53;
    if (v26)
    {
      v52 = v27;
      v28 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)v21, (unint64_t)v22, 1111970369, &v52);
      v29 = v52;

      if (v28)
      {
        v51 = v29;
        -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](v25, v28, 80, &v51);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v51;

        if (v30)
        {
          v50 = v27;
          -[VNMetalContext commandQueueReturnError:](v25, &v50);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v50;

          if (v42)
          {
            v39 = v31;
            objc_msgSend(v42, "commandBuffer");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "cropCopyingComputeState");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v30, "width");
            v32 = objc_msgSend(v30, "height");
            v55[0] = v26;
            v55[1] = v30;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = MEMORY[0x1E0C809B0];
            v47[0] = MEMORY[0x1E0C809B0];
            v47[1] = 3221225472;
            v47[2] = __118__VNInstanceMaskObservation__cropInOutPixelBuffer_normalizedBoundingBox_maskProductionResources_returnCropRect_error___block_invoke;
            v47[3] = &__block_descriptor_36_e36_v16__0___MTLComputeCommandEncoder__8l;
            v49 = (int)y;
            v48 = (int)x;
            -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:]((uint64_t)v25, v41, v40, v38, v32, v33, v47);

            v31 = v39;
            v45[0] = v34;
            v45[1] = 3221225472;
            v45[2] = __118__VNInstanceMaskObservation__cropInOutPixelBuffer_normalizedBoundingBox_maskProductionResources_returnCropRect_error___block_invoke_2;
            v45[3] = &unk_1E45481A8;
            v46 = v44;
            objc_msgSend(v41, "addCompletedHandler:", v45);
            objc_msgSend(v41, "commit");
            objc_msgSend(v41, "waitUntilCompleted");

            v35 = 0;
          }
          else
          {
            v54 = 0;
            v35 = 1;
          }

          v27 = v31;
        }
        else
        {
          v54 = 0;
          v35 = 1;
        }

      }
      else
      {
        v54 = 0;
        v35 = 1;
        v27 = v29;
      }
    }
    else
    {
      v28 = 0;
      v54 = 0;
      v35 = 1;
    }

    objc_autoreleasePoolPop(v24);
    CVPixelBufferRelease(v16);
    *a2 = v28;
    if (a5 && v27)
      *a5 = objc_retainAutorelease(v27);
    if (!v35)
      v54 = 1;

    v36 = v54;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

uint64_t __118__VNInstanceMaskObservation__cropInOutPixelBuffer_normalizedBoundingBox_maskProductionResources_returnCropRect_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBytes:length:atIndex:", a1 + 32, 4, 0);
}

void __118__VNInstanceMaskObservation__cropInOutPixelBuffer_normalizedBoundingBox_maskProductionResources_returnCropRect_error___block_invoke_2(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "completionSemaphore");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v1);

}

- (uint64_t)_upsampleLowResMask:(uint64_t)a3 reference:(void *)a4 maskProductionResources:(uint64_t)a5 error:
{
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v9 = a4;
  if (a1)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v22 = 0;
    v22 = objc_msgSend(*(id *)(a1 + 96), "isSingleMask");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __89__VNInstanceMaskObservation__upsampleLowResMask_reference_maskProductionResources_error___block_invoke;
    v14[3] = &unk_1E4543948;
    v19 = a3;
    v20 = a2;
    v17 = &v23;
    v18 = v21;
    v15 = v9;
    v16 = a1;
    v10 = _Block_copy(v14);
    v11 = VNExecuteBlock(v10, a5);
    v12 = v24[3];
    if ((v11 & 1) == 0)
    {
      CVPixelBufferRelease((CVPixelBufferRef)v24[3]);
      v12 = 0;
      v24[3] = 0;
    }

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

BOOL __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  int v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 48), 80, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 56), 80, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 64), 55, a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[VNMetalContext commandQueueReturnError:](*(os_unfair_lock_s **)(a1 + 32), a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = v7 != 0;
        if (v7)
        {
          objc_msgSend(v7, "commandBuffer");
          v10 = objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(a1 + 32);
          v17 = (void *)v10;
          objc_msgSend(*(id *)(a1 + 40), "applyMaskComputeState");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v6, "width");
          v13 = objc_msgSend(v6, "height");
          v22[0] = v6;
          v22[1] = v4;
          v22[2] = v5;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke_2;
          v20[3] = &__block_descriptor_36_e36_v16__0___MTLComputeCommandEncoder__8l;
          v21 = *(_DWORD *)(a1 + 72);
          -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:](v16, v17, v11, v12, v13, v14, v20);

          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke_3;
          v18[3] = &unk_1E45481A8;
          v19 = *(id *)(a1 + 40);
          objc_msgSend(v17, "addCompletedHandler:", v18);
          objc_msgSend(v17, "commit");

        }
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBytes:length:atIndex:", a1 + 32, 4, 0);
}

void __123__VNInstanceMaskObservation__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_maskProductionResources_error___block_invoke_3(uint64_t a1)
{
  NSObject *v1;

  objc_msgSend(*(id *)(a1 + 32), "completionSemaphore");
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v1);

}

uint64_t __89__VNInstanceMaskObservation__upsampleLowResMask_reference_maskProductionResources_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  size_t Width;
  size_t Height;
  size_t v6;
  size_t v7;
  int64x2_t *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  objc_class *v21;
  void *v22;
  _QWORD v24[3];
  void *BaseAddress;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 64));
  Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 64));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, Width, Height, 1278226534, a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 72), 1uLL);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v6 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 72));
      v7 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 72));
      v8 = (int64x2_t *)operator new(0x20uLL);
      *v8 = vdupq_n_s64(1uLL);
      v8[1].i64[0] = v6;
      v8[1].i64[1] = v7;
      v35 = 0u;
      v34 = 0u;
      v33 = 0u;
      v32 = 0u;
      v31 = 0u;
      v30 = 0u;
      v29 = 0u;
      v28 = 0u;
      v27 = 0u;
      v26 = 0u;
      BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 72));
      espresso_buffer_pack_tensor_shape();
      v24[0] = *(_QWORD *)(a1 + 64);
      v24[1] = &BaseAddress;
      v24[2] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 32), "bilinearUpsampler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v9, "handlePostProcessingRequest:", v24);

      if ((v7 & 1) != 0)
      {
        operator delete(v8);
LABEL_29:
        v10 = 1;
        goto LABEL_30;
      }
      if (a2)
      {
        +[VNError errorForOperationFailedErrorWithLocalizedDescription:](VNError, "errorForOperationFailedErrorWithLocalizedDescription:", CFSTR("unable to perform bilinear upsampling"));
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      operator delete(v8);
LABEL_28:
      v10 = 0;
LABEL_30:
      CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 72), 1uLL);
      return v10;
    }
    v37[0] = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metalContext");
    v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      -[VNMetalContext bindPixelBuffersToTextures:error:](v13, v11, a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[VNMetalContext bindPixelBuffersToTextures:error:](v14, v12, a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          -[VNMetalContext bindPixelBufferToMTL2DTexture:error:](v14, *(CVPixelBufferRef *)(a1 + 64), a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            -[VNMetalContext createGuidedFilterForTextures:referenceTexture:error:](v14, v15, v17, a2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18
              && -[VNMetalContext upsampleTextures:referenceTexture:constraintsTextures:upsampledTextures:filter:waitForCompletion:error:]((_BOOL8)v14, v15, v17, 0, v16, v18, 1, a2))
            {

              v19 = 0;
              v18 = 0;
            }
            else
            {
              v19 = 1;
            }

          }
          else
          {
            v19 = 1;
          }

        }
        else
        {
          v19 = 1;
        }

        goto LABEL_26;
      }
    }
    else
    {
      if (!a2)
      {
        v19 = 1;
        goto LABEL_27;
      }
      v20 = objc_alloc(MEMORY[0x1E0CB3940]);
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@ does not have a metal context"), v22);

      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v15);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = 1;
LABEL_26:

LABEL_27:
    if (!v19)
      goto LABEL_29;
    goto LABEL_28;
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
