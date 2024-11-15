@implementation CAMMachineReadableCodeLoggingController

- (CAMMachineReadableCodeLoggingController)init
{
  CAMMachineReadableCodeLoggingController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMMachineReadableCodeLoggingController;
  result = -[CAMMachineReadableCodeLoggingController init](&v3, sel_init);
  *(_WORD *)&result->__seenMachineReadableObjectOfAcceptableSize = 0;
  result->__seenMachineReadableObjectInNonActiveState = 0;
  return result;
}

- (void)logMachineReadableCodeResultDuringInactiveAppState
{
  NSObject *v3;
  uint8_t v4[16];

  if (!-[CAMMachineReadableCodeLoggingController _seenMachineReadableObjectInNonActiveState](self, "_seenMachineReadableObjectInNonActiveState"))
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "MRC detected during inactive application state.", v4, 2u);
    }

    -[CAMMachineReadableCodeLoggingController _setSeenMachineReadableObjectInNonActiveState:](self, "_setSeenMachineReadableObjectInNonActiveState:", 1);
  }
}

- (void)logMachineReadableCodeResult:(id)a3 isOfSignificantSize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[CAMMachineReadableCodeLoggingController _seenMachineReadableObjectOfAcceptableSize](self, "_seenMachineReadableObjectOfAcceptableSize");
  v8 = -[CAMMachineReadableCodeLoggingController _seenMachineReadableObjectOfUnacceptableSize](self, "_seenMachineReadableObjectOfUnacceptableSize");
  if (v4 && !v7)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "MRC object handed off to BarcodeSupport", (uint8_t *)&v16, 2u);
    }

    -[CAMMachineReadableCodeLoggingController _setSeenMachineReadableObjectOfAcceptableSize:](self, "_setSeenMachineReadableObjectOfAcceptableSize:", 1);
  }
  if (!v4 && !v8)
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "underlyingMachineReadableCodeObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v13 = v12;
      objc_msgSend(v6, "underlyingMachineReadableCodeObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      v16 = 134218240;
      v17 = v13;
      v18 = 2048;
      v19 = v15;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "MRC object recognized, but was too small. Height:%f, Width:%f", (uint8_t *)&v16, 0x16u);

    }
    -[CAMMachineReadableCodeLoggingController _setSeenMachineReadableObjectOfUnacceptableSize:](self, "_setSeenMachineReadableObjectOfUnacceptableSize:", 1);
  }

}

- (void)resetLoggingState
{
  -[CAMMachineReadableCodeLoggingController _setSeenMachineReadableObjectInNonActiveState:](self, "_setSeenMachineReadableObjectInNonActiveState:", 0);
  -[CAMMachineReadableCodeLoggingController _setSeenMachineReadableObjectOfAcceptableSize:](self, "_setSeenMachineReadableObjectOfAcceptableSize:", 0);
  -[CAMMachineReadableCodeLoggingController _setSeenMachineReadableObjectOfUnacceptableSize:](self, "_setSeenMachineReadableObjectOfUnacceptableSize:", 0);
}

- (BOOL)_seenMachineReadableObjectOfAcceptableSize
{
  return self->__seenMachineReadableObjectOfAcceptableSize;
}

- (void)_setSeenMachineReadableObjectOfAcceptableSize:(BOOL)a3
{
  self->__seenMachineReadableObjectOfAcceptableSize = a3;
}

- (BOOL)_seenMachineReadableObjectOfUnacceptableSize
{
  return self->__seenMachineReadableObjectOfUnacceptableSize;
}

- (void)_setSeenMachineReadableObjectOfUnacceptableSize:(BOOL)a3
{
  self->__seenMachineReadableObjectOfUnacceptableSize = a3;
}

- (BOOL)_seenMachineReadableObjectInNonActiveState
{
  return self->__seenMachineReadableObjectInNonActiveState;
}

- (void)_setSeenMachineReadableObjectInNonActiveState:(BOOL)a3
{
  self->__seenMachineReadableObjectInNonActiveState = a3;
}

@end
