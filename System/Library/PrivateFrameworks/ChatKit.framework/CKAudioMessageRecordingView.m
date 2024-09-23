@implementation CKAudioMessageRecordingView

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIGestureRecognizer *v4;
  CKAudioMessageRecordingView *v5;

  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = AudioMessageRecordingView.gestureRecognizerShouldBegin(_:)(v4);

  return self & 1;
}

- (void)scrubFrom:(id)a3
{
  UILongPressGestureRecognizer *v4;
  CKAudioMessageRecordingView *v5;

  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = self;
  AudioMessageRecordingView.scrub(from:)(v4);

}

- (void)closeFrom:(id)a3
{
  sub_18E618334(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))AudioMessageRecordingView.close(from:));
}

- (void)stopFrom:(id)a3
{
  sub_18E618334(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))AudioMessageRecordingView.stop(from:));
}

- (void)sendFrom:(id)a3
{
  CKAudioMessageRecordingView *v4;
  CKAudioMessageRecordingView *v5;
  char *v6;
  void *v7;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18E769194();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = (char *)self + OBJC_IVAR___CKAudioMessageRecordingView_delegate;
  swift_beginAccess();
  v7 = (void *)MEMORY[0x193FF501C](v6);
  if (v7)
  {
    objc_msgSend(v7, sel_audioMessageRecordingViewDidSend_, self);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  sub_18E553930((uint64_t)v8);
}

- (void)resumeFrom:(id)a3
{
  sub_18E618334(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))AudioMessageRecordingView.resume(from:));
}

- (void)playFrom:(id)a3
{
  sub_18E618334(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))AudioMessageRecordingView.play(from:));
}

+ (id)buttonFor:(int64_t)a3 with:(id)a4
{
  void *v4;
  id result;
  id v6;

  switch(a3)
  {
    case 0:
      sub_18E62CEF0();
      goto LABEL_6;
    case 1:
      sub_18E62D1C0();
      goto LABEL_6;
    case 2:
      sub_18E62D444();
      goto LABEL_6;
    case 3:
      v4 = sub_18E62D7CC();
LABEL_6:
      result = v4;
      break;
    default:
      v6 = a4;
      result = (id)sub_18E76941C();
      __break(1u);
      break;
  }
  return result;
}

- (CKAudioMessageRecordingViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CKAudioMessageRecordingView_delegate;
  swift_beginAccess();
  return (CKAudioMessageRecordingViewDelegate *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (int64_t)state
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_state);
  swift_beginAccess();
  return *v2;
}

- (void)setState:(int64_t)a3
{
  uint64_t *v5;
  uint64_t v6;
  CKAudioMessageRecordingView *v7;

  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_state);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = self;
  sub_18E74C16C(v6);

}

- (double)cornerRadius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCornerRadius:(double)a3
{
  double *v5;
  double v6;

  v5 = (double *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  if (v6 != a3)
    -[CKAudioMessageRecordingView setNeedsLayout](self, sel_setNeedsLayout);
}

- (BOOL)isStopButtonHighlighted
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKAudioMessageRecordingView_isStopButtonHighlighted;
  swift_beginAccess();
  return *v2;
}

- (void)setIsStopButtonHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v5;
  int v6;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR___CKAudioMessageRecordingView_isStopButtonHighlighted;
  swift_beginAccess();
  v6 = *v5;
  *v5 = v3;
  if (v6 != v3)
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_stopButton), sel_setHighlighted_, v3);
}

- (double)playbackDuration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setPlaybackDuration:(double)a3
{
  sub_18E74CBC4((char *)self, a3, (uint64_t)a2, &OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration);
}

- (double)playbackCurrentTime
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime);
  swift_beginAccess();
  return *v2;
}

- (void)setPlaybackCurrentTime:(double)a3
{
  sub_18E74CBC4((char *)self, a3, (uint64_t)a2, &OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime);
}

- (NSArray)intensities
{
  void *v2;

  swift_beginAccess();
  sub_18E7669BC();
  v2 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (UIView)backgroundView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___CKAudioMessageRecordingView_backgroundView));
}

- (IMService)service
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_service);
  swift_beginAccess();
  return (IMService *)*v2;
}

- (void)setService:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  CKAudioMessageRecordingView *v8;
  id *v9;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_service);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  v9 = (id *)((char *)&v8->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  objc_msgSend(*v9, sel_setNeedsUpdateConfiguration);

}

- (UIButton)stopButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___CKAudioMessageRecordingView_stopButton));
}

- (UIButton)sendButton
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  return (UIButton *)*v2;
}

- (void)setSendButton:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (CKAudioMessageRecordingView)initWithFrame:(CGRect)a3
{
  return (CKAudioMessageRecordingView *)AudioMessageRecordingView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CKAudioMessageRecordingView)initWithFrame:(CGRect)a3 service:(id)a4
{
  return (CKAudioMessageRecordingView *)AudioMessageRecordingView.init(frame:service:)(a4);
}

- (void)setupDisplayLink
{
  uint64_t v2;
  void *v4;
  CKAudioMessageRecordingView *v5;
  objc_class *v6;
  id v7;

  v2 = OBJC_IVAR___CKAudioMessageRecordingView_displayLink;
  if (!*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_displayLink))
  {
    v4 = (void *)objc_opt_self();
    v5 = self;
    v6 = (objc_class *)objc_msgSend(v4, sel_displayLinkWithTarget_selector_, v5, sel_displayLinkFiredFrom_);
    v7 = *(Class *)((char *)&self->super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.isa + v2) = v6;

  }
}

- (void)invalidateDisplayLink
{
  uint64_t v3;
  void *v4;
  CKAudioMessageRecordingView *v5;
  id v6;

  v3 = OBJC_IVAR___CKAudioMessageRecordingView_displayLink;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_displayLink);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  v6 = *(Class *)((char *)&self->super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.isa + v3) = 0;

}

- (CKAudioMessageRecordingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s7ChatKit25AudioMessageRecordingViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  CKAudioMessageRecordingView *v2;

  v2 = self;
  sub_18E74E194();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CKAudioMessageRecordingView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_18E74F0C8();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  CKAudioMessageRecordingView *v7;

  v4 = a3;
  v7 = self;
  v5 = -[CKAudioMessageRecordingView traitCollection](v7, sel_traitCollection);
  v6 = objc_msgSend(v5, sel_hasDifferentColorAppearanceComparedToTraitCollection_, v4);

  if (v6)
    -[CKAudioMessageRecordingView setNeedsLayout](v7, sel_setNeedsLayout);

}

- (void)displayLinkFiredFrom:(id)a3
{
  CKAudioMessageRecordingView *v4;
  CKAudioMessageRecordingView *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18E769194();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_18E74F29C();

  sub_18E00FA98((uint64_t)v6, qword_1EE0FB3F0);
}

- (void)setWithIntensities:(id)a3
{
  uint64_t v4;
  char *v5;
  uint64_t *v6;
  CKAudioMessageRecordingView *v7;

  v4 = sub_18E768AE0();
  v5 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_waveformView);
  v6 = (uint64_t *)&v5[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensities];
  swift_beginAccess();
  *v6 = v4;
  v7 = self;
  sub_18E7669BC();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setNeedsLayout);

  swift_bridgeObjectRelease();
}

- (void)addToWaveformWithIntensity:(double)a3
{
  char *v5;
  char *v6;
  _QWORD *v7;
  CKAudioMessageRecordingView *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;

  v5 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_waveformView);
  v6 = &v5[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensities];
  swift_beginAccess();
  v7 = *(_QWORD **)v6;
  v8 = self;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v6 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = sub_18E5183F8(0, v7[2] + 1, 1, v7);
    *(_QWORD *)v6 = v7;
  }
  v11 = v7[2];
  v10 = v7[3];
  if (v11 >= v10 >> 1)
  {
    v7 = sub_18E5183F8((_QWORD *)(v10 > 1), v11 + 1, 1, v7);
    *(_QWORD *)v6 = v7;
  }
  v7[2] = v11 + 1;
  *(double *)&v7[v11 + 4] = a3;
  swift_endAccess();
  objc_msgSend(v5, sel_setNeedsLayout);

}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKAudioMessageRecordingView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKAudioMessageRecordingView_durationAppendButton));

}

@end
