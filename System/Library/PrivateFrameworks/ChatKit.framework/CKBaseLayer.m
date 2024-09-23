@implementation CKBaseLayer

- (void)setCkLayerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_ckLayerDelegate, a3);
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKBaseLayer;
  -[CKBaseLayer layerDidBecomeVisible:](&v6, sel_layerDidBecomeVisible_);
  -[CKBaseLayer ckLayerDelegate](self, "ckLayerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ckLayerDidBecomeVisible:", v3);

}

- (CKLayerDelegate)ckLayerDelegate
{
  return (CKLayerDelegate *)objc_loadWeakRetained((id *)&self->_ckLayerDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ckLayerDelegate);
}

@end
