@implementation SKSequence

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKSequence)init
{
  SKSequence *v2;
  uint64_t v3;
  const SKCAction *v4;
  uint64_t v5;
  NSArray *actions;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SKSequence;
  v2 = -[SKAction init](&v10, sel_init);
  if (v2)
  {
    v3 = operator new();
    v9.receiver = v2;
    v9.super_class = (Class)SKSequence;
    v4 = -[SKAction caction](&v9, sel_caction);
    SKCAction::SKCAction((SKCAction *)v3, v4);
    *(_OWORD *)(v3 + 112) = 0u;
    *(_OWORD *)(v3 + 128) = 0u;
    v2->_mycaction = (void *)v3;
    *(_QWORD *)v3 = &off_1EA4FF3E0;
    v8.receiver = v2;
    v8.super_class = (Class)SKSequence;
    -[SKAction setCppAction:](&v8, sel_setCppAction_, v3);
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    actions = v2->_actions;
    v2->_actions = (NSArray *)v5;

    *((_QWORD *)v2->_mycaction + 17) = 0;
  }
  return v2;
}

- (SKSequence)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  const SKCAction *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  objc_super v26;
  objc_super v27;
  _BYTE v28[128];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SKSequence;
  v5 = -[SKAction initWithCoder:](&v27, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = operator new();
    v26.receiver = v5;
    v26.super_class = (Class)SKSequence;
    v7 = -[SKAction caction](&v26, sel_caction);
    SKCAction::SKCAction((SKCAction *)v6, v7);
    *(_OWORD *)(v6 + 112) = 0u;
    *(_OWORD *)(v6 + 128) = 0u;
    *((_QWORD *)v5 + 2) = v6;
    *(_QWORD *)v6 = &off_1EA4FF3E0;
    v25.receiver = v5;
    v25.super_class = (Class)SKSequence;
    -[SKAction setCppAction:](&v25, sel_setCppAction_, v6);
    *(_QWORD *)(*((_QWORD *)v5 + 2) + 136) = 0;
    v8 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_actions"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v11;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = *((id *)v5 + 3);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v22;
      v16 = 0.0;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          SKCSequence::addCAction(*((SKCSequence **)v5 + 2), (SKCAction *)objc_msgSend(v18, "caction", (_QWORD)v21));
          objc_msgSend(v18, "duration");
          v16 = v16 + v19;
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      }
      while (v14);
    }
    else
    {
      v16 = 0.0;
    }

    objc_msgSend(v5, "setDuration:", v16);
  }

  return (SKSequence *)v5;
}

- (id)subactions
{
  return self->_actions;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKSequence;
  -[SKAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)self->_mycaction + 17));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_mycaction->_animIndex"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_actions, CFSTR("_actions"));
}

+ (id)sequenceWithActions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  SKSequence *v12;
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
    objc_opt_class();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[SKGroup groupWithActions:](SKGroup, "groupWithActions:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = (void *)objc_msgSend(v10, "copy");
          }
          objc_msgSend(v5, "addObject:", v11);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }

    v12 = objc_alloc_init(SKSequence);
    v13 = objc_msgSend(v5, "copy");
    actions = v12->_actions;
    v12->_actions = (NSArray *)v13;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v12->_actions;
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
          SKCSequence::addCAction((SKCSequence *)v12->_mycaction, (SKCAction *)objc_msgSend(v20, "caction", (_QWORD)v23));
          objc_msgSend(v20, "duration");
          v18 = v18 + v21;
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v16);
    }
    else
    {
      v18 = 0.0;
    }

    -[SKAction setDuration:](v12, "setDuration:", v18);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  +[SKSequence sequenceWithActions:](SKSequence, "sequenceWithActions:", self->_actions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKAction speed](self, "speed");
  objc_msgSend(v4, "setSpeed:");
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
        objc_msgSend(v3, "insertObject:atIndex:", v8, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  +[SKSequence sequenceWithActions:](SKSequence, "sequenceWithActions:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
