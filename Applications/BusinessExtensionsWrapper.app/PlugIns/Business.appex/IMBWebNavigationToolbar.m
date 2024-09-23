@implementation IMBWebNavigationToolbar

- (_TtC8Business23IMBWebNavigationToolbar)init
{
  return (_TtC8Business23IMBWebNavigationToolbar *)sub_10001B1C8();
}

- (_TtC8Business23IMBWebNavigationToolbar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10001BAA0();
}

- (void)previousPage
{
  sub_10001B5FC(self, (uint64_t)a2, "IMBWebToolbar: previous", 23, sub_100074D74);
}

- (void)nextPage
{
  sub_10001B5FC(self, (uint64_t)a2, "IMBWebToolbar: next", 19, sub_100074D94);
}

- (void)refresh
{
  _TtC8Business23IMBWebNavigationToolbar *v2;

  v2 = self;
  sub_10001B6D8();

}

- (void)done
{
  _TtC8Business23IMBWebNavigationToolbar *v2;

  v2 = self;
  sub_10001B7F8();

}

- (_TtC8Business23IMBWebNavigationToolbar)initWithFrame:(CGRect)a3
{
  _TtC8Business23IMBWebNavigationToolbar *result;

  result = (_TtC8Business23IMBWebNavigationToolbar *)_swift_stdlib_reportUnimplementedInitializer("Business.IMBWebNavigationToolbar", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (id)initInView:(id)a3 withFrame:(CGRect)a4 withItemList:(id)a5
{
  id v5;
  id result;

  v5 = a3;
  result = (id)_swift_stdlib_reportUnimplementedInitializer("Business.IMBWebNavigationToolbar", 32, "init(in:withFrame:withItemList:)", 32, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar____lazy_storage___previousButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar____lazy_storage___nextButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar____lazy_storage___refreshButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar____lazy_storage___doneButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar____lazy_storage___secureContentMessageItem));
  sub_100011A64((uint64_t)self + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar_actionDelegate);
}

@end
