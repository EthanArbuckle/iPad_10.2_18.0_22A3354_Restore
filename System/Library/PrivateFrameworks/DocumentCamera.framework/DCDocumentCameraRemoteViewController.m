@implementation DCDocumentCameraRemoteViewController

- (int64_t)preferredContainerBackgroundStyle
{
  return 2;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[DCDocumentCameraRemoteViewController viewServiceDidTerminateWithError:].cold.1((uint64_t)v4, v5);

  -[DCDocumentCameraRemoteViewController dismiss](self, "dismiss");
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E3640);
}

+ (id)exportedInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D37E0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_didFinishWithDocumentInfoCollection_, 0, 0);

  return v2;
}

- (void)viewServicePreferredSizeDidChange:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[DCDocumentCameraRemoteViewController publicViewController](self, "publicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServicePreferredSizeDidChange:", width, height);

}

- (void)dismiss
{
  id v2;

  -[DCDocumentCameraRemoteViewController publicViewController](self, "publicViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismiss");

}

- (void)viewControllerWasDismissed
{
  void *v3;

  -[DCDocumentCameraRemoteViewController viewServiceViewController](self, "viewServiceViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerWasDismissed");

  -[DCDocumentCameraRemoteViewController setPublicViewController:](self, "setPublicViewController:", 0);
}

- (void)didCancel
{
  id v2;

  -[DCDocumentCameraRemoteViewController publicViewController](self, "publicViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didCancel");

}

- (void)didFinishWithDocumentInfoCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCDocumentCameraRemoteViewController publicViewController](self, "publicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didFinishWithDocumentInfoCollection:", v4);

}

- (void)didFailWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DCDocumentCameraRemoteViewController publicViewController](self, "publicViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didFailWithError:", v4);

}

- (DCDocumentCameraPublicViewController)publicViewController
{
  return (DCDocumentCameraPublicViewController *)objc_loadWeakRetained((id *)&self->_publicViewController);
}

- (void)setPublicViewController:(id)a3
{
  objc_storeWeak((id *)&self->_publicViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_publicViewController);
}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20CE8E000, a2, OS_LOG_TYPE_ERROR, "Remote view service terminated with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
