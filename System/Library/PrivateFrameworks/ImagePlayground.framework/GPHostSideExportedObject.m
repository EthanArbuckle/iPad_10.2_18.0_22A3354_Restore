@implementation GPHostSideExportedObject

- (void)pickerDidSelectAssets:(id)a3
{
  sub_23ED9468C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23ED93CE4);
}

- (void)pickerDidCancel
{
  sub_23ED94424((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_23ED93F20);
}

- (void)pickerWantsToStartCreationWithReplyHandler:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  sub_23ED93F48((uint64_t)sub_23ED97A64, v4);
  swift_release();
  swift_release();
}

- (void)pickerWillStartCreation
{
  sub_23ED94424((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_23ED941EC);
}

- (void)editorDidGenerateAssets:(id)a3
{
  sub_23ED9468C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_23ED94450);
}

- (void)editorDidCancelWithRequiresShowingGrid:(BOOL)a3
{
  sub_23ED949C4((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_23ED946F0);
}

- (void)editorDidChangeCanStartUpscaling:(BOOL)a3
{
  sub_23ED949C4((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_23ED94920);
}

- (void)editorDidChangeHasSignificantEdits:(BOOL)a3
{
  sub_23ED949C4((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_23ED94A04);
}

@end
