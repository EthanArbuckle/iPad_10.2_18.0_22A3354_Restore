@implementation _AlarmConnectionProvider

- (id)alarmManagerServiceConnection
{
  _TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_AlarmConnectionProvider *v2;
  id v3;

  v2 = self;
  v3 = sub_23E40B700();

  return v3;
}

- (_TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_AlarmConnectionProvider)init
{
  return (_TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_AlarmConnectionProvider *)sub_23E40BBE8((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_AlarmConnectionProvider__alarmManagerServiceConnection, (uint64_t (*)(_QWORD))type metadata accessor for _AlarmConnectionProvider);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_AlarmConnectionProvider__alarmManagerServiceConnection));
}

@end
