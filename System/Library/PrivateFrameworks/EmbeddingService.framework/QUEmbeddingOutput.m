@implementation QUEmbeddingOutput

- (MLMultiArray)embedding
{
  return self->_embedding;
}

- (void)setEmbedding:(id)a3
{
  objc_storeStrong((id *)&self->_embedding, a3);
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
  objc_storeStrong((id *)&self->_tokens, a3);
}

- (NSArray)tokenRanges
{
  return self->_tokenRanges;
}

- (void)setTokenRanges:(id)a3
{
  objc_storeStrong((id *)&self->_tokenRanges, a3);
}

- (NSArray)subtokens
{
  return self->_subtokens;
}

- (void)setSubtokens:(id)a3
{
  objc_storeStrong((id *)&self->_subtokens, a3);
}

- (NSArray)subtokenLenForTokens
{
  return self->_subtokenLenForTokens;
}

- (void)setSubtokenLenForTokens:(id)a3
{
  objc_storeStrong((id *)&self->_subtokenLenForTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtokenLenForTokens, 0);
  objc_storeStrong((id *)&self->_subtokens, 0);
  objc_storeStrong((id *)&self->_tokenRanges, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
}

@end
