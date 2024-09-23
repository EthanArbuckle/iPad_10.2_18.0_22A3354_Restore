@implementation ModelContext

- (void)_processChangedManagedObjectIDs:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v3 = sub_23486F074();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23486F05C();
  swift_retain();
  sub_2347EF834();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)_undoDeletions:(id)a3
{
  sub_2347F7D88((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_2347F3FDC);
}

- (void)_undoUpdates:(id)a3
{
  sub_2347F7D88((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_2347F48FC);
}

- (void)_undoInsertions:(id)a3
{
  sub_2347F7D88((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_2347F4F44);
}

- (void)_undoDeletionsMovedToUpdates:(id)a3
{
  sub_2347F7D88((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_2347F5338);
}

- (void)_clearChangedThisTransaction:(id)a3
{
  uint64_t v3;

  v3 = sub_23486F8E4();
  swift_retain();
  sub_2347F53E8(v3);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)_undoManagerCheckpoint:(id)a3
{
  sub_2347F7D88((uint64_t)self, (uint64_t)a2, a3, sub_2347F7B9C);
}

- (void)checkAutosaveConditions
{
  swift_retain();
  sub_2347F8DF8();
  swift_release();
}

- (void)autosave
{
  _BYTE *v3;

  v3 = (char *)self + OBJC_IVAR____TtC9SwiftData12ModelContext_autosaveEnabled;
  swift_beginAccess();
  if (*v3 == 1 && self->_hasChanges[0] == 1)
  {
    *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SwiftData12ModelContext_autosaveDelay) = 0;
    swift_retain();
    sub_2347F915C();
    swift_release();
  }
}

@end
