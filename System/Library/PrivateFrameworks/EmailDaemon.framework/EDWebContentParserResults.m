@implementation EDWebContentParserResults

- (NSArray)remoteContentLinks
{
  return self->_remoteContentLinks;
}

- (void)setRemoteContentLinks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)dataDetectionResults
{
  return self->_dataDetectionResults;
}

- (void)setDataDetectionResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)richLinkResults
{
  return self->_richLinkResults;
}

- (void)setRichLinkResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)oneTimeCode
{
  return self->_oneTimeCode;
}

- (void)setOneTimeCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneTimeCode, 0);
  objc_storeStrong((id *)&self->_richLinkResults, 0);
  objc_storeStrong((id *)&self->_dataDetectionResults, 0);
  objc_storeStrong((id *)&self->_remoteContentLinks, 0);
}

@end
