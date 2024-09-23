@implementation CATRemoteConnectionSocketOptions

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_opt_new();
  if (v4)
  {
    -[CATRemoteConnectionSocketOptions adaptiveWriteTimeout](self, "adaptiveWriteTimeout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAdaptiveWriteTimeout:", v5);

    -[CATRemoteConnectionSocketOptions keepAliveEnabled](self, "keepAliveEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeepAliveEnabled:", v6);

    -[CATRemoteConnectionSocketOptions keepAliveDelay](self, "keepAliveDelay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeepAliveDelay:", v7);

    -[CATRemoteConnectionSocketOptions keepAliveInterval](self, "keepAliveInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeepAliveInterval:", v8);

    -[CATRemoteConnectionSocketOptions keepAliveCount](self, "keepAliveCount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeepAliveCount:", v9);

    -[CATRemoteConnectionSocketOptions netServiceType](self, "netServiceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNetServiceType:", v10);

  }
  return v4;
}

- (NSNumber)adaptiveWriteTimeout
{
  return self->_adaptiveWriteTimeout;
}

- (void)setAdaptiveWriteTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)keepAliveEnabled
{
  return self->_keepAliveEnabled;
}

- (void)setKeepAliveEnabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)keepAliveDelay
{
  return self->_keepAliveDelay;
}

- (void)setKeepAliveDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)keepAliveInterval
{
  return self->_keepAliveInterval;
}

- (void)setKeepAliveInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)keepAliveCount
{
  return self->_keepAliveCount;
}

- (void)setKeepAliveCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)netServiceType
{
  return self->_netServiceType;
}

- (void)setNetServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netServiceType, 0);
  objc_storeStrong((id *)&self->_keepAliveCount, 0);
  objc_storeStrong((id *)&self->_keepAliveInterval, 0);
  objc_storeStrong((id *)&self->_keepAliveDelay, 0);
  objc_storeStrong((id *)&self->_keepAliveEnabled, 0);
  objc_storeStrong((id *)&self->_adaptiveWriteTimeout, 0);
}

@end
