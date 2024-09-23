@implementation MKMapItemMetadataRequest

- (NSURL)url
{
  return 0;
}

- (NSURLRequest)urlRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MKMapItemMetadataRequest url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39E0];
    -[MKMapItemMetadataRequest url](self, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestWithURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSURLRequest *)v6;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
