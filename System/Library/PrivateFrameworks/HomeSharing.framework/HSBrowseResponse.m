@implementation HSBrowseResponse

- (void)dealloc
{
  objc_super v3;

  -[HSBrowseResponse setCollections:](self, "setCollections:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HSBrowseResponse;
  -[HSBrowseResponse dealloc](&v3, sel_dealloc);
}

- (NSArray)collections
{
  return self->collections;
}

- (void)setCollections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->collections, 0);
}

@end
