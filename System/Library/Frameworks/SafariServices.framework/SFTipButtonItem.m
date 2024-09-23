@implementation SFTipButtonItem

- (SFTipButtonItem)initWithTipType:(int64_t)a3
{
  SFTipButtonItem *v4;
  SFTipButtonItem *v5;
  SFTipButtonItem *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFTipButtonItem;
  v4 = -[SFTipButtonItem init](&v8, sel_init);
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
