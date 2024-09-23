@implementation BCSActionPickerViewAssistant

- (BOOL)isShowingPicker
{
  return self->_alertController != 0;
}

- (BOOL)showActionPickerWithItems:(id)a3 fromViewController:(id)a4 presentingRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  UIAlertController *v40;
  UIAlertController *alertController;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  char v47;
  UIAlertController *v48;
  void *v49;
  UIAlertController *v50;
  id UIAlertActionClass;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id obj;
  _QWORD v59[4];
  id v60;
  _QWORD v61[5];
  _QWORD v62[5];
  id v63;
  char v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id location;
  _BYTE v70[128];
  uint64_t v71;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v71 = *MEMORY[0x24BDAC8D0];
  v57 = a3;
  v11 = a4;
  v12 = v11;
  if (v11)
  {
    v56 = v11;
    objc_msgSend(v11, "presentedViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v14)
        -[BCSActionPickerViewAssistant showActionPickerWithItems:fromViewController:presentingRect:].cold.3(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    else
    {
      if (!-[BCSActionPickerViewAssistant isShowingPicker](self, "isShowingPicker"))
      {
        v40 = (UIAlertController *)objc_alloc_init((Class)getUIAlertControllerClass());
        alertController = self->_alertController;
        self->_alertController = v40;

        objc_initWeak(&location, self);
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        obj = v57;
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
        v43 = MEMORY[0x24BDAC760];
        if (v42)
        {
          v44 = *(_QWORD *)v66;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v66 != v44)
                objc_enumerationMutation(obj);
              v46 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
              objc_msgSend(v46, "setActionPickerItemDelegate:", self);
              v47 = objc_msgSend(v46, "shouldDismissAlertWhenActionIsTaken");
              v48 = self->_alertController;
              objc_msgSend(v46, "label");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v62[0] = v43;
              v62[1] = 3221225472;
              v62[2] = __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke;
              v62[3] = &unk_24D7873D8;
              v62[4] = v46;
              v64 = v47;
              objc_copyWeak(&v63, &location);
              v61[0] = v43;
              v61[1] = 3221225472;
              v61[2] = __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke_2;
              v61[3] = &unk_24D787400;
              v61[4] = v46;
              -[UIAlertController _addActionWithTitle:style:handler:shouldDismissHandler:](v48, "_addActionWithTitle:style:handler:shouldDismissHandler:", v49, 0, v62, v61);

              objc_destroyWeak(&v63);
            }
            v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
          }
          while (v42);
        }

        v50 = self->_alertController;
        UIAlertActionClass = getUIAlertActionClass();
        _BCSLocalizedString(CFSTR("Cancel"), &_BCSLocalizableStringsBundleOnceToken, &_BCSLocalizableStringsBundle);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v43;
        v59[1] = 3221225472;
        v59[2] = __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke_3;
        v59[3] = &unk_24D787428;
        objc_copyWeak(&v60, &location);
        objc_msgSend(UIAlertActionClass, "actionWithTitle:style:handler:", v52, 1, v59);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIAlertController addAction:](v50, "addAction:", v53);

        -[UIAlertController popoverPresentationController](self->_alertController, "popoverPresentationController");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "view");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "setSourceView:", v55);

        objc_msgSend(v54, "setSourceRect:", x, y, width, height);
        objc_msgSend(v56, "presentViewController:animated:completion:", self->_alertController, 1, 0);

        objc_destroyWeak(&v60);
        objc_destroyWeak(&location);
        v30 = 1;
        goto LABEL_12;
      }
      v31 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v31)
        -[BCSActionPickerViewAssistant showActionPickerWithItems:fromViewController:presentingRect:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);
    }
    v30 = 0;
LABEL_12:
    v12 = v56;
    goto LABEL_13;
  }
  v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v22)
    -[BCSActionPickerViewAssistant showActionPickerWithItems:fromViewController:presentingRect:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
  v30 = 0;
LABEL_13:

  return v30;
}

void __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "performAction");
  if (*(_BYTE *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_cleanUpAlertController");

  }
}

uint64_t __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldDismissAlertWhenActionIsTaken");
}

void __92__BCSActionPickerViewAssistant_showActionPickerWithItems_fromViewController_presentingRect___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cleanUpAlertController");

}

- (id)actionPickerItemAlertController:(id)a3
{
  return self->_alertController;
}

- (void)_cleanUpAlertController
{
  UIAlertController *alertController;

  alertController = self->_alertController;
  self->_alertController = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
}

- (void)showActionPickerWithItems:(uint64_t)a3 fromViewController:(uint64_t)a4 presentingRect:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSActionPickerViewAssistant: No presenting view controller is specified", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)showActionPickerWithItems:(uint64_t)a3 fromViewController:(uint64_t)a4 presentingRect:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSActionPickerViewAssistant: Action picker is already being shown.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)showActionPickerWithItems:(uint64_t)a3 fromViewController:(uint64_t)a4 presentingRect:(uint64_t)a5 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21748C000, MEMORY[0x24BDACB70], a3, "BCSActionPickerViewAssistant: Host view controller is already presenting a view.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
