@implementation AMUIAmbientPresentationSceneClientComponent

- (void)setScene:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  int64_t v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMUIAmbientPresentationSceneClientComponent;
  -[FBSSceneComponent setScene:](&v11, sel_setScene_, v4);
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  self->_ambientPresented = -[AMUIAmbientPresentationSceneClientComponent _isAmbientPresentedForScene:](self, "_isAmbientPresentedForScene:", v8);
  v9 = -[AMUIAmbientPresentationSceneClientComponent _ambientDisplayStyleForScene:](self, "_ambientDisplayStyleForScene:", v8);

  self->_ambientDisplayStyle = v9;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__sceneWillConnect_, *MEMORY[0x24BDF7D30], 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7D30], 0);

  v4.receiver = self;
  v4.super_class = (Class)AMUIAmbientPresentationSceneClientComponent;
  -[AMUIAmbientPresentationSceneClientComponent dealloc](&v4, sel_dealloc);
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v12 = a3;
  v6 = a4;
  objc_msgSend(v6, "settingsDiff");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsProperty:", sel_isAmbientPresented))
  {

LABEL_4:
    self->_ambientPresented = -[AMUIAmbientPresentationSceneClientComponent _isAmbientPresentedForScene:](self, "_isAmbientPresentedForScene:", v12, v12);
    self->_ambientDisplayStyle = -[AMUIAmbientPresentationSceneClientComponent _ambientDisplayStyleForScene:](self, "_ambientDisplayStyleForScene:", v12);
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connectedScenes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__AMUIAmbientPresentationSceneClientComponent_scene_didUpdateSettings___block_invoke;
    v13[3] = &unk_250779080;
    v13[4] = self;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

    goto LABEL_5;
  }
  objc_msgSend(v6, "settingsDiff");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsProperty:", sel_ambientDisplayStyle);

  if (v9)
    goto LABEL_4;
LABEL_5:

}

void __71__AMUIAmbientPresentationSceneClientComponent_scene_didUpdateSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v7 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v7;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "_updateAmbientTraitsForWindowScene:", v6);
}

- (BOOL)_isAmbientPresentedForScene:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "isAmbientPresented");
  else
    v4 = 0;

  return v4;
}

- (int64_t)_ambientDisplayStyleForScene:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "ambientDisplayStyle");
  else
    v4 = 0;

  return v4;
}

- (void)_sceneWillConnect:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  -[AMUIAmbientPresentationSceneClientComponent _updateAmbientTraitsForWindowScene:](self, "_updateAmbientTraitsForWindowScene:", v8);
}

- (void)_updateAmbientTraitsForWindowScene:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  id v10;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "traitOverrides");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[AMUIAmbientPresentationSceneClientComponent isAmbientPresented](self, "isAmbientPresented"))
      v6 = 2;
    else
      v6 = 1;
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNSIntegerValue:forTrait:", v6, v7);

    objc_msgSend(v4, "traitOverrides");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v8 = -[AMUIAmbientPresentationSceneClientComponent ambientDisplayStyle](self, "ambientDisplayStyle");
    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNSIntegerValue:forTrait:", v8, v9);

  }
}

- (BOOL)isAmbientPresented
{
  return self->_ambientPresented;
}

- (void)setAmbientPresented:(BOOL)a3
{
  self->_ambientPresented = a3;
}

- (int64_t)ambientDisplayStyle
{
  return self->_ambientDisplayStyle;
}

- (void)setAmbientDisplayStyle:(int64_t)a3
{
  self->_ambientDisplayStyle = a3;
}

@end
