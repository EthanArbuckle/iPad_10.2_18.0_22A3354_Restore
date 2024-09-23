@implementation TestTelemetry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_removeFailures, 0);
  objc_storeStrong((id *)&self->_terminationFailures, 0);
}

+ (id)testTelemetryWithInfo:(id)a3
{
  id v3;
  TestTelemetry *v4;

  v3 = a3;
  v4 = -[TestTelemetry initWithInfo:]([TestTelemetry alloc], "initWithInfo:", v3);

  return v4;
}

- (TestTelemetry)initWithInfo:(id)a3
{
  char *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  TestTelemetry *v12;
  float v13;
  float v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *q;
  NSObject *v17;
  TestTelemetry *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TEST_PARAMETERS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TEST_TERMINATION_THRESHOLD"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      evaluateNumberProperty(v8);
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TEST_REMOVE_THRESHOLD"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      evaluateNumberProperty(v10);
      v11 = objc_claimAutoreleasedReturnValue();

      if (v9 | v11
        && (objc_msgSend((id)v9, "intValue") || objc_msgSend((id)v11, "intValue")))
      {
        v21.receiver = self;
        v21.super_class = (Class)TestTelemetry;
        v12 = -[TestTelemetry init](&v21, sel_init);
        if (v12)
        {
          if (v9)
          {
            objc_msgSend((id)v9, "floatValue");
            v12->_termination_threshold = v13;
          }
          if (v11)
          {
            objc_msgSend((id)v11, "floatValue");
            v12->_remove_threshold = v14;
          }
          v15 = dispatch_queue_create("TestTelemetry_add_queue", 0);
          q = v12->_q;
          v12->_q = (OS_dispatch_queue *)v15;

        }
        CDGetLogHandle((uint64_t)"client");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v23 = (const char *)v12;
          v24 = 2112;
          v25 = v5;
          _os_log_impl(&dword_1A3662000, v17, OS_LOG_TYPE_DEFAULT, "initialized TestTelemetry: %@, info: %@", buf, 0x16u);
        }

        self = v12;
        v18 = self;
      }
      else
      {
        CDGetLogHandle((uint64_t)"client");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v5;
          _os_log_error_impl(&dword_1A3662000, v19, OS_LOG_TYPE_ERROR, "Invalid test parameters: %@", buf, 0xCu);
        }

        v18 = 0;
      }

    }
    else
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[TestTelemetry initWithInfo:]";
        _os_log_error_impl(&dword_1A3662000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "[%s] no test parameters in info", buf, 0xCu);
      }
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TestTelemetry termination_threshold](self, "termination_threshold");
  v5 = v4;
  -[TestTelemetry terminationFailures](self, "terminationFailures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TestTelemetry remove_threshold](self, "remove_threshold");
  v8 = v7;
  -[TestTelemetry removeFailures](self, "removeFailures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("termination threshold: %f -- failures: %@, remove threshold: %f -- failures: %@"), v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)addRemoveFailure:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TestTelemetry removeFailures](self, "removeFailures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TestTelemetry setRemoveFailures:](self, "setRemoveFailures:", v6);

  }
  -[TestTelemetry removeFailures](self, "removeFailures");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)addTerminationFailure:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[TestTelemetry terminationFailures](self, "terminationFailures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TestTelemetry setTerminationFailures:](self, "setTerminationFailures:", v6);

  }
  -[TestTelemetry terminationFailures](self, "terminationFailures");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)addDeletes:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[TestTelemetry q](self, "q");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__TestTelemetry_addDeletes___block_invoke;
  v6[3] = &unk_1E4A32CF8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);

}

uint64_t __28__TestTelemetry_addDeletes___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFiles_deleted:", *(_QWORD *)(a1 + 40) + objc_msgSend(*(id *)(a1 + 32), "files_deleted"));
}

- (unint64_t)deletes
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[TestTelemetry q](self, "q");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__TestTelemetry_deletes__block_invoke;
  v6[3] = &unk_1E4A32C58;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __24__TestTelemetry_deletes__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "files_deleted");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)termination_threshold
{
  return self->_termination_threshold;
}

- (void)setTermination_threshold:(double)a3
{
  self->_termination_threshold = a3;
}

- (double)remove_threshold
{
  return self->_remove_threshold;
}

- (void)setRemove_threshold:(double)a3
{
  self->_remove_threshold = a3;
}

- (NSMutableArray)terminationFailures
{
  return self->_terminationFailures;
}

- (void)setTerminationFailures:(id)a3
{
  objc_storeStrong((id *)&self->_terminationFailures, a3);
}

- (NSMutableArray)removeFailures
{
  return self->_removeFailures;
}

- (void)setRemoveFailures:(id)a3
{
  objc_storeStrong((id *)&self->_removeFailures, a3);
}

- (OS_dispatch_queue)q
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)files_deleted
{
  return self->_files_deleted;
}

- (void)setFiles_deleted:(unint64_t)a3
{
  self->_files_deleted = a3;
}

@end
