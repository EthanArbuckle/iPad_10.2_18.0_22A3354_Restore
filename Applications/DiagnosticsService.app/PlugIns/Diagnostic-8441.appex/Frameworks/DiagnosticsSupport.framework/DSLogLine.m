@implementation DSLogLine

- (DSLogLine)initWithLine:(id)a3
{
  id v4;
  DSLogLine *v5;
  uint64_t v6;
  NSArray *fields;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDate *date;
  NSDate *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  NSString *type;
  uint64_t v21;
  NSString *exception;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  DSLogLine *v43;
  uint64_t v44;
  NSString *bundleID;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)DSLogLine;
  v5 = -[DSLogLine init](&v47, "init");
  if (!v5)
  {
LABEL_26:
    v43 = v5;
    goto LABEL_27;
  }
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(",")));
    fields = v5->_fields;
    v5->_fields = (NSArray *)v6;

    if (-[NSArray count](v5->_fields, "count") <= 1)
    {
      v8 = DiagnosticLogHandleForCategory(3);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[DSLogLine initWithLine:].cold.1((id *)&v5->_fields, v9);

      goto LABEL_20;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "formatterWithType:", 2));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v5->_fields, "objectAtIndex:", 0));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateFromString:", v12));
    date = v5->_date;
    v5->_date = (NSDate *)v13;

    v15 = v5->_date;
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[NSDate timeIntervalSinceDate:](v15, "timeIntervalSinceDate:", v16);
      v18 = v17;

      if (v18 > 86400.0 || v18 <= -1209600.0)
      {
        v32 = DiagnosticLogHandleForCategory(3);
        v24 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[DSLogLine initWithLine:].cold.3(v24, v18, v33, v34);
      }
      else
      {
        v19 = objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](v5->_fields, "objectAtIndex:", 1));
        type = v5->_type;
        v5->_type = (NSString *)v19;

        if (-[NSString length](v5->_type, "length"))
        {
          v5->_isUsable = 1;
          if (-[NSArray count](v5->_fields, "count") <= 6)
          {
            exception = v5->_exception;
            v5->_exception = 0;
          }
          else
          {
            v21 = objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v5->_fields, "objectAtIndexedSubscript:", 6));
            exception = v5->_exception;
            v5->_exception = (NSString *)v21;
          }

          if (-[NSArray count](v5->_fields, "count") <= 5)
          {
            bundleID = v5->_bundleID;
            v5->_bundleID = 0;
          }
          else
          {
            v44 = objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v5->_fields, "objectAtIndexedSubscript:", 5));
            bundleID = v5->_bundleID;
            v5->_bundleID = (NSString *)v44;
          }

          goto LABEL_26;
        }
        v35 = DiagnosticLogHandleForCategory(3);
        v24 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[DSLogLine initWithLine:].cold.4(v24, v36, v37, v38, v39, v40, v41, v42);
      }
    }
    else
    {
      v23 = DiagnosticLogHandleForCategory(3);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[DSLogLine initWithLine:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);
    }

  }
LABEL_20:
  v43 = 0;
LABEL_27:

  return v43;
}

- (DSLogLine)initWithLogLine:(id)a3
{
  id v4;
  DSLogLine *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  NSDate *date;
  uint64_t v10;
  NSString *exception;
  uint64_t v12;
  NSArray *fields;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DSLogLine;
  v5 = -[DSLogLine init](&v15, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
    type = v5->_type;
    v5->_type = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "date"));
    date = v5->_date;
    v5->_date = (NSDate *)v8;

    v5->_isUsable = objc_msgSend(v4, "isUsable");
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "exception"));
    exception = v5->_exception;
    v5->_exception = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fields"));
    fields = v5->_fields;
    v5->_fields = (NSArray *)v12;

  }
  return v5;
}

+ (id)logLinesFromArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  DSLogLine *v11;
  DSLogLine *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = [DSLogLine alloc];
        v12 = -[DSLogLine initWithLine:](v11, "initWithLine:", v10, (_QWORD)v14);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (int)integerFromFieldAtIndex:(int)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));
  v9 = objc_msgSend(v8, "intValue");

  return v9;
}

- (int64_t)longLongFromFieldAtIndex:(int)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));
  v9 = objc_msgSend(v8, "longLongValue");

  return (int64_t)v9;
}

- (double)doubleFromFieldAtIndex:(int)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
    return 0.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  return v10;
}

- (BOOL)BOOLFromFieldAtIndex:(int)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

- (id)blankingStringFromFieldAtIndex:(int)a3
{
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v8 = &stru_18E68;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  }
  return v8;
}

- (id)stringFromFieldAtIndex:(int)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DSLogLine fields](self, "fields"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

  }
  return v8;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isUsable
{
  return self->_isUsable;
}

- (NSString)exception
{
  return self->_exception;
}

- (NSArray)fields
{
  return self->_fields;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_exception, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)initWithLine:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;

  v3 = objc_msgSend(*a1, "count");
  v5 = 134217984;
  v6 = v3;
  OUTLINED_FUNCTION_1_1(&dword_0, a2, v4, "[DSLogLine] ignoring log line, field count too small: %ld", (uint8_t *)&v5);
}

- (void)initWithLine:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_0, a1, a3, "[DSLogLine] ignoring log line, log date unparseable", a5, a6, a7, a8, 0);
}

- (void)initWithLine:(uint64_t)a3 .cold.3(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v5;

  v4 = 134217984;
  v5 = (uint64_t)a2;
  OUTLINED_FUNCTION_1_1(&dword_0, a1, a4, "[DSLogLine] ignoring log line, log date out of range: %ld", (uint8_t *)&v4);
}

- (void)initWithLine:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_0, a1, a3, "[DSLogLine] ignoring log line, type is blank", a5, a6, a7, a8, 0);
}

@end
