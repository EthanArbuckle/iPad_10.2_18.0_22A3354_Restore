@implementation CKNavBarConversationIdentityView

- (CKNavBarConversationIdentityViewDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CKNavBarConversationIdentityView_delegate;
  swift_beginAccess();
  return (CKNavBarConversationIdentityViewDelegate *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setDelegate:(id)a3
{
  CKNavBarConversationIdentityView *v4;

  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRetain();
  v4 = self;
  sub_18E713184();

  swift_unknownObjectRelease();
}

- (CKConversation)conversation
{
  return (CKConversation *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                   + OBJC_IVAR___CKNavBarConversationIdentityView_conversation));
}

- (void)setConversation:(id)a3
{
  id v4;
  CKNavBarConversationIdentityView *v5;

  v4 = a3;
  v5 = self;
  sub_18E7133CC(v4);

}

- (NSString)subtitle
{
  void *v2;

  swift_beginAccess();
  sub_18E7669BC();
  v2 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setSubtitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CKNavBarConversationIdentityView *v7;

  v4 = sub_18E768984();
  v6 = v5;
  v7 = self;
  CKNavBarConversationIdentityView.subtitle.setter(v4, v6);

}

- (BOOL)subtitleHidden
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKNavBarConversationIdentityView_subtitleHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setSubtitleHidden:(BOOL)a3
{
  CKNavBarConversationIdentityView *v4;

  v4 = self;
  CKNavBarConversationIdentityView.subtitleHidden.setter(a3);

}

- (BOOL)chevronHidden
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKNavBarConversationIdentityView_chevronHidden;
  swift_beginAccess();
  return *v2;
}

- (void)setChevronHidden:(BOOL)a3
{
  CKNavBarConversationIdentityView *v4;

  v4 = self;
  CKNavBarConversationIdentityView.chevronHidden.setter(a3);

}

- (int64_t)style
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKNavBarConversationIdentityView_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(int64_t)a3
{
  CKNavBarConversationIdentityView *v4;

  v4 = self;
  CKNavBarConversationIdentityView.style.setter((void *)a3);

}

- (CKNavBarConversationIdentityView)initWithConversation:(id)a3
{
  return (CKNavBarConversationIdentityView *)CKNavBarConversationIdentityView.init(conversation:)(a3);
}

- (CKNavBarConversationIdentityView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo32CKNavBarConversationIdentityViewC7ChatKitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)didMoveToWindow
{
  CKNavBarConversationIdentityView *v2;

  v2 = self;
  CKNavBarConversationIdentityView.didMoveToWindow()();

}

- (void)layoutSubviews
{
  CKNavBarConversationIdentityView *v2;

  v2 = self;
  CKNavBarConversationIdentityView.layoutSubviews()();

}

- (CGSize)intrinsicContentSize
{
  CKNavBarConversationIdentityView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = CKNavBarConversationIdentityView.intrinsicContentSize.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)handleTapWithRecognizer:(id)a3
{
  id v4;
  CKNavBarConversationIdentityView *v5;

  v4 = a3;
  v5 = self;
  sub_18E714EE0(v4);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_18E7151E0(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_1E276BE90, (uint64_t)sub_18E718034, (uint64_t)&block_descriptor_35_0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_18E7151E0(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_1E276BE40, (uint64_t)sub_18E718044, (uint64_t)&block_descriptor_28_2);
}

- (void)preferredContentSizeCategoryDidChangeWithView:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  CKNavBarConversationIdentityView *v8;
  id v9;

  sub_18E00F31C(0, (unint64_t *)&qword_1EE0FB950);
  v9 = a3;
  v7 = a4;
  v8 = self;
  if ((sub_18E768F54() & 1) != 0)
  {
    -[CKNavBarConversationIdentityView invalidateIntrinsicContentSize](v8, sel_invalidateIntrinsicContentSize);
    -[CKNavBarConversationIdentityView setNeedsLayout](v8, sel_setNeedsLayout);
  }

}

- (void)updateAvatarViewVisualIdentity
{
  CKNavBarConversationIdentityView *v2;

  v2 = self;
  CKNavBarConversationIdentityView.updateAvatarViewVisualIdentity()();

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIGestureRecognizer *v6;
  id v7;
  CKNavBarConversationIdentityView *v8;
  Swift::Bool v9;

  v6 = (UIGestureRecognizer *)a3;
  v7 = a4;
  v8 = self;
  v9 = CKNavBarConversationIdentityView.gestureRecognizer(_:shouldReceive:)(v6, (UITouch)v7);

  return v9;
}

- (BOOL)avatarWantsTapAtPoint:(CGPoint)a3 fromView:(id)a4
{
  CGFloat y;
  CGFloat x;
  UIView *v7;
  CKNavBarConversationIdentityView *v8;

  y = a3.y;
  x = a3.x;
  v7 = (UIView *)a4;
  v8 = self;
  LOBYTE(self) = CKNavBarConversationIdentityView.avatarWantsTap(at:from:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v7);

  return self & 1;
}

- (void)performAnimationForPhotoUpdate
{
  CKNavBarConversationIdentityView *v2;

  v2 = self;
  CKNavBarConversationIdentityView.performAnimationForPhotoUpdate()();

}

- (CKNavBarConversationIdentityView)initWithFrame:(CGRect)a3
{
  CKNavBarConversationIdentityView *result;

  result = (CKNavBarConversationIdentityView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKNavBarConversationIdentityView_delegate);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKNavBarConversationIdentityView_avatarViewController));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKNavBarConversationIdentityView_sharedProfileStateOracle));
}

- (void)conversationParticipantsChangedWithNotification:(id)a3
{
  sub_18E716BC8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_18E71689C);
}

- (void)conversationJoinStateChangedWithNotification:(id)a3
{
  sub_18E716BC8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_18E71689C);
}

- (void)chatDisplayNameChangedWithNotification:(id)a3
{
  sub_18E716BC8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_18E716AA0);
}

- (void)groupPhotoChangedWithNotification:(id)a3
{
  sub_18E716BC8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_18E716AA0);
}

- (void)addressBookChangedWithNotification:(id)a3
{
  sub_18E7172BC(self, (uint64_t)a2, (uint64_t)a3, sub_18E713808);
}

- (void)chatPropertiesChangedWithNotification:(id)a3
{
  sub_18E7172BC(self, (uint64_t)a2, (uint64_t)a3, sub_18E713184);
}

- (void)chatIsFilteredChangedWithNotification:(id)a3
{
  sub_18E7172BC(self, (uint64_t)a2, (uint64_t)a3, sub_18E713184);
}

- (void)chatItemsChangedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  CKNavBarConversationIdentityView *v8;
  uint64_t v9;

  v4 = sub_18E765F3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E765F18();
  v8 = self;
  sub_18E716C8C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)nicknameStoreChangedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = sub_18E765F3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E765F18();
  -[CKNavBarConversationIdentityView performAnimationForPhotoUpdate](self, sel_performAnimationForPhotoUpdate);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)chatKeyTransparencyChangedWithNotification:(id)a3
{
  sub_18E7172BC(self, (uint64_t)a2, (uint64_t)a3, sub_18E713808);
}

@end
