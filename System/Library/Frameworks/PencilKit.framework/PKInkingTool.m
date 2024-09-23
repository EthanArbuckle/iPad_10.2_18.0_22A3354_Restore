@implementation PKInkingTool

- (PKInkingTool)initWithInkType:(PKInkType)type color:(UIColor *)color width:(CGFloat)width
{
  NSString *v8;
  UIColor *v9;
  void *v10;
  PKInkingTool *v11;
  objc_super v13;

  v8 = type;
  v9 = color;
  +[PKInkingTool _weightForWidth:type:](PKInkingTool, "_weightForWidth:type:", v8, width);
  +[PKInk inkWithType:color:weight:](PKInk, "inkWithType:color:weight:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PKInkingTool;
  v11 = -[PKTool _initWithInk:](&v13, sel__initWithInk_, v10);

  return v11;
}

- (PKInkingTool)initWithInkType:(PKInkType)type color:(UIColor *)color
{
  NSString *v6;
  UIColor *v7;
  PKInkingTool *v8;

  v6 = type;
  v7 = color;
  +[PKInkingTool defaultWidthForInkType:](PKInkingTool, "defaultWidthForInkType:", v6);
  v8 = -[PKInkingTool initWithInkType:color:width:](self, "initWithInkType:color:width:", v6, v7);

  return v8;
}

- (PKInkingTool)initWithInk:(PKInk *)ink width:(CGFloat)width
{
  PKInk *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  PKInkingTool *v11;

  v6 = ink;
  -[PKInk inkType](v6, "inkType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkingTool _weightForWidth:type:](PKInkingTool, "_weightForWidth:type:", v7, width);
  v9 = v8;

  +[PKInk inkFromInk:weight:](PKInk, "inkFromInk:weight:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PKTool _initWithInk:](self, "_initWithInk:", v10);

  return v11;
}

- (PKInkType)inkType
{
  void *v2;
  void *v3;

  -[PKTool ink](self, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKInkType)v3;
}

- (UIColor)color
{
  void *v2;
  void *v3;

  -[PKTool ink](self, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (CGFloat)width
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;

  -[PKTool ink](self, "ink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "useUnclampedWeight");

  -[PKTool ink](self, "ink");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "weight");
  v8 = v7;
  if (!v5)
  {
    -[PKTool ink](self, "ink");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInkingTool _widthForWeight:type:](PKInkingTool, "_widthForWeight:type:", v10, v8);
    v8 = v11;

  }
  return v8;
}

- (PKContentVersion)requiredContentVersion
{
  void *v2;
  PKContentVersion v3;

  -[PKTool ink](self, "ink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "requiredContentVersion");

  return v3;
}

+ (double)_widthForWeight:(double)a3 type:(id)a4
{
  id v5;
  unsigned __int8 *v6;
  uint64_t v7;
  void *__p[2];
  char v10;

  v5 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v6 = std::__hash_table<std::__hash_value_type<std::string,WeightInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,WeightInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,WeightInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,WeightInfo>>>::find<std::string>((_QWORD *)+[PKInkingTool _weightInfoMap](PKInkingTool, "_weightInfoMap"), (unsigned __int8 *)__p);
  +[PKInkingTool _weightInfoMap](PKInkingTool, "_weightInfoMap");
  if (v6)
  {
    v7 = *((_QWORD *)v6 + 5);
    if (v7)
      a3 = PKFunctionPiecewiseSimpleLinear::_solveLinearPiecewise(*(double **)v7, *(_QWORD *)(v7 + 8), *(_QWORD *)(v7 + 24), *(_QWORD *)(v7 + 32), a3);
  }
  if (v10 < 0)
    operator delete(__p[0]);

  return a3;
}

+ (double)_weightForWidth:(double)a3 type:(id)a4
{
  id v5;
  unsigned __int8 *v6;
  uint64_t v7;
  void *__p[2];
  char v10;

  v5 = objc_retainAutorelease(a4);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v5, "UTF8String"));
  v6 = std::__hash_table<std::__hash_value_type<std::string,WeightInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,WeightInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,WeightInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,WeightInfo>>>::find<std::string>((_QWORD *)+[PKInkingTool _weightInfoMap](PKInkingTool, "_weightInfoMap"), (unsigned __int8 *)__p);
  +[PKInkingTool _weightInfoMap](PKInkingTool, "_weightInfoMap");
  if (v6)
  {
    v7 = *((_QWORD *)v6 + 5);
    if (v7)
      a3 = PKFunctionPiecewiseSimpleLinear::_solveLinearPiecewise(*(double **)(v7 + 24), *(_QWORD *)(v7 + 32), *(_QWORD *)v7, *(_QWORD *)(v7 + 8), a3);
  }
  if (v10 < 0)
    operator delete(__p[0]);

  return a3;
}

+ (CGFloat)defaultWidthForInkType:(PKInkType)inkType
{
  NSString *v3;
  unsigned __int8 *v4;
  double v5;
  void *__p[2];
  char v8;

  v3 = objc_retainAutorelease(inkType);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[NSString UTF8String](v3, "UTF8String"));
  v4 = std::__hash_table<std::__hash_value_type<std::string,WeightInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,WeightInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,WeightInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,WeightInfo>>>::find<std::string>((_QWORD *)+[PKInkingTool _weightInfoMap](PKInkingTool, "_weightInfoMap"), (unsigned __int8 *)__p);
  +[PKInkingTool _weightInfoMap](PKInkingTool, "_weightInfoMap");
  if (v4)
    v5 = *((double *)v4 + 6);
  else
    v5 = 1.0;
  if (v8 < 0)
    operator delete(__p[0]);

  return v5;
}

+ (CGFloat)minimumWidthForInkType:(PKInkType)inkType
{
  NSString *v3;
  unsigned __int8 *v4;
  double v5;
  void *__p[2];
  char v8;

  v3 = objc_retainAutorelease(inkType);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[NSString UTF8String](v3, "UTF8String"));
  v4 = std::__hash_table<std::__hash_value_type<std::string,WeightInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,WeightInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,WeightInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,WeightInfo>>>::find<std::string>((_QWORD *)+[PKInkingTool _weightInfoMap](PKInkingTool, "_weightInfoMap"), (unsigned __int8 *)__p);
  +[PKInkingTool _weightInfoMap](PKInkingTool, "_weightInfoMap");
  if (v4)
    v5 = *((double *)v4 + 7);
  else
    v5 = 1.0;
  if (v8 < 0)
    operator delete(__p[0]);

  return v5;
}

+ (CGFloat)maximumWidthForInkType:(PKInkType)inkType
{
  NSString *v3;
  unsigned __int8 *v4;
  double v5;
  void *__p[2];
  char v8;

  v3 = objc_retainAutorelease(inkType);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)-[NSString UTF8String](v3, "UTF8String"));
  v4 = std::__hash_table<std::__hash_value_type<std::string,WeightInfo>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,WeightInfo>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,WeightInfo>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,WeightInfo>>>::find<std::string>((_QWORD *)+[PKInkingTool _weightInfoMap](PKInkingTool, "_weightInfoMap"), (unsigned __int8 *)__p);
  +[PKInkingTool _weightInfoMap](PKInkingTool, "_weightInfoMap");
  if (v4)
    v5 = *((double *)v4 + 8);
  else
    v5 = 1.0;
  if (v8 < 0)
    operator delete(__p[0]);

  return v5;
}

+ (UIColor)convertColor:(UIColor *)color fromUserInterfaceStyle:(UIUserInterfaceStyle)fromUserInterfaceStyle to:(UIUserInterfaceStyle)toUserInterfaceStyle
{
  UIColor *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  CGColorRef v12;

  v8 = color;
  if (objc_msgSend(a1, "_isUsingSystemColorPicker"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "pk_convertColorPickerColor:fromUserInterfaceStyle:to:", v8, fromUserInterfaceStyle, toUserInterfaceStyle);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v10 = (void *)v9;

    goto LABEL_11;
  }
  v10 = v8;
  if (toUserInterfaceStyle)
  {
    v10 = v8;
    if (fromUserInterfaceStyle)
    {
      v10 = v8;
      if (fromUserInterfaceStyle != toUserInterfaceStyle)
      {
        v11 = -[UIColor CGColor](objc_retainAutorelease(v8), "CGColor");
        if (toUserInterfaceStyle == UIUserInterfaceStyleDark)
          v12 = DKUConvertColorForDarkStyle(v11);
        else
          v12 = DKUConvertColorForLightStyle(v11);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v12);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
  }
LABEL_11:

  return (UIColor *)v10;
}

+ (BOOL)_isUsingSystemColorPicker
{
  return 1;
}

+ ($A12969824567280A8964284EC573CDAA)_contextForStroke:(SEL)a3 weight:(id)a4 type:(double)a5
{
  id v9;
  void *v10;
  void *v11;
  $A12969824567280A8964284EC573CDAA *result;
  id v18;

  v18 = a4;
  v9 = a6;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInk inkWithType:color:weight:](PKInk, "inkWithType:color:weight:", v9, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setInk:", v11);

  *(_OWORD *)&retstr->var0.altitude = 0u;
  *(_OWORD *)&retstr->var0.radius2 = 0u;
  *(_OWORD *)&retstr->var0.aspectRatio = 0u;
  *(_OWORD *)&retstr->var0.force = 0u;
  *(_OWORD *)&retstr->var0.timestamp = 0u;
  *(_OWORD *)&retstr->var0.location.y = 0u;
  retstr->var2 = 1;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&retstr->var3 = _Q0;
  retstr->var5 = 0.0;
  retstr->var6 = 0.0;
  retstr->var7 = v18;
  retstr->var8 = 23;

  return result;
}

+ (double)_calculateWidthForWeight:(double)a3 type:(id)a4
{
  id v6;
  _PKStrokeConcrete *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v6 = a4;
  v7 = objc_alloc_init(_PKStrokeConcrete);
  v18 = 0;
  v17 = 0u;
  objc_msgSend(a1, "_contextForStroke:weight:type:", v7, v6, a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0);
  objc_msgSend(*((id *)&v17 + 1), "ink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInkBehavior radiusForPoint:context:]((uint64_t)v9, &PKInkingToolWidthCalcPoint, (uint64_t)&v16);
  v11 = v10;

  objc_msgSend(*((id *)&v17 + 1), "ink");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "behavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PKInkBehavior edgeWidthForPoint:context:]((uint64_t)v13, &PKInkingToolWidthCalcPoint, (uint64_t)&v16);

  return v14 + v11 * 2.0;
}

+ (double)_calculateEdgeWidthForWeight:(double)a3 type:(id)a4
{
  id v6;
  _PKStrokeConcrete *v7;
  void *v8;
  void *v9;
  double v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v6 = a4;
  v7 = objc_alloc_init(_PKStrokeConcrete);
  v14 = 0;
  v13 = 0u;
  objc_msgSend(a1, "_contextForStroke:weight:type:", v7, v6, a3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0);
  objc_msgSend(*((id *)&v13 + 1), "ink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PKInkBehavior edgeWidthForPoint:context:]((uint64_t)v9, &PKInkingToolWidthCalcPoint, (uint64_t)&v12);

  return v10;
}

+ (id)behaviorForInkType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[PKInkManager defaultInkManager](PKInkManager, "defaultInkManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "supportedInkIdentifierFromIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKInkManager defaultInkManager](PKInkManager, "defaultInkManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inkBehaviorForIdentifier:version:variant:", v5, +[PKInk currentInkVersionForInkIdentifier:](PKInk, "currentInkVersionForInkIdentifier:", v5), CFSTR("default"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)_computeWeightInfoMapFor:(id)a3 in:(void *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  double *v15;
  double *v16;
  double *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  double *v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  _QWORD *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  int v36;
  int v37;
  double v38;
  double v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  id v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint8x8_t v51;
  unint64_t v52;
  void **v53;
  char *v54;
  unint64_t v55;
  _QWORD *v56;
  float v57;
  float v58;
  _BOOL8 v59;
  unint64_t v60;
  unint64_t v61;
  int8x8_t prime;
  void *v63;
  _QWORD *v64;
  uint64_t v65;
  _QWORD *v66;
  unint64_t v67;
  uint8x8_t v68;
  unint64_t v69;
  uint8x8_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  _QWORD *v78;
  unint64_t v79;
  _QWORD *v80;
  _QWORD *v81;
  unint64_t v82;
  void *v83;
  _QWORD *v84;
  void *v85;
  void *__p[2];
  uint64_t v87;

  v6 = a3;
  +[PKInkingTool behaviorForInkType:](PKInkingTool, "behaviorForInkType:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v85 = (void *)v7;
  if ((objc_msgSend((id)v7, "useUnclampedWeight") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v8 = operator new();
    v9 = 0;
    *(_OWORD *)(v8 + 16) = 0u;
    v10 = (void **)(v8 + 24);
    *(_OWORD *)(v8 + 32) = 0u;
    *(_OWORD *)v8 = 0u;
    do
    {
      v11 = ((double)v9 + (double)v9) / 10.0 + -1.0;
      objc_msgSend(a1, "_calculateWidthForWeight:type:", v6, v11);
      v13 = v12;
      v15 = *(double **)(v8 + 8);
      v14 = *(_QWORD *)(v8 + 16);
      if ((unint64_t)v15 >= v14)
      {
        v17 = *(double **)v8;
        v18 = ((uint64_t)v15 - *(_QWORD *)v8) >> 3;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61)
          goto LABEL_131;
        v20 = v14 - (_QWORD)v17;
        if (v20 >> 2 > v19)
          v19 = v20 >> 2;
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
          v21 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v21 = v19;
        if (v21)
        {
          v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v8 + 16, v21);
          v17 = *(double **)v8;
          v15 = *(double **)(v8 + 8);
        }
        else
        {
          v22 = 0;
        }
        v23 = (double *)&v22[8 * v18];
        *v23 = v11;
        v16 = v23 + 1;
        while (v15 != v17)
        {
          v24 = *((_QWORD *)v15-- - 1);
          *((_QWORD *)v23-- - 1) = v24;
        }
        *(_QWORD *)v8 = v23;
        *(_QWORD *)(v8 + 8) = v16;
        *(_QWORD *)(v8 + 16) = &v22[8 * v21];
        if (v17)
          operator delete(v17);
      }
      else
      {
        *v15 = v11;
        v16 = v15 + 1;
      }
      *(_QWORD *)(v8 + 8) = v16;
      v26 = *(char **)(v8 + 32);
      v25 = *(_QWORD *)(v8 + 40);
      if ((unint64_t)v26 >= v25)
      {
        v28 = (char *)*v10;
        v29 = (v26 - (_BYTE *)*v10) >> 3;
        v30 = v29 + 1;
        if ((unint64_t)(v29 + 1) >> 61)
LABEL_131:
          std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
        v31 = v25 - (_QWORD)v28;
        if (v31 >> 2 > v30)
          v30 = v31 >> 2;
        if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8)
          v32 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v32 = v30;
        if (v32)
        {
          v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v8 + 40, v32);
          v28 = *(char **)(v8 + 24);
          v26 = *(char **)(v8 + 32);
        }
        else
        {
          v33 = 0;
        }
        v34 = &v33[8 * v29];
        *(_QWORD *)v34 = v13;
        v27 = v34 + 8;
        while (v26 != v28)
        {
          v35 = *((_QWORD *)v26 - 1);
          v26 -= 8;
          *((_QWORD *)v34 - 1) = v35;
          v34 -= 8;
        }
        *(_QWORD *)(v8 + 24) = v34;
        *(_QWORD *)(v8 + 32) = v27;
        *(_QWORD *)(v8 + 40) = &v33[8 * v32];
        if (v28)
          operator delete(v28);
      }
      else
      {
        *(_QWORD *)v26 = v13;
        v27 = v26 + 8;
      }
      *(_QWORD *)(v8 + 32) = v27;
      ++v9;
    }
    while (v9 != 11);
  }
  v36 = objc_msgSend((id)v7, "useUnclampedWeight");
  if (v8)
    v37 = v36;
  else
    v37 = 1;
  if (v37 == 1)
  {
    objc_msgSend((id)v7, "defaultWidth");
    v39 = v38;
    if (!v8)
    {
      objc_msgSend((id)v7, "uiWidths");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "firstObject");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "doubleValue");
      v45 = v74;

      objc_msgSend((id)v7, "uiWidths");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "lastObject");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "doubleValue");
      v46 = v77;

      goto LABEL_45;
    }
    v40 = *(double **)v8;
    v41 = *(_QWORD *)(v8 + 8);
    v42 = *(_QWORD *)(v8 + 24);
    v43 = *(_QWORD *)(v8 + 32);
  }
  else
  {
    +[PKInk defaultWeightForIdentifier:](PKInk, "defaultWeightForIdentifier:", v6);
    v40 = *(double **)v8;
    v41 = *(_QWORD *)(v8 + 8);
    v42 = *(_QWORD *)(v8 + 24);
    v43 = *(_QWORD *)(v8 + 32);
    v39 = PKFunctionPiecewiseSimpleLinear::_solveLinearPiecewise(*(double **)v8, v41, v42, v43, v44);
  }
  v45 = PKFunctionPiecewiseSimpleLinear::_solveLinearPiecewise(v40, v41, v42, v43, -1.0);
  v46 = PKFunctionPiecewiseSimpleLinear::_solveLinearPiecewise(v40, v41, v42, v43, 1.0);
LABEL_45:
  v47 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v47, "UTF8String"));
  v48 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)a4 + 24, (uint64_t)__p);
  v49 = v48;
  v50 = *((_QWORD *)a4 + 1);
  if (v50)
  {
    v51 = (uint8x8_t)vcnt_s8((int8x8_t)v50);
    v51.i16[0] = vaddlv_u8(v51);
    v52 = v51.u32[0];
    if (v51.u32[0] > 1uLL)
    {
      v7 = v48;
      if (v48 >= v50)
        v7 = v48 % v50;
    }
    else
    {
      v7 = (v50 - 1) & v48;
    }
    v53 = *(void ***)(*(_QWORD *)a4 + 8 * v7);
    if (v53)
    {
      v54 = (char *)*v53;
      if (*v53)
      {
        do
        {
          v55 = *((_QWORD *)v54 + 1);
          if (v55 == v49)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v54 + 16, (unsigned __int8 *)__p))
            {
              v83 = v85;
              goto LABEL_119;
            }
          }
          else
          {
            if (v52 > 1)
            {
              if (v55 >= v50)
                v55 %= v50;
            }
            else
            {
              v55 &= v50 - 1;
            }
            if (v55 != v7)
              break;
          }
          v54 = *(char **)v54;
        }
        while (v54);
      }
    }
  }
  v54 = (char *)operator new(0x48uLL);
  v56 = (char *)a4 + 16;
  *(_QWORD *)v54 = 0;
  *((_QWORD *)v54 + 1) = v49;
  *((_OWORD *)v54 + 1) = *(_OWORD *)__p;
  *((_QWORD *)v54 + 4) = v87;
  __p[0] = 0;
  __p[1] = 0;
  v87 = 0;
  *(_OWORD *)(v54 + 40) = 0u;
  *(_OWORD *)(v54 + 56) = 0u;
  v57 = (float)(unint64_t)(*((_QWORD *)a4 + 3) + 1);
  v58 = *((float *)a4 + 8);
  if (!v50 || (float)(v58 * (float)v50) < v57)
  {
    v59 = 1;
    if (v50 >= 3)
      v59 = (v50 & (v50 - 1)) != 0;
    v60 = v59 | (2 * v50);
    v61 = vcvtps_u32_f32(v57 / v58);
    if (v60 <= v61)
      prime = (int8x8_t)v61;
    else
      prime = (int8x8_t)v60;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v50 = *((_QWORD *)a4 + 1);
    }
    if (*(_QWORD *)&prime > v50)
      goto LABEL_74;
    if (*(_QWORD *)&prime < v50)
    {
      v69 = vcvtps_u32_f32((float)*((unint64_t *)a4 + 3) / *((float *)a4 + 8));
      if (v50 < 3 || (v70 = (uint8x8_t)vcnt_s8((int8x8_t)v50), v70.i16[0] = vaddlv_u8(v70), v70.u32[0] > 1uLL))
      {
        v69 = std::__next_prime(v69);
      }
      else
      {
        v71 = 1 << -(char)__clz(v69 - 1);
        if (v69 >= 2)
          v69 = v71;
      }
      if (*(_QWORD *)&prime <= v69)
        prime = (int8x8_t)v69;
      if (*(_QWORD *)&prime >= v50)
      {
        v50 = *((_QWORD *)a4 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_74:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v63 = operator new(8 * *(_QWORD *)&prime);
          v64 = *(_QWORD **)a4;
          *(_QWORD *)a4 = v63;
          if (v64)
            operator delete(v64);
          v65 = 0;
          *((int8x8_t *)a4 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a4 + 8 * v65++) = 0;
          while (*(_QWORD *)&prime != v65);
          v66 = (_QWORD *)*v56;
          if (*v56)
          {
            v67 = v66[1];
            v68 = (uint8x8_t)vcnt_s8(prime);
            v68.i16[0] = vaddlv_u8(v68);
            if (v68.u32[0] > 1uLL)
            {
              if (v67 >= *(_QWORD *)&prime)
                v67 %= *(_QWORD *)&prime;
            }
            else
            {
              v67 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a4 + 8 * v67) = v56;
            v78 = (_QWORD *)*v66;
            if (*v66)
            {
              do
              {
                v79 = v78[1];
                if (v68.u32[0] > 1uLL)
                {
                  if (v79 >= *(_QWORD *)&prime)
                    v79 %= *(_QWORD *)&prime;
                }
                else
                {
                  v79 &= *(_QWORD *)&prime - 1;
                }
                if (v79 != v67)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a4 + 8 * v79))
                  {
                    *(_QWORD *)(*(_QWORD *)a4 + 8 * v79) = v66;
                    goto LABEL_100;
                  }
                  *v66 = *v78;
                  *v78 = **(_QWORD **)(*(_QWORD *)a4 + 8 * v79);
                  **(_QWORD **)(*(_QWORD *)a4 + 8 * v79) = v78;
                  v78 = v66;
                }
                v79 = v67;
LABEL_100:
                v66 = v78;
                v78 = (_QWORD *)*v78;
                v67 = v79;
              }
              while (v78);
            }
          }
          v50 = (unint64_t)prime;
          goto LABEL_104;
        }
        v84 = *(_QWORD **)a4;
        *(_QWORD *)a4 = 0;
        if (v84)
          operator delete(v84);
        v50 = 0;
        *((_QWORD *)a4 + 1) = 0;
      }
    }
LABEL_104:
    if ((v50 & (v50 - 1)) != 0)
    {
      if (v49 >= v50)
        v7 = v49 % v50;
      else
        v7 = v49;
    }
    else
    {
      v7 = (v50 - 1) & v49;
    }
  }
  v80 = *(_QWORD **)a4;
  v81 = *(_QWORD **)(*(_QWORD *)a4 + 8 * v7);
  if (v81)
  {
    *(_QWORD *)v54 = *v81;
    v83 = v85;
LABEL_117:
    *v81 = v54;
    goto LABEL_118;
  }
  *(_QWORD *)v54 = *v56;
  *v56 = v54;
  v80[v7] = v56;
  v83 = v85;
  if (*(_QWORD *)v54)
  {
    v82 = *(_QWORD *)(*(_QWORD *)v54 + 8);
    if ((v50 & (v50 - 1)) != 0)
    {
      if (v82 >= v50)
        v82 %= v50;
    }
    else
    {
      v82 &= v50 - 1;
    }
    v81 = (_QWORD *)(*(_QWORD *)a4 + 8 * v82);
    goto LABEL_117;
  }
LABEL_118:
  ++*((_QWORD *)a4 + 3);
LABEL_119:
  *((_QWORD *)v54 + 5) = v8;
  *((double *)v54 + 6) = v39;
  *((double *)v54 + 7) = v45;
  *((double *)v54 + 8) = v46;
  if (SHIBYTE(v87) < 0)
    operator delete(__p[0]);

}

+ (void)_weightInfoMap
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PKInkingTool__weightInfoMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_121 != -1)
    dispatch_once(&_MergedGlobals_121, block);
  return (void *)qword_1ECEE6188;
}

uint64_t __30__PKInkingTool__weightInfoMap__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = operator new();
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_DWORD *)(v2 + 32) = 1065353216;
  qword_1ECEE6188 = v2;
  objc_msgSend(*(id *)(a1 + 32), "_computeWeightInfoMapFor:in:", CFSTR("com.apple.ink.pen"), v2);
  objc_msgSend(*(id *)(a1 + 32), "_computeWeightInfoMapFor:in:", CFSTR("com.apple.ink.marker"), qword_1ECEE6188);
  objc_msgSend(*(id *)(a1 + 32), "_computeWeightInfoMapFor:in:", CFSTR("com.apple.ink.pencil"), qword_1ECEE6188);
  objc_msgSend(*(id *)(a1 + 32), "_computeWeightInfoMapFor:in:", CFSTR("com.apple.ink.monoline"), qword_1ECEE6188);
  objc_msgSend(*(id *)(a1 + 32), "_computeWeightInfoMapFor:in:", CFSTR("com.apple.ink.fountainpen"), qword_1ECEE6188);
  objc_msgSend(*(id *)(a1 + 32), "_computeWeightInfoMapFor:in:", CFSTR("com.apple.ink.watercolor"), qword_1ECEE6188);
  objc_msgSend(*(id *)(a1 + 32), "_computeWeightInfoMapFor:in:", CFSTR("com.apple.ink.crayon"), qword_1ECEE6188);
  return objc_msgSend(*(id *)(a1 + 32), "_computeWeightInfoMapFor:in:", CFSTR("com.apple.ink.eraser"), qword_1ECEE6188);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInkingTool inkType](self, "inkType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInkingTool color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKInkingTool width](self, "width");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ color=%@ width=%f>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_isInkingTool
{
  return 1;
}

- (Class)_toolPickerItemClass
{
  return (Class)objc_opt_class();
}

@end
