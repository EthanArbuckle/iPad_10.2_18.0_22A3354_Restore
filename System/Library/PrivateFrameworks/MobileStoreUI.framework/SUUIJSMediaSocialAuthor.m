@implementation SUUIJSMediaSocialAuthor

- (SUUIJSMediaSocialAuthor)initWithSUUIMediaSocialAuthor:(id)a3
{
  id v5;
  SUUIJSMediaSocialAuthor *v6;
  SUUIJSMediaSocialAuthor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIJSMediaSocialAuthor;
  v6 = -[SUUIJSMediaSocialAuthor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mediaSocialAuthor, a3);

  return v7;
}

- (NSString)dsId
{
  return -[SUUIMediaSocialAuthor dsid](self->_mediaSocialAuthor, "dsid");
}

- (NSString)entityIdentifier
{
  return -[SUUIMediaSocialAuthor identifier](self->_mediaSocialAuthor, "identifier");
}

- (NSString)entityType
{
  return -[SUUIMediaSocialAuthor authorType](self->_mediaSocialAuthor, "authorType");
}

- (NSString)name
{
  return -[SUUIMediaSocialAuthor name](self->_mediaSocialAuthor, "name");
}

- (NSArray)permissions
{
  return -[SUUIMediaSocialAuthor permissions](self->_mediaSocialAuthor, "permissions");
}

- (NSDictionary)storePlatformData
{
  return -[SUUIMediaSocialAuthor storePlatformData](self->_mediaSocialAuthor, "storePlatformData");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSocialAuthor, 0);
}

@end
