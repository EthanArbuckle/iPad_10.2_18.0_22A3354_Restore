@implementation CRKFetchInstructorEndpointRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchInstructorEndpointRequest)initWithCoder:(id)a3
{
  id v4;
  CRKFetchInstructorEndpointRequest *v5;
  void *v6;
  uint64_t v7;
  NSURL *classroomAppBundleURL;
  void *v9;
  uint64_t v10;
  NSString *instructordBundleIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKFetchInstructorEndpointRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("classroomAppBundleURL"));
    v7 = objc_claimAutoreleasedReturnValue();
    classroomAppBundleURL = v5->_classroomAppBundleURL;
    v5->_classroomAppBundleURL = (NSURL *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("instructordBundleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    instructordBundleIdentifier = v5->_instructordBundleIdentifier;
    v5->_instructordBundleIdentifier = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKFetchInstructorEndpointRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CRKFetchInstructorEndpointRequest classroomAppBundleURL](self, "classroomAppBundleURL", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("classroomAppBundleURL"));

  -[CRKFetchInstructorEndpointRequest instructordBundleIdentifier](self, "instructordBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("instructordBundleIdentifier"));

}

- (NSURL)classroomAppBundleURL
{
  return self->_classroomAppBundleURL;
}

- (void)setClassroomAppBundleURL:(id)a3
{
  objc_storeStrong((id *)&self->_classroomAppBundleURL, a3);
}

- (NSString)instructordBundleIdentifier
{
  return self->_instructordBundleIdentifier;
}

- (void)setInstructordBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructordBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_classroomAppBundleURL, 0);
}

@end
