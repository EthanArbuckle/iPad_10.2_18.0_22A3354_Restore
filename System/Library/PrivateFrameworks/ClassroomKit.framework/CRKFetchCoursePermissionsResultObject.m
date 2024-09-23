@implementation CRKFetchCoursePermissionsResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchCoursePermissionsResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchCoursePermissionsResultObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *permissionsByFeature;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKFetchCoursePermissionsResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("permissionsByFeature"));
    v10 = objc_claimAutoreleasedReturnValue();
    permissionsByFeature = v5->_permissionsByFeature;
    v5->_permissionsByFeature = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKFetchCoursePermissionsResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKFetchCoursePermissionsResultObject permissionsByFeature](self, "permissionsByFeature", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("permissionsByFeature"));

}

- (NSDictionary)permissionsByFeature
{
  return self->_permissionsByFeature;
}

- (void)setPermissionsByFeature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permissionsByFeature, 0);
}

@end
