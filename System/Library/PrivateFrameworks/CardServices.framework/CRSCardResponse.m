@implementation CRSCardResponse

- (CRSCardRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (CRCard)card
{
  return self->_card;
}

- (void)setCard:(id)a3
{
  objc_storeStrong((id *)&self->_card, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_card, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
