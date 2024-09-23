@implementation CRKSetCoursePermissionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetCoursePermissionRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSetCoursePermissionRequest *v5;
  void *v6;
  uint64_t v7;
  DMFControlGroupIdentifier *courseIdentifier;
  void *v9;
  uint64_t v10;
  NSString *feature;
  void *v12;
  uint64_t v13;
  NSNumber *permission;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRKSetCoursePermissionRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("courseIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("feature"));
    v10 = objc_claimAutoreleasedReturnValue();
    feature = v5->_feature;
    v5->_feature = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("permission"));
    v13 = objc_claimAutoreleasedReturnValue();
    permission = v5->_permission;
    v5->_permission = (NSNumber *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKSetCoursePermissionRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[CRKSetCoursePermissionRequest courseIdentifier](self, "courseIdentifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("courseIdentifier"));

  -[CRKSetCoursePermissionRequest feature](self, "feature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("feature"));

  -[CRKSetCoursePermissionRequest permission](self, "permission");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("permission"));

}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_courseIdentifier, a3);
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
  objc_storeStrong((id *)&self->_feature, a3);
}

- (NSNumber)permission
{
  return self->_permission;
}

- (void)setPermission:(id)a3
{
  objc_storeStrong((id *)&self->_permission, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_permission, 0);
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end
