@implementation ICFullDeviceInfo

- (ICFullDeviceInfo)init
{
  -[ICFullDeviceInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICFullDeviceInfo)initWithName:(id)a3 model:(id)a4 modelDisplayName:(id)a5 softwareVersion:(id)a6
{
  id v11;
  id v12;
  id v13;
  ICFullDeviceInfo *v14;
  ICFullDeviceInfo *v15;
  __int128 v17;
  int64_t v18;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ICFullDeviceInfo;
  v14 = -[ICMigrationDeviceInfo initWithName:](&v19, sel_initWithName_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_model, a4);
    objc_storeStrong((id *)&v15->_modelDisplayName, a5);
    objc_storeStrong((id *)&v15->_softwareVersion, a6);
    -[ICFullDeviceInfo hardwareInfoFromModelId:](v15, "hardwareInfoFromModelId:", v11);
    v15->_hardwareInfo.subVersion = v18;
    *(_OWORD *)&v15->_hardwareInfo.modelName = v17;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICFullDeviceInfo;
  -[ICFullDeviceInfo description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ICMigrationDeviceInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFullDeviceInfo model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFullDeviceInfo modelDisplayName](self, "modelDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFullDeviceInfo softwareVersion](self, "softwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICFullDeviceInfo upgradable](self, "upgradable"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[ICFullDeviceInfo upgraded](self, "upgraded"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <name: %@, model: %@, modelDisplayName: %@, OS: %@, Upgradable: %@, Upgraded: %@"), v3, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)loggableDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICFullDeviceInfo;
  -[ICFullDeviceInfo description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ICFullDeviceInfo model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFullDeviceInfo modelDisplayName](self, "modelDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICFullDeviceInfo softwareVersion](self, "softwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICFullDeviceInfo upgradable](self, "upgradable"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[ICFullDeviceInfo upgraded](self, "upgraded"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <model: %@, modelDisplayName: %@, OS: %@, Upgradable: %@, Upgraded: %@"), v3, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)upgradable
{
  _BYTE v4[24];

  -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
  return -[ICFullDeviceInfo isHardwareInfoUpgradable:](self, "isHardwareInfoUpgradable:", v4);
}

- (BOOL)isOSXDevice
{
  uint64_t v3;

  -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
  return (unint64_t)(v3 - 14) < 0xFFFFFFFFFFFFFFFBLL;
}

- (BOOL)isIOSDevice
{
  unint64_t v4;

  -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
  return (v4 < 0xF) & (0x4E00u >> v4);
}

- (BOOL)isHardwareInfoUpgradable:(ICDeviceHardwareInfo *)a3
{
  BOOL v3;
  BOOL result;

  switch(a3->modelName)
  {
    case 1uLL:
      v3 = a3->version <= 6;
      goto LABEL_10;
    case 2uLL:
      v3 = a3->version <= 0;
      goto LABEL_10;
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
      v3 = a3->version <= 2;
      goto LABEL_10;
    case 6uLL:
    case 9uLL:
      v3 = a3->version <= 4;
      goto LABEL_10;
    case 8uLL:
    case 0xBuLL:
      v3 = a3->version <= 1;
      goto LABEL_10;
    case 0xAuLL:
      v3 = a3->version <= 3;
LABEL_10:
      result = !v3;
      break;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      result = 0;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

- (BOOL)upgradableToIOS13
{
  _BYTE v4[24];

  -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
  return -[ICFullDeviceInfo isHardwareInfoUpgradableToIOS13:](self, "isHardwareInfoUpgradableToIOS13:", v4);
}

- (BOOL)isHardwareInfoUpgradableToIOS13:(ICDeviceHardwareInfo *)a3
{
  unint64_t modelName;
  BOOL v5;
  int64_t version;
  BOOL v7;
  NSObject *v8;

  modelName = a3->modelName;
  if (a3->modelName != 11)
  {
    if (modelName == 10 || modelName == 9)
    {
      v5 = a3->version <= 7;
      goto LABEL_7;
    }
LABEL_11:
    v7 = 1;
    goto LABEL_12;
  }
  version = a3->version;
  if (version != 6)
  {
    v7 = version > 6;
    if (version != 5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v5 = a3->subVersion <= 2;
LABEL_7:
  v7 = !v5;
LABEL_12:
  v8 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICFullDeviceInfo isHardwareInfoUpgradableToIOS13:].cold.1((uint64_t *)a3, v7, v8);

  return v7;
}

- (BOOL)upgradableToIOS14orMacOS11
{
  _BYTE v4[24];

  if (-[ICFullDeviceInfo isIOSDevice](self, "isIOSDevice"))
    return -[ICFullDeviceInfo upgradedToIOS13](self, "upgradedToIOS13");
  if (!-[ICFullDeviceInfo isOSXDevice](self, "isOSXDevice"))
    return 1;
  -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
  return -[ICFullDeviceInfo isHardwareInfoUpgradableToMacOS11:](self, "isHardwareInfoUpgradableToMacOS11:", v4);
}

- (BOOL)isHardwareInfoUpgradableToMacOS11:(ICDeviceHardwareInfo *)a3
{
  BOOL result;
  int64_t *p_subVersion;
  uint64_t v5;
  int64_t version;

  result = 1;
  switch(a3->modelName)
  {
    case 1uLL:
      version = a3->version;
      if (version <= 14)
      {
        if (version == 14)
        {
          p_subVersion = &a3->subVersion;
          v5 = 3;
          goto LABEL_11;
        }
        return 0;
      }
      return result;
    case 2uLL:
      v5 = 0;
      p_subVersion = &a3->version;
      goto LABEL_11;
    case 3uLL:
      p_subVersion = &a3->version;
      v5 = 6;
      goto LABEL_11;
    case 4uLL:
    case 8uLL:
      p_subVersion = &a3->version;
      v5 = 5;
      goto LABEL_11;
    case 6uLL:
      p_subVersion = &a3->version;
      v5 = 7;
      goto LABEL_11;
    case 7uLL:
      p_subVersion = &a3->version;
      v5 = 10;
LABEL_11:
      result = *p_subVersion > v5;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)upgradedToMajor:(int)a3 minor:(int)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v16;

  -[ICFullDeviceInfo softwareVersion](self, "softwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return 0;
  v8 = objc_alloc(MEMORY[0x1E0CB3900]);
  -[ICFullDeviceInfo softwareVersion](self, "softwareVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithString:", v9);

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invertedSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCharactersToBeSkipped:", v12);

  v16 = 0;
  if (!objc_msgSend(v10, "scanInt:", (char *)&v16 + 4)
    || !objc_msgSend(v10, "scanInt:", &v16))
  {
    v14 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICFullDeviceInfo upgradedToMajor:minor:].cold.1(self, v14);

    goto LABEL_11;
  }
  if (SHIDWORD(v16) <= a3 && (HIDWORD(v16) != a3 || (int)v16 < a4))
  {
LABEL_11:
    v13 = 0;
    goto LABEL_12;
  }
  v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)upgraded
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  -[ICFullDeviceInfo softwareVersion](self, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICFullDeviceInfo softwareVersion](self, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", CFSTR("OSX"));

  if (v5)
    v6 = 10;
  else
    v6 = 9;
  if (v5)
    v7 = 11;
  else
    v7 = 0;
  return -[ICFullDeviceInfo upgradedToMajor:minor:](self, "upgradedToMajor:minor:", v6, v7);
}

- (BOOL)upgradedToIOS13
{
  return !-[ICFullDeviceInfo isIOSDevice](self, "isIOSDevice")
      || -[ICFullDeviceInfo upgradedToMajor:minor:](self, "upgradedToMajor:minor:", 13, 0);
}

- (BOOL)upgradedToIOS14EorMacOS11E
{
  ICFullDeviceInfo *v3;
  uint64_t v4;
  uint64_t v5;

  if (-[ICFullDeviceInfo isIOSDevice](self, "isIOSDevice"))
  {
    v3 = self;
    v4 = 14;
    v5 = 5;
    return -[ICFullDeviceInfo upgradedToMajor:minor:](v3, "upgradedToMajor:minor:", v4, v5);
  }
  if (-[ICFullDeviceInfo isOSXDevice](self, "isOSXDevice"))
  {
    v3 = self;
    v4 = 11;
    v5 = 3;
    return -[ICFullDeviceInfo upgradedToMajor:minor:](v3, "upgradedToMajor:minor:", v4, v5);
  }
  return 1;
}

- (ICDeviceHardwareInfo)hardwareInfoFromModelId:(SEL)a3
{
  ICDeviceHardwareInfo *result;
  ICDeviceHardwareInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int64_t v23;
  uint64_t v24;

  result = (ICDeviceHardwareInfo *)a4;
  retstr->version = 0;
  retstr->subVersion = 0;
  retstr->modelName = 0;
  if (result)
  {
    v7 = result;
    -[ICDeviceHardwareInfo lowercaseString](result, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0;
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("([a-z]+)([0-9]+),([0-9]+)"), 1, &v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && objc_msgSend(v10, "numberOfRanges") == 4)
    {
      v12 = objc_msgSend(v11, "rangeAtIndex:", 1);
      objc_msgSend(v8, "substringWithRange:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[ICFullDeviceInfo hardwareInfoNameFromString:](self, "hardwareInfoNameFromString:", v14);
      retstr->modelName = v15;
      if (v15)
      {
        v16 = objc_msgSend(v11, "rangeAtIndex:", 2);
        objc_msgSend(v8, "substringWithRange:", v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "integerValue");

        v20 = objc_msgSend(v11, "rangeAtIndex:", 3);
        objc_msgSend(v8, "substringWithRange:", v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "integerValue");

        retstr->version = v19;
        retstr->subVersion = v23;
      }

    }
  }
  return result;
}

- (unint64_t)hardwareInfoNameFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("imac")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("imacpro")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macmini")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macpro")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("xserve")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macbook")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macbookair")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macbookpro")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ipod")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iphone")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ipad")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("appletv")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("audioaccessory")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("realitydevice")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)shouldBeHidden
{
  void *v3;
  BOOL v4;
  uint64_t v6;
  uint64_t v7;

  -[ICFullDeviceInfo softwareVersion](self, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("OSX")) & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("iOS"))
         && (-[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo"), v7 != 12))
  {
    -[ICFullDeviceInfo hardwareInfo](self, "hardwareInfo");
    v4 = v6 == 13;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (ICDeviceHardwareInfo)hardwareInfo
{
  *retstr = self[2];
  return self;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)modelDisplayName
{
  return self->_modelDisplayName;
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_modelDisplayName, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)isHardwareInfoUpgradableToIOS13:(os_log_t)log .cold.1(uint64_t *a1, char a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = a1[1];
  v5 = CFSTR("N");
  v6 = 134218498;
  if ((a2 & 1) != 0)
    v5 = CFSTR("Y");
  v7 = v3;
  v8 = 2048;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "isHardwareInfoUpgradableToIOS13 %lu %ld %@", (uint8_t *)&v6, 0x20u);
}

- (void)upgradedToMajor:(void *)a1 minor:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Failed to scan softwareVersion: %@", (uint8_t *)&v4, 0xCu);

}

@end
