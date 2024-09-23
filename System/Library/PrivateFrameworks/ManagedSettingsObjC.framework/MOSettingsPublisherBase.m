@implementation MOSettingsPublisherBase

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopBlock, 0);
  objc_storeStrong(&self->_startBlock, 0);
  objc_storeStrong((id *)&self->_interestedGroups, 0);
  objc_storeStrong((id *)&self->_upstream, 0);
}

- (MOSettingsPublisherBase)initWithUpstream:(id)a3 interestedGroups:(id)a4 startBlock:(id)a5 stopBlock:(id)a6
{
  MOPublisher *v10;
  NSSet *v11;
  id v12;
  id v13;
  MOSettingsPublisherBase *v14;
  MOPublisher *upstream;
  MOPublisher *v16;
  NSSet *interestedGroups;
  NSSet *v18;
  uint64_t v19;
  id startBlock;
  uint64_t v21;
  id stopBlock;
  objc_super v24;

  v10 = (MOPublisher *)a3;
  v11 = (NSSet *)a4;
  v24.receiver = self;
  v24.super_class = (Class)MOSettingsPublisherBase;
  v12 = a6;
  v13 = a5;
  v14 = -[MOPublisher initPublisher](&v24, sel_initPublisher);
  upstream = v14->_upstream;
  v14->_upstream = v10;
  v16 = v10;

  interestedGroups = v14->_interestedGroups;
  v14->_interestedGroups = v11;
  v18 = v11;

  v19 = MEMORY[0x1B5E3442C](v13);
  startBlock = v14->_startBlock;
  v14->_startBlock = (id)v19;

  v21 = MEMORY[0x1B5E3442C](v12);
  stopBlock = v14->_stopBlock;
  v14->_stopBlock = (id)v21;

  return v14;
}

- (void)subscribe:(id)a3
{
  MOSettingsPublisherConduit *v4;
  id v5;

  v5 = a3;
  if (-[NSSet count](self->_interestedGroups, "count"))
  {
    v4 = -[MOSettingsPublisherConduit initWithDownstream:interestedGroups:startBlock:stopBlock:]([MOSettingsPublisherConduit alloc], "initWithDownstream:interestedGroups:startBlock:stopBlock:", v5, self->_interestedGroups, self->_startBlock, self->_stopBlock);
    -[MOPublisher subscribe:](self->_upstream, "subscribe:", v4);

  }
}

- (MOPublisher)upstream
{
  return self->_upstream;
}

- (NSSet)interestedGroups
{
  return self->_interestedGroups;
}

- (id)startBlock
{
  return self->_startBlock;
}

- (id)stopBlock
{
  return self->_stopBlock;
}

@end
