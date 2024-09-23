@implementation DDRVInteractionDelegate

- (DDRVInteractionDelegate)initWithItem:(id)a3
{
  id v5;
  DDRVInteractionDelegate *v6;
  DDRVInteractionDelegate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDRVInteractionDelegate;
  v6 = -[DDRVInteractionDelegate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (void)actionWillStart:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("kDDRVInteractionWillStartNotification"), self->_item);

}

- (void)actionDidFinish:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("kDDRVInteractionDidFinishNotification"), self->_item);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
