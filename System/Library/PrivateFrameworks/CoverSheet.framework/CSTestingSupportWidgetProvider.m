@implementation CSTestingSupportWidgetProvider

- (CSTestingSupportWidgetProvider)init
{
  CSTestingSupportWidgetProvider *v2;
  WGWidgetDiscoveryController *v3;
  WGWidgetDiscoveryController *widgetDiscoveryController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSTestingSupportWidgetProvider;
  v2 = -[CSTestingSupportWidgetProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = (WGWidgetDiscoveryController *)objc_alloc_init(MEMORY[0x1E0DD9AD0]);
    widgetDiscoveryController = v2->_widgetDiscoveryController;
    v2->_widgetDiscoveryController = v3;

    -[WGWidgetDiscoveryController setDelegate:](v2->_widgetDiscoveryController, "setDelegate:", v2);
    -[WGWidgetDiscoveryController beginDiscovery](v2->_widgetDiscoveryController, "beginDiscovery");
  }
  return v2;
}

- (id)newWidgetGroupViewControllerWithSettings:(WGWidgetListSettings)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9AD8]), "initWithWidgetDiscoveryController:listSettings:", self->_widgetDiscoveryController, a3.var0, *(_QWORD *)&a3.var1);
}

- (id)newWidgetListViewControllerWithSettings:(WGWidgetListSettings)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9AC8]), "initWithWidgetDiscoveryController:", self->_widgetDiscoveryController);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetDiscoveryController, 0);
}

@end
