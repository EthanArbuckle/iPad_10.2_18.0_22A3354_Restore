@implementation BLHLSMap

- (BLHLSMap)initWithURL:(id)a3
{
  id v5;
  BLHLSMap *v6;
  BLHLSMap *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLHLSMap;
  v6 = -[BLHLSMap init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_url, a3);

  return v7;
}

- (void)setPropertiesFromAttributeList:(id)a3
{
  NSURL *v4;
  NSURL *url;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("URI"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  self->_url = v4;

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[BLHLSMap url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
