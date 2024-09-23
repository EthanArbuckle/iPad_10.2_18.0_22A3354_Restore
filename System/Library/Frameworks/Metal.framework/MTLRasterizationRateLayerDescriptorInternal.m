@implementation MTLRasterizationRateLayerDescriptorInternal

- (MTLRasterizationRateLayerDescriptorInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLRasterizationRateLayerDescriptorInternal;

  return 0;
}

- (MTLRasterizationRateLayerDescriptorInternal)initWithSampleCount:(id *)a3
{
  char *v4;
  unint64_t var1;
  void *v6;
  __int128 v7;
  MTLRasterizationRateSampleArrayInternal *v8;
  objc_super v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11;

  v11 = *a3;
  v10.receiver = self;
  v10.super_class = (Class)MTLRasterizationRateLayerDescriptorInternal;
  v4 = -[MTLRasterizationRateLayerDescriptor initWithSampleCount:](&v10, sel_initWithSampleCount_, &v11);
  if (v4)
  {
    if (!a3->var0)
      goto LABEL_7;
    var1 = a3->var1;
    if (!var1)
      goto LABEL_7;
    v6 = malloc_type_calloc(var1 + a3->var0, 4uLL, 0x100004052888210uLL);
    *((_QWORD *)v4 + 1) = v6;
    if (!v6)
      goto LABEL_7;
    v7 = *(_OWORD *)&a3->var0;
    *((_OWORD *)v4 + 1) = *(_OWORD *)&a3->var0;
    *((_QWORD *)v4 + 4) = 0;
    *((_QWORD *)v4 + 7) = 0;
    *(_OWORD *)(v4 + 40) = v7;
    *((_QWORD *)v4 + 8) = -[MTLRasterizationRateSampleArrayInternal initWithData:numElements:]([MTLRasterizationRateSampleArrayInternal alloc], "initWithData:numElements:", objc_msgSend(v4, "horizontalSampleStorage"), *((_QWORD *)v4 + 2));
    v8 = -[MTLRasterizationRateSampleArrayInternal initWithData:numElements:]([MTLRasterizationRateSampleArrayInternal alloc], "initWithData:numElements:", objc_msgSend(v4, "verticalSampleStorage"), *((_QWORD *)v4 + 3));
    *((_QWORD *)v4 + 9) = v8;
    if (!*((_QWORD *)v4 + 8) || !v8)
    {
LABEL_7:
      objc_msgSend(v4, "dealloc");
      return 0;
    }
  }
  return (MTLRasterizationRateLayerDescriptorInternal *)v4;
}

- (MTLRasterizationRateLayerDescriptorInternal)initWithSampleCount:(id *)a3 horizontal:(const float *)a4 vertical:(const float *)a5
{
  MTLRasterizationRateLayerDescriptorInternal *v7;
  MTLRasterizationRateLayerDescriptorInternal *v8;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10;

  v10 = *a3;
  v7 = -[MTLRasterizationRateLayerDescriptorInternal initWithSampleCount:](self, "initWithSampleCount:", &v10);
  v8 = v7;
  if (v7)
  {
    memcpy(-[MTLRasterizationRateLayerDescriptorInternal horizontalSampleStorage](v7, "horizontalSampleStorage"), a4, 4 * v7->_size.width);
    memcpy(-[MTLRasterizationRateLayerDescriptorInternal verticalSampleStorage](v8, "verticalSampleStorage"), a5, 4 * v8->_size.height);
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_data);

  v3.receiver = self;
  v3.super_class = (Class)MTLRasterizationRateLayerDescriptorInternal;
  -[MTLRasterizationRateLayerDescriptorInternal dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTLRasterizationRateLayerDescriptorInternal *v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  unint64_t depth;
  $E8CF8C4D35898297CF58D66FCEA3D064 size;

  v4 = +[MTLRasterizationRateLayerDescriptor allocWithZone:](MTLRasterizationRateLayerDescriptorInternal, "allocWithZone:", a3);
  size = self->_size;
  v5 = -[MTLRasterizationRateLayerDescriptorInternal initWithSampleCount:](v4, "initWithSampleCount:", &size);
  v6 = (void *)v5;
  if (v5)
  {
    memcpy(*(void **)(v5 + 8), self->_data, 4 * (self->_size.height + self->_size.width));
    v8 = *(_OWORD *)&self->_currentSampleCount.width;
    depth = self->_currentSampleCount.depth;
    objc_msgSend(v6, "setSampleCount:", &v8);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t width;
  unint64_t height;
  BOOL result;

  if (a3 == self)
    return 1;
  objc_opt_class();
  result = (objc_opt_isKindOfClass() & 1) != 0
        && (width = self->_size.width, width == *((_QWORD *)a3 + 2))
        && (height = self->_size.height, height == *((_QWORD *)a3 + 3))
        && self->_currentSampleCount.width == *((_QWORD *)a3 + 5)
        && self->_currentSampleCount.height == *((_QWORD *)a3 + 6)
        && memcmp(self->_data, *((const void **)a3 + 1), 4 * (height + width)) == 0;
  return result;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_currentSampleCount.width ^ self->_currentSampleCount.height;
  return v2 ^ _MTLHashState((int *)self->_data, 4 * (self->_size.height + self->_size.width));
}

- (id)description
{
  return -[MTLRasterizationRateLayerDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (id)formattedDescription:(unint64_t)a3
{
  $E8CF8C4D35898297CF58D66FCEA3D064 *p_size;
  void *v6;
  void *v7;
  double v8;
  float *data;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  $E8CF8C4D35898297CF58D66FCEA3D064 *p_currentSampleCount;
  objc_super v18;
  _QWORD v19[19];

  v19[18] = *MEMORY[0x1E0C80C00];
  p_size = &self->_size;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_size.width);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_size.height);
  data = self->_data;
  if (p_size->width)
  {
    v10 = 0;
    v11 = 0;
    do
    {
      *(float *)&v8 = data[v11];
      objc_msgSend(v6, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8), v11++);
      v10 += 4;
    }
    while (v11 < p_size->width);
    data = (float *)((char *)data + v10);
  }
  if (self->_size.height)
  {
    v12 = 0;
    do
    {
      *(float *)&v8 = data[v12];
      objc_msgSend(v7, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8), v12++);
    }
    while (v12 < self->_size.height);
  }
  v13 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v14 = (void *)MEMORY[0x1E0CB3940];
  v18.receiver = self;
  v18.super_class = (Class)MTLRasterizationRateLayerDescriptorInternal;
  v15 = -[MTLRasterizationRateLayerDescriptorInternal description](&v18, sel_description);
  v19[0] = v13;
  v19[1] = CFSTR("sampleCount.width =");
  p_currentSampleCount = &self->_currentSampleCount;
  v19[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", p_currentSampleCount->width);
  v19[3] = v13;
  v19[4] = CFSTR("sampleCount.height =");
  v19[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", p_currentSampleCount->height);
  v19[6] = v13;
  v19[7] = CFSTR("maxSampleCount.width =");
  v19[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", p_size->width);
  v19[9] = v13;
  v19[10] = CFSTR("maxSampleCount.height =");
  v19[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", p_size->height);
  v19[12] = v13;
  v19[13] = CFSTR("horizontal =");
  v19[14] = objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v19[15] = v13;
  v19[16] = CFSTR("vertical =");
  v19[17] = objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  return (id)objc_msgSend(v14, "stringWithFormat:", CFSTR("%@%@"), v15, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 18), "componentsJoinedByString:", CFSTR(" ")));
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxSampleCount
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)&self->var2;
  return self;
}

- (float)horizontalSampleStorage
{
  return self->_data;
}

- (float)verticalSampleStorage
{
  return &self->_data[self->_size.width];
}

- (id)horizontal
{
  return self->_horizontal;
}

- (id)vertical
{
  return self->_vertical;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sampleCount
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 40);
  return self;
}

- (void)setSampleCount:(id *)a3
{
  unint64_t var2;

  var2 = a3->var2;
  *(_OWORD *)&self->_currentSampleCount.width = *(_OWORD *)&a3->var0;
  self->_currentSampleCount.depth = var2;
}

@end
