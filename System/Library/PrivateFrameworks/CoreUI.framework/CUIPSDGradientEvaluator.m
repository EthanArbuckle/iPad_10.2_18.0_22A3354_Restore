@implementation CUIPSDGradientEvaluator

+ (void)initialize
{
  if ((id)objc_opt_class(CUIPSDGradientEvaluator, a2) == a1)
    objc_msgSend(a1, "setVersion:", 2);
}

- (id)_cleanedUpMidpointLocationsFromLocations:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  double v9;
  id v11;
  char *v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  double v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "doubleValue");
        if (v9 >= 1.0 || v9 <= 0.0)
          v9 = 0.5;
        objc_msgSend(v4, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }
  v11 = objc_msgSend(v4, "reverseObjectEnumerator");
  v12 = (char *)objc_msgSend(v4, "count");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    while (2)
    {
      v16 = 0;
      v17 = (char *)(v12 - v14);
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16), "doubleValue");
        if (v18 != 0.5)
        {
          v17 = (char *)(v12 - (_BYTE *)v16);
          return objc_msgSend(v4, "subarrayWithRange:", 0, v17);
        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      v12 = v17;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v17 = v12;
  }
  return objc_msgSend(v4, "subarrayWithRange:", 0, v17);
}

- (void)_createOrderedStops:(id *)a3 midpoints:(id *)a4 fromStops:(id)a5 midpoints:(id)a6 edgePixel:(int64_t *)a7
{
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  _CUIPSDStopAndMidpointPair *v16;
  id v17;
  _CUIPSDStopAndMidpointPair *v18;
  void *v19;
  id v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  CUIPSDGradientColorStop *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CUIPSDGradientColorStop *v29;
  CUIPSDGradientOpacityStop *v30;
  double v31;
  CUIPSDGradientColorStop *v32;
  _CUIPSDStopAndMidpointPair *v33;
  id v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  CUIPSDGradientColorStop *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CUIPSDGradientOpacityStop *v43;
  double v44;
  CUIPSDGradientColorStop *v45;
  CUIPSDGradientColorStop *v46;
  _CUIPSDStopAndMidpointPair *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *j;
  void *v55;
  id v56;
  double v57;
  double v58;
  double v59;
  int64_t v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  uint64_t v64;
  id v65;
  double v66;
  double v67;
  double v68;
  id v69;
  char *v70;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];

  v8 = objc_msgSend(a6, "count");
  v70 = (char *)objc_msgSend(a5, "count");
  v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v70);
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v10 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v81;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v81 != v13)
          objc_enumerationMutation(a5);
        v15 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
        v16 = [_CUIPSDStopAndMidpointPair alloc];
        if (v12 >= (unint64_t)v8)
          v17 = 0;
        else
          v17 = objc_msgSend(a6, "objectAtIndex:", v12++);
        v18 = -[_CUIPSDStopAndMidpointPair initWithStop:midpoint:](v16, "initWithStop:midpoint:", v15, v17);
        objc_msgSend(v9, "addObject:", v18);

      }
      v11 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    }
    while (v11);
  }
  v19 = v9;
  objc_msgSend(v9, "sortUsingSelector:", sel_compare_);
  if (v70)
  {
    v20 = objc_msgSend(objc_msgSend(v9, "objectAtIndex:", 0), "stop");
    objc_msgSend(v20, "location");
    if (v22 != 0.0)
    {
      v23 = objc_opt_class(CUIPSDGradientColorStop, v21);
      if ((objc_opt_isKindOfClass(v20, v23) & 1) != 0)
      {
        v24 = [CUIPSDGradientColorStop alloc];
        objc_msgSend(v20, "gradientColor");
        v29 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:](v24, "initWithLocation:gradientColor:", 0.0, v25, v26, v27, v28);
      }
      else
      {
        v30 = [CUIPSDGradientOpacityStop alloc];
        objc_msgSend(v20, "opacity");
        v29 = -[CUIPSDGradientOpacityStop initWithLocation:opacity:](v30, "initWithLocation:opacity:", 0.0, v31);
      }
      v32 = v29;
      v33 = -[_CUIPSDStopAndMidpointPair initWithStop:midpoint:]([_CUIPSDStopAndMidpointPair alloc], "initWithStop:midpoint:", v29, 0);

      objc_msgSend(v9, "insertObject:atIndex:", v33, 0);
    }
    v34 = objc_msgSend(objc_msgSend(v9, "lastObject"), "stop");
    objc_msgSend(v34, "location");
    if (v36 != 1.0)
    {
      v37 = objc_opt_class(CUIPSDGradientColorStop, v35);
      if ((objc_opt_isKindOfClass(v34, v37) & 1) != 0)
      {
        v38 = [CUIPSDGradientColorStop alloc];
        if (objc_msgSend(v34, "isDoubleStop"))
          objc_msgSend(v34, "leadOutColor");
        else
          objc_msgSend(v34, "gradientColor");
        v45 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:](v38, "initWithLocation:gradientColor:", 1.0, v39, v40, v41, v42);
      }
      else
      {
        v43 = [CUIPSDGradientOpacityStop alloc];
        if (objc_msgSend(v34, "isDoubleStop"))
          objc_msgSend(v34, "leadOutOpacity");
        else
          objc_msgSend(v34, "opacity");
        v45 = -[CUIPSDGradientOpacityStop initWithLocation:opacity:](v43, "initWithLocation:opacity:", 1.0, v44);
      }
      v46 = v45;
      v47 = -[_CUIPSDStopAndMidpointPair initWithStop:midpoint:]([_CUIPSDStopAndMidpointPair alloc], "initWithStop:midpoint:", v45, 0);

      objc_msgSend(v19, "addObject:", v47);
    }
  }
  v48 = objc_msgSend(v19, "count");
  v49 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v48);
  v50 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v48);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v51 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v52; j = (char *)j + 1)
      {
        if (*(_QWORD *)v77 != v53)
          objc_enumerationMutation(v19);
        v55 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v49, "addObject:", objc_msgSend(v55, "stop"));
        objc_msgSend(v55, "midpoint");
        objc_msgSend(v50, "addObject:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      }
      v52 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
    }
    while (v52);
  }
  if ((unint64_t)v70 < 3)
  {
    v62 = objc_msgSend(objc_msgSend(v49, "firstObject"), "isDoubleStop");
    v60 = v62;
    v63 = objc_msgSend(objc_msgSend(v49, "lastObject"), "isDoubleStop");
    v64 = 2;
    if (v62)
      v64 = 3;
    if (v63)
      v60 = v64;
  }
  else
  {
    v56 = objc_msgSend(v49, "objectAtIndex:", 1);
    if ((objc_msgSend(objc_msgSend(v49, "firstObject"), "isDoubleStop") & 1) != 0
      || objc_msgSend(v56, "isDoubleStop")
      && (objc_msgSend(v56, "location"),
          v58 = v57,
          objc_msgSend(objc_msgSend(v49, "objectAtIndex:", 0), "location"),
          v58 - v59 < 0.02))
    {
      v60 = 1;
      v61 = 3;
    }
    else
    {
      v60 = 0;
      v61 = 2;
    }
    v65 = objc_msgSend(v49, "objectAtIndex:", v70 - 2);
    if ((objc_msgSend(objc_msgSend(v49, "lastObject"), "isDoubleStop") & 1) != 0
      || objc_msgSend(v65, "isDoubleStop")
      && (objc_msgSend(objc_msgSend(v49, "lastObject"), "location"),
          v67 = v66,
          objc_msgSend(v65, "location"),
          v67 - v68 < 0.02))
    {
      v60 = v61;
    }
  }
  v69 = -[CUIPSDGradientEvaluator _cleanedUpMidpointLocationsFromLocations:](self, "_cleanedUpMidpointLocationsFromLocations:", v50);

  *a7 = v60;
  *a3 = v49;
  *a4 = v69;
}

- (CUIPSDGradientEvaluator)initWithColorStops:(id)a3 colorMidpoints:(id)a4 opacityStops:(id)a5 opacityMidpoints:(id)a6 smoothingCoefficient:(double)a7 fillCoefficient:(double)a8
{
  return -[CUIPSDGradientEvaluator initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:](self, "initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:", a3, a4, a5, a6, 0, a7, 1.0, 1.0, 1.0, a8);
}

- (CUIPSDGradientEvaluator)initWithColorStops:(id)a3 colorMidpoints:(id)a4 opacityStops:(id)a5 opacityMidpoints:(id)a6 smoothingCoefficient:(double)a7 fillColor:(_psdGradientColor)a8 dither:(BOOL)a9
{
  _BOOL4 v9;
  double alpha;
  char *v16;
  float64x2_t v17;
  int8x16_t v18;
  double v19;
  int8x16_t v25;
  char v26;
  double red;
  double blue;
  double green;
  uint64_t v32;
  objc_super v33;

  v9 = a9;
  alpha = a8.alpha;
  blue = a8.blue;
  green = a8.green;
  red = a8.red;
  v33.receiver = self;
  v33.super_class = (Class)CUIPSDGradientEvaluator;
  v16 = -[CUIPSDGradientEvaluator init](&v33, sel_init);
  if (v16)
  {
    if (!objc_msgSend(a3, "count"))
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("CUIPSDGradientEvaluator.m"), 714, CFSTR("CUIPSDGradientEvaluator requires at least one color stop for initialization"));
    v17.f64[0] = a7;
    v17.f64[1] = red;
    v18 = (int8x16_t)vcltzq_f64(v17);
    v19 = 0.0;
    if (alpha >= 0.0)
      v19 = alpha;
    *((double *)v16 + 9) = fmin(v19, 1.0);
    __asm { FMOV            V1.2D, #1.0 }
    *(float64x2_t *)(v16 + 40) = vminnmq_f64((float64x2_t)vbicq_s8((int8x16_t)v17, v18), _Q1);
    *(double *)v25.i64 = green;
    *(double *)&v25.i64[1] = blue;
    *(float64x2_t *)(v16 + 56) = vminnmq_f64((float64x2_t)vbicq_s8(v25, (int8x16_t)vcltzq_f64((float64x2_t)v25)), _Q1);
    v32 = 0;
    objc_msgSend(v16, "_createOrderedStops:midpoints:fromStops:midpoints:edgePixel:", v16 + 8, v16 + 16, a3, a4, &v32);
    v16[88] = v16[88] & 0xFC | v32 & 3;
    objc_msgSend(v16, "_createOrderedStops:midpoints:fromStops:midpoints:edgePixel:", v16 + 24, v16 + 32, a5, a6, &v32);
    if (v9)
      v26 = 16;
    else
      v26 = 0;
    v16[88] = v16[88] & 0xE3 | v26 | (4 * (v32 & 3));
  }
  return (CUIPSDGradientEvaluator *)v16;
}

- (CUIPSDGradientEvaluator)initWithCoder:(id)a3
{
  CUIPSDGradientEvaluator *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  int v19;
  int v20;
  double v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CUIPSDGradientEvaluator;
  v4 = -[CUIPSDGradientEvaluator init](&v22, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "allowsKeyedCoding"))
    {
      v5 = (uint64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("CUIPSDGradientEvaluatorVersion"));
      v4->colorStops = (NSArray *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("CUIPSDGradientEvaluatorColorStops"));
      v4->colorMidpointLocations = (NSArray *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("CUIPSDGradientEvaluatorColorMidpointLocations"));
      v4->opacityStops = (NSArray *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("CUIPSDGradientEvaluatorOpacityStops"));
      v4->opacityMidpointLocations = (NSArray *)objc_msgSend(a3, "decodeObjectForKey:", CFSTR("CUIPSDGradientEvaluatorOpacityMidpointLocations"));
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientEvaluatorSmoothingCoefficient"));
      v4->smoothingCoefficient = v6;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientEvaluatorFillCoefficient"));
      v4->fillColor.alpha = v7;
      if (v5 <= 1)
      {
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)&v4->fillColor.red = _Q0;
        v10 = 1.0;
      }
      else
      {
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientEvaluatorFillColorRed"));
        v4->fillColor.red = v8;
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientEvaluatorFillColorGreen"));
        v4->fillColor.green = v9;
        objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientEvaluatorFillColorBlue"));
      }
      v4->fillColor.blue = v10;
      LOBYTE(v4[1].super.isa) = (uint64_t)v4[1].super.isa & 0xFC | objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("CUIPSDGradientEvaluatorColorEdgePixel")) & 3;
      LOBYTE(v4[1].super.isa) = (4
                               * (objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("CUIPSDGradientEvaluatorOpacityEdgePixel")) & 3)) | (uint64_t)v4[1].super.isa & 0xF3;
    }
    else
    {
      v11 = (uint64_t)objc_msgSend(a3, "versionForClassName:", CFSTR("CUIPSDGradientEvaluator"));
      v21 = 0.0;
      v20 = 0;
      v19 = 0;
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "@@@@ddii", &v4->colorStops, &v4->colorMidpointLocations, &v4->opacityStops, &v4->opacityMidpointLocations, &v21, &v4->fillColor.alpha, &v20, &v19);
      v4->smoothingCoefficient = v21;
      LOBYTE(v4[1].super.isa) = (uint64_t)v4[1].super.isa & 0xF0 | v20 & 3 | (4 * (v19 & 3));
      if (v11 < 2)
      {
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)&v4->fillColor.red = _Q0;
        v4->fillColor.blue = 1.0;
      }
      else
      {
        objc_msgSend(a3, "decodeValuesOfObjCTypes:", "ddd", &v4->fillColor, &v4->fillColor.green, &v4->fillColor.blue);
      }
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t isa_low;
  uint64_t v6;
  unsigned int v7;
  int v8;
  int v9;
  double smoothingCoefficient;

  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientEvaluator version](CUIPSDGradientEvaluator, "version"), CFSTR("CUIPSDGradientEvaluatorVersion"));
    objc_msgSend(a3, "encodeObject:forKey:", self->colorStops, CFSTR("CUIPSDGradientEvaluatorColorStops"));
    objc_msgSend(a3, "encodeObject:forKey:", self->colorMidpointLocations, CFSTR("CUIPSDGradientEvaluatorColorMidpointLocations"));
    objc_msgSend(a3, "encodeObject:forKey:", self->opacityStops, CFSTR("CUIPSDGradientEvaluatorOpacityStops"));
    objc_msgSend(a3, "encodeObject:forKey:", self->opacityMidpointLocations, CFSTR("CUIPSDGradientEvaluatorOpacityMidpointLocations"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientEvaluatorSmoothingCoefficient"), self->smoothingCoefficient);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientEvaluatorFillCoefficient"), self->fillColor.alpha);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientEvaluatorFillColorRed"), self->fillColor.red);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientEvaluatorFillColorGreen"), self->fillColor.green);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientEvaluatorFillColorBlue"), self->fillColor.blue);
    isa_low = LOBYTE(self[1].super.isa);
    v6 = (isa_low >> 2) & 3;
    objc_msgSend(a3, "encodeInteger:forKey:", isa_low & 3, CFSTR("CUIPSDGradientEvaluatorColorEdgePixel"));
    objc_msgSend(a3, "encodeInteger:forKey:", v6, CFSTR("CUIPSDGradientEvaluatorOpacityEdgePixel"));
  }
  else
  {
    v7 = LOBYTE(self[1].super.isa);
    smoothingCoefficient = self->smoothingCoefficient;
    v8 = (v7 >> 2) & 3;
    v9 = v7 & 3;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@@@@ddiiddd", &self->colorStops, &self->colorMidpointLocations, &self->opacityStops, &self->opacityMidpointLocations, &smoothingCoefficient, &self->fillColor.alpha, &v9, &v8, &self->fillColor, &self->fillColor.green, &self->fillColor.blue);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  __int128 v6;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5[1] = -[NSArray initWithArray:copyItems:](+[NSArray allocWithZone:](NSArray, "allocWithZone:", a3), "initWithArray:copyItems:", self->colorStops, 1);
  v5[2] = -[NSArray initWithArray:copyItems:](+[NSArray allocWithZone:](NSArray, "allocWithZone:", a3), "initWithArray:copyItems:", self->colorMidpointLocations, 1);
  v5[3] = -[NSArray initWithArray:copyItems:](+[NSArray allocWithZone:](NSArray, "allocWithZone:", a3), "initWithArray:copyItems:", self->opacityStops, 1);
  v5[4] = -[NSArray initWithArray:copyItems:](+[NSArray allocWithZone:](NSArray, "allocWithZone:", a3), "initWithArray:copyItems:", self->opacityMidpointLocations, 1);
  v5[5] = *(_QWORD *)&self->smoothingCoefficient;
  v6 = *(_OWORD *)&self->fillColor.blue;
  *((_OWORD *)v5 + 3) = *(_OWORD *)&self->fillColor.red;
  *((_OWORD *)v5 + 4) = v6;
  v5[11] = self[1].super.isa;
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradientEvaluator;
  -[CUIPSDGradientEvaluator dealloc](&v3, sel_dealloc);
}

- (double)_smoothedInterpolationOfLocation:(double)a3 betweenLower:(double)a4 upper:(double)a5 scaledMidpoint:(double)a6
{
  double v6;

  if (a3 <= a6)
    v6 = a3 / (a6 + a6);
  else
    v6 = 1.0 - (1.0 - a3) / (1.0 - a6 + 1.0 - a6);
  return a4
       + (self->smoothingCoefficient * (v6 * (v6 * 1.5) + v6 * 0.5 + -(v6 * v6) * v6)
        + (1.0 - self->smoothingCoefficient) * v6)
       * (a5 - a4);
}

- (_psdGradientColor)_smoothedGradientColorAtLocation:(double)a3
{
  NSArray *colorStops;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  double v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSUInteger v20;
  unsigned int v21;
  unsigned int v22;
  double v23;
  unsigned int v24;
  double v25;
  BOOL v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  NSArray *opacityStops;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  id v66;
  double v67;
  unint64_t v68;
  double v69;
  double v70;
  double v71;
  double v72;
  NSUInteger v73;
  unsigned int v74;
  unsigned int v75;
  double v76;
  unsigned int v77;
  double v78;
  BOOL v79;
  BOOL v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  id v86;
  id v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _psdGradientColor result;

  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  colorStops = self->colorStops;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](colorStops, "countByEnumeratingWithState:objects:count:", &v104, v109, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v105;
    v9 = -1;
LABEL_3:
    v10 = 0;
    v11 = v6;
    v12 = v9;
    v9 += (uint64_t)v6;
    v13 = v7;
    while (1)
    {
      if (*(_QWORD *)v105 != v8)
        objc_enumerationMutation(colorStops);
      v7 = *(id *)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)v10);
      objc_msgSend(v7, "colorLocation");
      if (v14 >= a3)
        break;
      v10 = (char *)v10 + 1;
      v13 = v7;
      if (v11 == v10)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](colorStops, "countByEnumeratingWithState:objects:count:", &v104, v109, 16);
        if (v6)
          goto LABEL_3;
        v15 = (unint64_t)v11 + v12 - 1;
        goto LABEL_16;
      }
    }
    v15 = (unint64_t)v10 + v12;
    if (!v13 || !v7)
    {
      if (v7)
        v15 = 0;
      else
        --v15;
      goto LABEL_16;
    }
  }
  else
  {
    v15 = -2;
LABEL_16:
    v13 = -[NSArray objectAtIndex:](self->colorStops, "objectAtIndex:", v15);
    v7 = -[NSArray objectAtIndex:](self->colorStops, "objectAtIndex:", v15 + 1);
  }
  objc_msgSend(v13, "colorLocation");
  v17 = v16;
  objc_msgSend(v7, "colorLocation");
  v19 = v18;
  v20 = -[NSArray count](self->colorStops, "count");
  v21 = objc_msgSend(v13, "isDoubleStop");
  v22 = objc_msgSend(v7, "isDoubleStop");
  v24 = v22;
  v25 = a3 - v17;
  if (v21)
  {
    v26 = v17 > a3 && v15 == 0;
    if (v26 || (v23 = 0.0101, v25 < 0.0101))
    {
      objc_msgSend(v13, "leadInColor");
LABEL_38:
      v39 = v43;
      v40 = v44;
      v41 = v45;
      v42 = v46;
      v98 = v45;
      v99 = v46;
      v97 = v44;
      v33 = v43;
      v34 = a3;
      goto LABEL_39;
    }
  }
  if (v22)
  {
    v27 = v19 < a3 && v15 == v20 - 1;
    if (v27 || (v23 = v19 - a3, v19 - a3 < 0.0101))
    {
      objc_msgSend(v7, "leadOutColor", v23);
      goto LABEL_38;
    }
  }
  v28 = v19 - v17;
  if (v21)
    objc_msgSend(v13, "leadOutColor");
  else
    objc_msgSend(v13, "gradientColor");
  v33 = v29;
  v97 = v30;
  v98 = v31;
  v99 = v32;
  v34 = v25 / v28;
  if (v24)
    objc_msgSend(v7, "leadInColor");
  else
    objc_msgSend(v7, "gradientColor");
  v39 = v35;
  v40 = v36;
  v41 = v37;
  v42 = v38;
LABEL_39:
  v47 = -[CUIPSDGradientEvaluator colorMidpointLocations](self, "colorMidpointLocations");
  v48 = 0.5;
  if ((unint64_t)objc_msgSend(v47, "count") > v15)
  {
    objc_msgSend(objc_msgSend(v47, "objectAtIndex:", v15), "doubleValue");
    v48 = v49;
  }
  -[CUIPSDGradientEvaluator _smoothedInterpolationOfLocation:betweenLower:upper:scaledMidpoint:](self, "_smoothedInterpolationOfLocation:betweenLower:upper:scaledMidpoint:", v34, v33, v39, v48);
  v51 = v50;
  -[CUIPSDGradientEvaluator _smoothedInterpolationOfLocation:betweenLower:upper:scaledMidpoint:](self, "_smoothedInterpolationOfLocation:betweenLower:upper:scaledMidpoint:", v34, v97, v40, v48);
  v53 = v52;
  -[CUIPSDGradientEvaluator _smoothedInterpolationOfLocation:betweenLower:upper:scaledMidpoint:](self, "_smoothedInterpolationOfLocation:betweenLower:upper:scaledMidpoint:", v34, v98, v41, v48);
  v55 = v54;
  -[CUIPSDGradientEvaluator _smoothedInterpolationOfLocation:betweenLower:upper:scaledMidpoint:](self, "_smoothedInterpolationOfLocation:betweenLower:upper:scaledMidpoint:", v34, v99, v42, v48);
  v57 = v56;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  opacityStops = self->opacityStops;
  v59 = -[NSArray countByEnumeratingWithState:objects:count:](opacityStops, "countByEnumeratingWithState:objects:count:", &v100, v108, 16);
  if (v59)
  {
    v60 = 0;
    v61 = *(_QWORD *)v101;
    v62 = -1;
LABEL_43:
    v63 = 0;
    v64 = v59;
    v65 = v62;
    v62 += (uint64_t)v59;
    v66 = v60;
    while (1)
    {
      if (*(_QWORD *)v101 != v61)
        objc_enumerationMutation(opacityStops);
      v60 = *(id *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)v63);
      objc_msgSend(v60, "opacityLocation");
      if (v67 >= a3)
        break;
      v63 = (char *)v63 + 1;
      v66 = v60;
      if (v64 == v63)
      {
        v59 = -[NSArray countByEnumeratingWithState:objects:count:](opacityStops, "countByEnumeratingWithState:objects:count:", &v100, v108, 16);
        if (v59)
          goto LABEL_43;
        v68 = (unint64_t)v64 + v65 - 1;
        goto LABEL_56;
      }
    }
    v68 = (unint64_t)v63 + v65;
    if (!v66 || !v60)
    {
      if (v60)
        v68 = 0;
      else
        --v68;
      goto LABEL_56;
    }
  }
  else
  {
    v68 = -2;
LABEL_56:
    v66 = -[NSArray objectAtIndex:](self->opacityStops, "objectAtIndex:", v68);
    v60 = -[NSArray objectAtIndex:](self->opacityStops, "objectAtIndex:", v68 + 1);
  }
  objc_msgSend(v66, "opacityLocation");
  v70 = v69;
  objc_msgSend(v60, "opacityLocation");
  v72 = v71;
  v73 = -[NSArray count](self->opacityStops, "count");
  v74 = objc_msgSend(v66, "isDoubleStop");
  v75 = objc_msgSend(v60, "isDoubleStop");
  v77 = v75;
  v78 = a3 - v70;
  if (v74)
  {
    v79 = v70 > a3 && v68 == 0;
    if (v79 || (v76 = 0.0101, v78 < 0.0101))
    {
      objc_msgSend(v66, "leadInOpacity");
LABEL_77:
      v83 = v84;
      goto LABEL_78;
    }
  }
  if (v75)
  {
    v80 = v72 < a3 && v68 == v73 - 1;
    if (v80 || (v76 = v72 - a3, v72 - a3 < 0.0101))
    {
      objc_msgSend(v60, "leadOutOpacity", v76);
      goto LABEL_77;
    }
  }
  v81 = v72 - v70;
  if (v74)
    objc_msgSend(v66, "leadOutOpacity");
  else
    objc_msgSend(v66, "opacity");
  v83 = v82;
  a3 = v78 / v81;
  if (v77)
    objc_msgSend(v60, "leadInOpacity");
  else
    objc_msgSend(v60, "opacity");
LABEL_78:
  v85 = v84;
  v86 = -[CUIPSDGradientEvaluator opacityMidpointLocations](self, "opacityMidpointLocations");
  v87 = objc_msgSend(v86, "count");
  v88 = 0.5;
  if ((unint64_t)v87 > v68)
  {
    objc_msgSend(objc_msgSend(v86, "objectAtIndex:", v68), "doubleValue");
    v88 = v89;
  }
  -[CUIPSDGradientEvaluator _smoothedInterpolationOfLocation:betweenLower:upper:scaledMidpoint:](self, "_smoothedInterpolationOfLocation:betweenLower:upper:scaledMidpoint:", a3, v83, v85, v88);
  v91 = v57 * v90;
  v92 = self->fillColor.alpha * (1.0 - v57 * v90);
  v93 = self->fillColor.red * v92 + v51 * (v57 * v90);
  v94 = self->fillColor.green * v92 + v53 * v91;
  v95 = v91 + v92;
  v96 = v92 * self->fillColor.blue + v55 * v91;
  if (v95 != 0.0)
  {
    v93 = v93 / v95;
    v94 = v94 / v95;
    v96 = v96 / v95;
  }
  result.alpha = v95;
  result.blue = v96;
  result.green = v94;
  result.red = v93;
  return result;
}

- (id)colorStops
{
  return -[NSArray copy](self->colorStops, "copy");
}

- (id)colorMidpointLocations
{
  return -[NSArray copy](self->colorMidpointLocations, "copy");
}

- (id)opacityStops
{
  return -[NSArray copy](self->opacityStops, "copy");
}

- (id)opacityMidpointLocations
{
  return -[NSArray copy](self->opacityMidpointLocations, "copy");
}

- (double)smoothingCoefficient
{
  return self->smoothingCoefficient;
}

- (BOOL)isDithered
{
  return (LOBYTE(self[1].super.isa) >> 4) & 1;
}

- (double)fillCoefficient
{
  return self->fillColor.alpha;
}

- (_psdGradientColor)fillColor
{
  double red;
  double green;
  double blue;
  double alpha;
  _psdGradientColor result;

  red = self->fillColor.red;
  green = self->fillColor.green;
  blue = self->fillColor.blue;
  alpha = self->fillColor.alpha;
  result.alpha = alpha;
  result.blue = blue;
  result.green = green;
  result.red = red;
  return result;
}

- (BOOL)hasEdgePixel
{
  return ((uint64_t)self[1].super.isa & 0xF) != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradientEvaluator;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - color stops: %@, opacity stops: %@"), -[CUIPSDGradientEvaluator description](&v3, sel_description), self->colorStops, self->opacityStops);
}

- (void)setColorStops:(id)a3 midpoints:(id)a4
{
  NSArray *v5;
  uint64_t v6;
  NSArray *v7;
  NSArray *v8;

  v7 = 0;
  v8 = 0;
  v6 = 0;
  -[CUIPSDGradientEvaluator _createOrderedStops:midpoints:fromStops:midpoints:edgePixel:](self, "_createOrderedStops:midpoints:fromStops:midpoints:edgePixel:", &v8, &v7, a3, a4, &v6);
  LOBYTE(self[1].super.isa) = (uint64_t)self[1].super.isa & 0xFC | v6 & 3;

  v5 = v7;
  self->colorStops = v8;
  self->colorMidpointLocations = v5;
}

- (void)setOpacityStops:(id)a3 midpoints:(id)a4
{
  NSArray *v5;
  uint64_t v6;
  NSArray *v7;
  NSArray *v8;

  v7 = 0;
  v8 = 0;
  v6 = 0;
  -[CUIPSDGradientEvaluator _createOrderedStops:midpoints:fromStops:midpoints:edgePixel:](self, "_createOrderedStops:midpoints:fromStops:midpoints:edgePixel:", &v8, &v7, a3, a4, &v6);
  LOBYTE(self[1].super.isa) = (4 * (v6 & 3)) | (uint64_t)self[1].super.isa & 0xF3;

  v5 = v7;
  self->opacityStops = v8;
  self->opacityMidpointLocations = v5;
}

- (void)setSmoothingCoefficient:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  self->smoothingCoefficient = fmin(a3, 1.0);
}

- (void)setFillCoefficient:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  self->fillColor.alpha = fmin(a3, 1.0);
}

- (void)customizeForDistance:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v10;
  char isa;
  id v13;
  double v14;
  id v15;
  double v16;
  uint64_t v17;

  if (((uint64_t)self[1].super.isa & 0xF) == 0)
  {
    v10 = "WARNING: -[CUIPSDGradientEvaluator customizeForDistance:] sent to evaluator that has no edge pixels. The message is a no-op.";
    goto LABEL_5;
  }
  if (a3 == 0.0)
  {
    v10 = "WARNING: -[CUIPSDGradientEvaluator customizeForDistance:] sent to evaluator with zero distance. The message is a no-op.";
LABEL_5:
    _CUILog(1, (uint64_t)v10, v3, v4, v5, v6, v7, v8, v17);
    return;
  }
  if (-[NSArray count](self->colorStops, "count") >= 4)
  {
    isa = (char)self[1].super.isa;
    if ((isa & 1) != 0)
    {
      objc_msgSend(-[NSArray objectAtIndex:](self->colorStops, "objectAtIndex:", 1), "setLocation:", fmin(1.0 / a3, 0.15));
      isa = (char)self[1].super.isa;
    }
    if ((isa & 2) != 0)
    {
      v13 = -[NSArray objectAtIndex:](self->colorStops, "objectAtIndex:", (char *)-[NSArray count](self->colorStops, "count") - 2);
      v14 = 1.0 - 1.0 / a3;
      if (1.0 / a3 >= 0.15)
        v14 = 0.85;
      objc_msgSend(v13, "setLocation:", v14);
      isa = (char)self[1].super.isa;
    }
    if ((isa & 4) != 0)
    {
      objc_msgSend(-[NSArray objectAtIndex:](self->opacityStops, "objectAtIndex:", 1), "setLocation:", fmin(1.0 / a3, 0.15));
      isa = (char)self[1].super.isa;
    }
    if ((isa & 8) != 0)
    {
      v15 = -[NSArray objectAtIndex:](self->opacityStops, "objectAtIndex:", (char *)-[NSArray count](self->opacityStops, "count") - 2);
      v16 = 1.0 - 1.0 / a3;
      if (1.0 / a3 >= 0.15)
        v16 = 0.85;
      objc_msgSend(v15, "setLocation:", v16);
    }
  }
}

- (int)blendMode
{
  return self->blendMode;
}

- (void)setBlendMode:(int)a3
{
  self->blendMode = a3;
}

@end
