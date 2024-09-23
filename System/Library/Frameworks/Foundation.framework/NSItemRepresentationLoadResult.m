@implementation NSItemRepresentationLoadResult

+ (id)resultWithData:(id)a3 urlWrapper:(id)a4 cleanupHandler:(id)a5 error:(id)a6
{
  id v10;

  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setData:", a3);
  objc_msgSend(v10, "setUrlWrapper:", a4);
  objc_msgSend(v10, "setCleanupHandler:", a5);
  objc_msgSend(v10, "setError:", a6);
  return v10;
}

+ (id)resultWithError:(id)a3
{
  return (id)objc_msgSend(a1, "resultWithData:urlWrapper:cleanupHandler:error:", 0, 0, 0, a3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSItemRepresentationLoadResult;
  -[NSItemRepresentationLoadResult dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSItemRepresentationLoadResult *v4;

  v4 = objc_alloc_init(NSItemRepresentationLoadResult);
  -[NSItemRepresentationLoadResult setData:](v4, "setData:", self->_data);
  -[NSItemRepresentationLoadResult setUrlWrapper:](v4, "setUrlWrapper:", self->_urlWrapper);
  -[NSItemRepresentationLoadResult setCleanupHandler:](v4, "setCleanupHandler:", self->_cleanupHandler);
  -[NSItemRepresentationLoadResult setError:](v4, "setError:", self->_error);
  -[NSItemRepresentationLoadResult setWasOpenedInPlace:](v4, "setWasOpenedInPlace:", self->_wasOpenedInPlace);
  -[NSItemRepresentationLoadResult setArchivedObjectClass:](v4, "setArchivedObjectClass:", self->_archivedObjectClass);
  return v4;
}

- (id)copyWithData:(id)a3 urlWrapper:(id)a4 cleanupHandler:(id)a5 error:(id)a6
{
  void *v10;

  v10 = (void *)-[NSItemRepresentationLoadResult copy](self, "copy");
  objc_msgSend(v10, "setData:", a3);
  objc_msgSend(v10, "setUrlWrapper:", a4);
  objc_msgSend(v10, "setCleanupHandler:", a5);
  objc_msgSend(v10, "setError:", a6);
  return v10;
}

- (NSString)archivedObjectClassName
{
  return 0;
}

- (void)setArchivedObjectClassName:(id)a3
{
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD0A7B8 != -1)
    dispatch_once(&qword_1ECD0A7B8, &__block_literal_global_121);
  v4 = _MergedGlobals_148;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_148, OS_LOG_TYPE_FAULT))
  {
    v5 = 138543362;
    v6 = a3;
    _os_log_fault_impl(&dword_1817D9000, v4, OS_LOG_TYPE_FAULT, "It is insecure to set the archived object class name. The class name provided will be ignored: %{public}@. Please use .archivedObjectClass instead and do _NOT_ use NSClassFromString(…) unless you are matching the class to an allow-list.", (uint8_t *)&v5, 0xCu);
  }
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSecurityScopedURLWrapper)urlWrapper
{
  return self->_urlWrapper;
}

- (void)setUrlWrapper:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (id)cleanupHandler
{
  return self->_cleanupHandler;
}

- (void)setCleanupHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (Class)archivedObjectClass
{
  return self->_archivedObjectClass;
}

- (void)setArchivedObjectClass:(Class)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)wasOpenedInPlace
{
  return self->_wasOpenedInPlace;
}

- (void)setWasOpenedInPlace:(BOOL)a3
{
  self->_wasOpenedInPlace = a3;
}

@end
