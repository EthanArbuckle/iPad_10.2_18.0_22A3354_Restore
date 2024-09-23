@implementation TextFieldCollectionViewCell

- (_TtC18HealthExperienceUI27TextFieldCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI27TextFieldCollectionViewCell *)TextFieldCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI27TextFieldCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI27TextFieldCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)traitCollectionDidChange:(id)a3
{
  _TtC18HealthExperienceUI27TextFieldCollectionViewCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A9960F00(a3);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  _TtC18HealthExperienceUI27TextFieldCollectionViewCell *v3;
  uint64_t (*v4)(void);
  id v5;
  _TtC18HealthExperienceUI27TextFieldCollectionViewCell *v6;

  v3 = self;
  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.super.super.super.isa) + 0x190);
  v5 = a3;
  v6 = v3;
  LOBYTE(v3) = v4();

  return v3 & 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtC18HealthExperienceUI27TextFieldCollectionViewCell *v6;

  v4 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.super.super.super.isa) + 0x198);
  v5 = a3;
  v6 = self;
  v4();

}

- (void)textFieldDidEndEditing:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtC18HealthExperienceUI27TextFieldCollectionViewCell *v6;

  v4 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.super.super.super.isa) + 0x1A0);
  v5 = a3;
  v6 = self;
  v4();

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  _TtC18HealthExperienceUI27TextFieldCollectionViewCell *v10;

  length = a4.length;
  location = a4.location;
  _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
  v9 = a3;
  v10 = self;
  LOBYTE(length) = sub_1A996221C(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27TextFieldCollectionViewCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27TextFieldCollectionViewCell____lazy_storage___proxy));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27TextFieldCollectionViewCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27TextFieldCollectionViewCell____lazy_storage___valueField));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
