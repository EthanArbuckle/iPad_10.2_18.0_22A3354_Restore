@implementation PHImportAssetNameDescription

- (PHImportAssetNameDescription)initWithFileName:(id)a3 uuid:(id)a4
{
  id v7;
  id v8;
  PHImportAssetNameDescription *v9;
  PHImportAssetNameDescription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHImportAssetNameDescription;
  v9 = -[PHImportAssetNameDescription init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_filename, a3);
    objc_storeStrong((id *)&v10->_uuid, a4);
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), self->_filename, self->_uuid);
}

- (id)redactedDescription
{
  void *v2;
  NSString *uuid;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  uuid = self->_uuid;
  -[NSString pathExtension](self->_filename, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), uuid, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

@end
