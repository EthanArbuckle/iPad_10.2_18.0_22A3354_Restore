@implementation SUUIJSDOMFeatureCollection

- (void)setEditing:(BOOL)a3 :(id)a4
{
  _BOOL8 v4;
  SUUIJSDOMFeatureCollectionAppBridge **p_appBridge;
  id v6;
  id WeakRetained;

  v4 = a3;
  p_appBridge = &self->_appBridge;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_appBridge);
  objc_msgSend(WeakRetained, "setEditing:options:", v4, v6);

}

- (SUUIJSDOMFeatureCollectionAppBridge)appBridge
{
  return (SUUIJSDOMFeatureCollectionAppBridge *)objc_loadWeakRetained((id *)&self->_appBridge);
}

- (void)setAppBridge:(id)a3
{
  objc_storeWeak((id *)&self->_appBridge, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appBridge);
}

@end
