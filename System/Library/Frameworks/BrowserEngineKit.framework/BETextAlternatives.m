@implementation BETextAlternatives

- (id)_initWithNSTextAlternatives:(id)a3
{
  id v5;
  BETextAlternatives *v6;
  BETextAlternatives *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BETextAlternatives;
  v6 = -[BETextAlternatives init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backingTextAlternatives, a3);

  return v7;
}

- (void)noteSelectedAlternativeString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BETextAlternatives backingTextAlternatives](self, "backingTextAlternatives");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteSelectedAlternativeString:", v4);

}

- (NSString)primaryString
{
  return -[NSTextAlternatives primaryString](self->_backingTextAlternatives, "primaryString");
}

- (NSArray)alternativeStrings
{
  return -[NSTextAlternatives alternativeStrings](self->_backingTextAlternatives, "alternativeStrings");
}

- (BOOL)isLowConfidence
{
  return -[NSTextAlternatives isLowConfidence](self->_backingTextAlternatives, "isLowConfidence");
}

- (NSTextAlternatives)backingTextAlternatives
{
  return self->_backingTextAlternatives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingTextAlternatives, 0);
}

@end
