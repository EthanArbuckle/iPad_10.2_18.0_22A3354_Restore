@implementation MIOImageSizeConstraint

- (MIOImageSizeConstraint)init
{
  MIOImageSizeConstraint *v2;
  MIOImageSizeConstraint *v3;
  int64_t v4;
  int64_t v5;
  NSArray *enumeratedImageSizes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MIOImageSizeConstraint;
  v2 = -[MIOImageSizeConstraint init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_type = 0;
    v2->_pixelsWideRange.lowerBound = MIOMakeRange(0x7FFFFFFFFFFFFFFFLL, -1);
    v3->_pixelsWideRange.upperBound = v4;
    v3->_pixelsHighRange.lowerBound = MIOMakeRange(0x7FFFFFFFFFFFFFFFLL, -1);
    v3->_pixelsHighRange.upperBound = v5;
    enumeratedImageSizes = v3->_enumeratedImageSizes;
    v3->_enumeratedImageSizes = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (MIOImageSizeConstraint)initWithPixelsWideRange:(_MIORange)a3 pixelsHighRange:(_MIORange)a4
{
  int64_t upperBound;
  int64_t lowerBound;
  int64_t v6;
  int64_t v7;
  MIOImageSizeConstraint *result;

  upperBound = a4.upperBound;
  lowerBound = a4.lowerBound;
  v6 = a3.upperBound;
  v7 = a3.lowerBound;
  result = -[MIOImageSizeConstraint init](self, "init");
  if (result)
  {
    result->_type = 3;
    result->_pixelsWideRange.lowerBound = v7;
    result->_pixelsWideRange.upperBound = v6;
    result->_pixelsHighRange.lowerBound = lowerBound;
    result->_pixelsHighRange.upperBound = upperBound;
  }
  return result;
}

- (MIOImageSizeConstraint)initWithEnumeratedImageSizes:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *enumeratedImageSizes;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  id v23;
  MIOImageSizeConstraint *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v24 = -[MIOImageSizeConstraint init](self, "init");
  if (objc_msgSend(v23, "count"))
  {
    if (objc_msgSend(v23, "count") == 1)
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "pixelsWide"))
      {

      }
      else
      {
        objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "pixelsHigh");

        if (!v6)
          goto LABEL_25;
      }
    }
    if (v24)
    {
      v24->_type = 2;
      objc_msgSend(v23, "sortedArrayUsingSelector:", sel_compare_);
      v7 = objc_claimAutoreleasedReturnValue();
      enumeratedImageSizes = v24->_enumeratedImageSizes;
      v24->_enumeratedImageSizes = (NSArray *)v7;

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = v23;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v26;
        v12 = 0x7FFFFFFFFFFFFFFFLL;
        v13 = 0x8000000000000000;
        v14 = 0x8000000000000000;
        v15 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v9);
            v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            v18 = objc_msgSend(v17, "pixelsHigh");
            v19 = objc_msgSend(v17, "pixelsWide");
            if (v19 < v15)
              v15 = v19;
            if (v14 <= v19)
              v14 = v19;
            if (v18 < v12)
              v12 = v18;
            if (v13 <= v18)
              v13 = v18;
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v10);

      }
      else
      {

        v14 = 0x8000000000000000;
        v15 = 0x7FFFFFFFFFFFFFFFLL;
        v12 = 0x7FFFFFFFFFFFFFFFLL;
        v13 = 0x8000000000000000;
      }
      v24->_pixelsWideRange.lowerBound = MIOMakeRange(v15, v14);
      v24->_pixelsWideRange.upperBound = v20;
      v24->_pixelsHighRange.lowerBound = MIOMakeRange(v12, v13);
      v24->_pixelsHighRange.upperBound = v21;
    }
  }
LABEL_25:

  return v24;
}

- (MIOImageSizeConstraint)initWithSpecification:(const void *)a3
{
  MIOImageSize *v5;
  _BOOL4 v6;
  int v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CoreML::Specification::ImageFeatureType_ImageSizeRange *v12;
  CoreML::Specification::ImageFeatureType_ImageSizeRange *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  void *v17;
  MIOImageSizeConstraint *v18;
  CoreML::Specification::ImageFeatureType_EnumeratedImageSizes *v19;
  uint64_t *v20;
  MIOImageSizeConstraint *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  MIOImageSize *v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v50[16];
  __int128 v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  CoreML::Specification::ImageFeatureType_ImageSize::ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v50);
  v51 = *((_OWORD *)a3 + 1);
  v5 = -[MIOImageSize initWithSpecification:]([MIOImageSize alloc], "initWithSpecification:", v50);
  if (-[MIOImageSize pixelsWide](v5, "pixelsWide"))
    v6 = -[MIOImageSize pixelsHigh](v5, "pixelsHigh") != 0;
  else
    v6 = 0;
  v7 = *((_DWORD *)a3 + 13);
  switch(v7)
  {
    case 0:
      if (!v6)
      {
        v21 = -[MIOImageSizeConstraint init](self, "init");
LABEL_41:
        self = v21;
        break;
      }
      v52[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[MIOImageSizeConstraint initWithEnumeratedImageSizes:](self, "initWithEnumeratedImageSizes:", v17);
      goto LABEL_33;
    case 21:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (CoreML::Specification::ImageFeatureType_EnumeratedImageSizes *)objc_claimAutoreleasedReturnValue();
      v17 = v19;
      if (*((_DWORD *)a3 + 13) == 21)
        v20 = (uint64_t *)*((_QWORD *)a3 + 5);
      else
        v20 = CoreML::Specification::ImageFeatureType_EnumeratedImageSizes::default_instance(v19);
      v22 = v20[4];
      if (v22)
        v23 = (_QWORD *)(v22 + 8);
      else
        v23 = 0;
      v24 = *((int *)v20 + 6);
      if ((_DWORD)v24)
      {
        v25 = 8 * v24;
        do
        {
          v26 = -[MIOImageSize initWithSpecification:]([MIOImageSize alloc], "initWithSpecification:", *v23);
          objc_msgSend(v17, "addObject:", v26);

          ++v23;
          v25 -= 8;
        }
        while (v25);
      }
      if (!objc_msgSend(v17, "count"))
      {
        v27 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v27)
          -[MIOImageSizeConstraint initWithSpecification:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
        v35 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v35)
          -[MIOImageSizeConstraint initWithSpecification:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);
        objc_msgSend(v17, "addObject:", v5);
      }
      v18 = -[MIOImageSizeConstraint initWithEnumeratedImageSizes:](self, "initWithEnumeratedImageSizes:", v17);
LABEL_33:
      self = v18;

      break;
    case 31:
      v8 = *(uint64_t **)(*((_QWORD *)a3 + 5) + 16);
      if (!v8)
        v8 = &CoreML::Specification::_SizeRange_default_instance_;
      v9 = v8[2];
      v10 = v8[3];
      if (v10 <= 0)
        v11 = -1;
      else
        v11 = v10;
      v12 = (CoreML::Specification::ImageFeatureType_ImageSizeRange *)MIOMakeRange(v9, v11);
      v13 = v12;
      v15 = v14;
      if (*((_DWORD *)a3 + 13) == 31)
        v16 = (uint64_t *)*((_QWORD *)a3 + 5);
      else
        v16 = CoreML::Specification::ImageFeatureType_ImageSizeRange::default_instance(v12);
      v43 = (uint64_t *)v16[3];
      if (!v43)
        v43 = &CoreML::Specification::_SizeRange_default_instance_;
      v44 = v43[2];
      v45 = v43[3];
      if (v45 <= 0)
        v46 = -1;
      else
        v46 = v45;
      v47 = MIOMakeRange(v44, v46);
      v21 = -[MIOImageSizeConstraint initWithPixelsWideRange:pixelsHighRange:](self, "initWithPixelsWideRange:pixelsHighRange:", v13, v15, v47, v48);
      goto LABEL_41;
  }

  CoreML::Specification::ImageFeatureType_ImageSize::~ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v50);
  return self;
}

- (BOOL)allowsImageSize:(id)a3
{
  id v4;
  void *v5;
  int64_t type;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  type = self->_type;
  if (type)
  {
    if (type == 2)
    {
      v7 = -[NSArray containsObject:](self->_enumeratedImageSizes, "containsObject:", v4);
      goto LABEL_9;
    }
    if (type == 3
      && MIOLocationInRange(objc_msgSend(v4, "pixelsWide"), self->_pixelsWideRange.lowerBound, self->_pixelsWideRange.upperBound))
    {
      v7 = MIOLocationInRange(objc_msgSend(v5, "pixelsHigh"), self->_pixelsHighRange.lowerBound, self->_pixelsHighRange.upperBound);
LABEL_9:
      v8 = v7;
      goto LABEL_10;
    }
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
LABEL_10:

  return v8;
}

- (id)description
{
  id v3;
  int64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = -[MIOImageSizeConstraint type](self, "type");
  v5 = CFSTR("unspecified");
  if (v4 == 3)
    v5 = CFSTR("ranges");
  if (v4 == 2)
    v5 = CFSTR("enumerated");
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("MIOImageSizeConstraint (%@) "), v5);
  if (-[MIOImageSizeConstraint type](self, "type") == 2)
  {
    -[MIOImageSizeConstraint enumeratedImageSizes](self, "enumeratedImageSizes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("[%@]"), v8);
LABEL_9:

    return v6;
  }
  if (-[MIOImageSizeConstraint type](self, "type") == 3)
  {
    v9 = -[MIOImageSizeConstraint pixelsWideRange](self, "pixelsWideRange");
    NSStringFromMIORange(v9, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MIOImageSizeConstraint pixelsHighRange](self, "pixelsHighRange");
    NSStringFromMIORange(v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR("Wide: %@ High: %@"), v7, v8);
    goto LABEL_9;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MIOImageSizeConstraint *v4;
  MIOImageSizeConstraint *v5;
  int64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = (MIOImageSizeConstraint *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MIOImageSizeConstraint type](self, "type");
      if (v6 == -[MIOImageSizeConstraint type](v5, "type"))
      {
        if (-[MIOImageSizeConstraint type](self, "type") == 2)
        {
          -[MIOImageSizeConstraint enumeratedImageSizes](self, "enumeratedImageSizes");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[MIOImageSizeConstraint enumeratedImageSizes](v5, "enumeratedImageSizes");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v7, "isEqual:", v8);

LABEL_12:
          goto LABEL_13;
        }
        if (-[MIOImageSizeConstraint type](self, "type") != 3)
        {
          v9 = 1;
          goto LABEL_12;
        }
        v10 = -[MIOImageSizeConstraint pixelsWideRange](self, "pixelsWideRange");
        v12 = v11;
        v13 = -[MIOImageSizeConstraint pixelsWideRange](v5, "pixelsWideRange");
        if (MIOEqualRanges(v10, v12, v13, v14))
        {
          v15 = -[MIOImageSizeConstraint pixelsHighRange](self, "pixelsHighRange");
          v17 = v16;
          v18 = -[MIOImageSizeConstraint pixelsHighRange](v5, "pixelsHighRange");
          v9 = MIOEqualRanges(v15, v17, v18, v19);
          goto LABEL_12;
        }
      }
      v9 = 0;
      goto LABEL_12;
    }
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  v3 = -[MIOImageSizeConstraint type](self, "type");
  -[MIOImageSizeConstraint enumeratedImageSizes](self, "enumeratedImageSizes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = -[MIOImageSizeConstraint pixelsWideRange](self, "pixelsWideRange");
  NSStringFromMIORange(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = -[MIOImageSizeConstraint pixelsHighRange](self, "pixelsHighRange");
  NSStringFromMIORange(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5 ^ v3 ^ v9 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (_MIORange)pixelsWideRange
{
  int64_t upperBound;
  int64_t lowerBound;
  _MIORange result;

  upperBound = self->_pixelsWideRange.upperBound;
  lowerBound = self->_pixelsWideRange.lowerBound;
  result.upperBound = upperBound;
  result.lowerBound = lowerBound;
  return result;
}

- (_MIORange)pixelsHighRange
{
  int64_t upperBound;
  int64_t lowerBound;
  _MIORange result;

  upperBound = self->_pixelsHighRange.upperBound;
  lowerBound = self->_pixelsHighRange.lowerBound;
  result.upperBound = upperBound;
  result.lowerBound = lowerBound;
  return result;
}

- (NSArray)enumeratedImageSizes
{
  return self->_enumeratedImageSizes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratedImageSizes, 0);
}

- (void)initWithSpecification:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3AC6000, MEMORY[0x1E0C81028], a3, "Using the default size", a5, a6, a7, a8, 0);
}

- (void)initWithSpecification:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D3AC6000, MEMORY[0x1E0C81028], a3, "Image descripition included empty set of enumerated sizes", a5, a6, a7, a8, 0);
}

@end
