@implementation WKAnimationDelegate

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)animationDidStart:(id)a3
{
  WTF::MonotonicTime *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (self->_layerTreeHost)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("WKPlatformCAAnimationExplicitBeginTimeFlag")), "BOOLValue"))v6 = CACurrentMediaTime();
    else
      v5 = (WTF::MonotonicTime *)objc_msgSend(a3, "beginTime");
    v7 = v6;
    WTF::MonotonicTime::now(v5);
    v9 = v7 - CACurrentMediaTime() + v8;
    WebKit::RemoteLayerTreeHost::animationDidStart((uint64_t *)self->_layerTreeHost, (uint64_t *)self->_layerID.m_object.m_identifier, self->_layerID.m_processIdentifier.m_identifier, (uint64_t)a3, v9);
  }
}

- (WKAnimationDelegate)initWithLayerID:()ProcessQualified<WTF:()WTF:(unsigned long long>>)a3 :(void *)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType layerTreeHost:
{
  unint64_t m_identifier;
  unint64_t v6;
  WKAnimationDelegate *result;
  objc_super v8;

  m_identifier = a3.m_processIdentifier.m_identifier;
  v6 = a3.m_object.m_identifier;
  v8.receiver = self;
  v8.super_class = (Class)WKAnimationDelegate;
  result = -[WKAnimationDelegate init](&v8, sel_init);
  if (result)
  {
    result->_layerID.m_object.m_identifier = v6;
    result->_layerID.m_processIdentifier.m_identifier = m_identifier;
    result->_layerTreeHost = a4;
  }
  return result;
}

- (void)invalidate
{
  self->_layerTreeHost = 0;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  uint64_t *layerTreeHost;

  layerTreeHost = (uint64_t *)self->_layerTreeHost;
  if (layerTreeHost)
    WebKit::RemoteLayerTreeHost::animationDidEnd(layerTreeHost, (uint64_t *)self->_layerID.m_object.m_identifier, self->_layerID.m_processIdentifier.m_identifier, (uint64_t)a3);
}

@end
