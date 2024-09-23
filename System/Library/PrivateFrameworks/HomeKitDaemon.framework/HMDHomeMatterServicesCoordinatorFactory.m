@implementation HMDHomeMatterServicesCoordinatorFactory

- (id)createHomeMatterServicesCoordinatorWithHome:(id)a3
{
  id v5;
  id v6;
  HMDHomeMatterServicesCoordinatorFactory *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v5 = objc_allocWithZone((Class)HMDFeaturesDataSource);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_init);
  v9 = v6;
  v10 = sub_2219C5A34();

  type metadata accessor for DefaultHomeMatterServicesFactory();
  v11 = swift_allocObject();
  v12 = sub_2219C7810((uint64_t)v8, (uint64_t)v10, v11);

  return v12;
}

- (HMDHomeMatterServicesCoordinatorFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDHomeMatterServicesCoordinatorFactory;
  return -[HMDHomeMatterServicesCoordinatorFactory init](&v3, sel_init);
}

@end
