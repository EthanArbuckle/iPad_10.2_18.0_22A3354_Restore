@implementation VCControlChannelMessageOptions

- (BOOL)duplicateMessageOnServerLink
{
  return self->_duplicateMessageOnServerLink;
}

- (void)setDuplicateMessageOnServerLink:(BOOL)a3
{
  self->_duplicateMessageOnServerLink = a3;
}

@end
