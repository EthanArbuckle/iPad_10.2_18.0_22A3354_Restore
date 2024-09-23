@implementation LoggingCardTableView

- (LoggingCardTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  objc_super v7;

  -[LoggingCardTableView setPreviousContentSize:](self, "setPreviousContentSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), a3.size.width, a3.size.height);
  v7.receiver = self;
  v7.super_class = (Class)LoggingCardTableView;
  return -[LoggingCardTableView initWithFrame:style:](&v7, sel_initWithFrame_style_, a4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)layoutSubviews
{
  _TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView *v2;

  v2 = self;
  sub_23192FA18();

}

- (CGSize)previousContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousContentSize.width;
  height = self->_previousContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousContentSize:(CGSize)a3
{
  self->_previousContentSize = a3;
}

- (LoggingCardTableViewObserver)loggingCardTableViewObserver
{
  return (LoggingCardTableViewObserver *)objc_loadWeakRetained((id *)&self->_loggingCardTableViewObserver);
}

- (void)setLoggingCardTableViewObserver:(id)a3
{
  objc_storeWeak((id *)&self->_loggingCardTableViewObserver, a3);
}

- (void).cxx_destruct
{
  sub_23190C114((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView_loggingCardTableViewObserver);
}

- (_TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView_previousContentSize);
  *v10 = 0;
  v10[1] = 0;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView_loggingCardTableViewObserver) = 0;
  swift_unknownObjectWeakInit();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for LoggingCardTableView();
  return -[LoggingCardTableView initWithFrame:style:](&v12, sel_initWithFrame_style_, a4, x, y, width, height);
}

- (_TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_super v7;

  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView_previousContentSize);
  *v5 = 0;
  v5[1] = 0;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_CF600760015F1B1EB9BB714E5E29173820LoggingCardTableView_loggingCardTableViewObserver) = 0;
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LoggingCardTableView();
  return -[LoggingCardTableView initWithCoder:](&v7, sel_initWithCoder_, a3);
}

@end
