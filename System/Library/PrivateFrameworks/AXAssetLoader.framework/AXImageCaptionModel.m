@implementation AXImageCaptionModel

- (AXImageCaptionModel)initWithModelProperties:(id)a3
{
  id v5;
  AXImageCaptionModel *v6;
  AXImageCaptionModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXImageCaptionModel;
  v6 = -[AXImageCaptionModel init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_modelProperties, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)AXImageCaptionModel;
  -[AXImageCaptionModel description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModel version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXImageCaptionModel stage](self, "stage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [v%@ - %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)version
{
  return (NSString *)-[NSDictionary objectForKey:](self->_modelProperties, "objectForKey:", CFSTR("Version"));
}

- (NSString)language
{
  return (NSString *)-[NSDictionary objectForKey:](self->_modelProperties, "objectForKey:", CFSTR("Language"));
}

- (NSString)stage
{
  return (NSString *)-[NSDictionary objectForKey:](self->_modelProperties, "objectForKey:", CFSTR("Stage"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelProperties, 0);
}

@end
