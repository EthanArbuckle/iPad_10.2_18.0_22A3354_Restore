@implementation FMStopwatch

+ (void)initialize
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9967000, log, OS_LOG_TYPE_DEBUG, "Creating PerfMon buffer", v1, 2u);
}

+ (id)stopwatchWithLabel:(id)a3
{
  id v3;
  void *v4;

  if (_stopwatchEnabled)
  {
    v3 = a3;
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabel:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (void)eventWithLabel:(id)a3 comment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  if (_stopwatchEnabled)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLabel:", v5);
    objc_msgSend(v7, "setEndTime:", objc_msgSend(v7, "startTime"));
    if (objc_msgSend(v6, "length"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v6, &v10);
      objc_msgSend(v7, "setComment:", v8);

    }
    v9 = (id)buffer;
    objc_sync_enter(v9);
    objc_msgSend((id)buffer, "addObject:", v7);
    objc_sync_exit(v9);

  }
}

+ (void)eventWithLabel:(id)a3
{
  objc_msgSend(a1, "eventWithLabel:comment:", a3, &stru_1E82AADD8);
}

+ (void)dumpBuffer:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)buffer, "count", a3))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v5, "setDateFormat:", CFSTR("yyyyMMddHHmmss"));
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v6);

    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = dumpDirectory;
    objc_msgSend(v5, "stringFromDate:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/.%@.perftemp"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = dumpDirectory;
    v22 = (void *)v4;
    objc_msgSend(v5, "stringFromDate:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@/%@.perf"), v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", dumpDirectory, 1, 0, 0);
    objc_msgSend(v3, "createFileAtPath:contents:attributes:", v10, 0, 0);
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = (id)buffer;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v20), "descriptionAsData");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "writeData:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v18);
    }

    objc_msgSend(v15, "closeFile");
    objc_msgSend(v3, "linkItemAtPath:toPath:error:", v10, v14, 0);
    objc_msgSend(v3, "removeItemAtPath:error:", v10, 0);
    objc_msgSend((id)buffer, "removeAllObjects");

  }
}

+ (id)illegalLabelCharacterSet
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = a1;
  objc_sync_enter(v2);
  if (!illegalLabelCharacterSet_illegalLabelCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(", "));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)illegalLabelCharacterSet_illegalLabelCharacterSet;
    illegalLabelCharacterSet_illegalLabelCharacterSet = v3;

  }
  objc_sync_exit(v2);

  return (id)illegalLabelCharacterSet_illegalLabelCharacterSet;
}

- (FMStopwatch)initWithLabel:(id)a3
{
  id v5;
  FMStopwatch *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMStopwatch;
  v6 = -[FMStopwatch init](&v11, sel_init);
  if (v6)
  {
    +[FMStopwatch illegalLabelCharacterSet](FMStopwatch, "illegalLabelCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rangeOfCharacterFromSet:", v7);
    v9 = v8;

    if (v9)
    {

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Illegal character in label: [%@]"), v5);
      v6 = 0;
    }
    -[FMStopwatch setLabel:](v6, "setLabel:", v5);
    objc_storeStrong((id *)&v6->_label, a3);
    v6->_startTime = nanosecondTimestamp();
    v6->_endTime = 0;
  }

  return v6;
}

- (void)stopWithComment:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = a3;
  -[FMStopwatch setEndTime:](self, "setEndTime:", nanosecondTimestamp());
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v4, &v7);
    -[FMStopwatch setComment:](self, "setComment:", v5);

  }
  v6 = (id)buffer;
  objc_sync_enter(v6);
  objc_msgSend((id)buffer, "addObject:", self);
  objc_sync_exit(v6);

}

- (void)stop
{
  -[FMStopwatch stopWithComment:](self, "stopWithComment:", &stru_1E82AADD8);
}

- (id)description
{
  unint64_t v3;
  unint64_t v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  const __CFString *v21;

  v3 = -[FMStopwatch endTime](self, "endTime");
  v4 = -[FMStopwatch startTime](self, "startTime");
  v5 = (double)-[FMStopwatch endTime](self, "endTime");
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  if (v8 == v5)
  {
    v9 = (void *)MEMORY[0x1E0CB37A0];
    -[FMStopwatch label](self, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@,%llu # STILL RUNNING"), v10, -[FMStopwatch startTime](self, "startTime"));
LABEL_5:
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    goto LABEL_7;
  }
  v11 = -[FMStopwatch startTime](self, "startTime");
  v12 = -[FMStopwatch endTime](self, "endTime");
  v13 = (void *)MEMORY[0x1E0CB37A0];
  -[FMStopwatch label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FMStopwatch startTime](self, "startTime");
  if (v11 == v12)
  {
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@,%llu"), v10, v14);
    goto LABEL_5;
  }
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@,%llu,%llu"), v10, v14, -[FMStopwatch endTime](self, "endTime"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 1;
LABEL_7:

  -[FMStopwatch comment](self, "comment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[FMStopwatch comment](self, "comment");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendFormat:", CFSTR(" # %@"), v18);

  }
  if (v16)
  {
    v19 = v3 - v4;
    -[FMStopwatch comment](self, "comment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      v21 = CFSTR(" [Δ=%lu ns]");
    else
      v21 = CFSTR(" # [Δ=%lu ns]");
    objc_msgSend(v15, "appendFormat:", v21, v19);
  }
  return v15;
}

- (id)descriptionAsData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[FMStopwatch description](self, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@\n"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)comment
{
  return self->_comment;
}

- (void)setComment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(unint64_t)a3
{
  self->_endTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
