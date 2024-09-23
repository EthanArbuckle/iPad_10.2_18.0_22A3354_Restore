@implementation IKAppBrowserBridge

+ (id)makeFeatureJSObjectForFeature:(id)a3
{
  id v3;
  char isKindOfClass;
  IKJSBrowser *v5;
  id v6;
  IKJSBrowser *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    v6 = v3;
    v7 = [IKJSBrowser alloc];
    objc_msgSend(v6, "appContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[IKJSObject initWithAppContext:](v7, "initWithAppContext:", v8);

    -[IKJSBrowser setBridge:](v5, "setBridge:", v6);
  }

  return v5;
}

- (IKAppBrowserBridge)initWithDOMNode:(id)a3 featureName:(id)a4
{
  id v6;
  id v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IKAppBrowserBridge;
  v8 = -[IKAppBrowserBridge init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "appContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)v8 + 3, v9);

    v10 = objc_msgSend(v7, "copy");
    v11 = (void *)*((_QWORD *)v8 + 4);
    *((_QWORD *)v8 + 4) = v10;

    *(_OWORD *)(v8 + 8) = xmmword_1D96A79E0;
    *((_OWORD *)v8 + 3) = xmmword_1D96A79F0;
    *((_OWORD *)v8 + 4) = xmmword_1D96A7A00;
  }

  return (IKAppBrowserBridge *)v8;
}

- (void)present
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  -[IKAppBrowserBridge appBrowser](self, "appBrowser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKAppBrowserBridge cornerRadius](self, "cornerRadius");
  v5 = v4;
  -[IKAppBrowserBridge interitemSpacing](self, "interitemSpacing");
  v7 = v6;
  -[IKAppBrowserBridge maskInset](self, "maskInset");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[IKAppBrowserBridge appContext](self, "appContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __29__IKAppBrowserBridge_present__block_invoke;
  v18[3] = &unk_1E9F4C088;
  v19 = v3;
  v20 = v5;
  v21 = v7;
  v22 = v9;
  v23 = v11;
  v24 = v13;
  v25 = v15;
  v17 = v3;
  objc_msgSend(v16, "evaluateDelegateBlockSync:", v18);

}

uint64_t __29__IKAppBrowserBridge_present__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCornerRadius:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setInteritemSpacing:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setMaskInset:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 32), "present");
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (UIEdgeInsets)maskInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_maskInset.top;
  left = self->_maskInset.left;
  bottom = self->_maskInset.bottom;
  right = self->_maskInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMaskInset:(UIEdgeInsets)a3
{
  self->_maskInset = a3;
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (IKAppBrowser)appBrowser
{
  return (IKAppBrowser *)objc_loadWeakRetained((id *)&self->_appBrowser);
}

- (void)setAppBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_appBrowser, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appBrowser);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

@end
