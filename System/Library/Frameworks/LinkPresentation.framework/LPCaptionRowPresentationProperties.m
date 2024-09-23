@implementation LPCaptionRowPresentationProperties

- (LPCaptionRowPresentationProperties)init
{
  LPCaptionRowPresentationProperties *v2;
  LPCaptionRowPresentationProperties *v3;
  LPCaptionRowPresentationProperties *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPCaptionRowPresentationProperties;
  v2 = -[LPCaptionRowPresentationProperties init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (LPCaptionPresentationProperties)leading
{
  LPCaptionPresentationProperties *leading;
  LPCaptionPresentationProperties *v4;
  LPCaptionPresentationProperties *v5;

  leading = self->_leading;
  if (!leading)
  {
    v4 = objc_alloc_init(LPCaptionPresentationProperties);
    v5 = self->_leading;
    self->_leading = v4;

    leading = self->_leading;
  }
  return leading;
}

- (LPCaptionPresentationProperties)trailing
{
  LPCaptionPresentationProperties *trailing;
  LPCaptionPresentationProperties *v4;
  LPCaptionPresentationProperties *v5;

  trailing = self->_trailing;
  if (!trailing)
  {
    v4 = objc_alloc_init(LPCaptionPresentationProperties);
    v5 = self->_trailing;
    self->_trailing = v4;

    trailing = self->_trailing;
  }
  return trailing;
}

- (id)left
{
  if (appIsLTR())
    -[LPCaptionRowPresentationProperties leading](self, "leading");
  else
    -[LPCaptionRowPresentationProperties trailing](self, "trailing");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)right
{
  if (appIsLTR())
    -[LPCaptionRowPresentationProperties trailing](self, "trailing");
  else
    -[LPCaptionRowPresentationProperties leading](self, "leading");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasAnyContent
{
  void *v3;
  BOOL v4;
  void *v5;

  -[LPCaptionPresentationProperties text](self->_leading, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[LPCaptionPresentationProperties text](self->_trailing, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

- (void)applyToAllCaptions:(id)a3
{
  void (**v4)(id, LPCaptionPresentationProperties *);

  v4 = (void (**)(id, LPCaptionPresentationProperties *))a3;
  v4[2](v4, self->_leading);
  v4[2](v4, self->_trailing);

}

- (void)setLeading:(id)a3
{
  objc_storeStrong((id *)&self->_leading, a3);
}

- (void)setTrailing:(id)a3
{
  objc_storeStrong((id *)&self->_trailing, a3);
}

- (LPCaptionButtonPresentationProperties)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_trailing, 0);
  objc_storeStrong((id *)&self->_leading, 0);
}

@end
