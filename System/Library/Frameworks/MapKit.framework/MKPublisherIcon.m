@implementation MKPublisherIcon

- (id)initUsingName:(id)a3 andImage:(id)a4
{
  id v7;
  id v8;
  MKPublisherIcon *v9;
  id *p_isa;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MKPublisherIcon;
  v9 = -[MKPublisherIcon init](&v12, sel_init);
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publisherName, a3);
    objc_storeStrong(p_isa + 1, a4);
  }

  return p_isa;
}

- (UIImage)publisherImage
{
  return self->_publisherImage;
}

- (NSString)publisherName
{
  return self->_publisherName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherName, 0);
  objc_storeStrong((id *)&self->_publisherImage, 0);
}

@end
