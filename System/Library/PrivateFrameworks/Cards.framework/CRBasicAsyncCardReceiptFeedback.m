@implementation CRBasicAsyncCardReceiptFeedback

- (CRCard)baseCard
{
  return self->baseCard;
}

- (void)setBaseCard:(id)a3
{
  objc_storeStrong((id *)&self->baseCard, a3);
}

- (CRCard)requestedCard
{
  return self->requestedCard;
}

- (void)setRequestedCard:(id)a3
{
  objc_storeStrong((id *)&self->requestedCard, a3);
}

- (CRCard)receivedCard
{
  return self->receivedCard;
}

- (void)setReceivedCard:(id)a3
{
  objc_storeStrong((id *)&self->receivedCard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->receivedCard, 0);
  objc_storeStrong((id *)&self->requestedCard, 0);
  objc_storeStrong((id *)&self->baseCard, 0);
}

@end
