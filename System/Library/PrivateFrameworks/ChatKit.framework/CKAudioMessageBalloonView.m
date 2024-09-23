@implementation CKAudioMessageBalloonView

- (id)waveformColorWithIsFromMe:(BOOL)a3 isPlayed:(BOOL)a4 idiom:(int64_t)a5
{
  _TtC7ChatKit25CKAudioMessageBalloonView *v8;
  void *v9;
  void *v10;

  v8 = self;
  sub_18E513E20(a3, a4, a5);
  v10 = v9;

  return v10;
}

- (id)transcriptionButtonColorWithIsFromMe:(BOOL)a3 idiom:(int64_t)a4
{
  return sub_18E5143D8(a3, a4);
}

- (id)timeLabelColorFor:(char)a3 idiom:(int64_t)a4
{
  return sub_18E514438(a3, a4);
}

- (id)playPauseButtonColorFor:(char)a3
{
  _TtC7ChatKit25CKAudioMessageBalloonView *v4;
  void *v5;
  void *v6;

  v4 = self;
  sub_18E514048(a3);
  v6 = v5;

  return v6;
}

- (id)speedLabelColorFor:(char)a3 idiom:(int64_t)a4
{
  _TtC7ChatKit25CKAudioMessageBalloonView *v6;
  void *v7;
  void *v8;

  v6 = self;
  sub_18E5141F4(a3, a4);
  v8 = v7;

  return v8;
}

- (id)playbackSpeedMenu
{
  _TtC7ChatKit25CKAudioMessageBalloonView *v2;
  id v3;

  v2 = self;
  v3 = sub_18E670D6C();

  return v3;
}

- (void)waveformProgressViewPanning:(id)a3
{
  id v4;
  _TtC7ChatKit25CKAudioMessageBalloonView *v5;

  v4 = a3;
  v5 = self;
  sub_18E6713F0(v4);

}

- (BOOL)isAudioMessage
{
  return 1;
}

- (CKAudioMediaObject)mediaObject
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_mediaObject);
  swift_beginAccess();
  return (CKAudioMediaObject *)*v2;
}

- (void)setMediaObject:(id)a3
{
  _TtC7ChatKit25CKAudioMessageBalloonView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18E6B6EEC(a3);

}

- (_TtC7ChatKit20AudioMessageWaveform)waveformView
{
  _TtC7ChatKit25CKAudioMessageBalloonView *v2;
  id v3;

  v2 = self;
  v3 = sub_18E6B37E0();

  return (_TtC7ChatKit20AudioMessageWaveform *)v3;
}

- (void)setWaveformView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___waveformView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___waveformView) = (Class)a3;
  v3 = a3;

}

- (double)playbackSpeed
{
  return *(double *)((char *)&self->super.super.super.super.super.super.isa
                   + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_playbackSpeed);
}

- (void)setPlaybackSpeed:(double)a3
{
  _TtC7ChatKit25CKAudioMessageBalloonView *v4;

  v4 = self;
  sub_18E6B40B0(a3);

}

- (int64_t)waveformContentMode
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_waveformContentMode);
  swift_beginAccess();
  return *v2;
}

- (void)setWaveformContentMode:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_waveformContentMode);
  swift_beginAccess();
  *v4 = a3;
}

- (double)time
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_time);
  swift_beginAccess();
  return *v2;
}

- (void)setTime:(double)a3
{
  double *v5;
  void *v6;

  v5 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_time);
  swift_beginAccess();
  *v5 = a3;
  v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_panGestureRecognizer);
  if (v6)
    objc_msgSend(v6, sel_setEnabled_, a3 > 0.0);
}

- (double)initialTimeBeforePan
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_initialTimeBeforePan);
  swift_beginAccess();
  return *v2;
}

- (void)setInitialTimeBeforePan:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_initialTimeBeforePan);
  swift_beginAccess();
  *v4 = a3;
}

- (double)duration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_duration);
  swift_beginAccess();
  return *v2;
}

- (void)setDuration:(double)a3
{
  double *v5;
  _TtC7ChatKit25CKAudioMessageBalloonView *v6;

  v5 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_duration);
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_18E6B4A38();

}

- (BOOL)isPlaying
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_isPlaying;
  swift_beginAccess();
  return *v2;
}

- (void)setPlaying:(BOOL)a3
{
  _TtC7ChatKit25CKAudioMessageBalloonView *v4;

  v4 = self;
  sub_18E6B4C88(a3);

}

- (BOOL)isPlayed
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_isPlayed;
  swift_beginAccess();
  return *v2;
}

- (void)setPlayed:(BOOL)a3
{
  _TtC7ChatKit25CKAudioMessageBalloonView *v4;

  v4 = self;
  sub_18E6B4EDC(a3);

}

- (BOOL)serviceIsSMS
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_serviceIsSMS;
  swift_beginAccess();
  return *v2;
}

- (void)setServiceIsSMS:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_serviceIsSMS;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)serviceIsRCS
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_serviceIsRCS;
  swift_beginAccess();
  return *v2;
}

- (void)setServiceIsRCS:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_serviceIsRCS;
  swift_beginAccess();
  *v4 = a3;
}

- (void)addOverlaySubview:(id)a3
{
  id v4;
  _TtC7ChatKit25CKAudioMessageBalloonView *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_18E6B3F18();
  -[CKAudioMessageBalloonView insertSubview:belowSubview:](v5, sel_insertSubview_belowSubview_, v4, v6);

}

- (_TtC7ChatKit25CKAudioMessageBalloonView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit25CKAudioMessageBalloonView *)sub_18E6B5684(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit25CKAudioMessageBalloonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E6B6FB8();
}

- (void)prepareForDisplay
{
  _TtC7ChatKit25CKAudioMessageBalloonView *v2;

  v2 = self;
  sub_18E6B5A80();

}

- (void)vibrantContainerWillReparentNonVibrantSubviews:(id)a3
{
  unint64_t v3;
  uint64_t v4;
  _TtC7ChatKit25CKAudioMessageBalloonView *v5;
  uint64_t i;
  id v7;
  void *v8;
  _TtC7ChatKit25CKAudioMessageBalloonView *v9;

  if (!a3)
    goto LABEL_13;
  sub_18E00F31C(0, (unint64_t *)&qword_1EE0F50A0);
  v3 = sub_18E768AE0();
  if (v3 >> 62)
  {
    v9 = self;
    sub_18E7669BC();
    v4 = sub_18E769338();
    if (v4)
      goto LABEL_4;
LABEL_11:
    swift_bridgeObjectRelease_n();

    return;
  }
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v5 = self;
  sub_18E7669BC();
  if (!v4)
    goto LABEL_11;
LABEL_4:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x193FF25B0](i, v3);
      else
        v7 = *(id *)(v3 + 8 * i + 32);
      v8 = v7;
      objc_msgSend(v7, sel_setUserInteractionEnabled_, 0);

    }
    goto LABEL_11;
  }
  __break(1u);
LABEL_13:
  __break(1u);
}

- (id)nonVibrantSubViews
{
  uint64_t v3;
  _TtC7ChatKit25CKAudioMessageBalloonView *v4;
  void *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0FB970);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_18E7D2720;
  v4 = self;
  *(_QWORD *)(v3 + 32) = sub_18E6B3328();
  *(_QWORD *)(v3 + 40) = sub_18E6B37E0();
  *(_QWORD *)(v3 + 48) = sub_18E6B39B4();
  sub_18E768AF8();

  sub_18E00F31C(0, (unint64_t *)&qword_1EE0F50A0);
  v5 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)configureForComposition:(id)a3
{
  id v5;
  _TtC7ChatKit25CKAudioMessageBalloonView *v6;

  v5 = a3;
  v6 = self;
  sub_18E6B61F0(a3);

}

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  id v9;
  _TtC7ChatKit25CKAudioMessageBalloonView *v10;

  v9 = a3;
  v10 = self;
  sub_18E6B640C(a3, a5, a4);

}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  _TtC7ChatKit25CKAudioMessageBalloonView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = self;
  sub_18E6B7118(width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  _TtC7ChatKit25CKAudioMessageBalloonView *v2;

  v2 = self;
  sub_18E6B661C();

}

- (void)configureForMessagePart:(id)a3
{
  id v5;
  _TtC7ChatKit25CKAudioMessageBalloonView *v6;

  v5 = a3;
  v6 = self;
  sub_18E6B6788(a3);

}

- (void)tapGestureRecognized:(id)a3
{
  id v5;
  _TtC7ChatKit25CKAudioMessageBalloonView *v6;

  v5 = a3;
  v6 = self;
  sub_18E6B6CE0(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_mediaObject));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___timeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___speedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___transcriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___waveformView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___horizontalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___verticalStackView));
}

@end
