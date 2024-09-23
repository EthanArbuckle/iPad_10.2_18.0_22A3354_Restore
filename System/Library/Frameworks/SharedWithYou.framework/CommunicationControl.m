@implementation CommunicationControl

- (CGSize)intrinsicContentSize
{
  _TtC13SharedWithYou20CommunicationControl *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_18EAD9680();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UILabel)label
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label));
}

- (BOOL)isEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CommunicationControl isEnabled](&v3, sel_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC13SharedWithYou20CommunicationControl *v6;
  char v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v6 = self;
  v7 = -[CommunicationControl isEnabled](&v9, sel_isEnabled);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  -[CommunicationControl setEnabled:](&v8, sel_setEnabled_, v3);
  sub_18EAD99DC(v7);

}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CommunicationControl tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[CommunicationControl setTintColor:](&v6, sel_setTintColor_, v4);
  sub_18EAD9E50();

}

- (_TtC13SharedWithYou20CommunicationControl)initWithCoder:(id)a3
{
  sub_18EADAC98(a3);
  return 0;
}

- (void)tintColorDidChange
{
  _TtC13SharedWithYou20CommunicationControl *v2;

  v2 = self;
  sub_18EADAE00();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC13SharedWithYou20CommunicationControl *v6;

  v5 = a3;
  v6 = self;
  sub_18EADAF74(a3);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC13SharedWithYou20CommunicationControl *v6;
  id v7;

  v5 = a3;
  v6 = self;
  v7 = sub_18EADB57C();

  return v7;
}

- (_TtC13SharedWithYou20CommunicationControl)initWithFrame:(CGRect)a3
{
  _TtC13SharedWithYou20CommunicationControl *result;

  result = (_TtC13SharedWithYou20CommunicationControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu));
}

@end
