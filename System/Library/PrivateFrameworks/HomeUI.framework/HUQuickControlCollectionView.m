@implementation HUQuickControlCollectionView

- (HUQuickControlCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  HUQuickControlCollectionView *v4;
  HUScrollGestureRecognitionResolver *v5;
  HUScrollGestureRecognitionResolver *scrollGestureResolver;
  HUScrollGestureRecognitionResolver *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUQuickControlCollectionView;
  v4 = -[HUQuickControlCollectionView initWithFrame:collectionViewLayout:](&v10, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = objc_alloc_init(HUScrollGestureRecognitionResolver);
    scrollGestureResolver = v4->_scrollGestureResolver;
    v4->_scrollGestureResolver = v5;

    -[HUScrollGestureRecognitionResolver setConflictingGestureActivationDelay:](v4->_scrollGestureResolver, "setConflictingGestureActivationDelay:", 0.0);
    v7 = v4->_scrollGestureResolver;
    -[HUQuickControlCollectionView panGestureRecognizer](v4, "panGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUScrollGestureRecognitionResolver addPanGestureRecognizer:](v7, "addPanGestureRecognizer:", v8);

    -[HUQuickControlCollectionView setDirectionalLockEnabled:](v4, "setDirectionalLockEnabled:", 1);
  }
  return v4;
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isDescendantOfView:", self) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HUQuickControlCollectionView;
    v5 = -[HUQuickControlCollectionView touchesShouldCancelInContentView:](&v7, sel_touchesShouldCancelInContentView_, v4);
  }

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  BOOL v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  -[HUQuickControlCollectionView panGestureRecognizer](self, "panGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v7)
  {
    objc_msgSend(v8, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isDescendantOfView:", self);

    if (v11)
    {
      -[HUQuickControlCollectionView scrollGestureResolver](self, "scrollGestureResolver");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addConflictingGestureRecognizer:", v8);

      v13 = 1;
      goto LABEL_8;
    }
  }
  else
  {

  }
  if (objc_msgSend((id)+[HUQuickControlCollectionView superclass](HUQuickControlCollectionView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v15.receiver = self;
    v15.super_class = (Class)HUQuickControlCollectionView;
    v13 = -[HUQuickControlCollectionView gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:](&v15, sel_gestureRecognizer_shouldRecognizeSimultaneouslyWithGestureRecognizer_, v7, v8);
  }
  else
  {
    v13 = 0;
  }
LABEL_8:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  -[HUQuickControlCollectionView panGestureRecognizer](self, "panGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 != v7)
    goto LABEL_6;
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isDescendantOfView:", self) & 1) == 0)
  {

    v9 = v7;
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v8, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hu_isDescendantOfPickerView");

  if ((v12 & 1) != 0)
  {
    v13 = 1;
    goto LABEL_10;
  }
LABEL_7:
  if (objc_msgSend((id)+[HUQuickControlCollectionView superclass](HUQuickControlCollectionView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v15.receiver = self;
    v15.super_class = (Class)HUQuickControlCollectionView;
    v13 = -[HUQuickControlCollectionView gestureRecognizer:shouldRequireFailureOfGestureRecognizer:](&v15, sel_gestureRecognizer_shouldRequireFailureOfGestureRecognizer_, v7, v8);
  }
  else
  {
    v13 = 0;
  }
LABEL_10:

  return v13;
}

- (HUScrollGestureRecognitionResolver)scrollGestureResolver
{
  return self->_scrollGestureResolver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollGestureResolver, 0);
}

@end
