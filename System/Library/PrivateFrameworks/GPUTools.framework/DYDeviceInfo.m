@implementation DYDeviceInfo

+ (BOOL)isSimulatorPlatform:(int)a3
{
  return (a3 < 0xB) & (0x448u >> a3);
}

+ (unsigned)defaultNativePointerSize
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYDeviceInfo)initWithCoder:(id)a3
{
  DYDeviceInfo *v4;
  double v5;
  unsigned int v6;
  int platform;
  int v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DYDeviceInfo;
  v4 = -[DYDeviceInfo init](&v10, sel_init);
  if (v4)
  {
    v4->_permanentIdentifier = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v4->_runtimeIdentifier = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("runtimeIdentifier"));
    v4->_name = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v4->_productType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productType"));
    v4->_version = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
    v4->_build = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
    v4->_platform = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("platform"));
    v4->_metalVersion = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metalVersion"));
    v4->_mainScreenDescriptor.width = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("mainScreenResolution.width"));
    v4->_mainScreenDescriptor.height = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("mainScreenResolution.height"));
    v4->_mainScreenDescriptor.scale = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("mainScreenResolution.scale"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("mainScreenDescriptor.orientation"));
    v4->_mainScreenDescriptor.orientation = v5;
    v4->_mainScreenDescriptor.type = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("mainScreenDescriptor.type"));
    v4->_supportedGraphicsAPIInfos = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x24BE39120], "graphicsAPIInfosClassSet"), CFSTR("supportedGLProfileContextsInfo"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("nativePointerSize")))
      v6 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("nativePointerSize"));
    else
      v6 = +[DYDeviceInfo defaultNativePointerSize](DYDeviceInfo, "defaultNativePointerSize");
    v4->_nativePointerSize = v6;
    platform = v4->_platform;
    if (platform == 7)
    {
      v8 = 9;
      goto LABEL_9;
    }
    if (platform == 8)
    {
      v8 = 10;
LABEL_9:
      v4->_platform = v8;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYDeviceInfo;
  -[DYDeviceInfo dealloc](&v3, sel_dealloc);
}

- (id)descriptionWithProfileName:(id)a3 showingProductType:(BOOL)a4 showingPermanentIdentifier:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v9;
  void *v10;
  unsigned int v11;

  v5 = a5;
  v6 = a4;
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = v9;
  if (self->_name)
    objc_msgSend(v9, "addObject:");
  if (!v6)
  {
    if (!self->_name)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (-[NSString length](self->_productType, "length"))
    objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), self->_productType));
  if (self->_name || -[NSString length](self->_productType, "length"))
LABEL_10:
    objc_msgSend(v10, "addObject:", CFSTR("-"));
LABEL_11:
  if (a3)
  {
    objc_msgSend(v10, "addObject:", a3);
    objc_msgSend(v10, "addObject:", CFSTR("-"));
  }
  v11 = self->_platform - 1;
  if (v11 <= 9 && ((0x33Fu >> v11) & 1) != 0)
    objc_msgSend(v10, "addObject:", off_250D58E58[v11]);
  if (self->_version)
    objc_msgSend(v10, "addObject:");
  if (self->_build)
    objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@)"), self->_build));
  if (v5 && -[NSString length](self->_permanentIdentifier, "length"))
  {
    objc_msgSend(v10, "addObject:", CFSTR("-"));
    objc_msgSend(v10, "addObject:", self->_permanentIdentifier);
  }
  return (id)objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" "));
}

- (id)description
{
  return -[DYDeviceInfo descriptionWithProfileName:showingProductType:showingPermanentIdentifier:](self, "descriptionWithProfileName:showingProductType:showingPermanentIdentifier:", 0, 1, 1);
}

- (NSString)summaryForBugReport
{
  unsigned int v2;
  __CFString *v3;

  v2 = self->_platform - 1;
  if (v2 > 9)
    v3 = 0;
  else
    v3 = off_250D58EA8[v2];
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@ %@ (%@)"), self->_productType, v3, self->_version, self->_build);
}

- (NSString)descriptionForBugReport
{
  id v3;
  NSArray *supportedGraphicsAPIInfos;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), -[DYDeviceInfo description](self, "description"));
  if (self->_hostProductType)
    objc_msgSend(v3, "appendFormat:", CFSTR("Simulator host device: %@ - %@\n"), self->_hostProductType, self->_hostVersion);
  objc_msgSend(v3, "appendFormat:", CFSTR("Metal version: %@\n"), self->_metalVersion);
  if (-[NSArray count](self->_supportedGraphicsAPIInfos, "count"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("Supported graphics APIs:\n"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    supportedGraphicsAPIInfos = self->_supportedGraphicsAPIInfos;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](supportedGraphicsAPIInfos, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(supportedGraphicsAPIInfos);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v10 = objc_msgSend(v9, "descriptionForBugReport");
          else
            v10 = objc_msgSend(v9, "description");
          objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), v10);
          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](supportedGraphicsAPIInfos, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
  }
  return (NSString *)v3;
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYDeviceInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\trid=%llu\n\tpid=%@\n\tname=%@\n\tproductType=%@\nhostProductType=%@\tplatform=%d\n\tmetalVersion=%@\n\tversion=%@\n\thostVersion=%@\n\tbuild=%@\n\tnativePointerSize=%u\n\t_supportedGraphicsAPIInfos=%@"), -[DYDeviceInfo debugDescription](&v3, sel_debugDescription), self->_runtimeIdentifier, -[NSString debugDescription](self->_permanentIdentifier, "debugDescription"), -[NSString debugDescription](self->_name, "debugDescription"), -[NSString debugDescription](self->_productType, "debugDescription"), -[NSString debugDescription](self->_hostProductType, "debugDescription"), self->_platform, -[NSString debugDescription](self->_metalVersion, "debugDescription"), -[NSString debugDescription](self->_version, "debugDescription"), -[NSString debugDescription](self->_hostVersion, "debugDescription"), -[NSString debugDescription](self->_build, "debugDescription"), self->_nativePointerSize, -[NSArray debugDescription](self->_supportedGraphicsAPIInfos, "debugDescription"));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_permanentIdentifier, CFSTR("identifier"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_runtimeIdentifier, CFSTR("runtimeIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_build, CFSTR("build"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_platform, CFSTR("platform"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_metalVersion, CFSTR("metalVersion"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_mainScreenDescriptor.width, CFSTR("mainScreenResolution.width"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_mainScreenDescriptor.height, CFSTR("mainScreenResolution.height"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_mainScreenDescriptor.scale, CFSTR("mainScreenResolution.scale"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("mainScreenDescriptor.orientation"), self->_mainScreenDescriptor.orientation);
  objc_msgSend(a3, "encodeInt32:forKey:", self->_mainScreenDescriptor.type, CFSTR("mainScreenDescriptor.type"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_supportedGraphicsAPIInfos, CFSTR("supportedGLProfileContextsInfo"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_nativePointerSize, CFSTR("nativePointerSize"));
}

- (BOOL)isEmbeddedPlatform
{
  return -[DYDeviceInfo platform](self, "platform") != 1;
}

- (BOOL)versionIsOlderThan:(id)a3
{
  return -[NSString dy_versionIsOlderThan:](self->_version, "dy_versionIsOlderThan:", a3);
}

- (BOOL)supportsCapabilitiesOfGraphicsAPI:(id)a3 allowedClass:(Class)a4
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    -[DYDeviceInfo supportsCapabilitiesOfGraphicsAPI:allowedClass:].cold.1();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[DYDeviceInfo supportedGraphicsAPIInfos](self, "supportedGraphicsAPIInfos", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(v10, "supportsCapabilitiesOfGraphicsAPI:", a3) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return v6;
}

- (int)platform
{
  return self->_platform;
}

- (void)setPlatform:(int)a3
{
  self->_platform = a3;
}

- (unint64_t)runtimeIdentifier
{
  return self->_runtimeIdentifier;
}

- (void)setRuntimeIdentifier:(unint64_t)a3
{
  self->_runtimeIdentifier = a3;
}

- (NSString)permanentIdentifier
{
  return self->_permanentIdentifier;
}

- (void)setPermanentIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)hostProductType
{
  return self->_hostProductType;
}

- (void)setHostProductType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)hostVersion
{
  return self->_hostVersion;
}

- (void)setHostVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSString)metalVersion
{
  return self->_metalVersion;
}

- (void)setMetalVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (unsigned)nativePointerSize
{
  return self->_nativePointerSize;
}

- (void)setNativePointerSize:(unsigned int)a3
{
  self->_nativePointerSize = a3;
}

- ($16123236EB3C150F368AB57B9BCDCA0E)mainScreenDescriptor
{
  *($F47FE06625FC0D634ED89CCC9D0BEEDA *)retstr = ($F47FE06625FC0D634ED89CCC9D0BEEDA)self[4];
  return self;
}

- (void)setMainScreenDescriptor:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_mainScreenDescriptor.scale = *(_QWORD *)&a3->var3;
  *(_OWORD *)&self->_mainScreenDescriptor.orientation = v3;
}

- (NSArray)supportedGraphicsAPIInfos
{
  return self->_supportedGraphicsAPIInfos;
}

- (void)setSupportedGraphicsAPIInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (void)supportsCapabilitiesOfGraphicsAPI:allowedClass:.cold.1()
{
  __assert_rtn("-[DYDeviceInfo supportsCapabilitiesOfGraphicsAPI:allowedClass:]", ", 0, "graphicsAPIInfo");
}

@end
