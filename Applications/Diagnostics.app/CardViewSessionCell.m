@implementation CardViewSessionCell

- (_TtC11Diagnostics19CardViewSessionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  DARootViewController *v5;
  DARootViewController *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC11Diagnostics19CardViewSessionCell *)sub_1000B888C(a3, (uint64_t)a4, v6);
}

- (_TtC11Diagnostics19CardViewSessionCell)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics19CardViewSessionCell *)sub_1000B89D4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_deviceInformationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_testRunnerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics19CardViewSessionCell_promptView));
}

@end
