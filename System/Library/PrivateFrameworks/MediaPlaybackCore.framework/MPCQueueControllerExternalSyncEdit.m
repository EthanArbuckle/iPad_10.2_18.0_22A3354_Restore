@implementation MPCQueueControllerExternalSyncEdit

- (void)setTargetContentItemID:(id)a3
{
  NSString *v4;
  NSString *targetContentItemID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  targetContentItemID = self->_targetContentItemID;
  self->_targetContentItemID = v4;

}

- (NSString)targetContentItemID
{
  return self->_targetContentItemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentItemID, 0);
}

@end
