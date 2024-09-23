@implementation ReminderColorDeserializer

+ (id)deserializeFrom:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v14;

  v4 = a3;
  v5 = sub_2376F2844();
  v7 = v6;

  v8 = sub_2376F2AFC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376DDC8C(v5, v7);
  sub_2376F2AE4();
  v12 = (void *)sub_2376F2ACC();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_2376DDED4(v5, v7);
  return v12;
}

- (_TtC21CalendarUIKitInternal25ReminderColorDeserializer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ReminderColorDeserializer();
  return -[ReminderColorDeserializer init](&v3, sel_init);
}

@end
