@implementation FBKAttachmentDescriptor

- (FBKAttachmentDescriptor)initWithDescription:(id)a3 diagnosticExtensionIdentifier:(id)a4
{
  id v6;
  id v7;
  FBKAttachmentDescriptor *v8;
  FBKAttachmentDescriptor *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FBKAttachmentDescriptor;
  v8 = -[FBKAttachmentDescriptor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[FBKAttachmentDescriptor setLocalizedDescription:](v8, "setLocalizedDescription:", v6);
    -[FBKAttachmentDescriptor setDiagnosticExtensionIdentifier:](v9, "setDiagnosticExtensionIdentifier:", v7);
  }

  return v9;
}

- (FBKAttachmentDescriptor)initWithDescription:(id)a3 URL:(id)a4
{
  id v6;
  id v7;
  FBKAttachmentDescriptor *v8;
  FBKAttachmentDescriptor *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FBKAttachmentDescriptor;
  v8 = -[FBKAttachmentDescriptor init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[FBKAttachmentDescriptor setLocalizedDescription:](v8, "setLocalizedDescription:", v6);
    -[FBKAttachmentDescriptor setUrl:](v9, "setUrl:", v7);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_diagnosticExtensionIdentifier, CFSTR("diagnosticExtensionIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDescription, CFSTR("localizedDescription"));

}

- (FBKAttachmentDescriptor)initWithCoder:(id)a3
{
  id v4;
  FBKAttachmentDescriptor *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *diagnosticExtensionIdentifier;
  uint64_t v10;
  NSString *localizedDescription;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FBKAttachmentDescriptor;
  v5 = -[FBKAttachmentDescriptor init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("diagnosticExtensionIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    diagnosticExtensionIdentifier = v5->_diagnosticExtensionIdentifier;
    v5->_diagnosticExtensionIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDescription"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v10;

  }
  return v5;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)diagnosticExtensionIdentifier
{
  return self->_diagnosticExtensionIdentifier;
}

- (void)setDiagnosticExtensionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
}

@end
