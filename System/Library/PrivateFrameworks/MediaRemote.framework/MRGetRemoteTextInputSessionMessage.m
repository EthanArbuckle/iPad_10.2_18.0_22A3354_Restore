@implementation MRGetRemoteTextInputSessionMessage

- (MRGetRemoteTextInputSessionMessage)init
{
  MRGetRemoteTextInputSessionMessage *v2;
  _MRGetRemoteTextInputSessionProtobuf *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRGetRemoteTextInputSessionMessage;
  v2 = -[MRProtocolMessage init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_MRGetRemoteTextInputSessionProtobuf);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v2, "setUnderlyingCodableMessage:", v3);

  }
  return v2;
}

- (unint64_t)type
{
  return 68;
}

@end
