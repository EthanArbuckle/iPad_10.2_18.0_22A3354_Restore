@implementation BLSHAssertionProxy

- (BLSHAssertionProxy)initWithIdentifier:(id)a3 descriptor:(id)a4 remoteTarget:(id)a5
{
  id v9;
  id v10;
  id v11;
  BLSHAssertionProxy *v12;
  BLSHAssertionProxy *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSHAssertionProxy;
  v12 = -[BLSHAssertionProxy init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_descriptor, a4);
    objc_storeStrong((id *)&v13->_remoteTarget, a5);
    v13->_valid = 1;
  }

  return v13;
}

- (os_unfair_lock_s)isValid
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = (os_unfair_lock_s *)(LOBYTE(v1[3]._os_unfair_lock_opaque) != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_valid = 0;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isAcquired
{
  BLSHAssertionProxy *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_acquired;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)acquisitionState
{
  if (-[BLSHAssertionProxy isAcquired](self, "isAcquired"))
    return 2;
  else
    return 0;
}

- (void)serviceDidAcquire
{
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self))
  {
    if (self)
    {
      os_unfair_lock_lock(&self->_lock);
      self->_acquired = 1;
      os_unfair_lock_unlock(&self->_lock);
    }
    -[BLSXPCAssertionServiceClientInterface assertionAcquired:](self->_remoteTarget, "assertionAcquired:", self->_identifier);
  }
}

- (void)serviceFailedToAcquireWithError:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self))
    -[BLSXPCAssertionServiceClientInterface assertion:failedToAcquireWithError:](self->_remoteTarget, "assertion:failedToAcquireWithError:", self->_identifier, v4);

}

- (void)serviceWillCancel
{
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self))
    -[BLSXPCAssertionServiceClientInterface assertionWillCancel:](self->_remoteTarget, "assertionWillCancel:", self->_identifier);
}

- (void)serviceDidCancelWithError:(id)a3
{
  id v4;

  v4 = a3;
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self))
  {
    if (self)
    {
      os_unfair_lock_lock(&self->_lock);
      self->_acquired = 0;
      os_unfair_lock_unlock(&self->_lock);
    }
    -[BLSXPCAssertionServiceClientInterface assertionDidCancel:withError:](self->_remoteTarget, "assertionDidCancel:withError:", self->_identifier, v4);
  }

}

- (void)serviceDidPause
{
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self))
    -[BLSXPCAssertionServiceClientInterface assertionPaused:](self->_remoteTarget, "assertionPaused:", self->_identifier);
}

- (void)serviceDidResume
{
  if (-[BLSHAssertionProxy isValid]((os_unfair_lock_s *)self))
    -[BLSXPCAssertionServiceClientInterface assertionResumed:](self->_remoteTarget, "assertionResumed:", self->_identifier);
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", self->_acquired, CFSTR("isAcquired"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_descriptor, CFSTR("descriptor"));
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", self->_remoteTarget, CFSTR("remoteTarget"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BLSAssertionIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BLSAssertionDescriptor)descriptor
{
  return self->_descriptor;
}

- (BLSXPCAssertionServiceClientInterface)remoteTarget
{
  return self->_remoteTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTarget, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
