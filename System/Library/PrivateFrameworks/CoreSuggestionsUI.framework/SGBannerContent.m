@implementation SGBannerContent

- (_TtC17CoreSuggestionsUI15SGBannerContent)init
{
  _TtC17CoreSuggestionsUI15SGBannerContent *result;

  SGBannerContent.init()();
  OUTLINED_FUNCTION_41();
  return result;
}

- (NSString)title
{
  return (NSString *)sub_1B117FFC4(self, (uint64_t)a2, sub_1B117F8B4);
}

- (void)setTitle:(id)a3
{
  sub_1B1180034(self);
}

- (NSString)subtitle
{
  return (NSString *)sub_1B1180A7C(self, (uint64_t)a2, sub_1B117F9A8);
}

- (void)setSubtitle:(id)a3
{
  sub_1B1180ACC(self, (uint64_t)a2, (uint64_t)a3);
}

- (NSAttributedString)attributedSubtitle
{
  id v2;

  sub_1B117FAAC();
  return (NSAttributedString *)OUTLINED_FUNCTION_4_2(v2);
}

- (void)setAttributedSubtitle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  OUTLINED_FUNCTION_9_1((uint64_t)self, (uint64_t)a2, a3);
  v4 = v3;
  v5 = (void *)OUTLINED_FUNCTION_6_0();
  sub_1B117FB04(v5);
  OUTLINED_FUNCTION_3(v6);
}

- (int64_t)accessoryType
{
  int64_t result;

  sub_1B117FD78();
  OUTLINED_FUNCTION_41();
  return result;
}

- (void)setAccessoryType:(int64_t)a3
{
  sub_1B117FDC0(a3);
  OUTLINED_FUNCTION_41();
}

- (NSArray)images
{
  return (NSArray *)sub_1B11808B0(self, (uint64_t)a2, (uint64_t (*)(void))sub_1B117FEC4, &qword_1ED380C50);
}

- (void)setImages:(id)a3
{
  sub_1B1180944(self, (uint64_t)a2, (uint64_t)a3, &qword_1ED380C50, 0x1E0DC3870, sub_1B117FEF4);
}

- (NSString)actionTitle
{
  return (NSString *)sub_1B117FFC4(self, (uint64_t)a2, sub_1B117FFF0);
}

- (void)setActionTitle:(id)a3
{
  sub_1B1180034(self);
}

- (SGSuggestion)suggestion
{
  id v2;

  sub_1B11801A0();
  return (SGSuggestion *)OUTLINED_FUNCTION_4_2(v2);
}

- (void)setSuggestion:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  OUTLINED_FUNCTION_23_3();
  v4 = v3;
  v5 = OUTLINED_FUNCTION_6_0();
  sub_1B11801E0(v5);
  OUTLINED_FUNCTION_3(v6);
}

- (SGSuggestionDelegate)delegate
{
  id v2;

  sub_1B11802C4();
  return (SGSuggestionDelegate *)OUTLINED_FUNCTION_4_2(v2);
}

- (void)setDelegate:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_23_3();
  v4 = v3;
  OUTLINED_FUNCTION_6_0();
  sub_1B118031C();
  OUTLINED_FUNCTION_3(v5);
}

- (double)primaryActionButtonWidth
{
  double result;

  sub_1B11804CC();
  OUTLINED_FUNCTION_41();
  return result;
}

- (void)setPrimaryActionButtonWidth:(double)a3
{
  sub_1B1180510(a3);
  OUTLINED_FUNCTION_41();
}

- (double)closeButtonWidth
{
  double result;

  sub_1B1180618();
  OUTLINED_FUNCTION_41();
  return result;
}

- (void)setCloseButtonWidth:(double)a3
{
  sub_1B118065C(a3);
  OUTLINED_FUNCTION_41();
}

- (int64_t)actionButtonType
{
  int64_t result;

  sub_1B1180764();
  OUTLINED_FUNCTION_41();
  return result;
}

- (void)setActionButtonType:(int64_t)a3
{
  sub_1B11807AC(a3);
  OUTLINED_FUNCTION_41();
}

- (NSArray)imageSGViews
{
  return (NSArray *)sub_1B11808B0(self, (uint64_t)a2, (uint64_t (*)(void))sub_1B1180914, (unint64_t *)&unk_1EEF10FC0);
}

- (void)setImageSGViews:(id)a3
{
  sub_1B1180944(self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&unk_1EEF10FC0, 0x1E0DC3F10, sub_1B11809AC);
}

- (NSString)listTitle
{
  return (NSString *)sub_1B1180A7C(self, (uint64_t)a2, sub_1B1180AB4);
}

- (void)setListTitle:(id)a3
{
  sub_1B1180ACC(self, (uint64_t)a2, (uint64_t)a3);
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  id v2;

  sub_1B1180C08();
  return (UIVisualEffectView *)OUTLINED_FUNCTION_4_2(v2);
}

- (void)setBackgroundVisualEffectView:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_9_1((uint64_t)self, (uint64_t)a2, a3);
  v4 = v3;
  OUTLINED_FUNCTION_6_0();
  sub_1B1180C60();
  OUTLINED_FUNCTION_3(v5);
}

- (UIColor)backgroundColor
{
  id v2;

  sub_1B1180D44();
  return (UIColor *)OUTLINED_FUNCTION_4_2(v2);
}

- (void)setBackgroundColor:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_9_1((uint64_t)self, (uint64_t)a2, a3);
  v4 = v3;
  OUTLINED_FUNCTION_6_0();
  sub_1B1180D9C();
  OUTLINED_FUNCTION_3(v5);
}

- (SGBannerDividerParameter)bannerDivider
{
  id v2;

  sub_1B1180E80();
  return (SGBannerDividerParameter *)OUTLINED_FUNCTION_4_2(v2);
}

- (void)setBannerDivider:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_9_1((uint64_t)self, (uint64_t)a2, a3);
  v4 = v3;
  OUTLINED_FUNCTION_6_0();
  sub_1B1180ED8();
  OUTLINED_FUNCTION_3(v5);
}

- (BOOL)suggestionCategorySupportsBatchDismissal
{
  char v2;

  sub_1B1180FC4();
  return v2 & 1;
}

- (void)setSuggestionCategorySupportsBatchDismissal:(BOOL)a3
{
  sub_1B118100C(a3);
  OUTLINED_FUNCTION_41();
}

- (SGSuggestionAction)primaryAction
{
  id v2;

  sub_1B1181114();
  return (SGSuggestionAction *)OUTLINED_FUNCTION_4_2(v2);
}

- (void)setPrimaryAction:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_9_1((uint64_t)self, (uint64_t)a2, a3);
  v4 = v3;
  OUTLINED_FUNCTION_6_0();
  sub_1B118116C();
  OUTLINED_FUNCTION_3(v5);
}

- (SGSuggestionAction)dismissAction
{
  id v2;

  sub_1B1181250();
  return (SGSuggestionAction *)OUTLINED_FUNCTION_4_2(v2);
}

- (void)setDismissAction:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  OUTLINED_FUNCTION_9_1((uint64_t)self, (uint64_t)a2, a3);
  v4 = v3;
  OUTLINED_FUNCTION_6_0();
  sub_1B11812A8();
  OUTLINED_FUNCTION_3(v5);
}

- (double)closeButtonXAnchorOffset
{
  double result;

  sub_1B11813C4();
  OUTLINED_FUNCTION_41();
  return result;
}

- (void)setCloseButtonXAnchorOffset:(double)a3
{
  sub_1B1181408(a3);
  OUTLINED_FUNCTION_41();
}

- (BOOL)prominentActionButton
{
  char v2;

  sub_1B1181518();
  return v2 & 1;
}

- (void)setProminentActionButton:(BOOL)a3
{
  sub_1B1181560(a3);
  OUTLINED_FUNCTION_41();
}

- (NSArray)iconSFSymbols
{
  uint64_t v3;

  sub_1B118168C();
  if (v3)
  {
    sub_1B11BB428();
    OUTLINED_FUNCTION_15_0();
  }
  else
  {
    self = 0;
  }
  return (NSArray *)OUTLINED_FUNCTION_4_2(self);
}

- (void)setIconSFSymbols:(id)a3
{
  uint64_t v4;
  _TtC17CoreSuggestionsUI15SGBannerContent *v5;

  if (a3)
    v4 = sub_1B11BB440();
  else
    v4 = 0;
  v5 = self;
  sub_1B1181734(v4);
  OUTLINED_FUNCTION_3(v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_17_2(OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_attributedSubtitle);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22_3();
  swift_unknownObjectRelease();
  sub_1B1181978((uint64_t)self + OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_delegate);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22_3();
  OUTLINED_FUNCTION_17_2(OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_backgroundVisualEffectView);
  OUTLINED_FUNCTION_17_2(OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_backgroundColor);
  OUTLINED_FUNCTION_17_2(OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_bannerDivider);
  OUTLINED_FUNCTION_17_2(OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_primaryAction);
  OUTLINED_FUNCTION_17_2(OBJC_IVAR____TtC17CoreSuggestionsUI15SGBannerContent_dismissAction);
  swift_bridgeObjectRelease();
}

@end
