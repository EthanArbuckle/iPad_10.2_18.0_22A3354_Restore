@implementation GCHapticCapabilityGraphNode

- (NSString)label
{
  return self->_label;
}

- (BOOL)isExposed
{
  return self->_exposed;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (NSMutableArray)actuators
{
  return self->_actuators;
}

- (void)setActuators:(id)a3
{
  objc_storeStrong((id *)&self->_actuators, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actuators, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)addChild:(id)a3
{
  -[NSMutableArray addObject:](self->_children, "addObject:", a3);
}

- (void)addActuator:(id)a3
{
  -[NSMutableArray addObject:](self->_actuators, "addObject:", a3);
}

- (GCHapticCapabilityGraphNode)initWithJSONDictionaryRepresentation:(id)a3
{
  id v4;
  GCHapticCapabilityGraphNode *v5;
  uint64_t v6;
  NSString *label;
  void *v8;
  uint64_t v9;
  NSMutableArray *children;
  uint64_t v11;
  NSMutableArray *actuators;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GCHapticCapabilityGraphNode;
  v5 = -[GCHapticCapabilityGraphNode init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
    v6 = objc_claimAutoreleasedReturnValue();
    label = v5->_label;
    v5->_label = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("exposed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_exposed = objc_msgSend(v8, "BOOLValue");

    +[NSMutableArray array](&off_254DEBB20, "array");
    v9 = objc_claimAutoreleasedReturnValue();
    children = v5->_children;
    v5->_children = (NSMutableArray *)v9;

    +[NSMutableArray array](&off_254DEBB20, "array");
    v11 = objc_claimAutoreleasedReturnValue();
    actuators = v5->_actuators;
    v5->_actuators = (NSMutableArray *)v11;

  }
  return v5;
}

- (id)jsonDictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  +[NSMutableDictionary dictionary](&off_254DEBD30, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSMutableArray array](&off_254DEBB20, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_children;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v9), "label");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  +[NSMutableArray array](&off_254DEBB20, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = self->_actuators;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "label", (_QWORD)v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v14);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_label, CFSTR("label"));
  +[NSNumber numberWithBool:](&off_254DED908, "numberWithBool:", self->_exposed);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("exposed"));

  if (objc_msgSend(v4, "count"))
  {
    v19 = CFSTR("children");
    v20 = v3;
    v21 = v4;
LABEL_19:
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, v19, (_QWORD)v23);
    goto LABEL_20;
  }
  if (objc_msgSend(v11, "count"))
  {
    v19 = CFSTR("actuators");
    v20 = v3;
    v21 = v11;
    goto LABEL_19;
  }
LABEL_20:

  return v3;
}

@end
