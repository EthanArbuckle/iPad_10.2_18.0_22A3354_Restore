@implementation HMMTRAttributeReportDistributorRegistry

- (HMMTRAttributeReportDistributorRegistry)initWithQueue:(id)a3 receiver:(id)a4
{
  id v7;
  id v8;
  HMMTRAttributeReportDistributorRegistry *v9;
  HMMTRAttributeReportDistributorRegistry *v10;
  uint64_t v11;
  id receiver;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMMTRAttributeReportDistributorRegistry;
  v9 = -[HMMTRAttributeReportDistributorRegistry init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = MEMORY[0x242656B10](v8);
    receiver = v10->_receiver;
    v10->_receiver = (id)v11;

  }
  return v10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)receiver
{
  return self->_receiver;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
