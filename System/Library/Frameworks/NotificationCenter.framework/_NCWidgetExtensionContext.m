@implementation _NCWidgetExtensionContext

- (_NCWidgetExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  _NCWidgetExtensionContext *v11;
  _NCWidgetExtensionContext *v12;
  _QWORD v14[4];
  _NCWidgetExtensionContext *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[3];
  char v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_NCWidgetExtensionContext;
  v11 = -[_NCWidgetExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](&v22, sel_initWithInputItems_listenerEndpoint_contextUUID_, v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    v11->_largestAvailableDisplayMode = -1;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v19 = 0;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __77___NCWidgetExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke;
    v14[3] = &unk_24DB74048;
    v16 = v20;
    v15 = v11;
    v17 = v18;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v20, 8);
  }

  return v12;
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  _QWORD *v13;
  _QWORD v14[3];
  char v15;

  v5 = a3;
  v6 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55___NCWidgetExtensionContext_openURL_completionHandler___block_invoke;
  block[3] = &unk_24DB74098;
  v12 = v6;
  v13 = v14;
  v11 = v5;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

  _Block_object_dispose(v14, 8);
}

- (CGSize)_maximumSizeForDisplayMode:(int64_t)a3
{
  int *v3;
  double *v4;
  double v5;
  double v6;
  CGSize result;

  v3 = &OBJC_IVAR____NCWidgetExtensionContext__maxCompactSize;
  if (a3 == 1)
    v3 = &OBJC_IVAR____NCWidgetExtensionContext__maxExpandedSize;
  v4 = (double *)((char *)self + *v3);
  v5 = *v4;
  v6 = v4[1];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)_setMaximumSize:(CGSize)a3 forDisplayMode:(int64_t)a4
{
  int *v4;

  if (a4)
  {
    if (a4 != 1)
      return;
    v4 = &OBJC_IVAR____NCWidgetExtensionContext__maxExpandedSize;
  }
  else
  {
    v4 = &OBJC_IVAR____NCWidgetExtensionContext__maxCompactSize;
  }
  *(CGSize *)((char *)&self->super.super.isa + *v4) = a3;
}

- (int64_t)widgetLargestAvailableDisplayMode
{
  if (self->_largestAvailableDisplayMode == -1)
    return 0;
  else
    return self->_largestAvailableDisplayMode;
}

- (void)setWidgetLargestAvailableDisplayMode:(int64_t)a3
{
  id v3;

  if (self->_largestAvailableDisplayMode != a3)
  {
    self->_largestAvailableDisplayMode = a3;
    -[_NCWidgetExtensionContext _hostViewController](self, "_hostViewController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_clientLargestSupportedDisplayModeDidChange");

  }
}

- (BOOL)widgetIsForeground
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  v3 = objc_msgSend(WeakRetained, "_visibilityState") == 1;

  return v3;
}

- (_NCWidgetViewController)_hostViewController
{
  return (_NCWidgetViewController *)objc_loadWeakRetained((id *)&self->_hostViewController);
}

- (void)_setHostViewController:(id)a3
{
  objc_storeWeak((id *)&self->_hostViewController, a3);
}

- (int64_t)_activeDisplayMode
{
  return self->_activeDisplayMode;
}

- (void)_setActiveDisplayMode:(int64_t)a3
{
  self->_activeDisplayMode = a3;
}

- (int64_t)_largestAvailableDisplayMode
{
  return self->_largestAvailableDisplayMode;
}

- (void)_setLargestAvailableDisplayMode:(int64_t)a3
{
  self->_largestAvailableDisplayMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostViewController);
}

@end
