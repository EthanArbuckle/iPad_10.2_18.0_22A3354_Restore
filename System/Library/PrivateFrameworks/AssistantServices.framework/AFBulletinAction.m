@implementation AFBulletinAction

- (AFBulletinAction)initWithBulletinAction:(id)a3
{
  id v5;
  AFBulletinAction *v6;
  NSMutableSet *v7;
  NSMutableSet *titleVariants;
  uint64_t v9;
  NSString *bbActionID;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFBulletinAction;
  v6 = -[AFBulletinAction init](&v14, sel_init);
  if (v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    titleVariants = v6->_titleVariants;
    v6->_titleVariants = v7;

    objc_storeStrong((id *)&v6->_bbAction, a3);
    -[BBAction identifier](v6->_bbAction, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    bbActionID = v6->_bbActionID;
    v6->_bbActionID = (NSString *)v9;

    -[BBAction appearance](v6->_bbAction, "appearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFBulletinAction addTitleVariant:](v6, "addTitleVariant:", v12);

  }
  return v6;
}

- (void)addTitleVariant:(id)a3
{
  if (a3)
    -[NSMutableSet addObject:](self->_titleVariants, "addObject:");
}

- (id)getTitleVariants
{
  return (id)-[NSMutableSet copy](self->_titleVariants, "copy");
}

- (BBAction)bbAction
{
  return self->_bbAction;
}

- (NSString)bbActionID
{
  return self->_bbActionID;
}

- (NSMutableSet)titleVariants
{
  return self->_titleVariants;
}

- (void)setTitleVariants:(id)a3
{
  objc_storeStrong((id *)&self->_titleVariants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleVariants, 0);
  objc_storeStrong((id *)&self->_bbActionID, 0);
  objc_storeStrong((id *)&self->_bbAction, 0);
}

@end
