@implementation IKDOMHTMLCollection

- (IKDOMHTMLCollection)initWithAppContext:(id)a3 node:(id)a4
{
  id v6;
  id v7;
  IKDOMHTMLCollection *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IKDOMHTMLCollection;
  v8 = -[IKJSObject initWithAppContext:](&v13, sel_initWithAppContext_, v6);
  if (v8)
  {
    objc_msgSend(v6, "jsContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "virtualMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "managedSelf");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addManagedReference:withOwner:", v11, v8);

    objc_storeWeak((id *)&v8->_parentNode, v7);
  }

  return v8;
}

- (unint64_t)length
{
  id WeakRetained;
  unint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentNode);
  v3 = objc_msgSend(WeakRetained, "childElementCount");

  return v3;
}

- (id)item:(unint64_t)a3
{
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentNode);
  v6 = objc_msgSend(WeakRetained, "nodePtr");

  if (v6)
  {
    v7 = *(_QWORD *)(v6 + 24);
    if (v7)
    {
      v8 = 0;
      do
      {
        if (*(_DWORD *)(v7 + 8) == 1)
        {
          if (v8 == a3)
          {
            -[IKJSObject appContext](self, "appContext");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            +[IKDOMNode nodeWithAppContext:nodePtr:](IKDOMNode, "nodeWithAppContext:nodePtr:", v11, v7);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            return v9;
          }
          ++v8;
        }
        v7 = *(_QWORD *)(v7 + 48);
      }
      while (v7);
    }
  }
  v9 = 0;
  return v9;
}

- (IKDOMNode)parentNode
{
  return (IKDOMNode *)objc_loadWeakRetained((id *)&self->_parentNode);
}

- (void)setParentNode:(id)a3
{
  objc_storeWeak((id *)&self->_parentNode, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentNode);
}

@end
