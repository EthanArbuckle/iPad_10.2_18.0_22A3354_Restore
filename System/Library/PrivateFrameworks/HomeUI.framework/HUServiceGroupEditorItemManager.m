@implementation HUServiceGroupEditorItemManager

- (HUServiceGroupEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithServiceGroupBuilder_mode_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceGroupEditorItemManager.m"), 36, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUServiceGroupEditorItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUServiceGroupEditorItemManager)initWithServiceGroupBuilder:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v9;
  HUServiceGroupEditorItemManager *v10;
  HUServiceGroupEditorItemManager *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUServiceGroupEditorItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v13, sel_initWithDelegate_sourceItem_, a5, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_serviceGroupBuilder, a3);
    v11->_mode = a4;
  }

  return v11;
}

- (int64_t)instructionsSectionIndex
{
  void *v2;
  int64_t v3;

  -[HUServiceGroupEditorItemManager currentSectionIdentifiers](self, "currentSectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", CFSTR("HUServiceGroupEditorInstructionsSectionIdentifier"));

  return v3;
}

- (int64_t)serviceGridSectionIndex
{
  void *v2;
  int64_t v3;

  -[HUServiceGroupEditorItemManager currentSectionIdentifiers](self, "currentSectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", CFSTR("HUServiceGroupEditorServiceGridSectionIdentifier"));

  return v3;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  HUInstructionsItem *v11;
  id v12;
  HUInstructionsItem *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceGroupEditorItemManager serviceGroupBuilder](self, "serviceGroupBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUServiceGroupEditorItemManager mode](self, "mode");
  v7 = MEMORY[0x1E0C809B0];
  if (!v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0D31840]);
    v26[0] = v7;
    v26[1] = 3221225472;
    v26[2] = __62__HUServiceGroupEditorItemManager__buildItemProvidersForHome___block_invoke;
    v26[3] = &unk_1E6F4C518;
    v27 = v5;
    v9 = (void *)objc_msgSend(v8, "initWithResultsBlock:", v26);
    -[HUServiceGroupEditorItemManager setNameAndIconItem:](self, "setNameAndIconItem:", v9);

    -[HUServiceGroupEditorItemManager nameAndIconItem](self, "nameAndIconItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  v11 = [HUInstructionsItem alloc];
  v21 = v7;
  v22 = 3221225472;
  v23 = __62__HUServiceGroupEditorItemManager__buildItemProvidersForHome___block_invoke_2;
  v24 = &unk_1E6F4C518;
  v25 = v5;
  v12 = v5;
  v13 = -[HFStaticItem initWithResultsBlock:](v11, "initWithResultsBlock:", &v21);
  -[HUServiceGroupEditorItemManager setInstructionsItem:](self, "setInstructionsItem:", v13, v21, v22, v23, v24);

  -[HUServiceGroupEditorItemManager instructionsItem](self, "instructionsItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);

  v15 = objc_alloc(MEMORY[0x1E0D31840]);
  v16 = (void *)objc_msgSend(v15, "initWithResults:", MEMORY[0x1E0C9AA70]);
  -[HUServiceGroupEditorItemManager setServiceGridItem:](self, "setServiceGridItem:", v16);

  -[HUServiceGroupEditorItemManager serviceGridItem](self, "serviceGridItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v4);
  v28[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __62__HUServiceGroupEditorItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "primaryServiceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D317C8], "defaultIconDescriptorForServiceType:serviceSubtype:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "na_safeSetObject:forKey:", v4, *MEMORY[0x1E0D30C60]);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __62__HUServiceGroupEditorItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E70410E0, CFSTR("instructionsStyle"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUServiceGroupEditorAccessoriesInstructionsTitle"), CFSTR("HUServiceGroupEditorAccessoriesInstructionsTitle"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUServiceGroupEditorAccessoriesInstructionsDescriptionWithName"), CFSTR("%@"), v7, v8, v9, v10, v11, v12, (uint64_t)v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUServiceGroupEditorAccessoriesInstructionsDescriptionWithoutName"), CFSTR("HUServiceGroupEditorAccessoriesInstructionsDescriptionWithoutName"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30BF8]);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)_numberOfSections
{
  void *v2;
  unint64_t v3;

  -[HUServiceGroupEditorItemManager currentSectionIdentifiers](self, "currentSectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HUServiceGroupEditorItemManager currentSectionIdentifiers](self, "currentSectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
    NSLog(CFSTR("Received identifier request for section (%ld), but only have (%ld) sections"), a3, objc_msgSend(v4, "count"));
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  return 0;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  id v5;
  void *v6;
  char v7;
  const __CFString *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;

  v5 = a3;
  -[HUServiceGroupEditorItemManager nameAndIconItem](self, "nameAndIconItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = CFSTR("HUServiceGroupEditorNameSectionIdentifier");
  }
  else
  {
    -[HUServiceGroupEditorItemManager instructionsItem](self, "instructionsItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqual:", v9);

    if ((v10 & 1) != 0)
    {
      v8 = CFSTR("HUServiceGroupEditorInstructionsSectionIdentifier");
    }
    else
    {
      -[HUServiceGroupEditorItemManager serviceGridItem](self, "serviceGridItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v5, "isEqual:", v11);

      if ((v12 & 1) != 0)
      {
        v8 = CFSTR("HUServiceGroupEditorServiceGridSectionIdentifier");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUServiceGroupEditorItemManager.m"), 135, CFSTR("Couldn't find a section for item: %@"), v5);

        v8 = 0;
      }
    }
  }

  return (id)v8;
}

- (id)currentSectionIdentifiers
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HUServiceGroupEditorItemManager mode](self, "mode"))
    objc_msgSend(v3, "addObject:", CFSTR("HUServiceGroupEditorNameSectionIdentifier"));
  objc_msgSend(v3, "addObject:", CFSTR("HUServiceGroupEditorInstructionsSectionIdentifier"));
  objc_msgSend(v3, "addObject:", CFSTR("HUServiceGroupEditorServiceGridSectionIdentifier"));
  return v3;
}

- (HFServiceGroupBuilder)serviceGroupBuilder
{
  return self->_serviceGroupBuilder;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (HFStaticItem)nameAndIconItem
{
  return self->_nameAndIconItem;
}

- (void)setNameAndIconItem:(id)a3
{
  objc_storeStrong((id *)&self->_nameAndIconItem, a3);
}

- (HFItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsItem, a3);
}

- (HFStaticItem)serviceGridItem
{
  return self->_serviceGridItem;
}

- (void)setServiceGridItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceGridItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceGridItem, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong((id *)&self->_nameAndIconItem, 0);
  objc_storeStrong((id *)&self->_serviceGroupBuilder, 0);
}

@end
