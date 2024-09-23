@implementation FigCaptureSmartStyleSet

+ (id)smartStyleSetWithSmartStyles:(id)a3 regions:(id)a4
{
  return -[FigCaptureSmartStyleSet initWithSmartStyles:regions:]([FigCaptureSmartStyleSet alloc], a3, a4);
}

- (_QWORD)initWithSmartStyles:(void *)a3 regions:
{
  _QWORD *v5;
  id v6;
  id v7;
  unint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  CGRect v18;
  CGRect v19;
  objc_super v20;
  CGRect v21;

  if (!a1)
    return 0;
  v20.receiver = a1;
  v20.super_class = (Class)FigCaptureSmartStyleSet;
  v5 = objc_msgSendSuper2(&v20, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v19.size = _Q0;
    v5[2] = a3;
    if (objc_msgSend(a2, "count"))
    {
      for (i = 0; objc_msgSend(a2, "count") > i; ++i)
      {
        v14 = objc_msgSend(a2, "objectAtIndexedSubscript:", i);
        if (a3)
        {
          if (objc_msgSend(a3, "count") <= i)
            continue;
          objc_msgSend(v5, "regionAtIndex:", i, 0, 0, 0, 0);
          v18 = v21;
          v18 = CGRectIntersection(v21, v19);
          if (CGRectIsEmpty(v18))
            continue;
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v18, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
          v15 = v6;
          v16 = v14;
        }
        else
        {
          objc_msgSend(v6, "addObject:", v14);
          v16 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v19, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          v15 = v7;
        }
        objc_msgSend(v15, "addObject:", v16);
      }
    }
    v5[1] = v6;
    v5[2] = v7;
  }
  return v5;
}

- (FigCaptureSmartStyleSet)initWithXPCEncoding:(id)a3
{
  FigCaptureSmartStyleSet *v4;
  xpc_object_t value;
  NSArray *v6;
  size_t v7;
  xpc_object_t v8;
  NSArray *v9;
  size_t v10;
  xpc_object_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 v17;
  __int128 v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)FigCaptureSmartStyleSet;
  v4 = -[FigCaptureSmartStyleSet init](&v19, sel_init);
  if (v4)
  {
    value = xpc_dictionary_get_value(a3, "smartStylesArray");
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (xpc_array_get_count(value))
    {
      v7 = 0;
      do
        -[NSArray addObject:](v6, "addObject:", -[FigCaptureSmartStyle initWithXPCEncoding:]([FigCaptureSmartStyle alloc], "initWithXPCEncoding:", xpc_array_get_value(value, v7++)));
      while (xpc_array_get_count(value) > v7);
    }
    v4->_smartStyles = v6;
    v8 = xpc_dictionary_get_value(a3, "regionsArray");
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (xpc_array_get_count(v8))
    {
      v10 = 0;
      do
      {
        v11 = xpc_array_get_value(v8, v10);
        v17 = 0u;
        v18 = 0u;
        v12 = xpc_dictionary_get_double(v11, "X");
        v13 = xpc_dictionary_get_double(v11, "Y");
        v14 = xpc_dictionary_get_double(v11, "W");
        v15 = xpc_dictionary_get_double(v11, "H");
        *(double *)&v17 = v12;
        *((double *)&v17 + 1) = v13;
        *(double *)&v18 = v14;
        *((double *)&v18 + 1) = v15;
        -[NSArray addObject:](v9, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v17, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
        ++v10;
      }
      while (xpc_array_get_count(v8) > v10);
    }
    v4->_regions = v9;
  }
  return v4;
}

- (id)copyXPCEncoding
{
  xpc_object_t empty;
  unint64_t v4;
  void *v5;
  xpc_object_t v6;
  unint64_t v7;
  xpc_object_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  xpc_object_t v16;

  empty = xpc_array_create_empty();
  if (-[NSArray count](self->_smartStyles, "count"))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_smartStyles, "objectAtIndexedSubscript:", v4), "copyXPCEncoding");
      xpc_array_append_value(empty, v5);

      ++v4;
    }
    while (-[NSArray count](self->_smartStyles, "count") > v4);
  }
  v6 = xpc_array_create_empty();
  if (-[NSArray count](self->_regions, "count"))
  {
    v7 = 0;
    do
    {
      v8 = xpc_dictionary_create_empty();
      -[FigCaptureSmartStyleSet regionAtIndex:](self, "regionAtIndex:", v7);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      xpc_dictionary_set_double(v8, "X", v15);
      xpc_dictionary_set_double(v8, "Y", v10);
      xpc_dictionary_set_double(v8, "W", v12);
      xpc_dictionary_set_double(v8, "H", v14);
      xpc_array_append_value(v6, v8);

      ++v7;
    }
    while (-[NSArray count](self->_regions, "count") > v7);
  }
  v16 = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(v16, "smartStylesArray", empty);

  xpc_dictionary_set_value(v16, "regionsArray", v6);
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSmartStyleSet;
  -[FigCaptureSmartStyleSet dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FigCaptureSmartStyleSet initWithSmartStyles:regions:](+[FigCaptureSmartStyleSet allocWithZone:](FigCaptureSmartStyleSet, "allocWithZone:", a3), self->_smartStyles, self->_regions);
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)-[NSString mutableCopy](-[NSArray description](self->_smartStyles, "description"), "mutableCopy");
  objc_msgSend(v3, "appendString:", CFSTR(", regions = {"));
  if (-[NSArray count](self->_regions, "count"))
  {
    v4 = 0;
    do
    {
      -[FigCaptureSmartStyleSet regionAtIndex:](self, "regionAtIndex:", v4);
      objc_msgSend(v3, "appendFormat:", CFSTR("(%f, %f, %f, %f)"), v5, v6, v7, v8);
      if (-[NSArray count](self->_regions, "count") - 1 > v4)
        objc_msgSend(v3, "appendString:", CFSTR(","));
      ++v4;
    }
    while (-[NSArray count](self->_regions, "count") > v4);
  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return (NSString *)v3;
}

- (NSArray)smartStyles
{
  return self->_smartStyles;
}

- (NSArray)regions
{
  return self->_regions;
}

- (float)leftmostRegionStartXOffset
{
  NSArray *regions;
  uint64_t v3;
  float v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  regions = self->_regions;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](regions, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  v4 = 0.0;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v14;
    v10 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *MEMORY[0x1E0C9D648];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(regions);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v12[0] = v11;
        v12[1] = v10;
        objc_msgSend(v8, "getValue:", v12, v10, v11);
        if (*(double *)v12 > 0.0)
          return *(double *)v12;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](regions, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, *(double *)v12);
      if (v5)
        continue;
      break;
    }
  }
  return v4;
}

- (id)largestRegionSmartStyle
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  float v10;
  double v11;
  double v12;

  v3 = -[NSArray count](self->_regions, "count");
  v4 = -[NSArray count](self->_smartStyles, "count");
  v5 = 8;
  if (v3 > v4)
    v5 = 16;
  v6 = objc_msgSend(*(id *)((char *)&self->super.isa + v5), "count");
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = 0;
  v10 = 0.0;
  do
  {
    -[FigCaptureSmartStyleSet regionAtIndex:](self, "regionAtIndex:", v8);
    if (v11 * v12 > v10)
    {
      v10 = v11 * v12;
      v9 = -[NSArray objectAtIndexedSubscript:](self->_smartStyles, "objectAtIndexedSubscript:", v8);
    }
    ++v8;
  }
  while (v7 != v8);
  return v9;
}

- (CGRect)regionAtIndex:(unint64_t)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  CGRect result;

  v3 = -[NSArray objectAtIndexedSubscript:](self->_regions, "objectAtIndexedSubscript:", a3);
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(v3, "getValue:", &v8);
  v5 = *((double *)&v8 + 1);
  v4 = *(double *)&v8;
  v7 = *((double *)&v9 + 1);
  v6 = *(double *)&v9;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (float)largestEdgeOffset
{
  unint64_t v3;
  float v4;
  float v5;

  if (!-[NSArray count](-[FigCaptureSmartStyleSet smartStyles](self, "smartStyles"), "count"))
    return 0.0;
  v3 = 0;
  v4 = 0.0;
  do
  {
    v5 = -[FigCaptureSemanticStyleSet _edgeOffsetForRegionAtIndex:](self, v3);
    if (v5 > v4)
      v4 = v5;
    ++v3;
  }
  while (-[NSArray count](-[FigCaptureSmartStyleSet smartStyles](self, "smartStyles"), "count") > v3);
  return v4;
}

@end
