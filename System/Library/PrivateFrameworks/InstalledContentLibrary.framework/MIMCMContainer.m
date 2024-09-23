@implementation MIMCMContainer

- (BOOL)_doInitWithContainer:(container_object_s *)a3 error:(id *)a4
{
  uint64_t identifier;
  uint64_t v7;
  NSString *v8;
  NSString *v9;
  uint64_t persona_unique_string;
  NSString *v11;
  NSString *personaUniqueString;
  _BOOL4 v13;
  id v14;
  uint64_t is_transient;
  BOOL v16;
  uint64_t v17;
  uint64_t error_description;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v23;
  id v24;
  BOOL v25;

  v25 = 0;
  self->_containerClass = container_get_class();
  identifier = container_get_identifier();
  if (!identifier)
  {
    _CreateAndLogError((uint64_t)"-[MIMCMContainer _doInitWithContainer:error:]", 121, CFSTR("MIContainerManagerErrorDomain"), 18, 0, 0, CFSTR("Failed to get identifier for the container"), v7, v23);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", identifier);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = self->_identifier;
  self->_identifier = v8;

  self->_mcmContainer = (container_object_s *)container_copy_object();
  persona_unique_string = container_get_persona_unique_string();
  if (persona_unique_string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", persona_unique_string);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    personaUniqueString = self->_personaUniqueString;
    self->_personaUniqueString = v11;

  }
  v24 = 0;
  v13 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v24);
  v14 = v24;
  if (!v13)
  {
LABEL_8:
    if (!a4)
    {
LABEL_13:
      v16 = 0;
      goto LABEL_14;
    }
LABEL_9:
    v14 = objc_retainAutorelease(v14);
    v16 = 0;
    *a4 = v14;
    goto LABEL_14;
  }
  self->_isNew = container_is_new();
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  is_transient = container_is_transient();
  if (is_transient != 1)
  {
    v17 = is_transient;
    error_description = container_get_error_description();
    v20 = "(container_get_error_description returned NULL)";
    if (error_description)
      v20 = (const char *)error_description;
    _CreateError((uint64_t)"-[MIMCMContainer _doInitWithContainer:error:]", 141, CFSTR("MIContainerManagerErrorDomain"), v17, 0, 0, CFSTR("%s"), v19, (uint64_t)v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v21;
    if (!a4)
      goto LABEL_13;
    goto LABEL_9;
  }
  self->_isTransient = v25;
  v16 = 1;
LABEL_14:

  return v16;
}

- (MIMCMContainer)initWithContainer:(container_object_s *)a3 error:(id *)a4
{
  MIMCMContainer *v6;
  MIMCMContainer *v7;
  MIMCMContainer *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MIMCMContainer;
  v6 = -[MIMCMContainer init](&v10, sel_init);
  v7 = v6;
  if (v6 && !-[MIMCMContainer _doInitWithContainer:error:](v6, "_doInitWithContainer:error:", a3, a4))
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (MIMCMContainer)initWithSerializedContainer:(id)a3 matchingWithOptions:(unint64_t)a4 error:(id *)a5
{
  id v7;
  MIMCMContainer *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t single_result;
  BOOL v13;
  id v14;
  void *v15;
  uint64_t type;
  int posix_errno;
  void *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void *v30;
  uint64_t error_description;
  uint64_t v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  uint64_t v40;
  id v42;
  objc_super v43;
  uint64_t last_error;

  v7 = a3;
  v43.receiver = self;
  v43.super_class = (Class)MIMCMContainer;
  last_error = 0;
  v8 = -[MIMCMContainer init](&v43, sel_init);
  if (!v8)
  {
    v11 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_24;
  }
  v9 = objc_retainAutorelease(v7);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  v10 = container_serialize_copy_deserialized_reference();
  if (!v10)
  {
    if (last_error)
    {
      MICopyUnlocalizedDescriptionForContainerExtendedError();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      type = container_error_get_type();
      posix_errno = container_error_get_posix_errno();
      if (posix_errno)
      {
        v18 = (void *)*MEMORY[0x1E0CB2FE0];
        v19 = posix_errno;
        v20 = strerror(posix_errno);
        _CreateError((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 187, v18, v19, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v21, (uint64_t)v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      _ErrorDict();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 187, CFSTR("MIContainerManagerErrorDomain"), type, v22, v34, CFSTR("%@"), v35, (uint64_t)v15);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      container_error_free();
    }
    else
    {
      error_description = container_get_error_description();
      v33 = "(container_get_error_description returned NULL)";
      if (error_description)
        v33 = (const char *)error_description;
      _CreateError((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 190, CFSTR("MIContainerManagerErrorDomain"), 21, 0, 0, CFSTR("%s"), v32, (uint64_t)v33);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = 0;
    goto LABEL_23;
  }
  v11 = v10;
  container_query_create_from_container();
  container_query_operation_set_flags();
  single_result = container_query_get_single_result();
  if (!single_result)
  {
    last_error = container_query_get_last_error();
    if (last_error)
    {
      MICopyUnlocalizedDescriptionForContainerExtendedError();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = container_error_get_type();
      v25 = container_error_get_posix_errno();
      if (v25)
      {
        v26 = (void *)*MEMORY[0x1E0CB2FE0];
        v27 = v25;
        v28 = strerror(v25);
        _CreateError((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 204, v26, v27, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v29, (uint64_t)v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v30 = 0;
      }
      _ErrorDict();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 204, CFSTR("MIContainerManagerErrorDomain"), v24, v30, v39, CFSTR("%@"), v40, (uint64_t)v23);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v36 = container_get_error_description();
      v38 = "(container_get_error_description returned NULL)";
      if (v36)
        v38 = (const char *)v36;
      _CreateError((uint64_t)"-[MIMCMContainer initWithSerializedContainer:matchingWithOptions:error:]", 206, CFSTR("MIContainerManagerErrorDomain"), 21, 0, 0, CFSTR("%s"), v37, (uint64_t)v38);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_23:
    v13 = 0;
    goto LABEL_24;
  }
  v42 = 0;
  v13 = -[MIMCMContainer _doInitWithContainer:error:](v8, "_doInitWithContainer:error:", single_result, &v42);
  v14 = v42;
LABEL_24:
  MEMORY[0x1BCCA9B7C](v11);
  container_query_free();
  if (a5 && !v13)
    *a5 = objc_retainAutorelease(v14);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  MEMORY[0x1BCCA9B7C](self->_mcmContainer, a2);
  v3.receiver = self;
  v3.super_class = (Class)MIMCMContainer;
  -[MIMCMContainer dealloc](&v3, sel_dealloc);
}

- (id)serializedContainerRepresentation
{
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", container_serialize_copy_serialized_reference(), 0, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  _RawContainerDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIMCMContainer personaUniqueString](self, "personaUniqueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIMCMContainer containerURL](self, "containerURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ container=%@ persona=%@ path=%@>"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  MIMCMContainer *v4;
  MIMCMContainer *v5;
  char is_equal;

  v4 = (MIMCMContainer *)a3;
  if (v4 == self)
  {
    is_equal = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIMCMContainer mcmContainer](self, "mcmContainer");
      -[MIMCMContainer mcmContainer](v5, "mcmContainer");

      is_equal = container_is_equal();
    }
    else
    {
      is_equal = 0;
    }
  }

  return is_equal;
}

- (BOOL)_refreshContainerMetadataWithError:(id *)a3
{
  uint64_t path;
  NSURL *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSURL *containerURL;
  uint64_t is_transient;
  BOOL v14;
  uint64_t v15;
  uint64_t error_description;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  path = container_get_path();
  if (path)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", path, 1, 0);
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = 0;
    if (v6)
      goto LABEL_6;
  }
  else
  {
    _RawContainerDescription();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"_ContainerURL", 87, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to fetch container URL from %@"), v10, (uint64_t)v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = objc_retainAutorelease(v7);

  v6 = 0;
LABEL_6:
  v11 = v8;
  containerURL = self->_containerURL;
  self->_containerURL = v6;

  if (self->_containerURL)
  {
    -[MIMCMContainer mcmContainer](self, "mcmContainer");
    is_transient = container_is_transient();
    if (is_transient == 1)
    {
      self->_isTransient = 0;
      v14 = 1;
      goto LABEL_15;
    }
    v15 = is_transient;
    error_description = container_get_error_description();
    v18 = "(container_get_error_description returned NULL)";
    if (error_description)
      v18 = (const char *)error_description;
    _CreateError((uint64_t)"-[MIMCMContainer _refreshContainerMetadataWithError:]", 277, CFSTR("MIContainerManagerErrorDomain"), v15, 0, 0, CFSTR("%s"), v17, (uint64_t)v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v19;
  }
  if (a3)
  {
    v11 = objc_retainAutorelease(v11);
    v14 = 0;
    *a3 = v11;
  }
  else
  {
    v14 = 0;
  }
LABEL_15:

  return v14;
}

- (BOOL)reclaimDiskSpaceWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  uint64_t type;
  int posix_errno;
  void *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;

  v4 = container_operation_delete_reclaim_disk_space();
  if (v4)
  {
    MICopyUnlocalizedDescriptionForContainerExtendedError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    type = container_error_get_type();
    posix_errno = container_error_get_posix_errno();
    if (posix_errno)
    {
      v8 = (void *)*MEMORY[0x1E0CB2FE0];
      v9 = posix_errno;
      v10 = strerror(posix_errno);
      _CreateError((uint64_t)"-[MIMCMContainer reclaimDiskSpaceWithError:]", 298, v8, v9, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v11, (uint64_t)v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    _ErrorDict();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[MIMCMContainer reclaimDiskSpaceWithError:]", 298, CFSTR("MIContainerManagerErrorDomain"), type, v12, v14, CFSTR("%@"), v15, (uint64_t)v5);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    container_error_free();
    if (a3)
    {
      v13 = objc_retainAutorelease(v13);
      *a3 = v13;
    }
  }
  else
  {
    container_error_free();
    v13 = 0;
  }

  return v4 == 0;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  uint64_t v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t error_description;
  uint64_t v10;
  const char *v11;
  id v13;

  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  v5 = container_regenerate_uuid();
  if (v5 == 1)
  {
    v13 = 0;
    v6 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v13);
    v7 = v13;
    if (!a3)
      goto LABEL_9;
    goto LABEL_7;
  }
  v8 = v5;
  error_description = container_get_error_description();
  v11 = "(container_get_error_description returned NULL)";
  if (error_description)
    v11 = (const char *)error_description;
  _CreateError((uint64_t)"-[MIMCMContainer regenerateDirectoryUUIDWithError:]", 321, CFSTR("MIContainerManagerErrorDomain"), v8, 0, 0, CFSTR("%s"), v10, (uint64_t)v11);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (a3)
  {
LABEL_7:
    if (!v6)
      *a3 = objc_retainAutorelease(v7);
  }
LABEL_9:

  return v6;
}

- (unint64_t)diskUsage
{
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  return container_disk_usage();
}

- (BOOL)purgeContentWithError:(id *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;

  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  v5 = container_delete_all_container_content();
  if (v5 == 1)
  {
    v6 = 0;
  }
  else
  {
    -[MIMCMContainer identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIMCMContainer purgeContentWithError:]", 361, CFSTR("MIContainerManagerErrorDomain"), v5, 0, 0, CFSTR("Failed to wipe container for identifier %@"), v8, (uint64_t)v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v6 = objc_retainAutorelease(v6);
      *a3 = v6;
    }
  }

  return v5 == 1;
}

- (BOOL)replaceExistingContainer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  uint64_t v12;
  uint64_t error_description;
  uint64_t v14;
  const char *v15;
  void *v17;
  id v18;

  v6 = a3;
  if (-[MIMCMContainer containerClass](self, "containerClass") == 1)
  {
    +[MITestManager sharedInstance](MITestManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "testFlagsAreSet:", 64) & 1) != 0)
    {
      v8 = -[MIMCMContainer isTransient](self, "isTransient");

      if (v8)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          -[MIMCMContainer identifier](self, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

        }
        exit(1);
      }
    }
    else
    {

    }
  }
  objc_msgSend(v6, "mcmContainer");
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  v9 = container_replace();
  if (v9 == 1)
  {
    -[MIMCMContainer setIsTransient:](self, "setIsTransient:", 0);
    v18 = 0;
    v10 = -[MIMCMContainer _refreshContainerMetadataWithError:](self, "_refreshContainerMetadataWithError:", &v18);
    v11 = v18;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  v12 = v9;
  error_description = container_get_error_description();
  v15 = "(container_get_error_description returned NULL)";
  if (error_description)
    v15 = (const char *)error_description;
  _CreateError((uint64_t)"-[MIMCMContainer replaceExistingContainer:error:]", 390, CFSTR("MIContainerManagerErrorDomain"), v12, 0, 0, CFSTR("%s"), v14, (uint64_t)v15);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (a4)
  {
LABEL_15:
    if (!v10)
      *a4 = objc_retainAutorelease(v11);
  }
LABEL_17:

  return v10;
}

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t error_description;
  uint64_t v15;
  const char *v16;

  v8 = a4;
  v9 = a3;
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "UTF8String");

  v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v12 = container_set_info_value();

  if (v12 == 1)
  {
    v13 = 0;
  }
  else
  {
    error_description = container_get_error_description();
    v16 = "(container_get_error_description returned NULL)";
    if (error_description)
      v16 = (const char *)error_description;
    _CreateError((uint64_t)"-[MIMCMContainer setInfoValue:forKey:error:]", 420, CFSTR("MIContainerManagerErrorDomain"), v12, 0, 0, CFSTR("%s"), v15, (uint64_t)v16);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      v13 = objc_retainAutorelease(v13);
      *a5 = v13;
    }
  }

  return v12 == 1;
}

- (id)infoValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t error_description;
  uint64_t v14;
  const char *v15;
  void *v16;

  v6 = a3;
  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "UTF8String");
  container_get_info_value_for_key();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = _CFXPCCreateCFObjectFromXPCObject();
    if (v9)
    {
      v11 = (void *)v9;
      v12 = 0;
      goto LABEL_11;
    }
    _CreateAndLogError((uint64_t)"-[MIMCMContainer infoValueForKey:error:]", 446, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to retrieve value for key %@ from the underlying xpc object"), v10, (uint64_t)v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    error_description = container_get_error_description();
    v15 = "(container_get_error_description returned NULL)";
    if (error_description)
      v15 = (const char *)error_description;
    _CreateError((uint64_t)"-[MIMCMContainer infoValueForKey:error:]", 440, CFSTR("MIContainerManagerErrorDomain"), 24, 0, 0, CFSTR("%s"), v14, (uint64_t)v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v16;
  if (a4)
  {
    v12 = objc_retainAutorelease(v16);
    v11 = 0;
    *a4 = v12;
  }
  else
  {
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (BOOL)recreateDefaultStructureWithError:(id *)a3
{
  uint64_t v4;
  id v5;
  uint64_t error_description;
  uint64_t v7;
  const char *v8;

  -[MIMCMContainer mcmContainer](self, "mcmContainer");
  v4 = container_recreate_structure();
  if (v4 == 1)
  {
    v5 = 0;
  }
  else
  {
    error_description = container_get_error_description();
    v8 = "(container_get_error_description returned NULL)";
    if (error_description)
      v8 = (const char *)error_description;
    _CreateError((uint64_t)"-[MIMCMContainer recreateDefaultStructureWithError:]", 465, CFSTR("MIContainerManagerErrorDomain"), v4, 0, 0, CFSTR("%s"), v7, (uint64_t)v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v5 = objc_retainAutorelease(v5);
      *a3 = v5;
    }
  }

  return v4 == 1;
}

+ (id)_enumeratorWithContainerClass:(unint64_t)a3 forPersona:(id)a4 isTransient:(BOOL)a5 identifiers:(id)a6 groupIdentifiers:(id)a7 create:(BOOL)a8 usingBlock:(id)a9
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  xpc_object_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  xpc_object_t v20;
  xpc_object_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  xpc_object_t v26;
  char iterate_results_sync;
  char v28;
  void *v29;
  uint64_t type;
  int posix_errno;
  int v32;
  char *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a6;
  v13 = a7;
  v43 = a9;
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__4;
  v57 = __Block_byref_object_dispose__4;
  v58 = 0;
  if (!container_query_create())
  {
    _CreateAndLogError((uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:]", 487, CFSTR("MIContainerManagerErrorDomain"), 110, 0, 0, CFSTR("Failed to create container query for querying containers for identifier: %@ groupIdentifiers: %@ containerType: %llu"), v14, (uint64_t)v12);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v54[5];
    v54[5] = v36;
LABEL_32:

    goto LABEL_33;
  }
  container_query_operation_set_flags();
  container_query_set_transient();
  container_query_set_class();
  container_query_set_include_other_owners();
  if (v13)
  {
    v15 = xpc_array_create(0, 0);
    v51 = 0u;
    v52 = 0u;
    v50 = 0u;
    v49 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v50 != v18)
            objc_enumerationMutation(v16);
          v20 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i)), "UTF8String"));
          xpc_array_append_value(v15, v20);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
      }
      while (v17);
    }

    container_query_set_group_identifiers();
  }
  if (v12)
  {
    v21 = xpc_array_create(0, 0);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v22 = v12;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v22);
          v26 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j)), "UTF8String"));
          xpc_array_append_value(v21, v26);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
      }
      while (v23);
    }

    container_query_set_identifiers();
  }
  if (v11)
  {
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    container_query_set_persona_unique_string();
  }
  v44 = v43;
  iterate_results_sync = container_query_iterate_results_sync();

  if (v54[5])
    v28 = 1;
  else
    v28 = iterate_results_sync;
  if ((v28 & 1) == 0 && container_query_get_last_error())
  {
    MICopyUnlocalizedDescriptionForContainerExtendedError();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    type = container_error_get_type();
    posix_errno = container_error_get_posix_errno();
    v32 = posix_errno;
    if (posix_errno)
    {
      v33 = strerror(posix_errno);
      _CreateError((uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:]", 549, (void *)*MEMORY[0x1E0CB2FE0], v32, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v34, (uint64_t)v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    _ErrorDict();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"+[MIMCMContainer _enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:]", 549, CFSTR("MIContainerManagerErrorDomain"), type, v35, v38, CFSTR("%@"), v39, (uint64_t)v29);
    v40 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v54[5];
    v54[5] = v40;
    goto LABEL_32;
  }
LABEL_33:
  container_query_free();
  v41 = (id)v54[5];
  _Block_object_dispose(&v53, 8);

  return v41;
}

uint64_t __118__MIMCMContainer__enumeratorWithContainerClass_forPersona_isTransient_identifiers_groupIdentifiers_create_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x1BCCAA068]();
  v11 = 0;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContainer:error:", a2, &v11);
  v6 = v11;
  v7 = v11;
  if (v5)
  {
    v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      _RawContainerDescription();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
    v8 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v8;
}

+ (id)enumerateContainersWithClass:(unint64_t)a3 forPersona:(id)a4 isTransient:(BOOL)a5 identifiers:(id)a6 groupIdentifiers:(id)a7 usingBlock:(id)a8
{
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v10 = a5;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  objc_msgSend((id)objc_opt_class(), "_enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:", a3, v16, v10, v15, v14, 0, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_allContainersForIdentifiers:(id)a3 groupIdentifiers:(id)a4 contentClass:(unint64_t)a5 forPersona:(id)a6 transient:(BOOL)a7 create:(BOOL)a8 error:(id *)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v9 = a8;
  v10 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = (id)objc_opt_new();
  v17 = (void *)objc_opt_class();
  v22[1] = 3221225472;
  v22[2] = __111__MIMCMContainer__allContainersForIdentifiers_groupIdentifiers_contentClass_forPersona_transient_create_error___block_invoke;
  v22[3] = &unk_1E6CB7108;
  v22[4] = &v23;
  v22[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v17, "_enumeratorWithContainerClass:forPersona:isTransient:identifiers:groupIdentifiers:create:usingBlock:", a5, v16, v10, v14, v15, v9, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v24[5];
    v24[5] = 0;

    if (a9)
      *a9 = objc_retainAutorelease(v18);
  }
  v20 = (void *)objc_msgSend((id)v24[5], "copy");

  _Block_object_dispose(&v23, 8);
  return v20;
}

uint64_t __111__MIMCMContainer__allContainersForIdentifiers_groupIdentifiers_contentClass_forPersona_transient_create_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return 1;
}

+ (id)_containerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 transient:(BOOL)a6 create:(BOOL)a7 error:(id *)a8
{
  id v12;
  id v13;
  uint64_t v14;
  xpc_object_t v15;
  uint64_t v16;
  id v17;
  uint64_t single_result;
  void *v19;
  void *v20;
  uint64_t type;
  int posix_errno;
  void *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t error_description;
  uint64_t v32;
  const char *v33;
  id v34;

  v12 = a3;
  v13 = a5;
  if (!v13 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    MOLogWrite();
  if (!container_query_create())
  {
    _CreateAndLogError((uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]", 594, CFSTR("MIContainerManagerErrorDomain"), 110, 0, 0, CFSTR("Failed to create container query for querying containers for identifier %@"), v14, (uint64_t)v12);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  container_query_operation_set_flags();
  container_query_set_class();
  container_query_set_transient();
  container_query_set_include_other_owners();
  v15 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  if (a4 == 7)
    container_query_set_group_identifiers();
  else
    container_query_set_identifiers();

  if (v13)
  {
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    container_query_set_persona_unique_string();
  }
  single_result = container_query_get_single_result();
  if (!single_result)
  {
    if (container_query_get_last_error())
    {
      MICopyUnlocalizedDescriptionForContainerExtendedError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      type = container_error_get_type();
      posix_errno = container_error_get_posix_errno();
      if (posix_errno)
      {
        v23 = (void *)*MEMORY[0x1E0CB2FE0];
        v24 = posix_errno;
        v25 = strerror(posix_errno);
        _CreateError((uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]", 621, v23, v24, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v26, (uint64_t)v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = 0;
      }
      _ErrorDict();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]", 621, CFSTR("MIContainerManagerErrorDomain"), type, v27, v28, CFSTR("%@"), v29, (uint64_t)v20);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    if (a7)
    {
      v19 = 0;
      v17 = 0;
      goto LABEL_23;
    }
    error_description = container_get_error_description();
    v33 = "(container_get_error_description returned NULL)";
    if (error_description)
      v33 = (const char *)error_description;
    _CreateError((uint64_t)"+[MIMCMContainer _containerForIdentifier:contentClass:forPersona:transient:create:error:]", 623, CFSTR("MIContainerManagerErrorDomain"), 21, 0, 0, CFSTR("%s"), v32, (uint64_t)v33);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v17 = (id)v16;
LABEL_22:
    v19 = 0;
    goto LABEL_23;
  }
  v34 = 0;
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContainer:error:", single_result, &v34);
  v17 = v34;
LABEL_23:
  if (a8 && !v19)
    *a8 = objc_retainAutorelease(v17);
  container_query_free();

  return v19;
}

+ (id)containersForContentClass:(unint64_t)a3 forPersona:(id)a4 fetchTransient:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;

  v7 = a5;
  v9 = a4;
  objc_msgSend((id)objc_opt_class(), "_allContainersForIdentifiers:groupIdentifiers:contentClass:forPersona:transient:create:error:", 0, 0, a3, v9, v7, 0, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)containersForGroupIdentifier:(id)a3 forPersona:(id)a4 create:(BOOL)a5 fetchTransient:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v8 = a5;
  v16[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_class();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_allContainersForIdentifiers:groupIdentifiers:contentClass:forPersona:transient:create:error:", 0, v13, 7, v10, 0, v8, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)containersForBundleIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 fetchTransient:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v9 = a7;
  v10 = a6;
  v19[1] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a3;
  v15 = (void *)objc_opt_class();
  v19[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "_allContainersForIdentifiers:groupIdentifiers:contentClass:forPersona:transient:create:error:", v16, 0, a4, v13, v9, v10, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)containerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;

  v8 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "_containerForIdentifier:contentClass:forPersona:transient:create:error:", v12, a4, v11, 0, v8, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)transientContainerForIdentifier:(id)a3 contentClass:(unint64_t)a4 forPersona:(id)a5 create:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;

  v8 = a6;
  v11 = a5;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "_containerForIdentifier:contentClass:forPersona:transient:create:error:", v12, a4, v11, 1, v8, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)deleteContainers:(id)a3 waitForDeletion:(BOOL)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  BOOL v17;
  void *v18;
  uint64_t type;
  int posix_errno;
  void *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v34 = 0;
  v35 = 0;
  v8 = malloc_type_calloc(objc_msgSend(v6, "count"), 8uLL, 0x2004093837F09uLL);
  if (!v8)
  {
    _CreateAndLogError((uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]", 677, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to allocate memory for deleting containers"), v7, v29);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!a5)
      goto LABEL_17;
    goto LABEL_20;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v9);
        v8[v12 + i] = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "mcmContainer");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      v12 += i;
    }
    while (v11);
  }

  if (!container_operation_delete_array())
  {
    if (v34)
    {
      MICopyUnlocalizedDescriptionForContainerExtendedError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      type = container_error_get_type();
      posix_errno = container_error_get_posix_errno();
      if (posix_errno)
      {
        v21 = (void *)*MEMORY[0x1E0CB2FE0];
        v22 = posix_errno;
        v23 = strerror(posix_errno);
        _CreateError((uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]", 693, v21, v22, 0, 0, CFSTR("Underlying errno set by container manager is %s"), v24, (uint64_t)v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }
      _ErrorDict();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]", 693, CFSTR("MIContainerManagerErrorDomain"), type, v25, v26, CFSTR("%@"), v27, (uint64_t)v18);
      v16 = (id)objc_claimAutoreleasedReturnValue();

      container_error_free();
      if (a5)
        goto LABEL_20;
LABEL_17:
      v17 = 0;
      goto LABEL_21;
    }
    _CreateAndLogError((uint64_t)"+[MIMCMContainer deleteContainers:waitForDeletion:error:]", 696, CFSTR("MIContainerManagerErrorDomain"), 38, 0, 0, CFSTR("container_operation_delete_array returned NULL but did not set an error"), v15, v29);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!a5)
      goto LABEL_17;
LABEL_20:
    v16 = objc_retainAutorelease(v16);
    v17 = 0;
    *a5 = v16;
    goto LABEL_21;
  }
  container_free_array_of_containers();
  v16 = 0;
  v17 = 1;
LABEL_21:
  free(v8);

  return v17;
}

+ (id)defaultDirectoriesForContainerType:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t error_description;
  uint64_t v12;
  const char *v13;
  id v14;

  v6 = (void *)container_subdirectories_for_class();
  if (!v6)
  {
    error_description = container_get_error_description();
    v13 = "(container_get_error_description returned NULL)";
    if (error_description)
      v13 = (const char *)error_description;
    _CreateError((uint64_t)"+[MIMCMContainer defaultDirectoriesForContainerType:error:]", 722, CFSTR("MIContainerManagerErrorDomain"), 1, 0, 0, CFSTR("%s"), v12, (uint64_t)v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
LABEL_9:
    v9 = 0;
    if (!a4)
      goto LABEL_12;
    goto LABEL_10;
  }
  v8 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v8)
  {
    _CreateAndLogError((uint64_t)"+[MIMCMContainer defaultDirectoriesForContainerType:error:]", 728, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to retrieve container subdirectories for class %llu"), v7, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  if (!a4)
    goto LABEL_12;
LABEL_10:
  if (!v9)
    *a4 = objc_retainAutorelease(v10);
LABEL_12:
  v14 = v9;

  return v14;
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isTransient
{
  return self->_isTransient;
}

- (void)setIsTransient:(BOOL)a3
{
  self->_isTransient = a3;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (container_object_s)mcmContainer
{
  return self->_mcmContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
}

@end
