@implementation CLSCurationDebugObject

- (CLSCurationDebugObject)init
{
  CLSCurationDebugObject *v2;
  NSMutableArray *v3;
  NSMutableArray *stateHistory;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSCurationDebugObject;
  v2 = -[CLSCurationDebugObject init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    stateHistory = v2->_stateHistory;
    v2->_stateHistory = v3;

    v2->_tentativeSectionStateHistoryLength = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v2;
}

- (void)setState:(unint64_t)a3 withReason:(id)a4 agent:(id)a5 stage:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t state;
  NSObject *v14;
  const char *v15;
  uint8_t *v16;
  CLSCurationDebugStateEntry *v17;
  __int16 v18;
  uint8_t buf[2];

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (a3)
  {
    state = self->_state;
    switch(state)
    {
      case 1uLL:
        goto LABEL_5;
      case 4uLL:
        a3 = 4;
        break;
      case 3uLL:
LABEL_5:
        if (a3 == 4)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v18 = 0;
            v14 = MEMORY[0x1E0C81028];
            v15 = "Algorithms should always be aware of the Required state";
            v16 = (uint8_t *)&v18;
LABEL_10:
            _os_log_error_impl(&dword_1CAB79000, v14, OS_LOG_TYPE_ERROR, v15, v16, 2u);
            goto LABEL_13;
          }
          goto LABEL_13;
        }
        break;
    }
    self->_state = a3;
    v17 = -[CLSCurationDebugStateEntry initWithState:reason:agent:stage:]([CLSCurationDebugStateEntry alloc], "initWithState:reason:agent:stage:", a3, v10, v11, v12);
    -[NSMutableArray addObject:](self->_stateHistory, "addObject:", v17);

    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v14 = MEMORY[0x1E0C81028];
    v15 = "Curation Object can't transition to Unknown state, use resetWithReason to reset it.";
    v16 = buf;
    goto LABEL_10;
  }
LABEL_13:

}

- (void)resetWithReason:(id)a3 agent:(id)a4 stage:(id)a5
{
  id v8;
  id v9;
  id v10;
  CLSCurationDebugStateEntry *v11;

  if (self->_state != 4)
    self->_state = 0;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CLSCurationDebugStateEntry initWithState:reason:agent:stage:]([CLSCurationDebugStateEntry alloc], "initWithState:reason:agent:stage:", self->_state, v10, v9, v8);

  -[NSMutableArray addObject:](self->_stateHistory, "addObject:", v11);
}

- (void)beginTentativeSection
{
  uint8_t v2[16];

  if (self->_tentativeSectionStateHistoryLength == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_stateAtBeginningOfTentativeSection = self->_state;
    self->_tentativeSectionStateHistoryLength = -[NSMutableArray count](self->_stateHistory, "count");
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Only one tentative section supported at a time", v2, 2u);
  }
}

- (void)endTentativeSectionWithSuccess:(BOOL)a3
{
  unint64_t tentativeSectionStateHistoryLength;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  unint64_t v9;
  unint64_t v10;
  __int16 v11;
  __int16 v12;

  tentativeSectionStateHistoryLength = self->_tentativeSectionStateHistoryLength;
  if (tentativeSectionStateHistoryLength == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return;
    v12 = 0;
    v4 = MEMORY[0x1E0C81028];
    v5 = "Can't end a tentative section that didn't begin";
    v6 = (uint8_t *)&v12;
LABEL_7:
    _os_log_error_impl(&dword_1CAB79000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    return;
  }
  if (tentativeSectionStateHistoryLength > -[NSMutableArray count](self->_stateHistory, "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      return;
    v11 = 0;
    v4 = MEMORY[0x1E0C81028];
    v5 = "Consistency error, state history can't be shorter at the end of a tentative section than at the beginning";
    v6 = (uint8_t *)&v11;
    goto LABEL_7;
  }
  if (!a3)
  {
    v9 = self->_tentativeSectionStateHistoryLength;
    if (v9 < -[NSMutableArray count](self->_stateHistory, "count"))
    {
      v10 = self->_tentativeSectionStateHistoryLength;
      self->_state = self->_stateAtBeginningOfTentativeSection;
      -[NSMutableArray removeObjectsInRange:](self->_stateHistory, "removeObjectsInRange:", v10, -[NSMutableArray count](self->_stateHistory, "count") - self->_tentativeSectionStateHistoryLength);
    }
  }
  *(_OWORD *)&self->_tentativeSectionStateHistoryLength = xmmword_1CABE90B0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v25;
  void *v26;
  NSMutableArray *obj;
  CLSCurationDebugObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  _QWORD v34[4];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self;
  objc_msgSend((id)objc_opt_class(), "stringForState:", self->_state);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("state"));
  v25 = (void *)v4;
  v26 = v3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](v28->_stateHistory, "count"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v28->_stateHistory;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v33[0] = CFSTR("state");
        objc_msgSend((id)objc_opt_class(), "stringForState:", objc_msgSend(v10, "state", v25));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          v13 = (const __CFString *)v11;
        else
          v13 = CFSTR("Invalid");
        v34[0] = v13;
        v33[1] = CFSTR("agent");
        objc_msgSend(v10, "agent");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
          v16 = (const __CFString *)v14;
        else
          v16 = CFSTR("Invalid");
        v34[1] = v16;
        v33[2] = CFSTR("stage");
        objc_msgSend(v10, "stage");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v17)
          v19 = (const __CFString *)v17;
        else
          v19 = CFSTR("Invalid");
        v34[2] = v19;
        v33[3] = CFSTR("reason");
        objc_msgSend(v10, "reason");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
          v22 = (const __CFString *)v20;
        else
          v22 = CFSTR("Invalid");
        v34[3] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v23);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v7);
  }

  objc_msgSend(v26, "setObject:forKeyedSubscript:", v5, CFSTR("stateHistory"));
  return v26;
}

- (id)timestamp
{
  return 0;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSArray)stateHistory
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateHistory, 0);
}

+ (id)stringForState:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("Invalid State");
  else
    return off_1E84F9278[a3];
}

@end
