@implementation NNMKDiffMessageResult

- (NSMutableSet)messageIdsToAddToWatch
{
  return self->_messageIdsToAddToWatch;
}

- (void)setMessageIdsToAddToWatch:(id)a3
{
  objc_storeStrong((id *)&self->_messageIdsToAddToWatch, a3);
}

- (NSMutableSet)messageIdsToUpdateOnWatch
{
  return self->_messageIdsToUpdateOnWatch;
}

- (void)setMessageIdsToUpdateOnWatch:(id)a3
{
  objc_storeStrong((id *)&self->_messageIdsToUpdateOnWatch, a3);
}

- (NSMutableSet)messageIdsToDeleteFromWatch
{
  return self->_messageIdsToDeleteFromWatch;
}

- (void)setMessageIdsToDeleteFromWatch:(id)a3
{
  objc_storeStrong((id *)&self->_messageIdsToDeleteFromWatch, a3);
}

- (NSArray)messageToAddToWatch
{
  return self->_messageToAddToWatch;
}

- (void)setMessageToAddToWatch:(id)a3
{
  objc_storeStrong((id *)&self->_messageToAddToWatch, a3);
}

- (BOOL)trimed
{
  return self->_trimed;
}

- (void)setTrimed:(BOOL)a3
{
  self->_trimed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageToAddToWatch, 0);
  objc_storeStrong((id *)&self->_messageIdsToDeleteFromWatch, 0);
  objc_storeStrong((id *)&self->_messageIdsToUpdateOnWatch, 0);
  objc_storeStrong((id *)&self->_messageIdsToAddToWatch, 0);
}

@end
