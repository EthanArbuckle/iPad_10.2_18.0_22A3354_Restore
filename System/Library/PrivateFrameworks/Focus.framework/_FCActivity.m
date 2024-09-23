@implementation _FCActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityLifetimesAlternativeDescription, 0);
  objc_storeStrong((id *)&self->_dndMode, 0);
  objc_storeStrong((id *)&self->_activityLifetimeDescriptions, 0);
  objc_storeStrong((id *)&self->_activityCreationDate, 0);
}

- (NSString)activityIdentifier
{
  void *v2;
  void *v3;

  -[_FCActivity _dndMode](self, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)activitySymbolImageName
{
  void *v2;
  void *v3;

  -[_FCActivity _dndMode](self, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "symbolImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)activityDisplayName
{
  void *v2;
  void *v3;

  -[_FCActivity _dndMode](self, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)activityColorName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_FCActivity _dndMode](self, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tintColorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE2D668], "defaultTintColorName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (DNDMode)_dndMode
{
  return (DNDMode *)objc_getProperty(self, a2, 24, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[_FCActivity _dndMode](self, "_dndMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithMode:", v5);

  -[_FCActivity activityLifetimeDescriptions](self, "activityLifetimeDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setActivityLifetimeDescriptions:", v7);

  -[_FCActivity activityLifetimesAlternativeDescription](self, "activityLifetimesAlternativeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setActivityLifetimesAlternativeDescription:", v8);

  return v6;
}

- (_FCActivity)initWithMode:(id)a3
{
  id v4;
  _FCActivity *v5;
  _FCActivity *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_FCActivity;
  v5 = -[_FCActivity init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_FCActivity _setDndMode:](v5, "_setDndMode:", v4);

  return v6;
}

- (NSString)activityLifetimesAlternativeDescription
{
  return self->_activityLifetimesAlternativeDescription;
}

- (NSArray)activityLifetimeDescriptions
{
  _FCActivity *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activityLifetimeDescriptions;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setDndMode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)_setActivityLifetimesAlternativeDescription:(id)a3
{
  _FCActivity *v4;
  uint64_t v5;
  NSString *activityLifetimesAlternativeDescription;
  NSArray *activityLifetimeDescriptions;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((BSEqualStrings() & 1) == 0)
  {
    v5 = objc_msgSend(v8, "copy");
    activityLifetimesAlternativeDescription = v4->_activityLifetimesAlternativeDescription;
    v4->_activityLifetimesAlternativeDescription = (NSString *)v5;

    if (v4->_activityLifetimesAlternativeDescription)
    {
      activityLifetimeDescriptions = v4->_activityLifetimeDescriptions;
      v4->_activityLifetimeDescriptions = 0;

    }
  }
  objc_sync_exit(v4);

}

- (void)_setActivityLifetimeDescriptions:(id)a3
{
  _FCActivity *v4;
  void **p_activityLifetimeDescriptions;
  uint64_t v6;
  NSArray *activityLifetimeDescriptions;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  p_activityLifetimeDescriptions = (void **)&v4->_activityLifetimeDescriptions;
  if ((BSEqualArrays() & 1) == 0)
  {
    if (v9)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v9, 1);
      activityLifetimeDescriptions = v4->_activityLifetimeDescriptions;
      v4->_activityLifetimeDescriptions = (NSArray *)v6;

      p_activityLifetimeDescriptions = (void **)&v4->_activityLifetimesAlternativeDescription;
    }
    v8 = *p_activityLifetimeDescriptions;
    *p_activityLifetimeDescriptions = 0;

  }
  objc_sync_exit(v4);

}

- (BOOL)supportsDiscreteLifetimes
{
  return (unint64_t)(-[DNDMode semanticType](self->_dndMode, "semanticType") - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)isDrivingActivity
{
  return -[DNDMode semanticType](self->_dndMode, "semanticType") == 2;
}

- (BOOL)isSleepActivity
{
  return -[DNDMode semanticType](self->_dndMode, "semanticType") == 1;
}

- (void)_setActivityCreationDate:(id)a3
{
  _FCActivity *v4;
  uint64_t v5;
  NSDate *activityCreationDate;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if ((BSEqualObjects() & 1) == 0)
  {
    v5 = objc_msgSend(v7, "copy");
    activityCreationDate = v4->_activityCreationDate;
    v4->_activityCreationDate = (NSDate *)v5;

  }
  objc_sync_exit(v4);

}

- (BOOL)_updateMode:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_FCActivity _dndMode](self, "_dndMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BSEqualObjects();
  if ((v6 & 1) == 0)
    -[_FCActivity _setDndMode:](self, "_setDndMode:", v4);

  return v6 ^ 1;
}

- (NSUUID)activityUniqueIdentifier
{
  void *v2;
  void *v3;

  -[_FCActivity _dndMode](self, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (int64_t)activitySemanticType
{
  void *v2;
  int64_t v3;

  -[_FCActivity _dndMode](self, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "semanticType");

  return v3;
}

- (NSDate)activityCreationDate
{
  _FCActivity *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activityCreationDate;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)activityDetailText
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  -[_FCActivity _dndMode](self, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "semanticType");

  v4 = 0;
  switch(v3)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("ACTIVITY_PERMANENT_DETAIL_TEXT_DEFAULT");
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("ACTIVITY_DETAIL_TEXT_SLEEP");
      goto LABEL_7;
    case 4:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("ACTIVITY_DETAIL_TEXT_WORK");
      goto LABEL_7;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("ACTIVITY_DETAIL_TEXT_PERSONAL");
      goto LABEL_7;
    case 9:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("ACTIVITY_PERMANENT_DETAIL_TEXT_REDUCEINTERRUPTIONS");
LABEL_7:
      objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D0E1520, CFSTR("Focus"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return (NSString *)v4;
  }
  return (NSString *)v4;
}

- (NSURL)activitySettingsURL
{
  void *v2;
  void *v3;

  -[_FCActivity _dndMode](self, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settingsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)activitySetupURL
{
  void *v2;
  void *v3;

  -[_FCActivity _dndMode](self, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)isPlaceholder
{
  void *v2;
  char v3;

  -[_FCActivity _dndMode](self, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaceholder");

  return v3;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_FCActivity _dndMode](self, "_dndMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _FCActivity *v4;
  _FCActivity *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (_FCActivity *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_FCActivity _dndMode](self, "_dndMode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_FCActivity _dndMode](v5, "_dndMode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = BSEqualObjects();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[_FCActivity activityIdentifier](self, "activityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FCActivity activityUniqueIdentifier](self, "activityUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FCActivity activityDisplayName](self, "activityDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; activityIdentifier: %@; activityUniqueIdentifier: %@; activityDisplayName: %@>"),
    v4,
    self,
    v5,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[_FCActivity description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = objc_msgSend(v4, "rangeOfString:options:", CFSTR(">"), 4);
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[_FCActivity activitySymbolImageName](self, "activitySymbolImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FCActivity activityColorName](self, "activityColorName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FCActivity isPlaceholder](self, "isPlaceholder");
  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FCActivity activityLifetimeDescriptions](self, "activityLifetimeDescriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = (void *)MEMORY[0x24BDD17C8];
  if (v11)
  {
    -[_FCActivity activityLifetimeDescriptions](self, "activityLifetimeDescriptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("activityLifetimeDescriptions: %@"), v13);
  }
  else
  {
    -[_FCActivity activityLifetimesAlternativeDescription](self, "activityLifetimesAlternativeDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("activityLifetimesAlternativeDescription: %@"), v13);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("; activitySymbolImageName: %@; activityColorName: %@; isPlaceholder: %@; %@"),
    v7,
    v8,
    v9,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertString:atIndex:", v15, v5);

  return (NSString *)v4;
}

@end
