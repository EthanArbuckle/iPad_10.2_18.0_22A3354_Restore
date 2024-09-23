@implementation PopoverTip.PopoverContainer

- (void)prepareForPopoverPresentation:(id)a3
{
  id v5;
  _TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F616PopoverContainer *v6;

  sub_2354246CC();
  sub_2354246C0();
  sub_2354246B4();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  sub_23542098C(v5);
  swift_release();

}

- (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F616PopoverContainer)init
{
  return (_TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F616PopoverContainer *)sub_235420B30();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy();
  v3 = (char *)self
     + OBJC_IVAR____TtCV6TipKit10PopoverTipP33_FA7A00E5D8BDD1BDC1C9B8F9105F43F616PopoverContainer___observationRegistrar;
  v4 = sub_235423B20();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
