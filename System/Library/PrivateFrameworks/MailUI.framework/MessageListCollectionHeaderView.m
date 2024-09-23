@implementation MessageListCollectionHeaderView

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  _TtC6MailUI31MessageListCollectionHeaderView *v2;
  id v5;

  v2 = self;
  v5 = MessageListCollectionHeaderView.layoutValuesHelper.getter();

  return (MessageListCellLayoutValuesHelper *)v5;
}

- (void)setLayoutValuesHelper:(id)a3
{
  id v4;
  _TtC6MailUI31MessageListCollectionHeaderView *v5;

  v4 = a3;
  v5 = self;
  MessageListCollectionHeaderView.layoutValuesHelper.setter(a3);

}

- (BOOL)useSplitViewStyling
{
  _TtC6MailUI31MessageListCollectionHeaderView *v2;

  v2 = self;
  MessageListCollectionHeaderView.useSplitViewStyling.getter();

  return sub_1D565EE08() & 1;
}

- (void)setUseSplitViewStyling:(BOOL)a3
{
  _TtC6MailUI31MessageListCollectionHeaderView *v3;
  char v4;

  v3 = self;
  v4 = sub_1D565EE14();
  MessageListCollectionHeaderView.useSplitViewStyling.setter(v4 & 1);

}

- (NSString)title
{
  _TtC6MailUI31MessageListCollectionHeaderView *v2;
  uint64_t v3;
  uint64_t v5;
  id v6;
  uint64_t v8;

  v2 = self;
  MessageListCollectionHeaderView.title.getter();
  v8 = v3;

  if (v8)
  {
    v5 = sub_1D565FDF8();
    swift_bridgeObjectRelease();
    v6 = (id)v5;
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setTitle:(id)a3
{
  id v3;
  _TtC6MailUI31MessageListCollectionHeaderView *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  v4 = self;
  if (a3)
  {
    v6 = sub_1D565FE10();
    v7 = v5;

    v8 = v6;
    v9 = v7;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  MessageListCollectionHeaderView.title.setter(v8, v9);

}

- (_TtC6MailUI31MessageListCollectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC6MailUI31MessageListCollectionHeaderView *)sub_1D55E2E9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6MailUI31MessageListCollectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D55E347C();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  id v4;
  _TtC6MailUI31MessageListCollectionHeaderView *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC6MailUI31MessageListCollectionHeaderView *v11;

  v11 = self;
  v10 = a3;
  v9 = sub_1D565F0B4();
  v7 = *(_QWORD *)(v9 - 8);
  v6 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = (uint64_t)&v6 - v6;
  v4 = (id)MEMORY[0x1E0C80A78](v10);
  v5 = self;
  sub_1D565F0A8();
  MessageListCollectionHeaderView.updateConfiguration(using:)(v8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);

}

- (void).cxx_destruct
{
  sub_1D5565D18((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI31MessageListCollectionHeaderView_layoutValuesHelper));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6MailUI31MessageListCollectionHeaderView_titleLabel));
}

@end
