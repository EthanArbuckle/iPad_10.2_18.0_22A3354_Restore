@implementation GEOAPUploadPolicy

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)sendImmediately
{
  return self->_sendImmediately;
}

- (void)setSendImmediately:(BOOL)a3
{
  self->_sendImmediately = a3;
}

- (double)ttl
{
  return self->_ttl;
}

- (void)setTtl:(double)a3
{
  self->_ttl = a3;
}

- (NSArray)uploadStages
{
  return self->_uploadStages;
}

- (void)setUploadStages:(id)a3
{
  objc_storeStrong((id *)&self->_uploadStages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadStages, 0);
}

@end
