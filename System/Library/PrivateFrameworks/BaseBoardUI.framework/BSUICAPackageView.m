@implementation BSUICAPackageView

- (BSUICAPackageView)initWithPackageName:(id)a3 inBundle:(id)a4
{
  void *v5;
  BSUICAPackageView *v6;

  objc_msgSend(a4, "URLForResource:withExtension:", a3, CFSTR("ca"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BSUICAPackageView initWithURL:](self, "initWithURL:", v5);

  return v6;
}

- (BSUICAPackageView)initWithURL:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BSUICAPackageView *v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *publishedObjectMap;
  uint64_t v20;
  CAStateController *stateController;
  BSUICAPackageView *v22;
  id v24;
  id v25;
  id *p_rootLayer;
  id obj;
  BSUICAPackageView *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CD3078];
  v34 = 0;
  v24 = v4;
  objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v4, v5, 0, &v34);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v34;
  objc_msgSend(v6, "rootLayer");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "frame");
  v33.receiver = self;
  v33.super_class = (Class)BSUICAPackageView;
  v7 = -[BSUICAPackageView initWithFrame:](&v33, sel_initWithFrame_);
  if (v7)
  {
    v28 = v7;
    p_rootLayer = (id *)&v7->_rootLayer;
    objc_storeStrong((id *)&v7->_rootLayer, obj);
    objc_msgSend(obj, "frame");
    v28->_originalSize.width = v8;
    v28->_originalSize.height = v9;
    objc_msgSend(*p_rootLayer, "setGeometryFlipped:", objc_msgSend(v6, "isGeometryFlipped"));
    -[BSUICAPackageView layer](v28, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", *p_rootLayer);

    objc_msgSend(v6, "publishedObjectNames");
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v6, "publishedObjectWithName:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            if (!v12)
              v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v11, "count"));
            objc_msgSend(v12, "setObject:forKey:", v17, v16);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v13);
    }

    v18 = objc_msgSend(v12, "copy");
    publishedObjectMap = v28->_publishedObjectMap;
    v28->_publishedObjectMap = (NSDictionary *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD2868]), "initWithLayer:", *p_rootLayer);
    stateController = v28->_stateController;
    v28->_stateController = (CAStateController *)v20;

    -[CAStateController setDelegate:](v28->_stateController, "setDelegate:", v28);
    v7 = v28;
  }
  v22 = v7;

  return v22;
}

- (id)publishedObjectWithName:(id)a3
{
  -[NSDictionary objectForKey:](self->_publishedObjectMap, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)publishedObjectNames
{
  return -[NSDictionary allKeys](self->_publishedObjectMap, "allKeys");
}

- (BOOL)setState:(id)a3
{
  return -[BSUICAPackageView setState:animated:](self, "setState:animated:", a3, 1);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return -[BSUICAPackageView setState:animated:transitionSpeed:completion:](self, "setState:animated:transitionSpeed:completion:", a3, a4, 0, 1.0);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  return -[BSUICAPackageView setState:onLayer:animated:transitionSpeed:completion:](self, "setState:onLayer:animated:transitionSpeed:completion:", a3, self->_rootLayer, a4, a6, a5);
}

- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
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
        -[BSUICAPackageView _setPendingCompletion:fromState:toState:](self, v14, v18, v12);

      }
      *(float *)&v16 = a6;
      -[CAStateController setState:ofLayer:transitionSpeed:](self->_stateController, "setState:ofLayer:transitionSpeed:", v15, v13, v16);
      goto LABEL_11;
    }
    if (self)
      -[BSUICAPackageView _setPendingCompletion:fromState:toState:](self, 0, 0, 0);
    -[CAStateController setState:ofLayer:](self->_stateController, "setState:ofLayer:", v15, v13);
  }
  if (v14)
    (*((void (**)(id, BOOL))v14 + 2))(v14, v15 != 0);
LABEL_11:

  return v15 != 0;
}

- (void)_setPendingCompletion:(void *)a3 fromState:(void *)a4 toState:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v9 = a1[59];
    if (v9)
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
    v10 = objc_msgSend(v16, "copy");
    v11 = (void *)a1[59];
    a1[59] = v10;

    v12 = objc_msgSend(v7, "copy");
    v13 = (void *)a1[58];
    a1[58] = v12;

    v14 = objc_msgSend(v8, "copy");
    v15 = (void *)a1[57];
    a1[57] = v14;

  }
}

- (CAStateControllerDelegate)stateControllerDelegate
{
  return (CAStateControllerDelegate *)objc_loadWeakRetained((id *)&self->_stateControllerDelegate);
}

- (void)setStateControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_stateControllerDelegate, a3);
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
  v8.super_class = (Class)BSUICAPackageView;
  -[BSUICAPackageView layoutSubviews](&v8, sel_layoutSubviews);
  -[BSUICAPackageView bounds](self, "bounds");
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
