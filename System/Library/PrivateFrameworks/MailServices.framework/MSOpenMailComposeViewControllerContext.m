@implementation MSOpenMailComposeViewControllerContext

- (MSOpenMailComposeViewControllerContext)initWithAutosaveIdentifier:(id)a3 compositionValues:(id)a4 attachments:(id)a5
{
  id v9;
  id v10;
  id v11;
  MSOpenMailComposeViewControllerContext *v12;
  MSOpenMailComposeViewControllerContext *v13;
  uint64_t v14;
  NSDictionary *compositionValues;
  uint64_t v16;
  NSArray *attachments;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MSOpenMailComposeViewControllerContext;
  v12 = -[MSOpenMailComposeViewControllerContext init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_autosaveIdentifier, a3);
    v14 = objc_msgSend(v10, "copy");
    compositionValues = v13->_compositionValues;
    v13->_compositionValues = (NSDictionary *)v14;

    v16 = objc_msgSend(v11, "copy");
    attachments = v13->_attachments;
    v13->_attachments = (NSArray *)v16;

  }
  return v13;
}

+ (id)unarchiveFromData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x24BDBCF20]);
  v11[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v8, v5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[MSOpenMailComposeViewControllerContext autosaveIdentifier](self, "autosaveIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_autosaveIdentifier"));

  -[MSOpenMailComposeViewControllerContext compositionValues](self, "compositionValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_compositionValues"));

  -[MSOpenMailComposeViewControllerContext attachments](self, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_attachments"));

  -[MSOpenMailComposeViewControllerContext hostApplicationBundleIdentifier](self, "hostApplicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("EFPropertyKey_hostApplicationBundleIdentifier"));

}

- (MSOpenMailComposeViewControllerContext)initWithCoder:(id)a3
{
  id v4;
  MSOpenMailComposeViewControllerContext *v5;
  uint64_t v6;
  NSString *autosaveIdentifier;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *compositionValues;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *attachments;
  uint64_t v23;
  NSString *hostApplicationBundleIdentifier;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MSOpenMailComposeViewControllerContext;
  v5 = -[MSOpenMailComposeViewControllerContext init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_autosaveIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    autosaveIdentifier = v5->_autosaveIdentifier;
    v5->_autosaveIdentifier = (NSString *)v6;

    v28 = (void *)MEMORY[0x24BDBCF20];
    v27 = objc_opt_class();
    v26 = objc_opt_class();
    NSClassFromString(CFSTR("_MFMailComposeContentVariation"));
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v27, v26, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("EFPropertyKey_compositionValues"));
    v16 = objc_claimAutoreleasedReturnValue();
    compositionValues = v5->_compositionValues;
    v5->_compositionValues = (NSDictionary *)v16;

    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    NSClassFromString(CFSTR("MFMailComposeAttachmentWrapper"));
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("EFPropertyKey_attachments"));
    v21 = objc_claimAutoreleasedReturnValue();
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_hostApplicationBundleIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue();
    hostApplicationBundleIdentifier = v5->_hostApplicationBundleIdentifier;
    v5->_hostApplicationBundleIdentifier = (NSString *)v23;

  }
  return v5;
}

- (NSString)autosaveIdentifier
{
  return self->_autosaveIdentifier;
}

- (NSDictionary)compositionValues
{
  return self->_compositionValues;
}

- (void)setCompositionValues:(id)a3
{
  objc_storeStrong((id *)&self->_compositionValues, a3);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (NSString)hostApplicationBundleIdentifier
{
  return self->_hostApplicationBundleIdentifier;
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_compositionValues, 0);
  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
}

@end
