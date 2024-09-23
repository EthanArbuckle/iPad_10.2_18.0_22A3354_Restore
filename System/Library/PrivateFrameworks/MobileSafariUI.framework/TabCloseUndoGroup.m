@implementation TabCloseUndoGroup

- (TabCloseUndoGroup)initWithType:(int64_t)a3
{
  return (TabCloseUndoGroup *)-[TabCloseUndoGroup _initWithType:name:](self, "_initWithType:name:", a3, 0);
}

- (TabCloseUndoGroup)initWithName:(id)a3
{
  return (TabCloseUndoGroup *)-[TabCloseUndoGroup _initWithType:name:](self, "_initWithType:name:", 0, a3);
}

- (id)_initWithType:(int64_t)a3 name:(id)a4
{
  id v6;
  TabCloseUndoGroup *v7;
  TabCloseUndoGroup *v8;
  uint64_t v9;
  NSString *name;
  TabCloseUndoGroup *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TabCloseUndoGroup;
  v7 = -[TabCloseUndoGroup init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = v8;
  }

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
