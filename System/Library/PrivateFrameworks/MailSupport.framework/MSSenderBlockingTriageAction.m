@implementation MSSenderBlockingTriageAction

- (MSSenderBlockingTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 blockSender:(BOOL)a7
{
  MSSenderBlockingTriageAction *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MSSenderBlockingTriageAction;
  result = -[MSTriageAction initWithMessageListSelection:origin:actor:delegate:](&v9, sel_initWithMessageListSelection_origin_actor_delegate_, a3, a4, a5, a6);
  if (result)
    result->_blockSender = a7;
  return result;
}

- (id)_changeAction
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  _BOOL8 blockSender;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0D1E358]);
  -[MSTriageAction messageListItemSelection](self, "messageListItemSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageListItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MSTriageAction origin](self, "origin");
  v7 = -[MSTriageAction actor](self, "actor");
  if (self)
    blockSender = self->_blockSender;
  else
    blockSender = 0;
  v9 = (void *)objc_msgSend(v3, "initWithMessageListItems:origin:actor:blockSender:", v5, v6, v7, blockSender);

  return v9;
}

@end
