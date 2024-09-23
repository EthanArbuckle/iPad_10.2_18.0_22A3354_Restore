@implementation CNMutableSaveResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setContactSnapshot:(id)a3 forIndexPath:(id)a4
{
  NSMutableDictionary *contactSnapshotsByIndexPath;
  uint64_t v6;
  void (*v7)(uint64_t, id);
  id v8;
  id v9;

  contactSnapshotsByIndexPath = self->super._contactSnapshotsByIndexPath;
  v6 = *MEMORY[0x1E0D13878];
  v7 = *(void (**)(uint64_t, id))(*MEMORY[0x1E0D13878] + 16);
  v8 = a4;
  v7(v6, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](contactSnapshotsByIndexPath, "setObject:forKey:", v9, v8);

}

- (void)setGroupSnapshot:(id)a3 forIndexPath:(id)a4
{
  NSMutableDictionary *groupSnapshotsByIndexPath;
  uint64_t v6;
  void (*v7)(uint64_t, id);
  id v8;
  id v9;

  groupSnapshotsByIndexPath = self->super._groupSnapshotsByIndexPath;
  v6 = *MEMORY[0x1E0D13878];
  v7 = *(void (**)(uint64_t, id))(*MEMORY[0x1E0D13878] + 16);
  v8 = a4;
  v7(v6, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](groupSnapshotsByIndexPath, "setObject:forKey:", v9, v8);

}

- (void)setContainerSnapshot:(id)a3 forIndexPath:(id)a4
{
  NSMutableDictionary *containerSnapshotsByIndexPath;
  uint64_t v6;
  void (*v7)(uint64_t, id);
  id v8;
  id v9;

  containerSnapshotsByIndexPath = self->super._containerSnapshotsByIndexPath;
  v6 = *MEMORY[0x1E0D13878];
  v7 = *(void (**)(uint64_t, id))(*MEMORY[0x1E0D13878] + 16);
  v8 = a4;
  v7(v6, a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](containerSnapshotsByIndexPath, "setObject:forKey:", v9, v8);

}

- (void)setDidAffectMeCard:(BOOL)a3
{
  self->super._didAffectMeCard = a3;
}

@end
