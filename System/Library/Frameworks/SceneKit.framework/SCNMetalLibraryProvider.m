@implementation SCNMetalLibraryProvider

- (void)dealloc
{
  objc_super v3;

  _Block_release(self->_block);
  v3.receiver = self;
  v3.super_class = (Class)SCNMetalLibraryProvider;
  -[SCNMetalLibraryProvider dealloc](&v3, sel_dealloc);
}

- (id)iniWithLibrary:(id)a3
{
  SCNMetalLibraryProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNMetalLibraryProvider;
  v4 = -[SCNMetalLibraryProvider init](&v6, sel_init);
  if (v4)
    v4->_library = (MTLLibrary *)a3;
  return v4;
}

- (id)iniWithLibraryURL:(id)a3
{
  SCNMetalLibraryProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNMetalLibraryProvider;
  v4 = -[SCNMetalLibraryProvider init](&v6, sel_init);
  if (v4)
    v4->_libraryURL = (NSURL *)a3;
  return v4;
}

- (id)iniWithBlock:(id)a3
{
  SCNMetalLibraryProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCNMetalLibraryProvider;
  v4 = -[SCNMetalLibraryProvider init](&v6, sel_init);
  if (v4)
    v4->_block = _Block_copy(a3);
  return v4;
}

- (id)libraryForDevice:(id)a3
{
  uint64_t (**block)(id, id);
  id result;
  NSURL *libraryURL;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;

  if ((id)-[MTLLibrary device](self->_library, "device") == a3)
    return self->_library;
  block = (uint64_t (**)(id, id))self->_block;
  if (!block || (result = (id)block[2](block, a3)) == 0)
  {
    libraryURL = self->_libraryURL;
    if (libraryURL)
    {
      v11 = 0;
      v8 = (void *)objc_msgSend(a3, "newLibraryWithURL:error:", libraryURL, &v11);
      if (v8)
        return v8;
      v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SCNMetalLibraryProvider libraryForDevice:].cold.2();
    }
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SCNMetalLibraryProvider libraryForDevice:].cold.1();
    return 0;
  }
  return result;
}

- (unint64_t)_libraryHash
{
  const void *library;
  NSObject *v5;

  library = self->_library;
  if (library)
    return CFHash(library);
  library = self->_block;
  if (library)
    return CFHash(library);
  library = self->_libraryURL;
  if (library)
    return CFHash(library);
  v5 = scn_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SCNMetalLibraryProvider _libraryHash].cold.1();
  return 0;
}

- (void)libraryForDevice:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: %@ can't provide a library for %@");
  OUTLINED_FUNCTION_1();
}

- (void)libraryForDevice:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: %@ failed to create a library with error %@");
  OUTLINED_FUNCTION_1();
}

- (void)_libraryHash
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, v0, v1, "Error: %@ can't provide a library hash", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
