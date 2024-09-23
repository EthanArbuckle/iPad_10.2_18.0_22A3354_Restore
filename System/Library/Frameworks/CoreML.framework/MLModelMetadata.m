@implementation MLModelMetadata

- (MLModelMetadata)initWithName:(id)a3
{
  return -[MLModelMetadata initWithName:shortDescription:versionString:author:license:creatorDefined:](self, "initWithName:shortDescription:versionString:author:license:creatorDefined:", a3, 0, 0, 0, 0, 0);
}

- (MLModelMetadata)initWithName:(id)a3 shortDescription:(id)a4 versionString:(id)a5 author:(id)a6 license:(id)a7 creatorDefined:(id)a8
{
  id v15;
  id v16;
  MLModelMetadata *v17;
  MLModelMetadata *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v20 = a6;
  v15 = a7;
  v16 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MLModelMetadata;
  v17 = -[MLModelMetadata init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_shortDescription, a4);
    objc_storeStrong((id *)&v18->_versionString, a5);
    objc_storeStrong((id *)&v18->_author, a6);
    objc_storeStrong((id *)&v18->_license, a7);
    objc_storeStrong((id *)&v18->_creatorDefined, a8);
    if (!v18->_name)
      v18->_name = (NSString *)CFSTR("model");
  }

  return v18;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("name: %@, version: %@ author: %@ description: %@ creatorDefined: %@"), self->_name, self->_versionString, self->_author, self->_shortDescription, self->_creatorDefined);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)shortDescription
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)versionString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)license
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)creatorDefined
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creatorDefined, 0);
  objc_storeStrong((id *)&self->_license, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
