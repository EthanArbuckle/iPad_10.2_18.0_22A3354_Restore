@implementation CRSUIClusterWindow

- (void)commonInit
{
  CARObserverHashTable *v3;
  CARObserverHashTable *observers;
  void *v5;
  CRSUIClusterZoomBSActionsHandler *v6;
  void *v7;
  CRSUIInstrumentClusterSettingsDiffInspector *v8;
  CRSUIInstrumentClusterSettingsDiffInspector *clusterSettingsDiffInspector;
  CRSUIInstrumentClusterSettingsDiffInspector *v10;
  uint64_t v11;
  CRSUIInstrumentClusterSettingsDiffInspector *v12;
  CRSUIInstrumentClusterSettingsDiffInspector *v13;
  CRSUIInstrumentClusterSettingsDiffInspector *v14;
  CRSUIInstrumentClusterSettingsDiffInspector *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;
  CRSUIClusterWindow *v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)CRSUIClusterWindow;
  -[CRSUIWindow commonInit](&v32, sel_commonInit);
  v3 = (CARObserverHashTable *)objc_msgSend(objc_alloc(MEMORY[0x24BE15228]), "initWithProtocol:", &unk_2549E2AE8);
  observers = self->_observers;
  self->_observers = v3;

  -[CRSUIClusterWindow windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRSUIClusterZoomBSActionsHandler initWithDelegate:]([CRSUIClusterZoomBSActionsHandler alloc], "initWithDelegate:", self);
  v34[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_registerSceneActionsHandlerArray:forKey:", v7, CFSTR("zoomActions"));

  v8 = objc_alloc_init(CRSUIInstrumentClusterSettingsDiffInspector);
  clusterSettingsDiffInspector = self->_clusterSettingsDiffInspector;
  self->_clusterSettingsDiffInspector = v8;

  objc_initWeak(&location, self);
  v10 = self->_clusterSettingsDiffInspector;
  v11 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __32__CRSUIClusterWindow_commonInit__block_invoke;
  v29[3] = &unk_24C76A028;
  objc_copyWeak(&v30, &location);
  -[CRSUIInstrumentClusterSettingsDiffInspector observeShowETAWithBlock:](v10, "observeShowETAWithBlock:", v29);
  v12 = self->_clusterSettingsDiffInspector;
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __32__CRSUIClusterWindow_commonInit__block_invoke_2;
  v27[3] = &unk_24C76A028;
  objc_copyWeak(&v28, &location);
  -[CRSUIInstrumentClusterSettingsDiffInspector observeShowCompassWithBlock:](v12, "observeShowCompassWithBlock:", v27);
  v13 = self->_clusterSettingsDiffInspector;
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __32__CRSUIClusterWindow_commonInit__block_invoke_3;
  v25[3] = &unk_24C76A028;
  objc_copyWeak(&v26, &location);
  -[CRSUIInstrumentClusterSettingsDiffInspector observeShowSpeedLimitWithBlock:](v13, "observeShowSpeedLimitWithBlock:", v25);
  v14 = self->_clusterSettingsDiffInspector;
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __32__CRSUIClusterWindow_commonInit__block_invoke_4;
  v23[3] = &unk_24C76A028;
  objc_copyWeak(&v24, &location);
  -[CRSUIInstrumentClusterSettingsDiffInspector observeItemTypeWithBlock:](v14, "observeItemTypeWithBlock:", v23);
  v15 = self->_clusterSettingsDiffInspector;
  v18 = v11;
  v19 = 3221225472;
  v20 = __32__CRSUIClusterWindow_commonInit__block_invoke_5;
  v21 = &unk_24C76A028;
  objc_copyWeak(&v22, &location);
  -[CRSUIInstrumentClusterSettingsDiffInspector observeLayoutSpecificationWithBlock:](v15, "observeLayoutSpecificationWithBlock:", &v18);
  -[CRSUIClusterWindow windowScene](self, "windowScene", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = self;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_registerSettingsDiffActionArray:forKey:", v17, CFSTR("clusterSettings"));

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __32__CRSUIClusterWindow_commonInit__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "observers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clusterWindow:didChangeETASetting:", WeakRetained, objc_msgSend(WeakRetained, "etaSetting"));

}

void __32__CRSUIClusterWindow_commonInit__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "observers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clusterWindow:didChangeCompassSetting:", WeakRetained, objc_msgSend(WeakRetained, "compassSetting"));

}

void __32__CRSUIClusterWindow_commonInit__block_invoke_3(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "observers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clusterWindow:didChangeSpeedLimitSetting:", WeakRetained, objc_msgSend(WeakRetained, "speedLimitSetting"));

}

void __32__CRSUIClusterWindow_commonInit__block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "observers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clusterWindow:didChangeItemType:", WeakRetained, objc_msgSend(WeakRetained, "itemType"));

}

void __32__CRSUIClusterWindow_commonInit__block_invoke_5(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "observers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clusterWindow:didChangeLayoutJustification:", WeakRetained, objc_msgSend(WeakRetained, "layoutJustification"));

}

- (void)addClusterSettingsObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSUIClusterWindow observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)removeClusterSettingsObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSUIClusterWindow observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (unint64_t)etaSetting
{
  void *v2;
  unint64_t v3;

  -[CRSUIClusterWindow _clusterSettings](self, "_clusterSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsETA");

  return v3;
}

- (unint64_t)compassSetting
{
  void *v2;
  unint64_t v3;

  -[CRSUIClusterWindow _clusterSettings](self, "_clusterSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsCompass");

  return v3;
}

- (unint64_t)speedLimitSetting
{
  void *v2;
  unint64_t v3;

  -[CRSUIClusterWindow _clusterSettings](self, "_clusterSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsSpeedLimit");

  return v3;
}

- (unint64_t)itemType
{
  void *v2;
  unint64_t v3;

  -[CRSUIClusterWindow _clusterSettings](self, "_clusterSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "itemType");

  return v3;
}

- (unint64_t)layoutJustification
{
  void *v2;
  unint64_t v3;

  -[CRSUIClusterWindow _clusterSettings](self, "_clusterSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "layoutJustification");

  return v3;
}

- (void)handleZoomInDirection:(int64_t)a3
{
  id v5;

  -[CRSUIClusterWindow observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clusterWindow:didZoomInDirection:", self, a3);

}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  uint64_t v8;
  id v14;
  void *v15;
  objc_super v16;

  v8 = *(_QWORD *)&a8;
  v16.receiver = self;
  v16.super_class = (Class)CRSUIClusterWindow;
  v14 = a5;
  -[CRSUIWindow _performActionsForUIScene:withUpdatedFBSScene:settingsDiff:fromSettings:transitionContext:lifecycleActionType:](&v16, sel__performActionsForUIScene_withUpdatedFBSScene_settingsDiff_fromSettings_transitionContext_lifecycleActionType_, a3, a4, v14, a6, a7, v8);
  -[CRSUIClusterWindow clusterSettingsDiffInspector](self, "clusterSettingsDiffInspector", v16.receiver, v16.super_class);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "inspectDiff:withContext:", v14, 0);

}

- (id)_clusterSettings
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_opt_class();
  -[CRSUIClusterWindow windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CRSUIInstrumentClusterSettingsDiffInspector)clusterSettingsDiffInspector
{
  return self->_clusterSettingsDiffInspector;
}

- (void)setClusterSettingsDiffInspector:(id)a3
{
  objc_storeStrong((id *)&self->_clusterSettingsDiffInspector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
