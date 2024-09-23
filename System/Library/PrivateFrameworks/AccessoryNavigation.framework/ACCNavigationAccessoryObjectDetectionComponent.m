@implementation ACCNavigationAccessoryObjectDetectionComponent

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t identifier;
  NSString *name;
  void *v8;
  int isEnabled;
  NSArray *supportedTypes;
  void *v11;
  char v12;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    identifier = self->_identifier;
    if (identifier == objc_msgSend(v5, "identifier"))
    {
      name = self->_name;
      objc_msgSend(v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](name, "isEqualToString:", v8)
        && (isEnabled = self->_isEnabled, isEnabled == objc_msgSend(v5, "isEnabled")))
      {
        supportedTypes = self->_supportedTypes;
        objc_msgSend(v5, "supportedTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSArray isEqual:](supportedTypes, "isEqual:", v11);

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

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (id)description
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_supportedTypes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ACCNavigationAccessoryObjectDetectionComponent - name: %@, identifier: %d, isEnabled: %d>, supportedTypes: %@>"), self->_name, self->_identifier, self->_isEnabled, v3, (_QWORD)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (NSArray)supportedTypes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSupportedTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTypes, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
