@implementation AVOutputDeviceAuthorizedPeer

- (AVOutputDeviceAuthorizedPeer)init
{
  return -[AVOutputDeviceAuthorizedPeer initWithID:publicKey:hasAdministratorPrivileges:](self, "initWithID:publicKey:hasAdministratorPrivileges:", 0, 0, 0);
}

- (AVOutputDeviceAuthorizedPeer)initWithID:(id)a3 publicKey:(id)a4 hasAdministratorPrivileges:(BOOL)a5
{
  AVOutputDeviceAuthorizedPeer *v8;
  AVOutputDeviceAuthorizedPeerInternal *v9;
  AVOutputDeviceAuthorizedPeerInternal *ivars;
  AVOutputDeviceAuthorizedPeer *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVOutputDeviceAuthorizedPeer;
  v8 = -[AVOutputDeviceAuthorizedPeer init](&v13, sel_init);
  v9 = objc_alloc_init(AVOutputDeviceAuthorizedPeerInternal);
  v8->_ivars = v9;
  if (v9
    && (v8->_ivars->ID = (NSString *)objc_msgSend(a3, "copy")) != 0
    && (v8->_ivars->publicKey = (NSData *)objc_msgSend(a4, "copy"), ivars = v8->_ivars, ivars->publicKey))
  {
    ivars->isAdmin = a5;
    v11 = v8;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)dealloc
{
  AVOutputDeviceAuthorizedPeerInternal *ivars;
  objc_super v4;

  ivars = self->_ivars;
  if (ivars)
  {

    ivars = self->_ivars;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVOutputDeviceAuthorizedPeer;
  -[AVOutputDeviceAuthorizedPeer dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend((id)objc_msgSend(a3, "peerID"), "isEqualToString:", -[AVOutputDeviceAuthorizedPeer peerID](self, "peerID"));
    if (v5)
    {
      v5 = objc_msgSend((id)objc_msgSend(a3, "publicKey"), "isEqualToData:", -[AVOutputDeviceAuthorizedPeer publicKey](self, "publicKey"));
      if (v5)
      {
        v6 = objc_msgSend(a3, "hasAdministratorPrivileges");
        LOBYTE(v5) = v6 ^ -[AVOutputDeviceAuthorizedPeer hasAdministratorPrivileges](self, "hasAdministratorPrivileges") ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](-[AVOutputDeviceAuthorizedPeer peerID](self, "peerID"), "hash");
  v4 = -[NSData hash](-[AVOutputDeviceAuthorizedPeer publicKey](self, "publicKey"), "hash") ^ v3;
  return v4 ^ -[AVOutputDeviceAuthorizedPeer hasAdministratorPrivileges](self, "hasAdministratorPrivileges");
}

- (NSString)peerID
{
  return self->_ivars->ID;
}

- (NSData)publicKey
{
  return self->_ivars->publicKey;
}

- (BOOL)hasAdministratorPrivileges
{
  return self->_ivars->isAdmin;
}

@end
