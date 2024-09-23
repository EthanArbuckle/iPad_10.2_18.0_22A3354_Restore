@implementation FSTaskDescription

- (FSTaskDescription)initWithID:(id)a3 state:(unsigned __int8)a4 purpose:(id)a5 error:(id)a6 bundleID:(id)a7 extensionID:(id)a8 resource:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  FSTaskDescription *v21;
  uint64_t v22;
  NSUUID *taskID;
  uint64_t v24;
  NSError *taskErrorState;
  uint64_t v26;
  NSString *taskBundleID;
  uint64_t v28;
  FSContainerIdentifier *taskExtensionInstanceID;
  uint64_t v30;
  FSResource *taskResource;
  objc_super v33;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v33.receiver = self;
  v33.super_class = (Class)FSTaskDescription;
  v21 = -[FSTaskDescription init](&v33, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    taskID = v21->_taskID;
    v21->_taskID = (NSUUID *)v22;

    v21->_taskState = a4;
    objc_storeStrong((id *)&v21->_taskPurpose, a5);
    if (v17)
    {
      v24 = objc_msgSend(v17, "copy");
      taskErrorState = v21->_taskErrorState;
      v21->_taskErrorState = (NSError *)v24;
    }
    else
    {
      taskErrorState = v21->_taskErrorState;
      v21->_taskErrorState = 0;
    }

    v26 = objc_msgSend(v18, "copy");
    taskBundleID = v21->_taskBundleID;
    v21->_taskBundleID = (NSString *)v26;

    if (v19)
    {
      v28 = objc_msgSend(v19, "copy");
      taskExtensionInstanceID = v21->_taskExtensionInstanceID;
      v21->_taskExtensionInstanceID = (FSContainerIdentifier *)v28;
    }
    else
    {
      taskExtensionInstanceID = v21->_taskExtensionInstanceID;
      v21->_taskExtensionInstanceID = 0;
    }

    objc_msgSend(v20, "makeProxy");
    v30 = objc_claimAutoreleasedReturnValue();
    taskResource = v21->_taskResource;
    v21->_taskResource = (FSResource *)v30;

    v21->_terminateExtensionWhenFinished = 0;
  }

  return v21;
}

- (NSUUID)taskID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (unsigned)taskState
{
  return self->_taskState;
}

- (NSError)taskErrorState
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)taskBundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (FSContainerIdentifier)taskExtensionInstanceID
{
  return (FSContainerIdentifier *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)taskPurpose
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (FSResource)taskResource
{
  return (FSResource *)objc_getProperty(self, a2, 56, 1);
}

- (NSObject)taskReferenceHolder
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setTaskReferenceHolder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)taskInitiatorID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTaskInitiatorID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSString)taskSigningID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTaskSigningID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (BOOL)terminateExtensionWhenFinished
{
  return self->_terminateExtensionWhenFinished;
}

- (void)setTerminateExtensionWhenFinished:(BOOL)a3
{
  self->_terminateExtensionWhenFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskSigningID, 0);
  objc_storeStrong((id *)&self->_taskInitiatorID, 0);
  objc_storeStrong((id *)&self->_taskReferenceHolder, 0);
  objc_storeStrong((id *)&self->_taskResource, 0);
  objc_storeStrong((id *)&self->_taskPurpose, 0);
  objc_storeStrong((id *)&self->_taskExtensionInstanceID, 0);
  objc_storeStrong((id *)&self->_taskBundleID, 0);
  objc_storeStrong((id *)&self->_taskErrorState, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
}

+ (FSTaskDescription)taskDescriptionWithID:(id)a3 state:(unsigned __int8)a4 purpose:(id)a5 error:(id)a6 bundleID:(id)a7 extensionID:(id)a8 resource:(id)a9
{
  uint64_t v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;

  v13 = a4;
  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithID:state:purpose:error:bundleID:extensionID:resource:", v21, v13, v20, v19, v18, v17, v16);

  return (FSTaskDescription *)v22;
}

- (id)updatedDescriptionInState:(unsigned __int8)a3 error:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "taskDescriptionWithID:state:purpose:error:bundleID:extensionID:resource:", self->_taskID, v4, self->_taskPurpose, v6, self->_taskBundleID, self->_taskExtensionInstanceID, self->_taskResource);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTerminateExtensionWhenFinished:", self->_terminateExtensionWhenFinished);
  -[FSTaskDescription taskReferenceHolder](self, "taskReferenceHolder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v4 != 3 && v8)
  {
    -[FSTaskDescription taskReferenceHolder](self, "taskReferenceHolder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTaskReferenceHolder:", v9);

  }
  -[FSTaskDescription taskInitiatorID](self, "taskInitiatorID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTaskInitiatorID:", v10);

  -[FSTaskDescription taskSigningID](self, "taskSigningID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTaskSigningID:", v11);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *taskErrorState;
  FSContainerIdentifier *taskExtensionInstanceID;
  FSResource *taskResource;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", self->_taskID, CFSTR("FSTask.ID"));
  objc_msgSend(v8, "encodeInt:forKey:", self->_taskState, CFSTR("FSTask.state"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_taskBundleID, CFSTR("FSTask.bundle"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_taskPurpose, CFSTR("FSTask.purpose"));
  taskErrorState = self->_taskErrorState;
  if (taskErrorState)
    objc_msgSend(v8, "encodeObject:forKey:", taskErrorState, CFSTR("FSTask.error"));
  taskExtensionInstanceID = self->_taskExtensionInstanceID;
  if (taskExtensionInstanceID)
    objc_msgSend(v8, "encodeObject:forKey:", taskExtensionInstanceID, CFSTR("FSTask.ext.ID"));
  taskResource = self->_taskResource;
  v7 = v8;
  if (taskResource)
  {
    objc_msgSend(v8, "encodeObject:forKey:", taskResource, CFSTR("FSTask.resource"));
    v7 = v8;
  }

}

- (FSTaskDescription)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *taskID;
  NSString *v7;
  NSString *taskBundleID;
  NSString *v9;
  NSString *taskPurpose;
  NSError *v11;
  NSError *taskErrorState;
  FSContainerIdentifier *v13;
  FSContainerIdentifier *taskExtensionInstanceID;
  FSResource *v15;
  FSResource *taskResource;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSTask.ID"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  taskID = self->_taskID;
  self->_taskID = v5;

  self->_taskState = objc_msgSend(v4, "decodeIntForKey:", CFSTR("FSTask.state"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSTask.bundle"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  taskBundleID = self->_taskBundleID;
  self->_taskBundleID = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSTask.purpose"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  taskPurpose = self->_taskPurpose;
  self->_taskPurpose = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSTask.error"));
  v11 = (NSError *)objc_claimAutoreleasedReturnValue();
  taskErrorState = self->_taskErrorState;
  self->_taskErrorState = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSTask.ext.ID"));
  v13 = (FSContainerIdentifier *)objc_claimAutoreleasedReturnValue();
  taskExtensionInstanceID = self->_taskExtensionInstanceID;
  self->_taskExtensionInstanceID = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSTask.resource"));
  v15 = (FSResource *)objc_claimAutoreleasedReturnValue();

  taskResource = self->_taskResource;
  self->_taskResource = v15;

  return self;
}

@end
