@implementation _MFInvocationQOSOverride

- (_MFInvocationQOSOverride)initWithPthread:(_opaque_pthread_t *)a3 desiredQoS:(unsigned int)a4 lowPriority:(BOOL)a5
{
  _MFInvocationQOSOverride *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_MFInvocationQOSOverride;
  result = -[_MFInvocationQOSOverride init](&v9, sel_init);
  if (result)
  {
    result->_pthread = a3;
    result->_desiredQoS = a4;
    result->_lowPriority = a5;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[_MFInvocationQOSOverride removeOverride](self, "removeOverride");
  v3.receiver = self;
  v3.super_class = (Class)_MFInvocationQOSOverride;
  -[_MFInvocationQOSOverride dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  _opaque_pthread_t *v5;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = (_opaque_pthread_t *)objc_msgSend(a3, "pthread");
  return v5 == -[_MFInvocationQOSOverride pthread](self, "pthread");
}

- (void)applyOverrideWhileForeground:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (self->_override)
    goto LABEL_12;
  if (!-[_MFInvocationQOSOverride isLowPriority](self, "isLowPriority") || v3)
  {
    self->_override = pthread_override_qos_class_start_np(-[_MFInvocationQOSOverride pthread](self, "pthread"), (qos_class_t)-[_MFInvocationQOSOverride desiredQoS](self, "desiredQoS"), -12);
    return;
  }
  if (self->_override)
  {
LABEL_12:
    if (-[_MFInvocationQOSOverride isLowPriority](self, "isLowPriority"))
    {
      if (!v3)
        -[_MFInvocationQOSOverride removeOverride](self, "removeOverride");
    }
  }
}

- (BOOL)removeOverride
{
  pthread_override_s *override;

  override = self->_override;
  if (override)
  {
    pthread_override_qos_class_end_np(self->_override);
    self->_override = 0;
  }
  return override != 0;
}

- (BOOL)isLowPriority
{
  return self->_lowPriority;
}

- (unsigned)desiredQoS
{
  return self->_desiredQoS;
}

- (_opaque_pthread_t)pthread
{
  return self->_pthread;
}

@end
