@implementation MapsSyncMutableIncidentReport

- (_TtC8MapsSync29MapsSyncMutableIncidentReport)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedIncidentReport();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableIncidentReport__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSString)countryCode
{
  void *v2;
  _TtC8MapsSync29MapsSyncMutableIncidentReport *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableIncidentReport__proxy);
  v3 = self;
  v4 = objc_msgSend(v2, sel_countryCode);
  if (v4)
  {
    v5 = v4;
    sub_1A423C14C();

    v6 = (void *)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setCountryCode:(id)a3
{
  void *v4;
  _TtC8MapsSync29MapsSyncMutableIncidentReport *v5;
  _TtC8MapsSync29MapsSyncMutableIncidentReport *v6;
  id v7;

  if (a3)
  {
    sub_1A423C14C();
    v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableIncidentReport__proxy);
    v5 = self;
    v7 = (id)sub_1A423C140();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableIncidentReport__proxy);
    v6 = self;
    v7 = 0;
  }
  objc_msgSend(v4, sel_setCountryCode_, v7);

}

- (signed)type
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync29MapsSyncMutableIncidentReport__proxy), sel_type);
}

- (void)setType:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableIncidentReport__proxy), sel_setType_, a3);
}

- (void).cxx_destruct
{

}

@end
