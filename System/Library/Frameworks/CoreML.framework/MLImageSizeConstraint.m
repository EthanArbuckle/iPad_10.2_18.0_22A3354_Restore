@implementation MLImageSizeConstraint

- (id)initUnspecified
{
  char *v2;
  _QWORD *v3;
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MLImageSizeConstraint;
  v2 = -[MLImageSizeConstraint init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *((_QWORD *)v2 + 1) = 0;
    *(_OWORD *)(v2 + 24) = xmmword_19CB39940;
    *(_OWORD *)(v2 + 40) = xmmword_19CB39940;
    v4 = objc_alloc_init(MEMORY[0x1E0C99E40]);
    v5 = (void *)v3[2];
    v3[2] = v4;

  }
  return v3;
}

- (MLImageSizeConstraint)initWithPixelsWideRange:(_NSRange)a3 pixelsHighRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  MLImageSizeConstraint *v8;
  MLImageSizeConstraint *v9;
  NSOrderedSet *v10;
  NSOrderedSet *imageSizeSet;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v6 = a3.length;
  v7 = a3.location;
  v13.receiver = self;
  v13.super_class = (Class)MLImageSizeConstraint;
  v8 = -[MLImageSizeConstraint init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = 3;
    v8->_pixelsWideRange.location = v7;
    v8->_pixelsWideRange.length = v6;
    v8->_pixelsHighRange.location = location;
    v8->_pixelsHighRange.length = length;
    v10 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E40]);
    imageSizeSet = v9->_imageSizeSet;
    v9->_imageSizeSet = v10;

  }
  return v9;
}

- (MLImageSizeConstraint)initWithEnumeratedImageSizes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  MLImageSizeConstraint *v8;
  MLImageSizeConstraint *v9;
  uint64_t v10;
  NSOrderedSet *imageSizeSet;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  MLImageSizeConstraint *v23;
  objc_super v25;

  v4 = a3;
  if (!objc_msgSend(v4, "count"))
    goto LABEL_19;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "pixelsWide"))
    {

      goto LABEL_6;
    }
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "pixelsHigh");

    if (v7)
      goto LABEL_6;
LABEL_19:
    v9 = -[MLImageSizeConstraint initUnspecified](self, "initUnspecified");
    goto LABEL_21;
  }
LABEL_6:
  v25.receiver = self;
  v25.super_class = (Class)MLImageSizeConstraint;
  v8 = -[MLImageSizeConstraint init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = 2;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v4);
    imageSizeSet = v9->_imageSizeSet;
    v9->_imageSizeSet = (NSOrderedSet *)v10;

    v9->_pixelsHighRange = 0u;
    v9->_pixelsWideRange = 0u;
    if (-[NSOrderedSet count](v9->_imageSizeSet, "count"))
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "pixelsWide");

      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "pixelsHigh");

      v16 = 1;
      v17 = v15;
      v18 = v13;
      while (v16 < -[NSOrderedSet count](v9->_imageSizeSet, "count"))
      {
        -[NSOrderedSet objectAtIndexedSubscript:](v9->_imageSizeSet, "objectAtIndexedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "pixelsHigh");

        -[NSOrderedSet objectAtIndexedSubscript:](v9->_imageSizeSet, "objectAtIndexedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "pixelsWide");

        if (v22 < v18)
          v18 = v22;
        if (v13 <= v22)
          v13 = v22;
        if (v20 < v17)
          v17 = v20;
        if (v15 <= v20)
          v15 = v20;
        ++v16;
      }
      v9->_pixelsWideRange.location = v18;
      v9->_pixelsWideRange.length = v13 - v18 + 1;
      v9->_pixelsHighRange.location = v17;
      v9->_pixelsHighRange.length = v15 - v17 + 1;
    }
  }
LABEL_21:
  v23 = v9;

  return v23;
}

- (NSArray)enumeratedImageSizes
{
  return -[NSOrderedSet array](self->_imageSizeSet, "array");
}

- (BOOL)isAllowedImageSize:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int64_t type;
  unint64_t v9;
  NSUInteger location;
  BOOL v11;
  NSUInteger v12;
  unint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;

  v6 = a3;
  v7 = v6;
  type = self->_type;
  if (type == 2)
  {
    if (!-[NSOrderedSet containsObject:](self->_imageSizeSet, "containsObject:", v6))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image size %@ not in allowed set of image sizes"), v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  if (type != 3)
    goto LABEL_11;
  v9 = objc_msgSend(v6, "pixelsWide");
  location = self->_pixelsWideRange.location;
  v11 = v9 >= location;
  v12 = v9 - location;
  if (!v11 || v12 >= self->_pixelsWideRange.length)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "pixelsWide"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pixelsWideRange.location);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pixelsWideRange.location + self->_pixelsWideRange.length - 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Image width (%@) is not in allowed range (%@..%@)"), v17, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v13 = objc_msgSend(v7, "pixelsHigh");
  v14 = self->_pixelsHighRange.location;
  v11 = v13 >= v14;
  v15 = v13 - v14;
  if (v11 && v15 < self->_pixelsHighRange.length)
  {
LABEL_11:
    v21 = 0;
    v22 = 1;
    goto LABEL_18;
  }
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "pixelsWide"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pixelsHighRange.location);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pixelsHighRange.location + self->_pixelsHighRange.length - 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("Image height (%@) is not in allowed range (%@..%@)"), v17, v18, v19);
  v20 = objc_claimAutoreleasedReturnValue();
LABEL_13:
  v21 = (void *)v20;

LABEL_15:
  v22 = v21 == 0;
  if (a4 && v21)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("%@"), v21);
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "encodeInteger:forKey:", -[MLImageSizeConstraint type](self, "type"), CFSTR("type"));
  -[MLImageSizeConstraint imageSizeSet](self, "imageSizeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("imageSizeSet"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[MLImageSizeConstraint pixelsWideRange](self, "pixelsWideRange");
  objc_msgSend(v5, "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("pixelsWideRange_len"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLImageSizeConstraint pixelsWideRange](self, "pixelsWideRange"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("pixelsWideRange_loc"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[MLImageSizeConstraint pixelsHighRange](self, "pixelsHighRange");
  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("pixelsHighRange_len"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLImageSizeConstraint pixelsHighRange](self, "pixelsHighRange"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("pixelsHighRange_loc"));

}

- (MLImageSizeConstraint)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MLImageSizeConstraint *v19;
  void *v20;
  MLImageSizeConstraint *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pixelsWideRange_loc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pixelsWideRange_len"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pixelsHighRange_loc"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pixelsHighRange_len"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  v14 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("imageSizeSet"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v5 == 2)
  {
    objc_msgSend(v17, "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MLImageSizeConstraint initWithEnumeratedImageSizes:](self, "initWithEnumeratedImageSizes:", v20);

  }
  else
  {
    if (v5 == 3)
      v19 = -[MLImageSizeConstraint initWithPixelsWideRange:pixelsHighRange:](self, "initWithPixelsWideRange:pixelsHighRange:", v7, v9, v11, v13);
    else
      v19 = -[MLImageSizeConstraint initUnspecified](self, "initUnspecified");
    v21 = v19;
  }

  return v21;
}

- (MLImageSizeConstraintType)type
{
  return self->_type;
}

- (NSRange)pixelsWideRange
{
  NSUInteger length;
  NSUInteger location;
  NSRange result;

  length = self->_pixelsWideRange.length;
  location = self->_pixelsWideRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSRange)pixelsHighRange
{
  NSUInteger length;
  NSUInteger location;
  NSRange result;

  length = self->_pixelsHighRange.length;
  location = self->_pixelsHighRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSOrderedSet)imageSizeSet
{
  return self->_imageSizeSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSizeSet, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)allowedImageSizeClosestToPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 preferDownScaling:(BOOL)a5 preferInputAspectRatio:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  MLImageSize *v9;
  MLImageSizeConstraintType v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MLImageSize *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a6;
  v7 = a5;
  v9 = -[MLImageSize initWithPixelsWide:pixelsHigh:]([MLImageSize alloc], "initWithPixelsWide:pixelsHigh:", a3, a4);
  v10 = -[MLImageSizeConstraint type](self, "type");
  if (v10 == MLImageSizeConstraintTypeEnumerated)
  {
    v18 = (void *)objc_opt_class();
    -[MLImageSizeConstraint enumeratedImageSizes](self, "enumeratedImageSizes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "closestImageSizeInArray:toImageSize:preferDownScaling:", v19, v9, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v10 == MLImageSizeConstraintTypeRange)
    {
      v11 = (void *)objc_opt_class();
      v12 = -[MLImageSizeConstraint pixelsWideRange](self, "pixelsWideRange");
      v14 = v13;
      v15 = -[MLImageSizeConstraint pixelsHighRange](self, "pixelsHighRange");
      objc_msgSend(v11, "closestImageSizeInPixelsWideRange:pixelsHighRange:toImageSize:preferInputAspectRatio:", v12, v14, v15, v16, v9, v6);
      v17 = (MLImageSize *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = v9;
    }
    v20 = v17;
  }

  return v20;
}

+ (unint64_t)locationClosestTo:(unint64_t)a3 inRange:(_NSRange)a4
{
  NSUInteger v4;

  v4 = a4.length + a4.location - 1;
  if (v4 >= a3)
    v4 = a3;
  if (v4 <= a4.location)
    return a4.location;
  else
    return v4;
}

+ (id)closestImageSizeInPixelsWideRange:(_NSRange)a3 pixelsHighRange:(_NSRange)a4 toImageSize:(id)a5 preferInputAspectRatio:(BOOL)a6
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  NSUInteger v10;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v19;
  MLImageSize *v21;

  v6 = a6;
  length = a4.length;
  location = a4.location;
  v9 = a3.length;
  v10 = a3.location;
  v12 = a5;
  v13 = objc_msgSend(a1, "locationClosestTo:inRange:", objc_msgSend(v12, "pixelsWide"), v10, v9);
  v14 = objc_msgSend(a1, "locationClosestTo:inRange:", objc_msgSend(v12, "pixelsHigh"), location, length);
  if (v6)
  {
    v15 = objc_msgSend(v12, "pixelsHigh");
    v16 = (double)v15 / (double)objc_msgSend(v12, "pixelsWide");
    v17 = (double)v14 / v16;
    if ((unint64_t)v17 < v10 || (unint64_t)v17 - v10 >= v9)
    {
      v19 = v16 * (double)v13;
      if ((unint64_t)v19 - location < length && (unint64_t)v19 >= location)
        v14 = (uint64_t)v19;
    }
    else
    {
      v13 = (uint64_t)v17;
    }
  }
  v21 = -[MLImageSize initWithPixelsWide:pixelsHigh:]([MLImageSize alloc], "initWithPixelsWide:pixelsHigh:", v13, v14);

  return v21;
}

+ (id)closestImageSizeInArray:(id)a3 toImageSize:(id)a4 preferDownScaling:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  double *v11;
  unint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v33;
  double *__p;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = operator new(0x18uLL);
      v33 = v5;
      v10[1] = -1;
      v10[2] = -1;
      *v10 = -1;
      v11 = (double *)operator new(0x18uLL);
      v12 = 0;
      *v11 = 0.0;
      v11[1] = 0.0;
      v13 = 0.0;
      v14 = -1;
      __p = v11;
      v11[2] = 0.0;
      while (v12 < objc_msgSend(v7, "count"))
      {
        v15 = objc_msgSend(v8, "pixelsWide");
        objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15 < objc_msgSend(v16, "pixelsWide");
        v18 = objc_msgSend(v8, "pixelsHigh");
        objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 < objc_msgSend(v19, "pixelsHigh"))
          ++v17;

        v20 = objc_msgSend(v8, "pixelsWide");
        objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "pixelsWide");

        v23 = objc_msgSend(v8, "pixelsHigh");
        objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (double)v23 - (double)objc_msgSend(v24, "pixelsHigh");

        v25 = (double)v20 - (double)v22;
        v27 = v26 * v26 + v25 * v25;
        if (v27 < v13 || v14 < 0)
        {
          v14 = v12;
          v13 = v26 * v26 + v25 * v25;
        }
        if ((v10[v17] & 0x8000000000000000) != 0 || v27 < __p[v17])
        {
          v10[v17] = v12;
          __p[v17] = v27;
        }
        ++v12;
      }
      if (v33)
      {
        v30 = 0;
        while ((v10[v30] & 0x8000000000000000) != 0)
        {
          if (++v30 == 3)
            goto LABEL_25;
        }
        objc_msgSend(v7, "objectAtIndexedSubscript:");
        v31 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_25:
        objc_msgSend(v7, "objectAtIndexedSubscript:", v14);
        v31 = objc_claimAutoreleasedReturnValue();
      }
      v9 = (void *)v31;
      operator delete(__p);
      operator delete(v10);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
