@implementation OSLogEventSerializer

- (OSLogEventSerializer)initWithSource:(id)a3 dataProcessingBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  OSLogEventSerializer *v12;
  OSLogEventStream *v13;
  OSLogEventStream *stream;
  NSMutableArray *v15;
  NSMutableArray *curBatchDictionaries;
  _OSLogEventSerializationMetadata *v17;
  _OSLogEventSerializationMetadata *metadata;
  OSLogEventStream *v19;
  uint64_t v20;
  id v21;
  OSLogEventStream *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    v32.receiver = self;
    v32.super_class = (Class)OSLogEventSerializer;
    self = -[OSLogEventSerializer init](&v32, sel_init);
    if (!self)
    {
LABEL_6:
      self = self;
      v12 = self;
      goto LABEL_7;
    }
    v13 = -[OSLogEventStream initWithSource:]([OSLogEventStream alloc], "initWithSource:", v8);
    stream = self->_stream;
    self->_stream = v13;

    self->_maxLogEventBatchSize = 1000;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    curBatchDictionaries = self->_curBatchDictionaries;
    self->_curBatchDictionaries = v15;

    v17 = objc_alloc_init(_OSLogEventSerializationMetadata);
    metadata = self->_metadata;
    self->_metadata = v17;

    -[OSLogEventSerializer stream](self, "stream");
    v12 = (OSLogEventSerializer *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_initWeak(&location, self);
      v19 = self->_stream;
      v20 = MEMORY[0x1E0C809B0];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke;
      v28[3] = &unk_1E4157E70;
      objc_copyWeak(&v30, &location);
      v21 = v9;
      v29 = v21;
      -[OSLogEventStreamBase setEventHandler:](v19, "setEventHandler:", v28);
      v22 = self->_stream;
      v24[0] = v20;
      v24[1] = 3221225472;
      v24[2] = __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke_2;
      v24[3] = &unk_1E4157E98;
      objc_copyWeak(&v27, &location);
      v25 = v21;
      v26 = v11;
      -[OSLogEventStreamBase setInvalidationHandler:](v22, "setInvalidationHandler:", v24);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
  }
LABEL_7:

  return v12;
}

- (void)setFlags:(unint64_t)a3
{
  id v4;

  -[OSLogEventSerializer stream](self, "stream");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFlags:", a3);

}

- (unint64_t)flags
{
  void *v2;
  unint64_t v3;

  -[OSLogEventSerializer stream](self, "stream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "flags");

  return v3;
}

- (void)setFilterPredicate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OSLogEventSerializer stream](self, "stream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilterPredicate:", v4);

}

- (NSPredicate)filterPredicate
{
  void *v2;
  void *v3;

  -[OSLogEventSerializer stream](self, "stream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v3;
}

- (void)setTarget:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OSLogEventSerializer stream](self, "stream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTarget:", v4);

}

- (OS_dispatch_queue)target
{
  void *v2;
  void *v3;

  -[OSLogEventSerializer stream](self, "stream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "target");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (OSLogEventSource)source
{
  void *v2;
  void *v3;

  -[OSLogEventSerializer stream](self, "stream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OSLogEventSource *)v3;
}

- (void)serializeFromDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[OSLogEventSerializer stream](self, "stream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v7)
  {
    objc_msgSend(v4, "activateStreamFromDate:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activateStreamFromDate:", v6);

  }
}

- (void)serializeFromDate:(id)a3 toDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[OSLogEventSerializer stream](self, "stream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v11)
  {
    if (v6)
    {
LABEL_3:
      objc_msgSend(v7, "activateStreamFromDate:toDate:", v8, v6);
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_3;
  }
  -[OSLogEventStream source](self->_stream, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "newestDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateStreamFromDate:toDate:", v8, v10);

LABEL_6:
  if (!v11)

}

- (void)serializeFromLastBoot
{
  id v2;

  -[OSLogEventSerializer stream](self, "stream");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateStreamFromLastBoot");

}

- (void)serializeFromPosition:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OSLogEventSerializer stream](self, "stream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateStreamFromPosition:", v4);

}

- (void)invalidate
{
  id v2;

  -[OSLogEventSerializer stream](self, "stream");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)_serializeEvent:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[OSLogEventSerializer metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v14, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSLogEventSerializer metadata](self, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFirstDate:", v7);

  }
  objc_msgSend(v14, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogEventSerializer metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLastDate:", v9);

  -[OSLogEventSerializer setCurBatchSize:](self, "setCurBatchSize:", -[OSLogEventSerializer curBatchSize](self, "curBatchSize") + 1);
  ++self->_serializedEventCount;
  -[OSLogEventSerializer _dictionaryForProxy:](self, "_dictionaryForProxy:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 307, CFSTR("Encountered serialization failure"));

  }
  -[OSLogEventSerializer curBatchDictionaries](self, "curBatchDictionaries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v11);

}

- (BOOL)_isBatchCompleted
{
  unint64_t v3;

  v3 = -[OSLogEventSerializer curBatchSize](self, "curBatchSize");
  return v3 >= -[OSLogEventSerializer maxLogEventBatchSize](self, "maxLogEventBatchSize");
}

- (id)_dictForPlaceholder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[OSLogEventSerializer metadata](self, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexForString:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("rs"));

  }
  objc_msgSend(v4, "tokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v30 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v29 = v10;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v16);
          -[OSLogEventSerializer metadata](self, "metadata", v29);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "indexForString:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v19);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v14);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("t"));
    v10 = v29;
    v6 = v30;
  }
  objc_msgSend(v4, "typeNamespace", v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[OSLogEventSerializer metadata](self, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "indexForString:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("tn"));

  }
  objc_msgSend(v4, "type");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[OSLogEventSerializer metadata](self, "metadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "indexForString:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("ty"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "width"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("w"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "precision"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("p"));

  return v5;
}

- (id)_dictForArg:(id)a3 shouldRedactValue:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    v8 = 2;
  else
    v8 = objc_msgSend(v6, "availability");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("a"));

  if (objc_msgSend(v6, "availability"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "availability"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("a"));

  }
  if (objc_msgSend(v6, "privacy"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "privacy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("p"));

  }
  if (objc_msgSend(v6, "category"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "category"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("c"));

  }
  if (objc_msgSend(v6, "category") == 1)
  {
    if (objc_msgSend(v6, "scalarCategory"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "scalarCategory"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("sc"));

    }
    if (objc_msgSend(v6, "scalarType"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "scalarType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("st"));

    }
  }
  if (v8 == 3 || !v8)
  {
    objc_msgSend(v6, "objectRepresentation");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      if (objc_msgSend(v6, "category") != 2
        || (-[OSLogEventSerializer metadata](self, "metadata"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v17, "indexForString:", v16),
            v18 = objc_claimAutoreleasedReturnValue(),
            v16,
            v17,
            (v16 = (void *)v18) != 0))
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("or"));

      }
    }
  }

  return v7;
}

- (id)_dictForDecomposedMessage:(id)a3 index:(unint64_t)a4 shouldRedact:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a5;
  v8 = a3;
  objc_msgSend(v8, "literalPrefixAtIndex:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeholderAtIndex:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "argumentAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 || v10 || v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[OSLogEventSerializer metadata](self, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "indexForString:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("lp"));

    }
    if (v10)
    {
      -[OSLogEventSerializer _dictForPlaceholder:](self, "_dictForPlaceholder:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("p"));

    }
    if (v11)
    {
      -[OSLogEventSerializer _dictForArg:shouldRedactValue:](self, "_dictForArg:shouldRedactValue:", v11, v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("a"));

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_arrayForDecomposedMessage:(id)a3 indicesToRedact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeholderCount");
  v9 = 0;
  do
  {
    -[OSLogEventSerializer _dictForDecomposedMessage:index:shouldRedact:](self, "_dictForDecomposedMessage:index:shouldRedact:", v6, v9, objc_msgSend(v7, "containsIndex:", v9));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      break;
    v11 = (void *)v10;
    objc_msgSend(v8, "addObject:", v10);

    ++v9;
  }
  while (v9 <= objc_msgSend(v6, "placeholderCount"));

  return v8;
}

- (id)_dictForDecomposedMessage:(id)a3 indicesToRedact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (objc_msgSend(v6, "placeholderCount"))
    {
      v15[0] = CFSTR("pc");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "placeholderCount"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v15[1] = CFSTR("s");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "state"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v9;
      v15[2] = CFSTR("seg");
      -[OSLogEventSerializer _arrayForDecomposedMessage:indicesToRedact:](self, "_arrayForDecomposedMessage:indicesToRedact:", v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13[0] = CFSTR("pc");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "placeholderCount"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = CFSTR("s");
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "state"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_dictionaryForProxy:(id)a3
{
  id v4;
  void *v5;
  void (**argumentRedactionBlock)(id, id);
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    argumentRedactionBlock = (void (**)(id, id))self->_argumentRedactionBlock;
    if (argumentRedactionBlock)
    {
      argumentRedactionBlock[2](argumentRedactionBlock, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        if (objc_msgSend(v7, "count"))
        {
          v9 = objc_msgSend(v8, "firstIndex");
          objc_msgSend(v4, "decomposedMessage");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "placeholderCount");

          if (v9 < v11)
          {
            -[OSLogEventSerializer metadata](self, "metadata");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "indexForString:", CFSTR("<value-redacted>"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("cm"));
            goto LABEL_11;
          }
        }
      }
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v4, "composedMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_12;
    -[OSLogEventSerializer metadata](self, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "composedMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indexForString:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("cm"));

LABEL_11:
LABEL_12:
    objc_msgSend(v4, "processImagePath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[OSLogEventSerializer metadata](self, "metadata");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "processImagePath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "indexForString:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("pip"));

    }
    objc_msgSend(v4, "process");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[OSLogEventSerializer metadata](self, "metadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "process");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "indexForString:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("p"));

    }
    objc_msgSend(v4, "senderImagePath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[OSLogEventSerializer metadata](self, "metadata");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "senderImagePath");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "indexForString:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("sip"));

    }
    objc_msgSend(v4, "sender");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      -[OSLogEventSerializer metadata](self, "metadata");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sender");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "indexForString:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("send"));

    }
    if (objc_msgSend(v4, "type"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "type"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("t"));

    }
    if (objc_msgSend(v4, "logType"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "logType"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("lt"));

    }
    if (objc_msgSend(v4, "size"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v4, "size"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("s"));

    }
    if (objc_msgSend(v4, "timeToLive"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "timeToLive"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("ttl"));

    }
    if (objc_msgSend(v4, "traceIdentifier"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "traceIdentifier"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("ti"));

    }
    if (objc_msgSend(v4, "threadIdentifier"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "threadIdentifier"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, CFSTR("tid"));

    }
    if (objc_msgSend(v4, "processIdentifier"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("pid"));

    }
    if (objc_msgSend(v4, "activityIdentifier"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "activityIdentifier"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("aid"));

    }
    if (objc_msgSend(v4, "parentActivityIdentifier"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "parentActivityIdentifier"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, CFSTR("paid"));

    }
    if (objc_msgSend(v4, "transitionActivityIdentifier"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "transitionActivityIdentifier"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, CFSTR("tai"));

    }
    if (objc_msgSend(v4, "continuousNanosecondsSinceBoot"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "continuousNanosecondsSinceBoot"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("ns"));

    }
    if (objc_msgSend(v4, "machContinuousTimestamp"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "machContinuousTimestamp"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("mct"));

    }
    if (objc_msgSend(v4, "senderImageOffset"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "senderImageOffset"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("sio"));

    }
    objc_msgSend(v4, "bootUUID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      objc_msgSend(v4, "bootUUID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      _dataForUUID(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v48, CFSTR("b"));

    }
    objc_msgSend(v4, "processImageUUID");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      objc_msgSend(v4, "processImageUUID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      _dataForUUID(v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("piu"));

    }
    objc_msgSend(v4, "senderImageUUID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend(v4, "senderImageUUID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      _dataForUUID(v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, CFSTR("siu"));

    }
    if (objc_msgSend(v4, "unixDate"))
    {
      _dictForTimeval(objc_msgSend(v4, "unixDate"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        _dictForTimeval(objc_msgSend(v4, "unixDate"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v56, CFSTR("ud"));

      }
    }
    if (objc_msgSend(v4, "unixTimeZone"))
    {
      _dictForTimezone((unsigned int *)objc_msgSend(v4, "unixTimeZone"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        _dictForTimezone((unsigned int *)objc_msgSend(v4, "unixTimeZone"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v58, CFSTR("utz"));

      }
    }
    objc_msgSend(v4, "backtrace");
    v59 = objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      v60 = (void *)v59;
      objc_msgSend(v4, "backtrace");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "frames");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "count");

      if (v63 >= 2)
      {
        objc_msgSend(v4, "backtrace");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        _dictArrayForBacktrace(v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        if (v65)
        {
          objc_msgSend(v4, "backtrace");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          _dictArrayForBacktrace(v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v67, CFSTR("bt"));

        }
      }
    }
    v68 = objc_msgSend(v4, "type");
    if (v68 <= 1023)
    {
      if (v68 == 513)
      {
        if (objc_msgSend(v4, "creatorActivityIdentifier"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "creatorActivityIdentifier"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v102, CFSTR("cai"));

        }
        if (!objc_msgSend(v4, "creatorProcessUniqueIdentifier"))
          goto LABEL_109;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "creatorProcessUniqueIdentifier"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = CFSTR("cpui");
        goto LABEL_107;
      }
      if (v68 != 768)
        goto LABEL_109;
    }
    else
    {
      if (v68 != 1024)
      {
        if (v68 != 1536)
        {
          if (v68 != 1792)
            goto LABEL_109;
          if (objc_msgSend(v4, "lossStartMachContinuousTimestamp"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "lossStartMachContinuousTimestamp"));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v69, CFSTR("lsmct"));

          }
          if (objc_msgSend(v4, "lossEndMachContinuousTimestamp"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "lossEndMachContinuousTimestamp"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v70, CFSTR("lemct"));

          }
          if (objc_msgSend(v4, "lossStartUnixDate"))
          {
            _dictForTimeval(objc_msgSend(v4, "lossStartUnixDate"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              _dictForTimeval(objc_msgSend(v4, "lossStartUnixDate"));
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v72, CFSTR("lsud"));

            }
          }
          if (objc_msgSend(v4, "lossEndUnixDate"))
          {
            _dictForTimeval(objc_msgSend(v4, "lossEndUnixDate"));
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            if (v73)
            {
              _dictForTimeval(objc_msgSend(v4, "lossEndUnixDate"));
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v74, CFSTR("leud"));

            }
          }
          if (objc_msgSend(v4, "lossStartUnixTimeZone"))
          {
            _dictForTimezone((unsigned int *)objc_msgSend(v4, "lossStartUnixTimeZone"));
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            if (v75)
            {
              _dictForTimezone((unsigned int *)objc_msgSend(v4, "lossStartUnixTimeZone"));
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v76, CFSTR("lsutz"));

            }
          }
          if (objc_msgSend(v4, "lossEndUnixTimeZone"))
          {
            _dictForTimezone((unsigned int *)objc_msgSend(v4, "lossEndUnixTimeZone"));
            v77 = (void *)objc_claimAutoreleasedReturnValue();

            if (v77)
            {
              _dictForTimezone((unsigned int *)objc_msgSend(v4, "lossEndUnixTimeZone"));
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v78, CFSTR("leutz"));

            }
          }
          _dictForLossCount(objc_msgSend(v4, "lossCount"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v79)
            goto LABEL_109;
          _dictForLossCount(objc_msgSend(v4, "lossCount"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = CFSTR("lc");
          goto LABEL_107;
        }
        if (objc_msgSend(v4, "signpostIdentifier"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "signpostIdentifier"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v82, CFSTR("si"));

        }
        if (objc_msgSend(v4, "signpostType"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "signpostType"));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v83, CFSTR("st"));

        }
        if (objc_msgSend(v4, "signpostScope"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "signpostScope"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v84, CFSTR("ss"));

        }
        objc_msgSend(v4, "signpostName");
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        if (v85)
        {
          -[OSLogEventSerializer metadata](self, "metadata");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "signpostName");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "indexForString:", v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v88, CFSTR("sn"));

        }
      }
      objc_msgSend(v4, "subsystem");
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      if (v89)
      {
        -[OSLogEventSerializer metadata](self, "metadata");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "subsystem");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "indexForString:", v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v92, CFSTR("sub"));

      }
      objc_msgSend(v4, "category");
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      if (v93)
      {
        -[OSLogEventSerializer metadata](self, "metadata");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "category");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "indexForString:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v96, CFSTR("cat"));

      }
    }
    objc_msgSend(v4, "formatString");
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {
      -[OSLogEventSerializer metadata](self, "metadata");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "formatString");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "indexForString:", v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v100, CFSTR("f"));

    }
    objc_msgSend(v4, "decomposedMessage");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[OSLogEventSerializer _dictForDecomposedMessage:indicesToRedact:](self, "_dictForDecomposedMessage:indicesToRedact:", v101, v8);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v80)
      goto LABEL_108;
    v81 = CFSTR("dm");
LABEL_107:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v80, v81);
LABEL_108:

LABEL_109:
    v14 = v5;

    goto LABEL_110;
  }
  v14 = 0;
LABEL_110:

  return v14;
}

- (void)_completeBatch:(id)a3
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSMutableArray *v10;
  NSMutableArray *curBatchDictionaries;
  void *v12;
  id v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  v14[0] = CFSTR("Version");
  v14[1] = CFSTR("Events");
  v15[0] = &unk_1E41653E0;
  -[OSLogEventSerializer curBatchDictionaries](self, "curBatchDictionaries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 608, CFSTR("Failed to serialize to plist format"));

  }
  v5[2](v5, v8);
  self->_curBatchSize = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  curBatchDictionaries = self->_curBatchDictionaries;
  self->_curBatchDictionaries = v10;

}

- (OSLogEventStream)stream
{
  return self->_stream;
}

- (unint64_t)maxLogEventBatchSize
{
  return self->_maxLogEventBatchSize;
}

- (void)setMaxLogEventBatchSize:(unint64_t)a3
{
  self->_maxLogEventBatchSize = a3;
}

- (unint64_t)curBatchSize
{
  return self->_curBatchSize;
}

- (void)setCurBatchSize:(unint64_t)a3
{
  self->_curBatchSize = a3;
}

- (NSMutableArray)curBatchDictionaries
{
  return self->_curBatchDictionaries;
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (unint64_t)serializedEventCount
{
  return self->_serializedEventCount;
}

- (id)argumentRedactionBlock
{
  return self->_argumentRedactionBlock;
}

- (void)setArgumentRedactionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_argumentRedactionBlock, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_curBatchDictionaries, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

void __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_serializeEvent:", v4);

  if (objc_msgSend(WeakRetained, "_isBatchCompleted"))
    objc_msgSend(WeakRetained, "_completeBatch:", *(_QWORD *)(a1 + 32));

}

void __75__OSLogEventSerializer_initWithSource_dataProcessingBlock_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(WeakRetained, "curBatchSize"))
    objc_msgSend(WeakRetained, "_completeBatch:", *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "flags");
  objc_msgSend(WeakRetained, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFlags:", v4);

  objc_msgSend(WeakRetained, "filterPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilterPredicateDescription:", v7);

  v9 = objc_msgSend(WeakRetained, "maxLogEventBatchSize");
  objc_msgSend(WeakRetained, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaxLogEventBatchSize:", v9);

  v11 = objc_msgSend(WeakRetained, "serializedEventCount");
  objc_msgSend(WeakRetained, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSerializedEventCount:", v11);

  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dataRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v13 + 16))(v13, v15, a2);

}

@end
