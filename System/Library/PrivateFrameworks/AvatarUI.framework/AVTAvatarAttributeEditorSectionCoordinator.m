@implementation AVTAvatarAttributeEditorSectionCoordinator

- (AVTAvatarAttributeEditorSectionCoordinator)init
{
  AVTAvatarAttributeEditorSectionCoordinator *v2;
  uint64_t v3;
  NSMutableDictionary *sectionControllers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVTAvatarAttributeEditorSectionCoordinator;
  v2 = -[AVTAvatarAttributeEditorSectionCoordinator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    sectionControllers = v2->_sectionControllers;
    v2->_sectionControllers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (BOOL)isCoordinatingForSectionController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[AVTAvatarAttributeEditorSectionCoordinator sectionControllers](self, "sectionControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

- (void)addSectionController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[AVTAvatarAttributeEditorSectionCoordinator isCoordinatingForSectionController:](self, "isCoordinatingForSectionController:"))
  {
    objc_msgSend(v7, "setDelegate:", self);
    -[AVTAvatarAttributeEditorSectionCoordinator sectionControllers](self, "sectionControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "section");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v6);

  }
}

- (void)removeSectionController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[AVTAvatarAttributeEditorSectionCoordinator isCoordinatingForSectionController:](self, "isCoordinatingForSectionController:"))
  {
    -[AVTAvatarAttributeEditorSectionCoordinator sectionControllers](self, "sectionControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "section");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v6);

  }
}

- (void)attributeEditorSectionController:(id)a3 didDeleteSectionItems:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarAttributeEditorSectionCoordinator delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributeEditorSectionController:didDeleteSectionItems:", v7, v6);

}

- (void)attributeEditorSectionController:(id)a3 didSelectSectionItem:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AVTAvatarAttributeEditorSectionCoordinator delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributeEditorSectionController:didSelectSectionItem:", v7, v6);

}

- (void)attributeEditorSectionController:(id)a3 didUpdateSectionItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[AVTAvatarAttributeEditorSectionCoordinator sectionControllers](self, "sectionControllers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        if (v14 != v6)
        {
          objc_msgSend(v6, "section");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "attributeSection:didChangeValueForSectionItem:", v15, v7);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[AVTAvatarAttributeEditorSectionCoordinator delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributeEditorSectionController:didUpdateSectionItem:", v6, v7);

}

- (void)attributeEditorSectionControllerNeedsLayoutUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTAvatarAttributeEditorSectionCoordinator delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeEditorSectionControllerNeedsLayoutUpdate:", v4);

}

- (AVTAvatarAttributeEditorControllerSubSelectionDelegate)delegate
{
  return (AVTAvatarAttributeEditorControllerSubSelectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)sectionControllers
{
  return self->_sectionControllers;
}

- (void)setSectionControllers:(id)a3
{
  objc_storeStrong((id *)&self->_sectionControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
