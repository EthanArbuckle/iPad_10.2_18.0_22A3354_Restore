@implementation AVAirMessageTransformer

- (AVAirMessageTransformer)initWithMessageClass:(Class)a3
{
  AVAirMessageTransformer *v4;
  AVAirMessageTransformer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVAirMessageTransformer;
  v4 = -[AVAirMessageTransformer init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_messageClass, a3);
  return v5;
}

- (void)resetState
{
  NSData *previousUnusedData;

  previousUnusedData = self->_previousUnusedData;
  self->_previousUnusedData = 0;

}

- (id)dataForMessage:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      _avairlog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315138;
        v10 = "-[AVAirMessageTransformer dataForMessage:]";
        _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s value does not implement AVMessageTransformerProtocol", (uint8_t *)&v9, 0xCu);
      }
      v4 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v3, "messageDataRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _avairlog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 136315394;
        v10 = "-[AVAirMessageTransformer dataForMessage:]";
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s value not represented by NSData (%@)", (uint8_t *)&v9, 0x16u);

      }
LABEL_10:

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)reverseTransformerForMessageData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSData *v8;
  NSData *previousUnusedData;

  v4 = a3;
  v5 = v4;
  if (-[NSData length](self->_previousUnusedData, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(v4, "length") + -[NSData length](self->_previousUnusedData, "length"));
    objc_msgSend(v5, "appendData:", self->_previousUnusedData);
    if (v4)
      objc_msgSend(v5, "appendData:", v4);

  }
  if (v5)
  {
    +[AVMessageParser airMessageParser](AVMessageParser, "airMessageParser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "partsWithData:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isIncomplete"))
    {
      v8 = v5;
    }
    else
    {
      objc_msgSend(v7, "extraData");
      v8 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    previousUnusedData = self->_previousUnusedData;
    self->_previousUnusedData = v8;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (Class)messageClass
{
  return self->_messageClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageClass, 0);
  objc_storeStrong((id *)&self->_previousUnusedData, 0);
}

@end
