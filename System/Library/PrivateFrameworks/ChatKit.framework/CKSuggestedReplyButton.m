@implementation CKSuggestedReplyButton

- (_TtC7ChatKit22CKSuggestedReplyButton)initWithCoder:(id)a3
{
  id v4;
  _TtC7ChatKit22CKSuggestedReplyButton *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit22CKSuggestedReplyButton____lazy_storage___titleLabel) = 0;
  v4 = a3;

  result = (_TtC7ChatKit22CKSuggestedReplyButton *)sub_18E769320();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKSuggestedReplyButton();
  return -[CKSuggestedReplyButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC7ChatKit22CKSuggestedReplyButton *v4;

  v4 = self;
  sub_18E735B9C(a3);

}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _TtC7ChatKit22CKSuggestedReplyButton *v8;
  BOOL v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  -[CKSuggestedReplyButton setHighlighted:](v8, sel_setHighlighted_, 1);
  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for CKSuggestedReplyButton();
  v9 = -[CKSuggestedReplyButton beginTrackingWithTouch:withEvent:](&v11, sel_beginTrackingWithTouch_withEvent_, v6, v7);

  return v9;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _TtC7ChatKit22CKSuggestedReplyButton *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  -[CKSuggestedReplyButton setHighlighted:](v8, sel_setHighlighted_, 0);
  v9.receiver = v8;
  v9.super_class = (Class)type metadata accessor for CKSuggestedReplyButton();
  -[CKSuggestedReplyButton endTrackingWithTouch:withEvent:](&v9, sel_endTrackingWithTouch_withEvent_, v6, v7);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4;
  _TtC7ChatKit22CKSuggestedReplyButton *v5;
  objc_super v6;

  v4 = a3;
  v5 = self;
  -[CKSuggestedReplyButton setHighlighted:](v5, sel_setHighlighted_, 0);
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for CKSuggestedReplyButton();
  -[CKSuggestedReplyButton cancelTrackingWithEvent:](&v6, sel_cancelTrackingWithEvent_, v4);

}

- (_TtC7ChatKit22CKSuggestedReplyButton)initWithFrame:(CGRect)a3
{
  _TtC7ChatKit22CKSuggestedReplyButton *result;

  result = (_TtC7ChatKit22CKSuggestedReplyButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit22CKSuggestedReplyButton____lazy_storage___titleLabel));
}

@end
