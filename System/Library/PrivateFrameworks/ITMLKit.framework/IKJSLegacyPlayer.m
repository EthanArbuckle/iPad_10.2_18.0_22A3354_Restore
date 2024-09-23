@implementation IKJSLegacyPlayer

- (id)asPrivateIKJSLegacyPlayer
{
  IKJSLegacyPlayer *v3;

  if (-[IKJSLegacyPlayer conformsToProtocol:](self, "conformsToProtocol:", &unk_1F01F3538))
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (IKDOMElement)currentAVMediaElement
{
  void *v3;
  void *v4;

  -[IKJSLegacyPlayer appBridge](self, "appBridge");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAVMediaElementForPlayer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (IKDOMElement *)v4;
}

- (IKJSPlayerAppBridge)appBridge
{
  return (IKJSPlayerAppBridge *)objc_loadWeakRetained((id *)&self->_appBridge);
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
