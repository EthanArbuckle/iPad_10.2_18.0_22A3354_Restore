@implementation PKInkProperties

+ (id)inputNames
{
  return &unk_1E77ECFD8;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)rangeForInkProperty:(unint64_t)a3
{
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v3 = 1.0;
  if (a3 <= 3)
    v3 = dbl_1BE4FD4F8[a3];
  v4 = 0.0;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)rangeForInput:(unint64_t)a3
{
  unint64_t v3;
  double v4;
  double v5;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v3 = a3 - 1;
  if (a3 - 1 > 6)
  {
    v5 = 1.0;
    v4 = 0.0;
  }
  else
  {
    v4 = dbl_1BE4FD518[v3];
    v5 = dbl_1BE4FD550[v3];
  }
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

+ (double)defaultValueForInput:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 - 1 <= 3)
    return dbl_1BE4FD588[a3 - 1];
  return result;
}

+ (id)blendModeNames
{
  return &unk_1E77ECB38;
}

+ (id)inkTypeNames
{
  return &unk_1E77ECB50;
}

+ (id)inkPropertyNames
{
  return &unk_1E77ECF88;
}

+ (id)inputMaskNames
{
  return &unk_1E77ECFB0;
}

+ (id)functionNames
{
  return &unk_1E77ED000;
}

+ (unint64_t)functionTypeForName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  +[PKInkProperties functionNames](PKInkProperties, "functionNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

+ ($01BB1521EC52D44A8E7628F5261DCEC8)controlPointsForFunctionType:(unint64_t)a3
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v3 = a3 - 1;
  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (a3 - 1 <= 4)
  {
    v5 = dbl_1BE4FD5A8[v3];
    v6 = dbl_1BE4FD5D0[v3];
    v4 = 1.0;
    v7 = dbl_1BE4FD5F8[v3];
  }
  result.var3 = v4;
  result.var2 = v5;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

+ (unint64_t)functionTypeForBezierControlPoints:(id)a3
{
  double var3;
  double var2;
  double var1;
  double var0;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  v7 = 2;
  +[PKInkProperties controlPointsForFunctionType:](PKInkProperties, "controlPointsForFunctionType:", 2);
  if (!+[PKInkProperties bezierControlPoints:isEqual:](PKInkProperties, "bezierControlPoints:isEqual:", var0, var1, var2, var3, v8, v9, v10, v11))
  {
    v7 = 3;
    +[PKInkProperties controlPointsForFunctionType:](PKInkProperties, "controlPointsForFunctionType:", 3);
    if (!+[PKInkProperties bezierControlPoints:isEqual:](PKInkProperties, "bezierControlPoints:isEqual:", var0, var1, var2, var3, v12, v13, v14, v15))
    {
      v7 = 5;
      +[PKInkProperties controlPointsForFunctionType:](PKInkProperties, "controlPointsForFunctionType:", 5);
      if (!+[PKInkProperties bezierControlPoints:isEqual:](PKInkProperties, "bezierControlPoints:isEqual:", var0, var1, var2, var3, v16, v17, v18, v19))
      {
        v7 = 4;
        +[PKInkProperties controlPointsForFunctionType:](PKInkProperties, "controlPointsForFunctionType:", 4);
        if (!+[PKInkProperties bezierControlPoints:isEqual:](PKInkProperties, "bezierControlPoints:isEqual:", var0, var1, var2, var3, v20, v21, v22, v23))
        {
          +[PKInkProperties controlPointsForFunctionType:](PKInkProperties, "controlPointsForFunctionType:", 1);
          return +[PKInkProperties bezierControlPoints:isEqual:](PKInkProperties, "bezierControlPoints:isEqual:", var0, var1, var2, var3, v24, v25, v26, v27);
        }
      }
    }
  }
  return v7;
}

+ (BOOL)bezierControlPoints:(id)a3 isEqual:(id)a4
{
  if (a3.var0 != a4.var0 && vabdd_f64(a3.var0, a4.var0) >= fabs(a4.var0 * 0.000000999999997)
    || a3.var1 != a4.var1 && vabdd_f64(a3.var1, a4.var1) >= fabs(a4.var1 * 0.000000999999997)
    || a3.var2 != a4.var2 && vabdd_f64(a3.var2, a4.var2) >= fabs(a4.var2 * 0.000000999999997))
  {
    return 0;
  }
  if (a3.var3 == a4.var3)
    return 1;
  return vabdd_f64(a3.var3, a4.var3) < fabs(a4.var3 * 0.000000999999997);
}

+ (id)arrayForBezierControlPoints:(id)a3
{
  double var3;
  double var2;
  double var1;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  v12[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3.var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", var2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", var3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
