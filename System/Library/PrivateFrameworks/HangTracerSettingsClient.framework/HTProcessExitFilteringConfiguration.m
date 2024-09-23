@implementation HTProcessExitFilteringConfiguration

+ (id)configurationAllowingAllProcesses:(BOOL)a3 criticalProcesses:(BOOL)a4 processNames:(id)a5 reasons:(unint64_t)a6 subReasons:(id)a7
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v11;
  id v12;
  HTProcessExitFilteringConfiguration *v13;
  id v14;

  v9 = a4;
  v10 = a3;
  v11 = a7;
  v12 = a5;
  v13 = objc_alloc_init(HTProcessExitFilteringConfiguration);
  -[HTProcessExitFilteringConfiguration setAllowsAllProcesses:](v13, "setAllowsAllProcesses:", v10);
  -[HTProcessExitFilteringConfiguration setAllowsCriticalProcesses:](v13, "setAllowsCriticalProcesses:", v9);
  if (v12)
    v14 = v12;
  else
    v14 = (id)MEMORY[0x24BDBD1A8];
  -[HTProcessExitFilteringConfiguration setAllowedProcessNames:](v13, "setAllowedProcessNames:", v14);

  -[HTProcessExitFilteringConfiguration setAllowedReasons:](v13, "setAllowedReasons:", a6);
  -[HTProcessExitFilteringConfiguration setAllowedSubReasons:](v13, "setAllowedSubReasons:", v11);

  return v13;
}

+ (id)configurationFromPrefs:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HTProcessExitFilteringConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HTProcessExitFilteringConfiguration *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsAllProcesses"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsCriticalProcesses"));
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("allowedProcessNames"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowedReasons"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v9, objc_opt_class(), CFSTR("allowedSubReasons"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HTProcessExitFilteringConfiguration configurationAllowingAllProcesses:criticalProcesses:processNames:reasons:subReasons:](HTProcessExitFilteringConfiguration, "configurationAllowingAllProcesses:criticalProcesses:processNames:reasons:subReasons:", v5, v6, v7, objc_msgSend(v8, "unsignedLongLongValue"), v10);
  v11 = (HTProcessExitFilteringConfiguration *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 allowsAllProcesses;
  void *v5;
  id v6;

  allowsAllProcesses = self->_allowsAllProcesses;
  v6 = a3;
  objc_msgSend(v6, "encodeBool:forKey:", allowsAllProcesses, CFSTR("allowsAllProcesses"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_allowsCriticalProcesses, CFSTR("allowsCriticalProcesses"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_allowedProcessNames, CFSTR("allowedProcessNames"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_allowedReasons);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("allowedReasons"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_allowedSubReasons, CFSTR("allowedSubReasons"));
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("YES");
  if (self->_allowsAllProcesses)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  if (!self->_allowsCriticalProcesses)
    v2 = CFSTR("NO");
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("all processes:      %@\ncritical processes: %@\nprocess names:      %@\nreasons:            %llu\nsub-reasons:        %@"), v3, v2, self->_allowedProcessNames, self->_allowedReasons, self->_allowedSubReasons);
}

- (BOOL)isEqual:(id)a3
{
  HTProcessExitFilteringConfiguration *v4;
  HTProcessExitFilteringConfiguration *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  char v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;

  v4 = (HTProcessExitFilteringConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HTProcessExitFilteringConfiguration allowsAllProcesses](self, "allowsAllProcesses");
      if (v6 == -[HTProcessExitFilteringConfiguration allowsAllProcesses](v5, "allowsAllProcesses")
        && (v7 = -[HTProcessExitFilteringConfiguration allowsCriticalProcesses](self, "allowsCriticalProcesses"),
            v7 == -[HTProcessExitFilteringConfiguration allowsCriticalProcesses](v5, "allowsCriticalProcesses")))
      {
        -[HTProcessExitFilteringConfiguration allowedProcessNames](self, "allowedProcessNames");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HTProcessExitFilteringConfiguration allowedProcessNames](v5, "allowedProcessNames");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10)
          && (v11 = -[HTProcessExitFilteringConfiguration allowedReasons](self, "allowedReasons"),
              v11 == -[HTProcessExitFilteringConfiguration allowedReasons](v5, "allowedReasons")))
        {
          -[HTProcessExitFilteringConfiguration allowedSubReasons](self, "allowedSubReasons");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HTProcessExitFilteringConfiguration allowedSubReasons](v5, "allowedSubReasons");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v12, "isEqual:", v13);

        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSDictionary *allowedSubReasons;
  unint64_t v6;

  v3 = self->_allowsCriticalProcesses ^ self->_allowsAllProcesses;
  v4 = -[NSArray hash](self->_allowedProcessNames, "hash");
  allowedSubReasons = self->_allowedSubReasons;
  v6 = v4 ^ self->_allowedReasons ^ v3;
  return v6 ^ -[NSDictionary hash](allowedSubReasons, "hash");
}

- (BOOL)allowsAllProcesses
{
  return self->_allowsAllProcesses;
}

- (void)setAllowsAllProcesses:(BOOL)a3
{
  self->_allowsAllProcesses = a3;
}

- (BOOL)allowsCriticalProcesses
{
  return self->_allowsCriticalProcesses;
}

- (void)setAllowsCriticalProcesses:(BOOL)a3
{
  self->_allowsCriticalProcesses = a3;
}

- (NSArray)allowedProcessNames
{
  return self->_allowedProcessNames;
}

- (void)setAllowedProcessNames:(id)a3
{
  objc_storeStrong((id *)&self->_allowedProcessNames, a3);
}

- (unint64_t)allowedReasons
{
  return self->_allowedReasons;
}

- (void)setAllowedReasons:(unint64_t)a3
{
  self->_allowedReasons = a3;
}

- (NSDictionary)allowedSubReasons
{
  return self->_allowedSubReasons;
}

- (void)setAllowedSubReasons:(id)a3
{
  objc_storeStrong((id *)&self->_allowedSubReasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedSubReasons, 0);
  objc_storeStrong((id *)&self->_allowedProcessNames, 0);
}

@end
