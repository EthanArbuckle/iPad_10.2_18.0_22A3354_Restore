@implementation MCPeerIDInternal

- (MCPeerIDInternal)initWithIDString:(id)a3 pid64:(unint64_t)a4 displayName:(id)a5
{
  MCPeerIDInternal *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MCPeerIDInternal;
  v8 = -[MCPeerIDInternal init](&v10, sel_init);
  if (v8)
  {
    v8->_idString = (NSString *)objc_msgSend(a3, "copy");
    v8->_pid64 = a4;
    v8->_displayName = (NSString *)objc_msgSend(a5, "copy");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCPeerIDInternal;
  -[MCPeerIDInternal dealloc](&v3, sel_dealloc);
}

- (NSString)idString
{
  return self->_idString;
}

- (unint64_t)pid64
{
  return self->_pid64;
}

- (NSString)displayName
{
  return self->_displayName;
}

@end
