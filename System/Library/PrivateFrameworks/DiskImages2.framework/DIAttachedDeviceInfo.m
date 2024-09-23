@implementation DIAttachedDeviceInfo

- (DIAttachedDeviceInfo)initWithDevice:(id)a3 error:(id *)a4
{
  id v6;
  DIAttachedDeviceInfo *v7;
  uint64_t v8;
  DIIOMedia *ioMedia;
  DIIOMedia *v10;
  uint64_t v11;
  NSNumber *mediaSize;
  uint64_t v13;
  NSNumber *blockSize;
  uint64_t v15;
  NSString *BSDName;
  DIAttachedDeviceInfo *v17;
  DIAttachedDeviceInfo *v18;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DIAttachedDeviceInfo;
  v7 = -[DIAttachedDeviceInfo init](&v20, sel_init);
  if (!v7)
    goto LABEL_8;
  v8 = objc_msgSend(v6, "copyIOMediaWithError:", a4);
  ioMedia = v7->_ioMedia;
  v7->_ioMedia = (DIIOMedia *)v8;

  v10 = v7->_ioMedia;
  if (!v10)
  {
LABEL_13:
    v18 = 0;
    goto LABEL_14;
  }
  v11 = -[DIIOObject copyPropertyWithClass:key:](v10, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("Size"));
  mediaSize = v7->_mediaSize;
  v7->_mediaSize = (NSNumber *)v11;

  v13 = -[DIIOObject copyPropertyWithClass:key:](v7->_ioMedia, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("Preferred Block Size"));
  blockSize = v7->_blockSize;
  v7->_blockSize = (NSNumber *)v13;

  -[DIIOMedia BSDName](v7->_ioMedia, "BSDName");
  v15 = objc_claimAutoreleasedReturnValue();
  BSDName = v7->_BSDName;
  v7->_BSDName = (NSString *)v15;

  if (!v7->_mediaSize || !v7->_blockSize || !v7->_BSDName)
  {
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, CFSTR("Basic information about the IOMedia device is missing"), a4);
    v17 = (DIAttachedDeviceInfo *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!objc_msgSend(v6, "diskImageDevice"))
  {
    if (!IOObjectConformsTo(objc_msgSend(v6, "ioObj"), "IOHDIXHDDriveNub"))
    {
      +[DIError nilWithEnumValue:description:error:](DIError, "nilWithEnumValue:description:error:", 157, CFSTR("Device is not a disk image"), a4);
      v17 = (DIAttachedDeviceInfo *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (-[DIAttachedDeviceInfo fillDI1InfoWithDevice:error:](v7, "fillDI1InfoWithDevice:error:", v6, a4))
      goto LABEL_8;
    goto LABEL_13;
  }
  if (!-[DIAttachedDeviceInfo fillDI2InfoWithDevice:error:](v7, "fillDI2InfoWithDevice:error:", v6, a4))
    goto LABEL_13;
LABEL_8:
  v17 = v7;
LABEL_10:
  v18 = v17;
LABEL_14:

  return v18;
}

- (BOOL)fillDI2InfoWithDevice:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSURL *v8;
  NSURL *imageURL;
  NSURL **p_imageURL;
  void *v11;
  NSURL *v12;
  NSURL *shadowURL;
  BOOL v14;
  void *v15;
  NSURL *v16;
  NSURL *cacheURL;
  NSString *v18;
  NSString *instanceId;

  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("DiskImageURL"));
  if (v7)
  {
    v8 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v7);
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = v8;
  }
  else
  {
    p_imageURL = &self->_imageURL;
    imageURL = self->_imageURL;
    self->_imageURL = 0;
  }

  if (*p_imageURL)
  {
    v11 = (void *)objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("ShadowURL"));
    if (v11)
    {
      v12 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v11);
      shadowURL = self->_shadowURL;
      self->_shadowURL = v12;
    }
    else
    {
      shadowURL = self->_shadowURL;
      self->_shadowURL = 0;
    }

    v15 = (void *)objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("CacheURL"));
    if (v15)
    {
      v16 = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v15);
      cacheURL = self->_cacheURL;
      self->_cacheURL = v16;
    }
    else
    {
      cacheURL = self->_cacheURL;
      self->_cacheURL = 0;
    }

    v18 = (NSString *)objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("InstanceID"));
    instanceId = self->_instanceId;
    self->_instanceId = v18;

    self->_frameworkNum = 2;
    v14 = -[DIAttachedDeviceInfo setDI2PIDWithDevice:error:](self, "setDI2PIDWithDevice:error:", v6, a4)
       || +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, CFSTR("Failed to get Daemon PID"), a4);

  }
  else
  {
    v14 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, CFSTR("Invalid or missing image URL key"), a4);
  }

  return v14;
}

- (BOOL)setDI2PIDWithDevice:(id)a3 error:(id *)a4
{
  void *v5;
  DIIOObject *v6;
  DIIOObject *v7;
  uint64_t v8;
  DIIOObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSNumber *v15;
  NSNumber *pid;
  uint64_t v18;

  v18 = -1;
  v5 = (void *)objc_msgSend(a3, "newIteratorWithOptions:error:", 0, a4);
  v6 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v5);
  if (v6)
  {
    v7 = v6;
    while (1)
    {
      if (IOObjectConformsTo(-[DIIOObject ioObj](v7, "ioObj"), "DIDeviceIOUserClient"))
      {
        v8 = -[DIIOObject copyPropertyWithClass:key:](v7, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("IOUserClientCreator"));
        if (v8)
          break;
      }
      v9 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v5);

      v7 = v9;
      if (!v9)
        goto LABEL_6;
    }
    v11 = (void *)v8;
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "scanUpToCharactersFromSet:intoString:", v13, 0);

    if (v14 && objc_msgSend(v12, "scanInteger:", &v18))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v18);
      v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      pid = self->_pid;
      self->_pid = v15;

      v10 = 1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  return v10;
}

+ (id)DI1URLWithData:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;

  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithData:encoding:", v6, 4);

  if (!v7)
  {
    v12 = CFSTR("Invalid path property (not UTF8)");
    goto LABEL_7;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v7);
  v9 = v8;
  if (!v8 || (objc_msgSend(v8, "scheme"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v7);

    v9 = (void *)v11;
    if (!v11)
    {
      v12 = CFSTR("Invalid path property (not a path or URL)");
LABEL_7:
      +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 153, v12, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

- (BOOL)fillDI1InfoWithDevice:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  NSURL *v8;
  NSURL *imageURL;
  void *v10;
  NSURL *v11;
  NSURL *shadowURL;
  BOOL v13;
  NSNumber *v14;
  NSNumber *pid;

  v6 = (void *)objc_msgSend(a3, "copyParentWithError:", a4);
  if (v6)
  {
    v7 = (void *)objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("image-path"));
    if (v7)
    {
      +[DIAttachedDeviceInfo DI1URLWithData:error:](DIAttachedDeviceInfo, "DI1URLWithData:error:", v7, a4);
      v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
      imageURL = self->_imageURL;
      self->_imageURL = v8;

      if (self->_imageURL)
      {
        v10 = (void *)objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("shadow-path"));
        if (v10
          && (+[DIAttachedDeviceInfo DI1URLWithData:error:](DIAttachedDeviceInfo, "DI1URLWithData:error:", v10, a4), v11 = (NSURL *)objc_claimAutoreleasedReturnValue(), shadowURL = self->_shadowURL, self->_shadowURL = v11, shadowURL, !self->_shadowURL))
        {
          v13 = 0;
        }
        else
        {
          v13 = 1;
          self->_frameworkNum = 1;
          v14 = (NSNumber *)objc_msgSend(v6, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("hdid-pid"));
          pid = self->_pid;
          self->_pid = v14;

          if (!self->_pid)
          {
            self->_pid = (NSNumber *)&unk_24CF1FDB8;

            v13 = 1;
          }
        }

      }
      else
      {
        v13 = 0;
      }
    }
    else
    {
      v13 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, CFSTR("Missing image path property"), a4);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (DIAttachedDeviceInfo)initWithBSDName:(id)a3 error:(id *)a4
{
  id v6;
  DIIOMedia *v7;
  id v8;
  DIAttachedDeviceInfo *v9;

  v6 = a3;
  v7 = -[DIIOMedia initWithDevName:error:]([DIIOMedia alloc], "initWithDevName:error:", v6, a4);

  if (v7)
  {
    v8 = -[DIIOMedia copyBlockDeviceWithError:](v7, "copyBlockDeviceWithError:", a4);
    if (v8)
    {
      self = -[DIAttachedDeviceInfo initWithDevice:error:](self, "initWithDevice:error:", v8, a4);
      v9 = self;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)newDI1DevicesArrayWithError:(id *)a3
{
  void *v4;
  DIIOObject *v5;
  DIIOObject *v6;
  id v7;
  DIIOObject *v8;
  DIIOObject *v9;
  void *v10;
  DIBlockDevice *v11;
  DIAttachedDeviceInfo *v12;
  DIIOObject *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DIIOObject initWithClassName:error:]([DIIOObject alloc], "initWithClassName:error:", CFSTR("IOHDIXController"), 0);
  v6 = v5;
  if (v5)
  {
    v7 = -[DIIOObject newIteratorWithOptions:error:](v5, "newIteratorWithOptions:error:", 0, a3);
    if (v7)
    {
      v8 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v7);
      if (v8)
      {
        v9 = v8;
        do
        {
          if (objc_msgSend(v7, "startedOver"))
          {
            objc_msgSend(v4, "removeAllObjects");
            objc_msgSend(v7, "setStartedOver:", 0);
          }
          -[DIIOObject ioObjectWithClassName:iterateParent:error:](v9, "ioObjectWithClassName:iterateParent:error:", CFSTR("IOHDIXHDDriveNub"), 0, a3);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = -[DIIOObject initWithDIIOObject:]([DIBlockDevice alloc], "initWithDIIOObject:", v10);
            v12 = -[DIAttachedDeviceInfo initWithDevice:error:]([DIAttachedDeviceInfo alloc], "initWithDevice:error:", v11, 0);
            if (v12)
              objc_msgSend(v4, "addObject:", v12);

          }
          v13 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v7);

          v9 = v13;
        }
        while (v13);
      }
      v14 = v4;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = v4;
  }

  return v14;
}

+ (id)newDI2DevicesArrayWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  DIBlockDevice *v8;
  DIBlockDevice *v9;
  DIAttachedDeviceInfo *v10;
  DIBlockDevice *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[DIIOObject copyDiskImagesControllerWithError:](DIIOObject, "copyDiskImagesControllerWithError:", a3);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(v5, "newIteratorWithOptions:error:", 0, a3);
    if (v7)
    {
      v8 = -[DIIOObject initWithIteratorNext:]([DIBlockDevice alloc], "initWithIteratorNext:", v7);
      if (v8)
      {
        v9 = v8;
        do
        {
          if (objc_msgSend(v7, "startedOver"))
          {
            objc_msgSend(v4, "removeAllObjects");
            objc_msgSend(v7, "setStartedOver:", 0);
          }
          if (-[DIBlockDevice diskImageDevice](v9, "diskImageDevice"))
          {
            v10 = -[DIAttachedDeviceInfo initWithDevice:error:]([DIAttachedDeviceInfo alloc], "initWithDevice:error:", v9, 0);
            if (v10)
              objc_msgSend(v4, "addObject:", v10);

          }
          v11 = -[DIIOObject initWithIteratorNext:]([DIBlockDevice alloc], "initWithIteratorNext:", v7);

          v9 = v11;
        }
        while (v11);
      }
      v12 = v4;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)newDevicesArrayWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(a1, "newDI2DevicesArrayWithError:");
  if (v5)
  {
    v6 = (void *)objc_msgSend(a1, "newDI1DevicesArrayWithError:", a3);
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v6);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[DIAttachedDeviceInfo BSDName](self, "BSDName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIAttachedDeviceInfo imageURL](self, "imageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Attached disk image device info: BSD Name [%@], image URL [%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)copyAllMountPoints
{
  void *v2;
  int v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  int v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  statfs *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v3 = getmntinfo_r_np(&v15, 2);
  if (v3)
  {
    if (v3 >= 1)
    {
      v4 = 0;
      v5 = 2168 * v3;
      do
      {
        v6 = +[DIHelpers copyDevicePathWithStatfs:](DIHelpers, "copyDevicePathWithStatfs:", &v15[v4 / 0x878]);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15[v4 / 0x878].f_mntonname);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          if (objc_msgSend(v6, "hasPrefix:", CFSTR("/dev/disk")))
            v8 = v7 == 0;
          else
            v8 = 1;
          if (!v8)
          {
            objc_msgSend(v6, "lastPathComponent");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, v9);

          }
        }

        v4 += 2168;
      }
      while (v5 != v4);
    }
    free(v15);
  }
  else
  {
    v10 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      v17 = 42;
      v18 = 2080;
      v19 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
      v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      getDIOSLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        v17 = 42;
        v18 = 2080;
        v19 = "+[DIAttachedDeviceInfo copyAllMountPoints]";
        _os_log_impl(&dword_212EB0000, v13, OS_LOG_TYPE_ERROR, "%.*s: Failed getting mounts list", buf, 0x12u);
      }

    }
    *__error() = v10;
  }
  return v2;
}

+ (id)newEntityDictWithIOMedia:(id)a3 mountPoints:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "BSDName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x24BDBCED8];
    v15 = CFSTR("BSD Name");
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("Mount Point"));

    v13 = (void *)objc_msgSend(v5, "copyPropertyWithClass:key:", objc_opt_class(), CFSTR("Content"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("Content"));

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyEntitiesList
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  DIIOMedia *v9;
  DIIOMedia *v10;
  id v11;
  DIIOMedia *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[DIAttachedDeviceInfo copyAllMountPoints](DIAttachedDeviceInfo, "copyAllMountPoints");
  -[DIAttachedDeviceInfo ioMedia](self, "ioMedia");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[DIAttachedDeviceInfo newEntityDictWithIOMedia:mountPoints:](DIAttachedDeviceInfo, "newEntityDictWithIOMedia:mountPoints:", v5, v4);

  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  -[DIAttachedDeviceInfo ioMedia](self, "ioMedia");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newIteratorWithOptions:error:", 1, 0);

  if (v8)
  {
    v9 = -[DIIOObject initWithIteratorNext:]([DIIOMedia alloc], "initWithIteratorNext:", v8);
    if (v9)
    {
      v10 = v9;
      do
      {
        if (objc_msgSend(v8, "startedOver"))
        {
          objc_msgSend(v3, "removeAllObjects");
          objc_msgSend(v8, "setStartedOver:", 0);
        }
        if (IOObjectConformsTo(-[DIIOObject ioObj](v10, "ioObj"), "IOMedia"))
        {
          v11 = +[DIAttachedDeviceInfo newEntityDictWithIOMedia:mountPoints:](DIAttachedDeviceInfo, "newEntityDictWithIOMedia:mountPoints:", v10, v4);
          if (v11)
            objc_msgSend(v3, "addObject:", v11);

        }
        v12 = -[DIIOObject initWithIteratorNext:]([DIIOMedia alloc], "initWithIteratorNext:", v8);

        v10 = v12;
      }
      while (v12);
    }
  }

  return v3;
}

- (id)toDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[7];
  _QWORD v24[8];

  v24[7] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCED8];
  v23[0] = CFSTR("BSD Name");
  -[DIAttachedDeviceInfo BSDName](self, "BSDName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("DiskImages Framework");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DIAttachedDeviceInfo frameworkNum](self, "frameworkNum"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v4;
  v23[2] = CFSTR("DiskImageURL");
  -[DIAttachedDeviceInfo imageURL](self, "imageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v6;
  v23[3] = CFSTR("Size");
  -[DIAttachedDeviceInfo mediaSize](self, "mediaSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v7;
  v23[4] = CFSTR("Preferred Block Size");
  -[DIAttachedDeviceInfo blockSize](self, "blockSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v8;
  v23[5] = CFSTR("System Entities");
  v9 = -[DIAttachedDeviceInfo copyEntitiesList](self, "copyEntitiesList");
  v24[5] = v9;
  v23[6] = CFSTR("Daemon PID");
  -[DIAttachedDeviceInfo pid](self, "pid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DIAttachedDeviceInfo shadowURL](self, "shadowURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[DIAttachedDeviceInfo shadowURL](self, "shadowURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("ShadowURL"));

  }
  -[DIAttachedDeviceInfo cacheURL](self, "cacheURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[DIAttachedDeviceInfo cacheURL](self, "cacheURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("CacheURL"));

  }
  -[DIAttachedDeviceInfo instanceId](self, "instanceId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[DIAttachedDeviceInfo instanceId](self, "instanceId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("InstanceID"));

  }
  return v12;
}

- (NSString)BSDName
{
  return self->_BSDName;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSURL)shadowURL
{
  return self->_shadowURL;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (int64_t)frameworkNum
{
  return self->_frameworkNum;
}

- (NSNumber)mediaSize
{
  return self->_mediaSize;
}

- (NSNumber)blockSize
{
  return self->_blockSize;
}

- (NSNumber)pid
{
  return self->_pid;
}

- (NSString)instanceId
{
  return self->_instanceId;
}

- (DIIOMedia)ioMedia
{
  return self->_ioMedia;
}

- (void)setIoMedia:(id)a3
{
  objc_storeStrong((id *)&self->_ioMedia, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioMedia, 0);
  objc_storeStrong((id *)&self->_instanceId, 0);
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_blockSize, 0);
  objc_storeStrong((id *)&self->_mediaSize, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_shadowURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_BSDName, 0);
}

@end
