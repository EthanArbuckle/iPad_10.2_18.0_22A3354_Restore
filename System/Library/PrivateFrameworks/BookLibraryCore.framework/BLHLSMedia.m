@implementation BLHLSMedia

- (void)setPropertiesFromAttributeList:(id)a3
{
  id v4;
  NSString *v5;
  NSString *type;
  NSURL *v7;
  NSURL *url;
  NSString *v9;
  NSString *name;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TYPE"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  self->_type = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URI"));
  v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  self->_url = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NAME"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  name = self->_name;
  self->_name = v9;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[BLHLSMedia name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLHLSMedia type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLHLSMedia url](self, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@): %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)type
{
  return self->_type;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
