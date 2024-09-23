@implementation TabSnapshotCacheEntry

- (void)setStateObserver:(id)a3
{
  objc_storeWeak((id *)&self->_stateObserver, a3);
}

- (TabSnapshotCacheEntry)initWithIdentifier:(id)a3 isGroup:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  TabSnapshotCacheEntry *v8;
  TabSnapshotCacheEntry *v9;
  uint64_t v10;
  NSMutableSet *groupMembers;
  TabSnapshotCacheEntry *v12;
  objc_super v14;

  v4 = a4;
  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TabSnapshotCacheEntry;
  v8 = -[TabSnapshotCacheEntry init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_group = v4;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v10 = objc_claimAutoreleasedReturnValue();
      groupMembers = v9->_groupMembers;
      v9->_groupMembers = (NSMutableSet *)v10;

    }
    v9->_state = 0;
    v12 = v9;
  }

  return v9;
}

- (void)setStateUpdateCancelled:(BOOL)a3
{
  self->_stateUpdateCancelled = a3;
}

- (void)setFitsInCache:(BOOL)a3
{
  self->_fitsInCache = a3;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSUUID *identifier;
  unint64_t state;
  UIImage *snapshot;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  snapshot = self->_snapshot;
  state = self->_state;
  if (state > 3)
    v9 = CFSTR("Empty");
  else
    v9 = off_1E9CFB3D8[state];
  if (self->_updatingState)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_stateUpdateCancelled)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_group)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v13 = v11;
  v14 = v10;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = %@; snapshot = %@; state = %@; isUpdatingState = %@; stateUpdateCancelled = %@; isGroup = %@>"),
    v5,
    self,
    identifier,
    snapshot,
    v9,
    v14,
    v13,
    v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)stateUpdateCancelled
{
  return self->_stateUpdateCancelled;
}

- (void)setState:(int64_t)a3
{
  id WeakRetained;

  if (self->_state != a3)
  {
    self->_state = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_stateObserver);
    objc_msgSend(WeakRetained, "tabSnapshotCacheEntryDidUpdateState:", self);

  }
}

- (void)setUpdatingState:(BOOL)a3
{
  id WeakRetained;

  if (self->_updatingState != a3)
  {
    self->_updatingState = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_stateObserver);
    objc_msgSend(WeakRetained, "tabSnapshotCacheEntryDidUpdateState:", self);

  }
}

- (BOOL)isPendingUpdate
{
  int64_t state;

  state = self->_state;
  if ((unint64_t)(state - 3) < 2)
    return 0;
  if (state == 1)
    return self->_updatingState;
  return 1;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isUpdatingState
{
  return self->_updatingState;
}

- (BOOL)isGroup
{
  return self->_group;
}

- (BOOL)fitsInCache
{
  return self->_fitsInCache;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (NSMutableSet)groupMembers
{
  return self->_groupMembers;
}

- (TabSnapshotCacheEntryStateObserving)stateObserver
{
  return (TabSnapshotCacheEntryStateObserving *)objc_loadWeakRetained((id *)&self->_stateObserver);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stateObserver);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_groupMembers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
