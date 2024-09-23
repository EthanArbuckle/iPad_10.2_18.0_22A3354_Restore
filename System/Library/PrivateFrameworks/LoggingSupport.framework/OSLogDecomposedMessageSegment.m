@implementation OSLogDecomposedMessageSegment

- (OSLogDecomposedMessageSegment)initWithDict:(id)a3 metadata:(id)a4
{
  id v8;
  id v9;
  OSLogDecomposedMessageSegment *v10;
  OSLogDecomposedMessageSegment *v11;
  void *v12;
  uint64_t v13;
  NSString *literalPrefix;
  void *v15;
  OSLogDeserializedMessagePlaceholder *v16;
  OSLogDeserializedMessagePlaceholder *placeholder;
  void *v18;
  OSLogDeserializedEventMessageArgument *v19;
  OSLogDeserializedEventMessageArgument *argument;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  objc_super v31;

  v8 = a3;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)OSLogDecomposedMessageSegment;
  v10 = -[OSLogDecomposedMessageSegment init](&v31, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_backingDict, a3);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_opt_class();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("EventSerializer.m"), 1326, CFSTR("Unexpected class: %@. Expected: %@"), v23, objc_opt_class());

      }
      objc_msgSend(v9, "stringForIndex:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("EventSerializer.m"), 1328, CFSTR("Failed to find literal prefix string"));

      }
      literalPrefix = v11->_literalPrefix;
      v11->_literalPrefix = (NSString *)v13;

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("p"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_opt_class();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("EventSerializer.m"), 1335, CFSTR("Unexpected class: %@. Expected: %@"), v26, objc_opt_class());

      }
      v16 = -[OSLogDeserializedMessagePlaceholder initWithDict:metadata:]([OSLogDeserializedMessagePlaceholder alloc], "initWithDict:metadata:", v15, v9);
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("EventSerializer.m"), 1337, CFSTR("Could not instantiate placeholder"));

      }
      placeholder = v11->_placeholder;
      v11->_placeholder = v16;

    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("a"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_opt_class();
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("EventSerializer.m"), 1344, CFSTR("Unexpected class: %@. Expected: %@"), v29, objc_opt_class());

      }
      v19 = -[OSLogDeserializedEventMessageArgument initWithDict:metadata:]([OSLogDeserializedEventMessageArgument alloc], "initWithDict:metadata:", v18, v9);
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("EventSerializer.m"), 1346, CFSTR("Could not instantiate arg"));

      }
      argument = v11->_argument;
      v11->_argument = v19;

    }
  }

  return v11;
}

- (NSDictionary)backingDict
{
  return self->_backingDict;
}

- (NSString)literalPrefix
{
  return self->_literalPrefix;
}

- (OSLogDeserializedMessagePlaceholder)placeholder
{
  return self->_placeholder;
}

- (OSLogDeserializedEventMessageArgument)argument
{
  return self->_argument;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argument, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_literalPrefix, 0);
  objc_storeStrong((id *)&self->_backingDict, 0);
}

@end
