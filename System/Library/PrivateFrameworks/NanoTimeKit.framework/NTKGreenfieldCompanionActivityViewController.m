@implementation NTKGreenfieldCompanionActivityViewController

- (NTKGreenfieldCompanionActivityViewController)initWithDraftRecipe:(id)a3 previewImage:(id)a4
{
  id v7;
  id v8;
  NTKGreenfieldCompanionActivityItemProvider *v9;
  void *v10;
  NTKGreenfieldCompanionActivityViewController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_super v20;
  _QWORD v21[12];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[NTKGreenfieldCompanionActivityItemProvider initWithDraftRecipe:previewImage:]([NTKGreenfieldCompanionActivityItemProvider alloc], "initWithDraftRecipe:previewImage:", v7, v8);

  -[NTKGreenfieldCompanionActivityItemProvider setDelegate:](v9, "setDelegate:", self);
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)NTKGreenfieldCompanionActivityViewController;
  v11 = -[NTKGreenfieldCompanionActivityViewController initWithActivityItems:applicationActivities:](&v20, sel_initWithActivityItems_applicationActivities_, v10, 0);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_draftRecipe, a3);
    -[NTKGreenfieldCompanionActivityViewController setObjectManipulationDelegate:](v11, "setObjectManipulationDelegate:", v11);
    v12 = *MEMORY[0x1E0D96DE8];
    v21[0] = *MEMORY[0x1E0D96DD0];
    v21[1] = v12;
    v13 = *MEMORY[0x1E0D96E00];
    v21[2] = *MEMORY[0x1E0D96DF8];
    v21[3] = v13;
    v14 = *MEMORY[0x1E0D96E08];
    v21[4] = *MEMORY[0x1E0D96D90];
    v21[5] = v14;
    v15 = *MEMORY[0x1E0D96DD8];
    v21[6] = *MEMORY[0x1E0D96D80];
    v21[7] = v15;
    v16 = *MEMORY[0x1E0D96DE0];
    v21[8] = *MEMORY[0x1E0D96DF0];
    v21[9] = v16;
    v17 = *MEMORY[0x1E0D96DB8];
    v21[10] = *MEMORY[0x1E0D96DC8];
    v21[11] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKGreenfieldCompanionActivityViewController setExcludedActivityTypes:](v11, "setExcludedActivityTypes:", v18);

  }
  return v11;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  NTKGreenfieldDraftRecipe *draftRecipe;
  uint64_t i;
  void *v6;
  NTKGreenfieldDraftRecipe *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  id obj;
  uint64_t v33;
  id v34;
  uint64_t v35;
  NTKGreenfieldCompanionActivityViewController *val;
  _QWORD v37[5];
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  val = self;
  draftRecipe = self->_draftRecipe;
  if (draftRecipe)
  {
    -[NTKGreenfieldDraftRecipe sortedComplicationSharingOptions](draftRecipe, "sortedComplicationSharingOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      -[NTKGreenfieldDraftRecipe sortedComplicationSharingOptions](self->_draftRecipe, "sortedComplicationSharingOptions");
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v35)
      {
        v33 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v41 != v33)
              objc_enumerationMutation(obj);
            v6 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            v7 = val->_draftRecipe;
            objc_msgSend(v6, "uniqueIdentifier");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = -[NTKGreenfieldDraftRecipe optionForComplicationUniqueIdentifier:](v7, "optionForComplicationUniqueIdentifier:", v8);

            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v6, "optionType");
            if (v11 == 1)
            {
              +[NTKGreenfieldDraftRecipe titleFromComplicationOption:](NTKGreenfieldDraftRecipe, "titleFromComplicationOption:", 0);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v15);

              +[NTKGreenfieldDraftRecipe titleFromComplicationOption:](NTKGreenfieldDraftRecipe, "titleFromComplicationOption:", 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v16);

              +[NTKGreenfieldDraftRecipe titleFromComplicationOption:](NTKGreenfieldDraftRecipe, "titleFromComplicationOption:", 2);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v17);

              if (v9 == 2)
                v14 = 2;
              else
                v14 = v9 == 1;
            }
            else if (v11)
            {
              v14 = 0;
            }
            else
            {
              +[NTKGreenfieldDraftRecipe titleFromComplicationOption:](NTKGreenfieldDraftRecipe, "titleFromComplicationOption:", 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v12);

              +[NTKGreenfieldDraftRecipe titleFromComplicationOption:](NTKGreenfieldDraftRecipe, "titleFromComplicationOption:", 2);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v13);

              v14 = v9 == 2;
            }
            +[NTKGreenfieldDraftRecipe descriptionFromComplicationOption:](NTKGreenfieldDraftRecipe, "descriptionFromComplicationOption:", v9);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v6, "uniqueIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.picker"), v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_initWeak(&location, val);
            v22 = (void *)MEMORY[0x1E0D96D60];
            v37[0] = MEMORY[0x1E0C809B0];
            v37[1] = 3221225472;
            v37[2] = __94__NTKGreenfieldCompanionActivityViewController__customizationGroupsForActivityViewController___block_invoke;
            v37[3] = &unk_1E6BD6D30;
            objc_copyWeak(&v38, &location);
            v37[4] = v6;
            objc_msgSend(v22, "pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:", v21, v10, v14, v18, v37);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_alloc(MEMORY[0x1E0D96D68]);
            objc_msgSend(v6, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "uniqueIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v23;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(v24, "_initGroupWithName:identifier:customizations:", v25, v26, v27);

            objc_msgSend(v34, "addObject:", v28);
            objc_destroyWeak(&v38);
            objc_destroyWeak(&location);

          }
          v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v35);
      }

    }
    else
    {
      v34 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v34 = (id)MEMORY[0x1E0C9AA60];
  }

  return v34;
}

void __94__NTKGreenfieldCompanionActivityViewController__customizationGroupsForActivityViewController___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleCustomizationValueChange:sharingOption:", v4, *(_QWORD *)(a1 + 32));

}

- (void)_handleCustomizationValueChange:(id)a3 sharingOption:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NTKGreenfieldDraftRecipe *draftRecipe;
  void *v11;
  NTKGreenfieldDraftRecipe *v12;
  _QWORD v13[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "optionType");
  if (v8 != 1)
  {
    if (!v8)
    {
      v9 = 1;
      if (!objc_msgSend(v6, "selectedOptionIndex"))
        goto LABEL_11;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (!objc_msgSend(v6, "selectedOptionIndex"))
  {
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(v6, "selectedOptionIndex") != 1)
  {
    v9 = 2;
LABEL_10:
    v9 = 2 * (objc_msgSend(v6, "selectedOptionIndex") == v9);
    goto LABEL_11;
  }
  v9 = 1;
LABEL_11:
  draftRecipe = self->_draftRecipe;
  objc_msgSend(v7, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKGreenfieldDraftRecipe setComplicationOption:forComplicationUniqueIdentifier:](draftRecipe, "setComplicationOption:forComplicationUniqueIdentifier:", v9, v11);

  v12 = self->_draftRecipe;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__NTKGreenfieldCompanionActivityViewController__handleCustomizationValueChange_sharingOption___block_invoke;
  v13[3] = &unk_1E6BD2268;
  v13[4] = self;
  +[NTKGreenfieldUtilities generateFacePreviewImageFromDraftRecipe:borderType:completionBlock:](NTKGreenfieldUtilities, "generateFacePreviewImageFromDraftRecipe:borderType:completionBlock:", v12, 1, v13);

}

void __94__NTKGreenfieldCompanionActivityViewController__handleCustomizationValueChange_sharingOption___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NTKGreenfieldCompanionActivityItemProvider *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = -[NTKGreenfieldCompanionActivityItemProvider initWithDraftRecipe:previewImage:]([NTKGreenfieldCompanionActivityItemProvider alloc], "initWithDraftRecipe:previewImage:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1328), v3);
    -[NTKGreenfieldCompanionActivityItemProvider setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));
    v5 = *(void **)(a1 + 32);
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateActivityItems:", v6);

  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v4 = (NTKGreenfieldCompanionActivityItemProvider *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super.super.super, OS_LOG_TYPE_ERROR))
      __94__NTKGreenfieldCompanionActivityViewController__handleCustomizationValueChange_sharingOption___block_invoke_cold_1(&v4->super.super.super);
  }

}

- (void)companionActivityItemProvider:(id)a3 handleError:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v7;

  v7 = a4;
  -[NTKGreenfieldCompanionActivityViewController completionWithItemsHandler](self, "completionWithItemsHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NTKGreenfieldCompanionActivityViewController completionWithItemsHandler](self, "completionWithItemsHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const __CFString *, _QWORD, _QWORD, id))v6)[2](v6, CFSTR("Greenfield"), 0, 0, v7);

    -[NTKGreenfieldCompanionActivityViewController setCompletionWithItemsHandler:](self, "setCompletionWithItemsHandler:", 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draftRecipe, 0);
}

void __94__NTKGreenfieldCompanionActivityViewController__handleCustomizationValueChange_sharingOption___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Failed to generate the updated recipe after sharing options has changed.", v1, 2u);
}

@end
