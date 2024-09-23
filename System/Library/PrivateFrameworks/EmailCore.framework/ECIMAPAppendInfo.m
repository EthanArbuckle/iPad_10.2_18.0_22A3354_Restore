@implementation ECIMAPAppendInfo

- (unsigned)uidValidity
{
  return self->_uidValidity;
}

- (void)setUidValidity:(unsigned int)a3
{
  self->_uidValidity = a3;
}

- (unint64_t)newMessageUID
{
  return self->_newMessageUID;
}

- (void)setNewMessageUID:(unint64_t)a3
{
  self->_newMessageUID = a3;
}

@end
