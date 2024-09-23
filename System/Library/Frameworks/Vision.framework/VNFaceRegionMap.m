@implementation VNFaceRegionMap

- (VNFaceRegionMap)initWithRequestRevision:(unint64_t)a3 regionMap:(vImage_Buffer *)a4 deallocateBuffer:(BOOL)a5 userBBox:(CGRect)a6 alignedBBox:(_Geometry2D_rect2D_)a7 valueToLabelMap:(id)a8
{
  float width;
  float height;
  float y;
  float x;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v20;
  VNFaceRegionMap *v21;
  VNFaceRegionMap *v22;
  __int128 v23;
  uint64_t v24;
  NSDictionary *pixelValueToRegionLabelMap;
  objc_super v27;

  width = a7.size.width;
  height = a7.size.height;
  y = a7.origin.y;
  x = a7.origin.x;
  v12 = a6.size.height;
  v13 = a6.size.width;
  v14 = a6.origin.y;
  v15 = a6.origin.x;
  v20 = a8;
  v27.receiver = self;
  v27.super_class = (Class)VNFaceRegionMap;
  v21 = -[VNFaceRegionMap init](&v27, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_requestRevision = a3;
    if (a4)
    {
      v23 = *(_OWORD *)&a4->width;
      *(_OWORD *)&v21->_regionMap.data = *(_OWORD *)&a4->data;
      *(_OWORD *)&v21->_regionMap.width = v23;
      v21->_deallocateBuffer = a5;
    }
    v21->_userBBox.origin.x = v15;
    v21->_userBBox.origin.y = v14;
    v21->_userBBox.size.width = v13;
    v21->_userBBox.size.height = v12;
    v21->_internalAlignedBBox.origin.x = x;
    v21->_internalAlignedBBox.origin.y = y;
    v21->_internalAlignedBBox.size.height = height;
    v21->_internalAlignedBBox.size.width = width;
    v24 = objc_msgSend(v20, "copy");
    pixelValueToRegionLabelMap = v22->_pixelValueToRegionLabelMap;
    v22->_pixelValueToRegionLabelMap = (NSDictionary *)v24;

  }
  return v22;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_deallocateBuffer)
    free(self->_regionMap.data);
  v3.receiver = self;
  v3.super_class = (Class)VNFaceRegionMap;
  -[VNFaceRegionMap dealloc](&v3, sel_dealloc);
}

- (VNFaceRegionMap)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  VNFaceRegionMap *v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  size_t v36;
  size_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  VNFaceRegionMap *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58[5];

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("VNFaceRegionMapVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && !objc_msgSend(v6, "unsignedIntValue"))
  {
    v10 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestRevision"));
    if (v10 <= 1)
      v11 = 1;
    else
      v11 = v10;
    v51 = v11;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("userW"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("userH"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("userX"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("userY"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "doubleValue");
    v13 = v12;
    objc_msgSend(v54, "doubleValue");
    v15 = v14;
    objc_msgSend(v57, "doubleValue");
    v17 = v16;
    objc_msgSend(v55, "doubleValue");
    v19 = v18;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("alignW"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("alignH"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("alignX"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("alignY"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v23 = v22;
    objc_msgSend(v21, "floatValue");
    v25 = v24;
    objc_msgSend(v53, "floatValue");
    v27 = v26;
    objc_msgSend(v52, "floatValue");
    v29 = v28;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("rgnMapW"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = (void *)objc_msgSend(v30, "unsignedLongLongValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("rgnMapH"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "unsignedLongLongValue");
    v58[1] = (void *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("rgnMapRowBytes"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "unsignedLongLongValue");
    v58[3] = (void *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rgnMapData"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length");
    v37 = v36;
    if (v36 == v32 * v34)
    {
      v38 = malloc_type_malloc(v36, 0x2050E9B5uLL);
      v58[0] = v38;
      if (v38)
      {
        memcpy(v38, (const void *)objc_msgSend(objc_retainAutorelease(v35), "bytes"), v37);
        v39 = objc_alloc(MEMORY[0x1E0C99E60]);
        v40 = objc_opt_class();
        v41 = (void *)objc_msgSend(v39, "initWithObjects:", v40, v5, objc_opt_class(), 0);
        objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("pixelToRgnMap"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v43) = v23;
        LODWORD(v44) = v25;
        LODWORD(v45) = v29;
        LODWORD(v46) = v27;
        v47 = -[VNFaceRegionMap initWithRequestRevision:regionMap:deallocateBuffer:userBBox:alignedBBox:valueToLabelMap:](self, "initWithRequestRevision:regionMap:deallocateBuffer:userBBox:alignedBBox:valueToLabelMap:", v51, v58, 1, v42, v13, v15, v17, v19, v43, v44, v45, v46);
        if (!v47)
          free(v58[0]);
        self = v47;

        v9 = self;
        goto LABEL_15;
      }
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v48);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("region map data has length of %lu instead of the expected %lu"), v36, v32 * v34);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v49);

    }
    v9 = 0;
LABEL_15:

    goto LABEL_16;
  }
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("unknown coding version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v8);

  v9 = 0;
LABEL_16:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v4, CFSTR("VNFaceRegionMapVersion"));

  objc_msgSend(v21, "encodeInteger:forKey:", self->_requestRevision, CFSTR("requestRevision"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_userBBox.origin.x);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v5, CFSTR("userX"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_userBBox.origin.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v6, CFSTR("userY"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_userBBox.size.width);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v7, CFSTR("userW"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_userBBox.size.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v8, CFSTR("userH"));

  *(float *)&v9 = self->_internalAlignedBBox.origin.x;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v10, CFSTR("alignX"));

  *(float *)&v11 = self->_internalAlignedBBox.origin.y;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v12, CFSTR("alignY"));

  *(float *)&v13 = self->_internalAlignedBBox.size.width;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v14, CFSTR("alignW"));

  *(float *)&v15 = self->_internalAlignedBBox.size.height;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v16, CFSTR("alignH"));

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_regionMap.data, self->_regionMap.height * self->_regionMap.rowBytes, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v17, CFSTR("rgnMapData"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_regionMap.width);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v18, CFSTR("rgnMapW"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_regionMap.height);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v19, CFSTR("rgnMapH"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_regionMap.rowBytes);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v20, CFSTR("rgnMapRowBytes"));

  objc_msgSend(v21, "encodeObject:forKey:", self->_pixelValueToRegionLabelMap, CFSTR("pixelToRgnMap"));
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (id)getRegionLabels
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSDictionary count](self->_pixelValueToRegionLabelMap, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_pixelValueToRegionLabelMap;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        -[NSDictionary objectForKey:](self->_pixelValueToRegionLabelMap, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)regionNameAtNormalizedAlignedFaceCoordinate:(CGPoint)a3
{
  vImagePixelCount width;
  vImagePixelCount height;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSDictionary *pixelValueToRegionLabelMap;
  void *v10;
  void *v11;
  __CFString *v12;

  width = self->_regionMap.width;
  if (width && (height = self->_regionMap.height) != 0)
  {
    v5 = (unint64_t)(a3.x * (double)width);
    if (a3.x < 0.0)
      v5 = 0;
    v6 = (unint64_t)(a3.y * (double)height);
    if (a3.y < 0.0)
      v6 = 0;
    if (v5 >= width)
      v7 = width - 1;
    else
      v7 = v5;
    if (v6 >= height)
      v8 = height - 1;
    else
      v8 = v6;
    pixelValueToRegionLabelMap = self->_pixelValueToRegionLabelMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *((unsigned __int8 *)self->_regionMap.data + v7 + self->_regionMap.rowBytes * v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](pixelValueToRegionLabelMap, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (__CFString *)objc_msgSend(v11, "copy");

  }
  else
  {
    v12 = CFSTR("Unknown");
  }
  return v12;
}

- (id)regionNameAtImageCoordinate:(CGPoint)a3 imageSize:(CGSize)a4
{
  return -[VNFaceRegionMap regionNameAtNormalizedAlignedFaceCoordinate:](self, "regionNameAtNormalizedAlignedFaceCoordinate:", (a3.x / a4.width - self->_internalAlignedBBox.origin.x) / self->_internalAlignedBBox.size.width, (a3.y / a4.height - self->_internalAlignedBBox.origin.y) / self->_internalAlignedBBox.size.height);
}

- (id)regionNameAtNormalizedFaceCoordinate:(CGPoint)a3
{
  int8x16_t v3;
  float64x2_t v4;
  CGFloat y;

  v3 = (int8x16_t)vcvtq_f64_f32((float32x2_t)self->_internalAlignedBBox.size);
  v4 = (float64x2_t)vextq_s8(v3, v3, 8uLL);
  y = a3.y;
  return -[VNFaceRegionMap regionNameAtNormalizedAlignedFaceCoordinate:](self, "regionNameAtNormalizedAlignedFaceCoordinate:", vmlaq_f64(vdivq_f64(vsubq_f64((float64x2_t)self->_userBBox.origin, vcvtq_f64_f32((float32x2_t)self->_internalAlignedBBox.origin)), v4), vdivq_f64((float64x2_t)self->_userBBox.size, v4), (float64x2_t)a3));
}

- (NSArray)regionLabels
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRegionLabels:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionLabels, 0);
  objc_storeStrong((id *)&self->_pixelValueToRegionLabelMap, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
