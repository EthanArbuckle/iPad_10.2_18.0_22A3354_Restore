@implementation _MPCQueueControllerBehaviorEmpty

- (id)performLoadCommand:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD, id))a4 + 2))(a4, 0, a3);
  return 0;
}

- (_MPCQueueControllerBehaviorEmpty)initWithSessionID:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MPCQueueControllerBehaviorEmpty;
  return -[_MPCQueueControllerBehaviorEmpty init](&v4, sel_init, a3);
}

- (int64_t)playbackPositionRestorationPolicy
{
  return 0;
}

- (NSString)sessionID
{
  return (NSString *)CFSTR("EMPTY");
}

- (id)_stateDictionaryIncludingQueue:(BOOL)a3
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (BOOL)itemExistsForContentItemID:(id)a3
{
  return 0;
}

- (id)componentsForContentItemID:(id)a3
{
  return 0;
}

- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4
{
  if (a4)
    *a4 = CFSTR("Empty Queue Behavior");
  return 0;
}

- (BOOL)canPreviousItemFromContentItemID:(id)a3 reason:(id *)a4
{
  if (a4)
    *a4 = CFSTR("Empty Queue Behavior");
  return 0;
}

- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4
{
  if (a4)
    *a4 = CFSTR("Empty Queue Behavior");
  return 0;
}

- (BOOL)isEmpty
{
  return 1;
}

- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x24BDBD1A8], "objectEnumerator", a3, a4, a5);
}

- (id)_itemForContentItemID:(id)a3
{
  return 0;
}

- (MPCQueueControllerBehaviorHost)host
{
  return (MPCQueueControllerBehaviorHost *)objc_loadWeakRetained((id *)&self->_host);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)canLoadQueue:(id)a3 reason:(id *)a4
{
  id v5;
  char isKindOfClass;
  char v7;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = isKindOfClass;
  if (a4 && (isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot populate empty behavior with %@"), v5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 & 1;
}

@end
