@implementation BPSCountWindowAssigner

- (BPSCountWindowAssigner)initWithCapacity:(unint64_t)a3 aggregator:(id)a4
{
  id v7;
  BPSCountWindowAssigner *v8;
  BPSCountWindowAssigner *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BPSCountWindowAssigner;
  v8 = -[BPSCountWindowAssigner init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_capacity = a3;
    objc_storeStrong((id *)&v8->_aggregator, a4);
    v9->_identifier = 0;
  }

  return v9;
}

- (id)assignWindow:(id)a3 input:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BPSCountWindow *v11;
  BPSCountWindow *v12;
  unint64_t capacity;
  BPSAggregator *aggregator;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
      if (objc_msgSend(v10, "currentCount") < self->_capacity)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v10;

    if (v11)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v12 = [BPSCountWindow alloc];
  capacity = self->_capacity;
  aggregator = self->_aggregator;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_identifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BPSCountWindow initWithCapacity:aggregator:identifier:](v12, "initWithCapacity:aggregator:identifier:", capacity, aggregator, v15);

  ++self->_identifier;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  BPSCountWindowState *v16;
  BPSCountWindowState *v17;
  unint64_t capacity;
  void *v19;
  void *v20;
  unint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  unint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
      v15 = objc_msgSend(v14, "currentCount");
      if (v15 < objc_msgSend(v14, "capacity"))
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v16 = v14;

    if (v16)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v17 = [BPSCountWindowState alloc];
  capacity = self->_capacity;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_identifier);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSAggregator accumulator](self->_aggregator, "accumulator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[BPSCountWindowState initWithCapacity:currentCount:identifier:aggregate:completed:](v17, "initWithCapacity:currentCount:identifier:aggregate:completed:", capacity, 0, v19, v20, 0);

  objc_msgSend(v8, "addObject:", v16);
  ++self->_identifier;
  if (v16)
  {
LABEL_12:
    v21 = -[BPSCountWindowState currentCount](v16, "currentCount");
    if (v21 < -[BPSCountWindowState capacity](v16, "capacity"))
    {
      -[BPSCountWindowState setCurrentCount:](v16, "setCurrentCount:", -[BPSCountWindowState currentCount](v16, "currentCount") + 1);
      -[BPSAggregator closure](self->_aggregator, "closure");
      v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[BPSWindowState aggregate](v16, "aggregate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id))v22)[2](v22, v23, v7);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSWindowState setAggregate:](v16, "setAggregate:", v24);

      v25 = -[BPSCountWindowState currentCount](v16, "currentCount");
      if (v25 >= -[BPSCountWindowState capacity](v16, "capacity"))
        -[BPSWindowState setCompleted:](v16, "setCompleted:", 1);
    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end
