@implementation _SFQRCodeDetectionController

+ (_SFQRCodeDetectionController)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___SFQRCodeDetectionController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, block);
  return (_SFQRCodeDetectionController *)(id)sharedController_sharedController;
}

- (_SFQRCodeDetectionController)init
{
  _SFQRCodeDetectionController *v2;
  void *v3;
  objc_class *v4;
  BCSQRCodeParser *v5;
  BCSQRCodeParser *QRCodeParser;
  NSMutableSet *v7;
  NSMutableSet *cachedElements;
  _SFQRCodeDetectionController *v9;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v11.receiver = self;
  v11.super_class = (Class)_SFQRCodeDetectionController;
  v2 = -[_SFQRCodeDetectionController init](&v11, sel_init);
  if (v2)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v3 = (void *)getBCSQRCodeParserClass_softClass;
    v16 = getBCSQRCodeParserClass_softClass;
    if (!getBCSQRCodeParserClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getBCSQRCodeParserClass_block_invoke;
      v12[3] = &unk_1E4ABFC78;
      v12[4] = &v13;
      __getBCSQRCodeParserClass_block_invoke((uint64_t)v12);
      v3 = (void *)v14[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v13, 8);
    v5 = (BCSQRCodeParser *)objc_alloc_init(v4);
    QRCodeParser = v2->_QRCodeParser;
    v2->_QRCodeParser = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    cachedElements = v2->_cachedElements;
    v2->_cachedElements = v7;

    v9 = v2;
  }

  return v2;
}

- (void)getActionForImage:(id)a3 completion:(id)a4
{
  id v6;
  BCSQRCodeParser *QRCodeParser;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  QRCodeParser = self->_QRCodeParser;
  v8 = objc_msgSend(objc_retainAutorelease(a3), "CGImage");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61___SFQRCodeDetectionController_getActionForImage_completion___block_invoke;
  v10[3] = &unk_1E4AC5A50;
  v11 = v6;
  v9 = v6;
  -[BCSQRCodeParser parseCodeFromImage:completionHandler:](QRCodeParser, "parseCodeFromImage:completionHandler:", v8, v10);

}

- (id)getActionForImageSynchronously:(id)a3 userInfo:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  BCSQRCodeParser *QRCodeParser;
  id v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__9;
  v24 = __Block_byref_object_dispose__9;
  v25 = 0;
  v7 = dispatch_semaphore_create(0);
  QRCodeParser = self->_QRCodeParser;
  v9 = objc_retainAutorelease(v6);
  v10 = objc_msgSend(v9, "CGImage");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72___SFQRCodeDetectionController_getActionForImageSynchronously_userInfo___block_invoke;
  v17[3] = &unk_1E4AC5A78;
  v19 = &v20;
  v11 = v7;
  v18 = v11;
  -[BCSQRCodeParser parseCodeFromImage:completionHandler:](QRCodeParser, "parseCodeFromImage:completionHandler:", v10, v17);
  v12 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v11, v12);
  if (a4)
  {
    v13 = v21[5];
    if (v13)
    {
      v26 = CFSTR("action");
      v27[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v14;

    }
    else
    {
      *a4 = 0;
    }
  }
  v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v15;
}

- (id)elementForAction:(id)a3
{
  id v4;
  NSMutableSet *cachedElements;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  cachedElements = self->_cachedElements;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49___SFQRCodeDetectionController_elementForAction___block_invoke;
  v9[3] = &unk_1E4AC5AA0;
  v10 = v4;
  v6 = v4;
  -[NSMutableSet safari_anyObjectPassingTest:](cachedElements, "safari_anyObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)menuElementsForElementInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "urlThatCanBeOpened");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (!v5 && v4)
  {
    objc_msgSend(v4, "actionPickerItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(v4, "actionPickerItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safari_mapObjectsUsingBlock:", &__block_literal_global_47);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C9AA60];
    }
  }

  return v6;
}

- (id)actionForElement:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)cacheElement:(id)a3
{
  -[NSMutableSet addObject:](self->_cachedElements, "addObject:", a3);
}

- (void)clearCachedElement:(id)a3
{
  -[NSMutableSet removeObject:](self->_cachedElements, "removeObject:", a3);
}

- (id)adjustedCopyActionForAction:(id)a3 elementInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  -[_SFQRCodeDetectionController actionForElement:](self, "actionForElement:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "urlThatCanBeOpened");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0DC3428];
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72___SFQRCodeDetectionController_adjustedCopyActionForAction_elementInfo___block_invoke;
      v17[3] = &unk_1E4ABFA58;
      v18 = v9;
      objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v17);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "actionPickerItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "safari_containsObjectPassingTest:", &__block_literal_global_17);

      if ((v15 & 1) != 0)
        v13 = 0;
      else
        v13 = v6;
    }

  }
  else
  {
    v13 = v6;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedElements, 0);
  objc_storeStrong((id *)&self->_lastDetectedAction, 0);
  objc_storeStrong((id *)&self->_QRCodeParser, 0);
}

@end
