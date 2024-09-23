@implementation SFTipPlatterItem

- (SFTipPlatterItem)initWithTipType:(int64_t)a3
{
  SFTipPlatterItem *v4;
  SFTipPlatterItem *v5;
  SFTipPlatterItem *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFTipPlatterItem;
  v4 = -[SFTipPlatterItem init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_tipType = a3;
    v6 = v4;
  }

  return v5;
}

- (int64_t)tipType
{
  return self->_tipType;
}

@end
