@implementation CUHomeKitFindPairedPeerContext

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (CUPairedPeer)pairedPeer
{
  return self->_pairedPeer;
}

- (void)setPairedPeer:(id)a3
{
  objc_storeStrong((id *)&self->_pairedPeer, a3);
}

- (BOOL)triedAccessory
{
  return self->_triedAccessory;
}

- (void)setTriedAccessory:(BOOL)a3
{
  self->_triedAccessory = a3;
}

- (BOOL)triedHAP
{
  return self->_triedHAP;
}

- (void)setTriedHAP:(BOOL)a3
{
  self->_triedHAP = a3;
}

- (BOOL)triedHomeRepairFlow
{
  return self->_triedHomeRepairFlow;
}

- (void)setTriedHomeRepairFlow:(BOOL)a3
{
  self->_triedHomeRepairFlow = a3;
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
}

- (NSArray)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
  objc_storeStrong((id *)&self->_users, a3);
}

- (unint64_t)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(unint64_t)a3
{
  self->_userIndex = a3;
}

- (unint64_t)userCount
{
  return self->_userCount;
}

- (void)setUserCount:(unint64_t)a3
{
  self->_userCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_pairedPeer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
