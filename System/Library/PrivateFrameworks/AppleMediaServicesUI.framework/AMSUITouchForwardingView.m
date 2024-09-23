@implementation AMSUITouchForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  AMSUITouchForwardingView *v8;
  AMSUITouchForwardingView *v9;
  AMSUITouchForwardingView *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  y = a3.y;
  x = a3.x;
  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AMSUITouchForwardingView;
  -[AMSUITouchForwardingView hitTest:withEvent:](&v25, sel_hitTest_withEvent_, v7, x, y);
  v8 = (AMSUITouchForwardingView *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 == self)
  {
    -[AMSUITouchForwardingView passthroughViews](self, "passthroughViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      -[AMSUITouchForwardingView passthroughViews](self, "passthroughViews", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        while (2)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v16);
            if (v17)
            {
              -[AMSUITouchForwardingView convertPoint:toView:](self, "convertPoint:toView:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16), x, y);
              objc_msgSend(v17, "hitTest:withEvent:", v7);
              v18 = objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                v19 = (void *)v18;

                goto LABEL_16;
              }
            }
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          if (v14)
            continue;
          break;
        }
      }

    }
    v10 = self;
  }
  else
  {
    v10 = v8;
  }
  v19 = v10;
LABEL_16:

  return v19;
}

- (NSArray)passthroughViews
{
  return self->_passthroughViews;
}

- (void)setPassthroughViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passthroughViews, 0);
}

@end
