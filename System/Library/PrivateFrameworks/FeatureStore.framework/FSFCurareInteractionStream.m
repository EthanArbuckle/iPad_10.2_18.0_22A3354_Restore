@implementation FSFCurareInteractionStream

+ (id)getWithStreamId:(id)a3
{
  return (id)objc_msgSend(a1, "getWithStreamId:sourceType:", a3, 0);
}

+ (id)getWithStreamId:(id)a3 sourceType:(unint64_t)a4
{
  id v5;
  FSFCurareInteractionStream *v6;

  v5 = a3;
  v6 = -[FSFCurareInteractionStream initWithStreamId:sourceType:]([FSFCurareInteractionStream alloc], "initWithStreamId:sourceType:", v5, a4);

  return v6;
}

- (FSFCurareInteractionStream)initWithStreamId:(id)a3
{
  return -[FSFCurareInteractionStream initWithStreamId:sourceType:](self, "initWithStreamId:sourceType:", a3, 0);
}

- (FSFCurareInteractionStream)initWithStreamId:(id)a3 sourceType:(unint64_t)a4
{
  id v6;
  FSFCurareInteractionStream *v7;
  FSFCurareInteractionFeatureStoreStream *v8;
  void *v9;
  void *v10;
  void *v11;
  FSFCurareInteractionSELFStream *v12;
  FSFStreamSourceProtocol *stream;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FSFCurareInteractionStream;
  v7 = -[FSFCurareInteractionStream init](&v15, sel_init);
  if (v7)
  {
    if (a4 == 1)
    {
      v10 = (void *)objc_opt_class();
      v16[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "eventFilterForEventTypes:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[FSFCurareInteractionSELFStream initWithFilter:]([FSFCurareInteractionSELFStream alloc], "initWithFilter:", v9);
      stream = v7->_stream;
      v7->_stream = (FSFStreamSourceProtocol *)v12;

      goto LABEL_6;
    }
    if (!a4)
    {
      v8 = -[FSFCurareInteractionFeatureStoreStream initWithStreamId:]([FSFCurareInteractionFeatureStoreStream alloc], "initWithStreamId:", v6);
      v9 = v7->_stream;
      v7->_stream = (FSFStreamSourceProtocol *)v8;
LABEL_6:

    }
  }

  return v7;
}

- (BOOL)insert:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[FSFCurareInteractionStream stream](self, "stream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "insert:error:", v6, a4);

  return (char)a4;
}

- (id)retrieve:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FSFCurareInteractionStream stream](self, "stream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "retrieve:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)retrieve:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FSFCurareInteractionStream stream](self, "stream");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "retrieve:completionHandler:", v7, v6);

}

- (id)retrieveWithInteractionWrapper:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FSFCurareInteractionStream stream](self, "stream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "retrieveWithInteractionWrapper:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)retrieveWithInteractionWrapper:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FSFCurareInteractionStream stream](self, "stream");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "retrieveWithInteractionWrapper:completionHandler:", v7, v6);

}

- (BOOL)deleteCurrentStream
{
  void *v2;
  char v3;

  -[FSFCurareInteractionStream stream](self, "stream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deleteCurrentStream");

  return v3;
}

+ (id)eventFilterForEventTypes:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSString *v12;
  Class v13;
  NSString *v14;
  Class v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  Class v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (!v5)
    {
      v7 = 0;
      goto LABEL_21;
    }
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v32;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v11, "count") >= 3)
        {
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x24BDBCE88];
          v23 = *MEMORY[0x24BDBCAB8];
          goto LABEL_27;
        }
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        v13 = NSClassFromString(v12);

        if ((-[objc_class isSubclassOfClass:](v13, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
        {
          v24 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
          v27 = objc_claimAutoreleasedReturnValue();

          v22 = (void *)MEMORY[0x24BDBCE88];
          v23 = *MEMORY[0x24BDBCAB8];
          v21 = v27;
LABEL_27:
          objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, v21, 0);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v28);
        }
        if (objc_msgSend(v11, "count") == 2
          && (objc_msgSend(v11, "objectAtIndexedSubscript:", 1),
              v14 = (NSString *)objc_claimAutoreleasedReturnValue(),
              v15 = NSClassFromString(v14),
              v14,
              v15))
        {
          if ((-[objc_class isSubclassOfClass:](v15, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
          {
            v26 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_26;
          }
          v16 = (void *)MEMORY[0x24BDFCC30];
          v35 = v15;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "someOf:types:", v13, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v7)
          {
LABEL_13:
            v7 = v18;
            goto LABEL_16;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDFCC30], "allOf:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v7)
            goto LABEL_13;
        }
        objc_msgSend(v7, "combine:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v19;
LABEL_16:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (!v6)
      {
LABEL_21:

        v4 = v29;
        goto LABEL_22;
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDFCC30], "everything");
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v7;
}

- (FSFStreamSourceProtocol)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
