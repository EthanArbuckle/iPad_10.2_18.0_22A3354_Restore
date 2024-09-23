@implementation PHDialerContactResultButtonView

- (UILabel)primaryLabel
{
  PHDialerContactResultButtonView *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_100168420();
  v4 = v3;

  return (UILabel *)v4;
}

- (void)setPrimaryLabel:(id)a3
{
  id v4;
  PHDialerContactResultButtonView *v5;

  v4 = a3;
  v5 = self;
  sub_1001684B4((uint64_t)v4);

}

- (PHDialerContactResultButtonView)initWithType:(int64_t)a3
{
  return (PHDialerContactResultButtonView *)sub_1001689A4(a3);
}

- (PHDialerContactResultButtonView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100168FA4();
}

- (void)shouldPrioritizeName
{
  PHDialerContactResultButtonView *v2;

  v2 = self;
  sub_1001690E8(1000.0, 750.0);

}

- (void)shouldPrioritizeNumber
{
  PHDialerContactResultButtonView *v2;

  v2 = self;
  sub_1001690E8(750.0, 1000.0);

}

- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4
{
  id v7;
  id v8;
  PHDialerContactResultButtonView *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1001691B8((uint64_t)a3);

}

- (void)configureWithPrimaryTitle:(id)a3 secondaryTitle:(id)a4 searchString:(id)a5 isNumberPriority:(BOOL)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  PHDialerContactResultButtonView *v15;

  if (a5)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_100169714(a3, (uint64_t)a4, v10, v12, a6);

  swift_bridgeObjectRelease(v12);
}

- (void)handleContentSizeCategoryDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  PHDialerContactResultButtonView *v11;
  uint64_t v12;

  v5 = sub_1001085C0(&qword_1002DC2F0);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = type metadata accessor for Notification(0);
    v10 = 0;
  }
  else
  {
    v9 = type metadata accessor for Notification(0);
    v10 = 1;
  }
  sub_100108600((uint64_t)v8, v10, 1, v9);
  v11 = self;
  sub_100169860((uint64_t)v8);

  sub_1001209C8((uint64_t)v8, &qword_1002DC2F0);
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (NSString)largeContentTitle
{
  PHDialerContactResultButtonView *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100169B54();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setLargeContentTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  PHDialerContactResultButtonView *v6;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_100169CE8((uint64_t)v6, v5);

}

- (PHDialerContactResultButtonView)initWithFrame:(CGRect)a3
{
  sub_100169CF0();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___primaryLabel));
  sub_100111CAC(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___secondaryLabel));
  v3 = (char *)self + OBJC_IVAR___PHDialerContactResultButtonView_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PHDialerContactResultButtonView____lazy_storage___stackView));
}

@end
