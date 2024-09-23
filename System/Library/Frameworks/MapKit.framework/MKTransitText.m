@implementation MKTransitText

- (MKTransitText)initWithFormattedString:(id)a3
{
  id v5;
  MKTransitText *v6;
  MKTransitText *v7;
  MKTransitText *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKTransitText;
  v6 = -[MKTransitText init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_text, a3);
    v8 = v7;
  }

  return v7;
}

- (GEOServerFormattedString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
