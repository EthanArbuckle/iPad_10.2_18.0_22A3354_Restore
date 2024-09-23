@implementation OSLogDeserializedEventMessageArgument

- (OSLogDeserializedEventMessageArgument)initWithDict:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  OSLogDeserializedEventMessageArgument *v9;
  OSLogDeserializedEventMessageArgument *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OSLogDeserializedEventMessageArgument;
  v9 = -[OSLogDeserializedEventMessageArgument init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingDict, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
  }

  return v10;
}

- (unint64_t)availability
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[OSLogDeserializedEventMessageArgument backingDict](self, "backingDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("a"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1148, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)privacy
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[OSLogDeserializedEventMessageArgument backingDict](self, "backingDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1149, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)category
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[OSLogDeserializedEventMessageArgument backingDict](self, "backingDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("c"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1150, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)scalarCategory
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[OSLogDeserializedEventMessageArgument backingDict](self, "backingDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1151, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)scalarType
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;

  -[OSLogDeserializedEventMessageArgument backingDict](self, "backingDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("st"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_opt_class();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1152, CFSTR("Unexpected class: %@. Expected: %@"), v9, objc_opt_class());

    }
    v6 = objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)objectRepresentation
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  if (!-[OSLogDeserializedEventMessageArgument availability](self, "availability")
    || -[OSLogDeserializedEventMessageArgument availability](self, "availability") == 3)
  {
    v4 = -[OSLogDeserializedEventMessageArgument category](self, "category");
    if (v4 == 1 || v4 == 3)
    {
      -[OSLogDeserializedEventMessageArgument backingDict](self, "backingDict");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("or"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

      return v8;
    }
    if (v4 == 2)
    {
      -[OSLogDeserializedEventMessageArgument backingDict](self, "backingDict");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("or"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_opt_class();
          objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EventSerializer.m"), 1169, CFSTR("Unexpected class: %@. Expected: %@"), v11, objc_opt_class());

        }
        -[OSLogDeserializedEventMessageArgument metadata](self, "metadata");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringForIndex:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
      goto LABEL_12;
    }
  }
  v8 = 0;
  return v8;
}

- (const)rawBytes
{
  id v3;
  uint64_t v4;
  const void *v5;

  if (!-[OSLogDeserializedEventMessageArgument availability](self, "availability")
    || -[OSLogDeserializedEventMessageArgument availability](self, "availability") == 3)
  {
    if (-[OSLogDeserializedEventMessageArgument category](self, "category") == 2)
    {
      -[OSLogDeserializedEventMessageArgument objectRepresentation](self, "objectRepresentation");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = objc_retainAutorelease(v3);
          v4 = objc_msgSend(v3, "UTF8String");
LABEL_11:
          v5 = (const void *)v4;
LABEL_14:

          return v5;
        }
      }
      goto LABEL_13;
    }
    if (-[OSLogDeserializedEventMessageArgument category](self, "category") == 3)
    {
      -[OSLogDeserializedEventMessageArgument objectRepresentation](self, "objectRepresentation");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = objc_retainAutorelease(v3);
          v4 = objc_msgSend(v3, "bytes");
          goto LABEL_11;
        }
      }
LABEL_13:
      v5 = 0;
      goto LABEL_14;
    }
  }
  return 0;
}

- (unsigned)rawBytesLength
{
  void *v3;
  unsigned __int16 v4;

  if (!-[OSLogDeserializedEventMessageArgument availability](self, "availability")
    || -[OSLogDeserializedEventMessageArgument availability](self, "availability") == 3)
  {
    if (-[OSLogDeserializedEventMessageArgument category](self, "category") == 2)
    {
      -[OSLogDeserializedEventMessageArgument objectRepresentation](self, "objectRepresentation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_11;
      goto LABEL_8;
    }
    if (-[OSLogDeserializedEventMessageArgument category](self, "category") == 3)
    {
      -[OSLogDeserializedEventMessageArgument objectRepresentation](self, "objectRepresentation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_11;
LABEL_8:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = objc_msgSend(v3, "length");
LABEL_12:

        return v4;
      }
LABEL_11:
      v4 = 0;
      goto LABEL_12;
    }
  }
  return 0;
}

- (id)_numValue
{
  void *v3;
  id v4;

  if (-[OSLogDeserializedEventMessageArgument availability](self, "availability")
    && -[OSLogDeserializedEventMessageArgument availability](self, "availability") != 3
    || -[OSLogDeserializedEventMessageArgument category](self, "category") != 1)
  {
    return 0;
  }
  -[OSLogDeserializedEventMessageArgument objectRepresentation](self, "objectRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (unint64_t)unsignedInt64Value
{
  void *v2;
  unint64_t v3;

  -[OSLogDeserializedEventMessageArgument _numValue](self, "_numValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (int64_t)int64Value
{
  void *v2;
  int64_t v3;

  -[OSLogDeserializedEventMessageArgument _numValue](self, "_numValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (double)doubleValue
{
  void *v2;
  double v3;
  double v4;

  -[OSLogDeserializedEventMessageArgument _numValue](self, "_numValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

- (double)longDoubleValue
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "_numValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (NSDictionary)backingDict
{
  return self->_backingDict;
}

- (_OSLogEventSerializationMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_backingDict, 0);
}

@end
