@implementation _MTLFXEffect

- (_MTLFXEffect)init
{
  _MTLFXEffect *result;
  unint64_t v3;
  unint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_MTLFXEffect;
  result = -[_MTLFXEffect init](&v5, sel_init);
  do
  {
    v3 = __ldxr(&_MTLFXNextScalerID);
    v4 = v3 + 1;
  }
  while (__stxr(v4, &_MTLFXNextScalerID));
  result->_effectID = v4;
  return result;
}

- (void)_beginEncode
{
  ++self->_encodeID;
}

- (void)_didCreateRenderCommandEncoder:(id)a3 forEncode:(unint64_t)a4
{
  MTLFXEffectTracingDelegate **p_tracingDelegate;
  id v7;
  id WeakRetained;

  p_tracingDelegate = &self->_tracingDelegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_tracingDelegate);
  objc_msgSend(WeakRetained, "scaler:didCreateRenderCommandEncoder:forEncode:", self, v7, a4);

}

- (void)_didCreateBlitCommandEncoder:(id)a3 forEncode:(unint64_t)a4
{
  MTLFXEffectTracingDelegate **p_tracingDelegate;
  id v7;
  id WeakRetained;

  p_tracingDelegate = &self->_tracingDelegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_tracingDelegate);
  objc_msgSend(WeakRetained, "scaler:didCreateBlitCommandEncoder:forEncode:", self, v7, a4);

}

- (void)_didCreateComputeCommandEncoder:(id)a3 forEncode:(unint64_t)a4
{
  MTLFXEffectTracingDelegate **p_tracingDelegate;
  id v7;
  id WeakRetained;

  p_tracingDelegate = &self->_tracingDelegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_tracingDelegate);
  objc_msgSend(WeakRetained, "scaler:didCreateComputeCommandEncoder:forEncode:", self, v7, a4);

}

- (unint64_t)effectID
{
  return self->_effectID;
}

- (MTLFXEffectTracingDelegate)tracingDelegate
{
  return (MTLFXEffectTracingDelegate *)objc_loadWeakRetained((id *)&self->_tracingDelegate);
}

- (void)setTracingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_tracingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tracingDelegate);
}

@end
