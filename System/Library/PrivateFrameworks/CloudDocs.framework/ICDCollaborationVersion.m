@implementation ICDCollaborationVersion

- (ICDCollaborationVersion)initWithCollaborationSignature:(id)a3
{
  id v4;
  ICDCollaborationVersion *v5;
  uint64_t v6;
  NSData *collaborationSignature;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDCollaborationVersion;
  v5 = -[ICDCollaborationVersion init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "br_md5");
    v6 = objc_claimAutoreleasedReturnValue();
    collaborationSignature = v5->_collaborationSignature;
    v5->_collaborationSignature = (NSData *)v6;

  }
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ sig:%@>"), objc_opt_class(), self->_collaborationSignature);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_collaborationSignature, CFSTR("signature"));
}

- (ICDCollaborationVersion)initWithCoder:(id)a3
{
  id v4;
  ICDCollaborationVersion *v5;
  uint64_t v6;
  NSData *collaborationSignature;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICDCollaborationVersion;
  v5 = -[ICDCollaborationVersion init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v6 = objc_claimAutoreleasedReturnValue();
    collaborationSignature = v5->_collaborationSignature;
    v5->_collaborationSignature = (NSData *)v6;

  }
  return v5;
}

- (NSData)collaborationSignature
{
  return self->_collaborationSignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationSignature, 0);
}

@end
