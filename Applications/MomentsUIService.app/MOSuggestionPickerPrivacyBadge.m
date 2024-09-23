@implementation MOSuggestionPickerPrivacyBadge

- (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge *)specialized MOSuggestionPickerPrivacyBadge.init(frame:)();
}

- (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge)initWithCoder:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  objc_class *v16;
  _TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge *result;

  v5 = OBJC_IVAR____TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge_iconView;
  v6 = CGRectMake();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (objc_class *)type metadata accessor for MOSuggestionPickerBadgeIconView();
  v14 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(objc_allocWithZone(v13), "initWithFrame:", v6, v8, v10, v12);
  v15 = OBJC_IVAR____TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge_label;
  closure #1 in variable initialization expression of MOSuggestionPickerPrivacyBadge.label();
  *(Class *)((char *)&self->super.super.super.super.isa + v15) = v16;

  result = (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001A6460, "MomentsUIService/MOSuggestionPickerPrivacyBadge.swift", 53, 2, 49, 0);
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge)initWithEffect:(id)a3
{
  id v3;
  _TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge *result;

  v3 = a3;
  result = (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge *)_swift_stdlib_reportUnimplementedInitializer("MomentsUIService.MOSuggestionPickerPrivacyBadge", 47, "init(effect:)", 13, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge_label));
}

@end
