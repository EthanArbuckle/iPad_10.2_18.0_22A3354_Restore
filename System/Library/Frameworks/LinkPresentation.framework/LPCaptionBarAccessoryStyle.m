@implementation LPCaptionBarAccessoryStyle

- (LPCaptionBarAccessoryStyle)init
{
  LPCaptionBarAccessoryStyle *v2;
  LPPadding *v3;
  LPPadding *margin;
  LPCaptionBarAccessoryStyle *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPCaptionBarAccessoryStyle;
  v2 = -[LPCaptionBarAccessoryStyle init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(LPPadding);
    margin = v2->_margin;
    v2->_margin = v3;

    v5 = v2;
  }

  return v2;
}

- (LPPadding)margin
{
  return self->_margin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_margin, 0);
}

@end
