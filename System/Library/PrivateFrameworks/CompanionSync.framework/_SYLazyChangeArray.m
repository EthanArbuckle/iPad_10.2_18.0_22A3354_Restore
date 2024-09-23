@implementation _SYLazyChangeArray

- (_SYLazyChangeArray)initWithSourceArray:(id)a3 decoder:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;
  _SYLazyChangeArray *v10;
  _SYLazyChangeArray *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "count");
  v10 = 0;
  if (v8 && v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)_SYLazyChangeArray;
    v11 = -[_SYLazyChangeArray init](&v13, sel_init);
    self = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_source, a3);
      objc_storeStrong((id *)&self->_decoder, a4);
      self->_compatibilityVersion = 2;
      self = self;
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (_SYLazyChangeArray)initWithSYObjectDataArray:(id)a3 typeArray:(id)a4 decoder:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _SYLazyChangeArray *v13;
  _SYLazyChangeArray *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v9, "count");
  v13 = 0;
  if (v11 && v12)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
    {
      v16.receiver = self;
      v16.super_class = (Class)_SYLazyChangeArray;
      v14 = -[_SYLazyChangeArray init](&v16, sel_init);
      self = v14;
      if (v14)
      {
        objc_storeStrong((id *)&v14->_source, a3);
        objc_storeStrong((id *)&self->_types, a4);
        objc_storeStrong((id *)&self->_decoder, a5);
        self->_isSYObjectDataArray = 1;
        self->_compatibilityVersion = 1;
        self = self;
        v13 = self;
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("SYChangeSerializer %@ needs to implement SYObjectWithData: to communicate with devices running WatchOS 1.x"), v11);
    }
    v13 = 0;
  }
LABEL_9:

  return v13;
}

- (unint64_t)count
{
  return -[NSArray count](self->_source, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  char v5;
  SYChangeSerializer *decoder;
  void *v7;
  void *v8;
  void *v9;
  int64_t compatibilityVersion;
  void *v11;
  SYChangeSerializer *v12;
  uint64_t v13;
  NSObject *v14;

  if (self->_isSYObjectDataArray)
  {
    v5 = objc_opt_respondsToSelector();
    decoder = self->_decoder;
    -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v5 & 1) != 0)
    {
      -[NSArray objectAtIndexedSubscript:](self->_types, "objectAtIndexedSubscript:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYChangeSerializer decodeChangeData:fromProtocolVersion:ofType:](decoder, "decodeChangeData:fromProtocolVersion:ofType:", v7, 1, objc_msgSend(v8, "integerValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    -[SYChangeSerializer SYObjectWithData:](decoder, "SYObjectWithData:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    compatibilityVersion = self->_compatibilityVersion;
    -[NSArray objectAtIndexedSubscript:](self->_source, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v12 = self->_decoder;
    if (compatibilityVersion > 1)
      objc_msgSend(v11, "changeObjectWithSerializer:", v12);
    else
      objc_msgSend(v11, "changeObjectWithSerializer:encodedByVersion:", v12, self->_compatibilityVersion);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v13;
LABEL_10:

  if (!v9)
  {
    if (_sync_log_facilities_pred != -1)
      _os_once();
    v14 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_FAULT))
      -[_SYLazyChangeArray objectAtIndex:].cold.1(v14);
    +[SYDegenerateChange degenerateChange](SYDegenerateChange, "degenerateChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->_compatibilityVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)objectAtIndex:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_211704000, log, OS_LOG_TYPE_FAULT, "** COMPANIONSYNC CLIENT BUG ** Deserialization attempt gave us a nil", v1, 2u);
}

@end
