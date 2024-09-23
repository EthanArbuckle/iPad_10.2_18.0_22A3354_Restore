@implementation CRKDownloadResourcesRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKDownloadResourcesRequest)initWithCoder:(id)a3
{
  id v4;
  CRKDownloadResourcesRequest *v5;
  void *v6;
  uint64_t v7;
  DMFControlGroupIdentifier *courseIdentifier;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *resources;
  void *v14;
  uint64_t v15;
  NSString *resourcesDescription;
  void *v17;
  uint64_t v18;
  NSData *previewImageData;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *sourceBundleIdentifier;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CRKDownloadResourcesRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("courseIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    courseIdentifier = v5->_courseIdentifier;
    v5->_courseIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("resources"));
    v12 = objc_claimAutoreleasedReturnValue();
    resources = v5->_resources;
    v5->_resources = (NSArray *)v12;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("resourcesDescription"));
    v15 = objc_claimAutoreleasedReturnValue();
    resourcesDescription = v5->_resourcesDescription;
    v5->_resourcesDescription = (NSString *)v15;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("previewImageData"));
    v18 = objc_claimAutoreleasedReturnValue();
    previewImageData = v5->_previewImageData;
    v5->_previewImageData = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openAfterDownloadCompletes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_openAfterDownloadCompletes = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("sourceBundleIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRKDownloadResourcesRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  -[CRKDownloadResourcesRequest courseIdentifier](self, "courseIdentifier", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("courseIdentifier"));

  -[CRKDownloadResourcesRequest resources](self, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("resources"));

  -[CRKDownloadResourcesRequest resourcesDescription](self, "resourcesDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("resourcesDescription"));

  -[CRKDownloadResourcesRequest previewImageData](self, "previewImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("previewImageData"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKDownloadResourcesRequest openAfterDownloadCompletes](self, "openAfterDownloadCompletes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("openAfterDownloadCompletes"));

  -[CRKDownloadResourcesRequest sourceBundleIdentifier](self, "sourceBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("sourceBundleIdentifier"));

}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)resourcesDescription
{
  return self->_resourcesDescription;
}

- (void)setResourcesDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (void)setPreviewImageData:(id)a3
{
  objc_storeStrong((id *)&self->_previewImageData, a3);
}

- (BOOL)openAfterDownloadCompletes
{
  return self->_openAfterDownloadCompletes;
}

- (void)setOpenAfterDownloadCompletes:(BOOL)a3
{
  self->_openAfterDownloadCompletes = a3;
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_resourcesDescription, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end
