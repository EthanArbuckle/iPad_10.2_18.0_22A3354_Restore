@implementation COConstituent

- (COConstituent)initWithType:(unint64_t)a3
{
  COConstituent *v4;
  COConstituent *v5;
  uint64_t v6;
  NSUUID *identifier;
  NSString *software;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFDictionary *v17;
  const __CFDictionary *v18;
  io_service_t MatchingService;
  io_object_t v20;
  CFTypeRef CFProperty;
  mach_port_t mainPort;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)COConstituent;
  v4 = -[COConstituent init](&v23, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    -[COConstituent _timeAwareUUID](v4, "_timeAwareUUID");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    software = v5->_software;
    v5->_software = (NSString *)CFSTR("229.0.3");

    v5->_flags = 0xFFFFFFFF80000000;
    v9 = MGCopyAnswer();
    if (v9)
    {
      v10 = (void *)v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "intValue");
        v5->_device = v11 & ~(v11 >> 31);
      }
      CFRelease(v10);
    }
    v12 = MGCopyAnswer();
    if (v12)
    {
      v13 = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v13, "BOOLValue") & 1) == 0)
        v5->_flags |= 1uLL;
      CFRelease(v13);
    }
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "thermalState");

    if ((v15 & 0xFFFFFFFFFFFFFFFELL) == 2)
      v5->_flags |= 2uLL;
    mainPort = 0;
    if (!MEMORY[0x2199F38D8](0, &mainPort))
    {
      v17 = IOServiceMatching("IOEthernetInterface");
      if (v17)
      {
        v18 = v17;
        CFDictionarySetValue(v17, CFSTR("IOPropertyMatch"), &unk_24D4CF480);
        MatchingService = IOServiceGetMatchingService(mainPort, v18);
        if (MatchingService)
        {
          v20 = MatchingService;
          CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IO80211SSID"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
          if (CFProperty)
            CFRelease(CFProperty);
          else
            v5->_flags |= 4uLL;
          IOObjectRelease(v20);
        }
      }
    }
  }
  return v5;
}

- (COConstituent)init
{
  return -[COConstituent initWithType:](self, "initWithType:", -1);
}

- (COConstituent)initWithCoder:(id)a3
{
  id v4;
  COConstituent *v5;
  uint64_t v6;
  NSUUID *identifier;
  uint64_t v8;
  NSString *software;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  objc_super v20;

  v4 = a3;
  if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version")) == 1)
  {
    v20.receiver = self;
    v20.super_class = (Class)COConstituent;
    v5 = -[COConstituent init](&v20, sel_init);
    if (v5)
    {
      v5->_type = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v6 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sw"));
      v8 = objc_claimAutoreleasedReturnValue();
      software = v5->_software;
      v5->_software = (NSString *)v8;

      v10 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("dc"));
      if (v10 < 0)
        v11 = -1;
      else
        v11 = v10;
      if (v11 >= 9)
        v11 = 9;
      if (!v11)
        v11 = -1;
      v5->_device = v11;
      v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pr")) ^ 1;
      v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tr"));
      v14 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wn"));
      v15 = 2;
      if (v13)
        v15 = 0;
      v16 = 4;
      if (!v14)
        v16 = 0;
      v5->_flags = v15 | v16 | v12;
      if (objc_msgSend(v4, "containsValueForKey:", CFSTR("bo")))
      {
        v17 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("bo"));
        v18 = 0xFFFFFFFF80000000;
        if (!v17)
          v18 = 0;
        v5->_flags |= v18;
      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", 1, CFSTR("version"));
  objc_msgSend(v6, "encodeInt64:forKey:", -[COConstituent type](self, "type"), CFSTR("type"));
  -[COConstituent identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[COConstituent software](self, "software");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("sw"));

  objc_msgSend(v6, "encodeInt:forKey:", -[COConstituent device](self, "device"), CFSTR("dc"));
  objc_msgSend(v6, "encodeBool:forKey:", -[COConstituent isPowerRisk](self, "isPowerRisk") ^ 1, CFSTR("pr"));
  objc_msgSend(v6, "encodeBool:forKey:", -[COConstituent isThermalRisk](self, "isThermalRisk") ^ 1, CFSTR("tr"));
  objc_msgSend(v6, "encodeBool:forKey:", -[COConstituent isWired](self, "isWired"), CFSTR("wn"));
  objc_msgSend(v6, "encodeBool:forKey:", -[COConstituent supportsBackoff](self, "supportsBackoff"), CFSTR("bo"));

}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[COConstituent type](self, "type");
  -[COConstituent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%016llX-%@-%08llX"), v4, v5, -[COConstituent flags](self, "flags"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isPowerRisk
{
  return -[COConstituent flags](self, "flags") & 1;
}

- (BOOL)isThermalRisk
{
  return (-[COConstituent flags](self, "flags") >> 1) & 1;
}

- (BOOL)isWired
{
  return (-[COConstituent flags](self, "flags") >> 2) & 1;
}

- (BOOL)isEqual:(id)a3
{
  COConstituent *v4;
  BOOL v5;

  v4 = (COConstituent *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[COConstituent compare:](self, "compare:", v4) == 0;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[COConstituent identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)supportsBackoff
{
  return (-[COConstituent flags](self, "flags") & 0xFFFFFFFF80000000) != 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[8];
  _QWORD v14[9];

  v14[8] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[COConstituent type](self, "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("identifier");
  -[COConstituent identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("sw");
  -[COConstituent software](self, "software");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("dc");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[COConstituent device](self, "device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  v13[4] = CFSTR("pr");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[COConstituent isPowerRisk](self, "isPowerRisk") ^ 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  v13[5] = CFSTR("tr");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[COConstituent isThermalRisk](self, "isThermalRisk") ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  v13[6] = CFSTR("wn");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[COConstituent isWired](self, "isWired"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v9;
  v13[7] = CFSTR("bo");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[COConstituent supportsBackoff](self, "supportsBackoff"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v34;
  COConstituent *v35;
  void *v36;

  v4 = a3;
  v5 = -[COConstituent type](self, "type");
  v6 = objc_msgSend(v4, "type");
  if (v5 == v6)
  {
    -[COConstituent software](self, "software");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "software");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v8;
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "count");
    v12 = objc_msgSend(v10, "count");
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    if (v13)
    {
      v14 = v12;
      v34 = v7;
      v35 = self;
      v15 = 0;
      while (1)
      {
        if (v15 >= v11)
        {
          v17 = 0;
        }
        else
        {
          objc_msgSend(v9, "objectAtIndex:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue");

        }
        if (v15 >= v14)
        {
          v19 = 0;
        }
        else
        {
          objc_msgSend(v10, "objectAtIndex:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "integerValue");

        }
        if (v17 != v19)
          break;
        if (v13 == ++v15)
        {
          v20 = 0;
          goto LABEL_23;
        }
      }
      if (v17 < v19)
        v20 = 1;
      else
        v20 = -1;
LABEL_23:
      v7 = v34;
      self = v35;
    }
    else
    {
      v20 = 0;
    }

    if (!v20)
    {
      v21 = -[COConstituent device](self, "device");
      v22 = objc_msgSend(v4, "device");
      v23 = _COConstituentCompareDeviceClasses_rankings[v21 + 1];
      v24 = _COConstituentCompareDeviceClasses_rankings[v22 + 1];
      v20 = v23 < v24 ? -1 : 1;
      if (v23 == v24)
      {
        v25 = -[COConstituent flags](self, "flags");
        v26 = objc_msgSend(v4, "flags");
        v27 = v26 & 1;
        v28 = (v25 >> 1) & 1;
        v29 = (v26 >> 1) & 1;
        if ((v25 & 1) == (v26 & 1) && ((v26 >> 2) & 1) == ((v25 >> 2) & 1) && v28 == (_DWORD)v29)
        {
          -[COConstituent identifier](self, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v30, "co_compare:", v31);

        }
        else
        {
          if (v28 == (_DWORD)v29)
          {
            if ((v25 & 1) == (_DWORD)v27)
              v32 = (v25 & 4) == 0;
            else
              v32 = v27 == 0;
          }
          else
          {
            v32 = (v26 & 2) == 0;
          }
          if (v32)
            v20 = 1;
          else
            v20 = -1;
        }
      }
    }
  }
  else if (v5 < v6)
  {
    v20 = -1;
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

- (id)_timeAwareUUID
{
  double v2;
  double v3;
  NSObject *v4;
  uint64_t v5;
  double v6;
  void *v8;
  double v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  _BYTE v14[12];
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v3 = v2;
  if (v2 < 0.0)
  {
    COCoreLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_215E92000, v4, OS_LOG_TYPE_DEFAULT, "Clock not synchronized, going to poll.", v14, 2u);
    }

  }
  if (v3 < 0.0)
  {
    v5 = 14;
    do
    {
      sleep(2u);
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    }
    while (v6 < 0.0 && v5-- != 0);
    v3 = v6;
  }
  if (v3 >= 0.0)
  {
    COCoreLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)v14 = 134217984;
    *(_QWORD *)&v14[4] = (unint64_t)v3;
    v11 = "Clock synchronized. time = %llu";
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v3 = v9;

    COCoreLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)v14 = 134217984;
    *(_QWORD *)&v14[4] = (unint64_t)v3;
    v11 = "Clock not synchronized. Using distant future %llu";
  }
  _os_log_impl(&dword_215E92000, v10, OS_LOG_TYPE_DEFAULT, v11, v14, 0xCu);
LABEL_19:

  if ((objc_msgSend(MEMORY[0x24BE19E30], "isFastFoldEnabled") & 1) != 0)
  {
    *(_QWORD *)v14 = bswap64((unint64_t)v3);
    *(_DWORD *)&v14[8] = bswap32(arc4random());
    v15 = bswap32(arc4random());
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)software
{
  return self->_software;
}

- (void)setSoftware:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)device
{
  return self->_device;
}

- (void)setDevice:(int)a3
{
  self->_device = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_software, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
