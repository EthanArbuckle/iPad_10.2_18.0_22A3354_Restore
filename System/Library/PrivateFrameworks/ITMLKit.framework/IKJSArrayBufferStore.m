@implementation IKJSArrayBufferStore

- (IKJSArrayBufferStore)initWithAppContext:(id)a3
{
  id v4;
  IKJSArrayBufferStore *v5;
  uint64_t v6;
  NSMutableDictionary *bufferStorage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKJSArrayBufferStore;
  v5 = -[IKJSArrayBufferStore init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    bufferStorage = v5->_bufferStorage;
    v5->_bufferStorage = (NSMutableDictionary *)v6;

    objc_storeWeak((id *)&v5->_appContext, v4);
  }

  return v5;
}

- (id)arrayBufferForData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const OpaqueJSContext *v13;
  id v14;
  void *v15;

  v4 = a3;
  -[IKJSArrayBufferStore appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSArrayBufferStore bufferStorage](self, "bufferStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v7, v9);

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", self, CFSTR("IKJSArrayBufferStoreStoreKey"));
  objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("IKJSArrayBufferStoreStoredDataKey"));
  v12 = v11;
  v13 = (const OpaqueJSContext *)objc_msgSend(v6, "JSGlobalContextRef");
  v14 = objc_retainAutorelease(v7);
  objc_msgSend(MEMORY[0x1E0CBE108], "valueWithJSValueRef:inContext:", JSObjectMakeArrayBufferWithBytesNoCopy(v13, (void *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), (JSTypedArrayBytesDeallocator)IKJSArrayBufferStoreDeallocator, v12, 0), v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSMutableDictionary)bufferStorage
{
  return self->_bufferStorage;
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_bufferStorage, 0);
}

@end
