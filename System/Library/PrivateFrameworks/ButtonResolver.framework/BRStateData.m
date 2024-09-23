@implementation BRStateData

- (BRStateData)initWithState:(unint64_t)a3 enabled:(BOOL)a4
{
  BRStateData *v6;
  BRStateData *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BRStateData;
  v6 = -[BRStateData init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_state = a3;
    v6->_enabled = a4;
    v6->_speedConfigs = (NSMutableDictionary *)objc_opt_new();
    v7->_speedSlots = (NSMutableDictionary *)objc_opt_new();
  }
  return v7;
}

- (BRStateData)initWithStateData:(id)a3
{
  BRStateData *v4;
  objc_super v6;

  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)BRStateData;
    v4 = -[BRStateData init](&v6, sel_init);
    if (v4)
    {
      v4->_state = objc_msgSend(a3, "state");
      v4->_enabled = objc_msgSend(a3, "enabled");
      v4->_speedConfigs = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "speedConfigs"), "copy");
      v4->_speedSlots = (NSMutableDictionary *)objc_msgSend((id)objc_msgSend(a3, "speedSlots"), "copy");
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithStateData:", self);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRStateData;
  -[BRStateData dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRStateData;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", -[BRStateData description](&v7, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("State: %lu;"), -[BRStateData state](self, "state"));
  v4 = -[BRStateData enabled](self, "enabled");
  v5 = "N";
  if (v4)
    v5 = "Y";
  objc_msgSend(v3, "appendFormat:", CFSTR("Enabled: %s;"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("ButtonConfigsForSpeeds: %@;"),
    -[BRStateData speedConfigs](self, "speedConfigs"));
  objc_msgSend(v3, "appendFormat:", CFSTR("SlotsForSpeeds: %@;"), -[BRStateData speedSlots](self, "speedSlots"));
  return v3;
}

- (id)propertyList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const char *v8;
  NSMutableDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[BRStateData state](self, "state")), CFSTR("State"));
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = -[BRStateData enabled](self, "enabled");
  v8 = "N";
  if (v7)
    v8 = "Y";
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(v6, "stringWithFormat:", CFSTR("%s;"), v8), CFSTR("Enabled"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = -[BRStateData speedConfigs](self, "speedConfigs");
  v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v4, "setObject:forKey:", -[NSMutableDictionary objectForKeyedSubscript:](-[BRStateData speedConfigs](self, "speedConfigs"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13)), objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v13), "stringValue"));
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v11);
  }
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("ButtonConfigsForSpeeds"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = -[BRStateData speedSlots](self, "speedSlots");
  v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v21;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v5, "setObject:forKey:", -[NSMutableDictionary objectForKeyedSubscript:](-[BRStateData speedSlots](self, "speedSlots"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18)), objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "stringValue"));
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v16);
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("SlotsForSpeeds"));
  return v3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSMutableDictionary)speedConfigs
{
  return self->_speedConfigs;
}

- (NSMutableDictionary)speedSlots
{
  return self->_speedSlots;
}

@end
