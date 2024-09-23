@implementation DOCCollaborationHighlightManager

- (_TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager)init
{
  return (_TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager *)sub_21EA6369C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager_highlightCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager_collaborationIdentifierToHighlightCache));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager_fetchQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager_coalescingTimer));
  swift_bridgeObjectRelease();
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  uint64_t ObjectType;
  uint64_t v6;
  void *v7;
  _TtC26DocumentManagerExecutables32DOCCollaborationHighlightManager *v8;
  id v9;
  _QWORD v10[6];

  ObjectType = swift_getObjectType();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = self;
  *(_QWORD *)(v6 + 24) = ObjectType;
  v10[4] = sub_21EAA047C;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_21EA5EAB0;
  v10[3] = &block_descriptor_7;
  v7 = _Block_copy(v10);
  v8 = self;
  v9 = a3;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v7);

}

@end
