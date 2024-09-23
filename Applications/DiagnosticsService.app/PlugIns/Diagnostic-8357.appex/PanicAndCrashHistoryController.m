@implementation PanicAndCrashHistoryController

- (id)defaultLogLineLabelMap
{
  if (qword_100008940 != -1)
    dispatch_once(&qword_100008940, &stru_1000041F8);
  return (id)qword_100008938;
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  -[PanicAndCrashHistoryController setInputs:](self, "setInputs:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PanicAndCrashHistoryController inputs](self, "inputs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationFilters"));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self LIKE %@"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11)));
        objc_msgSend(v5, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[PanicAndCrashHistoryController setApplicationPredicates:](self, "setApplicationPredicates:", v5);
}

- (void)start
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc((Class)DSGeneralLogCollector);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PanicAndCrashHistoryController inputs](self, "inputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logIds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  v7 = objc_msgSend(v3, "initWithLogIDs:", v6);

  if ((-[PanicAndCrashHistoryController isCancelled](self, "isCancelled") & 1) == 0)
    -[PanicAndCrashHistoryController parseLogsWithCollector:](self, "parseLogsWithCollector:", v7);
  -[PanicAndCrashHistoryController setFinished:](self, "setFinished:", 1);

}

- (void)parseLogsWithCollector:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  id (*v14)(id *, void *);
  void *v15;
  id v16;
  PanicAndCrashHistoryController *v17;
  id v18;
  id v19;
  id location;
  const __CFString *v21;
  id v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_1000026DC;
  v15 = &unk_100004220;
  objc_copyWeak(&v19, &location);
  v7 = v6;
  v16 = v7;
  v17 = self;
  v8 = v5;
  v18 = v8;
  objc_msgSend(v4, "enumerateLogLinesWithBlock:", &v12);
  if ((-[PanicAndCrashHistoryController isCancelled](self, "isCancelled", v12, v13, v14, v15) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PanicAndCrashHistoryController result](self, "result"));
    objc_msgSend(v9, "setStatusCode:", &off_100004490);

    v21 = CFSTR("logLines");
    v22 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PanicAndCrashHistoryController result](self, "result"));
    objc_msgSend(v11, "setData:", v10);

  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

- (id)logLineLabelForIndex:(id)a3 andLogLineType:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PanicAndCrashHistoryController inputs](self, "inputs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resultLabelFilters"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

  if (!v10
    && ((v11 = objc_msgSend(v6, "intValue"),
         v12 = (void *)objc_claimAutoreleasedReturnValue(-[PanicAndCrashHistoryController defaultLogLineLabelMap](self, "defaultLogLineLabelMap")),
         v13 = v12,
         v11 > 1)
      ? (v14 = v7)
      : (v14 = CFSTR("AnyLogLine")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v14)),
        v13,
        !v10)
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v6))) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("untitledLabelAt-%@"), v6));
  }

  return v15;
}

- (id)processLine:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fields"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PanicAndCrashHistoryController logLineLabelForIndex:andLogLineType:](self, "logLineLabelForIndex:andLogLineType:", v9, v10));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fields"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v13, "unsignedIntValue")));

      objc_msgSend(v5, "setValue:forKey:", v14, v11);
      ++v8;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fields"));
      v16 = objc_msgSend(v15, "count");

    }
    while ((unint64_t)v16 > v8);
  }

  return v5;
}

- (BOOL)passesFilter:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", a3));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PanicAndCrashHistoryController applicationPredicates](self, "applicationPredicates", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredArrayUsingPredicate:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i)));

        if (v9)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (PanicAndCrashHistoryInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
  objc_storeStrong((id *)&self->_inputs, a3);
}

- (NSArray)applicationPredicates
{
  return self->_applicationPredicates;
}

- (void)setApplicationPredicates:(id)a3
{
  objc_storeStrong((id *)&self->_applicationPredicates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationPredicates, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
}

@end
