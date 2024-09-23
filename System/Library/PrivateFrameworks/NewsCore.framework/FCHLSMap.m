@implementation FCHLSMap

- (id)description
{
  void *url;

  url = self;
  if (self)
    url = self->_url;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), url);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
