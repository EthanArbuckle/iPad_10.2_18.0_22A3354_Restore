@implementation NTKBezierPathPointModel

- (NTKBezierPathPointModel)initWithPath:(id)a3
{
  id v5;
  NTKBezierPathPointModel *v6;
  NTKBezierPathPointModel *v7;
  uint64_t v8;
  NSArray *pathElements;
  uint64_t v10;
  NSDictionary *horizontalPercentageCache;
  NTKBezierPathPointModel *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NTKBezierPathPointModel;
  v6 = -[NTKBezierPathPointModel init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    pathElements = v7->_pathElements;
    v7->_pathElements = (NSArray *)v8;

    CGPathApply((CGPathRef)objc_msgSend(objc_retainAutorelease(v5), "CGPath"), v7->_pathElements, (CGPathApplierFunction)NTKBuildPathElement);
    -[NTKBezierPathPointModel _buildHorizontalPercentageCache](v7, "_buildHorizontalPercentageCache");
    v10 = objc_claimAutoreleasedReturnValue();
    horizontalPercentageCache = v7->_horizontalPercentageCache;
    v7->_horizontalPercentageCache = (NSDictionary *)v10;

    v12 = v7;
  }

  return v7;
}

- (CGPoint)pointOnPathForHorizontalPercentage:(double)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[NTKBezierPathPointModel pointOnPathForHorizontalPercentage:withEndPadding:](self, "pointOnPathForHorizontalPercentage:withEndPadding:", a3, 0.0);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)pointOnPathForHorizontalPercentage:(double)a3 withEndPadding:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  NSDictionary *horizontalPercentageCache;
  void *v11;
  void *v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPoint result;
  CGRect v26;
  CGRect v27;

  -[NTKBezierPathPointModel _estimatePercentageForEndPadding:](self, "_estimatePercentageForEndPadding:", a4);
  v7 = 1.0 - v6;
  if (v6 < a3)
    v6 = a3;
  if (v7 <= v6)
    v8 = v7;
  else
    v8 = v6;
  v9 = floor(v8 * 100.0);
  horizontalPercentageCache = self->_horizontalPercentageCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](horizontalPercentageCache, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self->_horizontalPercentageCache;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 + 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v16 = v15 == 0;
  else
    v16 = 1;
  if (v16)
  {
    -[NTKBezierPathPointModel _computePointOnPathForHorizontalPercentage:](self, "_computePointOnPathForHorizontalPercentage:", v8);
  }
  else
  {
    objc_msgSend(v12, "floatValue");
    objc_msgSend(v15, "floatValue");
    -[NTKBezierPathPointModel path](self, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    CGRectGetWidth(v26);

    -[NTKBezierPathPointModel path](self, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    CGRectGetWidth(v27);

    CLKInterpolateBetweenPoints();
  }
  v21 = v19;
  v22 = v20;

  v23 = v21;
  v24 = v22;
  result.y = v24;
  result.x = v23;
  return result;
}

- (id)_buildHorizontalPercentageCache
{
  void *v3;
  unint64_t i;
  double v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 101; ++i)
  {
    -[NTKBezierPathPointModel _computePointOnPathForHorizontalPercentage:](self, "_computePointOnPathForHorizontalPercentage:", (double)i * 0.01);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  }
  return v3;
}

- (CGPoint)_computePointOnPathForHorizontalPercentage:(double)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGPoint result;
  CGRect v27;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = 0.0;
  v5 = fmin(fmax(a3, 0.0), 1.0);
  -[NTKBezierPathPointModel path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = v5 * CGRectGetWidth(v27);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_pathElements;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v13, "type", (_QWORD)v20))
        {
          objc_msgSend(v13, "startPoint");
          if (v14 <= v7)
          {
            objc_msgSend(v13, "endPoint");
            if (v15 >= v7)
            {
              objc_msgSend(v13, "pointOnPathForX:", v7);
              v7 = v16;
              v4 = v17;
              goto LABEL_13;
            }
          }
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  v18 = v7;
  v19 = v4;
  result.y = v19;
  result.x = v18;
  return result;
}

- (double)_estimatePercentageForEndPadding:(double)a3
{
  void *v5;
  float v6;
  double v7;
  void *v8;
  unint64_t v9;
  double v10;
  NSDictionary *horizontalPercentageCache;
  void *v12;
  void *v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v20;
  double Width;
  CGRect v22;

  -[NSDictionary objectForKeyedSubscript:](self->_horizontalPercentageCache, "objectForKeyedSubscript:", &unk_1E6C9E818);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;
  -[NTKBezierPathPointModel path](self, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v22);

  v9 = 0;
  v10 = 0.0;
  v20 = 0.01;
  while (1)
  {
    horizontalPercentageCache = self->_horizontalPercentageCache;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9, *(_QWORD *)&v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](horizontalPercentageCache, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "floatValue");
    -[NTKBezierPathPointModel _computeDistanceBetweenPointA:andPointB:](self, "_computeDistanceBetweenPointA:andPointB:", Width * (double)v9 * v20, v14, 0.0, v7);
    v16 = v15;
    if (v10 <= a3 && v15 >= a3)
      break;

    ++v9;
    v10 = v16;
    if (v9 == 100)
    {
      v17 = 0.0;
      goto LABEL_7;
    }
  }
  CLKInterpolateBetweenPoints();
  v17 = v18 / Width;

LABEL_7:
  return v17;
}

- (double)_computeDistanceBetweenPointA:(CGPoint)a3 andPointB:(CGPoint)a4
{
  float v4;
  float v5;

  v4 = a3.x - a4.x;
  v5 = a3.y - a4.y;
  return hypotf(v4, v5);
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalPercentageCache, 0);
  objc_storeStrong((id *)&self->_pathElements, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
