@implementation IMDChatMemberStatusChangeContext

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSString)handleID
{
  return self->_handleID;
}

- (void)setHandleID:(id)a3
{
  objc_storeStrong((id *)&self->_handleID, a3);
}

- (NSString)fromHandleID
{
  return self->_fromHandleID;
}

- (void)setFromHandleID:(id)a3
{
  objc_storeStrong((id *)&self->_fromHandleID, a3);
}

- (NSString)unformattedNumber
{
  return self->_unformattedNumber;
}

- (void)setUnformattedNumber:(id)a3
{
  objc_storeStrong((id *)&self->_unformattedNumber, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void)setChatIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_chatIdentifier, a3);
}

- (unsigned)style
{
  return self->_style;
}

- (void)setStyle:(unsigned __int8)a3
{
  self->_style = a3;
}

- (IMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)destinationCallerID
{
  return self->_destinationCallerID;
}

- (void)setDestinationCallerID:(id)a3
{
  objc_storeStrong((id *)&self->_destinationCallerID, a3);
}

- (NSDate)messageTime
{
  return self->_messageTime;
}

- (void)setMessageTime:(id)a3
{
  objc_storeStrong((id *)&self->_messageTime, a3);
}

- (NSString)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_messageID, a3);
}

- (BOOL)silently
{
  return self->_silently;
}

- (void)setSilently:(BOOL)a3
{
  self->_silently = a3;
}

- (BOOL)unattributed
{
  return self->_unattributed;
}

- (void)setUnattributed:(BOOL)a3
{
  self->_unattributed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_messageTime, 0);
  objc_storeStrong((id *)&self->_destinationCallerID, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_chatIdentifier, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_unformattedNumber, 0);
  objc_storeStrong((id *)&self->_fromHandleID, 0);
  objc_storeStrong((id *)&self->_handleID, 0);
}

@end
