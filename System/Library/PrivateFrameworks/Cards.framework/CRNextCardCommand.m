@implementation CRNextCardCommand

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRNextCardCommand;
  v5 = -[CRBasicPayloadCommand copyWithZone:](&v9, sel_copyWithZone_);
  -[CRNextCardCommand nextCard](self, "nextCard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setNextCard:", v7);

  return v5;
}

- (CRCard)nextCard
{
  return self->_nextCard;
}

- (void)setNextCard:(id)a3
{
  objc_storeStrong((id *)&self->_nextCard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextCard, 0);
}

@end
