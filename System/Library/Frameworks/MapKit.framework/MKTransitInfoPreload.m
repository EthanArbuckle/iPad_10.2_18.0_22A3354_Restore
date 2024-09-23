@implementation MKTransitInfoPreload

- (MKTransitInfoPreload)initWithAttributedString:(id)a3
{
  id v4;
  MKTransitInfoPreload *v5;
  uint64_t v6;
  NSAttributedString *attributedString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKTransitInfoPreload;
  v5 = -[MKTransitInfoPreload init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSAttributedString *)v6;

  }
  return v5;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
