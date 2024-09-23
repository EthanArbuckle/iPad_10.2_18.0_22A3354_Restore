@implementation _ARViewerViewController

+ (id)_remoteViewControllerInterface
{
  if (_remoteViewControllerInterface_onceToken != -1)
    dispatch_once(&_remoteViewControllerInterface_onceToken, &__block_literal_global_8);
  return (id)_remoteViewControllerInterface_sHostInterface;
}

+ (id)_exportedInterface
{
  if (_exportedInterface_onceToken != -1)
    dispatch_once(&_exportedInterface_onceToken, &__block_literal_global_48);
  return (id)_exportedInterface_sVendorInterface;
}

- (BOOL)isIgnoringInteractionEvents
{
  void *v2;
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  -[_ARViewerViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54___ARViewerViewController_isIgnoringInteractionEvents__block_invoke;
  v5[3] = &unk_1E9F0CDC0;
  v5[4] = &v6;
  objc_msgSend(v2, "isIgnoringInteractionEvents:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (int64_t)statusBarOrientation
{
  void *v2;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  -[_ARViewerViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47___ARViewerViewController_statusBarOrientation__block_invoke;
  v5[3] = &unk_1E9F0CDE8;
  v5[4] = &v6;
  objc_msgSend(v2, "statusBarOrientation:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setStatusBarOrientation:(int64_t)a3
{
  id v4;

  -[_ARViewerViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setStatusBarOrientation:", a3);

}

- (ARViewerVendorProtocol)arviewerDelegate
{
  return (ARViewerVendorProtocol *)objc_getProperty(self, a2, 968, 1);
}

- (void)setArviewerDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arviewerDelegate, 0);
}

@end
