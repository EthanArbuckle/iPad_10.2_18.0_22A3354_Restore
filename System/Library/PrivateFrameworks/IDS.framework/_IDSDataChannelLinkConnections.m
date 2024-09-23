@implementation _IDSDataChannelLinkConnections

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_IDSDataChannelLinkConnections udp](self, "udp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDataChannelLinkConnections qpod](self, "qpod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<_IDSDataChannelLinkConnections\n    udp: %@\n    qpod: %@\n>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isQUICPod
{
  void *v3;
  void *v4;
  char v5;

  -[_IDSDataChannelLinkConnections qpod](self, "qpod");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_IDSDataChannelLinkConnections qpod](self, "qpod");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowOutgoing");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_IDSDataChannelLinkConnection)udp
{
  return (_IDSDataChannelLinkConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUdp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_IDSDataChannelLinkConnection)qpod
{
  return (_IDSDataChannelLinkConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQpod:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qpod, 0);
  objc_storeStrong((id *)&self->_udp, 0);
}

@end
