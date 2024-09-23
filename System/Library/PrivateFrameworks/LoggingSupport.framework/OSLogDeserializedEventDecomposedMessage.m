@implementation OSLogDeserializedEventDecomposedMessage

- (OSLogDeserializedEventDecomposedMessage)initWithDict:(id)a3 metadata:(id)a4
{
  id v8;
  id v9;
  OSLogDeserializedEventDecomposedMessage *v10;
  void *v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  OSLogDecomposedMessageSegment *v19;
  void *v20;
  NSArray *segments;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  SEL v26;
  id v27;
  OSLogDeserializedEventDecomposedMessage *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)OSLogDeserializedEventDecomposedMessage;
  v10 = -[OSLogDeserializedEventDecomposedMessage init](&v33, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("seg"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v27 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_opt_class();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("EventSerializer.m"), 1367, CFSTR("Unexpected class: %@. Expected: %@"), v24, objc_opt_class());

      }
      v26 = a2;
      v28 = v10;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v30;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v30 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v17);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_opt_class();
              objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v26, v28, CFSTR("EventSerializer.m"), 1370, CFSTR("Unexpected class: %@. Expected: %@"), v25, objc_opt_class());

            }
            v19 = -[OSLogDecomposedMessageSegment initWithDict:metadata:]([OSLogDecomposedMessageSegment alloc], "initWithDict:metadata:", v18, v9);
            -[NSArray addObject:](v12, "addObject:", v19);

            ++v17;
          }
          while (v15 != v17);
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v15);
      }

      v10 = v28;
      segments = v28->_segments;
      v28->_segments = v12;

      v8 = v27;
    }
    objc_storeStrong((id *)&v10->_backingDict, a3);

  }
  return v10;
}

- (unint64_t)placeholderCount
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[OSLogDeserializedEventDecomposedMessage backingDict](self, "backingDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1382, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)state
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[OSLogDeserializedEventDecomposedMessage backingDict](self, "backingDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("s"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1383, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)literalPrefixAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[OSLogDeserializedEventDecomposedMessage segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    -[OSLogDeserializedEventDecomposedMessage segments](self, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "literalPrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)placeholderAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[OSLogDeserializedEventDecomposedMessage segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    -[OSLogDeserializedEventDecomposedMessage segments](self, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "placeholder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)argumentAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[OSLogDeserializedEventDecomposedMessage segments](self, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    -[OSLogDeserializedEventDecomposedMessage segments](self, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "argument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (NSDictionary)backingDict
{
  return self->_backingDict;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_backingDict, 0);
}

@end
