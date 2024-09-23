@implementation SCNMTLLibrary

- (SCNMTLLibrary)initWithPath:(id)a3 manager:(id)a4
{
  SCNMTLLibrary *v6;
  NSURL *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCNMTLLibrary;
  v6 = -[SCNMTLLibrary init](&v9, sel_init);
  if (v6)
  {
    if (a3)
      v7 = (NSURL *)(id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
    else
      v7 = 0;
    v6->_libraryURL = v7;
    v6->_manager = (SCNMTLLibraryManager *)a4;
    -[SCNMTLLibrary _load](v6, "_load");
  }
  return v6;
}

- (void)_load
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_1(&dword_1DCCB8000, v0, v1, "Error: FATAL ERROR : failed to load Metal shaders library %@, %@");
  OUTLINED_FUNCTION_1();
}

- (MTLLibrary)library
{
  return self->_library;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNMTLLibrary;
  -[SCNMTLLibrary dealloc](&v3, sel_dealloc);
}

@end
