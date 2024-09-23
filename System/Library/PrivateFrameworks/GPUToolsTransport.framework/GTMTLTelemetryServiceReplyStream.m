@implementation GTMTLTelemetryServiceReplyStream

- (GTMTLTelemetryServiceReplyStream)initWithObserver:(id)a3
{
  id v5;
  void *v6;
  GTMTLTelemetryServiceReplyStream *v7;
  objc_super v9;

  v5 = a3;
  +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", &unk_255D65370);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)GTMTLTelemetryServiceReplyStream;
  v7 = -[GTXPCDispatcher initWithProtocolMethods:](&v9, sel_initWithProtocolMethods_, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_observer, a3);

  return v7;
}

- (void)notifyStatistics_:(id)a3 replyConnection:(id)a4
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *nsobject_classes;
  id v16;

  v4 = (objc_class *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v16 = (id)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v5, "statistics", v16);

  -[GTMTLTelemetryServiceObserver notifyStatistics:](self->_observer, "notifyStatistics:", nsobject_classes);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
