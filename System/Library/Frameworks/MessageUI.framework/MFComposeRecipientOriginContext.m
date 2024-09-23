@implementation MFComposeRecipientOriginContext

- (void)setSearchTerm:(id)a3
{
  objc_storeStrong((id *)&self->_searchTerm, a3);
}

- (void)setResultType:(unint64_t)a3
{
  self->_resultType = a3;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
}

@end
