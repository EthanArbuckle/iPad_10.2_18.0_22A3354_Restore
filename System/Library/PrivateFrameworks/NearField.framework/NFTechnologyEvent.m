@implementation NFTechnologyEvent

- (NFTechnologyEvent)initWithTechnology:(unsigned int)a3 andValueAddedServiceMode:(unsigned int)a4 andSystemCode:(unsigned __int16)a5
{
  unsigned __int8 v6;
  NFTechnologyEvent *result;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)NFTechnologyEvent;
  result = -[NFTechnologyEvent init](&v9, sel_init);
  if (result)
  {
    result->_technology = a3;
    result->_valueAddedServiceMode = v6;
    result->_systemCode = a5;
  }
  return result;
}

- (NFTechnologyEvent)initWithDictionary:(id)a3
{
  id v4;
  NFTechnologyEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NFTechnologyEvent;
  v5 = -[NFTechnologyEvent init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("technologyMask"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_technology = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("valueAddedServiceMode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_valueAddedServiceMode = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_systemCode = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vasSupported"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_vasSupported = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("terminalType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_terminalType = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("touchIDRequired"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_touchIDRequired = objc_msgSend(v11, "BOOLValue");

  }
  return v5;
}

- (NFTechnologyEvent)initWithTechnology:(unsigned int)a3 andValueAddedServiceMode:(unsigned int)a4
{
  unsigned __int8 v4;
  NFTechnologyEvent *result;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)NFTechnologyEvent;
  result = -[NFTechnologyEvent init](&v7, sel_init);
  if (result)
  {
    result->_technology = a3;
    result->_valueAddedServiceMode = v4;
  }
  return result;
}

- (NFTechnologyEvent)initWithFieldNotification:(id)a3
{
  id v4;
  NFTechnologyEvent *v5;
  id v6;
  unsigned int v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFTechnologyEvent;
  v5 = -[NFTechnologyEvent init](&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "notificationType") == 1)
    {
      v5->_technology = objc_msgSend(v4, "rfTechnology");
      v5->_valueAddedServiceMode = 4;
      v5->_systemCode = objc_msgSend(v4, "typeFSystemCode");
    }
    else if (objc_msgSend(v4, "notificationType") == 2)
    {
      v6 = v4;
      v5->_technology = objc_msgSend(v6, "rfTechnology");
      v5->_valueAddedServiceMode = objc_msgSend(v6, "terminalMode");
      v5->_systemCode = objc_msgSend(v6, "typeFSystemCode");
      v5->_vasSupported = objc_msgSend(v6, "terminalMode") != 4;
      v5->_touchIDRequired = objc_msgSend(v6, "odaRequired");
      v7 = objc_msgSend(v6, "terminalType");

      v5->_terminalType = v7;
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)description
{
  unsigned int technology;
  id v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  void *v22;
  uint64_t v24;
  objc_super v25;
  objc_super v26;

  technology = self->_technology;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  if ((technology & 4) != 0)
  {
    v26.receiver = self;
    v26.super_class = (Class)NFTechnologyEvent;
    -[NFTechnologyEvent description](&v26, sel_description);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_technology;
    v16 = v15 & 1;
    v17 = (v15 >> 1) & 1;
    v18 = (v15 >> 2) & 1;
    v19 = (v15 >> 3) & 1;
    v20 = "YES";
    if (self->_vasSupported)
      v21 = "YES";
    else
      v21 = "NO";
    if (!self->_touchIDRequired)
      v20 = "NO";
    v14 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ { A=%d B=%d, F=%d SystemCode=0x%04x, VAS=%d, VAS Mode=0x%04x, VAS Supported=%s, TerminalType=%d, TouchIDRequired=%s }"), v6, v16, v17, v18, self->_systemCode, v19, self->_valueAddedServiceMode, v21, self->_terminalType, v20);
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)NFTechnologyEvent;
    -[NFTechnologyEvent description](&v25, sel_description);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = self->_technology;
    v8 = v7 & 1;
    v9 = (v7 >> 1) & 1;
    v10 = (v7 >> 2) & 1;
    v11 = (v7 >> 3) & 1;
    v12 = "YES";
    if (self->_vasSupported)
      v13 = "YES";
    else
      v13 = "NO";
    if (!self->_touchIDRequired)
      v12 = "NO";
    v14 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@ { A=%d B=%d, F=%d, ECP=%d, VAS Mode=0x%04x, VAS Supported=%s, TerminalType=%d, TouchIDRequired=%s }"), v5, v8, v9, v10, v11, self->_valueAddedServiceMode, v13, self->_terminalType, v12, v24);
  }
  v22 = (void *)v14;

  return v22;
}

- (NFTechnologyEvent)initWithCoder:(id)a3
{
  id v4;
  NFTechnologyEvent *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NFTechnologyEvent;
  v5 = -[NFTechnologyEvent init](&v7, sel_init);
  if (v5)
  {
    v5->_technology = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("technologyMask"));
    v5->_valueAddedServiceMode = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("valueAddedServiceMode"));
    v5->_systemCode = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("systemCode"));
    v5->_vasSupported = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("vasSupported"));
    v5->_touchIDRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("touchIDRequired"));
    v5->_terminalType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("terminalType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t technology;
  id v5;

  technology = self->_technology;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", technology, CFSTR("technologyMask"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_valueAddedServiceMode, CFSTR("valueAddedServiceMode"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_systemCode, CFSTR("systemCode"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_vasSupported, CFSTR("vasSupported"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_touchIDRequired, CFSTR("touchIDRequired"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_terminalType, CFSTR("terminalType"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)technology
{
  return self->_technology;
}

- (unsigned)valueAddedServiceMode
{
  return self->_valueAddedServiceMode;
}

- (unsigned)systemCode
{
  return self->_systemCode;
}

- (BOOL)vasSupported
{
  return self->_vasSupported;
}

- (BOOL)touchIDRequired
{
  return self->_touchIDRequired;
}

- (unsigned)terminalType
{
  return self->_terminalType;
}

@end
