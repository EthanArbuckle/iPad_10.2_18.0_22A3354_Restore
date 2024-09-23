@implementation AXMLayoutItem

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMLayoutItem width](self, "width");
  v7 = v6;
  -[AXMLayoutItem height](self, "height");
  v9 = v8;
  -[AXMLayoutItem left](self, "left");
  v11 = v10;
  -[AXMLayoutItem top](self, "top");
  v13 = v12;
  -[AXMLayoutItem right](self, "right");
  v15 = v14;
  -[AXMLayoutItem bottom](self, "bottom");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [W:%.2f H:%.2f] [L:%.2f T:%.2f R:%.2f B:%.2f]"), v5, v7, v9, v11, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (double)height
{
  double v2;

  -[AXMLayoutItem frame](self, "frame");
  return v2;
}

- (double)top
{
  double v2;

  -[AXMLayoutItem frame](self, "frame");
  return v2;
}

- (double)bottom
{
  double v3;
  double v4;
  double v5;

  -[AXMLayoutItem top](self, "top");
  v4 = v3;
  -[AXMLayoutItem height](self, "height");
  return v4 + v5;
}

- (double)width
{
  double v2;

  -[AXMLayoutItem frame](self, "frame");
  return v2;
}

- (double)right
{
  double v3;
  double v4;
  double v5;

  -[AXMLayoutItem left](self, "left");
  v4 = v3;
  -[AXMLayoutItem width](self, "width");
  return v4 + v5;
}

- (BOOL)metric:(int64_t)a3 inProximityOfMetric:(int64_t)a4 item:(id)a5 threshold:(double)a6
{
  BOOL v6;
  id v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat rect2;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v11 = a5;
  v12 = -[AXMLayoutItem _metricTypeForMetric:](self, "_metricTypeForMetric:", a3);
  if (v12 == -[AXMLayoutItem _metricTypeForMetric:](self, "_metricTypeForMetric:", a4))
  {
    if (v12 == 1)
    {
      -[AXMLayoutItem _rectValueForMetric:](self, "_rectValueForMetric:", a3);
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      objc_msgSend(v11, "_rectValueForMetric:", a4);
      v26 = v25;
      v28 = v27;
      v30 = v29;
      rect2 = v31;
      v34.origin.x = v18;
      v34.origin.y = v20;
      v34.size.width = v22;
      v34.size.height = v24;
      v35 = CGRectInset(v34, -a6, -a6);
      v36.origin.x = v26;
      v36.origin.y = v28;
      v36.size.width = v30;
      v36.size.height = rect2;
      v6 = CGRectIntersectsRect(v35, v36);
    }
    else if (!v12)
    {
      -[AXMLayoutItem _floatValueForMetric:](self, "_floatValueForMetric:", a3);
      v14 = v13;
      objc_msgSend(v11, "_floatValueForMetric:", a4);
      v6 = vabdd_f64(v14, v15) <= a6;
    }
  }
  else
  {
    AXMediaLogTextLayout();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[AXMLayoutItem metric:inProximityOfMetric:item:threshold:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (int64_t)_metricTypeForMetric:(int64_t)a3
{
  return a3 == 6;
}

- (double)_floatValueForMetric:(int64_t)a3
{
  double result;
  NSObject *v4;

  switch(a3)
  {
    case 0:
      -[AXMLayoutItem height](self, "height");
      break;
    case 1:
      -[AXMLayoutItem top](self, "top");
      break;
    case 2:
      -[AXMLayoutItem bottom](self, "bottom");
      break;
    case 3:
      -[AXMLayoutItem width](self, "width");
      break;
    case 4:
      -[AXMLayoutItem left](self, "left");
      break;
    case 5:
      -[AXMLayoutItem right](self, "right");
      break;
    default:
      AXMediaLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        -[AXMLayoutItem _floatValueForMetric:].cold.1();

      result = 0.0;
      break;
  }
  return result;
}

- (CGRect)_rectValueForMetric:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  CGRect result;

  if (a3 == 6)
  {
    -[AXMLayoutItem frame](self, "frame");
  }
  else
  {
    AXMediaLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[AXMLayoutItem _rectValueForMetric:].cold.1();

    v3 = *MEMORY[0x1E0C9D648];
    v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)boundingFrameForItems:(id)a3
{
  id v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL IsNull;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
        v32.origin.x = v4;
        v32.origin.y = v5;
        v32.size.width = v6;
        v32.size.height = v7;
        IsNull = CGRectIsNull(v32);
        objc_msgSend(v12, "frame");
        v18 = v14;
        v19 = v15;
        v20 = v16;
        v21 = v17;
        if (!IsNull)
        {
          v33.origin.x = v4;
          v33.origin.y = v5;
          v33.size.width = v6;
          v33.size.height = v7;
          *(CGRect *)&v14 = CGRectUnion(v33, *(CGRect *)&v18);
        }
        v4 = v14;
        v5 = v15;
        v6 = v16;
        v7 = v17;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  v22 = v4;
  v23 = v5;
  v24 = v6;
  v25 = v7;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (CGRect)normalizedBoundingFrameForItems:(id)a3
{
  id v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL IsNull;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C9D628];
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
        v32.origin.x = v4;
        v32.origin.y = v5;
        v32.size.width = v6;
        v32.size.height = v7;
        IsNull = CGRectIsNull(v32);
        objc_msgSend(v12, "normalizedFrame");
        v18 = v14;
        v19 = v15;
        v20 = v16;
        v21 = v17;
        if (!IsNull)
        {
          v33.origin.x = v4;
          v33.origin.y = v5;
          v33.size.width = v6;
          v33.size.height = v7;
          *(CGRect *)&v14 = CGRectUnion(v33, *(CGRect *)&v18);
        }
        v4 = v14;
        v5 = v15;
        v6 = v16;
        v7 = v17;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  v22 = v4;
  v23 = v5;
  v24 = v6;
  v25 = v7;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (CGRect)normalizedBoundingFrameForItem:(id)a3
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  id v7;
  BOOL IsNull;
  double v9;
  CGFloat x;
  double v11;
  CGFloat y;
  double v13;
  CGFloat width;
  double v15;
  CGFloat height;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect result;
  CGRect v25;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v7 = a3;
  v21.origin.x = v3;
  v21.origin.y = v4;
  v21.size.width = v5;
  v21.size.height = v6;
  IsNull = CGRectIsNull(v21);
  objc_msgSend(v7, "normalizedFrame");
  x = v9;
  y = v11;
  width = v13;
  height = v15;

  if (!IsNull)
  {
    v22.origin.x = v3;
    v22.origin.y = v4;
    v22.size.width = v5;
    v22.size.height = v6;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v23 = CGRectUnion(v22, v25);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)metric:inProximityOfMetric:item:threshold:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_1B0E3B000, v1, OS_LOG_TYPE_ERROR, "Metric types are not compatible '%ld' and '%ld'", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_floatValueForMetric:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1B0E3B000, v0, v1, "metric does not support float values: '%ld'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_rectValueForMetric:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_1B0E3B000, v0, v1, "metric does not support frame values: '%ld'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
