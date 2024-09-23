@implementation CellularNotificationRelay

- (_TtC11SettingsApp25CellularNotificationRelay)init
{
  return (_TtC11SettingsApp25CellularNotificationRelay *)sub_100108EC8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp25CellularNotificationRelay_telephonyClient));
}

- (void)carrierBundleChange:(id)a3
{
  void *v5;
  id v6;
  _TtC11SettingsApp25CellularNotificationRelay *v7;
  id v8;
  id v9;

  v5 = (void *)objc_opt_self(NSNotificationCenter);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "defaultCenter");
  v9 = v8;
  if (qword_100156D80 != -1)
  {
    swift_once(&qword_100156D80, sub_100108E34);
    v8 = v9;
  }
  objc_msgSend(v8, "postNotificationName:object:", qword_10015D450, 0);

}

@end
