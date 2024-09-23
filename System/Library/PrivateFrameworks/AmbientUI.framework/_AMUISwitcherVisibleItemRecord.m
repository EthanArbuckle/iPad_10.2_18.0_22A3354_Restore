@implementation _AMUISwitcherVisibleItemRecord

- (id)item
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 6);
  return WeakRetained;
}

+ (id)recordWithItem:(uint64_t)a3 index:(void *)a4 forSwitcher:
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a2;
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithItem:index:forSwitcher:", v7, a3, v6);

  return v8;
}

- (id)viewController
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 8);
  return WeakRetained;
}

- (id)itemView
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 7);
  return WeakRetained;
}

- (void)setUnsettled:(void *)a1
{
  if (a1)
  {
    *((_BYTE *)a1 + 16) = (_BYTE)a2;
    return (void *)objc_msgSend(a1, "_updateAppearState");
  }
  return a1;
}

- (void)setPresentationProgress:(uint64_t)a1
{
  uint64_t v4;
  id v5;
  id WeakRetained;

  if (!a1)
    return;
  *(double *)(a1 + 24) = a2;
  if ((BSFloatIsZero() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    if ((BSFloatIsOne() & 1) == 0)
    {
      switch(*(_QWORD *)(a1 + 32))
      {
        case 0:
          if (BSFloatGreaterThanFloat())
            goto LABEL_14;
          break;
        case 1:
          if ((BSFloatGreaterThanFloat() & 1) != 0)
          {
LABEL_14:
            v4 = 2;
            goto LABEL_6;
          }
          break;
        case 2:
        case 3:
          if ((BSFloatLessThanFloat() & 1) != 0)
          {
            v4 = 1;
            goto LABEL_6;
          }
          break;
        default:
          goto LABEL_7;
      }
      goto LABEL_7;
    }
    v4 = 3;
  }
LABEL_6:
  *(_QWORD *)(a1 + 8) = v4;
  objc_msgSend((id)a1, "_updateAppearState");
LABEL_7:
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "switcher:updateItemForPresentationProgress:", v5, a2);

  }
}

- (uint64_t)appearState
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (void)sendCallbackForState:(uint64_t)a3 animated:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id WeakRetained;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v6 = objc_loadWeakRetained(a1 + 5);
    v7 = objc_loadWeakRetained(a1 + 8);
    switch(a2)
    {
      case 0:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "switcherItemDidDisappear:", v6);
        if (v7)
        {
          v8 = v6;
          v9 = v7;
          v10 = 0;
          goto LABEL_20;
        }
        break;
      case 1:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "switcherItemWillDisappear:", v6);
        if (v7)
        {
          v11 = v6;
          v12 = v7;
          v13 = 0;
          goto LABEL_15;
        }
        break;
      case 2:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "switcherItemWillAppear:", v6);
        if (v7)
        {
          v11 = v6;
          v12 = v7;
          v13 = 1;
LABEL_15:
          objc_msgSend(v11, "bs_beginAppearanceTransitionForChildViewController:toVisible:animated:", v12, v13, a3);
        }
        break;
      case 3:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "switcherItemDidAppear:", v6);
        if (v7)
        {
          v8 = v6;
          v9 = v7;
          v10 = 1;
LABEL_20:
          objc_msgSend(v8, "bs_endAppearanceTransitionForChildViewController:toVisible:", v9, v10);
        }
        break;
      default:
        break;
    }

  }
}

- (double)presentationProgress
{
  if (a1)
    return *(double *)(a1 + 24);
  else
    return 0.0;
}

- (void)setAppearState:(void *)a1
{
  if (a1)
  {
    *((_QWORD *)a1 + 1) = a2;
    return (void *)objc_msgSend(a1, "_updateAppearState");
  }
  return a1;
}

- (_AMUISwitcherVisibleItemRecord)initWithItem:(id)a3 index:(int64_t)a4 forSwitcher:(id)a5
{
  id v8;
  id v9;
  _AMUISwitcherVisibleItemRecord *v10;
  _AMUISwitcherVisibleItemRecord *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_AMUISwitcherVisibleItemRecord;
  v10 = -[_AMUISwitcherVisibleItemRecord init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_item, v8);
    objc_msgSend(v8, "itemView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v11->_itemView, v12);

    v11->_itemIndex = a4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "itemViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v11->_viewController, v13);

    }
    objc_storeWeak((id *)&v11->_switcher, v9);
    v11->_presentationProgress = 0.0;
    v11->_appearState = 0;
  }

  return v11;
}

- (id)switcher
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 5);
  return WeakRetained;
}

- (int64_t)_computeEffectiveAppearState
{
  int64_t nominalAppearState;

  nominalAppearState = 2;
  if (self->_nominalAppearState != 3)
    nominalAppearState = self->_nominalAppearState;
  if (self->_unsettled)
    return nominalAppearState;
  else
    return self->_nominalAppearState;
}

- (void)_updateAppearState
{
  int64_t v3;
  unint64_t appearState;
  BOOL v5;
  unint64_t v6;
  uint64_t v8;

  v3 = -[_AMUISwitcherVisibleItemRecord _computeEffectiveAppearState](self, "_computeEffectiveAppearState");
  appearState = self->_appearState;
  if (appearState != v3)
  {
    self->_appearState = v3;
    v5 = appearState >= 2;
    v6 = appearState - 2;
    if (v5)
    {
      if (v6 > 1 || v3 != 0)
        goto LABEL_13;
      v8 = 1;
    }
    else
    {
      if (v3 != 3)
      {
LABEL_13:
        -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:]((id *)&self->super.isa, self->_appearState, 1);
        return;
      }
      v8 = 2;
    }
    -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:]((id *)&self->super.isa, v8, 1);
    goto LABEL_13;
  }
}

- (BOOL)isUnsettled
{
  if (result)
    return *(_BYTE *)(result + 16) != 0;
  return result;
}

- (uint64_t)itemIndex
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_itemView);
  objc_destroyWeak((id *)&self->_item);
  objc_destroyWeak((id *)&self->_switcher);
}

@end
