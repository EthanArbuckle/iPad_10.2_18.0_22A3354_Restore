@implementation MSDKManifestDataItem

- (MSDKManifestDataItem)initWithIdentifier:(id)a3 andDictionary:(id)a4 forComponent:(id)a5
{
  id v9;
  MSDKManifestDataItem *v10;
  MSDKManifestDataItem *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MSDKManifestDataItem;
  v10 = -[MSDKManifestItem initWithIdentifier:andDictionary:forComponent:](&v13, sel_initWithIdentifier_andDictionary_forComponent_, a3, v9, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_data, a4);

  return v11;
}

- (NSDictionary)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
