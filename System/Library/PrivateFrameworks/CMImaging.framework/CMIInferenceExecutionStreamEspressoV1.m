@implementation CMIInferenceExecutionStreamEspressoV1

- (CMIInferenceExecutionStreamEspressoV1)init
{
  CMIInferenceExecutionStreamEspressoV1 *v2;
  uint64_t v3;
  NSMutableArray *instances;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMIInferenceExecutionStreamEspressoV1;
  v2 = -[CMIInferenceExecutionStreamEspressoV1 init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    instances = v2->_instances;
    v2->_instances = (NSMutableArray *)v3;

  }
  return v2;
}

- (int)enqueueNetworkInstance:(id)a3
{
  -[NSMutableArray addObject:](self->_instances, "addObject:", a3);
  return 0;
}

- (int)submitAsyncWithCompletionHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  return 0;
}

- (NSMutableArray)instances
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInstances:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instances, 0);
}

@end
