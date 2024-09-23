@implementation BPSTumblingWindowAssigner

- (BPSTumblingWindowAssigner)initWithInterval:(double)a3 aggregator:(id)a4
{
  return -[BPSTumblingWindowAssigner initWithInterval:timestamp:aggregator:](self, "initWithInterval:timestamp:aggregator:", &__block_literal_global_2, a4, a3);
}

uint64_t __57__BPSTumblingWindowAssigner_initWithInterval_aggregator___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (BPSTumblingWindowAssigner)initWithInterval:(double)a3 timestamp:(id)a4 aggregator:(id)a5
{
  id v9;
  id v10;
  BPSTumblingWindowAssigner *v11;
  BPSTumblingWindowAssigner *v12;
  uint64_t v13;
  id timestamp;
  void *v16;
  objc_super v17;

  v9 = a4;
  v10 = a5;
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSTumblingWindowAssigner.m"), 30, CFSTR("Expecting interval to be greater than 0"));

  }
  v17.receiver = self;
  v17.super_class = (Class)BPSTumblingWindowAssigner;
  v11 = -[BPSTumblingWindowAssigner init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_interval = a3;
    v13 = objc_msgSend(v9, "copy");
    timestamp = v12->_timestamp;
    v12->_timestamp = (id)v13;

    objc_storeStrong((id *)&v12->_aggregator, a5);
    v12->_identifier = 0;
  }

  return v12;
}

- (id)assignWindow:(id)a3 input:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  BPSTimeWindowProducer *v15;
  double v16;
  double interval;
  double v18;
  double v19;
  BPSTimeWindowProducer *v20;
  id v21;
  void *v22;
  void *v23;
  BPSAggregator *aggregator;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  (*((void (**)(void))self->_timestamp + 2))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
      objc_msgSend(v12, "dateInterval");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsDate:", v6);

      if ((v14 & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v12;

    if (v15)
      goto LABEL_14;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  if (v16 < 0.0)
    v16 = v16 + -1.0;
  interval = self->_interval;
  v18 = interval * trunc(v16 / interval);
  v19 = interval + -0.0001;
  v20 = [BPSTimeWindowProducer alloc];
  v21 = objc_alloc(MEMORY[0x1E0CB3588]);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v18);
  v23 = (void *)objc_msgSend(v21, "initWithStartDate:duration:", v22, v19);
  aggregator = self->_aggregator;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_identifier);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[BPSTimeWindowProducer initWithDateInterval:aggregator:identifier:](v20, "initWithDateInterval:aggregator:identifier:", v23, aggregator, v25);

  ++self->_identifier;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BPSTimeWindowState *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  uint64_t v19;
  BPSTimeWindowState *v20;
  void *v21;
  id v22;
  BPSTumblingWindowAssigner *v23;
  void *v24;
  void *v25;
  double v26;
  double interval;
  double v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  BPSTimeWindowState *v33;
  void *v34;
  void *v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  void *v37;
  BPSTumblingWindowAssigner *v38;
  void *v39;
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v41 = a4;
  (*((void (**)(void))self->_timestamp + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v44;
    do
    {
      v13 = 0;
      v42 = v10;
      do
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v13);
        objc_msgSend(v14, "dateInterval");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "containsDate:", v7);

        if (v16)
        {
          -[BPSAggregator closure](self->_aggregator, "closure");
          v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "aggregate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, id))v17)[2](v17, v18, v41);
          v19 = v12;
          v20 = v11;
          v21 = v7;
          v22 = v8;
          v23 = self;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setAggregate:", v24);

          self = v23;
          v8 = v22;
          v7 = v21;

          v11 = v14;
          v12 = v19;
          v10 = v42;
        }
        else
        {
          objc_msgSend(v14, "setCompleted:", 1);
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  v25 = (void *)objc_opt_new();
  if (!v11)
  {
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    if (v26 < 0.0)
      v26 = v26 + -1.0;
    interval = self->_interval;
    v28 = interval * trunc(v26 / interval);
    v29 = interval + -0.0001;
    v30 = objc_alloc(MEMORY[0x1E0CB3588]);
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v28);
    v32 = (void *)objc_msgSend(v30, "initWithStartDate:duration:", v31, v29);

    v33 = [BPSTimeWindowState alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_identifier);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSAggregator accumulator](self->_aggregator, "accumulator");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BPSTimeWindowState initWithDateInterval:identifier:aggregate:completed:](v33, "initWithDateInterval:identifier:aggregate:completed:", v32, v34, v35, 0);

    -[BPSAggregator closure](self->_aggregator, "closure");
    v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[BPSWindowState aggregate](v11, "aggregate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v36)[2](v36, v37, v41);
    v38 = self;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSWindowState setAggregate:](v11, "setAggregate:", v39);

    objc_msgSend(v25, "addObject:", v11);
    ++v38->_identifier;

  }
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end
