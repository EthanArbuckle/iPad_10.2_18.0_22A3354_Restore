@implementation BLSHInternalTapToRadarDialog

- (BLSHInternalTapToRadarDialog)initWithDescriptor:(id)a3 log:(id)a4
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  BLSHInternalTapToRadarDialog *v10;
  BLSHInternalTapToRadarDialog *v11;
  id *p_isa;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (__dialog)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BLSHInternalTapToRadarDialog initWithDescriptor:log:].cold.1(v9);
    v10 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BLSHInternalTapToRadarDialog;
    v11 = -[BLSHInternalTapToRadarDialog init](&v14, sel_init);
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_descriptor, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong((id *)&__dialog, p_isa);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (void)presentWithCompletion:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  __CFRunLoop *Current;
  void *v17;
  id completion;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if ((os_variant_has_internal_ui() & 1) == 0)
  {
LABEL_5:
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    goto LABEL_10;
  }
  if (-[BLSHInternalTapToRadarDialog _shouldIgnore](self, "_shouldIgnore"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[BLSHInternalTapToRadarDialog presentWithCompletion:].cold.1((uint64_t)self, log);
    goto LABEL_5;
  }
  -[BLSHTapToRadarDescriptor ttrPromptMessage](self->_descriptor, "ttrPromptMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[BLSHTapToRadarDescriptor radarDescription](self->_descriptor, "radarDescription");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  v19[0] = *MEMORY[0x24BDBD6D8];
  -[BLSHTapToRadarDescriptor ttrPromptHeader](self->_descriptor, "ttrPromptHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDBD6E0];
  v20[0] = v10;
  v20[1] = v9;
  v12 = *MEMORY[0x24BDBD6F8];
  v19[1] = v11;
  v19[2] = v12;
  v13 = *MEMORY[0x24BDBD6F0];
  v20[2] = CFSTR("File Radar");
  v20[3] = CFSTR("Ignore");
  v14 = *MEMORY[0x24BDBD718];
  v19[3] = v13;
  v19[4] = v14;
  v20[4] = CFSTR("Don't Ask Again");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  presentWithCompletion____blsAlertUserNotification = (uint64_t)CFUserNotificationCreate(0, 0.0, 3uLL, 0, v15);
  presentWithCompletion____blsWatchdogAlertRunLoopSource = (uint64_t)CFUserNotificationCreateRunLoopSource(0, (CFUserNotificationRef)presentWithCompletion____blsAlertUserNotification, (CFUserNotificationCallBack)_blsAlertCallback, 99);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, (CFRunLoopSourceRef)presentWithCompletion____blsWatchdogAlertRunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  v17 = (void *)objc_msgSend(v4, "copy");
  completion = self->_completion;
  self->_completion = v17;

LABEL_10:
}

- (void)_alertDidDismiss:(int64_t)a3
{
  void *v5;
  NSObject *log;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)__dialog;
  __dialog = 0;

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134217984;
    v15 = a3;
    _os_log_impl(&dword_2145AC000, log, OS_LOG_TYPE_DEFAULT, "_alertDidDismiss: ttrDialogResult=%ld", (uint8_t *)&v14, 0xCu);
  }
  switch(a3)
  {
    case 0:
      -[BLSHInternalTapToRadarDialog _cancel](self, "_cancel");
      break;
    case 1:
      -[BLSHInternalTapToRadarDialog _file](self, "_file");
      break;
    case 2:
      -[BLSHInternalTapToRadarDialog _ignore](self, "_ignore");
      break;
    case 3:
      -[BLSHInternalTapToRadarDialog _gotError](self, "_gotError");
      break;
    default:
      v7 = self->_log;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[BLSHInternalTapToRadarDialog _alertDidDismiss:].cold.1(a3, v7, v8, v9, v10, v11, v12, v13);
      break;
  }
}

- (void)_file
{
  BLSHTapToRadarDescriptor *descriptor;
  OS_os_log *log;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  descriptor = self->_descriptor;
  log = self->_log;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__BLSHInternalTapToRadarDialog__file__block_invoke;
  v5[3] = &unk_24D1BD4A8;
  objc_copyWeak(&v6, &location);
  +[BLSHTapToRadarFiler fileRadar:log:completion:](BLSHTapToRadarFiler, "fileRadar:log:completion:", descriptor, log, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __37__BLSHInternalTapToRadarDialog__file__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;
  uint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a3)
    v6 = a2 ^ 1;
  else
    v6 = 0;
  objc_msgSend(WeakRetained, "callCompletion:shouldTryAgain:", a2, v6);

}

- (BOOL)_shouldIgnore
{
  return +[BLSHInternalTapToRadarIgnorer shouldIgnoreDesignation:](BLSHInternalTapToRadarIgnorer, "shouldIgnoreDesignation:", -[BLSHTapToRadarDescriptor designation](self->_descriptor, "designation"));
}

- (void)_ignore
{
  NSObject *log;
  BLSHTapToRadarDescriptor *descriptor;
  int v5;
  BLSHTapToRadarDescriptor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    descriptor = self->_descriptor;
    v5 = 138412290;
    v6 = descriptor;
    _os_log_impl(&dword_2145AC000, log, OS_LOG_TYPE_DEFAULT, "adding %@ to Tap-To-Radar ignore list", (uint8_t *)&v5, 0xCu);
  }
  +[BLSHInternalTapToRadarIgnorer ignoreRadarDesignation:](BLSHInternalTapToRadarIgnorer, "ignoreRadarDesignation:", -[BLSHTapToRadarDescriptor designation](self->_descriptor, "designation"));
  -[BLSHInternalTapToRadarDialog callCompletion:shouldTryAgain:](self, "callCompletion:shouldTryAgain:", 0, 0);
}

- (void)_cancel
{
  NSObject *log;
  BLSHTapToRadarDescriptor *descriptor;
  int v5;
  BLSHTapToRadarDescriptor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    descriptor = self->_descriptor;
    v5 = 138412290;
    v6 = descriptor;
    _os_log_impl(&dword_2145AC000, log, OS_LOG_TYPE_DEFAULT, "cancelling %@", (uint8_t *)&v5, 0xCu);
  }
  -[BLSHInternalTapToRadarDialog callCompletion:shouldTryAgain:](self, "callCompletion:shouldTryAgain:", 0, 0);
}

- (void)_gotError
{
  NSObject *log;
  BLSHTapToRadarDescriptor *descriptor;
  int v5;
  BLSHTapToRadarDescriptor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    descriptor = self->_descriptor;
    v5 = 138412290;
    v6 = descriptor;
    _os_log_impl(&dword_2145AC000, log, OS_LOG_TYPE_DEFAULT, "got error trying to prompt for tap-to-radar. will try again later %@", (uint8_t *)&v5, 0xCu);
  }
  -[BLSHInternalTapToRadarDialog callCompletion:shouldTryAgain:](self, "callCompletion:shouldTryAgain:", 0, 1);
}

- (void)callCompletion:(BOOL)a3 shouldTryAgain:(BOOL)a4
{
  BSDispatchMain();
}

void __62__BLSHInternalTapToRadarDialog_callCompletion_shouldTryAgain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  if (*(_QWORD *)(v2 + 24))
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(a1 + 40);
      v5 = *(unsigned __int8 *)(a1 + 41);
      v8[0] = 67109376;
      v8[1] = v4;
      v9 = 1024;
      v10 = v5;
      _os_log_impl(&dword_2145AC000, v3, OS_LOG_TYPE_DEFAULT, "Tap-To-Radar dialog calling completion radarWasFiled:%{BOOL}u shouldTryAgain:%{BOOL}u", (uint8_t *)v8, 0xEu);
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = 0;

  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __62__BLSHInternalTapToRadarDialog_callCompletion_shouldTryAgain___block_invoke_cold_1(a1, v3);
  }
}

- (BLSHTapToRadarDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)initWithDescriptor:(os_log_t)log log:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2145AC000, log, OS_LOG_TYPE_FAULT, "only one BLSHInternalTapToRadarDialog at a time", v1, 2u);
}

- (void)presentWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 8);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_2145AC000, a2, OS_LOG_TYPE_ERROR, "ignoring Tap-To-Radar %@ per previous user request", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_alertDidDismiss:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_2145AC000, a2, a3, "Got unpexpected response in _alertDidDismiss(): %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __62__BLSHInternalTapToRadarDialog_callCompletion_shouldTryAgain___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 41);
  v4[0] = 67109376;
  v4[1] = v2;
  v5 = 1024;
  v6 = v3;
  _os_log_error_impl(&dword_2145AC000, a2, OS_LOG_TYPE_ERROR, "Tap-To-Radar dialog asked to call nil completion radarWasFiled:%{BOOL}u shouldTryAgain:%{BOOL}u", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_2();
}

@end
