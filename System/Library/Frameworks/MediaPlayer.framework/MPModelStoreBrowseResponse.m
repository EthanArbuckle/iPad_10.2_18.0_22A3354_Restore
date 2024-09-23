@implementation MPModelStoreBrowseResponse

- (BOOL)hasAdditionalContentItems
{
  void *v2;
  BOOL v3;

  -[MPModelStoreBrowseResponseParser allAdditionalContentIdentifiersNeedingLookup](self->_parser, "allAdditionalContentIdentifiersNeedingLookup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (MPChangeDetails)changeDetails
{
  return self->_changeDetails;
}

- (void)setChangeDetails:(id)a3
{
  objc_storeStrong((id *)&self->_changeDetails, a3);
}

- (MPModelStoreBrowseResponseParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_changeDetails, 0);
}

@end
