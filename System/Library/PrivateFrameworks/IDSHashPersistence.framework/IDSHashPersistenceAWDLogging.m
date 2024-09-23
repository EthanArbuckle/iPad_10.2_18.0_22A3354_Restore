@implementation IDSHashPersistenceAWDLogging

+ (id)sharedInstance
{
  if (qword_253F211C8 != -1)
    dispatch_once(&qword_253F211C8, &unk_24DE29938);
  return (id)qword_253F211D8;
}

- (IDSHashPersistenceAWDLogging)init
{
  IDSHashPersistenceAWDLogging *v2;
  uint64_t v3;
  AWDServerConnection *AWDServerConnection;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IDSHashPersistenceAWDLogging;
  v2 = -[IDSHashPersistenceAWDLogging init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc((Class)MEMORY[0x22075BF7C](CFSTR("AWDServerConnection"), CFSTR("WirelessDiagnostics"))), "initWithComponentId:andBlockOnConfiguration:", 39, 1);
    AWDServerConnection = v2->_AWDServerConnection;
    v2->_AWDServerConnection = (AWDServerConnection *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(-32768, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create_with_target_V2("com.apple.IDS.AWDLogging", v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)dealloc
{
  OS_dispatch_queue *queue;
  objc_super v4;

  queue = self->_queue;
  if (queue)
  {
    self->_queue = 0;

  }
  v4.receiver = self;
  v4.super_class = (Class)IDSHashPersistenceAWDLogging;
  -[IDSHashPersistenceAWDLogging dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldSubmit
{
  return 1;
}

- (void)_submitAWDMetric:(id)a3 withContainer:(id)a4
{
  id v6;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      objc_msgSend(v6, "setMetric:", a3);
      -[AWDServerConnection submitMetric:](self->_AWDServerConnection, "submitMetric:", v6);

    }
  }
}

- (id)_metricContainerForMetricType:(unsigned int)a3
{
  return (id)-[AWDServerConnection newMetricContainerWithIdentifier:](self->_AWDServerConnection, "newMetricContainerWithIdentifier:", *(_QWORD *)&a3);
}

- (void)duplicateMessageEncounted
{
  uint64_t v2;
  OS_dispatch_queue *queue;
  NSObject *v4;
  uint64_t *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  IDSHashPersistenceAWDLogging *v12;
  _QWORD block[4];
  uint64_t *v14;

  v2 = MEMORY[0x24BDAC760];
  queue = self->_queue;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = sub_21B03DBF8;
  v11 = &unk_24DE29960;
  v12 = self;
  v4 = queue;
  v5 = &v8;
  if (v4)
  {
    +[IDSHashPersistenceAWDLogging sharedInstance](IDSHashPersistenceAWDLogging, "sharedInstance", v8, v9, v10, v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldSubmit");

    if (v7)
    {
      block[0] = v2;
      block[1] = 3221225472;
      block[2] = sub_21B03DC9C;
      block[3] = &unk_24DE29988;
      v14 = v5;
      dispatch_async(v4, block);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AWDServerConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
