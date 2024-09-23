@implementation FileImportExportBridge

- (void).cxx_destruct
{
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI22FileImportExportBridge_host);
  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)self + OBJC_IVAR____TtC7SwiftUI22FileImportExportBridge_presentationState, type metadata accessor for FileImportExportBridge.PresentationState);

}

- (_TtC7SwiftUI22FileImportExportBridge)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&self->host[OBJC_IVAR____TtC7SwiftUI22FileImportExportBridge_host] = 0;
  swift_unknownObjectWeakInit();
  v4 = (char *)self + OBJC_IVAR____TtC7SwiftUI22FileImportExportBridge_presentationState;
  v5 = type metadata accessor for FileImportExportBridge.Presentation(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = type metadata accessor for FileImportExportBridge.PresentationState(0);
  *(_DWORD *)&v4[*(int *)(v6 + 20)] = 0;
  *(_DWORD *)&v4[*(int *)(v6 + 24)] = 0;
  v7 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI22FileImportExportBridge_presentedPicker);
  *v7 = 0;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[FileImportExportBridge init](&v9, sel_init);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v6;
  UIDocumentPickerViewController *v7;
  _TtC7SwiftUI22FileImportExportBridge *v8;

  type metadata accessor for URL();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = (UIDocumentPickerViewController *)a3;
  v8 = self;
  FileImportExportBridge.documentPicker(_:didPickDocumentsAt:)(v7, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  UIDocumentPickerViewController *v4;
  _TtC7SwiftUI22FileImportExportBridge *v5;

  v4 = (UIDocumentPickerViewController *)a3;
  v5 = self;
  FileImportExportBridge.documentPickerWasCancelled(_:)(v4);

}

@end
