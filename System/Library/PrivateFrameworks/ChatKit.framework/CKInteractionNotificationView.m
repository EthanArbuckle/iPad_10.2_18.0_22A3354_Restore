@implementation CKInteractionNotificationView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  CKInteractionNotificationView *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  y = a3.y;
  x = a3.x;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CKInteractionNotificationView;
  -[CKInteractionNotificationView hitTest:withEvent:](&v21, sel_hitTest_withEvent_, v7, x, y);
  v8 = (CKInteractionNotificationView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    if (!objc_msgSend(v7, "type"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[CKInteractionNotificationView passthroughViews](self, "passthroughViews", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
            objc_msgSend(v14, "hitTest:withEvent:", v7);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {

              self = 0;
              goto LABEL_14;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
          if (v11)
            continue;
          break;
        }
      }

      if (!self)
      {
        v8 = 0;
        goto LABEL_16;
      }
      -[CKInteractionNotificationView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "interactionNotificationViewWasTapped:", self);
LABEL_14:

    }
    v8 = self;
  }
LABEL_16:

  return 0;
}

- (CKInteractionNotificationViewDelegate)delegate
{
  return (CKInteractionNotificationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)passthroughViews
{
  return self->_passthroughViews;
}

- (void)setPassthroughViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passthroughViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
