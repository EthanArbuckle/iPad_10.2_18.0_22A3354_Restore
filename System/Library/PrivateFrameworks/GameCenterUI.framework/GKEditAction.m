@implementation GKEditAction

+ (id)actionWithName:(id)a3 selector:(SEL)a4
{
  id v5;
  GKEditAction *v6;

  v5 = a3;
  v6 = objc_alloc_init(GKEditAction);
  -[GKEditAction setName:](v6, "setName:", v5);

  -[GKEditAction setSelector:](v6, "setSelector:", a4);
  return v6;
}

+ (id)deleteActionWithName:(id)a3
{
  void *v3;

  +[GKEditAction actionWithName:selector:](GKEditAction, "actionWithName:selector:", a3, sel_swipeToDeleteCell_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDestructive:", 1);
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
