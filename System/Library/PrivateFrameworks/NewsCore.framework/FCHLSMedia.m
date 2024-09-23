@implementation FCHLSMedia

- (id)description
{
  void *v2;
  NSString *v4;
  NSString *v5;
  NSURL *url;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  if (self)
  {
    v4 = self->_name;
    v5 = self->_type;
    url = self->_url;
  }
  else
  {
    v5 = 0;
    v4 = 0;
    url = 0;
  }
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@(%@): %@"), v4, v5, url);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
