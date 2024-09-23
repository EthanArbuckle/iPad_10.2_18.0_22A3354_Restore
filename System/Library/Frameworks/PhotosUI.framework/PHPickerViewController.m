@implementation PHPickerViewController

- (PHPickerViewController)initWithConfiguration:(PHPickerConfiguration *)configuration
{
  PHPickerConfiguration *v4;
  PHPickerConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  PHPickerViewController *v11;
  uint64_t v12;
  PHPickerConfiguration *v13;
  void *v14;
  void *v15;
  PHPickerViewController *result;
  PHPickerViewController *v17;
  SEL v18;
  PHPickerUpdateConfiguration *v19;
  _QWORD aBlock[4];
  id v21;
  char v22;
  id location;
  objc_super v24;

  v4 = configuration;
  if (!v4)
  {
    _PFAssertFailHandler();
LABEL_25:
    _PFAssertFailHandler();
    goto LABEL_26;
  }
  v5 = v4;
  -[PHPickerConfiguration photoLibrary](v4, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else if (-[PHPickerConfiguration _onlyReturnsIdentifiers](v5, "_onlyReturnsIdentifiers"))
  {
LABEL_36:
    _PFAssertFailHandler();
    goto LABEL_37;
  }
  if (-[PHPickerConfiguration preferredAssetRepresentationMode](v5, "preferredAssetRepresentationMode") < 0)
    goto LABEL_25;
  if (-[PHPickerConfiguration preferredAssetRepresentationMode](v5, "preferredAssetRepresentationMode") >= (PHPickerConfigurationAssetRepresentationModeCompatible|PHPickerConfigurationAssetRepresentationModeCurrent))
  {
LABEL_26:
    _PFAssertFailHandler();
    goto LABEL_27;
  }
  if (-[PHPickerConfiguration selection](v5, "selection") < 0)
  {
LABEL_27:
    _PFAssertFailHandler();
    goto LABEL_28;
  }
  if (-[PHPickerConfiguration selection](v5, "selection") >= 4)
  {
LABEL_28:
    _PFAssertFailHandler();
    goto LABEL_29;
  }
  if (-[PHPickerConfiguration selectionLimit](v5, "selectionLimit") < 0)
  {
LABEL_29:
    _PFAssertFailHandler();
    goto LABEL_30;
  }
  -[PHPickerConfiguration preselectedAssetIdentifiers](v5, "preselectedAssetIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_30:
    _PFAssertFailHandler();
    goto LABEL_31;
  }
  -[PHPickerConfiguration photoLibrary](v5, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    goto LABEL_14;
  }
  -[PHPickerConfiguration preselectedAssetIdentifiers](v5, "preselectedAssetIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
LABEL_14:
    if ((-[PHPickerConfiguration mode](v5, "mode") & 0x8000000000000000) == 0)
    {
      if (-[PHPickerConfiguration mode](v5, "mode") < 2)
      {
        if ((-[PHPickerConfiguration _sourceType](v5, "_sourceType") & 0x8000000000000000) == 0)
        {
          if (-[PHPickerConfiguration _sourceType](v5, "_sourceType") < 6)
          {
            v24.receiver = self;
            v24.super_class = (Class)PHPickerViewController;
            v11 = -[PHPickerViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
            if (!v11)
            {
LABEL_23:

              return v11;
            }
            if ((-[PHPickerViewController isMemberOfClass:](v11, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
            {
              v12 = -[PHPickerConfiguration copy](v5, "copy");
              v13 = v11->_configuration;
              v11->_configuration = (PHPickerConfiguration *)v12;

              PLServicesLocalizedFrameworkString();
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[PHPickerViewController setTitle:](v11, "setTitle:", v14);

              -[PHPickerViewController setModalPresentationStyle:](v11, "setModalPresentationStyle:", 2);
              -[PHPickerViewController _addOrReplaceChildUnavailableViewController:error:](v11, "_addOrReplaceChildUnavailableViewController:error:", 1, 0);
              v15 = 0;
              if (!-[PHPickerConfiguration _alwaysShowLoadingPlaceholder](v5, "_alwaysShowLoadingPlaceholder"))
              {
                -[PHPickerViewController _beginDelayingPresentation:cancellationHandler:](v11, "_beginDelayingPresentation:cancellationHandler:", 0, 3.0);
                objc_initWeak(&location, v11);
                aBlock[0] = MEMORY[0x24BDAC760];
                aBlock[1] = 3221225472;
                aBlock[2] = __48__PHPickerViewController_initWithConfiguration___block_invoke;
                aBlock[3] = &unk_24C62C7B8;
                v22 = 0;
                objc_copyWeak(&v21, &location);
                v15 = _Block_copy(aBlock);
                objc_destroyWeak(&v21);
                objc_destroyWeak(&location);
              }
              -[PHPickerViewController _setup:](v11, "_setup:", v15);

              goto LABEL_23;
            }
            goto LABEL_35;
          }
LABEL_34:
          _PFAssertFailHandler();
LABEL_35:
          _PFAssertFailHandler();
          goto LABEL_36;
        }
LABEL_33:
        _PFAssertFailHandler();
        goto LABEL_34;
      }
LABEL_32:
      _PFAssertFailHandler();
      goto LABEL_33;
    }
LABEL_31:
    _PFAssertFailHandler();
    goto LABEL_32;
  }
LABEL_37:
  v17 = (PHPickerViewController *)_PFAssertFailHandler();
  -[PHPickerViewController updatePickerUsingConfiguration:](v17, v18, v19);
  return result;
}

- (void)updatePickerUsingConfiguration:(PHPickerUpdateConfiguration *)configuration
{
  PHPickerUpdateConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  PHPickerViewController *v8;
  SEL v9;
  NSArray *v10;
  PHPickerUpdateConfiguration *v11;

  v4 = configuration;
  if (v4)
  {
    v11 = v4;
    if ((-[PHPickerUpdateConfiguration selectionLimit](v4, "selectionLimit") & 0x8000000000000000) == 0)
    {
      -[PHPickerViewController _extensionContext](self, "_extensionContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_auxiliaryConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "remoteObjectProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "_updatePickerUsingUpdateConfiguration:", v11);
      return;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v8 = (PHPickerViewController *)_PFAssertFailHandler();
  -[PHPickerViewController deselectAssetsWithIdentifiers:](v8, v9, v10);
}

- (void)deselectAssetsWithIdentifiers:(NSArray *)identifiers
{
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  PHPickerViewController *v8;
  SEL v9;
  NSString *v10;
  NSString *v11;
  NSArray *v12;

  v4 = identifiers;
  if (v4)
  {
    v12 = v4;
    if (-[NSArray count](v4, "count"))
    {
      -[PHPickerViewController _extensionContext](self, "_extensionContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_auxiliaryConnection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "remoteObjectProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "_deselectAssetsWithIdentifiers:", v12);
      return;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v8 = (PHPickerViewController *)_PFAssertFailHandler();
  -[PHPickerViewController moveAssetWithIdentifier:afterAssetWithIdentifier:](v8, v9, v10, v11);
}

- (void)moveAssetWithIdentifier:(NSString *)identifier afterAssetWithIdentifier:(NSString *)afterIdentifier
{
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  PHPickerViewController *v10;
  SEL v11;
  NSString *v12;

  v12 = identifier;
  v6 = afterIdentifier;
  if (v12)
  {
    -[PHPickerViewController _extensionContext](self, "_extensionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_auxiliaryConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_moveAssetWithIdentifier:afterIdentifier:", v12, v6);
  }
  else
  {
    v10 = (PHPickerViewController *)_PFAssertFailHandler();
    -[PHPickerViewController scrollToInitialPosition](v10, v11);
  }
}

- (void)scrollToInitialPosition
{
  void *v2;
  void *v3;
  id v4;

  -[PHPickerViewController _extensionContext](self, "_extensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_auxiliaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_scrollContentToInitialPosition");
}

- (void)zoomIn
{
  void *v2;
  void *v3;
  id v4;

  -[PHPickerViewController _extensionContext](self, "_extensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_auxiliaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_zoomInContent");
}

- (void)zoomOut
{
  void *v2;
  void *v3;
  id v4;

  -[PHPickerViewController _extensionContext](self, "_extensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_auxiliaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_zoomOutContent");
}

- (PHPickerViewController)init
{
  PHPickerViewController *v2;
  SEL v3;
  NSString *v4;
  NSBundle *v5;

  v2 = (PHPickerViewController *)_PFAssertFailHandler();
  return -[PHPickerViewController initWithNibName:bundle:](v2, v3, v4, v5);
}

- (PHPickerViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  NSString *v5;
  NSBundle *v6;
  PHPickerViewController *v7;
  SEL v8;
  NSCoder *v9;

  v5 = nibNameOrNil;
  v6 = nibBundleOrNil;
  v7 = (PHPickerViewController *)_PFAssertFailHandler();
  return -[PHPickerViewController initWithCoder:](v7, v8, v9);
}

- (PHPickerViewController)initWithCoder:(NSCoder *)coder
{
  NSCoder *v3;
  PHPickerViewController *v4;
  SEL v5;
  PHPickerViewController *result;

  v3 = coder;
  v4 = (PHPickerViewController *)_PFAssertFailHandler();
  -[PHPickerViewController dealloc](v4, v5);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[PHPickerViewController _cancelExistingExtensionRequestIfPossible](self, "_cancelExistingExtensionRequestIfPossible");
  v3.receiver = self;
  v3.super_class = (Class)PHPickerViewController;
  -[PHPickerViewController dealloc](&v3, sel_dealloc);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHPickerViewController;
  v4 = a3;
  -[PHPickerViewController preferredContentSizeDidChangeForChildContentContainer:](&v9, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  v6 = v5;
  v8 = v7;

  -[PHPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)setModalInPresentation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHPickerViewController;
  -[PHPickerViewController setModalInPresentation:](&v8, sel_setModalInPresentation_);
  -[PHPickerViewController _extensionContext](self, "_extensionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_hostModalInPresentationDidChange:", v3);
}

- (void)_startActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PHPickerViewController *v8;
  SEL v9;
  id v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    -[PHPickerViewController _extensionContext](self, "_extensionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_auxiliaryConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_startActivityIndicatorsForAssetsWithIdentifiers:", v11);
  }
  else
  {
    v8 = (PHPickerViewController *)_PFAssertFailHandler();
    -[PHPickerViewController _stopActivityIndicatorsForAssetsWithIdentifiers:](v8, v9, v10);
  }
}

- (void)_stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PHPickerViewController *v8;
  SEL v9;
  id v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    -[PHPickerViewController _extensionContext](self, "_extensionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_auxiliaryConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_stopActivityIndicatorsForAssetsWithIdentifiers:", v11);
  }
  else
  {
    v8 = (PHPickerViewController *)_PFAssertFailHandler();
    -[PHPickerViewController _deselectAssetsWithIdentifiers:](v8, v9, v10);
  }
}

- (void)_updateSelectedAssetsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PHPickerViewController *v8;
  SEL v9;
  id v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    -[PHPickerViewController _extensionContext](self, "_extensionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_auxiliaryConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_updateSelectedAssetsWithIdentifiers:", v11);
  }
  else
  {
    v8 = (PHPickerViewController *)_PFAssertFailHandler();
    -[PHPickerViewController _searchWithString:](v8, v9, v10);
  }
}

- (void)_searchWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PHPickerViewController *v8;
  SEL v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    -[PHPickerViewController _extensionContext](self, "_extensionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_auxiliaryConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "_searchWithString:", v10);
  }
  else
  {
    v8 = (PHPickerViewController *)_PFAssertFailHandler();
    -[PHPickerViewController _popViewController](v8, v9);
  }
}

- (BOOL)_popViewController
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PHPickerViewController _extensionContext](self, "_extensionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_auxiliaryConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_587);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__PHPickerViewController__popViewController__block_invoke_588;
  v6[3] = &unk_24C62C820;
  v6[4] = &v7;
  objc_msgSend(v4, "_popViewControllerWithReply:", v6);
  LOBYTE(v2) = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (void)_setup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = *MEMORY[0x24BDD0C30];
  v13[0] = CFSTR("com.apple.mobileslideshow.photospicker");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x24BDD1550];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __33__PHPickerViewController__setup___block_invoke;
  v8[3] = &unk_24C62C848;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "extensionsWithMatchingAttributes:completion:", v5, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_setupExtension:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PHPickerViewController *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke;
  v14[3] = &unk_24C62C8C0;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = v10;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

- (void)_handleRemoteViewControllerConnection:(id)a3 extension:(id)a4 extensionRequestIdentifier:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  BOOL v17;
  int v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  objc_class *v35;
  objc_class *v36;
  id v37;
  _QWORD v38[4];
  void (**v39)(_QWORD);
  id v40;
  id v41;
  id from;
  _QWORD v43[4];
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id location[2];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a7;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    _PFAssertFailHandler();
LABEL_24:
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    objc_claimAutoreleasedReturnValue();
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    objc_claimAutoreleasedReturnValue();
    _PFAssertFailHandler();
    goto LABEL_25;
  }
  if (v13)
    v17 = v14 == 0;
  else
    v17 = 1;
  v18 = !v17;
  if (!v12 || !v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (v18)
      objc_msgSend(v13, "cancelExtensionRequestWithIdentifier:", v14);
    -[PHPickerViewController _addOrReplaceChildUnavailableViewController:error:](self, "_addOrReplaceChildUnavailableViewController:error:", 0, v15);
    if (v16)
      v16[2](v16);
    goto LABEL_20;
  }
  -[PHPickerViewController _cancelExistingExtensionRequestIfPossible](self, "_cancelExistingExtensionRequestIfPossible");
  objc_initWeak(location, self);
  v19 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke;
  v49[3] = &unk_24C62C910;
  objc_copyWeak(&v51, location);
  v20 = v13;
  v50 = v20;
  objc_msgSend(v20, "setRequestCancellationBlock:", v49);
  v46[0] = v19;
  v46[1] = 3221225472;
  v46[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_3;
  v46[3] = &unk_24C62C960;
  objc_copyWeak(&v48, location);
  v21 = v20;
  v47 = v21;
  objc_msgSend(v21, "setRequestInterruptionBlock:", v46);
  v43[0] = v19;
  v43[1] = 3221225472;
  v43[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_5;
  v43[3] = &unk_24C62C988;
  v37 = v15;
  objc_copyWeak(&v45, location);
  v22 = v21;
  v44 = v22;
  objc_msgSend(v22, "setRequestCompletionBlock:", v43);
  -[PHPickerViewController _setExtension:](self, "_setExtension:", v22);
  -[PHPickerViewController _setExtensionRequestIdentifier:](self, "_setExtensionRequestIdentifier:", v14);
  v23 = v14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  objc_msgSend(v22, "_extensionContextForUUID:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PHPickerViewController _setExtensionContext:](self, "_setExtensionContext:", v24);

      -[PHPickerViewController _extensionContext](self, "_extensionContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setDelegate:", self);

      v26 = v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PHPickerViewController _setRemoteViewController:](self, "_setRemoteViewController:", v26);

        -[PHPickerViewController _extensionContext](self, "_extensionContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "_auxiliaryConnection");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "exportedInterface");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUPickerExtensionContext setAllowedClassesForExtensionAuxiliaryHostInterface:](PUPickerExtensionHostContext, "setAllowedClassesForExtensionAuxiliaryHostInterface:", v29);

        objc_initWeak(&from, v26);
        -[PHPickerViewController _extensionContext](self, "_extensionContext");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_auxiliaryConnection");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "remoteObjectProxy");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "_hostModalInPresentationDidChange:", -[PHPickerViewController isModalInPresentation](self, "isModalInPresentation"));
        -[PHPickerViewController configuration](self, "configuration");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_7;
        v38[3] = &unk_24C62C9D8;
        objc_copyWeak(&v40, location);
        objc_copyWeak(&v41, &from);
        v39 = v16;
        objc_msgSend(v32, "_updateConfiguration:completionHandler:", v33, v38);
        v15 = v37;

        objc_destroyWeak(&v41);
        objc_destroyWeak(&v40);

        objc_destroyWeak(&from);
        objc_destroyWeak(&v45);

        objc_destroyWeak(&v48);
        objc_destroyWeak(&v51);
        objc_destroyWeak(location);
LABEL_20:

        return;
      }
    }
    goto LABEL_24;
  }
  v34 = (objc_class *)objc_opt_class();
  NSStringFromClass(v34);
  objc_claimAutoreleasedReturnValue();
  _PFAssertFailHandler();
LABEL_25:
  __break(1u);
}

- (void)_finishPickingWithResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  PHPickerViewController *v8;
  SEL v9;
  uint8_t v10[16];

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    -[PHPickerViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v4)
        v6 = v4;
      else
        v6 = (id)MEMORY[0x24BDBD1A8];
      objc_msgSend(v5, "picker:didFinishPicking:", self, v6);
    }
    else
    {
      PLPickerGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_20D1E2000, v7, OS_LOG_TYPE_ERROR, "PHPickerViewControllerDelegate doesn't respond to picker:didFinishPicking:", v10, 2u);
      }

    }
  }
  else
  {
    v8 = (PHPickerViewController *)_PFAssertFailHandler();
    -[PHPickerViewController _cancelExistingExtensionRequestIfPossible](v8, v9);
  }
}

- (void)_cancelExistingExtensionRequestIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PHPickerViewController _extensionRequestIdentifier](self, "_extensionRequestIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[PHPickerViewController _extension](self, "_extension");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRequestCancellationBlock:", 0);

    -[PHPickerViewController _extension](self, "_extension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRequestInterruptionBlock:", 0);

    -[PHPickerViewController _extension](self, "_extension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRequestCompletionBlock:", 0);

    -[PHPickerViewController _extension](self, "_extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelExtensionRequestWithIdentifier:", v7);

  }
  -[PHPickerViewController _setExtension:](self, "_setExtension:", 0);
  -[PHPickerViewController _setExtensionRequestIdentifier:](self, "_setExtensionRequestIdentifier:", 0);
  -[PHPickerViewController _setExtensionContext:](self, "_setExtensionContext:", 0);
  -[PHPickerViewController _setRemoteViewController:](self, "_setRemoteViewController:", 0);

}

- (void)_addOrReplaceChildUnavailableViewController:(unint64_t)a3 error:(id)a4
{
  void *v6;
  void *v7;
  PHPickerViewController *v8;
  SEL v9;
  id v10;
  id v11;

  v11 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    -[PHPickerViewController configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPickerUnavailableViewController unavailableViewController:configuration:error:delegate:](PUPickerUnavailableViewController, "unavailableViewController:configuration:error:delegate:", a3, v6, v11, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHPickerViewController _addOrReplaceChildViewController:](self, "_addOrReplaceChildViewController:", v7);
  }
  else
  {
    v8 = (PHPickerViewController *)_PFAssertFailHandler();
    -[PHPickerViewController _addOrReplaceChildViewController:](v8, v9, v10);
  }
}

- (void)_addOrReplaceChildViewController:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PHPickerViewController childViewControllers](self, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 >= 2)
    _PFAssertFailHandler();
  -[PHPickerViewController childViewControllers](self, "childViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "willMoveToParentViewController:", 0);
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    objc_msgSend(v8, "removeFromParentViewController");
  }
  objc_msgSend(v4, "preferredContentSize");
  -[PHPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  -[PHPickerViewController addChildViewController:](self, "addChildViewController:", v4);
  -[PHPickerViewController view](self, "view");
  v28 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "bounds");
  objc_msgSend(v11, "setFrame:");
  objc_msgSend(v10, "addSubview:", v11);
  v22 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v11, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  objc_msgSend(v11, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v21;
  objc_msgSend(v11, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v13;
  objc_msgSend(v11, "trailingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v17);

  objc_msgSend(v4, "didMoveToParentViewController:", self);
  objc_msgSend(v4, "contentScrollViewForEdge:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentScrollViewForEdge:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPickerViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v18, 1);
  -[PHPickerViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", v19, 4);
  -[PHPickerViewController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");

}

- (void)_pickerUnavailableViewControllerCancelButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  PHPickerViewController *v17;
  SEL v18;
  id v19;
  uint8_t buf[16];

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    _PFAssertFailHandler();
    goto LABEL_16;
  }
  if (!v4)
  {
LABEL_16:
    v17 = (PHPickerViewController *)_PFAssertFailHandler();
    -[PHPickerViewController _pickerUnavailableViewControllerRetryButtonTapped:](v17, v18, v19);
    return;
  }
  -[PHPickerViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDBCF00];
    -[PHPickerViewController configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preselectedAssetIdentifiers");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x24BDBD1A8];
    if (v8)
      v11 = v8;
    else
      v11 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v6, "orderedSetWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    PFMap();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    if (v14)
      v15 = v14;
    else
      v15 = v10;
    objc_msgSend(v5, "picker:didFinishPicking:", self, v15);

  }
  else
  {
    PLPickerGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D1E2000, v16, OS_LOG_TYPE_ERROR, "PHPickerViewControllerDelegate doesn't respond to picker:didFinishPicking:", buf, 2u);
    }

  }
}

- (void)_pickerUnavailableViewControllerRetryButtonTapped:(id)a3
{
  PHPickerViewController *v4;
  SEL v5;
  BOOL v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    if (v7)
    {
      objc_msgSend(v7, "updateReason:error:", 1, 0);
      -[PHPickerViewController _setup:](self, "_setup:", 0);

      return;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v4 = (PHPickerViewController *)_PFAssertFailHandler();
  -[PHPickerViewController _pickerDidSetOnboardingOverlayDismissed:](v4, v5, v6);
}

- (void)_pickerDidSetOnboardingOverlayDismissed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("com.apple.photos.picker.overlay"));

}

- (void)_pickerDidSetOnboardingHeaderDismissed:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v3 = a3;
  -[PHPickerViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_purposedLimitedLibraryApplicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v5)
    v7 = CFSTR("com.apple.photos.picker.limitedlibrary.header");
  else
    v7 = CFSTR("com.apple.photos.picker.header");
  objc_msgSend(v6, "setBool:forKey:", v3, v7);

}

- (void)_pickerDidSetModalInPresentation:(BOOL)a3
{
  _BOOL8 v3;
  PHPickerViewController *v5;
  SEL v6;
  id v7;
  objc_super v8;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PHPickerViewController;
    -[PHPickerViewController setModalInPresentation:](&v8, sel_setModalInPresentation_, v3);
  }
  else
  {
    v5 = (PHPickerViewController *)_PFAssertFailHandler();
    -[PHPickerViewController _pickerDidFinishPicking:](v5, v6, v7);
  }
}

- (void)_pickerDidFinishPicking:(id)a3
{
  id v4;
  PHPickerViewController *v5;
  SEL v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    if (v7)
      v4 = v7;
    else
      v4 = (id)MEMORY[0x24BDBD1A8];
    -[PHPickerViewController _finishPickingWithResults:](self, "_finishPickingWithResults:", v4);

  }
  else
  {
    v5 = (PHPickerViewController *)_PFAssertFailHandler();
    -[PHPickerViewController _containedRemoteViewController](v5, v6);
  }
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  void *v2;
  void *v3;
  id v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  PHPickerViewController *v9;
  SEL v10;

  -[PHPickerViewController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = 0;
    goto LABEL_6;
  }
  v4 = v3;
  v5 = (objc_class *)objc_opt_class();
  if (!v4)
  {
    NSStringFromClass(v5);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_6:

    return (_UIRemoteViewController *)v4;
  }
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  objc_claimAutoreleasedReturnValue();
LABEL_8:
  v9 = (PHPickerViewController *)_PFAssertFailHandler();
  return (_UIRemoteViewController *)-[PHPickerViewController childViewControllerForStatusBarHidden](v9, v10);
}

- (id)childViewControllerForStatusBarHidden
{
  void *v2;
  void *v3;

  -[PHPickerViewController childViewControllers](self, "childViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PHPickerConfiguration)configuration
{
  return self->_configuration;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSExtension)_extension
{
  return self->__extension;
}

- (void)_setExtension:(id)a3
{
  objc_storeStrong((id *)&self->__extension, a3);
}

- (NSCopying)_extensionRequestIdentifier
{
  return self->__extensionRequestIdentifier;
}

- (void)_setExtensionRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (PUPickerExtensionHostContext)_extensionContext
{
  return self->__extensionContext;
}

- (void)_setExtensionContext:(id)a3
{
  objc_storeStrong((id *)&self->__extensionContext, a3);
}

- (PUPickerRemoteViewController)_remoteViewController
{
  return self->__remoteViewController;
}

- (void)_setRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->__remoteViewController, a3);
}

- (id)_overlayStorage
{
  return self->__overlayStorage;
}

- (void)_setOverlayStorage:(id)a3
{
  objc_storeStrong(&self->__overlayStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__overlayStorage, 0);
  objc_storeStrong((id *)&self->__remoteViewController, 0);
  objc_storeStrong((id *)&self->__extensionContext, 0);
  objc_storeStrong((id *)&self->__extensionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->__extension, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

id __77__PHPickerViewController__pickerUnavailableViewControllerCancelButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PUPhotosFileProviderItemProvider *v3;
  id v4;

  v2 = a2;
  v3 = objc_alloc_init(PUPhotosFileProviderItemProvider);
  v4 = -[PHPickerResult _initWithItemProvider:assetIdentifier:]([PHPickerResult alloc], "_initWithItemProvider:assetIdentifier:", v3, v2);

  return v4;
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_2;
  block[3] = &unk_24C62C8E8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v8 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_3(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_4;
  v2[3] = &unk_24C62C938;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v4);
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_5(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_6;
  v2[3] = &unk_24C62C938;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

  objc_destroyWeak(&v4);
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_7(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_8;
  block[3] = &unk_24C62C9B0;
  objc_copyWeak(&v4, a1 + 5);
  objc_copyWeak(&v5, a1 + 6);
  v3 = a1[4];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&v4);
}

uint64_t __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  uint64_t result;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_addOrReplaceChildViewController:", v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PPT_PickerFinishedLoading"), v6);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_6(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "_finishPickingWithResults:", MEMORY[0x24BDBD1A8]);

  }
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "_addOrReplaceChildUnavailableViewController:error:", 2, 0);

  }
}

void __125__PHPickerViewController__handleRemoteViewControllerConnection_extension_extensionRequestIdentifier_error_completionHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "_addOrReplaceChildUnavailableViewController:error:", 0, *(_QWORD *)(a1 + 40));

  }
}

void __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke_2;
    v8[3] = &unk_24C62C898;
    objc_copyWeak(&v11, &location);
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 56);
    +[PUPickerRemoteViewController requestViewControllerForExtension:proposedSize:completionHandler:](PUPickerRemoteViewController, "requestViewControllerForExtension:proposedSize:completionHandler:", v2, v8, v5, v7);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleRemoteViewControllerConnection:extension:extensionRequestIdentifier:error:completionHandler:", 0, 0, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

void __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke_3;
  v13[3] = &unk_24C62C870;
  objc_copyWeak(&v19, a1 + 6);
  v14 = v8;
  v15 = a1[4];
  v16 = v7;
  v17 = v9;
  v18 = a1[5];
  v10 = v9;
  v11 = v7;
  v12 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

  objc_destroyWeak(&v19);
}

void __66__PHPickerViewController__setupExtension_error_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "_handleRemoteViewControllerConnection:extension:extensionRequestIdentifier:error:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __33__PHPickerViewController__setup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_setupExtension:error:completionHandler:", v8, v6, *(_QWORD *)(a1 + 32));
}

uint64_t __44__PHPickerViewController__popViewController__block_invoke_588(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __44__PHPickerViewController__popViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  PLPickerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_20D1E2000, v3, OS_LOG_TYPE_ERROR, "Error getting synchronous remote object proxy: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __48__PHPickerViewController_initWithConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  if (!*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_endDelayingPresentation");

  }
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

@end
