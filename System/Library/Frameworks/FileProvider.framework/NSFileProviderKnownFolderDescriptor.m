@implementation NSFileProviderKnownFolderDescriptor

- (NSFileProviderKnownFolderDescriptor)initWithKnownFolder:(id)a3 logicalLocation:(id)a4 detachOptions:(unint64_t)a5
{
  id v9;
  id v10;
  NSFileProviderKnownFolderDescriptor *v11;
  NSFileProviderKnownFolderDescriptor *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NSFileProviderKnownFolderDescriptor;
  v11 = -[NSFileProviderKnownFolderDescriptor init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_knownFolder, a3);
    objc_storeStrong((id *)&v12->_logicalLocation, a4);
    v12->_detachOptions = a5;
  }

  return v12;
}

- (NSFileProviderKnownFolderDescriptor)initWithKnownFolder:(id)a3 logicalLocation:(id)a4
{
  return -[NSFileProviderKnownFolderDescriptor initWithKnownFolder:logicalLocation:detachOptions:](self, "initWithKnownFolder:logicalLocation:detachOptions:", a3, a4, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderKnownFolderDescriptor)initWithCoder:(id)a3
{
  id v4;
  NSFileProviderKnownFolderDescriptor *v5;
  uint64_t v6;
  NSURL *knownFolder;
  uint64_t v8;
  NSURL *logicalLocation;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NSFileProviderKnownFolderDescriptor;
  v5 = -[NSFileProviderKnownFolderDescriptor init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_knownFolder"));
    v6 = objc_claimAutoreleasedReturnValue();
    knownFolder = v5->_knownFolder;
    v5->_knownFolder = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_logicalLocation"));
    v8 = objc_claimAutoreleasedReturnValue();
    logicalLocation = v5->_logicalLocation;
    v5->_logicalLocation = (NSURL *)v8;

    v5->_detachOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_detachOptions"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *knownFolder;
  id v5;

  knownFolder = self->_knownFolder;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", knownFolder, CFSTR("_knownFolder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_logicalLocation, CFSTR("_logicalLocation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_detachOptions, CFSTR("_detachOptions"));

}

- (NSFileProviderKnownFolderLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSURL)knownFolder
{
  return self->_knownFolder;
}

- (NSURL)logicalLocation
{
  return self->_logicalLocation;
}

- (unint64_t)detachOptions
{
  return self->_detachOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logicalLocation, 0);
  objc_storeStrong((id *)&self->_knownFolder, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
