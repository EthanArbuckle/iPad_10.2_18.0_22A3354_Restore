@implementation FCUICAPackageView

- (FCUICAPackageView)initWithPackageName:(id)a3 inBundle:(id)a4
{
  void *v5;
  FCUICAPackageView *v6;

  objc_msgSend(a4, "URLForResource:withExtension:", a3, CFSTR("ca"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCUICAPackageView initWithURL:](self, "initWithURL:", v5);

  return v6;
}

- (FCUICAPackageView)initWithURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  FCUICAPackageView *v9;
  FCUICAPackageView *v10;
  id *p_rootLayer;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSDictionary *publishedObjectMap;
  uint64_t v25;
  CAStateController *stateController;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDE5D50];
  v35 = 0;
  objc_msgSend(MEMORY[0x24BDE5718], "packageWithContentsOfURL:type:options:error:", v4, v5, 0, &v35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v35;
  objc_msgSend(v6, "rootLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v34.receiver = self;
  v34.super_class = (Class)FCUICAPackageView;
  v9 = -[FCUICAPackageView initWithFrame:](&v34, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    v28 = v7;
    v29 = v4;
    p_rootLayer = (id *)&v9->_rootLayer;
    objc_storeStrong((id *)&v9->_rootLayer, v8);
    objc_msgSend(v8, "frame");
    v10->_originalSize.width = v12;
    v10->_originalSize.height = v13;
    objc_msgSend(*p_rootLayer, "setGeometryFlipped:", objc_msgSend(v6, "isGeometryFlipped"));
    -[FCUICAPackageView layer](v10, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", *p_rootLayer);

    objc_msgSend(v6, "publishedObjectNames");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v15);
          v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v6, "publishedObjectWithName:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            if (!v18)
              v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v15, "count"));
            objc_msgSend(v18, "setObject:forKey:", v22, v21);
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }
    v23 = objc_msgSend(v18, "copy");
    publishedObjectMap = v10->_publishedObjectMap;
    v10->_publishedObjectMap = (NSDictionary *)v23;

    v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDE5788]), "initWithLayer:", v10->_rootLayer);
    stateController = v10->_stateController;
    v10->_stateController = (CAStateController *)v25;

    -[CAStateController setDelegate:](v10->_stateController, "setDelegate:", v10);
    v7 = v28;
    v4 = v29;
  }

  return v10;
}

+ (id)packageViewForActivity:(id)a3
{
  id v3;
  void *v4;
  FCUICAPackageView *v5;
  void *v6;
  FCUICAPackageView *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  FCUIPackageNameForActivity(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = [FCUICAPackageView alloc];
    FCUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[FCUICAPackageView initWithPackageName:inBundle:](v5, "initWithPackageName:inBundle:", v4, v6);

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __44__FCUICAPackageView_packageViewForActivity___block_invoke;
    v9[3] = &unk_24D20AD38;
    v10 = v3;
    -[FCUICAPackageView updateStateWithName:updateHandler:](v7, "updateStateWithName:updateHandler:", CFSTR("ON"), v9);
    -[FCUICAPackageView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __44__FCUICAPackageView_packageViewForActivity___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = (void *)objc_msgSend(a2, "copy");
    objc_msgSend(v3, "elements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v11, "keyPath", (_QWORD)v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("fillColor"));

          if (v13)
          {
            v14 = objc_alloc_init(MEMORY[0x24BDE57A8]);
            objc_msgSend(v11, "target");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setTarget:", v15);

            objc_msgSend(v11, "keyPath");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setKeyPath:", v16);

            objc_msgSend(MEMORY[0x24BEBD4B8], "fcui_colorForActivity:", *(_QWORD *)(a1 + 32));
            v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v14, "setValue:", objc_msgSend(v17, "CGColor"));

            objc_msgSend(v3, "removeElement:", v11);
            objc_msgSend(v3, "addElement:", v14);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)publishedObjectWithName:(id)a3
{
  return -[NSDictionary objectForKey:](self->_publishedObjectMap, "objectForKey:", a3);
}

- (NSArray)publishedObjectNames
{
  return -[NSDictionary allKeys](self->_publishedObjectMap, "allKeys");
}

- (BOOL)setState:(id)a3
{
  return -[FCUICAPackageView setState:animated:](self, "setState:animated:", a3, 1);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return -[FCUICAPackageView setState:animated:transitionSpeed:completion:](self, "setState:animated:transitionSpeed:completion:", a3, a4, 0, 1.0);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  return -[FCUICAPackageView setState:onLayer:animated:transitionSpeed:completion:](self, "setState:onLayer:animated:transitionSpeed:completion:", a3, self->_rootLayer, a4, a6, a5);
}

- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void (**v14)(id, uint64_t);
  void *v15;
  double v16;
  void *v17;
  void *v18;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, uint64_t))a7;
  objc_msgSend(v13, "stateWithName:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (v9)
    {
      if (v14)
      {
        -[CAStateController stateOfLayer:](self->_stateController, "stateOfLayer:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCUICAPackageView _setPendingCompletion:fromState:toState:](self, "_setPendingCompletion:fromState:toState:", v14, v18, v12);

      }
      *(float *)&v16 = a6;
      -[CAStateController setState:ofLayer:transitionSpeed:](self->_stateController, "setState:ofLayer:transitionSpeed:", v15, v13, v16);
    }
    else
    {
      -[FCUICAPackageView _clearPendingCompletion](self, "_clearPendingCompletion");
      -[CAStateController setState:ofLayer:](self->_stateController, "setState:ofLayer:", v15, v13);
      if (v14)
        v14[2](v14, 1);
    }
  }
  else if (v14)
  {
    v14[2](v14, 0);
  }

  return v15 != 0;
}

- (CAStateControllerDelegate)stateControllerDelegate
{
  return (CAStateControllerDelegate *)objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
}

- (void)setStateControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stateControllerDelegate, a3);
}

- (void)updateStateWithName:(id)a3 updateHandler:(id)a4
{
  CALayer *rootLayer;
  void (**v7)(id, id);
  void *v8;
  BOOL v9;
  id v10;

  rootLayer = self->_rootLayer;
  v7 = (void (**)(id, id))a4;
  -[CALayer stateWithName:](rootLayer, "stateWithName:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    -[CALayer removeState:](self->_rootLayer, "removeState:", v10);
    -[CALayer addState:](self->_rootLayer, "addState:", v8);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_originalSize.width;
  height = self->_originalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CALayer *rootLayer;
  CATransform3D v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FCUICAPackageView;
  -[FCUICAPackageView layoutSubviews](&v8, sel_layoutSubviews);
  -[FCUICAPackageView bounds](self, "bounds");
  if (v3 / self->_originalSize.width >= v4 / self->_originalSize.height)
    v5 = v4 / self->_originalSize.height;
  else
    v5 = v3 / self->_originalSize.width;
  -[CALayer setPosition:](self->_rootLayer, "setPosition:", v3 * 0.5, v4 * 0.5);
  rootLayer = self->_rootLayer;
  CATransform3DMakeScale(&v7, v5, v5, 1.0);
  -[CALayer setTransform:](rootLayer, "setTransform:", &v7);
}

- (void)stateController:(id)a3 didSetStateOfLayer:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "stateController:didSetStateOfLayer:", v8, v6);

}

- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5
{
  id v8;
  id WeakRetained;
  double v10;
  id v11;

  v11 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(float *)&v10 = a5;
    objc_msgSend(WeakRetained, "stateController:transitionDidStart:speed:", v11, v8, v10);
  }

}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id pendingCompletion;
  NSString *pendingCompletionFromState;
  NSString *pendingCompletionToState;
  id WeakRetained;
  id v16;

  v5 = a5;
  v16 = a3;
  v8 = a4;
  v9 = v8;
  if (self->_pendingCompletion)
  {
    objc_msgSend(v8, "toState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", self->_pendingCompletionToState);

    if (v11)
    {
      (*((void (**)(void))self->_pendingCompletion + 2))();
      pendingCompletion = self->_pendingCompletion;
      self->_pendingCompletion = 0;

      pendingCompletionFromState = self->_pendingCompletionFromState;
      self->_pendingCompletionFromState = 0;

      pendingCompletionToState = self->_pendingCompletionToState;
      self->_pendingCompletionToState = 0;

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "stateController:transitionDidStop:completed:", v16, v9, v5);

}

- (void)_setPendingCompletion:(id)a3 fromState:(id)a4 toState:(id)a5
{
  id v8;
  id v9;
  void (**pendingCompletion)(id, _QWORD);
  void *v11;
  id v12;
  NSString *v13;
  NSString *pendingCompletionFromState;
  NSString *v15;
  NSString *pendingCompletionToState;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  pendingCompletion = (void (**)(id, _QWORD))self->_pendingCompletion;
  if (pendingCompletion)
    pendingCompletion[2](pendingCompletion, 0);
  v11 = (void *)objc_msgSend(v17, "copy");
  v12 = self->_pendingCompletion;
  self->_pendingCompletion = v11;

  v13 = (NSString *)objc_msgSend(v8, "copy");
  pendingCompletionFromState = self->_pendingCompletionFromState;
  self->_pendingCompletionFromState = v13;

  v15 = (NSString *)objc_msgSend(v9, "copy");
  pendingCompletionToState = self->_pendingCompletionToState;
  self->_pendingCompletionToState = v15;

}

- (void)_clearPendingCompletion
{
  -[FCUICAPackageView _setPendingCompletion:fromState:toState:](self, "_setPendingCompletion:fromState:toState:", 0, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishedObjectMap, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_pendingCompletionFromState, 0);
  objc_storeStrong((id *)&self->_pendingCompletionToState, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_destroyWeak((id *)&self->_stateControllerDelegate);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end
