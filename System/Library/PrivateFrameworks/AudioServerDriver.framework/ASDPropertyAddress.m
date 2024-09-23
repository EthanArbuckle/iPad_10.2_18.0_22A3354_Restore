@implementation ASDPropertyAddress

- (ASDPropertyAddress)initWithAddress:(AudioObjectPropertyAddress)a3
{
  AudioObjectPropertyElement mElement;
  uint64_t v4;
  ASDPropertyAddress *result;
  objc_super v6;

  mElement = a3.mElement;
  v4 = *(_QWORD *)&a3.mSelector;
  v6.receiver = self;
  v6.super_class = (Class)ASDPropertyAddress;
  result = -[ASDPropertyAddress init](&v6, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_audioObjectPropertyAddress.mSelector = v4;
    result->_audioObjectPropertyAddress.mElement = mElement;
  }
  return result;
}

- (ASDPropertyAddress)initWithSelector:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5
{
  ASDPropertyAddress *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASDPropertyAddress;
  result = -[ASDPropertyAddress init](&v9, sel_init);
  if (result)
  {
    result->_audioObjectPropertyAddress.mSelector = a3;
    result->_audioObjectPropertyAddress.mScope = a4;
    result->_audioObjectPropertyAddress.mElement = a5;
  }
  return result;
}

- (ASDPropertyAddress)initWithDictionary:(id)a3
{
  id v4;
  ASDPropertyAddress *v5;
  ASDPropertyAddress *v6;
  uint8_t v8[16];
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDPropertyAddress;
  v5 = -[ASDPropertyAddress init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v4, "fourCharCode:forKey:", &v5->_audioObjectPropertyAddress, CFSTR("Selector")) & 1) != 0)
    {
      if ((objc_msgSend(v4, "fourCharCode:forKey:", &v6->_audioObjectPropertyAddress.mScope, CFSTR("Scope")) & 1) == 0)
        v6->_audioObjectPropertyAddress.mScope = 1735159650;
      objc_msgSend(v4, "fourCharCode:forKey:", &v6->_audioObjectPropertyAddress.mElement, CFSTR("Element"));
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Couldn't create ASDPropertyAddress: bad selector in dictionary", v8, 2u);
      }

      v6 = 0;
    }
  }

  return v6;
}

- (unsigned)selector
{
  return self->_audioObjectPropertyAddress.mSelector;
}

- (unsigned)scope
{
  return self->_audioObjectPropertyAddress.mScope;
}

- (unsigned)element
{
  return self->_audioObjectPropertyAddress.mElement;
}

- (BOOL)isEqual:(id)a3
{
  ASDPropertyAddress *v4;
  ASDPropertyAddress *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;

  v4 = (ASDPropertyAddress *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[ASDPropertyAddress selector](v5, "selector");
      if (v6 == -[ASDPropertyAddress selector](self, "selector")
        && (v7 = -[ASDPropertyAddress scope](v5, "scope"), v7 == -[ASDPropertyAddress scope](self, "scope")))
      {
        v8 = -[ASDPropertyAddress element](v5, "element");
        v9 = v8 == -[ASDPropertyAddress element](self, "element");
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
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLong:", -[ASDPropertyAddress selector](self, "selector"));
  v4 = objc_msgSend(v3, "hash");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLong:", -[ASDPropertyAddress scope](self, "scope"));
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLong:", -[ASDPropertyAddress element](self, "element"));
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  unsigned int v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[ASDPropertyAddress audioObjectPropertyAddress](self, "audioObjectPropertyAddress");
  return (id)objc_msgSend(v4, "initWithAddress:", v5, v6);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if ((int)-[ASDPropertyAddress selector](self, "selector") < 0x20000000
    || (int)-[ASDPropertyAddress selector](self, "selector") > 2130706431)
  {
    v4 = 32;
  }
  else
  {
    v4 = ((int)-[ASDPropertyAddress selector](self, "selector") >> 24);
  }
  if ((int)(-[ASDPropertyAddress selector](self, "selector") << 8) < 0x20000000
    || (int)(-[ASDPropertyAddress selector](self, "selector") << 8) > 2130706431)
  {
    v5 = 32;
  }
  else
  {
    v5 = ((int)(-[ASDPropertyAddress selector](self, "selector") << 8) >> 24);
  }
  if ((int)(-[ASDPropertyAddress selector](self, "selector") << 16) < 0x20000000
    || (int)(-[ASDPropertyAddress selector](self, "selector") << 16) > 2130706431)
  {
    v6 = 32;
  }
  else
  {
    v6 = ((__int16)-[ASDPropertyAddress selector](self, "selector") >> 8);
  }
  if ((int)(-[ASDPropertyAddress selector](self, "selector") << 24) < 520093697
    || -[ASDPropertyAddress selector](self, "selector") == 127)
  {
    v7 = 32;
  }
  else
  {
    v7 = (char)-[ASDPropertyAddress selector](self, "selector");
  }
  if ((int)-[ASDPropertyAddress scope](self, "scope") < 0x20000000
    || (int)-[ASDPropertyAddress scope](self, "scope") > 2130706431)
  {
    v8 = 32;
  }
  else
  {
    v8 = ((int)-[ASDPropertyAddress scope](self, "scope") >> 24);
  }
  if ((int)(-[ASDPropertyAddress scope](self, "scope") << 8) < 0x20000000
    || (int)(-[ASDPropertyAddress scope](self, "scope") << 8) > 2130706431)
  {
    v9 = 32;
  }
  else
  {
    v9 = ((int)(-[ASDPropertyAddress scope](self, "scope") << 8) >> 24);
  }
  if ((int)(-[ASDPropertyAddress scope](self, "scope") << 16) < 0x20000000
    || (int)(-[ASDPropertyAddress scope](self, "scope") << 16) > 2130706431)
  {
    v10 = 32;
  }
  else
  {
    v10 = ((__int16)-[ASDPropertyAddress scope](self, "scope") >> 8);
  }
  if ((int)(-[ASDPropertyAddress scope](self, "scope") << 24) < 520093697
    || -[ASDPropertyAddress scope](self, "scope") == 127)
  {
    v11 = 32;
  }
  else
  {
    v11 = (char)-[ASDPropertyAddress scope](self, "scope");
  }
  v18 = v11;
  v19 = v9;
  if ((int)-[ASDPropertyAddress element](self, "element") < 0x20000000
    || (int)-[ASDPropertyAddress element](self, "element") > 2130706431)
  {
    v12 = 32;
  }
  else
  {
    v12 = ((int)-[ASDPropertyAddress element](self, "element") >> 24);
  }
  if ((int)(-[ASDPropertyAddress element](self, "element") << 8) < 0x20000000
    || (int)(-[ASDPropertyAddress element](self, "element") << 8) > 2130706431)
  {
    v13 = 32;
  }
  else
  {
    v13 = ((int)(-[ASDPropertyAddress element](self, "element") << 8) >> 24);
  }
  v17 = v4;
  if ((int)(-[ASDPropertyAddress element](self, "element") << 16) < 0x20000000
    || (int)(-[ASDPropertyAddress element](self, "element") << 16) > 2130706431)
  {
    v14 = 32;
  }
  else
  {
    v14 = ((__int16)-[ASDPropertyAddress element](self, "element") >> 8);
  }
  if ((int)(-[ASDPropertyAddress element](self, "element") << 24) < 520093697
    || -[ASDPropertyAddress element](self, "element") == 127)
  {
    v15 = 32;
  }
  else
  {
    v15 = (char)-[ASDPropertyAddress element](self, "element");
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("selector:%c%c%c%c scope:%c%c%c%c element:%c%c%c%c"), v17, v5, v6, v7, v8, v19, v10, v18, v12, v13, v14, v15);
}

- (AudioObjectPropertyAddress)audioObjectPropertyAddress
{
  AudioObjectPropertyElement mElement;
  uint64_t v3;
  AudioObjectPropertyAddress result;

  mElement = self->_audioObjectPropertyAddress.mElement;
  v3 = *(_QWORD *)&self->_audioObjectPropertyAddress.mSelector;
  result.mSelector = v3;
  result.mScope = HIDWORD(v3);
  result.mElement = mElement;
  return result;
}

@end
