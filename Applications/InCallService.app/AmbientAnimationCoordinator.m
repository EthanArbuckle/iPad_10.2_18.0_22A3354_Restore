@implementation AmbientAnimationCoordinator

+ (void)transitionFrom:(id)a3 to:(id)a4 allowRoll:(BOOL)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;

  v10 = _Block_copy(a6);
  v11 = swift_allocObject(&unk_10028C490, 24, 7);
  *(_QWORD *)(v11 + 16) = v10;
  swift_getObjCClassMetadata(a1);
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  sub_10017A250(a3, a4, a5, (uint64_t)sub_10017B96C, v11);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);
  swift_release(v11);
}

+ (void)show:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10028C418, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10017B96C;
  }
  else
  {
    v7 = 0;
  }
  swift_getObjCClassMetadata(a1);
  v8 = swift_unknownObjectRetain(a3);
  sub_10017AEB8(v8);
  sub_100158160((uint64_t)v6, v7);
  swift_unknownObjectRelease(a3);
}

+ (void)hide:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10028C288, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_10017B204;
  }
  else
  {
    v7 = 0;
  }
  swift_getObjCClassMetadata(a1);
  v8 = swift_unknownObjectRetain(a3);
  sub_10017AFFC(v8);
  sub_100158160((uint64_t)v6, v7);
  swift_unknownObjectRelease(a3);
}

- (_TtC13InCallService27AmbientAnimationCoordinator)init
{
  return (_TtC13InCallService27AmbientAnimationCoordinator *)sub_10017B140();
}

@end
