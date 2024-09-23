@implementation SCNActionSequence

- (SCNActionSequence)init
{
  SCNActionSequence *v2;
  SCNCActionSequence *v3;
  SCNCAction *v4;
  objc_super v6;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCNActionSequence;
  v2 = -[SCNAction init](&v8, sel_init);
  if (v2)
  {
    v3 = (SCNCActionSequence *)operator new();
    v7.receiver = v2;
    v7.super_class = (Class)SCNActionSequence;
    v4 = -[SCNAction caction](&v7, sel_caction);
    SCNCActionSequence::SCNCActionSequence(v3, v4);
    v2->_mycaction = v3;
    v6.receiver = v2;
    v6.super_class = (Class)SCNActionSequence;
    -[SCNAction setCppAction:](&v6, sel_setCppAction_, v3);
    v2->_actions = (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
    *((_QWORD *)v2->_mycaction + 21) = 0;
  }
  return v2;
}

- (SCNActionSequence)initWithCoder:(id)a3
{
  SCNActionSequence *v4;
  SCNCActionSequence *v5;
  SCNCAction *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  _QWORD *mycaction;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  double v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  objc_super v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)SCNActionSequence;
  v4 = -[SCNAction initWithCoder:](&v36, sel_initWithCoder_);
  if (v4)
  {
    v5 = (SCNCActionSequence *)operator new();
    v35.receiver = v4;
    v35.super_class = (Class)SCNActionSequence;
    v6 = -[SCNAction caction](&v35, sel_caction);
    SCNCActionSequence::SCNCActionSequence(v5, v6);
    v4->_mycaction = v5;
    v34.receiver = v4;
    v34.super_class = (Class)SCNActionSequence;
    -[SCNAction setCppAction:](&v34, sel_setCppAction_, v5);
    *((_QWORD *)v4->_mycaction + 21) = 0;
    v7 = (NSArray *)(id)objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_actions"));
    v4->_actions = v7;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v31;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          mycaction = v4->_mycaction;
          v14 = objc_msgSend(v12, "caction");
          v15 = mycaction[20];
          v16 = (uint64_t *)mycaction[19];
          if ((unint64_t)v16 >= v15)
          {
            v18 = mycaction[18];
            v19 = ((uint64_t)v16 - v18) >> 3;
            if ((unint64_t)(v19 + 1) >> 61)
              abort();
            v20 = v15 - v18;
            v21 = v20 >> 2;
            if (v20 >> 2 <= (unint64_t)(v19 + 1))
              v21 = v19 + 1;
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
              v22 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v22 = v21;
            if (v22)
              v23 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(mycaction + 20), v22);
            else
              v23 = 0;
            v24 = (uint64_t *)&v23[8 * v19];
            *v24 = v14;
            v17 = v24 + 1;
            v26 = (char *)mycaction[18];
            v25 = (char *)mycaction[19];
            if (v25 != v26)
            {
              do
              {
                v27 = *((_QWORD *)v25 - 1);
                v25 -= 8;
                *--v24 = v27;
              }
              while (v25 != v26);
              v25 = (char *)mycaction[18];
            }
            mycaction[18] = v24;
            mycaction[19] = v17;
            mycaction[20] = &v23[8 * v22];
            if (v25)
              operator delete(v25);
          }
          else
          {
            *v16 = v14;
            v17 = v16 + 1;
          }
          mycaction[19] = v17;
          objc_msgSend(v12, "duration");
          v10 = v10 + v28;
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 0.0;
    }
    -[SCNAction setDuration:](v4, "setDuration:", v10);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNActionSequence;
  -[SCNAction dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SCNActionSequence;
  -[SCNAction encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *((_QWORD *)self->_mycaction + 21)), CFSTR("_mycaction->_animIndex"));
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

+ (id)sequenceWithActions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  SCNActionSequence *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t j;
  void *v16;
  _QWORD *mycaction;
  uint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  double v32;
  NSObject *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  if (a3 && objc_msgSend(a3, "count"))
  {
    objc_opt_class();
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v40 != v6)
            objc_enumerationMutation(a3);
          v8 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v4, "addObject:", +[SCNActionGroup groupWithActions:](SCNActionGroup, "groupWithActions:", v8));
          }
          else
          {
            v9 = (void *)objc_msgSend(v8, "copy");
            objc_msgSend(v4, "addObject:", v9);

          }
        }
        v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v5);
    }
    v10 = objc_alloc_init(SCNActionSequence);
    v11 = (NSArray *)objc_msgSend(v4, "copy");
    v10->_actions = v11;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v36;
      v14 = 0.0;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          mycaction = v10->_mycaction;
          v18 = objc_msgSend(v16, "caction");
          v19 = mycaction[20];
          v20 = (uint64_t *)mycaction[19];
          if ((unint64_t)v20 >= v19)
          {
            v22 = mycaction[18];
            v23 = ((uint64_t)v20 - v22) >> 3;
            if ((unint64_t)(v23 + 1) >> 61)
              abort();
            v24 = v19 - v22;
            v25 = v24 >> 2;
            if (v24 >> 2 <= (unint64_t)(v23 + 1))
              v25 = v23 + 1;
            if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
              v26 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v26 = v25;
            if (v26)
              v27 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(mycaction + 20), v26);
            else
              v27 = 0;
            v28 = (uint64_t *)&v27[8 * v23];
            *v28 = v18;
            v21 = v28 + 1;
            v30 = (char *)mycaction[18];
            v29 = (char *)mycaction[19];
            if (v29 != v30)
            {
              do
              {
                v31 = *((_QWORD *)v29 - 1);
                v29 -= 8;
                *--v28 = v31;
              }
              while (v29 != v30);
              v29 = (char *)mycaction[18];
            }
            mycaction[18] = v28;
            mycaction[19] = v21;
            mycaction[20] = &v27[8 * v26];
            if (v29)
              operator delete(v29);
          }
          else
          {
            *v20 = v18;
            v21 = v20 + 1;
          }
          mycaction[19] = v21;
          objc_msgSend(v16, "duration");
          v14 = v14 + v32;
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v12);
    }
    else
    {
      v14 = 0.0;
    }
    -[SCNAction setDuration:](v10, "setDuration:", v14);
  }
  else
  {
    v33 = scn_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      +[SCNActionSequence sequenceWithActions:].cold.1(v33);
    v45[0] = +[SCNAction waitForDuration:](SCNAction, "waitForDuration:", 0.0);
    return +[SCNActionSequence sequenceWithActions:](SCNActionSequence, "sequenceWithActions:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1));
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SCNActionSequence *v4;

  v4 = +[SCNActionSequence sequenceWithActions:](SCNActionSequence, "sequenceWithActions:", self->_actions);
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
  id v3;
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
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_actions, "count"));
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
        objc_msgSend(v3, "insertObject:atIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "reversedAction"), 0);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](actions, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return +[SCNActionSequence sequenceWithActions:](SCNActionSequence, "sequenceWithActions:", v3);
}

+ (void)sequenceWithActions:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_ERROR, "Error: [SCNAction sequence:] invoked with nil", v1, 2u);
}

@end
