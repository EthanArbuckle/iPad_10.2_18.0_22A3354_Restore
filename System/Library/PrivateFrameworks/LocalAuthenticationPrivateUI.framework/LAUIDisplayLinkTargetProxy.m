@implementation LAUIDisplayLinkTargetProxy

- (LAUIDisplayLinkTargetProxy)init
{

  return 0;
}

- (id)initWithTarget:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)LAUIDisplayLinkTargetProxy;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 1, v3);
  }

  return a1;
}

- (void)drawWithDisplayLink:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  v5 = WeakRetained;
  if (WeakRetained)
    -[LAUIRenderLoop _drawWithDisplayLink:]((uint64_t)WeakRetained, v6);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
