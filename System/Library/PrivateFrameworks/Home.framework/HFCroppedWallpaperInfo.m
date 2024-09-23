@implementation HFCroppedWallpaperInfo

- (HFCroppedWallpaperInfo)initWithSource:(int64_t)a3 center:(CGPoint)a4 scale:(double)a5
{
  CGFloat y;
  CGFloat x;
  HFCroppedWallpaperInfo *result;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)HFCroppedWallpaperInfo;
  result = -[HFCroppedWallpaperInfo init](&v10, sel_init);
  if (result)
  {
    result->_source = a3;
    result->_center.x = x;
    result->_center.y = y;
    result->_scale = a5;
  }
  return result;
}

- (HFCroppedWallpaperInfo)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  NSString *v8;
  void *v9;
  CGPoint v10;
  double v11;
  HFCroppedWallpaperInfo *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v5)
      NSLog(CFSTR("Crop source missing or not of type NSNumber: %@"), v5);
    goto LABEL_10;
  }
  v6 = objc_msgSend(v5, "integerValue");
  if (v6 >= 2)
  {
    if (v5)
      NSLog(CFSTR("Crop source unknown value: %ld"), objc_msgSend(v5, "integerValue"));
LABEL_10:
    v12 = 0;
    goto LABEL_19;
  }
  v7 = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Center"));
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Scale"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = CGPointFromString(v8);
      objc_msgSend(v9, "doubleValue");
      self = -[HFCroppedWallpaperInfo initWithSource:center:scale:](self, "initWithSource:center:scale:", v7, v10.x, v10.y, v11);
      v12 = self;
    }
    else
    {
      if (v9)
        NSLog(CFSTR("Crop scale missing or not of type NSNumber: %@"), v9);
      v12 = 0;
    }

  }
  else
  {
    if (v8)
      NSLog(CFSTR("Crop center missing or not of type NSString: %@"), v8);
    v12 = 0;
  }

LABEL_19:
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[HFCroppedWallpaperInfo source](self, "source");
  -[HFCroppedWallpaperInfo center](self, "center");
  v7 = v6;
  v9 = v8;
  -[HFCroppedWallpaperInfo scale](self, "scale");
  return (id)objc_msgSend(v4, "initWithSource:center:scale:", v5, v7, v9, v10);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    objc_msgSend(v7, "center");
    v9 = v8;
    v11 = v10;
    -[HFCroppedWallpaperInfo center](self, "center");
    if (v9 == v13 && v11 == v12)
    {
      objc_msgSend(v7, "scale");
      v16 = v15;
      -[HFCroppedWallpaperInfo scale](self, "scale");
      v6 = v16 == v17;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CGPoint v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[HFCroppedWallpaperInfo source](self, "source"))
    v4 = CFSTR("extrapolated");
  else
    v4 = CFSTR("user");
  -[HFCroppedWallpaperInfo center](self, "center");
  NSStringFromCGPoint(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCroppedWallpaperInfo scale](self, "scale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("source = %@, center = %@, scale = %f"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];
  CGPoint v11;

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("Source");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HFCroppedWallpaperInfo source](self, "source"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("Center");
  -[HFCroppedWallpaperInfo center](self, "center");
  NSStringFromCGPoint(v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("Scale");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[HFCroppedWallpaperInfo scale](self, "scale");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)source
{
  return self->_source;
}

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

@end
