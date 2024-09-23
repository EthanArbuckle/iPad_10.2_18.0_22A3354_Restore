@implementation STKStickerView

- (BOOL)isPaused
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKStickerView_isPaused;
  swift_beginAccess();
  return *v2;
}

- (void)setIsPaused:(BOOL)a3
{
  STKStickerView *v4;

  v4 = self;
  sub_23461FD84(a3);

}

- (BOOL)isDragInteractionEnabled
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_dragInteraction);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, sel_isEnabled);
  return (char)v2;
}

- (void)setIsDragInteractionEnabled:(BOOL)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_dragInteraction), sel_setEnabled_, a3);
}

- (STKStickerEffect)effect
{
  return (STKStickerEffect *)sub_234620AFC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKStickerView_effect);
}

- (void)setEffect:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  STKStickerView *v8;
  void *v9;
  id v10;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_effect);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  v9 = *v5;
  v10 = v9;
  sub_23462162C((char *)v9);

}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___STKStickerView__image));
}

- (CGRect)contentFrame
{
  STKStickerView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  sub_2346202F8();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)dragPreviewLiftContainerProvider
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_dragPreviewLiftContainerProvider);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2346205A0;
  aBlock[3] = &block_descriptor_56;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setDragPreviewLiftContainerProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_23462BBE4;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___STKStickerView_dragPreviewLiftContainerProvider);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_2345B0C7C(v7);
}

- (BOOL)boundsIncludeStroke
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKStickerView_boundsIncludeStroke;
  swift_beginAccess();
  return *v2;
}

- (void)setBoundsIncludeStroke:(BOOL)a3
{
  BOOL *v5;
  uint64_t v6;

  v5 = (BOOL *)self + OBJC_IVAR___STKStickerView_boundsIncludeStroke;
  swift_beginAccess();
  *v5 = a3;
  v6 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_effectView);
  if (v6)
    *(_BYTE *)(v6 + OBJC_IVAR____SKIStickerEffectViewInternal_boundsIncludeStroke) = a3;
}

- (STKImageGlyph)imageGlyph
{
  return (STKImageGlyph *)sub_234620AFC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STKStickerView_imageGlyph);
}

- (void)setImageGlyph:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_imageGlyph);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)dealloc
{
  void *v3;
  STKStickerView *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for StickerView();
  -[STKStickerView dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{

  sub_2345B0C7C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___STKStickerView_dragPreviewLiftContainerProvider));

  sub_2345B0988((uint64_t)self + OBJC_IVAR___STKStickerView_animatedPlaybackStartDate, (uint64_t *)&unk_256176430);
}

- (STKStickerView)initWithFrame:(CGRect)a3
{
  STKStickerView *result;

  StickerView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (STKStickerView)initWithCoder:(id)a3
{
  STKStickerView *result;

  StickerView.init(coder:)(a3);
  return result;
}

- (void)updateEffect:(id)a3
{
  id v5;
  STKStickerView *v6;

  v5 = a3;
  v6 = self;
  sub_23462162C((char *)a3);

}

- (void)layoutSubviews
{
  STKStickerView *v2;

  v2 = self;
  sub_2346218A8();

}

- (void)configureWithImage:(id)a3 imageGlyph:(id)a4 effect:(id)a5
{
  sub_234621E40(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_2505C27F0, (uint64_t)&unk_256176480);
}

- (void)configureWithAnimatedImage:(id)a3 imageGlyph:(id)a4 effect:(id)a5
{
  sub_234621E40(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_2505C27C8, (uint64_t)&unk_256176478);
}

- (void)animatedImageForImageGlyph:(STKImageGlyph *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  STKImageGlyph *v15;
  STKStickerView *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_256176460;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_256179330;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2346F6DA0((uint64_t)v9, (uint64_t)&unk_256176470, (uint64_t)v14);
  swift_release();
}

- (void)playSettlingAnimation
{
  void *v2;
  STKStickerView *v3;
  char *v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKStickerView_effectView);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    *(CFTimeInterval *)&v4[OBJC_IVAR____SKIStickerEffectViewInternal_settlingStartTime] = CACurrentMediaTime();
    sub_2346D5800();

  }
}

- (id)currentImageWithEffectFlipped:(BOOL)a3
{
  STKStickerView *v4;
  id v5;

  v4 = self;
  v5 = sub_23462376C(a3);

  return v5;
}

- (void)animatedStickerCreationProgressChangedWithInfo:(id)a3 progress:(double)a4
{
  unint64_t v6;
  STKStickerView *v7;

  v6 = sub_2347176C4();
  v7 = self;
  sub_234623A6C(v6, a4);

  swift_bridgeObjectRelease();
}

- (void)didMoveToWindow
{
  STKStickerView *v2;

  v2 = self;
  sub_234623EF8();

}

- (void)prepareForReuse
{
  STKStickerView *v2;

  v2 = self;
  sub_234624044();

}

- (void)willDisplay
{
  STKStickerView *v2;

  v2 = self;
  sub_234622DF8();

}

- (void)didEndDisplaying
{
  STKStickerView *v2;

  v2 = self;
  sub_234622B48();

}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  STKStickerView *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = _s10StickerKit0A4ViewC15dragInteraction_17previewForLifting7sessionSo21UITargetedDragPreviewCSgSo06UIDragE0C_So0M4ItemCSo0M7Session_ptF_0();

  swift_unknownObjectRelease();
  return v10;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  void *v6;
  id v7;
  STKStickerView *v8;
  id v9;
  id v10;

  v6 = (void *)objc_opt_self();
  v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  v9 = objc_msgSend(v6, sel_defaultCenter);
  v10 = v9;
  if (qword_256171BD8 != -1)
  {
    swift_once();
    v9 = v10;
  }
  objc_msgSend(v9, sel_postNotificationName_object_, qword_256188148, v8);

  swift_unknownObjectRelease();
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  STKStickerView *v6;
  void *v7;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  _s10StickerKit0A4ViewC15dragInteraction_17itemsForBeginningSaySo10UIDragItemCGSo0iE0C_So0I7Session_ptF_0();

  swift_unknownObjectRelease();
  sub_2345B0BE8(0, &qword_256176440);
  v7 = (void *)sub_2347178A4();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v7;
  STKStickerView *v8;

  v7 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = self;
  sub_23462AA4C(a4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (id)_dragInteraction:(id)a3 sessionPropertiesForSession:(id)a4
{
  id v6;
  id v7;
  STKStickerView *v8;
  id v9;

  v6 = objc_allocWithZone(MEMORY[0x24BEBDBF8]);
  v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  v9 = objc_msgSend(v6, sel_init);
  objc_msgSend(v9, sel_set_wantsElasticEffects_, 1);
  objc_msgSend(v9, sel_set_resizable_, 1);
  objc_msgSend(v9, sel_set_minimumResizableSize_, CGPointMake(objc_msgSend(v9, sel_set_rotatable_, 1), 32.0));
  objc_msgSend(v9, sel_set_maximumResizableSize_, 300.0, 300.0);

  swift_unknownObjectRelease();
  return v9;
}

- (void)dragInteraction:(id)a3 session:(id)a4 willEndWithOperation:(unint64_t)a5
{
  id v7;
  STKStickerView *v8;

  v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  sub_23462AB60(a5);

  swift_unknownObjectRelease();
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v8;
  id v9;
  STKStickerView *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_23462AFB4((uint64_t)a5);

  swift_unknownObjectRelease();
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
  id v4;
  STKStickerView *v5;

  v4 = a3;
  v5 = self;
  _s10StickerKit0A4ViewC44_dragInteractionDidCancelLiftWithoutDraggingyySo06UIDragE0CF_0();

}

- (void)displayLinkDidFire:(id)a3
{
  id v4;
  STKStickerView *v5;

  v4 = a3;
  v5 = self;
  sub_23462B838();

}

@end
