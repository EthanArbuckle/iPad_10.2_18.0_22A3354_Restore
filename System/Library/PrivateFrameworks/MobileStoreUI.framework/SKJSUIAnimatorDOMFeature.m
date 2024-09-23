@implementation SKJSUIAnimatorDOMFeature

- (SKJSUIAnimatorDOMFeature)initWithAppContext:(id)a3 DOMFeature:(id)a4
{
  id v6;
  SKJSUIAnimatorDOMFeature *v7;
  SKJSUIAnimatorDOMFeature *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SKJSUIAnimatorDOMFeature;
  v7 = -[IKJSObject initWithAppContext:](&v10, sel_initWithAppContext_, a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_feature, v6);

  return v8;
}

- (void)animate:(id)a3 :(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SKJSUIAnimatorDOMFeature_animate::__block_invoke;
  block[3] = &unk_2511F4798;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __37__SKJSUIAnimatorDOMFeature_animate::__block_invoke(_QWORD *a1)
{
  id WeakRetained;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v3 = objc_loadWeakRetained((id *)(a1[4] + 24));
    objc_msgSend(v4, "animatorFeature:performAnimationWithName:options:", v3, a1[5], a1[6]);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feature);
}

@end
