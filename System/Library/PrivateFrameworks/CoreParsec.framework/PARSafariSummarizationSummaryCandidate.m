@implementation PARSafariSummarizationSummaryCandidate

- (NSString)hashIdentifier
{
  return self->_hashIdentifier;
}

- (void)setHashIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hashIdentifier, a3);
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_hashIdentifier, 0);
}

@end
