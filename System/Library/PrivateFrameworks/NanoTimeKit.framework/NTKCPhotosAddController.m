@implementation NTKCPhotosAddController

+ (id)pickerConfigurationWithLimit:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2168]), "initWithPhotoLibrary:", v4);
  v6 = (void *)MEMORY[0x1E0CD2170];
  objc_msgSend(MEMORY[0x1E0CD2170], "livePhotosFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0CD2170], "imagesFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyFilterMatchingSubfilters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilter:", v10);

  objc_msgSend(v5, "setSelectionLimit:", a3);
  return v5;
}

+ (void)presentPhotosAddControllerFromViewController:(id)a3 withCompletion:(id)a4
{
  objc_msgSend(a1, "presentPhotosAddControllerFromViewController:selectionLimit:withCompletion:", a3, 0, a4);
}

+ (void)presentPhotosAddControllerFromViewController:(id)a3 selectionLimit:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "pickerConfigurationWithLimit:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelectionLimit:", a4);
  objc_msgSend(a1, "presentPhotosAddControllerFromViewController:configuration:withCompletion:", v9, v10, v8);

}

+ (void)presentSinglePhotoAddControllerFromViewController:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__NTKCPhotosAddController_presentSinglePhotoAddControllerFromViewController_withCompletion___block_invoke;
  v8[3] = &unk_1E6BCF958;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "presentPhotosAddControllerFromViewController:selectionLimit:withCompletion:", a3, 1, v8);

}

uint64_t __92__NTKCPhotosAddController_presentSinglePhotoAddControllerFromViewController_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  if (!*(_QWORD *)(a1 + 32))
    return 0;
  v5 = a2;
  objc_msgSend(a3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v7;
}

+ (void)presentPhotosAddControllerFromViewController:(id)a3 configuration:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    objc_msgSend(a1, "pickerConfigurationWithLimit:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "_sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCompletion:", v9);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v8);
  objc_msgSend(v11, "setDelegate:", v10);
  objc_msgSend(v11, "presentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v10);

  if (v15)
  {
    objc_msgSend(v15, "presentViewController:animated:completion:", v11, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F98], "_applicationKeyWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rootViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "presentViewController:animated:completion:", v11, 1, 0);

  }
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1)
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_22);
  return (id)_sharedInstance_sharedInstance;
}

void __42__NTKCPhotosAddController__sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_sharedInstance_sharedInstance;
  _sharedInstance_sharedInstance = v0;

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id completion;

  completion = self->_completion;
  if (completion)
    (*((void (**)(id, _QWORD, _QWORD))completion + 2))(completion, 0, 0);
  -[NTKCPhotosAddController setCompletion:](self, "setCompletion:", 0);
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  uint64_t (**completion)(id, id, void *);
  char v25;
  NTKCPhotosAddController *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v26 = self;
  v40 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "assetIdentifier", v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  NTKPHAssetsForLocalIdentifiers(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    v20 = *MEMORY[0x1E0DC4CA8];
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        v36 = v20;
        v37 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1, v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v23);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v18);
  }

  completion = (uint64_t (**)(id, id, void *))v26->_completion;
  if (completion)
  {
    v25 = completion[2](completion, v27, v15);
    -[NTKCPhotosAddController setCompletion:](v26, "setCompletion:", 0);
    if ((v25 & 1) != 0)
      goto LABEL_22;
  }
  else
  {
    -[NTKCPhotosAddController setCompletion:](v26, "setCompletion:", 0);
  }
  objc_msgSend(v27, "dismissViewControllerAnimated:completion:", 1, 0, v26);
LABEL_22:

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
