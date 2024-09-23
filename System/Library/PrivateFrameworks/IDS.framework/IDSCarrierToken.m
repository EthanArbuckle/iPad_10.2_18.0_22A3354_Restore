@implementation IDSCarrierToken

- (IDSCarrierToken)initWithTokenString:(id)a3
{
  id v5;
  IDSCarrierToken *v6;
  IDSCarrierToken *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSCarrierToken;
  v6 = -[IDSCarrierToken init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tokenString, a3);

  return v7;
}

- (NSString)tokenString
{
  return self->_tokenString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenString, 0);
}

@end
