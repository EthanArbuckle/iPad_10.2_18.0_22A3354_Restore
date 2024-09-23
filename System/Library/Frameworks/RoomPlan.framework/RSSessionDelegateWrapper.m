@implementation RSSessionDelegateWrapper

- (void)session:(id)a3 didUpdateFloorPlan:(id)a4
{
  id v6;
  id v7;
  _TtC8RoomPlan24RSSessionDelegateWrapper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2265294E4(v7);

}

- (void)session:(id)a3 didUpdateAsset:(id)a4
{
  id v6;
  id v7;
  _TtC8RoomPlan24RSSessionDelegateWrapper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2265296FC(v7, (uint64_t)&unk_24EDE7470, (uint64_t)sub_226529FAC, (uint64_t)&block_descriptor_61);

}

- (void)session:(id)a3 didUpdateTextCoaching:(id)a4
{
  id v6;
  id v7;
  _TtC8RoomPlan24RSSessionDelegateWrapper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2265296FC(v7, (uint64_t)&unk_24EDE7420, (uint64_t)sub_226529FA4, (uint64_t)&block_descriptor_55);

}

- (void)session:(id)a3 didFailWithError:(int64_t)a4
{
  id v6;
  _TtC8RoomPlan24RSSessionDelegateWrapper *v7;

  v6 = a3;
  v7 = self;
  sub_226529CC8(a4, (uint64_t)&OBJC_IVAR____TtC8RoomPlan24RSSessionDelegateWrapper_captureSession, (uint64_t)&unk_24EDE73D0, (uint64_t)sub_226529F9C, (uint64_t)&block_descriptor_49_0);

}

- (void)session:(id)a3 didUpdateMarkerCoaching:(id)a4
{
  id v6;
  id v7;
  _TtC8RoomPlan24RSSessionDelegateWrapper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2265296FC(v7, (uint64_t)&unk_24EDE7380, (uint64_t)sub_226529F94, (uint64_t)&block_descriptor_43_0);

}

- (_TtC8RoomPlan24RSSessionDelegateWrapper)init
{
  objc_super v4;

  swift_weakInit();
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8RoomPlan24RSSessionDelegateWrapper_initializationState) = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RSSessionDelegateWrapper();
  return -[RSSessionDelegateWrapper init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
