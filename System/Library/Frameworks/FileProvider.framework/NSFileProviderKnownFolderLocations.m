@implementation NSFileProviderKnownFolderLocations

- (NSFileProviderKnownFolderLocations)init
{
  NSFileProviderKnownFolderLocations *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderKnownFolderLocations;
  result = -[NSFileProviderKnownFolderLocations init](&v3, sel_init);
  if (result)
    result->_shouldCreateBinaryCompatibilitySymlink = 1;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderKnownFolderLocations)initWithCoder:(id)a3
{
  id v4;
  NSFileProviderKnownFolderLocations *v5;
  void *v6;
  uint64_t v7;
  NSFileProviderKnownFolderLocation *desktopLocation;
  void *v9;
  uint64_t v10;
  NSFileProviderKnownFolderLocation *documentsLocation;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSFileProviderKnownFolderLocations;
  v5 = -[NSFileProviderKnownFolderLocations init](&v13, sel_init);
  if (v5)
  {
    v5->_shouldCreateBinaryCompatibilitySymlink = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldCreateBinaryCompatibilitySymlink"));
    knownFolderLocationConcreteClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("_desktopLocation"));
    v7 = objc_claimAutoreleasedReturnValue();
    desktopLocation = v5->_desktopLocation;
    v5->_desktopLocation = (NSFileProviderKnownFolderLocation *)v7;

    knownFolderLocationConcreteClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_documentsLocation"));
    v10 = objc_claimAutoreleasedReturnValue();
    documentsLocation = v5->_documentsLocation;
    v5->_documentsLocation = (NSFileProviderKnownFolderLocation *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 shouldCreateBinaryCompatibilitySymlink;
  id v5;

  shouldCreateBinaryCompatibilitySymlink = self->_shouldCreateBinaryCompatibilitySymlink;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", shouldCreateBinaryCompatibilitySymlink, CFSTR("_shouldCreateBinaryCompatibilitySymlink"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_desktopLocation, CFSTR("_desktopLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_documentsLocation, CFSTR("_documentsLocation"));

}

- (unint64_t)providedKnownFolders
{
  if (self->_documentsLocation)
    return (self->_desktopLocation != 0) | 2;
  else
    return self->_desktopLocation != 0;
}

- (id)description
{
  uint64_t v2;

  v2 = 89;
  if (!self->_shouldCreateBinaryCompatibilitySymlink)
    v2 = 78;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<KFLocations desktop:%@ documents:%@ lnk:%c>"), self->_desktopLocation, self->_documentsLocation, v2);
}

- (BOOL)shouldCreateBinaryCompatibilitySymlink
{
  return self->_shouldCreateBinaryCompatibilitySymlink;
}

- (void)setShouldCreateBinaryCompatibilitySymlink:(BOOL)a3
{
  self->_shouldCreateBinaryCompatibilitySymlink = a3;
}

- (NSFileProviderKnownFolderLocation)desktopLocation
{
  return self->_desktopLocation;
}

- (void)setDesktopLocation:(id)a3
{
  objc_storeStrong((id *)&self->_desktopLocation, a3);
}

- (NSFileProviderKnownFolderLocation)documentsLocation
{
  return self->_documentsLocation;
}

- (void)setDocumentsLocation:(id)a3
{
  objc_storeStrong((id *)&self->_documentsLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentsLocation, 0);
  objc_storeStrong((id *)&self->_desktopLocation, 0);
}

@end
