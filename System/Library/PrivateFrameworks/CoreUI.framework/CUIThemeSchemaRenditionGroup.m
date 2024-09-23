@implementation CUIThemeSchemaRenditionGroup

+ (id)renditionGroupsForRenditions:(id)a3 part:(id *)a4
{
  unsigned int v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *n;
  void *v25;
  unsigned __int16 *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *ii;
  int64_t var4;
  NSMutableArray *v32;
  id v33;
  id v34;
  void *jj;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *kk;
  void *v44;
  void *v45;
  CUIThemeSchemaRenditionGroup *v46;
  CUIThemeSchemaRenditionGroup *v47;
  uint64_t v49;
  NSMutableArray *v50;
  uint64_t v51;
  id obj;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];

  if (!objc_msgSend(a3, "count"))
    return 0;
  v5 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "key"), 2);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v71;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v71 != v8)
          objc_enumerationMutation(a3);
        if (CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i), "key"), 2) != v5)
        {
          _CUILog(1, (uint64_t)"Can't create rendition groups. The problem: not all renditions come from the same part.", v10, v11, v12, v13, v14, v15, v49);
          return 0;
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      if (v7)
        continue;
      break;
    }
  }
  obj = +[NSMutableArray array](NSMutableArray, "array");
  v16 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", a3);
  for (j = 1; j != 3; ++j)
  {
    for (k = 0; k != 4; ++k)
    {
      for (m = 0; m != 6; ++m)
      {
        v20 = +[NSMutableArray array](NSMutableArray, "array");
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v67;
          do
          {
            for (n = 0; n != v22; n = (char *)n + 1)
            {
              if (*(_QWORD *)v67 != v23)
                objc_enumerationMutation(v16);
              v25 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)n);
              v26 = (unsigned __int16 *)objc_msgSend(v25, "key");
              if (CUIRenditionKeyValueForAttribute(v26, 4) == (unsigned __int16)m
                && CUIRenditionKeyValueForAttribute(v26, 3) == (unsigned __int16)k
                && CUIRenditionKeyValueForAttribute(v26, 12) == (unsigned __int16)j)
              {
                objc_msgSend(v20, "addObject:", v25);
              }
            }
            v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
          }
          while (v22);
        }
        if (objc_msgSend(v20, "count"))
        {
          objc_msgSend(obj, "addObject:", -[CUIThemeSchemaRenditionGroup initWithRenditions:part:]([CUIThemeSchemaRenditionGroup alloc], "initWithRenditions:part:", v20, a4));
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v27 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v63;
            do
            {
              for (ii = 0; ii != v28; ii = (char *)ii + 1)
              {
                if (*(_QWORD *)v63 != v29)
                  objc_enumerationMutation(v20);
                -[NSMutableArray removeObject:](v16, "removeObject:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)ii));
              }
              v28 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
            }
            while (v28);
          }
        }
      }
    }
  }
  var4 = a4->var4;
  if (objc_msgSend(obj, "count") && (var4 & 0x10000) != 0 && (var4 & 4) != 0)
  {
    v32 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", obj);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
    if (v33)
    {
      v34 = v33;
      v50 = v32;
      v51 = *(_QWORD *)v59;
      do
      {
        for (jj = 0; jj != v34; jj = (char *)jj + 1)
        {
          if (*(_QWORD *)v59 != v51)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)jj);
          v37 = objc_msgSend(v36, "renditions", v50);
          v38 = +[NSMutableArray array](NSMutableArray, "array");
          v39 = +[NSMutableArray array](NSMutableArray, "array");
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v40 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v55;
            do
            {
              for (kk = 0; kk != v41; kk = (char *)kk + 1)
              {
                if (*(_QWORD *)v55 != v42)
                  objc_enumerationMutation(v37);
                v44 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)kk);
                if (CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(v44, "key"), 14))
                  v45 = v39;
                else
                  v45 = v38;
                objc_msgSend(v45, "addObject:", v44);
              }
              v41 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v74, 16);
            }
            while (v41);
          }
          if (objc_msgSend(v38, "count") && objc_msgSend(v39, "count"))
          {
            v46 = -[CUIThemeSchemaRenditionGroup initWithRenditions:part:]([CUIThemeSchemaRenditionGroup alloc], "initWithRenditions:part:", v38, a4);
            v47 = -[CUIThemeSchemaRenditionGroup initWithRenditions:part:]([CUIThemeSchemaRenditionGroup alloc], "initWithRenditions:part:", v39, a4);
            -[NSMutableArray removeObject:](v50, "removeObject:", v36);
            -[NSMutableArray addObject:](v50, "addObject:", v46);
            -[NSMutableArray addObject:](v50, "addObject:", v47);
          }
        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
      }
      while (v34);
      return v50;
    }
    else
    {
      return v32;
    }
  }
  return obj;
}

- (CUIThemeSchemaRenditionGroup)initWithRenditions:(id)a3 part:(id *)a4
{
  CUIThemeSchemaRenditionGroup *v6;
  CUIThemeSchemaRenditionGroup *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUIThemeSchemaRenditionGroup;
  v6 = -[CUIThemeSchemaRenditionGroup init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CUIThemeSchemaRenditionGroup setRenditions:](v6, "setRenditions:", a3);
    v7->_part = a4;
  }
  return v7;
}

- (id)baseKey
{
  id result;
  _OWORD v4[6];

  result = self->_baseKey;
  if (!result)
  {
    memset(v4, 0, 92);
    CUIRenditionKeyCopy(v4, objc_msgSend(-[NSArray objectAtIndex:](-[CUIThemeSchemaRenditionGroup renditions](self, "renditions"), "objectAtIndex:", 0), "key"), 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 10, 0, 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 6, 0, 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 8, 0, 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 9, 0, 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 11, 0, 0x16u);
    if ((-[CUIThemeSchemaRenditionGroup partFeatures](self, "partFeatures") & 0x10000) == 0)
      CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 14, 0, 0x16u);
    result = -[CUIRenditionKey initWithKeyList:]([CUIRenditionKey alloc], "initWithKeyList:", v4);
    self->_baseKey = (CUIRenditionKey *)result;
  }
  return result;
}

- (void)addLayoutMetricsToPSDImageRef:(id)a3 withRendition:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CUIPSDLayoutMetricsChannel *v15;
  CUIPSDLayoutMetricsChannel *v16;

  objc_msgSend(a4, "contentInsets");
  v8 = CUIEdgeInsetsToCGRect(v6, v7);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_alloc_init(CUIPSDLayoutMetricsChannel);
  -[CUIPSDLayoutMetricsChannel setName:](v15, "setName:", CFSTR("ContentBounds"));
  -[CUIPSDLayoutMetricsChannel setEdgeInsets:](v15, "setEdgeInsets:", v8, v10, v12, v14);
  objc_msgSend(a3, "addLayoutMetricsChannel:", v15);
  v16 = objc_alloc_init(CUIPSDLayoutMetricsChannel);
  -[CUIPSDLayoutMetricsChannel setName:](v16, "setName:", CFSTR("Edges"));
  objc_msgSend(a4, "edgeInsets:", 1);
  -[CUIPSDLayoutMetricsChannel setEdgeInsets:](v16, "setEdgeInsets:");
  objc_msgSend(a3, "addLayoutMetricsChannel:", v16);
}

- (id)mutablePSDImageRef
{
  id v3;
  NSMutableArray *v4;
  CGSize v5;
  unsigned int v6;
  id v7;
  CGContext *ARGBBitmapContext;
  double v9;
  void *i;
  void *v11;
  NSString *v12;
  id v13;
  id v14;
  CGContext *v15;
  uint64_t v16;
  void *j;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGImage *v25;
  size_t Width;
  size_t Height;
  float v28;
  double v29;
  float v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v36;
  CUIPSDGradientLayer *v37;
  CUIMutablePSDImageRef *v38;
  CGImage *Image;
  id obj;
  uint64_t v42;
  id v43;
  NSString *v44;
  void *v45;
  CUIThemeSchemaRenditionGroup *v46;
  CUIMutablePSDImageRef *v47;
  id v48;
  int64_t v49;
  unsigned int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGSize v59;
  id v60;
  id v61;
  _BYTE v62[128];
  _BYTE v63[128];
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v3 = -[CUIThemeSchemaRenditionGroup themeSchemaLayers](self, "themeSchemaLayers");
  v46 = self;
  v49 = -[CUIThemeSchemaRenditionGroup partFeatures](self, "partFeatures");
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0);
  v60 = 0;
  v61 = 0;
  v5 = CGSizeZero;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = v5;
  obj = v3;
  v43 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (!v43)
    return 0;
  v50 = 0;
  v6 = 0;
  v7 = 0;
  ARGBBitmapContext = 0;
  v47 = 0;
  v42 = *(_QWORD *)v56;
  v9 = 1.0;
  do
  {
    for (i = 0; i != v43; i = (char *)i + 1)
    {
      if (*(_QWORD *)v56 != v42)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld. %@"), v6 + 1, objc_msgSend(v11, "name"));
      if (v6)
      {
        v64.size = v59;
        v64.origin.x = 0.0;
        v64.origin.y = 0.0;
        CGContextClearRect(ARGBBitmapContext, v64);
      }
      else
      {
        objc_msgSend(v11, "calculateColumLefts:rowTops:totalSize:forPartFeatures:", &v60, &v61, &v59, v49);
        ARGBBitmapContext = CreateARGBBitmapContext(v59.width, v59.height, 1.0);
      }
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v48 = objc_msgSend(v11, "renditions");
      v13 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      if (v13)
      {
        v14 = v13;
        v44 = v12;
        v45 = i;
        v15 = ARGBBitmapContext;
        v16 = *(_QWORD *)v52;
        while (2)
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(_QWORD *)v52 != v16)
              objc_enumerationMutation(v48);
            v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)j);
            v19 = objc_msgSend(v18, "gradient");
            if (v19)
            {
              v7 = v19;
              goto LABEL_26;
            }
            objc_msgSend(v18, "opacity");
            v9 = v20;
            v50 = objc_msgSend(v18, "blendMode");
            objc_msgSend(v18, "renditionCoordinatesForPartFeatures:", v49);
            v22 = v21;
            v24 = v23;
            v25 = (CGImage *)objc_msgSend(objc_msgSend(v18, "referenceImage"), "image");
            Width = CGImageGetWidth(v25);
            Height = CGImageGetHeight(v25);
            objc_msgSend(objc_msgSend(v60, "objectAtIndex:", (unint64_t)v22), "floatValue");
            v29 = v28;
            objc_msgSend(objc_msgSend(v61, "objectAtIndex:", (unint64_t)v24), "floatValue");
            v31 = v30;
            v65.size.width = (double)Width;
            v65.size.height = (double)Height;
            v65.origin.x = v29;
            v65.origin.y = v31;
            CGContextDrawImage(v15, v65, v25);
            if (!v6)
            {
              v32 = objc_msgSend(v18, "numberOfSlices");
              if (v32)
              {
                v33 = 0;
                v34 = 32 * v32;
                do
                {
                  v66 = CGRectOffset(*(CGRect *)((char *)objc_msgSend(v18, "sliceRects") + v33), v29, v31);
                  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v66);
                  if (DictionaryRepresentation)
                  {
                    v36 = DictionaryRepresentation;
                    -[NSMutableArray addObject:](v4, "addObject:", DictionaryRepresentation);
                    CFRelease(v36);
                  }
                  v33 += 32;
                }
                while (v34 != v33);
              }
              -[CUIThemeSchemaRenditionGroup addLayoutMetricsToPSDImageRef:withRendition:](v46, "addLayoutMetricsToPSDImageRef:withRendition:", v47, v18);
            }
          }
          v14 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
          if (v14)
            continue;
          break;
        }
        v7 = 0;
LABEL_26:
        ARGBBitmapContext = v15;
        v12 = v44;
        i = v45;
      }
      if (v6)
      {
        if (v7)
          goto LABEL_29;
      }
      else
      {
        v38 = [CUIMutablePSDImageRef alloc];
        v47 = -[CUIMutablePSDImageRef initWithPixelWidth:pixelHeight:](v38, "initWithPixelWidth:pixelHeight:", (unint64_t)v59.width, (unint64_t)v59.height);
        -[CUIMutablePSDImageRef addOrUpdateSlicesWithSliceRects:](v47, "addOrUpdateSlicesWithSliceRects:", v4);
        if (v7)
        {
LABEL_29:
          v37 = -[CUIPSDGradientLayer initWithGradient:]([CUIPSDGradientLayer alloc], "initWithGradient:", v7);
          goto LABEL_32;
        }
      }
      Image = CGBitmapContextCreateImage(ARGBBitmapContext);
      v37 = -[CUIPSDImageLayer initWithCGImageRef:]([CUIPSDImageLayer alloc], "initWithCGImageRef:", Image);
      CGImageRelease(Image);
LABEL_32:
      -[CUIPSDLayer setName:](v37, "setName:", v12);
      -[CUIPSDLayer setOpacity:](v37, "setOpacity:", v9);
      -[CUIPSDLayer setBlendMode:](v37, "setBlendMode:", v50);
      -[CUIMutablePSDImageRef addLayer:](v47, "addLayer:", v37);

      ++v6;
    }
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  }
  while (v43);
  if (ARGBBitmapContext)
    CGContextRelease(ARGBBitmapContext);
  return v47;
}

- (id)mutablePSDImageRefColumnStyle
{
  id v4;
  id v5;
  int *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  CGImage *v12;
  double Width;
  double Height;
  id v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v21;
  id v22;
  id v23;
  int v24;
  CGContext *ARGBBitmapContext;
  int *v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  int *v36;
  id v37;
  id v38;
  CUIPSDGradientLayer *v39;
  uint64_t v40;
  CGImage *v41;
  CGFloat v42;
  int *v43;
  CGImageRef Image;
  CGImage *v45;
  id v46;
  int v48;
  NSMutableArray *v49;
  int v50;
  CUIMutablePSDImageRef *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  CGRect v57;
  CGRect v58;

  v4 = -[CUIThemeSchemaRenditionGroup schemaLayersAndLayerGroups](self, "schemaLayersAndLayerGroups");
  v49 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = objc_msgSend(v4, "count");
  v6 = &OBJC_IVAR___CUIPSDLayerEffectBevelEmboss__highlightBlendMode;
  if ((uint64_t)v5 - 1 >= 0)
  {
    v7 = (uint64_t)v5;
    do
    {
      v8 = objc_msgSend(v4, "objectAtIndex:", --v7);
      v10 = objc_opt_class(CUIThemeSchemaPSDLayerGroup, v9);
      if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
        objc_msgSend(v8, "setIsStart:", objc_msgSend(v8, "isStart") ^ 1);
      -[NSMutableArray addObject:](v49, "addObject:", v8);
    }
    while (v7 > 0);
  }
  if ((-[CUIThemeSchemaRenditionGroup partFeatures](self, "partFeatures") & 0x10000) != 0
    && objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](v49, "firstObject"), "rendition"), "drawingLayer"))
  {
    v49 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
  }
  v11 = -[NSArray objectAtIndex:](-[CUIThemeSchemaRenditionGroup renditions](self, "renditions"), "objectAtIndex:", 0);
  if (!v11)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIThemeSchemaRenditionGroup.m"), 356, CFSTR("Couldn't find a rendition in the dictionary of groups and renditions. Something gang aft agley."));
  v12 = (CGImage *)objc_msgSend(objc_msgSend(v11, "referenceImage"), "image");
  Width = (double)CGImageGetWidth(v12);
  Height = (double)CGImageGetHeight(v12);
  v51 = -[CUIMutablePSDImageRef initWithPixelWidth:pixelHeight:]([CUIMutablePSDImageRef alloc], "initWithPixelWidth:pixelHeight:", (unint64_t)Width, (unint64_t)Height);
  v15 = +[NSMutableArray array](NSMutableArray, "array");
  v16 = objc_msgSend(v11, "numberOfSlices");
  v17 = v49;
  if (v16)
  {
    v18 = 0;
    v19 = 32 * v16;
    do
    {
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)((char *)objc_msgSend(v11, "sliceRects")+ v18));
      if (DictionaryRepresentation)
      {
        v21 = DictionaryRepresentation;
        objc_msgSend(v15, "addObject:", DictionaryRepresentation);
        CFRelease(v21);
      }
      v18 += 32;
    }
    while (v19 != v18);
  }
  -[CUIThemeSchemaRenditionGroup addLayoutMetricsToPSDImageRef:withRendition:](self, "addLayoutMetricsToPSDImageRef:withRendition:", v51, v11);
  -[CUIMutablePSDImageRef addOrUpdateSlicesWithSliceRects:](v51, "addOrUpdateSlicesWithSliceRects:", v15);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    ARGBBitmapContext = 0;
    v26 = &OBJC_IVAR___CUIPSDLayerEffectBevelEmboss__highlightBlendMode;
    v27 = *(_QWORD *)v53;
    while (1)
    {
      v28 = 0;
      v48 = v24;
      v29 = -v24;
      v50 = -v24;
      do
      {
        if (*(_QWORD *)v53 != v27)
          objc_enumerationMutation(v17);
        v30 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)v28);
        if (v29 == (_DWORD)v28)
        {
          ARGBBitmapContext = CreateARGBBitmapContext(Width, Height, 1.0);
        }
        else
        {
          v57.origin.x = 0.0;
          v57.origin.y = 0.0;
          v57.size.width = Width;
          v57.size.height = Height;
          CGContextClearRect(ARGBBitmapContext, v57);
        }
        v32 = objc_opt_class(v26 + 614, v31);
        if ((objc_opt_isKindOfClass(v30, v32) & 1) != 0)
        {
          v34 = v23;
          v35 = v27;
          v36 = v26;
          v37 = objc_msgSend(v30, "rendition");
          v38 = objc_msgSend(v37, "gradient");
          if (v38)
          {
            v39 = -[CUIPSDGradientLayer initWithGradient:]([CUIPSDGradientLayer alloc], "initWithGradient:", v38);
          }
          else
          {
            v41 = (CGImage *)objc_msgSend(objc_msgSend(v37, "referenceImage"), "image");
            v42 = (double)CGImageGetWidth(v41);
            v58.size.height = (double)CGImageGetHeight(v41);
            v58.origin.x = 0.0;
            v58.origin.y = 0.0;
            v58.size.width = v42;
            CGContextDrawImage(ARGBBitmapContext, v58, v41);
            v43 = v6;
            Image = CGBitmapContextCreateImage(ARGBBitmapContext);
            v39 = -[CUIPSDImageLayer initWithCGImageRef:]([CUIPSDImageLayer alloc], "initWithCGImageRef:", Image);
            v45 = Image;
            v6 = v43;
            v17 = v49;
            CGImageRelease(v45);
          }
          -[CUIPSDLayer setName:](v39, "setName:", objc_msgSend(v30, "name"));
          objc_msgSend(v37, "opacity");
          -[CUIPSDLayer setOpacity:](v39, "setOpacity:");
          -[CUIPSDLayer setBlendMode:](v39, "setBlendMode:", objc_msgSend(v37, "blendMode"));
          v26 = v36;
          v27 = v35;
          v23 = v34;
          v29 = v50;
        }
        else
        {
          v40 = objc_opt_class(v6 + 604, v33);
          if ((objc_opt_isKindOfClass(v30, v40) & 1) == 0)
            goto LABEL_33;
          if (objc_msgSend(v30, "isStart"))
          {
            v39 = objc_alloc_init(CUIPSDLayerGroupStart);
          }
          else
          {
            v39 = objc_alloc_init(CUIPSDLayerGroupEnd);
            -[CUIPSDLayer setName:](v39, "setName:", objc_msgSend(v30, "name"));
          }
        }
        -[CUIMutablePSDImageRef addLayer:](v51, "addLayer:", v39);

LABEL_33:
        v28 = (char *)v28 + 1;
      }
      while (v23 != v28);
      v24 = v48 + (_DWORD)v23;
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      v23 = v46;
      if (!v46)
      {
        if (ARGBBitmapContext)
          CGContextRelease(ARGBBitmapContext);
        return v51;
      }
    }
  }
  return v51;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaRenditionGroup;
  return objc_msgSend(-[CUIThemeSchemaRenditionGroup description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" -- Renditions: %@"), -[NSArray description](-[CUIThemeSchemaRenditionGroup renditions](self, "renditions"), "description"));
}

- (id)_renditionsSortedIntoLayers
{
  return -[NSArray sortedArrayUsingComparator:](-[CUIThemeSchemaRenditionGroup renditions](self, "renditions"), "sortedArrayUsingComparator:", &__block_literal_global_16);
}

uint64_t __59__CUIThemeSchemaRenditionGroup__renditionsSortedIntoLayers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v8;
  unsigned int v9;

  v5 = objc_msgSend(a2, "drawingLayer");
  if (v5 < objc_msgSend(a3, "drawingLayer"))
    return -1;
  v6 = objc_msgSend(a2, "drawingLayer");
  if (v6 > objc_msgSend(a3, "drawingLayer"))
    return 1;
  v8 = objc_msgSend(a2, "state");
  if (v8 < objc_msgSend(a3, "state"))
    return -1;
  v9 = objc_msgSend(a2, "state");
  return v9 > objc_msgSend(a3, "state");
}

- (id)_layerNameForState:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 0;
  else
    return off_1E41B6428[a3];
}

- (id)_layerNameForDrawingLayer:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return CFSTR("Unused Drawing Layer");
  else
    return off_1E41B6458[a3];
}

- (id)themeSchemaLayers
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  id v14;
  id v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = -[CUIThemeSchemaRenditionGroup _renditionsSortedIntoLayers](self, "_renditionsSortedIntoLayers");
  v17 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = +[NSMutableArray array](NSMutableArray, "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        v11 = v8;
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (v11)
        {
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "state");
          if (v12 != objc_msgSend(v11, "state")
            || (v13 = objc_msgSend(v8, "drawingLayer"),
                v13 != objc_msgSend(v11, "drawingLayer")))
          {
            if (objc_msgSend(v11, "drawingLayer"))
              v14 = -[CUIThemeSchemaRenditionGroup _layerNameForDrawingLayer:](self, "_layerNameForDrawingLayer:", objc_msgSend(v11, "drawingLayer"));
            else
              v14 = -[CUIThemeSchemaRenditionGroup _layerNameForState:](self, "_layerNameForState:", objc_msgSend(v11, "state"));
            objc_msgSend(v17, "addObject:", +[CUIThemeSchemaLayer layerWithRenditions:name:index:](CUIThemeSchemaLayer, "layerWithRenditions:name:index:", v4, v14, v7++));
            v4 = +[NSMutableArray array](NSMutableArray, "array");
          }
        }
        objc_msgSend(v4, "addObject:", v8);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  if (objc_msgSend(v8, "drawingLayer"))
    v15 = -[CUIThemeSchemaRenditionGroup _layerNameForDrawingLayer:](self, "_layerNameForDrawingLayer:", objc_msgSend(v8, "drawingLayer"));
  else
    v15 = -[CUIThemeSchemaRenditionGroup _layerNameForState:](self, "_layerNameForState:", objc_msgSend(v8, "state"));
  objc_msgSend(v17, "addObject:", +[CUIThemeSchemaLayer layerWithRenditions:name:index:](CUIThemeSchemaLayer, "layerWithRenditions:name:index:", v4, v15, v7));
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v17);
}

- (id)schemaLayersAndLayerGroups
{
  NSArray *v3;
  unsigned int v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  CUIThemeSchemaPSDLayerGroup *v11;
  CUIThemeSchemaPSDLayerGroup *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  CUIThemeSchemaPSDRenditionLayer *v18;
  uint64_t v19;
  unint64_t v20;
  CUIThemeSchemaPSDLayerGroup *v21;
  CUIThemeSchemaPSDLayerGroup *v22;
  CUIThemeSchemaPSDRenditionLayer *v23;
  unint64_t v24;
  NSArray *v25;
  CUIThemeSchemaPSDRenditionLayer *v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v28 = +[NSMutableArray array](NSMutableArray, "array");
  v3 = -[CUIThemeSchemaRenditionGroup renditions](self, "renditions");
  v4 = -[CUIThemeSchemaRenditionGroup partFeatures](self, "partFeatures");
  if ((v4 & 0x100000) != 0)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v3);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v18 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
          -[CUIThemeSchemaPSDRenditionLayer setRendition:](v18, "setRendition:", v17);
          -[CUIThemeSchemaPSDLayer setName:](v18, "setName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@ to %@-%@"), objc_msgSend(v17, "previousStateLocalizedString"), objc_msgSend(v17, "previousValueLocalizedString"), objc_msgSend(v17, "stateLocalizedString"), objc_msgSend(v17, "valueLocalizedString")));
          objc_msgSend(v28, "addObject:", v18);

        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v14);
    }
  }
  else
  {
    v5 = objc_msgSend(-[CUIThemeSchemaRenditionGroup themeSchemaLayers](self, "themeSchemaLayers"), "count");
    v6 = +[NSMutableArray array](NSMutableArray, "array");
    if ((*(_QWORD *)&v4 & 0x20004) == 0 || (v4 & 0x10000) != 0)
    {
      if ((unint64_t)v5 < 2)
      {
        if ((v4 & 0x4001) != 0)
        {
          -[CUIThemeSchemaRenditionGroup addValueOrDim1LayersToPSDLayers:forPresentationState:state:drawingLayer:](self, "addValueOrDim1LayersToPSDLayers:forPresentationState:state:drawingLayer:", v28, 0, 0, 0);
        }
        else
        {
          v23 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
          -[CUIThemeSchemaPSDLayer setName:](v23, "setName:", CFSTR("Normal"));
          -[CUIThemeSchemaPSDRenditionLayer setRendition:](v23, "setRendition:", -[NSArray objectAtIndex:](v3, "objectAtIndex:", 0));
          objc_msgSend(v28, "addObject:", v23);
        }
      }
      else
      {
        if ((v4 & 0x10000) != 0)
        {
          v19 = 0;
          if (!-[NSArray count](-[NSArray filteredArrayUsingPredicate:](v3, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("presentationState == %lu"), 0)), "count"))
          {
            v19 = 1;
            if (!-[NSArray count](-[NSArray filteredArrayUsingPredicate:](v3, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("presentationState == %lu"), 1)), "count"))v19 = 2* (-[NSArray count](-[NSArray filteredArrayUsingPredicate:](v3, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("presentationState == %lu"), 2)),
                       "count") != 0);
          }
        }
        else
        {
          v19 = 0;
        }
        -[CUIThemeSchemaRenditionGroup addStatesAndDrawingLayersToPSDLayers:forPresentationState:](self, "addStatesAndDrawingLayersToPSDLayers:forPresentationState:", v28, v19);
      }
    }
    else
    {
      v7 = v6;
      v8 = +[NSMutableArray array](NSMutableArray, "array");
      objc_msgSend(v7, "addObject:", &unk_1E41DD028);
      objc_msgSend(v8, "addObject:", CFSTR("Active"));
      if ((v4 & 4) != 0)
      {
        objc_msgSend(v7, "addObject:", &unk_1E41DD040);
        objc_msgSend(v8, "addObject:", CFSTR("Inactive"));
      }
      if ((v4 & 0x20000) != 0)
      {
        objc_msgSend(v7, "addObject:", &unk_1E41DD058);
        objc_msgSend(v8, "addObject:", CFSTR("Active Main"));
      }
      v9 = objc_msgSend(v7, "count");
      if ((unint64_t)v5 < 2)
      {
        if ((v4 & 0x4001) != 0)
        {
          if (v9)
          {
            v20 = 0;
            do
            {
              v21 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
              -[CUIThemeSchemaPSDLayerGroup setIsStart:](v21, "setIsStart:", 1);
              objc_msgSend(v28, "addObject:", v21);
              -[CUIThemeSchemaRenditionGroup addValueOrDim1LayersToPSDLayers:forPresentationState:state:drawingLayer:](self, "addValueOrDim1LayersToPSDLayers:forPresentationState:state:drawingLayer:", v28, objc_msgSend(objc_msgSend(v7, "objectAtIndex:", v20), "unsignedIntegerValue"), 0, 0);
              v22 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
              -[CUIThemeSchemaPSDLayerGroup setIsStart:](v22, "setIsStart:", 0);
              -[CUIThemeSchemaPSDLayer setName:](v22, "setName:", objc_msgSend(v8, "objectAtIndex:", v20));
              -[CUIThemeSchemaPSDLayer setName:](v21, "setName:", -[CUIThemeSchemaPSDLayer name](v22, "name"));
              objc_msgSend(v28, "addObject:", v22);
              ++v20;
            }
            while (v20 < (unint64_t)objc_msgSend(v7, "count"));
          }
        }
        else if (v9)
        {
          v24 = 0;
          do
          {
            v25 = -[NSArray filteredArrayUsingPredicate:](v3, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("presentationState == %lu"), objc_msgSend(objc_msgSend(v7, "objectAtIndex:", v24), "unsignedIntegerValue")));
            if (-[NSArray count](v25, "count"))
            {
              v26 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
              -[CUIThemeSchemaPSDRenditionLayer setRendition:](v26, "setRendition:", -[NSArray objectAtIndex:](v25, "objectAtIndex:", 0));
              -[CUIThemeSchemaPSDLayer setName:](v26, "setName:", objc_msgSend(v8, "objectAtIndex:", v24));
              objc_msgSend(v28, "addObject:", v26);
            }
            ++v24;
          }
          while (v24 < (unint64_t)objc_msgSend(v7, "count"));
        }
      }
      else if (v9)
      {
        v10 = 0;
        do
        {
          v11 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
          -[CUIThemeSchemaPSDLayerGroup setIsStart:](v11, "setIsStart:", 1);
          objc_msgSend(v28, "addObject:", v11);
          -[CUIThemeSchemaRenditionGroup addStatesAndDrawingLayersToPSDLayers:forPresentationState:](self, "addStatesAndDrawingLayersToPSDLayers:forPresentationState:", v28, objc_msgSend(objc_msgSend(v7, "objectAtIndex:", v10), "unsignedIntegerValue"));
          v12 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
          -[CUIThemeSchemaPSDLayerGroup setIsStart:](v12, "setIsStart:", 0);
          -[CUIThemeSchemaPSDLayer setName:](v12, "setName:", objc_msgSend(v8, "objectAtIndex:", v10));
          -[CUIThemeSchemaPSDLayer setName:](v11, "setName:", -[CUIThemeSchemaPSDLayer name](v12, "name"));
          objc_msgSend(v28, "addObject:", v12);
          ++v10;
        }
        while (v10 < (unint64_t)objc_msgSend(v7, "count"));
      }
    }
  }
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v28);
}

- (void)addStatesAndDrawingLayersToPSDLayers:(id)a3 forPresentationState:(unint64_t)a4
{
  id v7;
  unint64_t v8;
  _UNKNOWN **v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  const __CFString *v14;
  const __CFString *v15;
  id v16;
  id v17;
  CUIThemeSchemaPSDRenditionLayer *v18;
  _UNKNOWN **v19;
  CUIThemeSchemaPSDLayerGroup *v20;
  CUIThemeSchemaPSDLayerGroup *v21;
  uint64_t v22;
  NSArray *v23;
  id v24;
  CUIThemeSchemaPSDLayerGroup *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  id v31;
  CUIThemeSchemaPSDRenditionLayer *v32;
  CUIThemeSchemaPSDLayerGroup *v33;
  unint64_t v34;
  unsigned int v35;
  id v36;
  CUIThemeSchemaRenditionGroup *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v7 = -[CUIThemeSchemaRenditionGroup themeSchemaLayers](self, "themeSchemaLayers");
  v37 = self;
  v35 = -[CUIThemeSchemaRenditionGroup partFeatures](self, "partFeatures");
  if ((v35 & 0x1000000) != 0)
  {
    v22 = 0;
    v34 = a4;
    do
    {
      v23 = -[NSArray filteredArrayUsingPredicate:](-[CUIThemeSchemaRenditionGroup renditions](self, "renditions"), "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("state == %lu AND presentationState == %lu"), v22, a4));
      if (-[NSArray count](v23, "count"))
      {
        v24 = objc_msgSend(-[NSArray objectAtIndex:](v23, "objectAtIndex:", 0), "stateLocalizedString");
        v25 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
        -[CUIThemeSchemaPSDLayerGroup setIsStart:](v25, "setIsStart:", 1);
        v36 = v24;
        -[CUIThemeSchemaPSDLayer setName:](v25, "setName:", v24);
        objc_msgSend(a3, "addObject:", v25);
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(_QWORD *)v39 != v28)
                objc_enumerationMutation(v23);
              v30 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
              v31 = objc_msgSend(v30, "drawingLayerLocalizedString");
              v32 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
              -[CUIThemeSchemaPSDLayer setName:](v32, "setName:", v31);
              -[CUIThemeSchemaPSDRenditionLayer setRendition:](v32, "setRendition:", v30);
              objc_msgSend(a3, "addObject:", v32);
            }
            v27 = -[NSArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          }
          while (v27);
        }
        v33 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
        -[CUIThemeSchemaPSDLayerGroup setIsStart:](v33, "setIsStart:", 0);
        -[CUIThemeSchemaPSDLayer setName:](v33, "setName:", v36);
        objc_msgSend(a3, "addObject:", v33);
        a4 = v34;
      }
      ++v22;
    }
    while (v22 != 6);
  }
  else if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    v9 = &CGContextSetTextMatrix_ptr;
    do
    {
      v10 = objc_msgSend(objc_msgSend(v7, "objectAtIndex:", v8), "renditions");
      v11 = v10;
      if (v8)
      {
        v12 = objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 0), "drawingLayer");
        v13 = objc_msgSend(v11, "objectAtIndex:", 0);
        if (v12)
          v14 = (const __CFString *)objc_msgSend(v13, "drawingLayerLocalizedString");
        else
          v14 = (const __CFString *)objc_msgSend(v13, "stateLocalizedString");
        v15 = v14;
      }
      else if ((v35 & 0x1000) == 0 || (v15 = CFSTR("Background"), (unint64_t)objc_msgSend(v7, "count") <= 1))
      {
        v15 = CFSTR("Normal");
      }
      v16 = objc_msgSend(v11, "filteredArrayUsingPredicate:", objc_msgSend(v9[262], "predicateWithFormat:", CFSTR("presentationState == %lu"), a4));
      if (objc_msgSend(v16, "count"))
      {
        v17 = objc_msgSend(v16, "objectAtIndex:", 0);
        if (objc_msgSend(v16, "count") == (id)1)
        {
          v18 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
          -[CUIThemeSchemaPSDLayer setName:](v18, "setName:", v15);
          -[CUIThemeSchemaPSDRenditionLayer setRendition:](v18, "setRendition:", v17);
        }
        else
        {
          v19 = v9;
          v20 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
          -[CUIThemeSchemaPSDLayerGroup setIsStart:](v20, "setIsStart:", 1);
          objc_msgSend(a3, "addObject:", v20);
          -[CUIThemeSchemaRenditionGroup addValueOrDim1LayersToPSDLayers:forPresentationState:state:drawingLayer:](v37, "addValueOrDim1LayersToPSDLayers:forPresentationState:state:drawingLayer:", a3, a4, objc_msgSend(v17, "state"), objc_msgSend(v17, "drawingLayer"));
          v18 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
          -[CUIThemeSchemaPSDRenditionLayer setIsStart:](v18, "setIsStart:", 0);
          -[CUIThemeSchemaPSDLayer setName:](v18, "setName:", v15);
          v21 = v20;
          v9 = v19;
          -[CUIThemeSchemaPSDLayer setName:](v21, "setName:", v15);
        }
        objc_msgSend(a3, "addObject:", v18);
      }
      ++v8;
    }
    while (v8 < (unint64_t)objc_msgSend(v7, "count"));
  }
}

- (void)addValueOrDim1LayersToPSDLayers:(id)a3 forPresentationState:(unint64_t)a4 state:(unint64_t)a5 drawingLayer:(unint64_t)a6
{
  NSArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *m;
  void *v13;
  id v14;
  CUIThemeSchemaPSDRenditionLayer *v15;
  NSArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *k;
  void *v21;
  id v22;
  CUIThemeSchemaPSDRenditionLayer *v23;
  uint64_t i;
  NSArray *v25;
  id v26;
  CUIThemeSchemaPSDLayerGroup *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  id v33;
  CUIThemeSchemaPSDRenditionLayer *v34;
  CUIThemeSchemaPSDLayerGroup *v35;
  NSArray *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];

  v36 = -[NSArray filteredArrayUsingPredicate:](-[CUIThemeSchemaRenditionGroup renditions](self, "renditions"), "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("presentationState == %lu AND state == %lu AND drawingLayer == %lu"), a4, a5, a6));
  if ((-[CUIThemeSchemaRenditionGroup partFeatures](self, "partFeatures") & 1) != 0
    && (-[CUIThemeSchemaRenditionGroup partFeatures](self, "partFeatures") & 0x4000) != 0)
  {
    for (i = 0; i != 3; ++i)
    {
      v25 = -[NSArray filteredArrayUsingPredicate:](v36, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("value == %lu"), i));
      if (-[NSArray count](v25, "count"))
      {
        v26 = objc_msgSend(-[NSArray objectAtIndex:](v25, "objectAtIndex:", 0), "valueLocalizedString");
        v27 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
        -[CUIThemeSchemaPSDLayerGroup setIsStart:](v27, "setIsStart:", 1);
        v37 = v26;
        -[CUIThemeSchemaPSDLayer setName:](v27, "setName:", v26);
        objc_msgSend(a3, "addObject:", v27);
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v29; j = (char *)j + 1)
            {
              if (*(_QWORD *)v47 != v30)
                objc_enumerationMutation(v25);
              v32 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
              v33 = objc_msgSend(v32, "dimension1LocalizedString");
              v34 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
              -[CUIThemeSchemaPSDLayer setName:](v34, "setName:", v33);
              -[CUIThemeSchemaPSDRenditionLayer setRendition:](v34, "setRendition:", v32);
              objc_msgSend(a3, "addObject:", v34);
            }
            v29 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
          }
          while (v29);
        }
        v35 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
        -[CUIThemeSchemaPSDLayerGroup setIsStart:](v35, "setIsStart:", 0);
        -[CUIThemeSchemaPSDLayer setName:](v35, "setName:", v37);
        objc_msgSend(a3, "addObject:", v35);
      }
    }
  }
  else if ((-[CUIThemeSchemaRenditionGroup partFeatures](self, "partFeatures") & 1) != 0)
  {
    v16 = -[NSArray sortedArrayUsingComparator:](v36, "sortedArrayUsingComparator:", &__block_literal_global_75);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v43;
      do
      {
        for (k = 0; k != v18; k = (char *)k + 1)
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)k);
          v22 = objc_msgSend(v21, "valueLocalizedString");
          v23 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
          -[CUIThemeSchemaPSDRenditionLayer setRendition:](v23, "setRendition:", v21);
          -[CUIThemeSchemaPSDLayer setName:](v23, "setName:", v22);
          objc_msgSend(a3, "addObject:", v23);
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v18);
    }
  }
  else
  {
    v8 = -[NSArray sortedArrayUsingComparator:](v36, "sortedArrayUsingComparator:", &__block_literal_global_76);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v39;
      do
      {
        for (m = 0; m != v10; m = (char *)m + 1)
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)m);
          v14 = objc_msgSend(v13, "dimension1LocalizedString");
          v15 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
          -[CUIThemeSchemaPSDRenditionLayer setRendition:](v15, "setRendition:", v13);
          -[CUIThemeSchemaPSDLayer setName:](v15, "setName:", v14);
          objc_msgSend(a3, "addObject:", v15);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      }
      while (v10);
    }
  }
}

uint64_t __104__CUIThemeSchemaRenditionGroup_addValueOrDim1LayersToPSDLayers_forPresentationState_state_drawingLayer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5;
  unsigned int v7;

  v5 = objc_msgSend(a2, "value");
  if (v5 < objc_msgSend(a3, "value"))
    return -1;
  v7 = objc_msgSend(a2, "value");
  return v7 > objc_msgSend(a3, "value");
}

uint64_t __104__CUIThemeSchemaRenditionGroup_addValueOrDim1LayersToPSDLayers_forPresentationState_state_drawingLayer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5;
  unsigned int v7;

  v5 = objc_msgSend(a2, "dimension1");
  if (v5 < objc_msgSend(a3, "dimension1"))
    return -1;
  v7 = objc_msgSend(a2, "dimension1");
  return v7 > objc_msgSend(a3, "dimension1");
}

- (int64_t)partFeatures
{
  return self->_part->var4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaRenditionGroup;
  -[CUIThemeSchemaRenditionGroup dealloc](&v3, sel_dealloc);
}

- (NSArray)renditions
{
  return self->_renditions;
}

- (void)setRenditions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
