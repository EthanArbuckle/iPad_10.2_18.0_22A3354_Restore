@implementation HMDFetchedAccessorySettingsControllerKeyPathMapItem

- (HMDFetchedAccessorySettingsControllerKeyPathMapItem)initWithDriver:(id)a3 keyPaths:(id)a4
{
  id v7;
  id v8;
  HMDFetchedAccessorySettingsControllerKeyPathMapItem *v9;
  HMDFetchedAccessorySettingsControllerKeyPathMapItem *v10;
  uint64_t v11;
  NSMutableArray *keyPathsInternal;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDFetchedAccessorySettingsControllerKeyPathMapItem;
  v9 = -[HMDFetchedAccessorySettingsControllerKeyPathMapItem init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_driver, a3);
    v11 = objc_msgSend(v8, "mutableCopy");
    keyPathsInternal = v10->_keyPathsInternal;
    v10->_keyPathsInternal = (NSMutableArray *)v11;

  }
  return v10;
}

- (NSArray)keyPaths
{
  if (self)
    self = (HMDFetchedAccessorySettingsControllerKeyPathMapItem *)objc_getProperty(self, a2, 16, 1);
  return (NSArray *)(id)-[HMDFetchedAccessorySettingsControllerKeyPathMapItem copy](self, "copy");
}

- (HMDFetchedSettingsDriver)driver
{
  return (HMDFetchedSettingsDriver *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPathsInternal, 0);
  objc_storeStrong((id *)&self->_driver, 0);
}

@end
