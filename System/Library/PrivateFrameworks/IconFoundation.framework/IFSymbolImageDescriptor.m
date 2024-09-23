@implementation IFSymbolImageDescriptor

- (IFSymbolImageDescriptor)init
{
  char *v2;
  float v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IFSymbolImageDescriptor;
  v2 = -[IFSymbolImageDescriptor init](&v8, sel_init);
  if (v2)
  {
    MGGetFloat32Answer();
    *((double *)v2 + 2) = v3;
    *((_QWORD *)v2 + 1) = 0x4031000000000000;
    *(_OWORD *)(v2 + 24) = xmmword_1D41397D0;
    *((_QWORD *)v2 + 5) = 5;
    v4 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "characterDirectionForLanguage:", v5);

    if (v6 == 2)
      *((_QWORD *)v2 + 5) = 4;
  }
  return (IFSymbolImageDescriptor *)v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_pointSize;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_scale;
  *((_QWORD *)result + 4) = self->_symbolWeight;
  *((_QWORD *)result + 3) = self->_symbolSize;
  *((_QWORD *)result + 5) = self->_layoutDirection;
  return result;
}

- (id)digest
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f:%.0f:%ld:%ld"), *(_QWORD *)&self->_pointSize, *(_QWORD *)&self->_scale, self->_symbolSize, self->_symbolWeight);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (unint64_t)symbolSize
{
  return self->_symbolSize;
}

- (void)setSymbolSize:(unint64_t)a3
{
  self->_symbolSize = a3;
}

- (int64_t)symbolWeight
{
  return self->_symbolWeight;
}

- (void)setSymbolWeight:(int64_t)a3
{
  self->_symbolWeight = a3;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

@end
