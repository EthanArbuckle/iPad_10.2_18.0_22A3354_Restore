@implementation CKTapbackPickerBalloonParentView

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TapbackPickerBalloonParentView();
  -[CKTapbackPickerBalloonParentView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TapbackPickerBalloonParentView();
  v7 = v8.receiver;
  -[CKTapbackPickerBalloonParentView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  sub_18E5A767C();

}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPickerBalloonParentView();
  return -[CKTapbackPickerBalloonParentView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  CKTapbackPickerBalloonParentView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_18E5AC088((uint64_t)a3);

}

- (CKTapbackPickerBalloonParentViewDelegate)delegate
{
  return (CKTapbackPickerBalloonParentViewDelegate *)sub_18E5A7928((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKTapbackPickerBalloonParentView_delegate);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (CKGradientReferenceView)gradientReferenceView
{
  return (CKGradientReferenceView *)sub_18E5A7928((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKTapbackPickerBalloonParentView_gradientReferenceView);
}

- (void)setGradientReferenceView:(id)a3
{
  CKTapbackPickerBalloonParentView *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_18E5AC144();

}

- (CKTapbackPickerViewController)tapbackPickerViewController
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR___CKTapbackPickerBalloonParentView_tapbackPickerViewController);
  swift_beginAccess();
  return (CKTapbackPickerViewController *)*v2;
}

- (void)setTapbackPickerViewController:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  CKTapbackPickerBalloonParentView *v8;

  v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___CKTapbackPickerBalloonParentView_tapbackPickerViewController);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_18E5A7D94();
}

- (CKTapbackPickerBalloonDisplayConfiguration)displayConfiguration
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackPickerBalloonParentView_displayConfiguration);
  swift_beginAccess();
  return (CKTapbackPickerBalloonDisplayConfiguration *)*v2;
}

- (void)setDisplayConfiguration:(id)a3
{
  CKTapbackPickerBalloonParentView *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_18E5AC230(v5);

}

- (int64_t)currentDisplayMode
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKTapbackPickerBalloonParentView_currentDisplayMode);
  swift_beginAccess();
  return *v2;
}

- (void)setCurrentDisplayMode:(int64_t)a3
{
  CKTapbackPickerBalloonParentView *v4;

  v4 = self;
  sub_18E5A821C(a3);

}

- (CKTapbackPickerBalloonParentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E5AC7B4();
}

- (CKTapbackPickerBalloonParentView)initWithTapbackPickerPreferredContentSize:(CGSize)a3
{
  return (CKTapbackPickerBalloonParentView *)TapbackPickerBalloonParentView.init(tapbackPickerPreferredContentSize:)(a3.width, a3.height);
}

- (void)interfaceStyleChanged
{
  CKTapbackPickerBalloonParentView *v2;

  v2 = self;
  sub_18E5AAC30();

}

- (void)dealloc
{
  CKTapbackPickerBalloonParentView *v2;

  v2 = self;
  TapbackPickerBalloonParentView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_bottomPileMetaballContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_bottomPileContentContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_primaryContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_messageBalloonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_frontPileMetaballContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_frontPileContentContainer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_accessoryItemsContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_inputController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_presentationTintColor));
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackPickerBalloonParentView_delegate);

  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackPickerBalloonParentView_gradientReferenceView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_tapbackPickerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerBalloonParentView_displayConfiguration));
}

- (void)dismiss
{
  CKTapbackPickerBalloonParentView *v2;

  v2 = self;
  sub_18E5A9D68();

}

- (void)returnToSelection
{
  CKTapbackPickerBalloonParentView *v2;

  v2 = self;
  sub_18E5AA010();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  CKTapbackPickerBalloonParentView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_18E5AA7EC((uint64_t)a4, x, y);

  return v10;
}

- (void)layoutSubviews
{
  CKTapbackPickerBalloonParentView *v2;

  v2 = self;
  sub_18E5AAAF4();

}

- (CKTapbackPickerBalloonParentView)initWithFrame:(CGRect)a3
{
  CKTapbackPickerBalloonParentView *result;

  result = (CKTapbackPickerBalloonParentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)showEmojiKeyboard
{
  char *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  CKTapbackPickerBalloonParentView *v7;
  CKTapbackPickerBalloonParentView *v8;

  v3 = (char *)self + OBJC_IVAR___CKTapbackPickerBalloonParentView_delegate;
  swift_beginAccess();
  v4 = (void *)MEMORY[0x193FF501C](v3);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_respondsToSelector_, sel_tapbackPickerBalloonParentViewRequestedShowEmojiKeyboard_);
    v7 = self;
    if ((v6 & 1) != 0)
      objc_msgSend(v5, sel_tapbackPickerBalloonParentViewRequestedShowEmojiKeyboard_, v7);
    swift_unknownObjectRelease();
  }
  else
  {
    v8 = self;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackPickerBalloonParentView_inputController), sel_becomeFirstResponder);

}

- (void)insertEmoji:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  CKTapbackPickerBalloonParentView *v7;
  Swift::String v8;

  v4 = sub_18E768984();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  TapbackPickerBalloonParentView.insertEmoji(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)insertTapback:(id)a3
{
  id v4;
  CKTapbackPickerBalloonParentView *v5;

  v4 = a3;
  v5 = self;
  TapbackPickerBalloonParentView.insertTapback(tapback:)(v4);

}

- (void)insertSticker:(id)a3
{
  id v4;
  CKTapbackPickerBalloonParentView *v5;

  v4 = a3;
  v5 = self;
  sub_18E72F7BC(v4);

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v7;
  CKTapbackPickerBalloonParentView *v8;
  void *v9;
  int v10;

  sub_18E768984();
  v7 = a3;
  v8 = self;
  v9 = (void *)sub_18E768954();
  v10 = CEMStringContainsEmoji();

  swift_bridgeObjectRelease();
  return v10 != 0;
}

- (void)textViewDidChange:(id)a3
{
  UITextView *v4;
  CKTapbackPickerBalloonParentView *v5;

  v4 = (UITextView *)a3;
  v5 = self;
  TapbackPickerBalloonParentView.textViewDidChange(_:)(v4);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CKTapbackPickerBalloonParentView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = _s7ChatKit30TapbackPickerBalloonParentViewC12sizeThatFitsySo6CGSizeVAFF_0();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)preferredOriginXWithBalloonSourceFrame:(CGRect)a3 presentationBounds:(CGRect)a4 proposedSize:(CGSize)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CKTapbackPickerBalloonParentView *v11;
  double v12;
  double v13;
  CGFloat width;
  CGFloat height;
  CGFloat v17;
  CGFloat v18;

  width = a4.size.width;
  height = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  v7 = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v11 = self;
  TapbackPickerBalloonParentView.preferredOriginX(withBalloonSourceFrame:presentationBounds:proposedSize:)(v10, v9, v8, v7, x, y, width, height, v17, v18);
  v13 = v12;

  return v13;
}

@end
