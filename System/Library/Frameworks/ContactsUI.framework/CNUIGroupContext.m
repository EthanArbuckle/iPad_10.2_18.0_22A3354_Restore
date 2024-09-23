@implementation CNUIGroupContext

- (CNUIGroupContext)initWithAddedGroupsByContainerDict:(id)a3 removedGroups:(id)a4
{
  id v7;
  id v8;
  CNUIGroupContext *v9;
  CNUIGroupContext *v10;
  CNUIGroupContext *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNUIGroupContext;
  v9 = -[CNUIGroupContext init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_addedGroupsByContainerDict, a3);
    objc_storeStrong((id *)&v10->_removedGroups, a4);
    v11 = v10;
  }

  return v10;
}

- (NSDictionary)addedGroupsByContainerDict
{
  return self->_addedGroupsByContainerDict;
}

- (NSArray)removedGroups
{
  return self->_removedGroups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedGroups, 0);
  objc_storeStrong((id *)&self->_addedGroupsByContainerDict, 0);
}

@end
