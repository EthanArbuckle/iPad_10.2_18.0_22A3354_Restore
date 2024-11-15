@implementation JFXCustomRenderProperties

+ (id)newCustomRenderProperties:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = (void *)v8[2];
  v8[2] = v6;
  v10 = v6;

  v11 = (void *)v8[3];
  v8[3] = v7;

  *((_BYTE *)v8 + 8) = 0;
  return v8;
}

- (PVCompositeDelegate)renderingDelegate
{
  return self->_renderingDelegate;
}

- (id)metadata
{
  return self->_metadata;
}

- (BOOL)animojiTapPoint
{
  return self->_animojiTapPoint;
}

- (void)setAnimojiTapPoint:(BOOL)a3
{
  self->_animojiTapPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_metadata, 0);
  objc_storeStrong((id *)&self->_renderingDelegate, 0);
}

@end
