@implementation IRTTRPrompt

- (NSArray)popups
{
  return self->_popups;
}

- (void)setPopups:(id)a3
{
  objc_storeStrong((id *)&self->_popups, a3);
}

- (IRTTRURLQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_popups, 0);
}

@end
