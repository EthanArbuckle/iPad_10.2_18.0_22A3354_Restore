@implementation DeviceInformationView

- (UILabel)marketingNameLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_marketingNameLabel));
}

- (UILabel)descriptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_descriptionLabel));
}

- (UILabel)infoLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_infoLabel));
}

- (UILabel)deviceIdentifierLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_deviceIdentifierLabel));
}

- (UIButton)ellipsisButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_ellipsisButton));
}

- (UIButton)addButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_addButton));
}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                            + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_activityIndicator));
}

- (void)tintColorDidChange
{
  _TtC11Diagnostics21DeviceInformationView *v2;

  v2 = self;
  sub_100037480();

}

- (int64_t)infoLabelType
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_infoLabelType);
}

- (void)setInfoLabelType:(int64_t)a3
{
  _TtC11Diagnostics21DeviceInformationView *v4;

  v4 = self;
  sub_1000383B0(a3);

}

- (_TtC11Diagnostics21DeviceInformationView)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics21DeviceInformationView *)sub_1000387F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics21DeviceInformationView)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics21DeviceInformationView *)sub_100038F0C(a3);
}

- (void)addButtonPressedWithSender:(id)a3
{
  id v4;
  _TtC11Diagnostics21DeviceInformationView *v5;

  v4 = a3;
  v5 = self;
  sub_10003C700((uint64_t)v4);

}

- (void)ellipsisButtonPressedWithSender:(id)a3
{
  id v4;
  _TtC11Diagnostics21DeviceInformationView *v5;

  v4 = a3;
  v5 = self;
  sub_10003C75C((uint64_t)v4);

}

- (void)infoLabelTapped
{
  _TtC11Diagnostics21DeviceInformationView *v2;

  v2 = self;
  sub_10003C880();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_marketingNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_infoLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_deviceIdentifierLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_ellipsisButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_activityIndicator));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_state));
  swift_bridgeObjectRelease(*(_QWORD *)&self->fontSizeMarketingName[OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_deviceIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->fontSizeMarketingName[OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_serialNumber]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->fontSizeMarketingName[OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_imei]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->fontSizeMarketingName[OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_marketingName]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_deviceImageView));
  sub_10003CDFC((uint64_t)self + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_delegate);
  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_containerLayoutUpdateHandler), *(_QWORD *)&self->fontSizeMarketingName[OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_containerLayoutUpdateHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_marketingNameLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_infoLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_addButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_ellipsisButtonImageWidthConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC11Diagnostics21DeviceInformationView_contentDependentConstraints));
}

@end
