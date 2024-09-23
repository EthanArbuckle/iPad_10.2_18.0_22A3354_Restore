@implementation NPKTestAddPaymentPassRequestContext

- (NSString)cardPNO
{
  return self->_cardPNO;
}

- (void)setCardPNO:(id)a3
{
  objc_storeStrong((id *)&self->_cardPNO, a3);
}

- (NSString)cardFlow
{
  return self->_cardFlow;
}

- (void)setCardFlow:(id)a3
{
  objc_storeStrong((id *)&self->_cardFlow, a3);
}

- (NSString)cardID
{
  return self->_cardID;
}

- (void)setCardID:(id)a3
{
  objc_storeStrong((id *)&self->_cardID, a3);
}

- (NSString)cardType
{
  return self->_cardType;
}

- (void)setCardType:(id)a3
{
  objc_storeStrong((id *)&self->_cardType, a3);
}

- (NSString)cardIssuer
{
  return self->_cardIssuer;
}

- (void)setCardIssuer:(id)a3
{
  objc_storeStrong((id *)&self->_cardIssuer, a3);
}

- (NSString)cardProduct
{
  return self->_cardProduct;
}

- (void)setCardProduct:(id)a3
{
  objc_storeStrong((id *)&self->_cardProduct, a3);
}

- (NSString)cardEncryptionScheme
{
  return self->_cardEncryptionScheme;
}

- (void)setCardEncryptionScheme:(id)a3
{
  objc_storeStrong((id *)&self->_cardEncryptionScheme, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardEncryptionScheme, 0);
  objc_storeStrong((id *)&self->_cardProduct, 0);
  objc_storeStrong((id *)&self->_cardIssuer, 0);
  objc_storeStrong((id *)&self->_cardType, 0);
  objc_storeStrong((id *)&self->_cardID, 0);
  objc_storeStrong((id *)&self->_cardFlow, 0);
  objc_storeStrong((id *)&self->_cardPNO, 0);
}

@end
