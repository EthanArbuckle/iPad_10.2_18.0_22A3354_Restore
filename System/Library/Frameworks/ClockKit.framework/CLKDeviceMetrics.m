@implementation CLKDeviceMetrics

+ (id)metricsWithDevice:(id)a3 identitySizeClass:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDevice:identitySizeClass:", v6, a4);

  return v7;
}

- (CLKDeviceMetrics)initWithDevice:(id)a3 identitySizeClass:(unint64_t)a4
{
  id v7;
  CLKDeviceMetrics *v8;
  CLKDeviceMetrics *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *scales;
  void *v19;
  _QWORD v21[4];
  CLKDeviceMetrics *v22;
  uint64_t v23;
  objc_super v24;

  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CLKDeviceMetrics;
  v8 = -[CLKDeviceMetrics init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_identitySizeClass = a4;
    v9->_roundingBehavior = 1;
    if (initWithDevice_identitySizeClass__onceToken != -1)
      dispatch_once(&initWithDevice_identitySizeClass__onceToken, &__block_literal_global_7);
    v10 = (void *)initWithDevice_identitySizeClass____defaultScales;
    if (a4 - 1 > 1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v17 = objc_claimAutoreleasedReturnValue();
      scales = v9->_scales;
      v9->_scales = (NSMutableDictionary *)v17;

      v19 = (void *)initWithDevice_identitySizeClass____defaultScales;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __53__CLKDeviceMetrics_initWithDevice_identitySizeClass___block_invoke_17;
      v21[3] = &unk_24CBFA1B0;
      v22 = v9;
      v23 = v16;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v21);
      v12 = (NSMutableDictionary *)v22;
    }
    else
    {
      v11 = objc_msgSend((id)initWithDevice_identitySizeClass____defaultScales, "mutableCopy");
      v12 = v9->_scales;
      v9->_scales = (NSMutableDictionary *)v11;
    }

  }
  return v9;
}

void __53__CLKDeviceMetrics_initWithDevice_identitySizeClass___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24CC173E0;
  v2[1] = &unk_24CC173F8;
  v3[0] = &unk_24CC17A68;
  v3[1] = &unk_24CC17A78;
  v2[2] = &unk_24CC17410;
  v2[3] = &unk_24CC17428;
  v3[2] = &unk_24CC17A78;
  v3[3] = &unk_24CC17A88;
  v2[4] = &unk_24CC17440;
  v2[5] = &unk_24CC17458;
  v3[4] = &unk_24CC17A98;
  v3[5] = &unk_24CC17AA8;
  v2[6] = &unk_24CC17470;
  v2[7] = &unk_24CC17488;
  v3[6] = &unk_24CC17AA8;
  v3[7] = &unk_24CC17A88;
  v2[8] = &unk_24CC174A0;
  v3[8] = &unk_24CC17AB8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithDevice_identitySizeClass____defaultScales;
  initWithDevice_identitySizeClass____defaultScales = v0;

}

void __53__CLKDeviceMetrics_initWithDevice_identitySizeClass___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  id v7;

  v5 = a2;
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6 / *(double *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v7, v5);

}

- (void)setScale:(double)a3 forSizeClass:(unint64_t)a4
{
  NSMutableDictionary *scales;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  scales = self->_scales;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](scales, "setObject:forKeyedSubscript:", v8, v7);

}

- (double)_unroundedScaledValue:(double)a3
{
  NSMutableDictionary *scales;
  void *v5;
  void *v6;
  double v7;
  double v8;

  scales = self->_scales;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](scales, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7 * a3;

  return v8;
}

- (unint64_t)_effectiveSizeClass
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (_effectiveSizeClass_onceToken != -1)
    dispatch_once(&_effectiveSizeClass_onceToken, &__block_literal_global_19);
  v3 = -[CLKDevice sizeClass](self->_device, "sizeClass");
  -[CLKDeviceMetrics newestAllowedSizeClass](self, "newestAllowedSizeClass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CLKDeviceMetrics newestAllowedSizeClass](self, "newestAllowedSizeClass");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    while (v3 > v6)
    {
      v7 = (void *)_effectiveSizeClass__fallbacks;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = objc_msgSend(v9, "integerValue");
    }
  }
  return v3;
}

void __39__CLKDeviceMetrics__effectiveSizeClass__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];
  _QWORD v3[8];

  v3[7] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24CC17410;
  v2[1] = &unk_24CC17428;
  v3[0] = &unk_24CC173E0;
  v3[1] = &unk_24CC173F8;
  v3[2] = &unk_24CC17410;
  v3[3] = &unk_24CC17428;
  v2[4] = &unk_24CC17470;
  v2[5] = &unk_24CC17488;
  v2[2] = &unk_24CC17440;
  v2[3] = &unk_24CC17458;
  v3[4] = &unk_24CC17458;
  v3[5] = &unk_24CC17440;
  v2[6] = &unk_24CC174A0;
  v3[6] = &unk_24CC17470;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_effectiveSizeClass__fallbacks;
  _effectiveSizeClass__fallbacks = v0;

}

- (double)scaledValue:(double)a3
{
  double v4;
  double v5;
  double result;
  double v7;
  double v8;

  -[CLKDeviceMetrics _unroundedScaledValue:](self, "_unroundedScaledValue:", a3);
  v5 = v4;
  switch(-[CLKDeviceMetrics roundingBehavior](self, "roundingBehavior"))
  {
    case 1uLL:
      CLKRoundForDevice(self->_device);
      return result;
    case 2uLL:
      CLKRoundForDevice(self->_device);
      return v7 + v7;
    case 3uLL:
      CLKRoundForDevice(self->_device);
      return v8 * 0.5;
    case 4uLL:
      UIRoundToScale();
      return result;
    default:
      return v5;
  }
}

- (double)constantValue:(double)a3 withOverride:(double)a4 forSizeClass:(unint64_t)a5
{
  if (-[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass") == a5)
    return a4;
  else
    return a3;
}

- (double)scaledValue:(double)a3 withOverride:(double)a4 forSizeClass:(unint64_t)a5
{
  double result;

  if (-[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass") == a5)
    return a4;
  -[CLKDeviceMetrics scaledValue:](self, "scaledValue:", a3);
  return result;
}

- (double)constantValue:(double)a3 withOverrides:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    a3 = v10;
  }

  return a3;
}

- (double)scaledValue:(double)a3 withOverrides:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "doubleValue");
  else
    -[CLKDeviceMetrics scaledValue:](self, "scaledValue:", a3);
  v11 = v10;

  return v11;
}

- (double)valueCompact:(double)a3 regular:(double)a4 luxoCompact:(double)a5 luxoRegular:(double)a6 aloeCompact:(double)a7 aloeRegular:(double)a8
{
  double result;

  -[CLKDeviceMetrics valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:](self, "valueCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:", a3, a4, a5, a6, a7, a8, a8);
  return result;
}

- (double)valueCompact:(double)a3 regular:(double)a4 luxoCompact:(double)a5 luxoRegular:(double)a6 aloeCompact:(double)a7 aloeRegular:(double)a8 agave:(double)a9
{
  switch(-[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"))
  {
    case 0uLL:
      return a3;
    case 1uLL:
      a3 = a4;
      break;
    case 2uLL:
      a3 = a5;
      break;
    case 4uLL:
    case 7uLL:
      a3 = a7;
      break;
    case 5uLL:
      a3 = a8;
      break;
    case 6uLL:
    case 8uLL:
      a3 = a9;
      break;
    default:
      a3 = a6;
      break;
  }
  return a3;
}

- (double)valueCompact:(double)a3 regular:(double)a4 luxoCompact:(double)a5 luxoRegular:(double)a6 aloeCompact:(double)a7 aloeRegular:(double)a8 agave:(double)a9 avoniaCompact:(double)a10 avoniaRegular:(double)a11
{
  switch(-[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"))
  {
    case 0uLL:
      return a3;
    case 1uLL:
      a3 = a4;
      break;
    case 2uLL:
      a3 = a5;
      break;
    case 4uLL:
      a3 = a7;
      break;
    case 5uLL:
      a3 = a8;
      break;
    case 6uLL:
      a3 = a9;
      break;
    case 7uLL:
      a3 = a10;
      break;
    case 8uLL:
      a3 = a11;
      break;
    default:
      a3 = a6;
      break;
  }
  return a3;
}

- (CGPoint)scaledPoint:(CGPoint)a3
{
  double y;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a3.y;
  -[CLKDeviceMetrics _unroundedScaledValue:](self, "_unroundedScaledValue:", a3.x);
  v6 = v5;
  -[CLKDeviceMetrics _unroundedScaledValue:](self, "_unroundedScaledValue:", y);
  v8 = v7;
  switch(-[CLKDeviceMetrics roundingBehavior](self, "roundingBehavior"))
  {
    case 1uLL:
      CLKPointRoundForDevice(self->_device);
      goto LABEL_6;
    case 2uLL:
      CLKPointRoundForDevice(self->_device);
      v6 = v11 + v11;
      v8 = v12 + v12;
      break;
    case 3uLL:
      CLKPointRoundForDevice(self->_device);
      v6 = v13 * 0.5;
      v8 = v14 * 0.5;
      break;
    case 4uLL:
      UIPointRoundToScale();
LABEL_6:
      v6 = v9;
      v8 = v10;
      break;
    default:
      break;
  }
  v15 = v6;
  v16 = v8;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)constantPoint:(CGPoint)a3 withOverride:(CGPoint)a4 forSizeClass:(unint64_t)a5
{
  double y;
  double x;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v10 = -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass");
  if (v10 == a5)
    v11 = x;
  else
    v11 = v9;
  if (v10 == a5)
    v12 = y;
  else
    v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)scaledPoint:(CGPoint)a3 withOverride:(CGPoint)a4 forSizeClass:(unint64_t)a5
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  if (-[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass") != a5)
  {
    -[CLKDeviceMetrics scaledPoint:](self, "scaledPoint:", v8, v7);
    x = v10;
    y = v11;
  }
  v12 = x;
  v13 = y;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)constantPoint:(CGPoint)a3 withOverrides:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a4;
  objc_msgSend(v7, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "CGPointValue");
    x = v11;
    y = v12;
  }

  v13 = x;
  v14 = y;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)scaledPoint:(CGPoint)a3 withOverrides:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a4;
  objc_msgSend(v7, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v10, "CGPointValue");
  else
    -[CLKDeviceMetrics scaledPoint:](self, "scaledPoint:", x, y);
  v13 = v11;
  v14 = v12;

  v15 = v13;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)pointCompact:(CGPoint)a3 regular:(CGPoint)a4 luxoCompact:(CGPoint)a5 luxoRegular:(CGPoint)a6 aloeCompact:(CGPoint)a7 aloeRegular:(CGPoint)a8
{
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGPoint result;

  -[CLKDeviceMetrics pointCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:](self, "pointCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:", *(_QWORD *)&a7.x, *(_QWORD *)&a7.y, *(_QWORD *)&a8.x, *(_QWORD *)&a8.y, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y, a6.x, a6.y, v10, v11, v12, v13, v12,
    v13);
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)pointCompact:(CGPoint)a3 regular:(CGPoint)a4 luxoCompact:(CGPoint)a5 luxoRegular:(CGPoint)a6 aloeCompact:(CGPoint)a7 aloeRegular:(CGPoint)a8 agave:(CGPoint)a9
{
  CGFloat y;
  CGFloat x;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v11 = a5.y;
  v12 = a5.x;
  v13 = a4.y;
  v14 = a4.x;
  v15 = a3.y;
  v16 = a3.x;
  switch(-[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass", *(_QWORD *)&a7.x, *(_QWORD *)&a7.y, *(_QWORD *)&a8.x, *(_QWORD *)&a8.y, *(_QWORD *)&a9.x, *(_QWORD *)&a9.y))
  {
    case 0uLL:
      break;
    case 1uLL:
      v16 = v14;
      v15 = v13;
      break;
    case 2uLL:
      v16 = v12;
      v15 = v11;
      break;
    case 4uLL:
    case 7uLL:
      v16 = v19;
      v15 = v20;
      break;
    case 5uLL:
      v16 = v21;
      v15 = v22;
      break;
    case 6uLL:
    case 8uLL:
      v16 = v23;
      v15 = v24;
      break;
    default:
      v16 = x;
      v15 = y;
      break;
  }
  v17 = v16;
  v18 = v15;
  result.y = v18;
  result.x = v17;
  return result;
}

- (CGPoint)pointCompact:(CGPoint)a3 regular:(CGPoint)a4 luxoCompact:(CGPoint)a5 luxoRegular:(CGPoint)a6 aloeCompact:(CGPoint)a7 aloeRegular:(CGPoint)a8 agave:(CGPoint)a9 avoniaCompact:(CGPoint)a10 avoniaRegular:(CGPoint)a11
{
  CGFloat y;
  CGFloat x;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGPoint result;

  y = a6.y;
  x = a6.x;
  v13 = a5.y;
  v14 = a5.x;
  v15 = a4.y;
  v16 = a4.x;
  v17 = a3.y;
  v18 = a3.x;
  switch(-[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass", *(_QWORD *)&a7.x, *(_QWORD *)&a7.y, *(_QWORD *)&a8.x, *(_QWORD *)&a8.y, *(_QWORD *)&a9.x, *(_QWORD *)&a9.y))
  {
    case 0uLL:
      break;
    case 1uLL:
      v18 = v16;
      v17 = v15;
      break;
    case 2uLL:
      v18 = v14;
      v17 = v13;
      break;
    case 4uLL:
      v18 = a10.x;
      v17 = a10.y;
      break;
    case 5uLL:
      v18 = a11.x;
      v17 = a11.y;
      break;
    case 6uLL:
      v18 = v21;
      v17 = v22;
      break;
    case 7uLL:
      v18 = v23;
      v17 = v24;
      break;
    case 8uLL:
      v18 = v25;
      v17 = v26;
      break;
    default:
      v18 = x;
      v17 = y;
      break;
  }
  v19 = v18;
  v20 = v17;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGSize)scaledSize:(CGSize)a3
{
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  -[CLKDeviceMetrics _unroundedScaledValue:](self, "_unroundedScaledValue:", a3.width);
  v6 = v5;
  -[CLKDeviceMetrics _unroundedScaledValue:](self, "_unroundedScaledValue:", height);
  v8 = v7;
  switch(-[CLKDeviceMetrics roundingBehavior](self, "roundingBehavior"))
  {
    case 1uLL:
      CLKSizeRoundForDevice(self->_device);
      goto LABEL_6;
    case 2uLL:
      CLKSizeRoundForDevice(self->_device);
      v6 = v11 + v11;
      v8 = v12 + v12;
      break;
    case 3uLL:
      CLKSizeRoundForDevice(self->_device);
      v6 = v13 * 0.5;
      v8 = v14 * 0.5;
      break;
    case 4uLL:
      UISizeRoundToScale();
LABEL_6:
      v6 = v9;
      v8 = v10;
      break;
    default:
      break;
  }
  v15 = v6;
  v16 = v8;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)constantSize:(CGSize)a3 withOverride:(CGSize)a4 forSizeClass:(unint64_t)a5
{
  double height;
  double width;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v8 = a3.height;
  v9 = a3.width;
  v10 = -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass");
  if (v10 == a5)
    v11 = width;
  else
    v11 = v9;
  if (v10 == a5)
    v12 = height;
  else
    v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)scaledSize:(CGSize)a3 withOverride:(CGSize)a4 forSizeClass:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v7 = a3.height;
  v8 = a3.width;
  if (-[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass") != a5)
  {
    -[CLKDeviceMetrics scaledSize:](self, "scaledSize:", v8, v7);
    width = v10;
    height = v11;
  }
  v12 = width;
  v13 = height;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)constantSize:(CGSize)a3 withOverrides:(id)a4
{
  CGFloat height;
  CGFloat width;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a4;
  objc_msgSend(v7, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "CGSizeValue");
    width = v11;
    height = v12;
  }

  v13 = width;
  v14 = height;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)scaledSize:(CGSize)a3 withOverrides:(id)a4
{
  double height;
  double width;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = a4;
  objc_msgSend(v7, "numberWithUnsignedInteger:", -[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v10, "CGSizeValue");
  else
    -[CLKDeviceMetrics scaledSize:](self, "scaledSize:", width, height);
  v13 = v11;
  v14 = v12;

  v15 = v13;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)sizeCompact:(CGSize)a3 regular:(CGSize)a4 luxoCompact:(CGSize)a5 luxoRegular:(CGSize)a6 aloeCompact:(CGSize)a7 aloeRegular:(CGSize)a8
{
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGSize result;

  -[CLKDeviceMetrics sizeCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:](self, "sizeCompact:regular:luxoCompact:luxoRegular:aloeCompact:aloeRegular:agave:", *(_QWORD *)&a7.width, *(_QWORD *)&a7.height, *(_QWORD *)&a8.width, *(_QWORD *)&a8.height, a3.width, a3.height, a4.width, a4.height, a5.width, a5.height, a6.width, a6.height, v10, v11, v12, v13, v12,
    v13);
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeCompact:(CGSize)a3 regular:(CGSize)a4 luxoCompact:(CGSize)a5 luxoRegular:(CGSize)a6 aloeCompact:(CGSize)a7 aloeRegular:(CGSize)a8 agave:(CGSize)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  height = a6.height;
  width = a6.width;
  v11 = a5.height;
  v12 = a5.width;
  v13 = a4.height;
  v14 = a4.width;
  v15 = a3.height;
  v16 = a3.width;
  switch(-[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass", *(_QWORD *)&a7.width, *(_QWORD *)&a7.height, *(_QWORD *)&a8.width, *(_QWORD *)&a8.height, *(_QWORD *)&a9.width, *(_QWORD *)&a9.height))
  {
    case 0uLL:
      break;
    case 1uLL:
      v16 = v14;
      v15 = v13;
      break;
    case 2uLL:
      v16 = v12;
      v15 = v11;
      break;
    case 4uLL:
    case 7uLL:
      v16 = v19;
      v15 = v20;
      break;
    case 5uLL:
      v16 = v21;
      v15 = v22;
      break;
    case 6uLL:
    case 8uLL:
      v16 = v23;
      v15 = v24;
      break;
    default:
      v16 = width;
      v15 = height;
      break;
  }
  v17 = v16;
  v18 = v15;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)sizeCompact:(CGSize)a3 regular:(CGSize)a4 luxoCompact:(CGSize)a5 luxoRegular:(CGSize)a6 aloeCompact:(CGSize)a7 aloeRegular:(CGSize)a8 agave:(CGSize)a9 avoniaCompact:(CGSize)a10 avoniaRegular:(CGSize)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  height = a6.height;
  width = a6.width;
  v13 = a5.height;
  v14 = a5.width;
  v15 = a4.height;
  v16 = a4.width;
  v17 = a3.height;
  v18 = a3.width;
  switch(-[CLKDeviceMetrics _effectiveSizeClass](self, "_effectiveSizeClass", *(_QWORD *)&a7.width, *(_QWORD *)&a7.height, *(_QWORD *)&a8.width, *(_QWORD *)&a8.height, *(_QWORD *)&a9.width, *(_QWORD *)&a9.height))
  {
    case 0uLL:
      break;
    case 1uLL:
      v18 = v16;
      v17 = v15;
      break;
    case 2uLL:
      v18 = v14;
      v17 = v13;
      break;
    case 4uLL:
      v18 = a10.width;
      v17 = a10.height;
      break;
    case 5uLL:
      v18 = a11.width;
      v17 = a11.height;
      break;
    case 6uLL:
      v18 = v21;
      v17 = v22;
      break;
    case 7uLL:
      v18 = v23;
      v17 = v24;
      break;
    case 8uLL:
      v18 = v25;
      v17 = v26;
      break;
    default:
      v18 = width;
      v17 = height;
      break;
  }
  v19 = v18;
  v20 = v17;
  result.height = v20;
  result.width = v19;
  return result;
}

- (unint64_t)roundingBehavior
{
  return self->_roundingBehavior;
}

- (void)setRoundingBehavior:(unint64_t)a3
{
  self->_roundingBehavior = a3;
}

- (NSNumber)newestAllowedSizeClass
{
  return self->_newestAllowedSizeClass;
}

- (void)setNewestAllowedSizeClass:(id)a3
{
  objc_storeStrong((id *)&self->_newestAllowedSizeClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newestAllowedSizeClass, 0);
  objc_storeStrong((id *)&self->_scales, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
