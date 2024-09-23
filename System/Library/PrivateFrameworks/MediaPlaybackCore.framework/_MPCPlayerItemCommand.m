@implementation _MPCPlayerItemCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemID, 0);
}

- (void)setContentItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contentItemID
{
  return self->_contentItemID;
}

@end
