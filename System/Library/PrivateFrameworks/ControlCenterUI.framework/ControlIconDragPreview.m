@implementation ControlIconDragPreview

- (_TtC15ControlCenterUI22ControlIconDragPreview)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1CFBB8270();
}

- (BOOL)isFlocked
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_isFlocked);
}

- (void)setFlocked:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_isFlocked) = a3;
}

- (BOOL)iconAllowsLabelArea
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsLabelArea);
}

- (void)setIconAllowsLabelArea:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsLabelArea) = a3;
}

- (BOOL)iconAllowsAccessory
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsAccessory);
}

- (void)setIconAllowsAccessory:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconAllowsAccessory) = a3;
}

- (BOOL)iconIsEditing
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconIsEditing);
}

- (void)setIconIsEditing:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconIsEditing) = a3;
}

- (BOOL)iconCanShowCloseBox
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowCloseBox);
}

- (void)setIconCanShowCloseBox:(BOOL)a3
{
  sub_1CFBB6F54((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowCloseBox, (SEL *)&selRef_setAllowsCloseBox_);
}

- (BOOL)iconCanShowResizeHandle
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowResizeHandle);
}

- (void)setIconCanShowResizeHandle:(BOOL)a3
{
  sub_1CFBB6F54((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconCanShowResizeHandle, (SEL *)&selRef_setAllowsResizeHandle_);
}

- (double)iconContentScale
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconContentScale);
}

- (void)setIconContentScale:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconContentScale) = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView), sel_setIconContentScale_);
}

- (id)cleanUpHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler))
    return 0;
  v2 = *(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
  v5[4] = *(Class *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_1CFBB7040;
  v5[3] = &block_descriptor_11;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setCleanUpHandler:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;

  v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v5;
    v6 = sub_1CFBB85C8;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
  v8 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_1CFBB8538(v8);
}

- (unint64_t)dragState
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview__dragState);
}

- (void)setDragState:(unint64_t)a3
{
  _TtC15ControlCenterUI22ControlIconDragPreview *v4;

  v4 = self;
  sub_1CFBB7144(a3);

}

- (SBIcon)icon
{
  return (SBIcon *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView), sel_icon);
}

- (void)setIcon:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView), sel_setIcon_, a3);
}

- (void)setIconViewListLayoutProvider:(id)a3
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView);
  if (v3)
    objc_msgSend(v3, sel_setListLayoutProvider_, a3);
}

- (void)setIconViewCustomIconImageViewController:(id)a3
{
  id v5;
  _TtC15ControlCenterUI22ControlIconDragPreview *v6;

  v5 = a3;
  v6 = self;
  sub_1CFBB7440(a3);

}

- (id)setIconViewDelegate:(uint64_t)a3
{
  swift_unknownObjectWeakAssign();
  return objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView), sel_setDelegate_, a3);
}

- (void)draggingSourceDroppedWithOperation:(unint64_t)a3
{
  _TtC15ControlCenterUI22ControlIconDragPreview *v3;

  v3 = self;
  sub_1CFBB83B8();

}

- (void)dropDestinationAnimationCompleted
{
  _TtC15ControlCenterUI22ControlIconDragPreview *v2;

  v2 = self;
  sub_1CFBB75FC();

}

- (id)delayCleanUpForReason:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  _BYTE *v8;
  uint64_t *v9;
  _TtC15ControlCenterUI22ControlIconDragPreview *v10;
  _TtC15ControlCenterUI22ControlIconDragPreview *v11;
  id v12;
  objc_super v14;

  v4 = sub_1CFBFA894();
  v6 = v5;
  v7 = (objc_class *)type metadata accessor for ControlIconDragPreviewDelayCleanupAssertion();
  v8 = objc_allocWithZone(v7);
  v8[OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_isInvalidated] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_dragPreview] = self;
  v9 = (uint64_t *)&v8[OBJC_IVAR____TtC15ControlCenterUI43ControlIconDragPreviewDelayCleanupAssertion_reason];
  *v9 = v4;
  v9[1] = v6;
  v14.receiver = v8;
  v14.super_class = v7;
  v10 = self;
  swift_bridgeObjectRetain();
  v11 = -[ControlIconDragPreview init](&v14, sel_init);
  v12 = sub_1CFBB78CC();
  objc_msgSend(v12, sel_addObject_, v11, v14.receiver, v14.super_class);

  swift_bridgeObjectRelease();
  return v11;
}

- (void)layoutSubviews
{
  _TtC15ControlCenterUI22ControlIconDragPreview *v2;

  v2 = self;
  sub_1CFBB7754();

}

- (_TtC15ControlCenterUI22ControlIconDragPreview)initWithFrame:(CGRect)a3
{
  _TtC15ControlCenterUI22ControlIconDragPreview *result;

  result = (_TtC15ControlCenterUI22ControlIconDragPreview *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_referenceIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconView));
  sub_1CFBB8538(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_cleanUpHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_customIconImageViewController));
  sub_1CFBB85D8((uint64_t)self + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview_iconViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI22ControlIconDragPreview____lazy_storage___delayCleanupAssertions));
}

@end
