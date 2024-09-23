@implementation ASDGatherLogsRequestOptions

- (id)copyWithZone:(_NSZone *)a3
{
  ASDGatherLogsRequestOptions *v4;
  uint64_t v5;
  NSString *fileName;
  uint64_t v7;
  NSArray *urlFilters;

  v4 = -[ASDGatherLogsRequestOptions init](+[ASDGatherLogsRequestOptions allocWithZone:](ASDGatherLogsRequestOptions, "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_fileName, "copy");
  fileName = v4->_fileName;
  v4->_fileName = (NSString *)v5;

  v4->_verbose = self->_verbose;
  v7 = -[NSArray copy](self->_urlFilters, "copy");
  urlFilters = v4->_urlFilters;
  v4->_urlFilters = (NSArray *)v7;

  return v4;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (NSArray)urlFilters
{
  return self->_urlFilters;
}

- (void)setUrlFilters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlFilters, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end
