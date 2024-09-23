@implementation LPContactsBadgeStyle

- (LPContactsBadgeStyle)initWithPlatform:(int64_t)a3
{
  char *v3;
  LPPointUnit *v4;
  void *v5;
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LPContactsBadgeStyle;
  v3 = -[LPContactsBadgeStyle init](&v8, sel_init, a3);
  if (v3)
  {
    v4 = -[LPPointUnit initWithValue:]([LPPointUnit alloc], "initWithValue:", 24.0);
    v5 = (void *)*((_QWORD *)v3 + 2);
    *((_QWORD *)v3 + 2) = v4;

    *(_OWORD *)(v3 + 24) = xmmword_1A0D660F0;
    *((_QWORD *)v3 + 5) = 0;
    v3[8] = 1;
    v6 = v3;
  }

  return (LPContactsBadgeStyle *)v3;
}

- (LPPointUnit)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
}

- (double)iconOffset
{
  return self->_iconOffset;
}

- (void)setIconOffset:(double)a3
{
  self->_iconOffset = a3;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (BOOL)useShadow
{
  return self->_useShadow;
}

- (void)setUseShadow:(BOOL)a3
{
  self->_useShadow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);
}

@end
