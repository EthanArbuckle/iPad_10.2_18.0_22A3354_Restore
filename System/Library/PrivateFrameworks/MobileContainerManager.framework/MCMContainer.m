@implementation MCMContainer

- (MCMContainer)initWithIdentifier:(id)a3 path:(id)a4 uniquePathComponent:(id)a5 uuid:(id)a6 personaUniqueString:(id)a7 uid:(unsigned int)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  MCMContainer *v22;
  MCMContainer *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  NSObject *v28;
  uint64_t v29;
  objc_super v30;
  _BYTE buf[22];
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = objc_msgSend((id)objc_opt_class(), "typeContainerClass");
  if (!v20)
  {
    container_log_handle_for_category();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_21A231000, v28, OS_LOG_TYPE_FAULT, "You cannot init this class directly. Instead, use a subclass e.g. MCMAppContainer", buf, 2u);
    }

    abort();
  }
  v21 = v20;
  v30.receiver = self;
  v30.super_class = (Class)MCMContainer;
  v22 = -[MCMContainer init](&v30, sel_init);
  v23 = v22;
  if (!v22)
  {
    v25 = 0;
    goto LABEL_17;
  }
  if (v21 > 14 || !v15 || !v18 || (unint64_t)(gMCMContainerClassToContainerClass[v21] - 1) >= 0xE)
  {
    container_log_handle_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      v32 = 2048;
      v33 = v21;
      _os_log_fault_impl(&dword_21A231000, v26, OS_LOG_TYPE_FAULT, "Bad initializers: id: %@, UUID: %@, Class: %ld", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 31, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  objc_storeStrong((id *)&v22->_identifier, a3);
  objc_storeStrong((id *)&v23->_uuid, a6);
  v23->_containerClass = v21;
  objc_storeStrong((id *)&v23->_personaUniqueString, a7);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  objc_msgSend(v18, "getUUIDBytes:", buf);
  -[NSString UTF8String](v23->_identifier, "UTF8String");
  objc_msgSend(objc_retainAutorelease(v16), "fileSystemRepresentation");
  objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
  -[NSString UTF8String](v23->_personaUniqueString, "UTF8String");
  LOWORD(v29) = 0;
  v24 = container_object_create();
  v23->_thisContainer = (container_object_s *)v24;
  if (!v24)
  {

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 11, 0, 0, v29, 0, 0, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v23 = 0;
    goto LABEL_13;
  }
  v25 = 0;
LABEL_13:
  if (a9 && v25)
  {
    v25 = objc_retainAutorelease(v25);
    *a9 = v25;
  }
LABEL_17:

  return v23;
}

+ (id)containerWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 existed:(BOOL *)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;

  v8 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:createIfNecessary:existed:temp:error:", v10, v8, a5, 0, a6);

  return v11;
}

- (MCMContainer)initWithIdentifier:(id)a3 createIfNecessary:(BOOL)a4 existed:(BOOL *)a5 temp:(BOOL)a6 error:(id *)a7
{
  id v9;
  uint64_t v10;
  int64_t v11;
  MCMContainer *persona_unique_string;
  MCMContainer *v13;
  id v14;
  uint64_t v15;
  const unsigned __int8 *uuid;
  uint64_t v18;
  NSUUID *v19;
  uint64_t v20;
  NSString *identifier;
  NSString *personaUniqueString;
  uint64_t v23;
  NSString *v24;
  NSObject *v25;
  objc_super v26;
  uint8_t dst[24];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = objc_msgSend((id)objc_opt_class(), "typeContainerClass");
  if (!v10)
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)dst = 0;
      _os_log_fault_impl(&dword_21A231000, v25, OS_LOG_TYPE_FAULT, "You cannot init this class directly. Instead, use a subclass e.g. MCMAppContainer", dst, 2u);
    }

    abort();
  }
  v11 = v10;
  v26.receiver = self;
  v26.super_class = (Class)MCMContainer;
  persona_unique_string = -[MCMContainer init](&v26, sel_init);
  v13 = persona_unique_string;
  if (persona_unique_string)
  {
    v14 = objc_retainAutorelease(v9);
    objc_msgSend(v14, "UTF8String");
    v15 = container_create_or_lookup_for_current_user();
    v13->_thisContainer = (container_object_s *)v15;
    memset(dst, 0, 16);
    if (v15)
    {
      uuid = (const unsigned __int8 *)container_object_get_uuid();
      uuid_copy(dst, uuid);
    }
    else
    {
      uuid_clear(dst);
    }
    if (uuid_is_null(dst))
    {

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 11, 0);
      persona_unique_string = (MCMContainer *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
    }
    else
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", dst);
      v19 = v13->_uuid;
      v13->_uuid = (NSUUID *)v18;

      v13->_containerClass = v11;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v14);
      v20 = objc_claimAutoreleasedReturnValue();
      identifier = v13->_identifier;
      v13->_identifier = (NSString *)v20;

      personaUniqueString = v13->_personaUniqueString;
      v13->_personaUniqueString = 0;

      persona_unique_string = (MCMContainer *)container_get_persona_unique_string();
      if (persona_unique_string)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", persona_unique_string);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v13->_personaUniqueString;
        v13->_personaUniqueString = (NSString *)v23;

        persona_unique_string = 0;
      }
    }
    if (a7 && persona_unique_string)
    {
      persona_unique_string = objc_retainAutorelease(persona_unique_string);
      *a7 = persona_unique_string;
    }
  }

  return v13;
}

- (MCMContainer)init
{
  NSObject *v2;
  uint8_t v3[8];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  container_log_handle_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_21A231000, v2, OS_LOG_TYPE_FAULT, "You cannot init this class directly. Instead, use convenience constructor containerWithIdentifier:", v3, 2u);
  }

  abort();
}

- (id)destroyContainerWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  const unsigned __int8 *uuid;
  void *v6;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  if (self->_thisContainer
    && (uuid = (const unsigned __int8 *)container_object_get_uuid(), !uuid_is_null(uuid))
    && container_object_get_identifier()
    && (unint64_t)(container_object_get_class() - 1) < 0xE)
  {
    +[MCMContainerManager defaultManager](MCMContainerManager, "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = self;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteContainers:withCompletion:", v9, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 11, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);
  }

  return v6;
}

- (BOOL)setInfoValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  BOOL v12;

  v7 = objc_retainAutorelease(a4);
  v8 = a3;
  objc_msgSend(v7, "UTF8String");
  v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  v10 = container_set_info_value();
  if (v10 == 1)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (a5 && v11)
    {
      v11 = objc_retainAutorelease(v11);
      *a5 = v11;
    }
  }
  v12 = v11 == 0;

  return v12;
}

- (id)infoValueForKey:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = (void *)container_copy_info_value_for_key();
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  return v5;
}

- (BOOL)recreateDefaultStructureWithError:(id *)a3
{
  uint64_t v4;
  id v5;
  BOOL v6;

  v4 = container_recreate_structure();
  if (v4 == 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), v4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (a3 && v5)
    {
      v5 = objc_retainAutorelease(v5);
      *a3 = v5;
    }
  }
  v6 = v5 == 0;

  return v6;
}

- (BOOL)regenerateDirectoryUUIDWithError:(id *)a3
{
  uint64_t v4;
  id v5;
  BOOL v6;

  v4 = container_regenerate_uuid();
  if (v4 == 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), v4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (a3 && v5)
    {
      v5 = objc_retainAutorelease(v5);
      *a3 = v5;
    }
  }
  v6 = v5 == 0;

  return v6;
}

- (NSURL)url
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = container_copy_path();
  v6 = v2;
  if (!v2)
    return (NSURL *)0;
  v3 = (void *)v2;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v2, 1, 0, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(v3);
  memset_s(&v6, 8uLL, 0, 8uLL);
  return (NSURL *)v4;
}

- (NSDictionary)info
{
  void *v2;
  void *v3;

  v2 = (void *)container_copy_info();
  v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  return (NSDictionary *)v3;
}

- (BOOL)isTemporary
{
  container_is_transient();
  return 0;
}

- (NSString)identifier
{
  int64_t containerClass;
  unint64_t v3;
  BOOL v4;
  NSString *v5;

  containerClass = self->_containerClass;
  if (containerClass > 14
    || ((v3 = gMCMContainerClassToContainerClass[containerClass] - 1, self->_uuid) ? (v4 = v3 > 0xD) : (v4 = 1), v4))
  {
    v5 = 0;
  }
  else
  {
    v5 = self->_identifier;
  }
  return v5;
}

- (NSString)personaUniqueString
{
  int64_t containerClass;
  unint64_t v3;
  BOOL v4;
  NSString *v5;

  containerClass = self->_containerClass;
  if (containerClass > 14
    || ((v3 = gMCMContainerClassToContainerClass[containerClass] - 1, self->_uuid) ? (v4 = v3 > 0xD) : (v4 = 1), v4))
  {
    v5 = 0;
  }
  else
  {
    v5 = self->_personaUniqueString;
  }
  return v5;
}

- (NSUUID)uuid
{
  int64_t containerClass;
  unint64_t v3;
  NSUUID *uuid;
  BOOL v5;
  NSUUID *v6;

  containerClass = self->_containerClass;
  if (containerClass > 14
    || ((v3 = gMCMContainerClassToContainerClass[containerClass] - 1, (uuid = self->_uuid) != 0)
      ? (v5 = v3 > 0xD)
      : (v5 = 1),
        v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = uuid;
  }
  return v6;
}

- (int64_t)containerClass
{
  int64_t containerClass;

  containerClass = self->_containerClass;
  if (containerClass > 14)
    return 0;
  if ((unint64_t)(gMCMContainerClassToContainerClass[containerClass] - 1) >= 0xE || self->_uuid == 0)
    return 0;
  else
    return self->_containerClass;
}

- (unint64_t)diskUsageWithError:(id *)a3
{
  unint64_t v4;

  v4 = container_disk_usage();
  if (a3)
    *a3 = objc_retainAutorelease(0);

  return v4;
}

- (BOOL)isEqualToContainer:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  if (-[MCMContainer _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_uuid, v4[2])
    && -[MCMContainer _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_personaUniqueString, v4[3]))
  {
    v5 = container_class_normalized();
    v6 = v5 == container_class_normalized();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  MCMContainer *v4;
  BOOL v5;

  v4 = (MCMContainer *)a3;
  v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[MCMContainer isEqualToContainer:](self, "isEqualToContainer:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSUUID hash](self->_uuid, "hash");
  v4 = container_class_normalized();
  return v4 ^ v3 ^ -[NSString hash](self->_personaUniqueString, "hash");
}

- (id)description
{
  int64_t containerClass;
  BOOL v4;
  NSUUID *uuid;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  NSString *identifier;
  NSUUID *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;

  containerClass = self->_containerClass;
  v4 = containerClass <= 14 && (unint64_t)(gMCMContainerClassToContainerClass[containerClass] - 1) < 0xE;
  uuid = self->_uuid;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (uuid && v4)
  {
    v10 = self->_containerClass;
    identifier = self->_identifier;
    v12 = self->_uuid;
    -[MCMContainer url](self, "url");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MCMContainer isTemporary](self, "isTemporary");
    -[MCMContainer info](self, "info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainer personaUniqueString](self, "personaUniqueString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@ (%ld) ID: %@ UUID: %@ URL: %@ isTemp: %d info: %@ persona: %@>"), v9, v10, identifier, v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: deleted container>"), v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4
{
  BOOL result;

  result = 0;
  if (a3 && a4)
    result = objc_msgSend(a3, "isEqual:", a4);
  if (!((unint64_t)a3 | (unint64_t)a4))
    return 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)containerWithIdentifier:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "containerWithIdentifier:createIfNecessary:existed:error:", a3, 0, 0, a4);
}

+ (id)temporaryContainerWithIdentifier:(id)a3 existed:(BOOL *)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:createIfNecessary:existed:temp:error:", v8, 1, a4, 1, a5);

  return v9;
}

+ (int64_t)typeContainerClass
{
  return 0;
}

- (container_object_s)thisContainer
{
  return self->_thisContainer;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  MEMORY[0x22073DB04](self->_thisContainer, a2);
  v3.receiver = self;
  v3.super_class = (Class)MCMContainer;
  -[MCMContainer dealloc](&v3, sel_dealloc);
}

- (void)markDeleted
{
  NSString *identifier;
  NSUUID *uuid;

  identifier = self->_identifier;
  self->_identifier = 0;

  uuid = self->_uuid;
  self->_uuid = 0;

  self->_containerClass = 0;
  container_object_set_class();
}

- (container_object_s)getLowLevelContainerObject
{
  return self->_thisContainer;
}

@end
