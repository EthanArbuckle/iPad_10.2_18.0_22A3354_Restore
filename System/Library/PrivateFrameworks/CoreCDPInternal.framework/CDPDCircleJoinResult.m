@implementation CDPDCircleJoinResult

- (BOOL)didJoin
{
  return self->_didJoin;
}

- (void)setDidJoin:(BOOL)a3
{
  self->_didJoin = a3;
}

- (BOOL)needsBackupRecovery
{
  return self->_needsBackupRecovery;
}

- (void)setNeedsBackupRecovery:(BOOL)a3
{
  self->_needsBackupRecovery = a3;
}

- (BOOL)hasPeersForRemoteApproval
{
  return self->_hasPeersForRemoteApproval;
}

- (void)setHasPeersForRemoteApproval:(BOOL)a3
{
  self->_hasPeersForRemoteApproval = a3;
}

- (BOOL)hasPeersWithCDPBackupRecords
{
  return self->_hasPeersWithCDPBackupRecords;
}

- (void)setHasPeersWithCDPBackupRecords:(BOOL)a3
{
  self->_hasPeersWithCDPBackupRecords = a3;
}

- (BOOL)requiresEscrowRecordsFetch
{
  return self->_requiresEscrowRecordsFetch;
}

- (void)setRequiresEscrowRecordsFetch:(BOOL)a3
{
  self->_requiresEscrowRecordsFetch = a3;
}

- (BOOL)requiresInitialSync
{
  return self->_requiresInitialSync;
}

- (void)setRequiresInitialSync:(BOOL)a3
{
  self->_requiresInitialSync = a3;
}

- (unint64_t)remotePeeriCKState
{
  return self->_remotePeeriCKState;
}

- (void)setRemotePeeriCKState:(unint64_t)a3
{
  self->_remotePeeriCKState = a3;
}

- (unint64_t)circleStatus
{
  return self->_circleStatus;
}

- (void)setCircleStatus:(unint64_t)a3
{
  self->_circleStatus = a3;
}

@end
