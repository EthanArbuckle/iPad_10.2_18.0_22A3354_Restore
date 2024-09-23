@implementation SCNActionGroup

- (SCNActionGroup)init
{
  SCNActionGroup *v2;
  SCNCActionGroup *v3;
  SCNCAction *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNActionGroup;
  v2 = -[SCNAction init](&v8, sel_init);
  if (v2)
  {
    v3 = (SCNCActionGroup *)operator new();
    v7.receiver = v2;
    v7.super_class = (Class)SCNActionGroup;
    v4 = -[SCNAction caction](&v7, sel_caction);
    SCNCActionGroup::SCNCActionGroup(v3, v4);
    v2->_mycaction = v3;
    v6.receiver = v2;
    v6.super_class = (Class)SCNActionGroup;
    -[SCNAction setCppAction:](&v6, sel_setCppAction_, v3);
    v2->_actions = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  }
  return v2;
}

- (SCNActionGroup)initWithCoder:(id)a3
{
  SCNActionGroup *v4;
  SCNCActionGroup *v5;
  SCNCAction *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *mycaction;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  objc_super v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)SCNActionGroup;
  v4 = -[SCNAction initWithCoder:](&v22, sel_initWithCoder_);
  if (v4)
  {
    v5 = (SCNCActionGroup *)operator new();
    v21.receiver = v4;
    v21.super_class = (Class)SCNActionGroup;
    v6 = -[SCNAction caction](&v21, sel_caction);
    SCNCActionGroup::SCNCActionGroup(v5, v6);
    v4->_mycaction = v5;
    v20.receiver = v4;
    v20.super_class = (Class)SCNActionGroup;
    -[SCNAction setCppAction:](&v20, sel_setCppAction_, v5);
    v7 = (NSArray *)(id)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_actions"));
    v4->_actions = v7;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v7);
          mycaction = v4->_mycaction;
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "caction");
          v13 = operator new(0x18uLL);
          v13[2] = v12;
          v14 = mycaction[18];
          *v13 = v14;
          v13[1] = mycaction + 18;
          *(_QWORD *)(v14 + 8) = v13;
          mycaction[18] = v13;
          ++mycaction[20];
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      }
      while (v8);
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionGroup;
  -[SCNAction dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionGroup;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_actions, CFSTR("_actions"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCustom
{
  NSArray *actions;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  actions = self->_actions;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](actions, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(actions);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "isCustom") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](actions, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (void)setupWithActions:(id)a3
{
  SCNCActionGroup *v5;
  SCNCAction *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *mycaction;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (SCNCActionGroup *)operator new();
  v20.receiver = self;
  v20.super_class = (Class)SCNActionGroup;
  v6 = -[SCNAction caction](&v20, sel_caction);
  SCNCActionGroup::SCNCActionGroup(v5, v6);
  self->_mycaction = v5;
  v19.receiver = self;
  v19.super_class = (Class)SCNActionGroup;
  -[SCNAction setCppAction:](&v19, sel_setCppAction_, v5);
  v7 = (NSArray *)objc_msgSend(a3, "copy");
  self->_actions = v7;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        mycaction = self->_mycaction;
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "caction");
        v13 = operator new(0x18uLL);
        v13[2] = v12;
        v14 = mycaction[18];
        *v13 = v14;
        v13[1] = mycaction + 18;
        *(_QWORD *)(v14 + 8) = v13;
        mycaction[18] = v13;
        ++mycaction[20];
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v8);
  }
}

+ (id)groupWithActions:(id)a3
{
  SCNActionGroup *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t j;
  void *v16;
  _QWORD *mycaction;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  double v21;
  NSObject *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  if (a3 && objc_msgSend(a3, "count"))
  {
    v4 = objc_alloc_init(SCNActionGroup);
    objc_opt_class();
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(a3);
          v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "addObject:", +[SCNActionSequence sequenceWithActions:](SCNActionSequence, "sequenceWithActions:", v9));
          }
          else
          {
            v10 = (void *)objc_msgSend(v9, "copy");
            objc_msgSend(v5, "addObject:", v10);

          }
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v6);
    }
    v11 = (NSArray *)objc_msgSend(v5, "copy");
    v4->_actions = v11;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v25;
      v14 = 0.0;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          mycaction = v4->_mycaction;
          v18 = objc_msgSend(v16, "caction");
          v19 = operator new(0x18uLL);
          v19[2] = v18;
          v20 = mycaction[18];
          *v19 = v20;
          v19[1] = mycaction + 18;
          *(_QWORD *)(v20 + 8) = v19;
          mycaction[18] = v19;
          ++mycaction[20];
          objc_msgSend(v16, "duration");
          if (v14 < v21)
            v14 = v21;
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v12);
    }
    else
    {
      v14 = 0.0;
    }
    -[SCNAction setDuration:](v4, "setDuration:", v14);
  }
  else
  {
    v22 = scn_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[SCNActionGroup groupWithActions:].cold.1(v22);
    v34[0] = +[SCNAction waitForDuration:](SCNAction, "waitForDuration:", 0.0);
    return +[SCNActionGroup groupWithActions:](SCNActionGroup, "groupWithActions:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1));
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SCNActionGroup *v4;

  v4 = +[SCNActionGroup groupWithActions:](SCNActionGroup, "groupWithActions:", self->_actions);
  -[SCNAction setTimingMode:](v4, "setTimingMode:", -[SCNAction timingMode](self, "timingMode"));
  -[SCNAction setTimingFunction:](v4, "setTimingFunction:", -[SCNAction timingFunction](self, "timingFunction"));
  -[SCNAction speed](self, "speed");
  -[SCNAction setSpeed:](v4, "setSpeed:");
  -[SCNAction duration](self, "duration");
  -[SCNAction setDuration:](v4, "setDuration:");
  return v4;
}

- (id)reversedAction
{
  void *v3;
  NSArray *actions;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_actions, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  actions = self->_actions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](actions, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(actions);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "reversedAction"));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](actions, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return +[SCNActionGroup groupWithActions:](SCNActionGroup, "groupWithActions:", v3);
}

- (BOOL)finished
{
  NSArray *actions;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  actions = self->_actions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](actions, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(actions);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "finished") ^ 1;
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](actions, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
    v9 = v6 ^ 1;
  }
  else
  {
    v9 = 1;
  }
  v10 = v9 & 1;
  -[SCNAction setFinished:](self, "setFinished:", v9 & 1);
  return v10;
}

+ (void)groupWithActions:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: [SCNAction group:] invoked with nil", v1, 2u);
}

@end
