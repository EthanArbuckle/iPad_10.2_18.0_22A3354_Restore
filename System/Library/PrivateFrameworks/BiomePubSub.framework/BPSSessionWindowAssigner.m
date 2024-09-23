@implementation BPSSessionWindowAssigner

- (BPSSessionWindowAssigner)initWithGap:(double)a3 aggregator:(id)a4
{
  return -[BPSSessionWindowAssigner initWithGap:timestamp:aggregator:](self, "initWithGap:timestamp:aggregator:", &__block_literal_global_3, a4, a3);
}

uint64_t __51__BPSSessionWindowAssigner_initWithGap_aggregator___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (BPSSessionWindowAssigner)initWithGap:(double)a3 timestamp:(id)a4 aggregator:(id)a5
{
  id v9;
  id v10;
  BPSSessionWindowAssigner *v11;
  BPSSessionWindowAssigner *v12;
  uint64_t v13;
  id timestamp;
  uint64_t v15;
  NSDate *lastTimestamp;
  void *v18;
  objc_super v19;

  v9 = a4;
  v10 = a5;
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSSessionWindowAssigner.m"), 285, CFSTR("Expecting gap to be greater than 0"));

  }
  v19.receiver = self;
  v19.super_class = (Class)BPSSessionWindowAssigner;
  v11 = -[BPSSessionWindowAssigner init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_gap = a3;
    objc_storeStrong((id *)&v11->_aggregator, a5);
    v13 = objc_msgSend(v9, "copy");
    timestamp = v12->_timestamp;
    v12->_timestamp = (id)v13;

    v12->_identifier = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v15 = objc_claimAutoreleasedReturnValue();
    lastTimestamp = v12->_lastTimestamp;
    v12->_lastTimestamp = (NSDate *)v15;

  }
  return v12;
}

- (id)assignWindow:(id)a3 input:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  double v30;
  BPSSessionWindow *v31;
  void *v32;
  double gap;
  id timestamp;
  BPSAggregator *aggregator;
  void *v36;
  BPSSessionWindow *v37;
  id v38;
  void *v40;
  BPSSessionWindowAssigner *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v9, "mutableCopy");

  v44 = v8;
  (*((void (**)(void))self->_timestamp + 2))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;
  -[NSDate timeIntervalSinceReferenceDate](self->_lastTimestamp, "timeIntervalSinceReferenceDate");
  if (v12 < v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BPSSessionWindowAssigner.m"), 305, CFSTR("Session window expects timestamps to be monotonically increasing"));

  }
  v42 = v10;
  objc_storeStrong((id *)&self->_lastTimestamp, v10);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v15)
  {
    v16 = v15;
    v41 = self;
    v17 = 0;
    v18 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v46 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (!v17)
          goto LABEL_10;
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "integerValue");
        objc_msgSend(v17, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "integerValue");

        if (v22 > v24)
        {
LABEL_10:
          v25 = v20;

          v17 = v25;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v16);

    if (v17)
    {
      v26 = v43;
      objc_msgSend(v43, "addObject:", v17);
      objc_msgSend(v17, "dateInterval");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v42;
      v29 = objc_msgSend(v27, "containsDate:", v42);

      self = v41;
      if ((v29 & 1) != 0)
        goto LABEL_20;
      goto LABEL_19;
    }
    self = v41;
  }
  else
  {

    v17 = 0;
  }
  v28 = v42;
  v26 = v43;
LABEL_19:
  v30 = self->_gap + -0.0001;
  v31 = [BPSSessionWindow alloc];
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v28, v30);
  gap = self->_gap;
  aggregator = self->_aggregator;
  timestamp = self->_timestamp;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_identifier);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[BPSSessionWindow initWithDateInterval:gap:timestamp:aggregator:identifier:](v31, "initWithDateInterval:gap:timestamp:aggregator:identifier:", v32, timestamp, aggregator, v36, gap);
  objc_msgSend(v26, "addObject:", v37);

  ++self->_identifier;
LABEL_20:
  v38 = v26;

  return v38;
}

- (id)updateAndReturnNewWindowStates:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  BPSSessionWindowState *v26;
  void *v27;
  BPSSessionWindowState *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  int v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v51;
  BPSSessionWindowAssigner *v52;
  void *v53;
  id v54;
  id v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v54 = (id)objc_opt_new();
  v51 = (id)objc_opt_new();
  v52 = self;
  v53 = v7;
  (*((void (**)(void))self->_timestamp + 2))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  obj = v9;
  if (!v10)
  {

    v12 = 0;
LABEL_15:
    v21 = v54;
    goto LABEL_16;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v62;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v62 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
      if (!v12)
        goto LABEL_8;
      objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");
      objc_msgSend(v12, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "integerValue");

      if (v17 > v19)
      {
LABEL_8:
        v20 = v15;

        v12 = v20;
      }
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  }
  while (v11);

  if (!v12)
    goto LABEL_15;
  v21 = v54;
  objc_msgSend(v54, "addObject:", v12);
  objc_msgSend(v12, "dateInterval");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "containsDate:", v8);

  if ((v23 & 1) == 0)
  {
LABEL_16:
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v8, v52->_gap + -0.0001);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v52->_identifier);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = [BPSSessionWindowState alloc];
    -[BPSAggregator accumulator](v52->_aggregator, "accumulator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[BPSSessionWindowState initWithDateInterval:identifier:aggregate:completed:](v26, "initWithDateInterval:identifier:aggregate:completed:", v24, v25, v27, 0);

    objc_msgSend(v21, "addObject:", v28);
    objc_msgSend(v51, "addObject:", v28);
    ++v52->_identifier;

  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = v21;
  v29 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v58 != v31)
          objc_enumerationMutation(v55);
        v33 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
        objc_msgSend(v33, "dateInterval");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "containsDate:", v8);

        if (v35)
        {
          -[BPSAggregator closure](v52->_aggregator, "closure");
          v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "aggregate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v36)[2](v36, v37, v53);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setAggregate:", v38);

          objc_msgSend(v8, "timeIntervalSinceReferenceDate");
          v40 = v39;
          objc_msgSend(v33, "dateInterval");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "startDate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "timeIntervalSinceReferenceDate");
          v44 = v40 - v43 + v52->_gap + -0.0001;

          v45 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v33, "dateInterval");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "startDate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_msgSend(v45, "initWithStartDate:duration:", v47, v44);
          objc_msgSend(v33, "setDateInterval:", v48);

        }
        else
        {
          objc_msgSend(v33, "setCompleted:", 1);
        }
      }
      v30 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v30);
  }

  v49 = v51;
  return v49;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastTimestamp, 0);
  objc_storeStrong(&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end
