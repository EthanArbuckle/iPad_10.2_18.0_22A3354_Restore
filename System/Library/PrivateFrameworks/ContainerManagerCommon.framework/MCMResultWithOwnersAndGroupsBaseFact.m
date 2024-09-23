@implementation MCMResultWithOwnersAndGroupsBaseFact

- (MCMResultWithOwnersAndGroupsBaseFact)initWithOwnerIndex:(unint64_t)a3 groupIndex:(unint64_t)a4
{
  MCMResultWithOwnersAndGroupsBaseFact *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)MCMResultWithOwnersAndGroupsBaseFact;
  result = -[MCMResultWithOwnersAndGroupsBaseFact init](&v7, sel_init);
  if (result)
  {
    result->_ownerIndex = a3;
    result->_groupIndex = a4;
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[MCMResultWithOwnersAndGroupsBaseFact ownerIndex](self, "ownerIndex");
  return -[MCMResultWithOwnersAndGroupsBaseFact groupIndex](self, "groupIndex") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "ownerIndex");
    v8 = 0;
    if (v6 == -[MCMResultWithOwnersAndGroupsBaseFact ownerIndex](self, "ownerIndex"))
    {
      v7 = objc_msgSend(v5, "groupIndex");
      if (v7 == -[MCMResultWithOwnersAndGroupsBaseFact groupIndex](self, "groupIndex"))
        v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)ownerIndex
{
  return self->_ownerIndex;
}

- (unint64_t)groupIndex
{
  return self->_groupIndex;
}

@end
