@implementation FBSSceneSnapshotRequest

- (FBSSceneSnapshotRequest)initWithSettings:(id)a3 allowsProtectedContent:(BOOL)a4
{
  id v6;
  FBSSceneSnapshotRequest *v7;
  uint64_t v8;
  FBSSceneSettings *settings;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBSSceneSnapshotRequest;
  v7 = -[FBSSceneSnapshotRequest init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    settings = v7->_settings;
    v7->_settings = (FBSSceneSettings *)v8;

    v7->_allowsProtectedContent = a4;
  }

  return v7;
}

- (FBSSceneSnapshotRequest)initWithSettings:(id)a3
{
  return -[FBSSceneSnapshotRequest initWithSettings:allowsProtectedContent:](self, "initWithSettings:allowsProtectedContent:", a3, 0);
}

- (BOOL)performSnapshotWithContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  id WeakRetained;

  v4 = a3;
  v5 = v4;
  if (self->_handled)
  {
    v6 = 0;
  }
  else
  {
    self->_handled = 1;
    objc_msgSend(v4, "clientExtendedData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_allowsProtectedContent != objc_msgSend(v7, "BOOLForSetting:", 281330800))
    {
      v8 = (id)objc_msgSend(v7, "mutableCopy");
      if (!v8)
        v8 = objc_alloc_init((Class)off_1E38E9E40);
      objc_msgSend(v8, "setFlag:forSetting:", BSSettingFlagIfYes(), 281330800);
      objc_msgSend(v5, "setClientExtendedData:", v8);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_msgSend(WeakRetained, "snapshotRequestAllowSnapshot:", self))
    {
      objc_msgSend(v5, "setSettings:", self->_settings);
      v6 = objc_msgSend(WeakRetained, "snapshotRequest:performWithContext:", self, v5);
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (NSString)description
{
  return (NSString *)-[FBSSceneSnapshotRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSSceneSnapshotRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_sceneID, CFSTR("sceneID"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_handled, CFSTR("handled"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSSceneSnapshotRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FBSSceneSnapshotRequest *v11;

  v4 = a3;
  -[FBSSceneSnapshotRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__FBSSceneSnapshotRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __65__FBSSceneSnapshotRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("settings"));
}

- (FBSSceneSnapshotRequest)initWithXPCDictionary:(id)a3
{
  id v4;
  FBSSceneSnapshotRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  FBSSceneSettings *settings;

  v4 = a3;
  v5 = -[FBSSceneSnapshotRequest init](self, "init");
  if (v5)
  {
    BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "settingsByApplyingToMutableCopyOfSettings:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    settings = v5->_settings;
    v5->_settings = (FBSSceneSettings *)v8;

    v5->_allowsProtectedContent = xpc_dictionary_get_BOOL(v4, "allowsProtectedContent");
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  void *v4;
  xpc_object_t xdict;

  xdict = a3;
  +[FBSSceneSettingsDiff diffFromSettings:toSettings:](FBSSceneSettingsDiff, "diffFromSettings:toSettings:", 0, self->_settings);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  if (self->_allowsProtectedContent)
    xpc_dictionary_set_BOOL(xdict, "allowsProtectedContent", 1);

}

- (FBSSceneSnapshotRequestDelegate)delegate
{
  return (FBSSceneSnapshotRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (BOOL)allowsProtectedContent
{
  return self->_allowsProtectedContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
