@implementation AXAppRepresentation

+ (id)appWithPID:(int)a3 bundleID:(id)a4
{
  uint64_t v4;
  id v5;
  AXAppRepresentation *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = objc_alloc_init(AXAppRepresentation);
  -[AXAppRepresentation setPid:](v6, "setPid:", v4);
  -[AXAppRepresentation setBundleIdentifier:](v6, "setBundleIdentifier:", v5);

  return v6;
}

- (AXAppRepresentation)init
{
  AXAppRepresentation *v2;
  AXAppRepresentation *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXAppRepresentation;
  v2 = -[AXAppRepresentation init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AXAppRepresentation _commonInit](v2, "_commonInit");
  return v3;
}

- (void)_commonInit
{
  -[AXAppRepresentation setLayoutRole:](self, "setLayoutRole:", 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[AXAppRepresentation pid](self, "pid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXAppRepresentation bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXAppRepresentation isLayoutPrimary](self, "isLayoutPrimary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXAppRepresentation isLayoutFullscreenModal](self, "isLayoutFullscreenModal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXApp<%p>: PID:%@ BundleID:%@ Primary:%@ FullScrModal:%@"), self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInt:", -[AXAppRepresentation pid](self, "pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("pid"));

  -[AXAppRepresentation bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("bundleID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXAppRepresentation layoutRole](self, "layoutRole"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("layoutRole"));

}

- (AXAppRepresentation)initWithCoder:(id)a3
{
  id v4;
  AXAppRepresentation *v5;
  AXAppRepresentation *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXAppRepresentation;
  v5 = -[AXAppRepresentation init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AXAppRepresentation _commonInit](v5, "_commonInit");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAppRepresentation setPid:](v6, "setPid:", objc_msgSend(v7, "intValue"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAppRepresentation setBundleIdentifier:](v6, "setBundleIdentifier:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutRole"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXAppRepresentation setLayoutRole:](v6, "setLayoutRole:", objc_msgSend(v9, "unsignedIntegerValue"));

  }
  return v6;
}

- (BOOL)isLayoutPrimary
{
  return -[AXAppRepresentation layoutRole](self, "layoutRole") == 1;
}

- (BOOL)isLayoutFullscreenModal
{
  return -[AXAppRepresentation layoutRole](self, "layoutRole") == 3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (void)setLayoutRole:(int64_t)a3
{
  self->_layoutRole = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
