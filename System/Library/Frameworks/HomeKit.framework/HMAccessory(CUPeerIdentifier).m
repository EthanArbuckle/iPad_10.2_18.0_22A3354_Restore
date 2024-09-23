@implementation HMAccessory(CUPeerIdentifier)

- (void)setPeerIdentifier:()CUPeerIdentifier
{
  NSUUID *v4;
  NSUUID *peerIdentifier;

  v4 = (NSUUID *)objc_msgSend(a3, "copy");
  peerIdentifier = self->_peerIdentifier;
  self->_peerIdentifier = v4;

}

@end
