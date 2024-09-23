@implementation ClimateAutoModeLevelButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClimateAutoModeLevelButton();
  return -[ClimateButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  _QWORD *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ClimateAutoModeLevelButton();
  v4 = (char *)v7.receiver;
  -[ClimateButton setHighlighted:](&v7, "setHighlighted:", v3);
  v5 = *(_QWORD **)&v4[OBJC_IVAR____TtC7Climate26ClimateAutoModeLevelButton_progressView];
  if ((v4[OBJC_IVAR____TtC7Climate13ClimateButton_shouldBeHighlighted] & 1) != 0)
    v6 = 1;
  else
    v6 = (uint64_t)objc_msgSend(v4, "isHighlighted", v7.receiver, v7.super_class);
  (*(void (**)(uint64_t))((swift_isaMask & *v5) + 0xB8))(v6);

}

- (void)autoClimateControlService:(id)a3 didUpdateLevel:(unsigned __int8)a4
{
  uint64_t v4;
  void (*v6)(uint64_t);
  id v7;
  _TtC7Climate26ClimateAutoModeLevelButton *v8;
  objc_super v9;

  v4 = a4;
  v6 = *(void (**)(uint64_t))((**(_QWORD **)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                     + OBJC_IVAR____TtC7Climate26ClimateAutoModeLevelButton_progressView) & swift_isaMask)
                                      + 0x88);
  v7 = a3;
  v8 = self;
  v6(v4);
  v9.receiver = v8;
  v9.super_class = (Class)type metadata accessor for ClimateAutoModeLevelButton();
  -[ClimateAutoControlServiceButton autoClimateControlService:didUpdateLevel:](&v9, "autoClimateControlService:didUpdateLevel:", v7, v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate26ClimateAutoModeLevelButton_progressView));
}

@end
