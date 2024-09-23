@implementation FSModuleTask

- (FSModuleTask)init
{
  FSModuleTask *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FSModuleTask;
  result = -[FSModuleTask init](&v3, sel_init);
  if (result)
    result->_wasCanceled = 0;
  return result;
}

- (FSModuleTask)initWithID:(id)a3 description:(id)a4 progress:(id)a5
{
  id v9;
  id v10;
  id v11;
  FSModuleTask *v12;
  FSModuleTask *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[FSModuleTask init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_taskUUID, a3);
    objc_storeStrong((id *)&v13->_taskDescription, a4);
    objc_storeStrong((id *)&v13->_taskProgress, a5);
  }

  return v13;
}

+ (id)taskWithID:(id)a3 description:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithID:description:progress:", v10, v9, v8);

  return v11;
}

- (NSUUID)taskUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTaskUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (FSTaskDescription)taskDescription
{
  return (FSTaskDescription *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskDescription:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSProgress)taskProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTaskProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (FSTaskProgressConnector)connector
{
  return (FSTaskProgressConnector *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnector:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)wasCanceled
{
  return self->_wasCanceled;
}

- (void)setWasCanceled:(BOOL)a3
{
  self->_wasCanceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connector, 0);
  objc_storeStrong((id *)&self->_taskProgress, 0);
  objc_storeStrong((id *)&self->_taskDescription, 0);
  objc_storeStrong((id *)&self->_taskUUID, 0);
}

@end
