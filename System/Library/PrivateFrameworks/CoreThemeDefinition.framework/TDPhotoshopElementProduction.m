@implementation TDPhotoshopElementProduction

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TDPhotoshopElementProduction;
  -[TDPhotoshopElementProduction dealloc](&v3, sel_dealloc);
}

- (id)rowCount
{
  void *v4;

  if (objc_msgSend((id)-[TDPhotoshopElementProduction renditionType](self, "renditionType"), "identifier") == 6)return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  -[TDPhotoshopElementProduction willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("rowCount"));
  v4 = (void *)-[TDPhotoshopElementProduction primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("rowCount"));
  -[TDPhotoshopElementProduction didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("rowCount"));
  return v4;
}

- (void)setRowCount:(id)a3
{
  -[TDPhotoshopElementProduction willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rowCount"));
  -[TDPhotoshopElementProduction setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", a3, CFSTR("rowCount"));
  -[TDPhotoshopElementProduction didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rowCount"));
}

- (id)columnCount
{
  void *v4;

  if (objc_msgSend((id)-[TDPhotoshopElementProduction renditionType](self, "renditionType"), "identifier") == 6)return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  -[TDPhotoshopElementProduction willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("columnCount"));
  v4 = (void *)-[TDPhotoshopElementProduction primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("columnCount"));
  -[TDPhotoshopElementProduction didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("columnCount"));
  return v4;
}

- (void)setColumnCount:(id)a3
{
  -[TDPhotoshopElementProduction willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("columnCount"));
  -[TDPhotoshopElementProduction setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", a3, CFSTR("columnCount"));
  -[TDPhotoshopElementProduction didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("columnCount"));
}

- (id)columnIterationType
{
  void *v3;

  -[TDPhotoshopElementProduction willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("columnIterationType"));
  v3 = (void *)-[TDPhotoshopElementProduction primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("columnIterationType"));
  -[TDPhotoshopElementProduction didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("columnIterationType"));
  return v3;
}

- (id)rowIterationType
{
  void *v3;

  -[TDPhotoshopElementProduction willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("rowIterationType"));
  v3 = (void *)-[TDPhotoshopElementProduction primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("rowIterationType"));
  -[TDPhotoshopElementProduction didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("rowIterationType"));
  return v3;
}

- (id)isActive
{
  void *v3;

  -[TDPhotoshopElementProduction willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("isActive"));
  v3 = (void *)-[TDPhotoshopElementProduction primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("isActive"));
  -[TDPhotoshopElementProduction didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("isActive"));
  return v3;
}

- (id)baseKeySpec
{
  void *v3;

  -[TDPhotoshopElementProduction willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("baseKeySpec"));
  v3 = (void *)-[TDPhotoshopElementProduction primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("baseKeySpec"));
  -[TDPhotoshopElementProduction didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("baseKeySpec"));
  return v3;
}

- (void)setIsActive:(id)a3
{
  -[TDPhotoshopElementProduction willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isActive"));
  -[TDPhotoshopElementProduction setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", a3, CFSTR("isActive"));
  -[TDPhotoshopElementProduction didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isActive"));
}

- (void)setColumnIterationType:(id)a3
{
  -[TDPhotoshopElementProduction willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("columnIterationType"));
  -[TDPhotoshopElementProduction setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", a3, CFSTR("columnIterationType"));
  -[TDPhotoshopElementProduction didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("columnIterationType"));
}

- (void)setRowIterationType:(id)a3
{
  -[TDPhotoshopElementProduction willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rowIterationType"));
  -[TDPhotoshopElementProduction setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", a3, CFSTR("rowIterationType"));
  -[TDPhotoshopElementProduction didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rowIterationType"));
}

- (id)relativePath
{
  return (id)objc_msgSend((id)-[TDPhotoshopElementProduction asset](self, "asset"), "sourceRelativePath");
}

- (id)associatedFileURLWithDocument:(id)a3
{
  return (id)objc_msgSend((id)-[TDPhotoshopElementProduction asset](self, "asset"), "fileURLWithDocument:", a3);
}

+ (unsigned)sliceRowsPerRendition:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return -1;
  else
    return dword_226EC0850[a3];
}

+ (unsigned)sliceColumnsPerRendition:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return -1;
  else
    return dword_226EC0860[a3];
}

- (void)addDrawingLayerIndex:(id)a3 themeLayer:(id)a4 toIndices:(id)a5 layers:(id)a6 lowestIndex:(int64_t *)a7
{
  if (objc_msgSend(a3, "integerValue") >= 1)
  {
    if (objc_msgSend(a3, "integerValue") < *a7)
      *a7 = objc_msgSend(a3, "integerValue");
    if (objc_msgSend(a5, "containsObject:", a3))
    {
      NSLog(CFSTR("ERROR: Photoshop layer index %@ is assigned to two separate rendition layers in %@"), a3, self);
    }
    else
    {
      objc_msgSend(a5, "addObject:", a3);
      objc_msgSend(a6, "addObject:", a4);
    }
  }
}

- (void)getDrawingLayerIndices:(id *)a3 themeLayers:(id *)a4 lowestIndex:(int64_t *)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  *a5 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = (void *)-[TDPhotoshopElementProduction layerMappings](self, "layerMappings");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[TDPhotoshopElementProduction addDrawingLayerIndex:themeLayer:toIndices:layers:lowestIndex:](self, "addDrawingLayerIndex:themeLayer:toIndices:layers:lowestIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13), "photoshopLayerIndex"), objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13), "themeDrawingLayer"), *a3, *a4, a5);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }
}

- (void)fillIterationKeyAttribute:(id)a3 iteration:(int)a4 rowOrColumn:(int)a5 document:(id)a6
{
  switch(a4)
  {
    case 0:
      objc_msgSend(a3, "setValue:", objc_msgSend(a6, "valueWithIdentifier:", a5));
      break;
    case 1:
      objc_msgSend(a3, "setPresentationState:", objc_msgSend(a6, "presentationStateWithIdentifier:", a5));
      break;
    case 2:
      objc_msgSend(a3, "setDimension1:", *(_QWORD *)&a5);
      break;
    case 3:
      objc_msgSend(a3, "setDimension2:", *(_QWORD *)&a5);
      break;
    default:
      return;
  }
}

- (id)psdImageRefWithDocument:(id)a3
{
  NSDate *cachedImageDate;

  if (!self->psdImageRef
    || self->_cachedImageDate
    && objc_msgSend(-[TDElementProduction associatedFileModificationDateWithDocument:](self, "associatedFileModificationDateWithDocument:", a3), "compare:", self->_cachedImageDate) == 1)
  {
    self->psdImageRef = (CUIPSDImageRef *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C60]), "initWithPath:", objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopElementProduction asset](self, "asset"), "fileURLWithDocument:", a3), "path"));
    cachedImageDate = self->_cachedImageDate;
    if (cachedImageDate)

    self->_cachedImageDate = (NSDate *)objc_msgSend(-[TDElementProduction associatedFileModificationDateWithDocument:](self, "associatedFileModificationDateWithDocument:", a3), "copy");
  }
  return self->psdImageRef;
}

- (void)_loadMetricsMasksWithDocument:(id)a3
{
  id v4;
  void *v5;
  CUIImage *v6;
  CUIImage *v7;
  CUIImage *v8;
  CUIImage *v9;

  v4 = -[TDPhotoshopElementProduction psdImageRefWithDocument:](self, "psdImageRefWithDocument:", a3);
  if (!self->_edgeMetricsMask)
  {
    v5 = v4;
    v6 = (CUIImage *)(id)objc_msgSend(v4, "maskFromCompositeAlphaChannel:", 1);
    self->_edgeMetricsMask = v6;
    if (v6)
    {
      if (!self->_textMetricsMask)
      {
        v7 = (CUIImage *)(id)objc_msgSend(v5, "maskFromCompositeAlphaChannel:", 2);
        self->_textMetricsMask = v7;
        if (v7)
        {
          if (!self->_baselineMetricsMask)
          {
            v8 = (CUIImage *)(id)objc_msgSend(v5, "maskFromCompositeAlphaChannel:", 3);
            self->_baselineMetricsMask = v8;
            if (v8)
            {
              if (!self->_auxiliary1MetricsMask)
              {
                v9 = (CUIImage *)(id)objc_msgSend(v5, "maskFromCompositeAlphaChannel:", 4);
                self->_auxiliary1MetricsMask = v9;
                if (v9)
                {
                  if (!self->_auxiliary2MetricsMask)
                    self->_auxiliary2MetricsMask = (CUIImage *)(id)objc_msgSend(v5, "maskFromCompositeAlphaChannel:", 5);
                }
              }
            }
          }
        }
      }
    }
  }
  self->_didCheckForMetricsMasks = 1;
}

- (id)edgeMetricsMaskWithDocument:(id)a3
{
  if (!self->_didCheckForMetricsMasks)
    -[TDPhotoshopElementProduction _loadMetricsMasksWithDocument:](self, "_loadMetricsMasksWithDocument:", a3);
  return self->_edgeMetricsMask;
}

- (id)textMetricsMaskWithDocument:(id)a3
{
  if (!self->_didCheckForMetricsMasks)
    -[TDPhotoshopElementProduction _loadMetricsMasksWithDocument:](self, "_loadMetricsMasksWithDocument:", a3);
  return self->_textMetricsMask;
}

- (id)baselineMetricsMaskWithDocument:(id)a3
{
  if (!self->_didCheckForMetricsMasks)
    -[TDPhotoshopElementProduction _loadMetricsMasksWithDocument:](self, "_loadMetricsMasksWithDocument:", a3);
  return self->_baselineMetricsMask;
}

- (id)auxiliary1MetricsMaskWithDocument:(id)a3
{
  if (!self->_didCheckForMetricsMasks)
    -[TDPhotoshopElementProduction _loadMetricsMasksWithDocument:](self, "_loadMetricsMasksWithDocument:", a3);
  return self->_auxiliary1MetricsMask;
}

- (id)auxiliary2MetricsMaskWithDocument:(id)a3
{
  if (!self->_didCheckForMetricsMasks)
    -[TDPhotoshopElementProduction _loadMetricsMasksWithDocument:](self, "_loadMetricsMasksWithDocument:", a3);
  return self->_auxiliary2MetricsMask;
}

- (id)log
{
  NSMutableAttributedString *log;

  -[TDPhotoshopElementProduction willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("log"));
  log = self->log;
  if (!log)
    log = (NSMutableAttributedString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", &stru_24EF2D4A8);
  -[TDPhotoshopElementProduction didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("log"));
  return log;
}

- (void)appendToLog:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  if (!appendToLog__attributes)
    appendToLog__attributes = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:arguments:", a3, 0, &v11);
  v6 = appendToLog__messageIndex++;
  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d - "), v6);
  v8 = objc_alloc(MEMORY[0x24BDD1688]);
  v9 = (id)objc_msgSend(v8, "initWithString:attributes:", v7, appendToLog__attributes);
  v10 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(v9, "appendAttributedString:", (id)objc_msgSend(v10, "initWithString:attributes:", v5, appendToLog__attributes));
  objc_msgSend(v9, "appendAttributedString:", -[TDPhotoshopElementProduction log](self, "log"));
  -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", v9, CFSTR("log"));
}

- (BOOL)generateRenditionsWithEntityName:(id)a3 document:(id)a4 errorDescription:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  _BOOL8 v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  BOOL result;
  __CFString *v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __CFString *v30;
  uint64_t v31;
  __CFString *v33;
  uint64_t i;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  BOOL v55;
  uint64_t v56;
  objc_class *v57;
  void *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  int v62;
  int v63;
  int v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  void *v68;
  unsigned int v69;
  uint64_t v70;
  void *v71;
  Class v72;
  void *v73;
  uint64_t v74;
  uint64_t v76;
  id v77;
  id v78[2];

  if (!a3)
  {
    v15 = objc_msgSend(&stru_24EF2D4A8, "stringByAppendingString:", CFSTR("ERROR: Null entityName passed to generateRenditionsWithEntityName"));
    goto LABEL_8;
  }
  v73 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDPhotoshopElementProduction entity](self, "entity"), "managedObjectModel"), "entitiesByName"), "objectForKey:", a3);
  v72 = NSClassFromString((NSString *)objc_msgSend(v73, "managedObjectClassName"));
  if (!-[objc_class isSubclassOfClass:](v72, "isSubclassOfClass:", objc_opt_class()))
  {
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Entity %@ passed to TDPhotoshopElementProduction -generateRenditionsWithEntityName: is not TDPhotoshopRenditionSpec subclass"), a3);
LABEL_8:
    v16 = (void *)v15;
    NSLog(CFSTR("%@"), v15);
    if (a5)
    {
      result = 0;
      *a5 = v16;
      return result;
    }
    return 0;
  }
  v8 = -[TDPhotoshopElementProduction psdImageRefWithDocument:](self, "psdImageRefWithDocument:", a4);
  if (!v8)
  {
    if (a5)
    {
      result = 0;
      v18 = CFSTR("ERROR: Invalid Photoshop PSD file");
LABEL_16:
      *a5 = v18;
      return result;
    }
    v14 = CFSTR("ERROR: Invalid Photoshop PSD file");
    goto LABEL_23;
  }
  v9 = v8;
  v10 = objc_msgSend(-[TDPhotoshopElementProduction rowCount](self, "rowCount"), "intValue");
  v11 = objc_msgSend(-[TDPhotoshopElementProduction columnCount](self, "columnCount"), "intValue");
  v12 = objc_msgSend((id)-[TDPhotoshopElementProduction renditionType](self, "renditionType"), "identifier");
  v13 = v12 != 6;
  if ((int)v10 < v13)
  {
    v14 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Element must have %d or more rows, not %d row(s). The asset may not have enough slices to satisfy the rendition type's specifications."), v13, v10);
    goto LABEL_14;
  }
  if ((int)v11 < v13)
  {
    v14 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Element must have %d or more columns, not %d column(s). The asset may not have enough slices to satisfy the rendition type's specifications."), v13, v11);
    goto LABEL_14;
  }
  v64 = v11;
  v19 = v12;
  v20 = objc_msgSend(v9, "numberOfSlices");
  if (v19 > 8 || ((1 << v19) & 0x160) == 0)
  {
    v27 = (v20 - 1);
    v28 = v11 * v10 * objc_msgSend((id)objc_opt_class(), "sliceRowsPerRendition:", v19);
    v29 = v28 * objc_msgSend((id)objc_opt_class(), "sliceColumnsPerRendition:", v19);
    if ((_DWORD)v27 != (_DWORD)v29)
    {
      v30 = &stru_24EF2D4A8;
      if (objc_msgSend(&stru_24EF2D4A8, "length"))
        v30 = (__CFString *)objc_msgSend(&stru_24EF2D4A8, "stringByAppendingString:", CFSTR("\n"));
      if ((v29 & 0x80000000) != 0)
      {
        v60 = objc_msgSend((id)objc_opt_class(), "sliceRowsPerRendition:", v19);
        v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: PSD slice count is %d. The production says it requires %d slices, which is abnormal. This may be the result of hidden slices lurking about in the PSD asset. Try selecting the first or last slice and deleting it. Do you have one less slice now? Also confirm that the slice boundaries are correct. Given the rendition type chosen, you need a slice count that is a multiple of %d."), v27, v29, objc_msgSend((id)objc_opt_class(), "sliceColumnsPerRendition:", v19) * v60);
      }
      else
      {
        v31 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: PSD slice count %d is not consistent with element production requirements %d"), v27, v29, v61);
      }
      v14 = (__CFString *)-[__CFString stringByAppendingString:](v30, "stringByAppendingString:", v31);
LABEL_14:
      v18 = v14;
      if (a5)
      {
        result = 0;
        goto LABEL_16;
      }
LABEL_23:
      -[TDPhotoshopElementProduction appendToLog:](self, "appendToLog:", -[__CFString stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("\n")));
      return 0;
    }
  }
  v62 = v10;
  v78[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v77 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v76 = 0x7FFFFFFFFFFFFFFFLL;
  -[TDPhotoshopElementProduction getDrawingLayerIndices:themeLayers:lowestIndex:](self, "getDrawingLayerIndices:themeLayers:lowestIndex:", v78, &v77, &v76);
  v71 = (void *)objc_msgSend((id)-[TDPhotoshopElementProduction partDefinition](self, "partDefinition"), "validStatesWithDocument:", a4);
  v76 = objc_msgSend(v71, "count");
  v74 = objc_msgSend(v78[0], "count");
  v21 = objc_msgSend(v9, "numberOfLayers");
  v22 = v21;
  v23 = v76;
  v24 = v9;
  v66 = v19;
  if (v76 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v68 = 0;
    v76 = v21;
    v25 = &stru_24EF2D4A8;
    v23 = v21;
  }
  else if (v76 >= v21)
  {
    v68 = 0;
    v25 = &stru_24EF2D4A8;
  }
  else
  {
    v68 = 0;
    v25 = &stru_24EF2D4A8;
    do
    {
      if ((objc_msgSend(v78[0], "containsObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v23)) & 1) == 0)
      {
        if (!v68)
          v68 = (void *)objc_msgSend(v9, "layerNames");
        if (-[__CFString length](v25, "length"))
          v25 = (__CFString *)-[__CFString stringByAppendingString:](v25, "stringByAppendingString:", CFSTR("\n"));
        v26 = (__CFString *)-[__CFString stringByAppendingString:](v25, "stringByAppendingString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WARNING: Photoshop layer \"%@\" (index %ld) is not assigned to a state or rendition layer"), objc_msgSend(v68, "objectAtIndex:", v23), v23));
        v25 = v26;
        if (a5)
          *a5 = v26;
        else
          -[TDPhotoshopElementProduction appendToLog:](self, "appendToLog:", -[__CFString stringByAppendingString:](v26, "stringByAppendingString:", CFSTR("\n")));
      }
      ++v23;
    }
    while (v22 != v23);
    v23 = v76;
  }
  if (v23 != 1 && v23 != 4)
  {
    if (-[__CFString length](v25, "length"))
      v25 = (__CFString *)-[__CFString stringByAppendingString:](v25, "stringByAppendingString:", CFSTR("\n"));
    v33 = (__CFString *)-[__CFString stringByAppendingString:](v25, "stringByAppendingString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WARNING: State layer count %ld not equal to 1 or 5 or 6"), v76));
    v25 = v33;
    if (a5)
      *a5 = v33;
    else
      -[TDPhotoshopElementProduction appendToLog:](self, "appendToLog:", -[__CFString stringByAppendingString:](v33, "stringByAppendingString:", CFSTR("\n")));
  }
  v70 = objc_msgSend(v71, "indexOfObjectPassingTest:", &__block_literal_global_1);
  if ((_DWORD)v22)
  {
    for (i = 0; i != v22; ++i)
    {
      objc_msgSend(v9, "boundsAtLayer:", i);
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v42 = v35;
      if ((rint(v40) == 0.0 || rint(v35) == 0.0) && (v70 != i || v76 <= i))
      {
        if (!v68)
          v68 = (void *)objc_msgSend(v9, "layerNames");
        if (-[__CFString length](v25, "length"))
          v25 = (__CFString *)-[__CFString stringByAppendingString:](v25, "stringByAppendingString:", CFSTR("\n"));
        v43 = (__CFString *)-[__CFString stringByAppendingString:](v25, "stringByAppendingString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WARNING: Layer \"%@\" (index %ld) has no pixels. Layer bounds of {{%ld,%ld},{%ld,%ld}}"), objc_msgSend(v68, "objectAtIndex:", i), i, (uint64_t)v37, (uint64_t)v39, (uint64_t)v41, (uint64_t)v42));
        v25 = v43;
        if (a5)
          *a5 = v43;
        else
          -[TDPhotoshopElementProduction appendToLog:](self, "appendToLog:", -[__CFString stringByAppendingString:](v43, "stringByAppendingString:", CFSTR("\n")));
        v9 = v24;
      }
    }
  }
  if (v66 == 6)
  {
    v64 = 1;
    v44 = 4;
    v46 = 1;
    v45 = 4;
  }
  else
  {
    v44 = objc_msgSend((id)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("rowIterationType")), "identifier");
    v45 = objc_msgSend((id)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("columnIterationType")), "identifier");
    v46 = v62;
  }
  v47 = objc_msgSend((id)-[TDPhotoshopElementProduction partDefinition](self, "partDefinition"), "partFeatures");
  v48 = objc_msgSend(v71, "indexOfObjectPassingTest:", &__block_literal_global_57);
  v49 = objc_msgSend(v71, "indexOfObjectPassingTest:", &__block_literal_global_58);
  v50 = v64;
  if (v46 >= 1)
  {
    v51 = 0;
    v63 = v46;
    v67 = v48;
    v69 = v47;
    v65 = v49;
    do
    {
      if (v50 >= 1)
      {
        v52 = 0;
        v53 = v76;
        do
        {
          if (v53 >= 1)
          {
            for (j = 0; j < v53; ++j)
            {
              v55 = j == v70 && (v47 & 0x100) == 0;
              if (!v55
                && ((j == v48) & (v47 >> 11)) == 0
                && ((j == v49) & (v47 >> 19)) == 0
                && (v74 & 0x8000000000000000) == 0)
              {
                v56 = -1;
                do
                {
                  v57 = -[objc_class initWithEntity:insertIntoManagedObjectContext:](-[objc_class alloc](v72, "alloc"), "initWithEntity:insertIntoManagedObjectContext:", v73, -[TDPhotoshopElementProduction managedObjectContext](self, "managedObjectContext"));
                  -[objc_class setValue:forKey:](v57, "setValue:forKey:", self, CFSTR("production"));
                  objc_msgSend((id)-[TDPhotoshopElementProduction mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("renditions")), "addObject:", v57);
                  -[objc_class resetToBaseKeySpec](v57, "resetToBaseKeySpec");
                  -[TDPhotoshopElementProduction fillIterationKeyAttribute:iteration:rowOrColumn:document:](self, "fillIterationKeyAttribute:iteration:rowOrColumn:document:", -[objc_class keySpec](v57, "keySpec"), v44, v51, a4);
                  -[TDPhotoshopElementProduction fillIterationKeyAttribute:iteration:rowOrColumn:document:](self, "fillIterationKeyAttribute:iteration:rowOrColumn:document:", -[objc_class keySpec](v57, "keySpec"), v45, v52, a4);
                  objc_msgSend((id)-[objc_class keySpec](v57, "keySpec"), "setState:", objc_msgSend(v71, "objectAtIndex:", j));
                  -[objc_class setValue:forKey:](v57, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v51), CFSTR("row"));
                  -[objc_class setValue:forKey:](v57, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v52), CFSTR("column"));
                  v58 = (void *)-[objc_class keySpec](v57, "keySpec");
                  if (v56 == -1)
                  {
                    if (!objc_msgSend(v58, "layer"))
                      objc_msgSend((id)-[objc_class keySpec](v57, "keySpec"), "setLayer:", objc_msgSend(a4, "drawingLayerWithIdentifier:", 0));
                    v59 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", j);
                  }
                  else
                  {
                    objc_msgSend(v58, "setLayer:", objc_msgSend(v77, "objectAtIndex:", v56));
                    v59 = objc_msgSend(v78[0], "objectAtIndex:", v56);
                  }
                  -[objc_class setValue:forKey:](v57, "setValue:forKey:", v59, CFSTR("layer"));
                  ++v56;
                }
                while (v74 != v56);
                v53 = v76;
                v48 = v67;
                v47 = v69;
                v49 = v65;
              }
            }
          }
          v52 = (v52 + 1);
          v50 = v64;
        }
        while ((_DWORD)v52 != v64);
      }
      v51 = (v51 + 1);
    }
    while ((_DWORD)v51 != v63);
  }
  return 1;
}

BOOL __91__TDPhotoshopElementProduction_generateRenditionsWithEntityName_document_errorDescription___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier") == 1;
}

BOOL __91__TDPhotoshopElementProduction_generateRenditionsWithEntityName_document_errorDescription___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier") == 2;
}

BOOL __91__TDPhotoshopElementProduction_generateRenditionsWithEntityName_document_errorDescription___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier") == 4;
}

- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  objc_msgSend(a3, "deleteObjects:", objc_msgSend((id)-[TDPhotoshopElementProduction renditions](self, "renditions"), "allObjects"));
  v7 = (void *)-[TDPhotoshopElementProduction asset](self, "asset");
  v8 = v7;
  if (v4)
  {
    v9 = (void *)objc_msgSend(v7, "fileURLWithDocument:", a3);
    if (objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0))
    {
      objc_msgSend(a3, "assetManagementDelegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "willDeleteAsset:atURL:", v8, v9);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtURL:error:", v9, 0);
      objc_msgSend(a3, "assetManagementDelegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "didDeleteAssetAtURL:", v9);
    }
  }
  objc_msgSend(a3, "deleteObject:", v8);
}

- (void)copyAttributesInto:(id)a3
{
  objc_msgSend(a3, "setRenditionType:", -[TDPhotoshopElementProduction renditionType](self, "renditionType"));
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("isActive")), CFSTR("isActive"));
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("comment")), CFSTR("comment"));
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction rowCount](self, "rowCount"), CFSTR("rowCount"));
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction columnCount](self, "columnCount"), CFSTR("columnCount"));
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("rowIterationType")), CFSTR("rowIterationType"));
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("columnIterationType")), CFSTR("columnIterationType"));
  objc_msgSend(a3, "setValue:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("layerMappings")), CFSTR("layerMappings"));
}

- (id)dataFromAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 7);
  v4 = (void *)-[TDPhotoshopElementProduction renditionType](self, "renditionType");
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("renditionType"));
  objc_msgSend(v3, "setObject:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("rowCount")), CFSTR("rowCount"));
  objc_msgSend(v3, "setObject:forKey:", -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("columnCount")), CFSTR("columnCount"));
  v5 = (void *)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("rowIterationType"));
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("rowIterationType"));
  v6 = (void *)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("columnIterationType"));
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("columnIterationType"));
  v7 = (void *)-[TDPhotoshopElementProduction layerMappings](self, "layerMappings");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v3, "setObject:forKey:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "photoshopLayerIndex"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "themeDrawingLayer"), "constantName"));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(-[TDPhotoshopElementProduction baseKeySpec](self, "baseKeySpec"), "dataFromAttributes"), CFSTR("baseKeySpec"));
  return (id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
}

- (id)_layerMappingForPhotoshopLayer:(int64_t)a3 drawingLayer:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  TDLayerMapping *v10;
  id v11;
  void *v12;
  uint64_t v14;

  v6 = (void *)-[TDPhotoshopElementProduction managedObjectContext](self, "managedObjectContext");
  v7 = objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("LayerMapping"), v6);
  v8 = objc_alloc_init(MEMORY[0x24BDBB678]);
  objc_msgSend(v8, "setEntity:", v7);
  objc_msgSend(v8, "setPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("photoshopLayerIndex = %d AND themeDrawingLayer.identifier = %d"), a3, a4));
  v14 = 0;
  v9 = (void *)objc_msgSend(v6, "executeFetchRequest:error:", v8, &v14);

  if (objc_msgSend(v9, "count"))
    return (id)objc_msgSend(v9, "objectAtIndex:", 0);
  v10 = -[TDLayerMapping initWithEntity:insertIntoManagedObjectContext:]([TDLayerMapping alloc], "initWithEntity:insertIntoManagedObjectContext:", v7, v6);
  -[TDLayerMapping setValue:forKey:](v10, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3), CFSTR("photoshopLayerIndex"));
  v11 = objc_alloc_init(MEMORY[0x24BDBB678]);
  objc_msgSend(v11, "setEntity:", objc_msgSend(MEMORY[0x24BDBB658], "entityForName:inManagedObjectContext:", CFSTR("ThemeDrawingLayer"), v6));
  objc_msgSend(v11, "setPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier = %d"), a4));
  v12 = (void *)objc_msgSend(v6, "executeFetchRequest:error:", v11, &v14);

  -[TDLayerMapping setValue:forKey:](v10, "setValue:forKey:", objc_msgSend(v12, "objectAtIndex:", 0), CFSTR("themeDrawingLayer"));
  return v10;
}

- (void)setAttributesFromData:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = (void *)-[TDPhotoshopElementProduction managedObjectContext](self, "managedObjectContext");
  v6 = objc_msgSend(v4, "objectForKey:", CFSTR("baseKeySpec"));
  if (v6)
    objc_msgSend(-[TDPhotoshopElementProduction baseKeySpec](self, "baseKeySpec"), "setAttributesFromData:", v6);
  v7 = objc_msgSend(v4, "objectForKey:", CFSTR("renditionType"));
  if (v7)
    -[TDPhotoshopElementProduction setRenditionType:](self, "setRenditionType:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7))));
  v8 = objc_msgSend(v4, "objectForKey:", CFSTR("rowCount"));
  if (v8)
    -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", v8, CFSTR("rowCount"));
  v9 = objc_msgSend(v4, "objectForKey:", CFSTR("columnCount"));
  if (v9)
    -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", v9, CFSTR("columnCount"));
  v10 = objc_msgSend(v4, "objectForKey:", CFSTR("rowIterationType"));
  if (v10)
    -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10))), CFSTR("rowIterationType"));
  v11 = objc_msgSend(v4, "objectForKey:", CFSTR("columnIterationType"));
  if (v11)
    -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11))), CFSTR("columnIterationType"));
  v12 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("kCoreThemeLayerPulse"));
  if (v12)
  {
    v13 = v12;
    if (objc_msgSend(v12, "integerValue"))
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v13, "integerValue"), 3)));
  }
  v14 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("kCoreThemeLayerHighlight"));
  if (v14)
  {
    v15 = v14;
    if (objc_msgSend(v14, "integerValue"))
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v15, "integerValue"), 1)));
  }
  v16 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("kCoreThemeLayerHitMask"));
  if (v16)
  {
    v17 = v16;
    if (objc_msgSend(v16, "integerValue"))
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v17, "integerValue"), 4)));
  }
  v18 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("kCoreThemeLayerMask"));
  if (v18)
  {
    v19 = v18;
    if (objc_msgSend(v18, "integerValue"))
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v19, "integerValue"), 2)));
  }
  v20 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("kCoreThemeLayerPatternOverlay"));
  if (v20)
  {
    v21 = v20;
    if (objc_msgSend(v20, "integerValue"))
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v21, "integerValue"), 5)));
  }
  v22 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("kCoreThemeLayerOutline"));
  if (v22)
  {
    v23 = v22;
    if (objc_msgSend(v22, "integerValue"))
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v23, "integerValue"), 6)));
  }
  v24 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("kCoreThemeLayerInterior"));
  if (v24)
  {
    v25 = v24;
    if (objc_msgSend(v24, "integerValue"))
      -[TDPhotoshopElementProduction addLayerMappings:](self, "addLayerMappings:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", -[TDPhotoshopElementProduction _layerMappingForPhotoshopLayer:drawingLayer:](self, "_layerMappingForPhotoshopLayer:drawingLayer:", objc_msgSend(v25, "integerValue"), 7)));
  }
}

- (id)copyDataFromAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 14);
  v4 = -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("columnCount"));
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("columnCount"));
  v5 = -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("rowCount"));
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("rowCount"));
  v6 = -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("comment"));
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("comment"));
  v7 = -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("isActive"));
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("isActive"));
  v8 = -[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("isExcludedFromFilter"));
  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isExcludedFromFilter"));
  v9 = (void *)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("renditionType"));
  if (v9)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v9, "identifier")), CFSTR("renditionType"));
  v10 = (void *)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("artworkDraftType"));
  if (v10)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "identifier")), CFSTR("artworkDraftType"));
  v11 = (void *)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("columnIterationType"));
  if (v11)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v11, "identifier")), CFSTR("columnIterationType"));
  v12 = (void *)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("rowIterationType"));
  if (v12)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v12, "identifier")), CFSTR("rowIterationType"));
  v13 = (void *)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("renditionSubtype"));
  if (v13)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v13, "identifier")), CFSTR("renditionSubtype"));
  v14 = (void *)-[TDPhotoshopElementProduction valueForKey:](self, "valueForKey:", CFSTR("baseKeySpec"));
  if (v14)
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v14, "copyDataFromAttributes"), CFSTR("baseKeySpec"));
  v15 = (void *)-[TDPhotoshopElementProduction asset](self, "asset");
  if (v15)
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v15, "copyDataFromAttributes"), CFSTR("asset"));
  v16 = (void *)-[TDPhotoshopElementProduction mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("layerMappings"));
  if (objc_msgSend(v16, "count"))
  {
    v17 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v18 = (void *)objc_msgSend(v16, "allObjects");
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v36;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "addObject:", (id)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v22++), "copyDataFromAttributes"));
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v20);
    }
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("layerMappings"));
  }
  v23 = (void *)-[TDPhotoshopElementProduction mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("renditions"));
  if (objc_msgSend(v23, "count"))
  {
    v24 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = (void *)objc_msgSend(v23, "allObjects", 0);
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v32;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v32 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(v24, "addObject:", (id)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v29++), "copyDataFromAttributes"));
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v27);
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("renditions"));
  }
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0), "copy");
}

- (void)setAttributesFromCopyData:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = objc_msgSend(v4, "objectForKey:", CFSTR("columnCount"));
  if (v5)
    -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", v5, CFSTR("columnCount"));
  v6 = objc_msgSend(v4, "objectForKey:", CFSTR("rowCount"));
  if (v6)
    -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", v6, CFSTR("rowCount"));
  v7 = objc_msgSend(v4, "objectForKey:", CFSTR("comment"));
  if (v7)
    -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", v7, CFSTR("comment"));
  v8 = objc_msgSend(v4, "objectForKey:", CFSTR("isActive"));
  if (v8)
    -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", v8, CFSTR("isActive"));
  v9 = objc_msgSend(v4, "objectForKey:", CFSTR("isExcludedFromFilter"));
  if (v9)
    -[TDPhotoshopElementProduction setValue:forKey:](self, "setValue:forKey:", v9, CFSTR("isExcludedFromFilter"));
}

@end
