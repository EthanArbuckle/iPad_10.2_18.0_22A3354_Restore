@implementation HUSoftwareLibraryLookupRequest

- (HUSoftwareLibraryLookupRequest)initWithBundleID:(id)a3 storeID:(id)a4
{
  id v7;
  id v8;
  HUSoftwareLibraryLookupRequest *v9;
  HUSoftwareLibraryLookupRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUSoftwareLibraryLookupRequest;
  v9 = -[HUSoftwareLibraryLookupRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    objc_storeStrong((id *)&v10->_storeID, a4);
  }

  return v10;
}

- (HUSoftwareLibraryLookupRequest)initWithAccessory:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  HUSoftwareLibraryLookupRequest *v8;

  v5 = a3;
  objc_msgSend(v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HUSoftwareLibraryLookupRequest initWithBundleID:storeID:](self, "initWithBundleID:storeID:", v6, v7);

  if (v8)
    objc_storeStrong((id *)&v8->_accessory, a3);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HUSoftwareLibraryLookupRequest bundleID](self, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareLibraryLookupRequest storeID](self, "storeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (_QWORD *)objc_msgSend(v4, "initWithBundleID:storeID:", v5, v6);

  -[HUSoftwareLibraryLookupRequest accessory](self, "accessory");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v7[3];
  v7[3] = v8;

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
