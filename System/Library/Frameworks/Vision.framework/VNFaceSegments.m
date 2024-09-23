@implementation VNFaceSegments

- (VNFaceSegments)initWithRequestRevision:(unint64_t)a3 outputBufferWidth:(unint64_t)a4 outputBufferHeight:(unint64_t)a5 outputBufferData:(id)a6 numberOfFaceSegments:(unint64_t)a7 faceSegmentBBox:(CGRect)a8 faceSegmentLabelToProbabilityMap:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v19;
  id v20;
  VNFaceSegments *v21;
  uint64_t v22;
  VNFaceSegments *v23;
  objc_super v26;

  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v19 = a6;
  v20 = a9;
  v26.receiver = self;
  v26.super_class = (Class)VNFaceSegments;
  v21 = -[VNFaceSegments init](&v26, sel_init);
  if (v21
    && (v22 = objc_msgSend((id)objc_opt_class(), "faceSegmentsPixelSizeInBytes"),
        a5 * a4 * v22 == objc_msgSend(v19, "length")))
  {
    v21->_requestRevision = a3;
    v21->_outputBufferWidth = a4;
    v21->_outputBufferHeight = a5;
    objc_storeStrong((id *)&v21->_outputBufferData, a6);
    v21->_numberOfFaceSegments = a7;
    v21->_boundingBox.origin.x = x;
    v21->_boundingBox.origin.y = y;
    v21->_boundingBox.size.width = width;
    v21->_boundingBox.size.height = height;
    objc_storeStrong((id *)&v21->_faceSegmentLabelToProbabilityMap, a9);
    v23 = v21;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (VNFaceSegments)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  VNFaceSegments *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("VNFaceSegmentsVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && !objc_msgSend(v5, "unsignedIntValue"))
  {
    v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fsRev"));
    v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fsWidth"));
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fsHeight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fsData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fsNumOfSgmnts"));
    v13 = objc_msgSend((id)objc_opt_class(), "faceSegmentsPixelSizeInBytes");
    if (v10 * v9 * v13 == objc_msgSend(v11, "length"))
    {
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fsBBoxOrgX"));
      v15 = v14;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fsBBoxOrgY"));
      v17 = v16;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fsBBoxSzW"));
      v19 = v18;
      v30 = v12;
      v31 = v8;
      objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fsBBoxSzH"));
      v21 = v20;
      v22 = (void *)MEMORY[0x1E0C99E60];
      v23 = objc_opt_class();
      v24 = objc_opt_class();
      v25 = objc_opt_class();
      objc_msgSend(v22, "setWithObjects:", v23, v24, v25, objc_opt_class(), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("fsLblToProbMap"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      self = -[VNFaceSegments initWithRequestRevision:outputBufferWidth:outputBufferHeight:outputBufferData:numberOfFaceSegments:faceSegmentBBox:faceSegmentLabelToProbabilityMap:](self, "initWithRequestRevision:outputBufferWidth:outputBufferHeight:outputBufferData:numberOfFaceSegments:faceSegmentBBox:faceSegmentLabelToProbabilityMap:", v31, v9, v10, v11, v30, v27, v15, v17, v19, v21);
      v7 = self;
    }
    else
    {
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Data integrity check failed when un-archiving an object of type: %@"), objc_opt_class());
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v28);

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("VNFaceSegmentsVersion"));

  objc_msgSend(v9, "encodeInteger:forKey:", self->_requestRevision, CFSTR("fsRev"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_outputBufferWidth, CFSTR("fsWidth"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_outputBufferHeight, CFSTR("fsHeight"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_outputBufferData, CFSTR("fsData"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_numberOfFaceSegments, CFSTR("fsNumOfSgmnts"));
  x = self->_boundingBox.origin.x;
  *(float *)&x = x;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("fsBBoxOrgX"), x);
  y = self->_boundingBox.origin.y;
  *(float *)&y = y;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("fsBBoxOrgY"), y);
  width = self->_boundingBox.size.width;
  *(float *)&width = width;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("fsBBoxSzW"), width);
  height = self->_boundingBox.size.height;
  *(float *)&height = height;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("fsBBoxSzH"), height);
  objc_msgSend(v9, "encodeObject:forKey:", self->_faceSegmentLabelToProbabilityMap, CFSTR("fsLblToProbMap"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;

  -[VNFaceSegments outputBufferData](self, "outputBufferData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VNFaceSegments faceSegmentLabelToProbabilityMap](self, "faceSegmentLabelToProbabilityMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ __ROR8__(v4, 51);

  v7 = -[VNFaceSegments numberOfFaceSegments](self, "numberOfFaceSegments") ^ __ROR8__(-[VNFaceSegments outputBufferHeight](self, "outputBufferHeight") ^ __ROR8__(-[VNFaceSegments outputBufferWidth](self, "outputBufferWidth") ^ __ROR8__(-[VNFaceSegments requestRevision](self, "requestRevision") ^ __ROR8__(v6, 51), 51), 51), 51);
  -[VNFaceSegments boundingBox](self, "boundingBox");
  v12 = v11;
  if (v11 == 0.0)
    v12 = 0.0;
  v13 = v8;
  if (v8 == 0.0)
    v13 = 0.0;
  v14 = *(_QWORD *)&v13 ^ __ROR8__(*(_QWORD *)&v12, 51);
  v15 = v9;
  if (v9 == 0.0)
    v15 = 0.0;
  v16 = *(_QWORD *)&v15 ^ __ROR8__(v14, 51);
  v17 = v10;
  if (v10 == 0.0)
    v17 = 0.0;
  return *(_QWORD *)&v17 ^ __ROR8__(v16, 51) ^ __ROR8__(v7, 51);
}

- (BOOL)isEqual:(id)a3
{
  VNFaceSegments *v4;
  VNFaceSegments *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  char v11;
  unint64_t v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  void *v26;
  char v27;
  CGRect v29;
  CGRect v30;

  v4 = (VNFaceSegments *)a3;
  if (self == v4)
  {
    v27 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[VNFaceSegments requestRevision](self, "requestRevision");
      if (v6 != -[VNFaceSegments requestRevision](v5, "requestRevision"))
        goto LABEL_12;
      v7 = -[VNFaceSegments outputBufferWidth](self, "outputBufferWidth");
      if (v7 != -[VNFaceSegments outputBufferWidth](v5, "outputBufferWidth"))
        goto LABEL_12;
      v8 = -[VNFaceSegments outputBufferHeight](self, "outputBufferHeight");
      if (v8 != -[VNFaceSegments outputBufferHeight](v5, "outputBufferHeight"))
        goto LABEL_12;
      -[VNFaceSegments outputBufferData](self, "outputBufferData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFaceSegments outputBufferData](v5, "outputBufferData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = VisionCoreEqualOrNilObjects();

      if ((v11 & 1) == 0)
        goto LABEL_12;
      v12 = -[VNFaceSegments numberOfFaceSegments](self, "numberOfFaceSegments");
      if (v12 != -[VNFaceSegments numberOfFaceSegments](v5, "numberOfFaceSegments"))
        goto LABEL_12;
      -[VNFaceSegments boundingBox](self, "boundingBox");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[VNFaceSegments boundingBox](v5, "boundingBox");
      v30.origin.x = v21;
      v30.origin.y = v22;
      v30.size.width = v23;
      v30.size.height = v24;
      v29.origin.x = v14;
      v29.origin.y = v16;
      v29.size.width = v18;
      v29.size.height = v20;
      if (CGRectEqualToRect(v29, v30))
      {
        -[VNFaceSegments faceSegmentLabelToProbabilityMap](self, "faceSegmentLabelToProbabilityMap");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[VNFaceSegments faceSegmentLabelToProbabilityMap](v5, "faceSegmentLabelToProbabilityMap");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = VisionCoreEqualOrNilObjects();

      }
      else
      {
LABEL_12:
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }
  }

  return v27;
}

- (__CVBuffer)createMaskImageOfFaceSegments:(unint64_t)a3 error:(id *)a4
{
  VNFaceSegments *v4;
  __CVBuffer *v5;
  __CVBuffer *v6;
  _BYTE *BaseAddress;
  size_t Height;
  size_t Width;
  size_t BytesPerRow;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  void *v14;
  void *v15;
  VNFaceSegments *v16;
  __CVBuffer *v17;
  id v18;
  uint64_t v19;
  void *v20;
  char v21;
  uint64_t v22;
  _BYTE *v23;
  unsigned __int8 *v24;
  size_t i;
  int v26;
  id *v28;
  _BYTE *v29;
  uint64_t v30;
  int v31;
  void *v32;
  void *v33;

  v31 = a3;
  v4 = self;
  v28 = a4;
  v5 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)(double)-[VNFaceSegments outputBufferWidth](self, "outputBufferWidth"), (unint64_t)(double)-[VNFaceSegments outputBufferHeight](self, "outputBufferHeight"), 1278226488, a4);
  v6 = v5;
  if (v5)
  {
    CVPixelBufferLockBaseAddress(v5, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(v6);
    Height = CVPixelBufferGetHeight(v6);
    Width = CVPixelBufferGetWidth(v6);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v6);
    v29 = BaseAddress;
    bzero(BaseAddress, BytesPerRow * Height);
    +[VNFaceSegments faceSegmentIndexToFlagMap](VNFaceSegments, "faceSegmentIndexToFlagMap");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[VNFaceSegments numberOfFaceSegments](v4, "numberOfFaceSegments");
    if (v11)
    {
      v12 = 0;
      v13 = BytesPerRow - Width;
      v30 = v11;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12, v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          break;
        if ((objc_msgSend(v15, "intValue") & v31) != 0)
        {
          +[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary](VNFaceSegments, "faceSegmentToSegmentMaskGrayLevelDictionary");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v4;
          -[VNFaceSegments outputBufferData](v4, "outputBufferData");
          v17 = v6;
          v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v19 = objc_msgSend(v18, "bytes");

          objc_msgSend(v33, "objectForKey:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "unsignedCharValue");

          v6 = v17;
          v4 = v16;
          if (Height)
          {
            v22 = 0;
            v23 = v29;
            do
            {
              v24 = (unsigned __int8 *)v19;
              for (i = Width; i; --i)
              {
                v26 = *v24++;
                if (v12 == v26)
                  *v23 = v21;
                ++v23;
              }
              v23 += v13;
              ++v22;
              v19 += Width;
            }
            while (v22 != Height);
          }

        }
        if (++v12 == v30)
          goto LABEL_15;
      }
      if (v28)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot create CVPixelBuffer object: faceSegments is out of range"));
        *v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      CVPixelBufferUnlockBaseAddress(v6, 0);
      v6 = 0;
    }
    else
    {
LABEL_15:
      CVPixelBufferUnlockBaseAddress(v6, 0);
    }

  }
  return v6;
}

- (__CVBuffer)createProbabilityImageOfFaceSegment:(unint64_t)a3 error:(id *)a4
{
  return -[VNFaceSegments createProbabilityImageOfFaceSegment:region:normalize:error:](self, "createProbabilityImageOfFaceSegment:region:normalize:error:", a3, 0, a4, self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
}

- (__CVBuffer)createProbabilityImageOfFaceSegment:(unint64_t)a3 region:(CGRect)a4 normalize:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  NSDictionary *faceSegmentLabelToProbabilityMap;
  void *v14;
  void *v15;
  double v16;
  double v17;
  unint64_t outputBufferHeight;
  double outputBufferWidth;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __CVBuffer *v26;
  __CVBuffer *v27;
  float *data;
  float *BaseAddress;
  float *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float *v36;
  float v37;
  vImage_Error v38;
  void *v39;
  void *v40;
  id *v42;
  void *v43;
  size_t BytesPerRow;
  size_t rowBytes;
  vImage_Buffer dest;
  vImage_Buffer src;
  CGRect v48;

  v7 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  faceSegmentLabelToProbabilityMap = self->_faceSegmentLabelToProbabilityMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](faceSegmentLabelToProbabilityMap, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (a6)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("Cannot create CVPixelBuffer object: faceSegment parameter is out of range"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
      v27 = 0;
      *a6 = v39;
      goto LABEL_23;
    }
LABEL_22:
    v27 = 0;
    goto LABEL_23;
  }
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  if (!CGRectContainsRect(self->_boundingBox, v48))
  {
    if (a6)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("Cannot create CVPixelBuffer object: region parameter is out of range"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    goto LABEL_22;
  }
  -[VNFaceSegments _normalizeRegion:](self, "_normalizeRegion:", x, y, width, height);
  outputBufferHeight = self->_outputBufferHeight;
  outputBufferWidth = (double)self->_outputBufferWidth;
  v21 = v20 * outputBufferWidth;
  v23 = v22 * outputBufferWidth;
  v24 = (1.0 - v16 - v17) * (double)outputBufferHeight;
  v25 = v17 * (double)outputBufferHeight;
  memset(&src, 0, sizeof(src));
  -[VNFaceSegments _makeFaceSegmentProbabilityDataImageBuffer:rect:](self, "_makeFaceSegmentProbabilityDataImageBuffer:rect:", v15, v20 * outputBufferWidth, v24, v22 * outputBufferWidth, v25);
  v26 = -[VNFaceSegments _createFaceSegmentProabilityDataPixelBufferWithSize:error:](self, "_createFaceSegmentProabilityDataPixelBufferWithSize:error:", a6, v23, v25);
  v27 = v26;
  if (v26)
  {
    CVPixelBufferLockBaseAddress(v26, 0);
    if (v7)
    {
      -[VNFaceSegments _calculateProbabilityNormalSumsForRect:](self, "_calculateProbabilityNormalSumsForRect:", v21, v24, v23, v25);
      rowBytes = src.rowBytes;
      data = (float *)src.data;
      BytesPerRow = CVPixelBufferGetBytesPerRow(v27);
      BaseAddress = (float *)CVPixelBufferGetBaseAddress(v27);
      if ((int)v25 < 1)
      {
        v38 = 0;
      }
      else
      {
        v30 = BaseAddress;
        v42 = a6;
        v43 = v15;
        v31 = (int)v23;
        v32 = (int)v21;
        v33 = (int)v21 + (int)v23;
        v34 = (int)v24;
        do
        {
          if (v31 >= 1)
          {
            v35 = 0;
            v36 = &self->_probabilityNormSums.__begin_[v32 + self->_outputBufferWidth * v34];
            do
            {
              v37 = v36[v35];
              v30[v35] = expf(data[v35]) / v37;
              ++v35;
            }
            while (v32 + v35 < v33);
          }
          v30 = (float *)((char *)v30 + BytesPerRow);
          data = (float *)((char *)data + rowBytes);
          ++v34;
        }
        while (v34 < (int)v24 + (int)v25);
        v38 = 0;
        a6 = v42;
        v15 = v43;
      }
    }
    else
    {
      dest.data = CVPixelBufferGetBaseAddress(v27);
      dest.height = CVPixelBufferGetHeight(v27);
      dest.width = CVPixelBufferGetWidth(v27);
      dest.rowBytes = CVPixelBufferGetBytesPerRow(v27);
      v38 = vImageCopyBuffer(&src, &dest, 4uLL, 0);
    }
    CVPixelBufferUnlockBaseAddress(v27, 0);
    if (v38)
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot copy face segment probability map. Error = %d"), v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v40);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_22;
    }
  }
LABEL_23:

  return v27;
}

- (CGRect)_normalizeRegion:(CGRect)a3
{
  double width;
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  v5 = (a3.origin.x - self->_boundingBox.origin.x) / (1.0 / width);
  v6 = (a3.origin.y - self->_boundingBox.origin.y) / (1.0 / height);
  v7 = a3.size.width / width;
  v8 = a3.size.height / height;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (vImage_Buffer)_makeFaceSegmentProbabilityDataImageBuffer:(SEL)a3 rect:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  size_t v11;
  id v12;
  void *v13;
  vImage_Buffer *result;
  id v15;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = a4;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("rowBytes"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("data"));
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (void *)(objc_msgSend(v12, "bytes") + v11 * (unint64_t)y + 4 * (unint64_t)x);

  retstr->data = v13;
  retstr->height = (unint64_t)height;
  retstr->width = (unint64_t)width;
  retstr->rowBytes = v11;

  return result;
}

- (__CVBuffer)_createFaceSegmentProabilityDataPixelBufferWithSize:(CGSize)a3 error:(id *)a4
{
  return +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, (unint64_t)a3.width, (unint64_t)a3.height, 1278226534, a4);
}

- (void)_calculateProbabilityNormalSumsForRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  VNFaceSegments *v7;
  unint64_t v8;
  unint64_t numberOfFaceSegments;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t *v30;
  unint64_t outputBufferWidth;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char **p_probabilityNormSums;
  id obj;
  VNFaceSegments *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int v42;
  _BYTE v43[128];
  uint64_t v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v44 = *MEMORY[0x1E0C80C00];
  p_probabilityNormSums = (char **)&self->_probabilityNormSums;
  if (self->_probabilityNormSums.__begin_ == self->_probabilityNormSums.__end_)
  {
    v7 = self;
    v8 = self->_outputBufferHeight * self->_outputBufferWidth;
    v42 = 2143289344;
    std::vector<float>::resize(p_probabilityNormSums, v8, &v42);
    self = v7;
  }
  v37 = self;
  numberOfFaceSegments = self->_numberOfFaceSegments;
  if (numberOfFaceSegments)
  {
    if (numberOfFaceSegments >> 60)
      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
    v10 = (uint64_t *)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(numberOfFaceSegments);
    v12 = &v10[2 * v11];
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  +[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary](VNFaceSegments, "faceSegmentToSegmentMaskGrayLevelDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v14;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v39;
    v17 = v10;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(obj);
        -[NSDictionary objectForKeyedSubscript:](v37->_faceSegmentLabelToProbabilityMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("data"));
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v21 = objc_msgSend(v20, "bytes");

        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("rowBytes"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedIntegerValue");

        if (v17 >= v12)
        {
          v24 = ((char *)v17 - (char *)v10) >> 4;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 60)
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          if (v12 - v10 > v25)
            v25 = v12 - v10;
          if ((unint64_t)((char *)v12 - (char *)v10) >= 0x7FFFFFFFFFFFFFF0)
            v26 = 0xFFFFFFFFFFFFFFFLL;
          else
            v26 = v25;
          if (v26)
            v26 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<vision::mod::DescriptorItemSideInfo>>(v26);
          else
            v27 = 0;
          v28 = (uint64_t *)(v26 + 16 * v24);
          *v28 = v21;
          v28[1] = v23;
          if (v17 == v10)
          {
            v30 = (uint64_t *)(v26 + 16 * v24);
          }
          else
          {
            v29 = v26 + 16 * v24;
            do
            {
              v30 = (uint64_t *)(v29 - 16);
              *(_OWORD *)(v29 - 16) = *((_OWORD *)v17 - 1);
              v17 -= 2;
              v29 -= 16;
            }
            while (v17 != v10);
          }
          v12 = (uint64_t *)(v26 + 16 * v27);
          v17 = v28 + 2;
          if (v10)
            operator delete(v10);
          v10 = v30;
        }
        else
        {
          *v17 = v21;
          v17[1] = v23;
          v17 += 2;
        }

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v15);
  }

  if ((int)height >= 1)
  {
    outputBufferWidth = v37->_outputBufferWidth;
    v32 = (int)y;
    v33 = (uint64_t)&(*p_probabilityNormSums)[4 * outputBufferWidth * v32];
    do
    {
      v34 = (int)x;
      if ((int)width >= 1)
      {
        do
          ++v34;
        while (v34 < (int)x + (int)width);
      }
      v33 += 4 * outputBufferWidth;
      ++v32;
    }
    while (v32 < (int)y + (int)height);
  }
  if (v10)
    operator delete(v10);
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (unint64_t)outputBufferWidth
{
  return self->_outputBufferWidth;
}

- (unint64_t)outputBufferHeight
{
  return self->_outputBufferHeight;
}

- (NSData)outputBufferData
{
  return self->_outputBufferData;
}

- (unint64_t)numberOfFaceSegments
{
  return self->_numberOfFaceSegments;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSDictionary)faceSegmentLabelToProbabilityMap
{
  return self->_faceSegmentLabelToProbabilityMap;
}

- (void).cxx_destruct
{
  float *begin;

  begin = self->_probabilityNormSums.__begin_;
  if (begin)
  {
    self->_probabilityNormSums.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_faceSegmentLabelToProbabilityMap, 0);
  objc_storeStrong((id *)&self->_outputBufferData, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSDictionary)faceSegmentToSegmentMaskGrayLevelDictionary
{
  if (+[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary]::onceToken != -1)
    dispatch_once(&+[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary]::onceToken, &__block_literal_global_21536);
  return (NSDictionary *)(id)+[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary]::faceSegmentToSegmentMaskGrayLevelDictionary;
}

+ (NSDictionary)faceSegmentIndexToFlagMap
{
  if (+[VNFaceSegments faceSegmentIndexToFlagMap]::onceToken != -1)
    dispatch_once(&+[VNFaceSegments faceSegmentIndexToFlagMap]::onceToken, &__block_literal_global_50);
  return (NSDictionary *)(id)+[VNFaceSegments faceSegmentIndexToFlagMap]::faceSegmentIndexToFlagMap;
}

+ (unint64_t)faceSegmentsPixelSizeInBytes
{
  return 1;
}

void __43__VNFaceSegments_faceSegmentIndexToFlagMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[15];
  _QWORD v3[16];

  v3[15] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E459CB08;
  v2[1] = &unk_1E459CB38;
  v3[0] = &unk_1E459CB20;
  v3[1] = &unk_1E459CB50;
  v2[2] = &unk_1E459CB68;
  v2[3] = &unk_1E459CB98;
  v3[2] = &unk_1E459CB80;
  v3[3] = &unk_1E459CBB0;
  v2[4] = &unk_1E459CBC8;
  v2[5] = &unk_1E459CBF8;
  v3[4] = &unk_1E459CBE0;
  v3[5] = &unk_1E459CC10;
  v2[6] = &unk_1E459CC28;
  v2[7] = &unk_1E459CC58;
  v3[6] = &unk_1E459CC40;
  v3[7] = &unk_1E459CC70;
  v2[8] = &unk_1E459CC88;
  v2[9] = &unk_1E459CCB8;
  v3[8] = &unk_1E459CCA0;
  v3[9] = &unk_1E459CCD0;
  v2[10] = &unk_1E459CCE8;
  v2[11] = &unk_1E459CD18;
  v3[10] = &unk_1E459CD00;
  v3[11] = &unk_1E459CD30;
  v2[12] = &unk_1E459CD48;
  v2[13] = &unk_1E459CD78;
  v3[12] = &unk_1E459CD60;
  v3[13] = &unk_1E459CD90;
  v2[14] = &unk_1E459CDA8;
  v3[14] = &unk_1E459CDC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VNFaceSegments faceSegmentIndexToFlagMap]::faceSegmentIndexToFlagMap;
  +[VNFaceSegments faceSegmentIndexToFlagMap]::faceSegmentIndexToFlagMap = v0;

}

void __61__VNFaceSegments_faceSegmentToSegmentMaskGrayLevelDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[VNFaceSegments faceSegmentIndexToFlagMap](VNFaceSegments, "faceSegmentIndexToFlagMap");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v8, "count");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v0);
  if (v0)
  {
    for (i = 0; i != v0; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ~(i + 5));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "setObject:forKeyedSubscript:", v5, v4);

    }
  }
  v6 = objc_msgSend(v1, "copy");
  v7 = (void *)+[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary]::faceSegmentToSegmentMaskGrayLevelDictionary;
  +[VNFaceSegments faceSegmentToSegmentMaskGrayLevelDictionary]::faceSegmentToSegmentMaskGrayLevelDictionary = v6;

}

@end
