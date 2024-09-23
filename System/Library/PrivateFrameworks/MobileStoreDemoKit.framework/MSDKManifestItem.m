@implementation MSDKManifestItem

- (MSDKManifestItem)initWithIdentifier:(id)a3 andDictionary:(id)a4 forComponent:(id)a5
{
  id v6;
  MSDKManifestItem *v7;
  MSDKManifestItem *v8;
  objc_super v10;

  v6 = a5;
  v10.receiver = self;
  v10.super_class = (Class)MSDKManifestItem;
  v7 = -[MSDKManifestItem init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_component, v6);

  return v8;
}

- (MSDKManifestComponent)component
{
  return (MSDKManifestComponent *)objc_loadWeakRetained((id *)&self->_component);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_component);
}

@end
