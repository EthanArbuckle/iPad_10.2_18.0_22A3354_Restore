@implementation CKEditableCollectionView

- (CKEditableCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKEditableCollectionView;
  return -[CKEditableCollectionView initWithFrame:collectionViewLayout:](&v5, sel_initWithFrame_collectionViewLayout_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  objc_super v10;

  v4 = self;
  v10.receiver = self;
  v10.super_class = (Class)CKEditableCollectionView;
  -[CKEditableCollectionView dequeueReusableCellWithReuseIdentifier:forIndexPath:](&v10, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "forceMinTranscriptMarginInsets");
    if (v8)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "minTranscriptMarginInsets");
    }
    else
    {
      objc_msgSend(v4, "marginInsets");
    }
    objc_msgSend(v6, "setMarginInsets:");
    if (v8)

  }
  return v5;
}

- (void)_ck_setEditing:(BOOL)a3
{
  -[CKEditableCollectionView _ck_setEditing:animated:](self, "_ck_setEditing:animated:", a3, 0);
}

- (void)_ck_setEditing:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;
  BOOL v12;
  _QWORD v13[5];

  if (self->__ck_editing != a3)
  {
    self->__ck_editing = a3;
    v7 = MEMORY[0x1E0C809B0];
    if (!a3)
    {
      -[CKEditableCollectionView indexPathsForSelectedItems](self, "indexPathsForSelectedItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __52__CKEditableCollectionView__ck_setEditing_animated___block_invoke;
      v13[3] = &unk_1E2756700;
      v13[4] = self;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

    }
    -[CKEditableCollectionView indexPathsForVisibleItems](self, "indexPathsForVisibleItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __52__CKEditableCollectionView__ck_setEditing_animated___block_invoke_2;
    v10[3] = &unk_1E2756728;
    v10[4] = self;
    v11 = a3;
    v12 = a4;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

  }
}

uint64_t __52__CKEditableCollectionView__ck_setEditing_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deselectItemAtIndexPath:animated:", a2, 0);
}

void __52__CKEditableCollectionView__ck_setEditing_animated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "_ck_setEditing:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));

}

- (UIEdgeInsets)safeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  UIEdgeInsets result;

  v29.receiver = self;
  v29.super_class = (Class)CKEditableCollectionView;
  -[CKEditableCollectionView safeAreaInsets](&v29, sel_safeAreaInsets);
  v6 = v3;
  v8 = v7;
  v9 = v4;
  v10 = v5;
  if (v7 == *(double *)(MEMORY[0x1E0CEB4B0] + 8)
    && v3 == *MEMORY[0x1E0CEB4B0]
    && v5 == *(double *)(MEMORY[0x1E0CEB4B0] + 24)
    && v4 == *(double *)(MEMORY[0x1E0CEB4B0] + 16))
  {
    -[CKEditableCollectionView initialSafeAreaInsets](self, "initialSafeAreaInsets");
    v6 = v14;
    v8 = v15;
    v9 = v16;
    v10 = v17;
  }
  if (v8 > 0.0 || v10 > 0.0)
  {
    -[CKEditableCollectionView window](self, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "windowScene");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 && (unint64_t)(objc_msgSend(v19, "interfaceOrientation") - 3) <= 1)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "landscapeKeyboardInsets");
      v22 = v21;
      v24 = v23;

      if (v8 > 0.0)
        v8 = v22;
      if (v10 > 0.0)
        v10 = v24;
    }

  }
  v25 = v6;
  v26 = v8;
  v27 = v9;
  v28 = v10;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_marginInsets.top;
  left = self->_marginInsets.left;
  bottom = self->_marginInsets.bottom;
  right = self->_marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

- (UIEdgeInsets)initialSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_initialSafeAreaInsets.top;
  left = self->_initialSafeAreaInsets.left;
  bottom = self->_initialSafeAreaInsets.bottom;
  right = self->_initialSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setInitialSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_initialSafeAreaInsets = a3;
}

- (BOOL)_ck_isEditing
{
  return self->__ck_editing;
}

@end
