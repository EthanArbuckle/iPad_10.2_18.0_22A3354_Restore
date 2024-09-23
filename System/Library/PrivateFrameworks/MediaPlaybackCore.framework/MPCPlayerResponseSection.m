@implementation MPCPlayerResponseSection

- (MPModelGenericObject)metadataObject
{
  return self->_metadataObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataObject, 0);
  objc_destroyWeak((id *)&self->_response);
}

- (MPCPlayerResponseSection)initWithModelGenericObject:(id)a3 sectionIndex:(int64_t)a4 response:(id)a5
{
  id v8;
  id v9;
  MPCPlayerResponseSection *v10;
  MPCPlayerResponseSection *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MPCPlayerResponseSection;
  v10 = -[MPCPlayerResponseSection init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_response, v9);
    objc_storeStrong((id *)&v11->_metadataObject, a3);
  }

  return v11;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPCPlayerResponseSection;
  return -[MPCPlayerResponseSection init](&v3, sel_init);
}

- (id)remove
{
  return 0;
}

- (MPCPlayerResponse)response
{
  return (MPCPlayerResponse *)objc_loadWeakRetained((id *)&self->_response);
}

@end
