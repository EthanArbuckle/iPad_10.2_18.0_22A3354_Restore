@implementation _IDSDataChannelLinkConnection

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_IDSDataChannelLinkConnection type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_IDSDataChannelLinkConnection clientNWConnectionID](self, "clientNWConnectionID");
  -[_IDSDataChannelLinkConnection protocolStack](self, "protocolStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IDSDataChannelLinkConnection childConnectionID](self, "childConnectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_IDSDataChannelLinkConnection allowOutgoing](self, "allowOutgoing");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<_IDSDataChannelLinkConnection %@ [C%llu] %@ — childConnectionID:%@ allowOutgoing:%@>"), v4, v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSUUID)childConnectionID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChildConnectionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)protocolStack
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProtocolStack:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)nwConnectionID
{
  return self->_nwConnectionID;
}

- (void)setNwConnectionID:(unint64_t)a3
{
  self->_nwConnectionID = a3;
}

- (unint64_t)clientNWConnectionID
{
  return self->_clientNWConnectionID;
}

- (void)setClientNWConnectionID:(unint64_t)a3
{
  self->_clientNWConnectionID = a3;
}

- (NSString)nwConnectionToken
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNwConnectionToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)allowOutgoing
{
  return self->_allowOutgoing;
}

- (void)setAllowOutgoing:(BOOL)a3
{
  self->_allowOutgoing = a3;
}

- (BOOL)isQUICPod
{
  return self->_isQUICPod;
}

- (void)setIsQUICPod:(BOOL)a3
{
  self->_isQUICPod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwConnectionToken, 0);
  objc_storeStrong((id *)&self->_protocolStack, 0);
  objc_storeStrong((id *)&self->_childConnectionID, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
