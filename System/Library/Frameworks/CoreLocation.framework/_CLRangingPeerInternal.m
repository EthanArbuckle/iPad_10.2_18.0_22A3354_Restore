@implementation _CLRangingPeerInternal

- (_CLRangingPeerInternal)initWithMacAddressAsUInt:(unint64_t)a3 secureRangingKeyID:(id)a4
{
  _CLRangingPeerInternal *v6;
  _CLRangingPeerInternal *v7;
  NSData *secureRangingKeyID;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_CLRangingPeerInternal;
  v6 = -[_CLRangingPeerInternal init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_macAddress = a3;
    secureRangingKeyID = v6->_secureRangingKeyID;
    if (secureRangingKeyID != a4)
    {

      v7->_secureRangingKeyID = (NSData *)objc_msgSend_copy(a4, v9, v10, v11);
    }
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_secureRangingKeyID = 0;
  v3.receiver = self;
  v3.super_class = (Class)_CLRangingPeerInternal;
  -[_CLRangingPeerInternal dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)objc_msgSend_initWithMacAddressAsUInt_secureRangingKeyID_(v8, v9, self->_macAddress, (uint64_t)self->_secureRangingKeyID);
}

@end
