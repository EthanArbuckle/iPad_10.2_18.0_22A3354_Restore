@implementation SKGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKGroup)init
{
  SKGroup *v2;
  uint64_t v3;
  const SKCAction *v4;
  uint64_t v5;
  NSArray *actions;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKGroup;
  v2 = -[SKAction init](&v10, sel_init);
  if (v2)
  {
    v3 = operator new();
    v9.receiver = v2;
    v9.super_class = (Class)SKGroup;
    v4 = -[SKAction caction](&v9, sel_caction);
    SKCAction::SKCAction((SKCAction *)v3, v4);
    *(_QWORD *)v3 = &off_1EA4FED60;
    *(_QWORD *)(v3 + 112) = v3 + 112;
    *(_QWORD *)(v3 + 120) = v3 + 112;
    v2->_mycaction = (void *)v3;
    *(_QWORD *)(v3 + 128) = 0;
    v8.receiver = v2;
    v8.super_class = (Class)SKGroup;
    -[SKAction setCppAction:](&v8, sel_setCppAction_, v3);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    actions = v2->_actions;
    v2->_actions = (NSArray *)v5;

  }
  return v2;
}

- (SKGroup)initWithCoder:(id)a3
{
  id v4;
  SKGroup *v5;
  uint64_t v6;
  const SKCAction *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *actions;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  objc_super v23;
  objc_super v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SKGroup;
  v5 = -[SKAction initWithCoder:](&v24, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = operator new();
    v23.receiver = v5;
    v23.super_class = (Class)SKGroup;
    v7 = -[SKAction caction](&v23, sel_caction);
    SKCAction::SKCAction((SKCAction *)v6, v7);
    *(_QWORD *)v6 = &off_1EA4FED60;
    *(_QWORD *)(v6 + 112) = v6 + 112;
    *(_QWORD *)(v6 + 120) = v6 + 112;
    v5->_mycaction = (void *)v6;
    *(_QWORD *)(v6 + 128) = 0;
    v22.receiver = v5;
    v22.super_class = (Class)SKGroup;
    -[SKAction setCppAction:](&v22, sel_setCppAction_, v6);
    v8 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_actions"));
    v11 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v11;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v5->_actions;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v13);
          SKCGroup::addCAction((_QWORD *)v5->_mycaction, (SKCAction *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "caction", (_QWORD)v18));
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      }
      while (v14);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SKGroup;
  -[SKAction encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_actions, CFSTR("_actions"));

}

- (id)subactions
{
  return self->_actions;
}

+ (id)groupWithActions:(id)a3
{
  id v3;
  void *v4;
  SKGroup *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *actions;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t j;
  void *v20;
  double v21;
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

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = objc_alloc_init(SKGroup);
    objc_opt_class();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[SKSequence sequenceWithActions:](SKSequence, "sequenceWithActions:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v12 = (void *)objc_msgSend(v11, "copy");
          }
          objc_msgSend(v6, "addObject:", v12);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }

    v13 = objc_msgSend(v6, "copy");
    actions = v5->_actions;
    v5->_actions = (NSArray *)v13;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v5->_actions;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v24;
      v18 = 0.0;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          SKCGroup::addCAction((_QWORD *)v5->_mycaction, (SKCAction *)objc_msgSend(v20, "caction", (_QWORD)v23));
          objc_msgSend(v20, "duration");
          if (v18 < v21)
            v18 = v21;
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v16);
    }
    else
    {
      v18 = 0.0;
    }

    -[SKAction setDuration:](v5, "setDuration:", v18);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  +[SKGroup groupWithActions:](SKGroup, "groupWithActions:", self->_actions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingMode:", -[SKAction timingMode](self, "timingMode"));
  -[SKAction timingFunction](self, "timingFunction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimingFunction:", v5);

  return v4;
}

- (id)reversedAction
{
  NSArray **p_actions;
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_actions = &self->_actions;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_actions, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *p_actions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "reversedAction", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  +[SKGroup groupWithActions:](SKGroup, "groupWithActions:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)finished
{
  NSArray *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_actions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "finished", (_QWORD)v10) ^ 1;
      }
      while (v4 != v7);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
    v8 = v5 ^ 1;
  }
  else
  {
    v8 = 1;
  }

  -[SKAction setFinished:](self, "setFinished:", v8 & 1);
  return v8 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
