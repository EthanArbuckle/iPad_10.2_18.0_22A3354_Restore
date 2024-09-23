@implementation PADInternalClassifier

- (_TtC10CoreIDVPAD21PADInternalClassifier)init
{
  return (_TtC10CoreIDVPAD21PADInternalClassifier *)PADInternalClassifier.init()();
}

- (void)startLiveness:(id)a3 onGestureStart:(id)a4 onIncorrectGestureDetected:(id)a5 onGesturesFinished:(id)a6
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _TtC10CoreIDVPAD21PADInternalClassifier *v16;
  id v17;

  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  v12 = _Block_copy(a6);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v10;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v11;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v12;
  v17 = a3;
  v16 = self;
  sub_213BED90C(v17, (uint64_t)sub_213BF1CB0, v13, (uint64_t)sub_213BF1E5C, v14, (uint64_t)sub_213BF1CC0, v15);
  swift_release();
  swift_release();
  swift_release();

}

- (void)processLivenessFrame:(id)a3 withOptions:(PADClassifierFrameOptions)a4 taOptions:(int64_t)a5
{
  int v7;
  id v8;
  _TtC10CoreIDVPAD21PADInternalClassifier *v9;

  v7 = *(_DWORD *)&a4.var0 & 0x10101;
  v8 = a3;
  v9 = self;
  sub_213BEE374(v8, v7, a5);

}

- (void)skipLivenessGesture
{
  sub_213BEE6E8((char *)self, (uint64_t)a2, sub_213C07CD8);
}

- (void)enableAccessibilityOptions
{
  sub_213BEE6E8((char *)self, (uint64_t)a2, (void (*)(void))sub_213C07B98);
}

- (void)restartLivenessGesture
{
  sub_213BEE6E8((char *)self, (uint64_t)a2, (void (*)(void))sub_213C08778);
}

- (void)pauseLiveness
{
  sub_213BEE6E8((char *)self, (uint64_t)a2, (void (*)(void))sub_213C07F48);
}

- (void)prepareToResumeLiveness
{
  sub_213BEE6E8((char *)self, (uint64_t)a2, (void (*)(void))sub_213C08204);
}

- (void)resumeLiveness
{
  sub_213BEE6E8((char *)self, (uint64_t)a2, (void (*)(void))sub_213C084C0);
}

- (void)finishLivenessWithSelfie:(id)a3 performIDMatching:(BOOL)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  _TtC10CoreIDVPAD21PADInternalClassifier *v11;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = self;
  sub_213BEE764(v10, a4, (uint64_t)sub_213BF1E58, v9);

  swift_release();
}

- (void)finishLivenessStepUp:(id)a3
{
  sub_213BEEB68(self, (int)a2, a3, (uint64_t)&unk_24D0CFF38, (uint64_t)sub_213BF1CA8, sub_213BEE914);
}

- (void)cancelWithCompletion:(id)a3
{
  sub_213BEEB68(self, (int)a2, a3, (uint64_t)&unk_24D0CFF10, (uint64_t)sub_213BF1C9C, sub_213BEE9E4);
}

- (void).cxx_destruct
{

  sub_213BF1358(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_gestureStartBlock));
  sub_213BF1358(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_incorrectGestureDetectedBlock));
  sub_213BF1358(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onGesturesFinishedBlock));
  sub_213BF1358(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlock));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_selfieCompletionBlockAccessSemaphore));

  sub_213BF1358(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10CoreIDVPAD21PADInternalClassifier_onClassifierLoaded));
}

@end
