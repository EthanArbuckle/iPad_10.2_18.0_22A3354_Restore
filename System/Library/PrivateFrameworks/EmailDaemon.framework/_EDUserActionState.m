@implementation _EDUserActionState

- (NSDate)viewingStarted
{
  return self->_viewingStarted;
}

- (void)setViewingStarted:(id)a3
{
  objc_storeStrong((id *)&self->_viewingStarted, a3);
}

- (ECMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (BOOL)scrolledToEnd
{
  return self->_scrolledToEnd;
}

- (void)setScrolledToEnd:(BOOL)a3
{
  self->_scrolledToEnd = a3;
}

- (BOOL)mutedThread
{
  return self->_mutedThread;
}

- (void)setMutedThread:(BOOL)a3
{
  self->_mutedThread = a3;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)messageListType
{
  return self->_messageListType;
}

- (void)setMessageListType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)row
{
  return self->_row;
}

- (void)setRow:(int64_t)a3
{
  self->_row = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListType, 0);
  objc_storeStrong((id *)&self->_cellStyle, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_viewingStarted, 0);
}

@end
