@implementation MSVSystemDialog

- (MSVSystemDialog)initWithOptions:(id)a3
{
  id v5;
  MSVSystemDialog *v6;
  MSVSystemDialog *v7;
  NSMutableArray *v8;
  NSMutableArray *textFields;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVSystemDialog;
  v6 = -[MSVSystemDialog init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    textFields = v7->_textFields;
    v7->_textFields = v8;

  }
  return v7;
}

- (MSVSystemDialog)initWithCFUserNotification:(__CFUserNotification *)a3
{
  MSVSystemDialog *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSVSystemDialog;
  v4 = -[MSVSystemDialog init](&v6, sel_init);
  if (v4)
    v4->_preparedUserNotification = (__CFUserNotification *)CFRetain(a3);
  return v4;
}

- (void)dealloc
{
  __CFUserNotification *presentedUserNotification;
  __CFUserNotification *preparedUserNotification;
  __CFRunLoopSource *activeRunLoopSource;
  objc_super v6;

  presentedUserNotification = self->_presentedUserNotification;
  if (presentedUserNotification)
    CFRelease(presentedUserNotification);
  preparedUserNotification = self->_preparedUserNotification;
  if (preparedUserNotification)
    CFRelease(preparedUserNotification);
  activeRunLoopSource = self->_activeRunLoopSource;
  if (activeRunLoopSource)
  {
    CFRunLoopSourceInvalidate(activeRunLoopSource);
    CFRelease(self->_activeRunLoopSource);
  }
  v6.receiver = self;
  v6.super_class = (Class)MSVSystemDialog;
  -[MSVSystemDialog dealloc](&v6, sel_dealloc);
}

- (__CFUserNotification)presentedUserNotification
{
  return self->_presentedUserNotification;
}

- (void)setPresentedUserNotification:(__CFUserNotification *)a3
{
  __CFUserNotification *presentedUserNotification;

  presentedUserNotification = self->_presentedUserNotification;
  if (presentedUserNotification)
    CFRelease(presentedUserNotification);
  self->_presentedUserNotification = a3;
  if (a3)
    CFRetain(a3);
}

- (__CFRunLoopSource)activeRunLoopSource
{
  return self->_activeRunLoopSource;
}

- (void)setActiveRunLoopSource:(__CFRunLoopSource *)a3
{
  __CFRunLoopSource *activeRunLoopSource;

  activeRunLoopSource = self->_activeRunLoopSource;
  if (activeRunLoopSource)
  {
    CFRunLoopSourceInvalidate(activeRunLoopSource);
    CFRelease(self->_activeRunLoopSource);
  }
  self->_activeRunLoopSource = a3;
  if (a3)
    CFRetain(a3);
}

- (id)pendingCompletion
{
  return (id)MEMORY[0x1A1AFBD28](self->_pendingCompletion, a2);
}

- (void)setPendingCompletion:(id)a3
{
  void *v4;
  id pendingCompletion;

  v4 = (void *)objc_msgSend(a3, "copy");
  pendingCompletion = self->_pendingCompletion;
  self->_pendingCompletion = v4;

}

- (void)addTextField:(id)a3
{
  -[NSMutableArray addObject:](self->_textFields, "addObject:", a3);
}

- (void)addTextFieldWithTitle:(id)a3 secure:(BOOL)a4
{
  id v5;

  +[MSVSystemDialogTextField textFieldWithTitle:secure:](MSVSystemDialogTextField, "textFieldWithTitle:secure:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MSVSystemDialog addTextField:](self, "addTextField:", v5);

}

- (void)clearTextFields
{
  -[NSMutableArray removeAllObjects](self->_textFields, "removeAllObjects");
}

- (void)presentWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  __CFUserNotification *preparedUserNotification;
  __CFUserNotification *v6;
  id v7;
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
  id *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  id v23;
  id *v24;
  void *v25;
  id v26;
  void *v27;
  id *v28;
  void *v29;
  id v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  NSMutableArray *textFields;
  id v39;
  void *v40;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Main;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 3;
  preparedUserNotification = self->_preparedUserNotification;
  if (preparedUserNotification)
  {
    v6 = (__CFUserNotification *)CFRetain(preparedUserNotification);
    goto LABEL_51;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MSVSystemDialogOptions alertHeader](self->_options, "alertHeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MSVSystemDialogOptions alertHeader](self->_options, "alertHeader");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v9, *MEMORY[0x1E0C9B800]);

  }
  -[MSVSystemDialogOptions alertMessage](self->_options, "alertMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MSVSystemDialogOptions alertMessage](self->_options, "alertMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, *MEMORY[0x1E0C9B810]);

  }
  -[MSVSystemDialogOptions alertIconURL](self->_options, "alertIconURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MSVSystemDialogOptions alertIconURL](self->_options, "alertIconURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, *MEMORY[0x1E0C9B848]);

  }
  -[MSVSystemDialogOptions defaultButtonTitle](self->_options, "defaultButtonTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MSVSystemDialogOptions defaultButtonTitle](self->_options, "defaultButtonTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v15, *MEMORY[0x1E0C9B838]);

  }
  -[MSVSystemDialogOptions alternateButtonTitle](self->_options, "alternateButtonTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[MSVSystemDialogOptions alternateButtonTitle](self->_options, "alternateButtonTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v17, *MEMORY[0x1E0C9B830]);

  }
  if (-[MSVSystemDialogOptions showAsTopmost](self->_options, "showAsTopmost"))
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C9B820]);
  if (-[MSVSystemDialogOptions forceModalAlertAppearance](self->_options, "forceModalAlertAppearance"))
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v18 = (id *)getSBUserNotificationForcesModalAlertAppearanceSymbolLoc_ptr;
    v65 = getSBUserNotificationForcesModalAlertAppearanceSymbolLoc_ptr;
    if (!getSBUserNotificationForcesModalAlertAppearanceSymbolLoc_ptr)
    {
      v19 = SpringBoardServicesLibrary();
      v18 = (id *)dlsym(v19, "SBUserNotificationForcesModalAlertAppearance");
      v63[3] = (uint64_t)v18;
      getSBUserNotificationForcesModalAlertAppearanceSymbolLoc_ptr = (uint64_t)v18;
    }
    _Block_object_dispose(&v62, 8);
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBUserNotificationForcesModalAlertAppearance(void)");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("MSVSystemDialog.m"), 19, CFSTR("%s"), dlerror());

      goto LABEL_60;
    }
    v20 = *v18;
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v20);

  }
  if (-[MSVSystemDialogOptions showOnLockscreen](self->_options, "showOnLockscreen"))
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v21 = (id *)getSBUserNotificationDisplayActionButtonOnLockScreenSymbolLoc_ptr;
    v65 = getSBUserNotificationDisplayActionButtonOnLockScreenSymbolLoc_ptr;
    if (!getSBUserNotificationDisplayActionButtonOnLockScreenSymbolLoc_ptr)
    {
      v22 = SpringBoardServicesLibrary();
      v21 = (id *)dlsym(v22, "SBUserNotificationDisplayActionButtonOnLockScreen");
      v63[3] = (uint64_t)v21;
      getSBUserNotificationDisplayActionButtonOnLockScreenSymbolLoc_ptr = (uint64_t)v21;
    }
    _Block_object_dispose(&v62, 8);
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBUserNotificationDisplayActionButtonOnLockScreen(void)");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("MSVSystemDialog.m"), 20, CFSTR("%s"), dlerror());

      goto LABEL_60;
    }
    v23 = *v21;
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v23);

  }
  if (-[MSVSystemDialogOptions dismissOverlaysOnLockscreen](self->_options, "dismissOverlaysOnLockscreen"))
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v24 = (id *)getSBUserNotificationDismissesOverlaysInLockScreenSymbolLoc_ptr;
    v65 = getSBUserNotificationDismissesOverlaysInLockScreenSymbolLoc_ptr;
    if (!getSBUserNotificationDismissesOverlaysInLockScreenSymbolLoc_ptr)
    {
      v25 = SpringBoardServicesLibrary();
      v24 = (id *)dlsym(v25, "SBUserNotificationDismissesOverlaysInLockScreen");
      v63[3] = (uint64_t)v24;
      getSBUserNotificationDismissesOverlaysInLockScreenSymbolLoc_ptr = (uint64_t)v24;
    }
    _Block_object_dispose(&v62, 8);
    if (!v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBUserNotificationDismissesOverlaysInLockScreen(void)");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("MSVSystemDialog.m"), 21, CFSTR("%s"), dlerror());

      goto LABEL_60;
    }
    v26 = *v24;
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v26);

  }
  -[MSVSystemDialogOptions allowedApplicationBundleIDs](self->_options, "allowedApplicationBundleIDs");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count"))
  {
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v28 = (id *)getSBUserNotificationAllowedApplicationsKeySymbolLoc_ptr;
    v65 = getSBUserNotificationAllowedApplicationsKeySymbolLoc_ptr;
    if (!getSBUserNotificationAllowedApplicationsKeySymbolLoc_ptr)
    {
      v29 = SpringBoardServicesLibrary();
      v28 = (id *)dlsym(v29, "SBUserNotificationAllowedApplicationsKey");
      v63[3] = (uint64_t)v28;
      getSBUserNotificationAllowedApplicationsKeySymbolLoc_ptr = (uint64_t)v28;
    }
    _Block_object_dispose(&v62, 8);
    if (v28)
    {
      v30 = *v28;
      objc_msgSend(v7, "setObject:forKey:", v27, v30);

      goto LABEL_35;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBUserNotificationAllowedApplicationsKey(void)");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("MSVSystemDialog.m"), 22, CFSTR("%s"), dlerror());

LABEL_60:
    __break(1u);
  }
LABEL_35:
  if (-[NSMutableArray count](self->_textFields, "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_textFields, "count"));
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v32 = self->_textFields;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v55;
      do
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v55 != v34)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v35), "title");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
            objc_msgSend(v31, "addObject:", v36);

          ++v35;
        }
        while (v33 != v35);
        v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      }
      while (v33);
    }

    if (objc_msgSend(v31, "count"))
      objc_msgSend(v7, "setObject:forKey:", v31, *MEMORY[0x1E0C9B878]);

  }
  if (-[NSMutableArray count](self->_textFields, "count"))
  {
    v37 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    textFields = self->_textFields;
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __41__MSVSystemDialog_presentWithCompletion___block_invoke;
    v51[3] = &unk_1E43E9650;
    v53 = &v58;
    v39 = v37;
    v52 = v39;
    -[NSMutableArray enumerateObjectsUsingBlock:](textFields, "enumerateObjectsUsingBlock:", v51);
    objc_msgSend(v7, "setObject:forKey:", v39, *MEMORY[0x1E0C9B850]);

  }
  v6 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, v59[3], 0, (CFDictionaryRef)v7);

LABEL_51:
  if (v6)
  {
    +[MSVSystemDialogManager sharedManager](MSVSystemDialogManager, "sharedManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "registerSystemDialog:forUserNotification:", self, v6);
    RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, (CFUserNotificationCallBack)_MSVSystemDialogUserNotificationCallback, 0);
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
    CFRelease(RunLoopSource);
    -[MSVSystemDialog setPresentedUserNotification:](self, "setPresentedUserNotification:", v6);
    -[MSVSystemDialog setPendingCompletion:](self, "setPendingCompletion:", v4);
    -[MSVSystemDialog setActiveRunLoopSource:](self, "setActiveRunLoopSource:", RunLoopSource);
    CFRelease(v6);

  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
  _Block_object_dispose(&v58, 8);

}

- (void)dismiss
{
  __CFUserNotification *presentedUserNotification;

  presentedUserNotification = self->_presentedUserNotification;
  if (presentedUserNotification)
    CFUserNotificationCancel(presentedUserNotification);
}

- (MSVSystemDialogOptions)options
{
  return self->_options;
}

- (NSArray)textFields
{
  return &self->_textFields->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_textFields, 0);
}

void __41__MSVSystemDialog_presentWithCompletion___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  if (objc_msgSend(v5, "isSecure"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= 1 << (a3 + 16);
  v6 = objc_msgSend(v5, "keyboardType");

  if (v6 == 2)
    v7 = 7;
  else
    v7 = 0;
  if (v6 == 3)
    v8 = 4;
  else
    v8 = v7;
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

+ (id)systemDialogWithOptions:(id)a3
{
  id v3;
  MSVSystemDialog *v4;

  v3 = a3;
  v4 = -[MSVSystemDialog initWithOptions:]([MSVSystemDialog alloc], "initWithOptions:", v3);

  return v4;
}

@end
