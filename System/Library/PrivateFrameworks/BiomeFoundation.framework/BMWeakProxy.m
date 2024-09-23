@implementation BMWeakProxy

- (id)forwardingTargetForSelector:(SEL)a3
{
  return objc_loadWeakRetained(&self->_target);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

+ (id)weakProxyToObject:(id)a3
{
  id v3;
  BMWeakProxy *v4;

  v3 = a3;
  v4 = [BMWeakProxy alloc];
  objc_storeWeak(&v4->_target, v3);

  return v4;
}

@end
