@implementation _CUIThemeGradientRendition

+ (NSArray)_nodesFromNodeList:(uint64_t)a1 count:(_DWORD *)a2 header:(uint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  double *i;
  int v9;
  int v10;
  CUIPSDGradientDoubleColorStop *v12;
  id v13;
  double v14;
  CUIPSDGradientDoubleColorStop *v15;

  v5 = objc_opt_self(a1, a2);
  if (a3)
  {
    v6 = v5;
    v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a3);
    for (i = (double *)(a2 + 8); ; i += 9)
    {
      v9 = *a2;
      v10 = *((_DWORD *)i - 8);
      if (*a2 != v10)
      {
        if (v9 == 1129270354 && v10 == 1129270340)
        {
LABEL_23:
          v12 = -[CUIPSDGradientDoubleColorStop initWithLocation:leadInColor:leadOutColor:]([CUIPSDGradientDoubleColorStop alloc], "initWithLocation:leadInColor:leadOutColor:", *((float *)i - 7), *(i - 3), *(i - 2), *(i - 1), *i, *((_QWORD *)i + 1), *((_QWORD *)i + 2), *((_QWORD *)i + 3), *((_QWORD *)i + 4));
          goto LABEL_29;
        }
        if (v9 == 1330660180)
        {
          if (v10 == 1330660164)
            goto LABEL_24;
        }
        else if (v9 == 1330660164)
        {
          if (v10 == 1330660180)
          {
LABEL_28:
            v12 = -[CUIPSDGradientOpacityStop initWithLocation:opacity:]([CUIPSDGradientOpacityStop alloc], "initWithLocation:opacity:", *((float *)i - 7), *i);
            goto LABEL_29;
          }
        }
        else if (v9 == 1129270340 && v10 == 1129270354)
        {
          goto LABEL_22;
        }
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__nodesFromNodeList_count_header_, v6, CFSTR("_CUIThemeGradientRendition.m"), 34, CFSTR("CoreUI: Mixed node types in node list"));
        v9 = *((_DWORD *)i - 8);
      }
      if (v9 <= 1296647247)
      {
        if (v9 == 1129270340)
          goto LABEL_23;
        if (v9 == 1129270354)
        {
LABEL_22:
          v12 = -[CUIPSDGradientColorStop initWithLocation:gradientColor:]([CUIPSDGradientColorStop alloc], "initWithLocation:gradientColor:", *((float *)i - 7), *(i - 3), *(i - 2), *(i - 1), *i);
LABEL_29:
          v15 = v12;
          goto LABEL_30;
        }
      }
      else
      {
        switch(v9)
        {
          case 1296647248:
            v13 = objc_alloc((Class)NSNumber);
            LODWORD(v14) = *((_DWORD *)i - 7);
            v12 = (CUIPSDGradientDoubleColorStop *)objc_msgSend(v13, "initWithFloat:", v14);
            goto LABEL_29;
          case 1330660164:
LABEL_24:
            v12 = -[CUIPSDGradientDoubleOpacityStop initWithLocation:leadInOpacity:leadOutOpacity:]([CUIPSDGradientDoubleOpacityStop alloc], "initWithLocation:leadInOpacity:leadOutOpacity:", *((float *)i - 7), *i, i[4]);
            goto LABEL_29;
          case 1330660180:
            goto LABEL_28;
        }
      }
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__nodesFromNodeList_count_header_, v6, CFSTR("_CUIThemeGradientRendition.m"), 73, CFSTR("CoreUI: Invalid gradient node type in gradient rendition initialization"));
      v15 = 0;
LABEL_30:
      objc_msgSend(v7, "addObject:", v15);

      if (!--a3)
        return (NSArray *)v7;
    }
  }
  return +[NSArray array](NSArray, "array");
}

+ (void)_parseGradientInfoFromCSIHeader:(double *)a3@<X8>
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *v28;
  _DWORD *v29;
  NSArray *v30;
  _DWORD *v31;
  NSArray *v32;
  CUIPSDGradientEvaluator *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  objc_opt_self(a1, a2);
  a3[1] = 0.0;
  a3[2] = 0.0;
  *a3 = 0.0;
  v36 = a2;
  v12 = *(unsigned int *)(a2 + 172);
  if ((_DWORD)v12)
  {
    v13 = 0;
    v34 = a2 + 176 + 4 * v12 + *(unsigned int *)(a2 + 168) + 4;
    v35 = a2 + 176;
    v14 = 1;
    while ((v14 & 1) != 0)
    {
      v15 = v34 + *(unsigned int *)(v35 + 4 * v13);
      v16 = *(_DWORD *)v15;
      v17 = *(_DWORD *)(v15 + 12);
      if (*(_DWORD *)v15 == 1145131591)
      {
        v17 = bswap32(v17);
        v18 = bswap32(*(_DWORD *)(v15 + 64));
      }
      else
      {
        v18 = *(_DWORD *)(v15 + 64);
      }
      *(_DWORD *)a3 = v17;
      if (v18 >= 2)
      {
        a3[1] = *(float *)(v15 + 56);
        v19 = *(_DWORD *)(v15 + 68);
        v20 = *(_DWORD *)(v15 + 72);
        v21 = *(_DWORD *)(v15 + 76);
        v22 = bswap32(v19);
        v23 = bswap32(v20);
        v24 = bswap32(v21);
        v25 = v16 == 1145131591 ? v22 : v19;
        v26 = v16 == 1145131591 ? v23 : v20;
        v27 = v16 == 1145131591 ? v24 : v21;
        v28 = +[_CUIThemeGradientRendition _nodesFromNodeList:count:header:]((uint64_t)_CUIThemeGradientRendition, (_DWORD *)(v15 + 80), v18);
        v29 = (_DWORD *)(v15 + 80 + 72 * v18);
        v30 = +[_CUIThemeGradientRendition _nodesFromNodeList:count:header:]((uint64_t)_CUIThemeGradientRendition, v29, v25);
        v31 = &v29[18 * v25];
        v32 = +[_CUIThemeGradientRendition _nodesFromNodeList:count:header:]((uint64_t)_CUIThemeGradientRendition, v31, v26);
        v33 = -[CUIPSDGradientEvaluator initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:]([CUIPSDGradientEvaluator alloc], "initWithColorStops:colorMidpoints:opacityStops:opacityMidpoints:smoothingCoefficient:fillColor:dither:", v28, v30, v32, +[_CUIThemeGradientRendition _nodesFromNodeList:count:header:]((uint64_t)_CUIThemeGradientRendition, &v31[18 * v26], v27), *(_DWORD *)(v15 + 4) & 1, *(float *)(v15 + 60), *(double *)(v15 + 24), *(double *)(v15 + 32), *(double *)(v15 + 40), *(double *)(v15 + 48));
        *((_QWORD *)a3 + 2) = v33;
        -[CUIPSDGradientEvaluator setBlendMode:](v33, "setBlendMode:", *(unsigned int *)(v15 + 20));
        v14 = 0;
        v13 = 1;
        if (*(_DWORD *)(v36 + 172) > 1u)
          continue;
      }
      return;
    }
    _CUILog(4, (uint64_t)"Warning: Ignoring extra gradient data found in CSI", v6, v7, v8, v9, v10, v11, a4);
  }
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  _QWORD *v5;
  void *v6;
  uint64_t SRGB;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_CUIThemeGradientRendition;
  v5 = -[CUIThemeRendition _initWithCSIHeader:version:](&v15, sel__initWithCSIHeader_version_, a3, *(_QWORD *)&a4);
  v12 = 0;
  v13 = 0;
  v14 = 0;
  +[_CUIThemeGradientRendition _parseGradientInfoFromCSIHeader:]((uint64_t)_CUIThemeGradientRendition, (uint64_t)a3, (double *)&v12, v11);
  v6 = v14;
  if (v14)
  {
    if ((*((_DWORD *)a3 + 7) & 0xF) == 1)
      SRGB = _CUIColorSpaceGetSRGB();
    else
      SRGB = _CUIColorSpaceGetGenericRGB();
    v9 = SRGB;
    objc_msgSend(v5, "setBlendMode:", objc_msgSend(v6, "blendMode"));
    v5[28] = v13;
    objc_msgSend(v5, "setSubtype:", v12);
    v5[27] = -[CUIThemeGradient _initWithGradientEvaluator:colorSpace:]([CUIThemeGradient alloc], "_initWithGradientEvaluator:colorSpace:", v6, v9);

  }
  else
  {
    v8 = v5;
    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CUIThemeGradientRendition;
  -[CUIThemeRendition dealloc](&v3, sel_dealloc);
}

- (double)gradientDrawingAngle
{
  return self->gradientAngle;
}

- (id)gradient
{
  return self->gradient;
}

@end
