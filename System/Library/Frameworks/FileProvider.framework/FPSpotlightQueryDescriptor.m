@implementation FPSpotlightQueryDescriptor

- (BOOL)keepCollectorsAlive
{
  return 1;
}

- (BOOL)supportsQueryingAllMountPoints
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[FPSpotlightQueryDescriptor isEqualToItemQueryDescriptor:](self, "isEqualToItemQueryDescriptor:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;

  -[FPSpotlightQueryDescriptor queryStringForMountPoint:](self, "queryStringForMountPoint:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return -[FPSpotlightQueryDescriptor desiredCount](self, "desiredCount") ^ v4;
}

- (BOOL)isEqualToItemQueryDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(v4, "queryStringForMountPoint:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightQueryDescriptor queryStringForMountPoint:](self, "queryStringForMountPoint:", CFSTR("FPQueryCollectionDefaultMountPointIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = objc_msgSend(v4, "desiredCount");
    v8 = v7 == -[FPSpotlightQueryDescriptor desiredCount](self, "desiredCount");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)desiredCount
{
  return -1;
}

- (FPQueryEnumerationSettings)settings
{
  return self->_settings;
}

- (FPSpotlightQueryDescriptor)initWithSettings:(id)a3
{
  id v5;
  FPSpotlightQueryDescriptor *v6;
  FPSpotlightQueryDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPSpotlightQueryDescriptor;
  v6 = -[FPSpotlightQueryDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_settings, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
}

- (FPSpotlightQueryDescriptor)init
{
  void *v3;
  FPSpotlightQueryDescriptor *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[FPSpotlightQueryDescriptor initWithSettings:](self, "initWithSettings:", v3);

  return v4;
}

- (NSString)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)queryStringForMountPoint:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3488];
  v6 = a3;
  objc_msgSend(v5, "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPSpotlightQueryDescriptor.m"), 48, CFSTR("Subclass should always override %@ (%@)"), v8, v6);

  return 0;
}

- (BOOL)supportsSemanticSearch
{
  return -[FPQueryEnumerationSettings allowSemanticSearchResults](self->_settings, "allowSemanticSearchResults");
}

@end
