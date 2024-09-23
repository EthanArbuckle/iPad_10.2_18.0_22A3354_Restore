@implementation _NSBundleODRDataForExtensions

+ (_NSBundleODRDataForExtensions)dataForBundle:(int)a3 createIfRequired:
{
  NSMapTable *v5;
  uint64_t v6;
  _NSBundleODRDataForExtensions *v7;
  _NSBundleODRDataForExtensions *v8;

  objc_opt_self();
  if (qword_1ECD056B0 != -1)
    dispatch_once(&qword_1ECD056B0, &__block_literal_global_196);
  objc_msgSend((id)qword_1ECD056A8, "lock");
  v5 = (NSMapTable *)qword_1ECD056A0;
  if (!qword_1ECD056A0)
  {
    if (!a3)
    {
      v7 = 0;
      goto LABEL_10;
    }
    v5 = +[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable");
    qword_1ECD056A0 = (uint64_t)v5;
  }
  v6 = -[NSMapTable objectForKey:](v5, "objectForKey:", a2);
  v7 = (_NSBundleODRDataForExtensions *)v6;
  if (a3 && !v6)
  {
    v7 = -[_NSBundleODRDataCommon initWithBundle:]([_NSBundleODRDataForExtensions alloc], "initWithBundle:", a2);
    objc_msgSend((id)qword_1ECD056A0, "setObject:forKey:", v7, a2);
    v8 = v7;
  }
LABEL_10:
  objc_msgSend((id)qword_1ECD056A8, "unlock");
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[NSXPCConnection invalidate](self->_connection, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)_NSBundleODRDataForExtensions;
  -[_NSBundleODRDataCommon dealloc](&v3, sel_dealloc);
}

- (void)accessSandboxExtension:(id)a3
{
  int64_t v4;
  int v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "UTF8String");
  v4 = sandbox_extension_consume();
  self->super._sandboxToken = v4;
  if (v4 < 0)
  {
    v5 = *__error();
    if (qword_1ECD056F0 != -1)
      dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
    v6 = qword_1ECD056E8;
    if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v5;
      _os_log_error_impl(&dword_1817D9000, v6, OS_LOG_TYPE_ERROR, "NSBundleResourceRequest encountered a sandboxing error (extensions): %d", (uint8_t *)v7, 8u);
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  objc_msgSend(a4, "setExportedObject:", self);
  objc_msgSend(a4, "setExportedInterface:", _appExtensionInterface());
  objc_msgSend(a4, "resume");
  self->_connection = (NSXPCConnection *)a4;
  return 1;
}

- (void)hostApplicationAssetPacksBecameAvailable:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = 0;
  if (!-[_NSBundleODRDataCommon assetPacksBecameAvailable:error:](self, "assetPacksBecameAvailable:error:", a3, &v4))
  {
    if (qword_1ECD056F0 != -1)
      dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
    v3 = qword_1ECD056E8;
    if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1817D9000, v3, OS_LOG_TYPE_ERROR, "Error in extension adding asset packs: %@", buf, 0xCu);
    }
  }
}

- (void)hostApplicationAssetPacksBecameUnavailable:(id)a3
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!-[_NSBundleODRDataCommon assetPacksBecameUnavailable:error:](self, "assetPacksBecameUnavailable:error:", a3, 0))
  {
    if (qword_1ECD056F0 != -1)
      dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
    v3 = qword_1ECD056E8;
    if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = 0;
      _os_log_error_impl(&dword_1817D9000, v3, OS_LOG_TYPE_ERROR, "Error in extension removing asset packs: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

@end
