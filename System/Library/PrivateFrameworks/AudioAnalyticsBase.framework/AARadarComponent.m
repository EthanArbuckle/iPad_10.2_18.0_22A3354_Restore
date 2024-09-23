@implementation AARadarComponent

- (AARadarComponent)initWithName:(id)a3 version:(id)a4 identifier:(int64_t)a5
{
  id v8;
  id v9;
  AARadarComponent *v10;
  AARadarComponent *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AARadarComponent;
  v10 = -[AARadarComponent init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[AARadarComponent setName:](v10, "setName:", v8);
    -[AARadarComponent setVersion:](v11, "setVersion:", v9);
    -[AARadarComponent setIdentifier:](v11, "setIdentifier:", a5);
  }

  return v11;
}

- (id)asRadarDraft
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc((Class)getRadarComponentClass());
  -[AARadarComponent name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AARadarComponent version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:version:identifier:", v4, v5, -[AARadarComponent identifier](self, "identifier"));

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
