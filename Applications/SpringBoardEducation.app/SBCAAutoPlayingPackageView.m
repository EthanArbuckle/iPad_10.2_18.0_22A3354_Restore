@implementation SBCAAutoPlayingPackageView

- (SBCAAutoPlayingPackageView)initWithURL:(id)a3 startingState:(id)a4 endingState:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  SBCAAutoPlayingPackageView *v14;
  SBCAAutoPlayingPackageView *v15;
  id *p_rootLayer;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  void *v27;
  NSDictionary *v28;
  NSDictionary *publishedObjectMap;
  CAStateController *v30;
  CAStateController *stateController;
  id v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  id v42;
  _BYTE v43[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v42 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAPackage packageWithContentsOfURL:type:options:error:](CAPackage, "packageWithContentsOfURL:type:options:error:", v8, kCAPackageTypeCAMLBundle, 0, &v42));
  v12 = v42;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rootLayer"));
  objc_msgSend(v13, "frame");
  v41.receiver = self;
  v41.super_class = (Class)SBCAAutoPlayingPackageView;
  v14 = -[SBCAAutoPlayingPackageView initWithFrame:](&v41, "initWithFrame:");
  v15 = v14;
  if (v14)
  {
    v33 = v12;
    v34 = v10;
    v35 = v9;
    v36 = v8;
    p_rootLayer = (id *)&v14->_rootLayer;
    objc_storeStrong((id *)&v14->_rootLayer, v13);
    objc_msgSend(v13, "frame");
    v15->_originalSize.width = v17;
    v15->_originalSize.height = v18;
    objc_storeStrong((id *)&v15->_startingState, a4);
    objc_storeStrong((id *)&v15->_endingState, a5);
    objc_msgSend(*p_rootLayer, "setGeometryFlipped:", objc_msgSend(v11, "isGeometryFlipped"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SBCAAutoPlayingPackageView layer](v15, "layer"));
    objc_msgSend(v19, "addSublayer:", *p_rootLayer);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publishedObjectNames"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(v20);
          v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "publishedObjectWithName:", v26));
          if (v27)
          {
            if (!v23)
              v23 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v20, "count"));
            objc_msgSend(v23, "setObject:forKey:", v27, v26);
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v22);
    }
    else
    {
      v23 = 0;
    }
    v28 = (NSDictionary *)objc_msgSend(v23, "copy");
    publishedObjectMap = v15->_publishedObjectMap;
    v15->_publishedObjectMap = v28;

    v30 = (CAStateController *)objc_msgSend(objc_alloc((Class)CAStateController), "initWithLayer:", v15->_rootLayer);
    stateController = v15->_stateController;
    v15->_stateController = v30;

    -[CAStateController setDelegate:](v15->_stateController, "setDelegate:", v15);
    v9 = v35;
    -[SBCAAutoPlayingPackageView setState:](v15, "setState:", v35);

    v8 = v36;
    v12 = v33;
    v10 = v34;
  }

  return v15;
}

- (void)dealloc
{
  CAStateController *stateController;
  objc_super v4;

  -[CAStateController setDelegate:](self->_stateController, "setDelegate:", 0);
  stateController = self->_stateController;
  self->_stateController = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBCAAutoPlayingPackageView;
  -[SBCAAutoPlayingPackageView dealloc](&v4, "dealloc");
}

- (id)publishedObjectWithName:(id)a3
{
  return -[NSDictionary objectForKey:](self->_publishedObjectMap, "objectForKey:", a3);
}

- (id)publishedObjectNames
{
  return -[NSDictionary allKeys](self->_publishedObjectMap, "allKeys");
}

- (BOOL)setState:(id)a3
{
  return -[SBCAAutoPlayingPackageView setState:animated:](self, "setState:animated:", a3, 1);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4
{
  return -[SBCAAutoPlayingPackageView setState:animated:transitionSpeed:completion:](self, "setState:animated:transitionSpeed:completion:", a3, a4, 0, 1.0);
}

- (BOOL)setState:(id)a3 animated:(BOOL)a4 transitionSpeed:(double)a5 completion:(id)a6
{
  return -[SBCAAutoPlayingPackageView setState:onLayer:animated:transitionSpeed:completion:](self, "setState:onLayer:animated:transitionSpeed:completion:", a3, self->_rootLayer, a4, a6, a5);
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
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stateWithName:", v12));
  if (v15)
  {
    if (v9)
    {
      if (v14)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CAStateController stateOfLayer:](self->_stateController, "stateOfLayer:", v13));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "name"));
        -[SBCAAutoPlayingPackageView _setPendingCompletion:fromState:toState:](self, "_setPendingCompletion:fromState:toState:", v14, v18, v12);

      }
      *(float *)&v16 = a6;
      -[CAStateController setState:ofLayer:transitionSpeed:](self->_stateController, "setState:ofLayer:transitionSpeed:", v15, v13, v16);
    }
    else
    {
      -[SBCAAutoPlayingPackageView _clearPendingCompletion](self, "_clearPendingCompletion");
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
  v8.super_class = (Class)SBCAAutoPlayingPackageView;
  -[SBCAAutoPlayingPackageView layoutSubviews](&v8, "layoutSubviews");
  -[SBCAAutoPlayingPackageView bounds](self, "bounds");
  if (v3 / self->_originalSize.width >= v4 / self->_originalSize.height)
    v5 = v4 / self->_originalSize.height;
  else
    v5 = v3 / self->_originalSize.width;
  -[CALayer setPosition:](self->_rootLayer, "setPosition:", v3 * 0.5, v4 * 0.5);
  rootLayer = self->_rootLayer;
  CATransform3DMakeScale(&v7, v5, v5, 1.0);
  -[CALayer setTransform:](rootLayer, "setTransform:", &v7);
}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id pendingCompletion;
  NSString *pendingCompletionFromState;
  NSString *pendingCompletionToState;
  void *v14;
  unsigned int v15;
  CAStateController *v16;
  CAStateController *stateController;
  id v18;

  v18 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_pendingCompletion)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toState"));
    v10 = objc_msgSend(v9, "isEqualToString:", self->_pendingCompletionToState);

    if (v10)
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
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "toState"));
  v15 = objc_msgSend(v14, "isEqualToString:", self->_endingState);

  if (v15)
  {
    v16 = (CAStateController *)objc_msgSend(objc_alloc((Class)CAStateController), "initWithLayer:", self->_rootLayer);
    stateController = self->_stateController;
    self->_stateController = v16;

    -[CAStateController setDelegate:](self->_stateController, "setDelegate:", self);
    -[SBCAAutoPlayingPackageView setState:animated:transitionSpeed:completion:](self, "setState:animated:transitionSpeed:completion:", self->_startingState, 1, 0, 1.0);
  }

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
  -[SBCAAutoPlayingPackageView _setPendingCompletion:fromState:toState:](self, "_setPendingCompletion:fromState:toState:", 0, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingState, 0);
  objc_storeStrong((id *)&self->_startingState, 0);
  objc_storeStrong((id *)&self->_publishedObjectMap, 0);
  objc_storeStrong(&self->_pendingCompletion, 0);
  objc_storeStrong((id *)&self->_pendingCompletionFromState, 0);
  objc_storeStrong((id *)&self->_pendingCompletionToState, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end
