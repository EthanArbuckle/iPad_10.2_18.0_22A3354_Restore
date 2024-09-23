@implementation ATXHeuristicObjectHandle

- (ATXHeuristicObjectHandle)initWithDevice:(id)a3 wrapping:(id)a4
{
  id v6;
  id v7;
  ATXHeuristicObjectHandle *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSNumber *deviceHandle;
  uint64_t v15;
  NSNumber *objHandle;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ATXHeuristicObjectHandle;
  v8 = -[ATXHeuristicObjectHandle init](&v18, sel_init);
  if (v8)
  {
    v9 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    pthread_mutex_lock(&deviceHandlesLock);
    v11 = (void *)deviceHandles;
    if (!deviceHandles)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)deviceHandles;
      deviceHandles = v12;

      v11 = (void *)deviceHandles;
    }
    objc_msgSend(v11, "setObject:forKey:", v9, v10);
    pthread_mutex_unlock(&deviceHandlesLock);

    deviceHandle = v8->_deviceHandle;
    v8->_deviceHandle = (NSNumber *)v10;

    objc_msgSend(v9, "_wrap:", v7);
    v15 = objc_claimAutoreleasedReturnValue();
    objHandle = v8->_objHandle;
    v8->_objHandle = (NSNumber *)v15;

    objc_storeStrong(&v8->_obj, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *deviceHandle;
  id v5;

  deviceHandle = self->_deviceHandle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceHandle, CFSTR("deviceHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_objHandle, CFSTR("objHandle"));

}

- (ATXHeuristicObjectHandle)initWithCoder:(id)a3
{
  id v4;
  ATXHeuristicObjectHandle *v5;
  uint64_t v6;
  NSNumber *deviceHandle;
  uint64_t v8;
  NSNumber *objHandle;
  NSNumber *v10;
  NSNumber *v11;
  void *v12;
  uint64_t v13;
  id obj;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXHeuristicObjectHandle;
  v5 = -[ATXHeuristicObjectHandle init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceHandle"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceHandle = v5->_deviceHandle;
    v5->_deviceHandle = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objHandle"));
    v8 = objc_claimAutoreleasedReturnValue();
    objHandle = v5->_objHandle;
    v5->_objHandle = (NSNumber *)v8;

    v10 = v5->_deviceHandle;
    if (v10)
    {
      if (v5->_objHandle)
      {
        v11 = v10;
        pthread_mutex_lock(&deviceHandlesLock);
        objc_msgSend((id)deviceHandles, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        pthread_mutex_unlock(&deviceHandlesLock);
        objc_msgSend(v12, "_unwrap:", v5->_objHandle);
        v13 = objc_claimAutoreleasedReturnValue();
        obj = v5->_obj;
        v5->_obj = (id)v13;

      }
    }
  }

  return v5;
}

- (id)obj
{
  return self->_obj;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_obj, 0);
  objc_storeStrong((id *)&self->_objHandle, 0);
  objc_storeStrong((id *)&self->_deviceHandle, 0);
}

@end
