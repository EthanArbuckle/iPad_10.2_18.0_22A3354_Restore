@implementation ADTimeProfiler

- (ADTimeProfiler)init
{
  ADTimeProfiler *v2;
  ADTimeProfiler *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ADTimeProfiler;
  v2 = -[ADTimeProfiler init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ADTimeProfiler reset](v2, "reset");
  return v3;
}

- (void)reset
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ADTimeProfiler setLogArray:](self, "setLogArray:");

}

- (void)startWithUTFString:(const char *)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ADTimeProfiler startForOperationWithName:](self, "startForOperationWithName:");

}

- (void)stopWithUTFString:(const char *)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ADTimeProfiler stopForOperationWithName:](self, "stopForOperationWithName:");

}

- (id)log
{
  void *v2;
  void *v3;

  -[ADTimeProfiler logArray](self, "logArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (void)startForOperationWithName:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADTimeProfiler valueDictForOperationName:](self, "valueDictForOperationName:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, v7);

}

- (void)stopForOperationWithName:(id)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = +[ADTimeProfiler currentTimeUsec](ADTimeProfiler, "currentTimeUsec");
  -[ADTimeProfiler valueDictForOperationName:](self, "valueDictForOperationName:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longValue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(v4 - v7) / 1000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v9);

}

- (id)valueDictForOperationName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[ADTimeProfiler logArray](self, "logArray", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v6)
  {
LABEL_11:

LABEL_13:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ADTimeProfiler logArray](self, "logArray");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v15);
    goto LABEL_15;
  }
  v7 = *(_QWORD *)v19;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v19 != v7)
      objc_enumerationMutation(v5);
    v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "count"))
      goto LABEL_9;
    objc_msgSend(v9, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "isEqualToString:", v4))
      break;

LABEL_9:
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        goto LABEL_3;
      goto LABEL_11;
    }
  }
  -[ADTimeProfiler logArray](self, "logArray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "indexOfObject:", v9);

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_13;
  -[ADTimeProfiler logArray](self, "logArray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndex:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v15;
}

- (void)printLog
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[ADTimeProfiler log](self, "log");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v6, "allKeys");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count"))
        {
          objc_msgSend(v6, "allKeys");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "valueForKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "doubleValue");
          NSLog(CFSTR("%@: %f"), v9, v11, (_QWORD)v12);

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

- (id)stringLog
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[ADTimeProfiler log](self, "log");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = v15;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "allKeys");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          objc_msgSend(v7, "allKeys");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "valueForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "doubleValue");
          objc_msgSend(v2, "appendFormat:", CFSTR("%@: %.02fms\n"), v10, v12);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

  v13 = (void *)objc_msgSend(v2, "copy");
  return v13;
}

- (NSMutableArray)logArray
{
  return self->_logArray;
}

- (void)setLogArray:(id)a3
{
  objc_storeStrong((id *)&self->_logArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logArray, 0);
}

@end
