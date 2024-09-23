@implementation ATXModeBiomeEventContextWrapper

- (ATXModeBiomeEventContextWrapper)initWithPreviousContext:(id)a3 nextEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  ATXModeBiomeEventContextWrapper *v14;
  ATXModeBiomeEventContextWrapper *v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v6, "mostRecentModeTransition");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v15 = self;
    v16 = v8;
    v17 = v7;
LABEL_6:
    v14 = -[ATXModeBiomeEventContextWrapper initWithTransitionEvent:eventToWrap:](v15, "initWithTransitionEvent:eventToWrap:", v16, v17);
    goto LABEL_7;
  }
  v8 = v7;
  objc_msgSend(v6, "wrappedEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);

  if (v12 == -1)
  {
    v15 = self;
    v16 = v8;
    v17 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "wrappedEvent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[ATXModeBiomeEventContextWrapper initWithTransitionEvent:eventToWrap:](self, "initWithTransitionEvent:eventToWrap:", v8, v13);

LABEL_7:
  return v14;
}

- (ATXModeBiomeEventContextWrapper)initWithTransitionEvent:(id)a3 eventToWrap:(id)a4
{
  id v6;
  id v7;
  ATXModeBiomeEventContextWrapper *v8;
  ATXModeBiomeEventContextWrapper *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATXModeBiomeEventContextWrapper;
  v8 = -[ATXModeBiomeEventContextWrapper init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ATXModeBiomeEventContextWrapper setMostRecentModeTransition:](v8, "setMostRecentModeTransition:", v6);
    -[ATXModeBiomeEventContextWrapper setWrappedEvent:](v9, "setWrappedEvent:", v7);
  }

  return v9;
}

- (ATXModeBiomeEventContextWrapper)init
{
  id v3;
  ATXModeBiomeEventContextWrapper *v4;

  v3 = -[ATXUnifiedInferredActivityTransition initFromTransitionTime:isEntryEvent:source:activityType:confidence:]([ATXUnifiedInferredActivityTransition alloc], "initFromTransitionTime:isEntryEvent:source:activityType:confidence:", 1, CFSTR("computedModeActivity"), 14, 0.0, 1.0);
  v4 = -[ATXModeBiomeEventContextWrapper initWithTransitionEvent:eventToWrap:](self, "initWithTransitionEvent:eventToWrap:", v3, 0);

  return v4;
}

- (unint64_t)currentActivityType
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXModeBiomeEventContextWrapper mostRecentModeTransition](self, "mostRecentModeTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 14;
  -[ATXModeBiomeEventContextWrapper mostRecentModeTransition](self, "mostRecentModeTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEntryEvent"))
  {
    -[ATXModeBiomeEventContextWrapper mostRecentModeTransition](self, "mostRecentModeTransition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "inferredActivityType");

  }
  else
  {
    v6 = 14;
  }

  return v6;
}

- (id)eventTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[ATXModeBiomeEventContextWrapper wrappedEvent](self, "wrappedEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXModeBiomeEventContextWrapper mostRecentModeTransition](self, "mostRecentModeTransition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v4, "laterDate:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v4;
    }
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXModeBiomeEventContextWrapper mostRecentModeTransition](self, "mostRecentModeTransition");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("transition"));

}

- (ATXModeBiomeEventContextWrapper)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  ATXModeBiomeEventContextWrapper *v9;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  v6 = objc_opt_class();
  __atxlog_handle_default();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("transition"), v5, 0, CFSTR("com.apple.proactive.ATXModeBiomeEventContextWrapper"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ATXModeBiomeEventContextWrapper initWithTransitionEvent:eventToWrap:](self, "initWithTransitionEvent:eventToWrap:", v8, 0);
  return v9;
}

- (BOOL)_fileExistsAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  return v6;
}

- (id)_dataFromPath:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[ATXModeBiomeEventContextWrapper _fileExistsAtPath:](self, "_fileExistsAtPath:", v4))
    {
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v15 = 0;
        -[NSObject readDataToEndOfFileAndReturnError:](v5, "readDataToEndOfFileAndReturnError:", &v15);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v15;
        v9 = v8;
        if (!v7 || v8)
        {
          __atxlog_handle_default();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[ATXModeBiomeEventContextWrapper _dataFromPath:].cold.2();

          v10 = 0;
        }
        else
        {
          v10 = v7;
        }

      }
      else
      {
        __atxlog_handle_default();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[ATXModeBiomeEventContextWrapper _dataFromPath:].cold.1(v9);
        v10 = 0;
      }

    }
    else
    {
      __atxlog_handle_default();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v17 = v12;
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "%@ - file doesn't exist at path %@", buf, 0x16u);

      }
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ATXModeBiomeEventContextWrapper)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  ATXModeBiomeEventContextWrapper *v9;
  ATXModeBiomeEventContextWrapper *v10;
  id v12;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1CAA48B6C]();
    v12 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, &v12);
    v7 = v12;
    if (v7)
    {
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXModeBiomeEventContextWrapper initWithData:].cold.1();

      v9 = -[ATXModeBiomeEventContextWrapper init](self, "init");
    }
    else
    {
      v9 = -[ATXModeBiomeEventContextWrapper initWithCoder:](self, "initWithCoder:", v6);
    }
    v10 = v9;

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v10 = -[ATXModeBiomeEventContextWrapper init](self, "init");
  }

  return v10;
}

- (ATXModeBiomeEventContextWrapper)initWithPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXModeBiomeEventContextWrapper *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  -[ATXModeBiomeEventContextWrapper _dataFromPath:](self, "_dataFromPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  v7 = -[ATXModeBiomeEventContextWrapper initWithData:](self, "initWithData:", v6);

  return v7;
}

- (id)serialize:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  id v12;

  v5 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  objc_autoreleasePoolPop(v5);
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    v10 = v6;
  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXModeBiomeEventContextWrapper serialize:].cold.1((uint64_t)self, (uint64_t)v7, v9);

    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }

  return v10;
}

- (void)persistToPath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  char v14;
  id v15;

  v4 = a3;
  if (!v4)
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXModeBiomeEventContextWrapper persistToPath:].cold.3();

    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99768];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("%@ - Attempting to persist with a nil path"), v9);

  }
  v15 = 0;
  -[ATXModeBiomeEventContextWrapper serialize:](self, "serialize:", &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (v11)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXModeBiomeEventContextWrapper persistToPath:].cold.2();
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "createFileAtPath:contents:attributes:", v4, v10, 0);

  if ((v14 & 1) == 0)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXModeBiomeEventContextWrapper persistToPath:].cold.1();
    goto LABEL_11;
  }
LABEL_12:

}

+ (id)wrapEventStreams:(id)a3 modeTransitionStream:(id)a4 startingContext:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  objc_msgSend(a4, "orderedMergeWithOthers:comparator:", a3, &__block_literal_global_99);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;
  objc_msgSend(v8, "scanWithInitial:nextPartialResult:", v9, &__block_literal_global_18_1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __89__ATXModeBiomeEventContextWrapper_wrapEventStreams_modeTransitionStream_startingContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "eventTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

ATXModeBiomeEventContextWrapper *__89__ATXModeBiomeEventContextWrapper_wrapEventStreams_modeTransitionStream_startingContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  ATXModeBiomeEventContextWrapper *v6;

  v4 = a3;
  v5 = a2;
  v6 = -[ATXModeBiomeEventContextWrapper initWithPreviousContext:nextEvent:]([ATXModeBiomeEventContextWrapper alloc], "initWithPreviousContext:nextEvent:", v5, v4);

  return v6;
}

+ (id)wrapEventStream:(id)a3 modeTransitionStream:(id)a4 startingContext:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "wrapEventStreams:modeTransitionStream:startingContext:", v12, v10, v9, v15, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (ATXUnifiedInferredActivityTransition)mostRecentModeTransition
{
  return self->_mostRecentModeTransition;
}

- (void)setMostRecentModeTransition:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentModeTransition, a3);
}

- (ATXTimedEventProtocol)wrappedEvent
{
  return self->_wrappedEvent;
}

- (void)setWrappedEvent:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedEvent, 0);
  objc_storeStrong((id *)&self->_mostRecentModeTransition, 0);
}

- (void)_dataFromPath:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "Unable to acquire readonly handle to cache file.", v1, 2u);
}

- (void)_dataFromPath:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  v3 = v0;
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, v1, (uint64_t)v1, "Unable to read data from file handle %@ - %@", v2);
}

- (void)initWithData:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "Unable to initialize coder for data, err: %@", v1, 0xCu);
}

- (void)serialize:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[14];
  uint64_t v9;

  v5 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  v9 = a2;
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, a3, v7, "%@ - could not archive self with error: %@", v8);

}

- (void)persistToPath:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "%@ - Failed to write to disk", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)persistToPath:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "%@ - Failed to serialize", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)persistToPath:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "%@ - Attempting to persist with a nil path", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
