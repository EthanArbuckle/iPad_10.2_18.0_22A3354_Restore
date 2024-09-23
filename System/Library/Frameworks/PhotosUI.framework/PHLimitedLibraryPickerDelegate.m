@implementation PHLimitedLibraryPickerDelegate

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void (**v9)(void);
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_20D1E2000, v5, OS_LOG_TYPE_DEBUG, "[Limited Library Picker] presentationControllerDidDismiss: %@", (uint8_t *)&v10, 0xCu);
  }

  -[PHLimitedLibraryPickerDelegate finishedPickingBlock](self, "finishedPickingBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PHLimitedLibraryPickerDelegate finishedPickingBlock](self, "finishedPickingBlock");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, MEMORY[0x24BDBD1A8]);

  }
  -[PHLimitedLibraryPickerDelegate dismissalBlock](self, "dismissalBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PHLimitedLibraryPickerDelegate dismissalBlock](self, "dismissalBlock");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_20D1E2000, v8, OS_LOG_TYPE_DEBUG, "[Limited Library Picker] picker: %@ didFinishPicking: %@", buf, 0x16u);
  }

  -[PHLimitedLibraryPickerDelegate finishedPickingBlock](self, "finishedPickingBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    PFMap();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHLimitedLibraryPickerDelegate finishedPickingBlock](self, "finishedPickingBlock");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "copy");
    ((void (**)(_QWORD, void *))v11)[2](v11, v12);

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__PHLimitedLibraryPickerDelegate_picker_didFinishPicking___block_invoke_2;
  v13[3] = &unk_24C62C670;
  v13[4] = self;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v13);

}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)finishedPickingBlock
{
  return self->_finishedPickingBlock;
}

- (void)setFinishedPickingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PLAssetsdClient)assetsdClient
{
  return self->_assetsdClient;
}

- (void)setAssetsdClient:(id)a3
{
  objc_storeStrong((id *)&self->_assetsdClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsdClient, 0);
  objc_storeStrong(&self->_finishedPickingBlock, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
}

void __58__PHLimitedLibraryPickerDelegate_picker_didFinishPicking___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "dismissalBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissalBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

uint64_t __58__PHLimitedLibraryPickerDelegate_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetIdentifier");
}

@end
