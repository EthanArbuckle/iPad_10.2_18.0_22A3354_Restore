@implementation CoreDAVItemWithHrefChildItemTolerateBarePayload

- (id)href
{
  CoreDAVHrefItem *href;

  href = self->super._href;
  if (!href)
    href = self->_virtualHref;
  return href;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CoreDAVItemWithHrefChildItemTolerateBarePayload;
  -[CoreDAVItemWithHrefChildItem description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->super._href)
  {
    v5 = v3;
  }
  else
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v3);
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  (virtual HREF, element had a bare payload)"));
  }

  return v5;
}

- (void)setPayload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CoreDAVHrefItem *v8;
  CoreDAVHrefItem *virtualHref;
  id v10;

  v10 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = objc_alloc_init(CoreDAVHrefItem);
    virtualHref = self->_virtualHref;
    self->_virtualHref = v8;

    -[CoreDAVItem setPayload:](self->_virtualHref, "setPayload:", v10);
    if (self->_baseURL)
      -[CoreDAVHrefItem parserSuggestsBaseURL:](self->_virtualHref, "parserSuggestsBaseURL:");
  }

}

- (void)parserSuggestsBaseURL:(id)a3
{
  CoreDAVHrefItem *virtualHref;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_baseURL, a3);
  virtualHref = self->_virtualHref;
  if (virtualHref)
    -[CoreDAVHrefItem parserSuggestsBaseURL:](virtualHref, "parserSuggestsBaseURL:", self->_baseURL);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_virtualHref, 0);
}

@end
