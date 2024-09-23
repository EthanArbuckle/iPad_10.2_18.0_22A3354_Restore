@implementation MFMutableFilterDataConsumer

- (MFMutableFilterDataConsumer)initWithMainConsumer:(id)a3
{
  id v5;
  MFMutableFilterDataConsumer *v6;
  MFMutableFilterDataConsumer *v7;
  MFLock *v8;
  MFLock *consumerLock;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFMutableFilterDataConsumer;
  v6 = -[MFBaseFilterDataConsumer initWithConsumer:](&v11, sel_initWithConsumer_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mainConsumer, a3);
    v8 = -[MFLock initWithName:andDelegate:]([MFLock alloc], "initWithName:andDelegate:", CFSTR("MFMutableFilterDataConsumer Lock"), 0);
    consumerLock = v7->_consumerLock;
    v7->_consumerLock = v8;

    v7->_isDone = 0;
  }

  return v7;
}

- (void)addDataConsumer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFLock lock](self->_consumerLock, "lock");
  -[MFGuaranteedCollectingDataConsumer data](self->_mainConsumer, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendData:", v4);

  -[NSMutableArray addObject:](self->super._consumers, "addObject:", v5);
  if (self->_isDone && !self->super._serialAppend)
    objc_msgSend(v5, "done");
  -[MFLock unlock](self->_consumerLock, "unlock");

}

- (int64_t)appendData:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  -[MFLock lock](self->_consumerLock, "lock");
  v7.receiver = self;
  v7.super_class = (Class)MFMutableFilterDataConsumer;
  v5 = -[MFBaseFilterDataConsumer appendData:](&v7, sel_appendData_, v4);
  -[MFLock unlock](self->_consumerLock, "unlock");

  return (int64_t)v5;
}

- (id)data
{
  return (id)-[MFGuaranteedCollectingDataConsumer data](self->_mainConsumer, "data");
}

- (void)done
{
  objc_super v3;

  -[MFLock lock](self->_consumerLock, "lock");
  v3.receiver = self;
  v3.super_class = (Class)MFMutableFilterDataConsumer;
  -[MFBaseFilterDataConsumer done](&v3, sel_done);
  self->_isDone = 1;
  -[MFLock unlock](self->_consumerLock, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumerLock, 0);
  objc_storeStrong((id *)&self->_mainConsumer, 0);
}

@end
