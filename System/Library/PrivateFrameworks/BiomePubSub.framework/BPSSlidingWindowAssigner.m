@implementation BPSSlidingWindowAssigner

- (BPSSlidingWindowAssigner)initWithInterval:(double)a3 slide:(double)a4 aggregator:(id)a5
{
  return -[BPSSlidingWindowAssigner initWithInterval:slide:timestamp:aggregator:](self, "initWithInterval:slide:timestamp:aggregator:", &__block_literal_global_9, a5, a3, a4);
}

uint64_t __62__BPSSlidingWindowAssigner_initWithInterval_slide_aggregator___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (BPSSlidingWindowAssigner)initWithInterval:(double)a3 slide:(double)a4 timestamp:(id)a5 aggregator:(id)a6
{
  id v11;
  id v12;
  BPSSlidingWindowAssigner *v13;
  BPSSlidingWindowAssigner *v14;
  uint64_t v15;
  id timestamp;
  void *v18;
  void *v19;
  objc_super v20;

  v11 = a5;
  v12 = a6;
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSSlidingWindowAssigner.m"), 33, CFSTR("Expecting interval to be greater than 0"));

  }
  if (a4 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSSlidingWindowAssigner.m"), 34, CFSTR("Expecting slide to be greater than 0"));

  }
  v20.receiver = self;
  v20.super_class = (Class)BPSSlidingWindowAssigner;
  v13 = -[BPSSlidingWindowAssigner init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_interval = a3;
    v13->_slide = a4;
    v15 = objc_msgSend(v11, "copy");
    timestamp = v14->_timestamp;
    v14->_timestamp = (id)v15;

    objc_storeStrong((id *)&v14->_aggregator, a6);
    v14->_identifier = 0;
  }

  return v14;
}

- (id)assignWindow:(id)a3 input:(id)a4
{
  _QWORD *timestamp;
  void (*v7)(_QWORD *, id);
  id v8;
  void *v9;
  void *v10;

  timestamp = self->_timestamp;
  v7 = (void (*)(_QWORD *, id))timestamp[2];
  v8 = a3;
  v7(timestamp, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_slide >= self->_interval)
    -[BPSSlidingWindowAssigner assignWindowNonOverlappingIntervals:timestamp:](self, "assignWindowNonOverlappingIntervals:timestamp:", v8, v9);
  else
    -[BPSSlidingWindowAssigner assignWindowOverlappingIntervals:timestamp:](self, "assignWindowOverlappingIntervals:timestamp:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)assignWindowOverlappingIntervals:(id)a3 timestamp:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BPSTimeWindowProducer *v32;
  BPSAggregator *aggregator;
  unint64_t v34;
  void *v35;
  BPSTimeWindowProducer *v36;
  id v37;
  void *v38;
  void *v39;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v16, "dateInterval");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsDate:", v6);

        if (v18)
        {
          objc_msgSend(v8, "addObject:", v16);
          v19 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v16, "dateInterval");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeIntervalSinceReferenceDate");
          objc_msgSend(v19, "numberWithDouble:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v22);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v13);
  }

  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  if (v23 < 0.0)
    v23 = v23 + -1.0;
  v24 = self->_slide * trunc(v23 / self->_slide);
  v25 = self->_interval + -0.0001;
  v26 = 0x1E0CB3000uLL;
  v27 = objc_alloc(MEMORY[0x1E0CB3588]);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v24);
  v29 = (void *)objc_msgSend(v27, "initWithStartDate:duration:", v28, v25);

  if (objc_msgSend(v29, "containsDate:", v6))
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v10, "containsObject:", v30);

      if ((v31 & 1) == 0)
      {
        v32 = [BPSTimeWindowProducer alloc];
        aggregator = self->_aggregator;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_identifier);
        v34 = v26;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[BPSTimeWindowProducer initWithDateInterval:aggregator:identifier:](v32, "initWithDateInterval:aggregator:identifier:", v29, aggregator, v35);
        objc_msgSend(v8, "addObject:", v36);

        v26 = v34;
        ++self->_identifier;
      }
      v24 = v24 - self->_slide;
      v37 = objc_alloc(*(Class *)(v26 + 1416));
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v24);
      v39 = (void *)objc_msgSend(v37, "initWithStartDate:duration:", v38, v25);

      v29 = v39;
    }
    while ((objc_msgSend(v39, "containsDate:", v6) & 1) != 0);
  }
  else
  {
    v39 = v29;
  }

  return v8;
}

- (id)assignWindowNonOverlappingIntervals:(id)a3 timestamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  BPSTimeWindowProducer *v24;
  BPSAggregator *aggregator;
  void *v26;
  BPSTimeWindowProducer *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v15, "dateInterval");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsDate:", v7);

        if (v17)
        {
          objc_msgSend(v9, "addObject:", v15);
          v23 = v10;
          goto LABEL_14;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v12)
        continue;
      break;
    }
  }

  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  if (v18 < 0.0)
    v18 = v18 + -1.0;
  v19 = self->_slide * trunc(v18 / self->_slide);
  v20 = self->_interval + -0.0001;
  v21 = objc_alloc(MEMORY[0x1E0CB3588]);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v19);
  v23 = (void *)objc_msgSend(v21, "initWithStartDate:duration:", v22, v20);

  if (objc_msgSend(v23, "containsDate:", v7))
  {
    v24 = [BPSTimeWindowProducer alloc];
    aggregator = self->_aggregator;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_identifier);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[BPSTimeWindowProducer initWithDateInterval:aggregator:identifier:](v24, "initWithDateInterval:aggregator:identifier:", v23, aggregator, v26);
    objc_msgSend(v9, "addObject:", v27);

    ++self->_identifier;
  }
LABEL_14:

  return v9;
}

- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4
{
  _QWORD *timestamp;
  void (*v7)(_QWORD *, id);
  id v8;
  id v9;
  void *v10;
  void *v11;

  timestamp = self->_timestamp;
  v7 = (void (*)(_QWORD *, id))timestamp[2];
  v8 = a4;
  v9 = a3;
  v7(timestamp, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_slide >= self->_interval)
    -[BPSSlidingWindowAssigner updateWindowStateNonOverlappingIntervals:timestamp:input:](self, "updateWindowStateNonOverlappingIntervals:timestamp:input:", v9, v10, v8);
  else
    -[BPSSlidingWindowAssigner updateWindowStateOverlappingIntervals:timestamp:input:](self, "updateWindowStateOverlappingIntervals:timestamp:input:", v9, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)updateWindowStateOverlappingIntervals:(id)a3 timestamp:(id)a4 input:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  BPSTimeWindowState *v33;
  void *v34;
  void *v35;
  BPSTimeWindowState *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v45 = a5;
  v46 = (void *)objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v48 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v15, "dateInterval");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsDate:", v9);

        if (v17)
        {
          -[BPSAggregator closure](self->_aggregator, "closure");
          v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "aggregate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, id))v18)[2](v18, v19, v45);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setAggregate:", v20);

          v21 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "dateInterval");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "startDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timeIntervalSinceReferenceDate");
          objc_msgSend(v21, "numberWithDouble:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v24);

        }
        else
        {
          objc_msgSend(v15, "setCompleted:", 1);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  if (v25 < 0.0)
    v25 = v25 + -1.0;
  v26 = self->_slide * trunc(v25 / self->_slide);
  v44 = (id)objc_opt_new();
  v27 = self->_interval + -0.0001;
  v28 = objc_alloc(MEMORY[0x1E0CB3588]);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v26);
  v30 = (void *)objc_msgSend(v28, "initWithStartDate:duration:", v29, v27);

  if (objc_msgSend(v30, "containsDate:", v9))
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v46, "containsObject:", v31);

      if ((v32 & 1) == 0)
      {
        v33 = [BPSTimeWindowState alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_identifier);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[BPSAggregator accumulator](self->_aggregator, "accumulator");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[BPSTimeWindowState initWithDateInterval:identifier:aggregate:completed:](v33, "initWithDateInterval:identifier:aggregate:completed:", v30, v34, v35, 0);

        -[BPSAggregator closure](self->_aggregator, "closure");
        v37 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        -[BPSWindowState aggregate](v36, "aggregate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, id))v37)[2](v37, v38, v45);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[BPSWindowState setAggregate:](v36, "setAggregate:", v39);

        objc_msgSend(v44, "addObject:", v36);
        ++self->_identifier;

      }
      v26 = v26 - self->_slide;
      v40 = objc_alloc(MEMORY[0x1E0CB3588]);
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v26);
      v42 = (void *)objc_msgSend(v40, "initWithStartDate:duration:", v41, v27);

      v30 = v42;
    }
    while ((objc_msgSend(v42, "containsDate:", v9) & 1) != 0);
  }
  else
  {
    v42 = v30;
  }

  return v44;
}

- (id)updateWindowStateNonOverlappingIntervals:(id)a3 timestamp:(id)a4 input:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  BPSTimeWindowState *v28;
  void *v29;
  void *v30;
  BPSTimeWindowState *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  void *v33;
  void *v34;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v36 = a5;
  obj = v8;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v10)
    goto LABEL_13;
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v39 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      objc_msgSend(v15, "dateInterval");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsDate:", v9);

      if (v17)
      {
        -[BPSAggregator closure](self->_aggregator, "closure");
        v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "aggregate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, id))v18)[2](v18, v19, v36);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAggregate:", v20);

        v21 = v15;
        v12 = v21;
      }
      else
      {
        objc_msgSend(v15, "setCompleted:", 1);
      }
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  }
  while (v11);
  if (v12)
  {
    v22 = (void *)objc_opt_new();
  }
  else
  {
LABEL_13:
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    if (v23 < 0.0)
      v23 = v23 + -1.0;
    v24 = self->_slide * trunc(v23 / self->_slide);
    v22 = (void *)objc_opt_new();
    v25 = self->_interval + -0.0001;
    v26 = objc_alloc(MEMORY[0x1E0CB3588]);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v24);
    v12 = (void *)objc_msgSend(v26, "initWithStartDate:duration:", v27, v25);

    if (objc_msgSend(v12, "containsDate:", v9))
    {
      v28 = [BPSTimeWindowState alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_identifier);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSAggregator accumulator](self->_aggregator, "accumulator");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[BPSTimeWindowState initWithDateInterval:identifier:aggregate:completed:](v28, "initWithDateInterval:identifier:aggregate:completed:", v12, v29, v30, 0);

      -[BPSAggregator closure](self->_aggregator, "closure");
      v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[BPSWindowState aggregate](v31, "aggregate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id))v32)[2](v32, v33, v36);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[BPSWindowState setAggregate:](v31, "setAggregate:", v34);

      objc_msgSend(v22, "addObject:", v31);
      ++self->_identifier;

    }
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end
