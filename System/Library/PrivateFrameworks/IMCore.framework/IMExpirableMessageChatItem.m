@implementation IMExpirableMessageChatItem

- (BOOL)isPlayed
{
  void *v2;
  char v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlayed");

  return v3;
}

- (BOOL)isSaved
{
  void *v2;
  BOOL v3;

  -[IMChatItem _item](self, "_item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "expireState") == 3;

  return v3;
}

@end
