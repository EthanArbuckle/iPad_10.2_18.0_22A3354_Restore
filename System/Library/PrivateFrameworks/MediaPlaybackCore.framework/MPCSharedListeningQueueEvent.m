@implementation MPCSharedListeningQueueEvent

- (id)description
{
  int64_t kind;
  uint64_t v4;

  kind = self->_kind;
  switch(kind)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEvent: %p unknown/invalid>"), self, v4);
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEvent: %p addedContent=%@>"), self, self->_addedContent);
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEvent: %p removedContent=%@>"), self, self->_removedContent);
      break;
    case 3:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEvent: %p reorderedContent=%@>"), self, self->_reorderedContent);
      break;
    case 4:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEvent: %p playbackMode=%@>"), self, self->_playbackMode);
      break;
    case 5:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEvent: %p replacedContent=%@>"), self, self->_replacedContent);
      break;
    case 6:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEvent: %p playedNowContent=%@>"), self, self->_playedNowContent);
      break;
    case 7:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEvent: %p contentUpdatedMessage=%@>"), self, self->_contentUpdatedMessage);
      break;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<MPCSharedListeningQueueEvent: %p unknown/kind=%ld>"), self, kind);
      break;
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)kind
{
  return self->_kind;
}

- (MPCSharedListeningQueueEventContentAdded)addedContent
{
  return self->_addedContent;
}

- (MPCSharedListeningQueueEventContentRemoved)removedContent
{
  return self->_removedContent;
}

- (MPCSharedListeningQueueEventContentReordered)reorderedContent
{
  return self->_reorderedContent;
}

- (MPCSharedListeningQueueEventContentReplaced)replacedContent
{
  return self->_replacedContent;
}

- (MPCSharedListeningQueueEventContentPlayedNow)playedNowContent
{
  return self->_playedNowContent;
}

- (MPCSharedListeningQueueEventContentUpdatedMessage)contentUpdatedMessage
{
  return self->_contentUpdatedMessage;
}

- (MPCSharedListeningQueueEventPlaybackModeChanged)playbackMode
{
  return self->_playbackMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackMode, 0);
  objc_storeStrong((id *)&self->_contentUpdatedMessage, 0);
  objc_storeStrong((id *)&self->_playedNowContent, 0);
  objc_storeStrong((id *)&self->_replacedContent, 0);
  objc_storeStrong((id *)&self->_reorderedContent, 0);
  objc_storeStrong((id *)&self->_removedContent, 0);
  objc_storeStrong((id *)&self->_addedContent, 0);
}

+ (MPCSharedListeningQueueEvent)queueEventWithAddedContent:(id)a3
{
  MPCSharedListeningQueueEventContentAdded *v3;
  MPCSharedListeningQueueEvent *v4;
  MPCSharedListeningQueueEventContentAdded *addedContent;

  v3 = (MPCSharedListeningQueueEventContentAdded *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  addedContent = v4->_addedContent;
  v4->_kind = 1;
  v4->_addedContent = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithPlayedNowContent:(id)a3
{
  MPCSharedListeningQueueEventContentPlayedNow *v3;
  MPCSharedListeningQueueEvent *v4;
  MPCSharedListeningQueueEventContentPlayedNow *playedNowContent;

  v3 = (MPCSharedListeningQueueEventContentPlayedNow *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_kind = 6;
  playedNowContent = v4->_playedNowContent;
  v4->_playedNowContent = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithRemovedContent:(id)a3
{
  MPCSharedListeningQueueEventContentRemoved *v3;
  MPCSharedListeningQueueEvent *v4;
  MPCSharedListeningQueueEventContentRemoved *removedContent;

  v3 = (MPCSharedListeningQueueEventContentRemoved *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_kind = 2;
  removedContent = v4->_removedContent;
  v4->_removedContent = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithReorderedContent:(id)a3
{
  MPCSharedListeningQueueEventContentReordered *v3;
  MPCSharedListeningQueueEvent *v4;
  MPCSharedListeningQueueEventContentReordered *reorderedContent;

  v3 = (MPCSharedListeningQueueEventContentReordered *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_kind = 3;
  reorderedContent = v4->_reorderedContent;
  v4->_reorderedContent = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithReplacedContent:(id)a3
{
  MPCSharedListeningQueueEventContentReplaced *v3;
  MPCSharedListeningQueueEvent *v4;
  MPCSharedListeningQueueEventContentReplaced *replacedContent;

  v3 = (MPCSharedListeningQueueEventContentReplaced *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_kind = 5;
  replacedContent = v4->_replacedContent;
  v4->_replacedContent = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithContentUpdatedMessage:(id)a3
{
  MPCSharedListeningQueueEventContentUpdatedMessage *v3;
  MPCSharedListeningQueueEvent *v4;
  MPCSharedListeningQueueEventContentUpdatedMessage *contentUpdatedMessage;

  v3 = (MPCSharedListeningQueueEventContentUpdatedMessage *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_kind = 7;
  contentUpdatedMessage = v4->_contentUpdatedMessage;
  v4->_contentUpdatedMessage = v3;

  return v4;
}

+ (MPCSharedListeningQueueEvent)queueEventWithPlaybackModeChanged:(id)a3
{
  MPCSharedListeningQueueEventPlaybackModeChanged *v3;
  MPCSharedListeningQueueEvent *v4;
  MPCSharedListeningQueueEventPlaybackModeChanged *playbackMode;

  v3 = (MPCSharedListeningQueueEventPlaybackModeChanged *)a3;
  v4 = objc_alloc_init(MPCSharedListeningQueueEvent);
  v4->_kind = 4;
  playbackMode = v4->_playbackMode;
  v4->_playbackMode = v3;

  return v4;
}

@end
