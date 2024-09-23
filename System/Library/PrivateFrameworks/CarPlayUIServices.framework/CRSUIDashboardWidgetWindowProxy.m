@implementation CRSUIDashboardWidgetWindowProxy

- (CRSUIDashboardWidgetWindowProxy)initWithDelegate:(id)a3
{
  id v4;
  CRSUIDashboardWidgetWindowProxy *v5;
  CRSUIDashboardWidgetWindowProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRSUIDashboardWidgetWindowProxy;
  v5 = -[CRSUIDashboardWidgetWindowProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)hostFocusableItem:(id)a3 pressed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[CRSUIDashboardWidgetWindowProxy delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostFocusableItem:pressed:", v6, v4);

}

- (void)hostSelectedFocusableItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSUIDashboardWidgetWindowProxy delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostSelectedFocusableItem:", v4);

}

- (void)hostFocusableItem:(id)a3 focused:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[CRSUIDashboardWidgetWindowProxy delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostFocusableItem:focused:", v6, v4);

}

- (void)hostSetWidgetSizes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSUIDashboardWidgetWindowProxy delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostSetWidgetSizes:", v4);

}

- (void)hostSetUseSystemPrimaryFocusColor:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CRSUIDashboardWidgetWindowProxy delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostSetUseSystemPrimaryFocusColor:", v3);

}

- (CRSUIDashboardWidgetWindowClient)delegate
{
  return (CRSUIDashboardWidgetWindowClient *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
