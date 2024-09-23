@implementation FPTestingCollisionResolution

- (FPTestingCollisionResolution)initWithOperationIdentifier:(id)a3 renamedItem:(id)a4 snapshotVersion:(int64_t)a5
{
  id v9;
  FPTestingCollisionResolution *v10;
  FPTestingCollisionResolution *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FPTestingCollisionResolution;
  v10 = -[FPTestingOperation initWithOperationIdentifier:](&v13, sel_initWithOperationIdentifier_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_renamedItem, a4);
    v11->_snapshotVersion = a5;
  }

  return v11;
}

- (int64_t)type
{
  return 7;
}

- (unint64_t)side
{
  void *v2;
  unint64_t v3;

  -[NSFileProviderItem itemIdentifier](self->_renamedItem, "itemIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("__fp/fs/")) ^ 1;

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPTestingCollisionResolution;
  v4 = a3;
  -[FPTestingOperation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_renamedItem, CFSTR("_renamedItem"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_snapshotVersion, CFSTR("_snapshotVersion"));

}

- (FPTestingCollisionResolution)initWithCoder:(id)a3
{
  id v4;
  FPTestingCollisionResolution *v5;
  uint64_t v6;
  NSFileProviderItem *renamedItem;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPTestingCollisionResolution;
  v5 = -[FPTestingOperation initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_renamedItem"));
    v6 = objc_claimAutoreleasedReturnValue();
    renamedItem = v5->_renamedItem;
    v5->_renamedItem = (NSFileProviderItem *)v6;

    v5->_snapshotVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_snapshotVersion"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderItem)renamedItem
{
  return self->_renamedItem;
}

- (int64_t)snapshotVersion
{
  return self->_snapshotVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renamedItem, 0);
}

@end
