@implementation DraggableLabel.Coordinator

- (void)longPressGestureRecognized:(id)a3
{
  id v4;
  _TtCV10StickerKit14DraggableLabel11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2345DB730(v4);

}

- (void)dragDidEnd:(id)a3 withOperation:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char v11;
  id v12;
  _TtCV10StickerKit14DraggableLabel11Coordinator *v13;
  _QWORD v14[2];
  char v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  char v19;

  v6 = type metadata accessor for DraggableLabel(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2345DC9EC((uint64_t)self + OBJC_IVAR____TtCV10StickerKit14DraggableLabel11Coordinator_control, (uint64_t)v8);
  v9 = &v8[*(int *)(v6 + 28)];
  v10 = *((_QWORD *)v9 + 1);
  v11 = v9[32];
  v16 = *(_QWORD *)v9;
  v17 = v10;
  v18 = *((_OWORD *)v9 + 1);
  v19 = v11;
  v14[0] = 0;
  v14[1] = 0;
  v15 = 2;
  v12 = a3;
  v13 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2561741B0);
  sub_234717034();
  sub_2345DCA30((uint64_t)v8);

}

- (_TtCV10StickerKit14DraggableLabel11Coordinator)init
{
  _TtCV10StickerKit14DraggableLabel11Coordinator *result;

  result = (_TtCV10StickerKit14DraggableLabel11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2345DCA30((uint64_t)self + OBJC_IVAR____TtCV10StickerKit14DraggableLabel11Coordinator_control);

  swift_unknownObjectWeakDestroy();
}

@end
