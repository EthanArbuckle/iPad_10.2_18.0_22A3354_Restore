@implementation MTLRasterizationRateMapDescriptorInternal

- (MTLRasterizationRateMapDescriptorInternal)init
{
  MTLRasterizationRateMapDescriptorInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLRasterizationRateMapDescriptorInternal;
  v2 = -[MTLRasterizationRateMapDescriptorInternal init](&v4, sel_init);
  if (v2)
  {
    v2->_layerAccessor = -[MTLRasterizationRateLayerArrayInternal initWithParent:]([MTLRasterizationRateLayerArrayInternal alloc], "initWithParent:", v2);
    v2->_mutability = 2;
    v2->_minFactor = 0.0;
  }
  return v2;
}

- (MTLRasterizationRateMapDescriptorInternal)initWithScreenSize:(id *)a3
{
  MTLRasterizationRateMapDescriptorInternal *result;
  unint64_t var2;

  result = -[MTLRasterizationRateMapDescriptorInternal init](self, "init");
  if (result)
  {
    var2 = a3->var2;
    *(_OWORD *)&result->_screenSize.width = *(_OWORD *)&a3->var0;
    result->_screenSize.depth = var2;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTLRasterizationRateMapDescriptorInternal *v4;
  __int128 v5;
  vector<MTLRasterizationRateLayerDescriptor *, std::allocator<MTLRasterizationRateLayerDescriptor *>> *p_layers;
  unint64_t v7;
  __end_ **begin;
  unint64_t v9;
  uint64_t v11;

  v4 = -[MTLRasterizationRateMapDescriptorInternal init](+[MTLRasterizationRateMapDescriptor allocWithZone:](MTLRasterizationRateMapDescriptorInternal, "allocWithZone:", a3), "init");
  v5 = *(_OWORD *)&self->_screenSize.width;
  v4->_screenSize.depth = self->_screenSize.depth;
  *(_OWORD *)&v4->_screenSize.width = v5;
  v4->_label = (NSString *)-[NSString copy](self->_label, "copy");
  p_layers = &self->_layers;
  v7 = p_layers->var0 - p_layers->__begin_;
  v11 = 0;
  std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)&v4->_layers, v7, &v11);
  begin = p_layers->__begin_;
  if (p_layers->var0 != p_layers->__begin_)
  {
    v9 = 0;
    do
    {
      v4->_layers.__begin_[v9] = (__end_ *)-[__end_ copy](begin[v9], "copy");
      ++v9;
      begin = p_layers->__begin_;
    }
    while (v9 < p_layers->var0 - p_layers->__begin_);
  }
  return v4;
}

- (void)dealloc
{
  vector<MTLRasterizationRateLayerDescriptor *, std::allocator<MTLRasterizationRateLayerDescriptor *>> *p_layers;
  __end_ **var0;
  unint64_t v5;
  objc_super v6;

  p_layers = &self->_layers;
  var0 = self->_layers.var0;
  if (var0 != self->_layers.__begin_)
  {
    v5 = 0;
    var0 = self->_layers.__begin_;
    do
    {

      var0 = p_layers->__begin_;
    }
    while (v5 < p_layers->var0 - p_layers->__begin_);
  }
  p_layers->var0 = var0;

  v6.receiver = self;
  v6.super_class = (Class)MTLRasterizationRateMapDescriptorInternal;
  -[MTLRasterizationRateMapDescriptorInternal dealloc](&v6, sel_dealloc);
}

- (id)layerAtIndex:(unint64_t)a3
{
  __end_ **begin;

  begin = self->_layers.__begin_;
  if (a3 >= self->_layers.var0 - begin)
    return 0;
  else
    return begin[a3];
}

- (void)setLayer:(id)a3 atIndex:(unint64_t)a4
{
  id v7;
  vector<MTLRasterizationRateLayerDescriptor *, std::allocator<MTLRasterizationRateLayerDescriptor *>> *p_layers;
  __end_ **begin;
  __end_ *v10;
  uint64_t v11;

  v7 = a3;
  p_layers = &self->_layers;
  begin = p_layers->__begin_;
  if (a4 >= p_layers->var0 - p_layers->__begin_)
  {
    if (!a3)
      return;
    v11 = 0;
    std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)p_layers, a4 + 1, &v11);
    begin = p_layers->__begin_;
  }
  v10 = begin[a4];
  begin[a4] = (__end_ *)a3;

}

- (id)layers
{
  return self->_layerAccessor;
}

- (unint64_t)layerCount
{
  __end_ **begin;
  __end_cap_ **var0;
  unint64_t result;
  uint64_t v5;
  unint64_t v6;

  begin = self->_layers.__begin_;
  var0 = self->_layers.var0;
  result = 0;
  v5 = (char *)var0 - (char *)begin;
  if (v5)
  {
    v6 = v5 >> 3;
    if (v6 <= 1)
      v6 = 1;
    while (begin[result])
    {
      if (v6 == ++result)
        return v6;
    }
  }
  return result;
}

- (const)layerPointer:(unint64_t *)a3
{
  vector<MTLRasterizationRateLayerDescriptor *, std::allocator<MTLRasterizationRateLayerDescriptor *>> *p_layers;
  const void **result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  p_layers = &self->_layers;
  result = (const void **)self->_layers.__begin_;
  v5 = (char *)p_layers->var0 - (char *)result;
  if (v5)
  {
    v6 = 0;
    v7 = v5 >> 3;
    if (v7 <= 1)
      v7 = 1;
    while (result[v6])
    {
      if (v7 == ++v6)
      {
        *a3 = v7;
        return result;
      }
    }
    *a3 = v6;
    if (!v6)
      return 0;
  }
  else
  {
    result = 0;
    *a3 = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  NSString *label;
  vector<MTLRasterizationRateLayerDescriptor *, std::allocator<MTLRasterizationRateLayerDescriptor *>> *p_layers;
  __end_ **begin;
  __end_cap_ **var0;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  uint64_t v23;
  unint64_t v24;
  char v25;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  uint64_t v31;

  if (a3 == self)
  {
    LOBYTE(v18) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_27;
    label = self->_label;
    p_layers = &self->_layers;
    v30 = *(_OWORD *)&self->_screenSize.width;
    begin = self->_layers.__begin_;
    var0 = self->_layers.var0;
    v9 = 0;
    v10 = (char *)var0 - (char *)begin;
    if (v10)
    {
      v11 = v10 >> 3;
      if (v11 <= 1)
        v11 = 1;
      while (begin[v9])
      {
        if (v11 == ++v9)
        {
          v9 = v11;
          break;
        }
      }
    }
    v31 = -[NSString hash](label, "hash");
    v12 = (_QWORD **)((char *)a3 + 40);
    v27 = *(_OWORD *)((char *)a3 + 8);
    v14 = *((_QWORD *)a3 + 5);
    v13 = *((_QWORD *)a3 + 6);
    v15 = v13 - v14;
    if (v13 == v14)
    {
      v16 = 0;
    }
    else
    {
      v16 = 0;
      v17 = v15 >> 3;
      if (v17 <= 1)
        v17 = 1;
      while (*(_QWORD *)(v14 + 8 * v16))
      {
        if (v17 == ++v16)
        {
          v16 = v17;
          break;
        }
      }
    }
    v29 = v16;
    v19 = objc_msgSend(*((id *)a3 + 4), "hash", (_QWORD)v27);
    v20 = (_QWORD)v30 == v28 && *((_QWORD *)&v30 + 1) == *((_QWORD *)&v27 + 1);
    v21 = v20 && v9 == v29;
    if (v21 && v31 == v19)
    {
      if (v9)
      {
        v18 = objc_msgSend(*(id *)p_layers->__begin_, "isEqual:", **v12);
        if (v18)
        {
          v23 = 1;
          do
          {
            v24 = v23;
            if (v9 == v23)
              break;
            v25 = -[__end_ isEqual:](p_layers->__begin_[v23], "isEqual:", (*v12)[v23]);
            v23 = v24 + 1;
          }
          while ((v25 & 1) != 0);
          LOBYTE(v18) = v24 >= v9;
        }
      }
      else
      {
        LOBYTE(v18) = 1;
      }
    }
    else
    {
LABEL_27:
      LOBYTE(v18) = 0;
    }
  }
  return v18;
}

- (unint64_t)hash
{
  NSString *label;
  vector<MTLRasterizationRateLayerDescriptor *, std::allocator<MTLRasterizationRateLayerDescriptor *>> *p_layers;
  __end_cap_ **var0;
  __end_ **begin;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t i;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;

  label = self->_label;
  p_layers = &self->_layers;
  v13 = *(_OWORD *)&self->_screenSize.width;
  begin = self->_layers.__begin_;
  var0 = self->_layers.var0;
  v7 = (char *)var0 - (char *)begin;
  if (var0 == begin)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    v9 = v7 >> 3;
    if (v9 <= 1)
      v9 = 1;
    while (begin[v8])
    {
      if (v9 == ++v8)
      {
        v8 = v9;
        break;
      }
    }
  }
  v14 = v8;
  v15 = -[NSString hash](label, "hash", v13);
  v10 = _MTLHashState((int *)&v13, 0x20uLL);
  if (v14)
  {
    for (i = 0; i < v14; ++i)
      v10 ^= -[__end_ hash](p_layers->__begin_[i], "hash");
  }
  return v10;
}

- (id)description
{
  return -[MTLRasterizationRateMapDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *label;
  void *v8;
  __end_cap_ **var0;
  __end_ **begin;
  unint64_t v11;
  __end_ *v12;
  void *v13;
  void *v15;
  objc_super v16;
  _QWORD v17[14];

  v17[12] = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = v5;
  v17[0] = v5;
  v17[1] = CFSTR("label =");
  label = (const __CFString *)self->_label;
  if (!label)
    label = CFSTR("<none>");
  v17[2] = label;
  v17[3] = v5;
  v17[4] = CFSTR("screenSize.width =");
  v17[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_screenSize.width);
  v17[6] = v6;
  v17[7] = CFSTR("screenSize.height =");
  v17[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_screenSize.height);
  v17[9] = v6;
  v17[10] = CFSTR("layerCount =");
  v17[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTLRasterizationRateMapDescriptorInternal layerCount](self, "layerCount"));
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 12);
  v8 = (void *)objc_opt_new();
  begin = self->_layers.__begin_;
  var0 = self->_layers.var0;
  if (var0 != begin)
  {
    v11 = 0;
    do
    {
      v12 = begin[v11];
      if (v12)
      {
        objc_msgSend(v8, "addObject:", v6);
        objc_msgSend(v8, "addObject:", CFSTR(" layers["));
        objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11));
        objc_msgSend(v8, "addObject:", CFSTR("] = "));
        objc_msgSend(v8, "addObject:", -[__end_ formattedDescription:](v12, "formattedDescription:", v4));
        begin = self->_layers.__begin_;
        var0 = self->_layers.var0;
      }
      ++v11;
    }
    while (v11 < var0 - begin);
  }
  v16.receiver = self;
  v16.super_class = (Class)MTLRasterizationRateMapDescriptorInternal;
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), -[MTLRasterizationRateMapDescriptorInternal description](&v16, sel_description), objc_msgSend(v15, "componentsJoinedByString:", CFSTR(" ")), objc_msgSend(v8, "componentsJoinedByString:", &stru_1E0FE5DC8));

  return v13;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)&self->var1;
  return self;
}

- (void)setScreenSize:(id *)a3
{
  unint64_t var2;

  var2 = a3->var2;
  *(_OWORD *)&self->_screenSize.width = *(_OWORD *)&a3->var0;
  self->_screenSize.depth = var2;
}

- (BOOL)skipSampleValidationAndInterpolation
{
  return self->_skipSampleValidationAndInterpolation;
}

- (void)setSkipSampleValidationAndInterpolation:(BOOL)a3
{
  self->_skipSampleValidationAndInterpolation = a3;
}

- (BOOL)skipSampleValidationAndApplySampleAtTileGranularity
{
  return self->_skipSampleValidationAndApplySampleAtTileGranularity;
}

- (void)setSkipSampleValidationAndApplySampleAtTileGranularity:(BOOL)a3
{
  self->_skipSampleValidationAndApplySampleAtTileGranularity = a3;
}

- (unint64_t)mutability
{
  return self->_mutability;
}

- (void)setMutability:(unint64_t)a3
{
  self->_mutability = a3;
}

- (float)minFactor
{
  return self->_minFactor;
}

- (void)setMinFactor:(float)a3
{
  self->_minFactor = a3;
}

- (id)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  vector<MTLRasterizationRateLayerDescriptor *, std::allocator<MTLRasterizationRateLayerDescriptor *>> *p_layers;
  __end_ **begin;

  p_layers = &self->_layers;
  begin = self->_layers.__begin_;
  if (begin)
  {
    p_layers->var0 = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
