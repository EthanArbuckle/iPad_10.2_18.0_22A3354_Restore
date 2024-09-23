@implementation PUPickerExtensionVendorContext

- (void)_updateConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  PLDispatchOnMainQueue();

}

- (void)_updatePickerUsingUpdateConfiguration:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLDispatchOnMainQueue();

}

- (void)_startActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLDispatchOnMainQueue();

}

- (void)_stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLDispatchOnMainQueue();

}

- (void)_deselectAssetsWithIdentifiers:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLDispatchOnMainQueue();

}

- (void)_moveAssetWithIdentifier:(id)a3 afterIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  PLDispatchOnMainQueue();

}

- (void)_updateSelectedAssetsWithIdentifiers:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLDispatchOnMainQueue();

}

- (void)_searchWithString:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLDispatchOnMainQueue();

}

- (void)_popViewControllerWithReply:(id)a3
{
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[PUPickerExtensionVendorContext delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_popViewControllerWithReply:", v5);

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__PUPickerExtensionVendorContext__popViewControllerWithReply___block_invoke;
    block[3] = &unk_24C62C698;
    block[4] = self;
    v7 = v5;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
}

- (void)_scrollContentToInitialPosition
{
  PLDispatchOnMainQueue();
}

- (void)_zoomInContent
{
  PLDispatchOnMainQueue();
}

- (void)_zoomOutContent
{
  PLDispatchOnMainQueue();
}

- (void)_hostModalInPresentationDidChange:(BOOL)a3
{
  PLDispatchOnMainQueue();
}

- (_PUPickerExtensionContextVendorInterface)delegate
{
  return (_PUPickerExtensionContextVendorInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __68__PUPickerExtensionVendorContext__hostModalInPresentationDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hostModalInPresentationDidChange:", *(unsigned __int8 *)(a1 + 40));

}

void __49__PUPickerExtensionVendorContext__zoomOutContent__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_zoomOutContent");

}

void __48__PUPickerExtensionVendorContext__zoomInContent__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_zoomInContent");

}

void __65__PUPickerExtensionVendorContext__scrollContentToInitialPosition__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_scrollContentToInitialPosition");

}

void __62__PUPickerExtensionVendorContext__popViewControllerWithReply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_popViewControllerWithReply:", *(_QWORD *)(a1 + 40));

}

void __52__PUPickerExtensionVendorContext__searchWithString___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_searchWithString:", *(_QWORD *)(a1 + 40));

}

void __71__PUPickerExtensionVendorContext__updateSelectedAssetsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateSelectedAssetsWithIdentifiers:", *(_QWORD *)(a1 + 40));

}

void __75__PUPickerExtensionVendorContext__moveAssetWithIdentifier_afterIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_moveAssetWithIdentifier:afterIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __65__PUPickerExtensionVendorContext__deselectAssetsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_deselectAssetsWithIdentifiers:", *(_QWORD *)(a1 + 40));

}

void __82__PUPickerExtensionVendorContext__stopActivityIndicatorsForAssetsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stopActivityIndicatorsForAssetsWithIdentifiers:", *(_QWORD *)(a1 + 40));

}

void __83__PUPickerExtensionVendorContext__startActivityIndicatorsForAssetsWithIdentifiers___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_startActivityIndicatorsForAssetsWithIdentifiers:", *(_QWORD *)(a1 + 40));

}

void __72__PUPickerExtensionVendorContext__updatePickerUsingUpdateConfiguration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updatePickerUsingUpdateConfiguration:", *(_QWORD *)(a1 + 40));

}

void __73__PUPickerExtensionVendorContext__updateConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateConfiguration:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
