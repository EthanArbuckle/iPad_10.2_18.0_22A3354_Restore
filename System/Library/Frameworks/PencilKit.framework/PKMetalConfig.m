@implementation PKMetalConfig

- (_BYTE)initWithPrivateResourceHandler:(_BYTE *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)PKMetalConfig;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      result[8] = a2;
  }
  return result;
}

- (PKMetalConfig)init
{
  objc_super v2;

  if (self)
  {
    v2.receiver = self;
    v2.super_class = (Class)PKMetalConfig;
    self = -[PKMetalConfig init](&v2, sel_init);
    if (self)
      self->_privateResourceHandler = 0;
  }
  return self;
}

- (id)device
{
  id v1;
  uint64_t v2;
  void *v3;

  if (a1)
  {
    v1 = a1;
    os_unfair_lock_lock((os_unfair_lock_t)&lock);
    if (!*((_QWORD *)v1 + 4))
    {
      +[PKMetalUtility defaultDevice](PKMetalUtility, "defaultDevice");
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)*((_QWORD *)v1 + 4);
      *((_QWORD *)v1 + 4) = v2;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    a1 = *((id *)v1 + 4);
  }
  return a1;
}

- (id)renderQueue
{
  id v1;
  NSObject *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;

  if (a1)
  {
    v1 = a1;
    os_unfair_lock_lock((os_unfair_lock_t)&lock);
    if (!*((_QWORD *)v1 + 3))
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_USER_INTERACTIVE, 0);
      v3 = objc_claimAutoreleasedReturnValue();

      v4 = dispatch_queue_create("com.apple.pencilkit.renderer", v3);
      v5 = (void *)*((_QWORD *)v1 + 3);
      *((_QWORD *)v1 + 3) = v4;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    a1 = *((id *)v1 + 3);
  }
  return a1;
}

- (id)resourceHandler
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    -[PKMetalConfig device](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&lock);
    if (!*((_QWORD *)v1 + 2))
    {
      if (*((_BYTE *)v1 + 8))
      {
        v3 = (uint64_t)-[PKMetalResourceHandler initWithDevice:]([PKMetalResourceHandler alloc], v2);
      }
      else
      {
        +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v2);
        v3 = objc_claimAutoreleasedReturnValue();
      }
      v4 = (void *)*((_QWORD *)v1 + 2);
      *((_QWORD *)v1 + 2) = v3;

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    v1 = *((id *)v1 + 2);

  }
  return v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_renderQueue, 0);
  objc_storeStrong((id *)&self->_resourceHandler, 0);
}

@end
