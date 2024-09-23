@implementation ASCMetricsData

- (ASCMetricsData)initWithTopic:(id)a3 shouldFlush:(BOOL)a4 fields:(id)a5 includingFields:(id)a6 excludingFields:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ASCMetricsData *v16;
  uint64_t v17;
  NSString *topic;
  uint64_t v19;
  NSDictionary *fields;
  uint64_t v21;
  NSSet *includingFields;
  uint64_t v23;
  NSSet *excludingFields;
  objc_super v26;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v26.receiver = self;
  v26.super_class = (Class)ASCMetricsData;
  v16 = -[ASCMetricsData init](&v26, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    topic = v16->_topic;
    v16->_topic = (NSString *)v17;

    v16->_shouldFlush = a4;
    v19 = objc_msgSend(v13, "copy");
    fields = v16->_fields;
    v16->_fields = (NSDictionary *)v19;

    v21 = objc_msgSend(v14, "copy");
    includingFields = v16->_includingFields;
    v16->_includingFields = (NSSet *)v21;

    v23 = objc_msgSend(v15, "copy");
    excludingFields = v16->_excludingFields;
    v16->_excludingFields = (NSSet *)v23;

  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCMetricsData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  ASCMetricsData *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldFlush"));
  ASCMetricsFieldsDecodeForKey(v4, CFSTR("fields"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v8, "initWithObjects:", v9, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("includingFields"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("excludingFields"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        self = -[ASCMetricsData initWithTopic:shouldFlush:fields:includingFields:excludingFields:](self, "initWithTopic:shouldFlush:fields:includingFields:excludingFields:", v5, v6, v7, v11, v12);
        v13 = self;
      }
      else
      {
        v30 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v30)
          -[ASCMetricsData initWithCoder:].cold.3(v30, v31, v32, v33, v34, v35, v36, v37);
        v13 = 0;
      }

    }
    else
    {
      v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v22)
        -[ASCMetricsData initWithCoder:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);
      v13 = 0;
    }

  }
  else
  {
    v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v14)
      -[ASCMetricsData initWithCoder:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ASCMetricsData topic](self, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("topic"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ASCMetricsData shouldFlush](self, "shouldFlush"), CFSTR("shouldFlush"));
  -[ASCMetricsData fields](self, "fields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fields"));

  -[ASCMetricsData includingFields](self, "includingFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("includingFields"));

  -[ASCMetricsData excludingFields](self, "excludingFields");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("excludingFields"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCMetricsData topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCHasher combineBool:](v3, "combineBool:", -[ASCMetricsData shouldFlush](self, "shouldFlush"));
  -[ASCMetricsData fields](self, "fields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCMetricsData includingFields](self, "includingFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCMetricsData excludingFields](self, "excludingFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  v8 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
  {
    -[ASCMetricsData topic](self, "topic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topic");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v8 && v9)
    {
      if (!objc_msgSend(v8, "isEqual:", v9))
        goto LABEL_14;
    }
    else if (v8 != (void *)v9)
    {
LABEL_14:
      v11 = 0;
LABEL_32:

      goto LABEL_33;
    }
    v12 = -[ASCMetricsData shouldFlush](self, "shouldFlush");
    if (v12 != objc_msgSend(v7, "shouldFlush"))
      goto LABEL_14;
    -[ASCMetricsData fields](self, "fields");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fields");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13 && v14)
    {
      if (objc_msgSend(v13, "isEqual:", v14))
      {
LABEL_18:
        -[ASCMetricsData includingFields](self, "includingFields");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "includingFields");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v16 && v17)
        {
          if (objc_msgSend(v16, "isEqual:", v17))
            goto LABEL_21;
        }
        else if (v16 == (void *)v17)
        {
LABEL_21:
          -[ASCMetricsData excludingFields](self, "excludingFields");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "excludingFields");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          v23 = v19;
          if (v19 && v20)
            v11 = objc_msgSend(v19, "isEqual:", v20);
          else
            v11 = v19 == (void *)v20;

          goto LABEL_30;
        }
        v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
    }
    else if (v13 == (void *)v14)
    {
      goto LABEL_18;
    }
    v11 = 0;
LABEL_31:

    goto LABEL_32;
  }
  v11 = 0;
LABEL_33:

  return v11;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCMetricsData topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("topic"));

  -[ASCDescriber addBool:withName:](v3, "addBool:withName:", -[ASCMetricsData shouldFlush](self, "shouldFlush"), CFSTR("shouldFlush"));
  -[ASCMetricsData fields](self, "fields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v5, CFSTR("fields"));

  -[ASCMetricsData includingFields](self, "includingFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v6, CFSTR("includingFields"));

  -[ASCMetricsData excludingFields](self, "excludingFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v7, CFSTR("excludingFields"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)metricsDataByMergingFields:(id)a3 uniquingFieldsWithBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ASCMetricsData *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  ASCMetricsData *v15;

  v6 = a4;
  v7 = a3;
  -[ASCMetricsData fields](self, "fields");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = [ASCMetricsData alloc];
  -[ASCMetricsData topic](self, "topic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ASCMetricsData shouldFlush](self, "shouldFlush");
  -[ASCMetricsData includingFields](self, "includingFields");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMetricsData excludingFields](self, "excludingFields");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ASCMetricsData initWithTopic:shouldFlush:fields:includingFields:excludingFields:](v10, "initWithTopic:shouldFlush:fields:includingFields:excludingFields:", v11, v12, v9, v13, v14);

  return v15;
}

- (NSString)topic
{
  return self->_topic;
}

- (BOOL)shouldFlush
{
  return self->_shouldFlush;
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (NSSet)includingFields
{
  return self->_includingFields;
}

- (NSSet)excludingFields
{
  return self->_excludingFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludingFields, 0);
  objc_storeStrong((id *)&self->_includingFields, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCMetricsData because fields was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCMetricsData because includingFields was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BCB7B000, MEMORY[0x1E0C81028], a3, "Could not decode ASCMetricsData because excludingFields was missing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
