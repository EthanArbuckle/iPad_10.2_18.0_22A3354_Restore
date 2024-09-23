@implementation ICOutlineRenderer

- (ICOutlineController)outlineController
{
  ICOutlineRenderer *v2;
  id v3;

  v2 = self;
  v3 = OutlineRenderer.outlineController.getter();

  return (ICOutlineController *)v3;
}

- (BOOL)selectionVisibilityRequiresEditing
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___ICOutlineRenderer_selectionVisibilityRequiresEditing;
  swift_beginAccess();
  return *v2;
}

- (void)setSelectionVisibilityRequiresEditing:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___ICOutlineRenderer_selectionVisibilityRequiresEditing;
  swift_beginAccess();
  *v4 = a3;
}

- (ICOutlineRenderer)initWithTextView:(id)a3
{
  return (ICOutlineRenderer *)OutlineRenderer.init(textView:)(a3);
}

- (void)dealloc
{
  ICOutlineRenderer *v2;

  v2 = self;
  OutlineRenderer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)collapsibleSectionAffordanceExposures
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___ICOutlineRenderer_affordanceShownUUIDs;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v2 + 16);
}

- (void)resetCollapsibleSectionsAffordanceExposures
{
  _QWORD *v2;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICOutlineRenderer_affordanceShownUUIDs);
  swift_beginAccess();
  *v2 = MEMORY[0x1E0DEE9E8];
  swift_bridgeObjectRelease();
}

- (int64_t)collapsibleSectionAffordanceUsages
{
  ICOutlineRenderer *v2;
  id v3;

  v2 = self;
  v3 = OutlineRenderer.collapsibleSectionAffordanceUsages.getter();

  return (int64_t)v3;
}

- (void)resetCollapsibleSectionsAffordanceUsages
{
  ICOutlineRenderer *v2;

  v2 = self;
  OutlineRenderer.resetCollapsibleSectionsAffordanceUsages()();

}

- (void)resetCollapsibleSectionsAffordanceUsageData
{
  _QWORD *v3;
  ICOutlineRenderer *v4;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICOutlineRenderer_affordanceShownUUIDs);
  swift_beginAccess();
  *v3 = MEMORY[0x1E0DEE9E8];
  v4 = self;
  swift_bridgeObjectRelease();
  OutlineRenderer.resetCollapsibleSectionsAffordanceUsages()();

}

- (void)textViewLayoutDidChangeWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ICOutlineRenderer *v8;
  uint64_t v9;

  v4 = sub_1DD9D0538();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD9D0514();
  v8 = self;
  sub_1DD97A604();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)accessibilityStatusDidChange
{
  ICOutlineRenderer *v2;

  v2 = self;
  sub_1DD97A604();

}

- (void)accessibilityButtonShapesDidChange
{
  id v1;

  v1 = a1;
  sub_1DD9C2DC0();
  sub_1DD97A604();

}

- (ICOutlineRenderer)init
{
  ICOutlineRenderer *result;

  result = (ICOutlineRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
