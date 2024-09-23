@implementation CKDetonatedChatItem

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canCopy
{
  return 0;
}

- (BOOL)isSensitive
{
  return 0;
}

- (BOOL)canForward
{
  return 0;
}

- (BOOL)canExport
{
  return 0;
}

- (BOOL)canPerformQuickAction
{
  return 0;
}

- (unint64_t)balloonCorners
{
  return CKBalloonCornersForAttachmentContiguousType(-[CKChatItem attachmentContiguousType](self, "attachmentContiguousType"));
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)dragItemProvider
{
  return 0;
}

- (id)momentShareURL
{
  return 0;
}

- (BOOL)canAttachStickers
{
  return 0;
}

- (BOOL)canSendAsTextMessage
{
  return 0;
}

@end
