@implementation CKMessageHistoryViewController

- (CKMessageHistoryViewControllerDelegate)messageHistoryDelegate
{
  return (CKMessageHistoryViewControllerDelegate *)sub_18E5A7928((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKMessageHistoryViewController_messageHistoryDelegate);
}

- (void)setMessageHistoryDelegate:(id)a3
{
  sub_18E660778();
}

- (CKMessageHistoryViewControllerDataSource)messageHistoryDataSource
{
  return (CKMessageHistoryViewControllerDataSource *)sub_18E5A7928((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CKMessageHistoryViewController_messageHistoryDataSource);
}

- (void)setMessageHistoryDataSource:(id)a3
{
  sub_18E660778();
}

- (void)viewDidLoad
{
  CKMessageHistoryViewController *v2;

  v2 = self;
  sub_18E7184C0();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  id v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MessageHistoryViewController();
  v2 = v6.receiver;
  -[CKMessageHistoryViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  v3 = sub_18E7183E8();
  objc_msgSend(v3, sel_intrinsicContentSize, v6.receiver, v6.super_class);
  v5 = v4;

  objc_msgSend(v2, sel_setPreferredContentSize_, -1.0, v5);
}

- (CKMessageHistoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_18E768984();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (CKMessageHistoryViewController *)MessageHistoryViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (CKMessageHistoryViewController)initWithCoder:(id)a3
{
  return (CKMessageHistoryViewController *)MessageHistoryViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKMessageHistoryViewController_messageHistoryDelegate);
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKMessageHistoryViewController_messageHistoryDataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKMessageHistoryViewController_messageHistoryForVisibleDateComponents));
  sub_18E00FA98((uint64_t)self + OBJC_IVAR___CKMessageHistoryViewController_oldestMessageDate, &qword_1EE0F4800);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKMessageHistoryViewController____lazy_storage___calendarView));
}

- (id)calendarView:(id)a3 decorationForDateComponents:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  CKMessageHistoryViewController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_18E766038();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E765FC0();
  v10 = a3;
  v11 = self;
  v12 = sub_18E71A978();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)calendarView:(id)a3 didChangeVisibleDateComponentsFrom:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  CKMessageHistoryViewController *v11;
  uint64_t v12;

  v6 = sub_18E766038();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E765FC0();
  v10 = a3;
  v11 = self;
  _s7ChatKit28MessageHistoryViewControllerC08calendarE0_34didChangeVisibleDateComponentsFromySo010UICalendarE0C_10Foundation0kL0VtF_0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)dateSelection:(id)a3 didSelectDate:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  CKMessageHistoryViewController *v13;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1118A0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_18E765FC0();
    v10 = sub_18E766038();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_18E766038();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  v12 = a3;
  v13 = self;
  sub_18E71AC8C((uint64_t)v9);

  sub_18E00FA98((uint64_t)v9, &qword_1EE1118A0);
}

- (BOOL)dateSelection:(id)a3 canSelectDate:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  CKMessageHistoryViewController *v13;
  BOOL v14;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE1118A0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_18E765FC0();
    v10 = sub_18E766038();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_18E766038();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  v12 = a3;
  v13 = self;
  v14 = sub_18E71B064((uint64_t)v9);

  sub_18E00FA98((uint64_t)v9, &qword_1EE1118A0);
  return v14;
}

@end
