@implementation BCSFilterMatchResult

- (BCSFilterMatchResult)initWithMatch:(BOOL)a3 itemIdentifier:(id)a4 matchingTruncatedHash:(int64_t)a5
{
  id v9;
  BCSFilterMatchResult *v10;
  BCSFilterMatchResult *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BCSFilterMatchResult;
  v10 = -[BCSFilterMatchResult init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_hasMatch = a3;
    objc_storeStrong((id *)&v10->_itemIdentifier, a4);
    v11->_matchingTruncatedHash = a5;
  }

  return v11;
}

- (BOOL)hasMatch
{
  return self->_hasMatch;
}

- (void)setHasMatch:(BOOL)a3
{
  self->_hasMatch = a3;
}

- (BCSItemIdentifying)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemIdentifier, a3);
}

- (int64_t)matchingTruncatedHash
{
  return self->_matchingTruncatedHash;
}

- (void)setMatchingTruncatedHash:(int64_t)a3
{
  self->_matchingTruncatedHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
