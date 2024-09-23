@implementation CSWidgetGridModel

- (CSWidgetGridModel)initWithComplicationDescriptors:(id)a3 iconLayout:(id)a4 type:(unint64_t)a5
{
  CSWidgetGridModel *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *removedDescriptorToIndex;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSWidgetGridModel;
  v5 = -[PRWidgetGridModel initWithComplicationDescriptors:iconLayout:type:](&v9, sel_initWithComplicationDescriptors_iconLayout_type_, a3, a4, a5);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    removedDescriptorToIndex = v5->_removedDescriptorToIndex;
    v5->_removedDescriptorToIndex = v6;

  }
  return v5;
}

- (void)validateIconsForAvailableWidgets
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  int v13;
  int v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  CSWidgetGridModel *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PRWidgetGridModel complicationDescriptors](self, "complicationDescriptors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = self->_posterComplicationDescriptors;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        objc_msgSend(v8, "widgetDescriptor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "effectiveContainerBundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "hasMatchingDescriptor") & 1) == 0)
        {
          v12 = -[CSApplicationInforming applicationExistsForBundleIdentifier:](self->_applicationInformer, "applicationExistsForBundleIdentifier:", v10);
          v13 = -[CSApplicationInforming isInstallingApplicationWithBundleIdentifier:](self->_applicationInformer, "isInstallingApplicationWithBundleIdentifier:", v10);
          if ((v12 & 1) == 0 && !v13)
            goto LABEL_13;
        }
        objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isLocked"))
        {

LABEL_13:
          -[PRWidgetGridModel removeComplicationDescriptor:](self, "removeComplicationDescriptor:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_removedDescriptorToIndex, "setObject:forKeyedSubscript:", v15, v8);
          SBLogDashBoard();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v26 = v8;
            v27 = 2114;
            v28 = self;
            v17 = v16;
            v18 = "Removed %{public}@ from widget grid %{public}@";
            goto LABEL_15;
          }
          goto LABEL_16;
        }
        v14 = objc_msgSend(v11, "isHidden");

        if (v14)
          goto LABEL_13;
        if ((objc_msgSend(v20, "containsObject:", v8) & 1) == 0)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_removedDescriptorToIndex, "objectForKeyedSubscript:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRWidgetGridModel addComplicationDescriptor:withGridIndex:](self, "addComplicationDescriptor:withGridIndex:", v8, v15);
          SBLogDashBoard();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v26 = v8;
            v27 = 2114;
            v28 = self;
            v17 = v16;
            v18 = "Adding %{public}@ back to widget grid %{public}@";
LABEL_15:
            _os_log_impl(&dword_1D0337000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
          }
LABEL_16:

        }
        ++v7;
      }
      while (v5 != v7);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      v5 = v19;
    }
    while (v19);
  }

}

- (void)setComplicationDescriptors:(id)a3 iconLayout:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  NSArray *v9;
  NSArray *posterComplicationDescriptors;
  objc_super v11;

  v6 = (objc_class *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  v9 = (NSArray *)objc_msgSend([v6 alloc], "initWithArray:copyItems:", v8, 1);
  posterComplicationDescriptors = self->_posterComplicationDescriptors;
  self->_posterComplicationDescriptors = v9;

  v11.receiver = self;
  v11.super_class = (Class)CSWidgetGridModel;
  -[PRWidgetGridModel setComplicationDescriptors:iconLayout:](&v11, sel_setComplicationDescriptors_iconLayout_, v8, v7);

}

- (CSApplicationInforming)applicationInformer
{
  return self->_applicationInformer;
}

- (void)setApplicationInformer:(id)a3
{
  objc_storeStrong((id *)&self->_applicationInformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationInformer, 0);
  objc_storeStrong((id *)&self->_removedDescriptorToIndex, 0);
  objc_storeStrong((id *)&self->_posterComplicationDescriptors, 0);
}

@end
