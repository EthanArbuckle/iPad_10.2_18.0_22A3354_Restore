@implementation GCSceneComponent

- (GCSceneComponent)initWithScene:(id)a3
{
  id v5;
  GCSceneComponent *v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCSceneComponent.m"), 23, CFSTR("Only UIWindowScene is supported for game controller scene components."));

  }
  v9.receiver = self;
  v9.super_class = (Class)GCSceneComponent;
  v6 = -[GCSceneComponent init](&v9, sel_init);
  objc_storeWeak((id *)&v6->_scene, v5);

  return v6;
}

- (GCSceneComponent)init
{
  -[GCSceneComponent doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

- (void)prepareSystemUIWithView:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  GCEventInteraction *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "interactions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v5)
  {

LABEL_13:
    v12 = objc_alloc_init(GCEventInteraction);
    -[GCEventInteraction setHandledEventTypes:](v12, "setHandledEventTypes:", 0);
    objc_msgSend(v3, "addInteraction:", v12);

    v7 = 0;
    goto LABEL_14;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;

        v7 = v11;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v6);

  if (!v7)
    goto LABEL_13;
LABEL_14:

}

@end
