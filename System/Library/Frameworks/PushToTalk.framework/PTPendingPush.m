@implementation PTPendingPush

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isServiceUpdateMessage
{
  return self->_isServiceUpdateMessage;
}

- (void)setIsServiceUpdateMessage:(BOOL)a3
{
  self->_isServiceUpdateMessage = a3;
}

- (BOOL)isHighPriority
{
  return self->_isHighPriority;
}

- (void)setIsHighPriority:(BOOL)a3
{
  self->_isHighPriority = a3;
}

- (int64_t)remainingHighPriorityBudget
{
  return self->_remainingHighPriorityBudget;
}

- (void)setRemainingHighPriorityBudget:(int64_t)a3
{
  self->_remainingHighPriorityBudget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reply, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
