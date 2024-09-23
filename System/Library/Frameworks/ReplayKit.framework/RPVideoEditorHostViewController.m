@implementation RPVideoEditorHostViewController

- (void)extensionDidFinishWithActivityTypes:(id)a3
{
  id v4;
  void *v5;
  uint8_t v6[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPVideoEditorHostViewController:extensionsDidFinish", v6, 2u);
  }
  -[RPVideoEditorHostViewController previewViewController](self, "previewViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionDidFinishWithActivityTypes:", v4);

}

- (RPPreviewViewController)previewViewController
{
  return (RPPreviewViewController *)objc_loadWeakRetained((id *)&self->_previewViewController);
}

- (void)setPreviewViewController:(id)a3
{
  objc_storeWeak((id *)&self->_previewViewController, a3);
}

- (RPVideoEditorExtensionHostContext)hostContext
{
  return self->_hostContext;
}

- (void)setHostContext:(id)a3
{
  objc_storeStrong((id *)&self->_hostContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostContext, 0);
  objc_destroyWeak((id *)&self->_previewViewController);
}

@end
