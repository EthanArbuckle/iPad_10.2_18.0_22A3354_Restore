@implementation IDSTransportScoreCard

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(IDSTransportScoreCard);
  *((_QWORD *)result + 1) = self->score;
  *((_QWORD *)result + 2) = self->stunTransport;
  *((_QWORD *)result + 3) = self->transportInterface;
  *((_DWORD *)result + 8) = self->interfaceIndex;
  *((_BYTE *)result + 36) = self->alreadySelected;
  *((_BYTE *)result + 37) = self->isIPv6;
  return result;
}

@end
