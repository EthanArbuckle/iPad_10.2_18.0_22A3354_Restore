@implementation ContinuityCaptureShieldUICAPackageView

- (ContinuityCaptureShieldUICAPackageView)initWithPackageName:(id)a3 type:(id)a4 inBundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  ContinuityCaptureShieldUICAPackageView *v18;
  ContinuityCaptureShieldUICAPackageView *v19;
  id *p_rootLayer;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  uint64_t v30;
  void *v31;
  NSDictionary *v32;
  NSDictionary *publishedObjectMap;
  CAStateController *v34;
  CAStateController *stateController;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  id v47;
  _BYTE v48[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if ((id)kCAPackageTypeCAMLBundle == v9)
    v12 = CFSTR("ca");
  else
    v12 = CFSTR("caar");
  if ((id)kCAPackageTypeCAMLFile == v9)
    v13 = CFSTR("caml");
  else
    v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLForResource:withExtension:", v8, v13));
  v47 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_ContinuityCaptureShieldUICAPackage packageWithContentsOfURL:type:options:error:](_ContinuityCaptureShieldUICAPackage, "packageWithContentsOfURL:type:options:error:", v14, v9, 0, &v47));
  v16 = v47;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rootLayer"));
  objc_msgSend(v17, "frame");
  v46.receiver = self;
  v46.super_class = (Class)ContinuityCaptureShieldUICAPackageView;
  v18 = -[ContinuityCaptureShieldUICAPackageView initWithFrame:](&v46, "initWithFrame:");
  v19 = v18;
  if (v18)
  {
    v37 = v16;
    v38 = v14;
    v39 = v11;
    v40 = v9;
    v41 = v8;
    p_rootLayer = (id *)&v18->_rootLayer;
    objc_storeStrong((id *)&v18->_rootLayer, v17);
    objc_msgSend(v17, "frame");
    v19->_originalSize.width = v21;
    v19->_originalSize.height = v22;
    objc_msgSend(*p_rootLayer, "setGeometryFlipped:", objc_msgSend(v15, "isGeometryFlipped"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContinuityCaptureShieldUICAPackageView layer](v19, "layer"));
    objc_msgSend(v23, "addSublayer:", *p_rootLayer);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publishedObjectNames"));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v28)
            objc_enumerationMutation(v24);
          v30 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publishedObjectWithName:", v30));
          if (v31)
          {
            if (!v27)
              v27 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v24, "count"));
            objc_msgSend(v27, "setObject:forKey:", v31, v30);
          }

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v26);
    }
    else
    {
      v27 = 0;
    }
    v32 = (NSDictionary *)objc_msgSend(v27, "copy");
    publishedObjectMap = v19->_publishedObjectMap;
    v19->_publishedObjectMap = v32;

    v34 = (CAStateController *)objc_msgSend(objc_alloc((Class)CAStateController), "initWithLayer:", v19->_rootLayer);
    stateController = v19->_stateController;
    v19->_stateController = v34;

    -[CAStateController setDelegate:](v19->_stateController, "setDelegate:", v19);
    v9 = v40;
    v8 = v41;
    v14 = v38;
    v11 = v39;
    v16 = v37;
  }

  return v19;
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
  return -[ContinuityCaptureShieldUICAPackageView setState:animated:](self, "setState:animated:", a3, 1);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return -[ContinuityCaptureShieldUICAPackageView setState:animated:transitionSpeed:completion:](self, "setState:animated:transitionSpeed:completion:", a3, a4, &stru_100018548, 1.0);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  return -[ContinuityCaptureShieldUICAPackageView setState:onLayer:animated:transitionSpeed:completion:](self, "setState:onLayer:animated:transitionSpeed:completion:", a3, self->_rootLayer, a4, a6, a5);
}

- (BOOL)setState:(id)a3 onLayer:(id)a4 animated:(BOOL)a5 transitionSpeed:(double)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void (**v14)(id, uint64_t);
  double v15;
  void *v16;
  double v17;
  BOOL v18;
  void *v19;
  void *v20;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = (void (**)(id, uint64_t))a7;
  if (v12)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stateWithName:", v12));
    v18 = v16 != 0;
    if (v16)
    {
      if (v9)
      {
        if (v14)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[CAStateController stateOfLayer:](self->_stateController, "stateOfLayer:", v13));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
          -[ContinuityCaptureShieldUICAPackageView _setPendingCompletion:fromState:toState:](self, "_setPendingCompletion:fromState:toState:", v14, v20, v12);

        }
        *(float *)&v17 = a6;
        -[CAStateController setState:ofLayer:transitionSpeed:](self->_stateController, "setState:ofLayer:transitionSpeed:", v16, v13, v17);
      }
      else
      {
        -[ContinuityCaptureShieldUICAPackageView _clearPendingCompletion](self, "_clearPendingCompletion");
        -[CAStateController setState:ofLayer:](self->_stateController, "setState:ofLayer:", v16, v13);
        if (v14)
          v14[2](v14, 1);
      }
    }
    else if (v14)
    {
      v14[2](v14, 0);
    }

  }
  else
  {
    *(float *)&v15 = a6;
    -[CAStateController setInitialStatesOfLayer:transitionSpeed:](self->_stateController, "setInitialStatesOfLayer:transitionSpeed:", v13, v15);
    v18 = 1;
    if (v14)
      v14[2](v14, 1);
  }

  return v18;
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
  v8.super_class = (Class)ContinuityCaptureShieldUICAPackageView;
  -[ContinuityCaptureShieldUICAPackageView layoutSubviews](&v8, "layoutSubviews");
  -[ContinuityCaptureShieldUICAPackageView bounds](self, "bounds");
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
  if ((objc_opt_respondsToSelector(WeakRetained, "stateController:didSetStateOfLayer:") & 1) != 0)
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
  if ((objc_opt_respondsToSelector(WeakRetained, "stateController:transitionDidStart:speed:") & 1) != 0)
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
  unsigned int v11;
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
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toState"));
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
  if ((objc_opt_respondsToSelector(WeakRetained, "stateController:transitionDidStop:completed:") & 1) != 0)
    objc_msgSend(WeakRetained, "stateController:transitionDidStop:completed:", v16, v9, v5);

}

- (void)_setPendingCompletion:(id)a3 fromState:(id)a4 toState:(id)a5
{
  id v8;
  id v9;
  void (**pendingCompletion)(id, _QWORD);
  id v11;
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
  v11 = objc_msgSend(v17, "copy");
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
  -[ContinuityCaptureShieldUICAPackageView _setPendingCompletion:fromState:toState:](self, "_setPendingCompletion:fromState:toState:", 0, 0, 0);
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
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
