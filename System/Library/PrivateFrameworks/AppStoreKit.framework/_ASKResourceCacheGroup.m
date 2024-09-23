@implementation _ASKResourceCacheGroup

- (BOOL)hasMultipleMembers
{
  return self->_hasMultipleMembers;
}

- (id)onlyMemberContents
{
  os_unfair_lock_s *p_guard;
  void *v4;

  p_guard = &self->_guard;
  os_unfair_lock_lock(&self->_guard);
  -[NSMutableArray firstObject](self->_memberContents, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_guard);
  return v4;
}

- (id)makeMemberContents
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  os_unfair_lock_lock(&self->_guard);
  -[NSMutableArray addObject:](self->_memberContents, "addObject:", v3);
  -[_ASKResourceCacheGroup setHasMultipleMembers:](self, "setHasMultipleMembers:", (unint64_t)-[NSMutableArray count](self->_memberContents, "count") > 1);
  os_unfair_lock_unlock(&self->_guard);
  return v3;
}

- (void)setHasMultipleMembers:(BOOL)a3
{
  self->_hasMultipleMembers = a3;
}

- (_ASKResourceCacheGroup)init
{
  _ASKResourceCacheGroup *v2;
  NSMutableArray *v3;
  NSMutableArray *memberContents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ASKResourceCacheGroup;
  v2 = -[_ASKResourceCacheGroup init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memberContents = v2->_memberContents;
    v2->_memberContents = v3;

    v2->_guard._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)snapshotMemberContents
{
  os_unfair_lock_s *p_guard;
  void *v4;

  p_guard = &self->_guard;
  os_unfair_lock_lock(&self->_guard);
  v4 = (void *)-[NSMutableArray copy](self->_memberContents, "copy");
  os_unfair_lock_unlock(p_guard);
  return v4;
}

- (void)discardMemberContents:(id)a3
{
  os_unfair_lock_s *p_guard;
  id v5;

  p_guard = &self->_guard;
  v5 = a3;
  os_unfair_lock_lock(p_guard);
  -[NSMutableArray removeObjectIdenticalTo:](self->_memberContents, "removeObjectIdenticalTo:", v5);

  -[_ASKResourceCacheGroup setHasMultipleMembers:](self, "setHasMultipleMembers:", (unint64_t)-[NSMutableArray count](self->_memberContents, "count") > 1);
  os_unfair_lock_unlock(p_guard);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberContents, 0);
}

@end
