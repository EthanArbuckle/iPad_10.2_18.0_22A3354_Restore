@implementation CalDAVReportJunkAction

- (CalDAVReportJunkAction)initWithResourceURL:(id)a3
{
  id v5;
  CalDAVReportJunkAction *v6;
  CalDAVReportJunkAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalDAVReportJunkAction;
  v6 = -[CalDAVReportJunkAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resourceURL, a3);

  return v7;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (id)changeContext
{
  return self->_changeContext;
}

- (void)setChangeContext:(id)a3
{
  objc_storeStrong(&self->_changeContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeContext, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
}

@end
