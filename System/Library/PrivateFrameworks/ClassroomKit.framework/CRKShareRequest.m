@implementation CRKShareRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKShareRequest)initWithCoder:(id)a3
{
  id v4;
  CRKShareRequest *v5;
  void *v6;
  uint64_t v7;
  DMFControlGroupIdentifier *courseIdentifier;
  void *v9;
  uint64_t v10;
  NSString *targetType;
  void *v12;
  uint64_t v13;
  NSString *targetIdentifier;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *urls;
  void *v20;
  uint64_t v21;
  NSString *shareDescription;
  void *v23;
  uint64_t v24;
  NSData *previewImageData;
  uint64_t v26;
  NSDictionary *sandboxExtensions;
  void *v28;
  uint64_t v29;
  NSString *sourceBundleIdentifier;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CRKShareRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v32, sel_initWithCoder_, v4);
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("targetType"));
    v10 = objc_claimAutoreleasedReturnValue();
    targetType = v5->_targetType;
    v5->_targetType = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("targetIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    targetIdentifier = v5->_targetIdentifier;
    v5->_targetIdentifier = (NSString *)v13;

    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("urls"));
    v18 = objc_claimAutoreleasedReturnValue();
    urls = v5->_urls;
    v5->_urls = (NSArray *)v18;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("shareDescription"));
    v21 = objc_claimAutoreleasedReturnValue();
    shareDescription = v5->_shareDescription;
    v5->_shareDescription = (NSString *)v21;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("previewImageData"));
    v24 = objc_claimAutoreleasedReturnValue();
    previewImageData = v5->_previewImageData;
    v5->_previewImageData = (NSData *)v24;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("sandboxExtensions"));
    v26 = objc_claimAutoreleasedReturnValue();
    sandboxExtensions = v5->_sandboxExtensions;
    v5->_sandboxExtensions = (NSDictionary *)v26;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("sourceBundleIdentifier"));
    v29 = objc_claimAutoreleasedReturnValue();
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v29;

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
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRKShareRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v13, sel_encodeWithCoder_, v4);
  -[CRKShareRequest courseIdentifier](self, "courseIdentifier", v13.receiver, v13.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("courseIdentifier"));

  -[CRKShareRequest targetType](self, "targetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("targetType"));

  -[CRKShareRequest targetIdentifier](self, "targetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("targetIdentifier"));

  -[CRKShareRequest urls](self, "urls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("urls"));

  -[CRKShareRequest shareDescription](self, "shareDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("shareDescription"));

  -[CRKShareRequest previewImageData](self, "previewImageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("previewImageData"));

  -[CRKShareRequest sandboxExtensions](self, "sandboxExtensions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("sandboxExtensions"));

  -[CRKShareRequest sourceBundleIdentifier](self, "sourceBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("sourceBundleIdentifier"));

}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)targetType
{
  return self->_targetType;
}

- (void)setTargetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)targetIdentifier
{
  return self->_targetIdentifier;
}

- (void)setTargetIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)shareDescription
{
  return self->_shareDescription;
}

- (void)setShareDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (void)setPreviewImageData:(id)a3
{
  objc_storeStrong((id *)&self->_previewImageData, a3);
}

- (NSDictionary)sandboxExtensions
{
  return self->_sandboxExtensions;
}

- (void)setSandboxExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_sandboxExtensions, a3);
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sandboxExtensions, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_shareDescription, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_targetIdentifier, 0);
  objc_storeStrong((id *)&self->_targetType, 0);
  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end
