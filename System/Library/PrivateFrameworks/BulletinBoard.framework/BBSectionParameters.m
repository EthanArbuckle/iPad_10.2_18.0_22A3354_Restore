@implementation BBSectionParameters

- (BBSectionParameters)init
{
  BBSectionParameters *v2;
  void *v3;
  BBSectionSubtypeParameters *v4;
  BBSectionSubtypeParameters *defaultSubtypeParameters;
  NSMutableDictionary *v6;
  NSMutableDictionary *allSubtypeParameters;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BBSectionParameters;
  v2 = -[BBSectionParameters init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionParameters setUUID:](v2, "setUUID:", v3);

    v4 = -[BBSectionSubtypeParameters initWithFallbackParameters:]([BBSectionSubtypeParameters alloc], "initWithFallbackParameters:", 0);
    defaultSubtypeParameters = v2->_defaultSubtypeParameters;
    v2->_defaultSubtypeParameters = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    allSubtypeParameters = v2->_allSubtypeParameters;
    v2->_allSubtypeParameters = v6;

    -[BBSectionParameters setMessageNumberOfLines:](v2, "setMessageNumberOfLines:", 1);
    -[BBSectionSubtypeParameters setCanBeSilencedByMenuButtonPress:](v2->_defaultSubtypeParameters, "setCanBeSilencedByMenuButtonPress:", 1);
    -[BBSectionSubtypeParameters setAllowsAutomaticRemovalFromLockScreen:](v2->_defaultSubtypeParameters, "setAllowsAutomaticRemovalFromLockScreen:", 1);
    -[BBSectionSubtypeParameters setShouldDismissBulletinWhenClosed:](v2->_defaultSubtypeParameters, "setShouldDismissBulletinWhenClosed:", 1);
  }
  return v2;
}

- (id)parametersForSubtype:(int64_t)a3
{
  NSMutableDictionary *v5;
  void *v6;
  BBSectionSubtypeParameters *v7;

  v5 = self->_allSubtypeParameters;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_allSubtypeParameters, "objectForKey:", v6);
  v7 = (BBSectionSubtypeParameters *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[BBSectionSubtypeParameters initWithFallbackParameters:]([BBSectionSubtypeParameters alloc], "initWithFallbackParameters:", self->_defaultSubtypeParameters);
    -[NSMutableDictionary setObject:forKey:](self->_allSubtypeParameters, "setObject:forKey:", v7, v6);
  }

  objc_sync_exit(v5);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = self->_allSubtypeParameters;
  objc_sync_enter(v4);
  -[BBSectionParameters UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("UUID"));

  -[BBSectionParameters defaultSubtypeParameters](self, "defaultSubtypeParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("defaultSubtypeParameters"));

  -[BBSectionParameters allSubtypeParameters](self, "allSubtypeParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("allSubtypeParameters"));

  -[BBSectionParameters displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("displayName"));

  -[BBSectionParameters icon](self, "icon");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("icon"));

  objc_msgSend(v10, "encodeBool:forKey:", -[BBSectionParameters showsSubtitle](self, "showsSubtitle"), CFSTR("showsSubtitle"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[BBSectionParameters messageNumberOfLines](self, "messageNumberOfLines"), CFSTR("messageNumberOfLines"));
  objc_msgSend(v10, "encodeBool:forKey:", -[BBSectionParameters usesVariableLayout](self, "usesVariableLayout"), CFSTR("usesVariableLayout"));
  objc_msgSend(v10, "encodeBool:forKey:", -[BBSectionParameters orderSectionUsingRecencyDate](self, "orderSectionUsingRecencyDate"), CFSTR("orderSectionUsingRecencyDate"));
  objc_msgSend(v10, "encodeBool:forKey:", -[BBSectionParameters showsDateInFloatingLockScreenAlert](self, "showsDateInFloatingLockScreenAlert"), CFSTR("showsDateInFloatingLockScreenAlert"));
  objc_sync_exit(v4);

}

- (BBSectionSubtypeParameters)defaultSubtypeParameters
{
  return self->_defaultSubtypeParameters;
}

- (BOOL)usesVariableLayout
{
  return self->_usesVariableLayout;
}

- (BOOL)showsSubtitle
{
  return self->_showsSubtitle;
}

- (BOOL)showsDateInFloatingLockScreenAlert
{
  return self->_showsDateInFloatingLockScreenAlert;
}

- (BOOL)orderSectionUsingRecencyDate
{
  return self->_orderSectionUsingRecencyDate;
}

- (unint64_t)messageNumberOfLines
{
  return self->_messageNumberOfLines;
}

- (BBSectionIcon)icon
{
  return self->_icon;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSMutableDictionary)allSubtypeParameters
{
  return self->_allSubtypeParameters;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[BBSectionParameters UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BBSectionParameters *v4;
  BBSectionParameters *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (BBSectionParameters *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[BBSectionParameters UUID](self, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBSectionParameters UUID](v5, "UUID");
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

- (NSUUID)UUID
{
  return self->_UUID;
}

- (id)replacementObjectForCoder:(id)a3
{
  void *v4;
  void *v5;

  -[NSObject bb_objectCache](self, "bb_objectCache", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cacheObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BBSectionParameters)initWithCoder:(id)a3
{
  id v4;
  BBSectionParameters *v5;
  void *v6;
  BBSectionParameters *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BBSectionParameters;
  v5 = -[BBSectionParameters init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSectionParameters setUUID:](v5, "setUUID:", v6);

    v7 = v5;
    -[NSObject bb_objectCache](v7, "bb_objectCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cacheObject:", v7);
    v5 = (BBSectionParameters *)objc_claimAutoreleasedReturnValue();

    if (v5 == v7)
    {
      -[BBSectionParameters setShowsSubtitle:](v7, "setShowsSubtitle:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsSubtitle")));
      -[BBSectionParameters setMessageNumberOfLines:](v7, "setMessageNumberOfLines:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("messageNumberOfLines")));
      -[BBSectionParameters setUsesVariableLayout:](v7, "setUsesVariableLayout:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usesVariableLayout")));
      -[BBSectionParameters setOrderSectionUsingRecencyDate:](v7, "setOrderSectionUsingRecencyDate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("orderSectionUsingRecencyDate")));
      -[BBSectionParameters setShowsDateInFloatingLockScreenAlert:](v7, "setShowsDateInFloatingLockScreenAlert:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsDateInFloatingLockScreenAlert")));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultSubtypeParameters"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBSectionParameters setDefaultSubtypeParameters:](v7, "setDefaultSubtypeParameters:", v9);

      v10 = (void *)MEMORY[0x24BDBCF20];
      v29[0] = objc_opt_class();
      v29[1] = objc_opt_class();
      v29[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("allSubtypeParameters"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBSectionParameters setAllSubtypeParameters:](v7, "setAllSubtypeParameters:", v13);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBSectionParameters setDisplayName:](v7, "setDisplayName:", v14);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBSectionParameters setIcon:](v7, "setIcon:", v15);

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v16 = v7->_allSubtypeParameters;
      v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v24;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v24 != v19)
              objc_enumerationMutation(v16);
            -[NSMutableDictionary objectForKeyedSubscript:](v7->_allSubtypeParameters, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20), (_QWORD)v23);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setFallbackParameters:", v7->_defaultSubtypeParameters);

            ++v20;
          }
          while (v18 != v20);
          v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v18);
      }

    }
  }

  return v5;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (void)setMessageNumberOfLines:(unint64_t)a3
{
  self->_messageNumberOfLines = a3;
}

- (void)setUsesVariableLayout:(BOOL)a3
{
  self->_usesVariableLayout = a3;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setShowsSubtitle:(BOOL)a3
{
  self->_showsSubtitle = a3;
}

- (void)setShowsDateInFloatingLockScreenAlert:(BOOL)a3
{
  self->_showsDateInFloatingLockScreenAlert = a3;
}

- (void)setOrderSectionUsingRecencyDate:(BOOL)a3
{
  self->_orderSectionUsingRecencyDate = a3;
}

- (void)setDefaultSubtypeParameters:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSubtypeParameters, a3);
}

- (void)setAllSubtypeParameters:(id)a3
{
  objc_storeStrong((id *)&self->_allSubtypeParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_allSubtypeParameters, 0);
  objc_storeStrong((id *)&self->_defaultSubtypeParameters, 0);
}

- (id)allSubtypes
{
  NSMutableDictionary *v3;
  void *v4;

  v3 = self->_allSubtypeParameters;
  objc_sync_enter(v3);
  -[NSMutableDictionary allKeys](self->_allSubtypeParameters, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
