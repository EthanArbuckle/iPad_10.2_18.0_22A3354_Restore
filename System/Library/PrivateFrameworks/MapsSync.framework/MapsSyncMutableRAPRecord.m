@implementation MapsSyncMutableRAPRecord

- (_TtC8MapsSync24MapsSyncMutableRAPRecord)initWithProxyObject:(id)a3
{
  id v5;
  objc_super v7;

  type metadata accessor for MapsSyncManagedRAPRecord();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  v5 = a3;
  return -[MapsSyncMutableBaseItem init](&v7, sel_init);
}

- (NSString)countryCode
{
  return (NSString *)sub_1A411688C((char *)self, (uint64_t)a2, (SEL *)&selRef_countryCode);
}

- (void)setCountryCode:(id)a3
{
  sub_1A41169A0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setCountryCode_);
}

- (signed)type
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy), sel_type);
}

- (void)setType:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy), sel_setType_, a3);
}

- (NSString)summary
{
  return (NSString *)sub_1A411688C((char *)self, (uint64_t)a2, (SEL *)&selRef_summary);
}

- (void)setSummary:(id)a3
{
  sub_1A41169A0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setSummary_);
}

- (NSString)reportId
{
  return (NSString *)sub_1A411688C((char *)self, (uint64_t)a2, (SEL *)&selRef_reportId);
}

- (void)setReportId:(id)a3
{
  sub_1A41169A0((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setReportId_);
}

- (signed)status
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy), sel_status);
}

- (void)setStatus:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy), sel_setStatus_, a3);
}

- (NSDate)statusLastUpdatedDate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _TtC8MapsSync24MapsSyncMutableRAPRecord *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v17 - v7;
  v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy);
  v10 = self;
  v11 = objc_msgSend(v9, sel_statusLastUpdatedDate);
  if (v11)
  {
    v12 = v11;
    sub_1A423BF84();

    v13 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 0, 1, v13);
  }
  else
  {
    v13 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 1, 1, v13);
  }
  sub_1A40F1F64((uint64_t)v6, (uint64_t)v8);

  sub_1A423BF9C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v8, 1, v13) != 1)
  {
    v15 = (void *)sub_1A423BF6C();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v13);
  }
  return (NSDate *)v15;
}

- (void)setStatusLastUpdatedDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  _TtC8MapsSync24MapsSyncMutableRAPRecord *v15;
  void *v16;
  uint64_t v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1AB5D0);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v17 - v9;
  if (a3)
  {
    sub_1A423BF84();
    v11 = sub_1A423BF9C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    v11 = sub_1A423BF9C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  v12 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy);
  sub_1A410356C((uint64_t)v10, (uint64_t)v8, &qword_1ED1AB5D0);
  sub_1A423BF9C();
  v13 = *(_QWORD *)(v11 - 8);
  v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v11);
  v15 = self;
  v16 = 0;
  if (v14 != 1)
  {
    v16 = (void *)sub_1A423BF6C();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v11);
  }
  objc_msgSend(v12, sel_setStatusLastUpdatedDate_, v16);

  sub_1A410251C((uint64_t)v10, &qword_1ED1AB5D0);
}

- (NSData)contentData
{
  return (NSData *)sub_1A4117844((char *)self, (uint64_t)a2, (SEL *)&selRef_contentData);
}

- (void)setContentData:(id)a3
{
  sub_1A411795C((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_setContentData_);
}

- (signed)clientRevision
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy), sel_clientRevision);
}

- (void)setClientRevision:(signed __int16)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncMutableRAPRecord__proxy), sel_setClientRevision_, a3);
}

- (NSData)rapResponse
{
  return (NSData *)sub_1A4117844((char *)self, (uint64_t)a2, (SEL *)&selRef_rapResponse);
}

- (void)setRapResponse:(id)a3
{
  sub_1A411795C((char *)self, (uint64_t)a2, a3, (SEL *)&selRef_setRapResponse_);
}

- (_TtC8MapsSync19MapsSyncCommunityID)communityID
{
  _TtC8MapsSync24MapsSyncMutableRAPRecord *v2;
  id v3;

  v2 = self;
  v3 = sub_1A4117D54();

  return (_TtC8MapsSync19MapsSyncCommunityID *)v3;
}

- (void)setCommunityID:(id)a3
{
  id v5;
  _TtC8MapsSync24MapsSyncMutableRAPRecord *v6;

  v5 = a3;
  v6 = self;
  sub_1A4117E6C((char *)a3);

}

- (void).cxx_destruct
{

}

@end
