@implementation OUSessionDelegateWrapper

- (void)session:(id)a3 didUpdateDetectedObjects:(id)a4
{
  sub_226522074(self, (uint64_t)a2, a3, (uint64_t)a4, (unint64_t *)&unk_255848510, 0x24BE6E040, (void (*)(uint64_t))sub_226529910);
}

- (void)session:(id)a3 didFailWithError:(int64_t)a4
{
  id v6;
  _TtC8RoomPlan24OUSessionDelegateWrapper *v7;

  v6 = a3;
  v7 = self;
  sub_226529CC8(a4, (uint64_t)&OBJC_IVAR____TtC8RoomPlan24OUSessionDelegateWrapper_captureSession, (uint64_t)&unk_24EDE72B8, (uint64_t)sub_226529EFC, (uint64_t)&block_descriptor_28);

}

- (_TtC8RoomPlan24OUSessionDelegateWrapper)init
{
  return (_TtC8RoomPlan24OUSessionDelegateWrapper *)sub_226522260(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8RoomPlan24OUSessionDelegateWrapper_captureSession, (uint64_t (*)(uint64_t))type metadata accessor for OUSessionDelegateWrapper);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
