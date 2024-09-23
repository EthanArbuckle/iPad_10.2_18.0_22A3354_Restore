@implementation CRGlobalContextObjC

+ (int64_t)renameGeneration
{
  int64_t v3;

  if (qword_1ED6F4510 != -1)
    swift_once();
  swift_retain();
  sub_1BE1B2E40();
  swift_release();
  return v3;
}

+ (id)newObjCReplicaFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v9;

  v3 = sub_1BE1B1F58();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE1B1F1C();
  v7 = sub_1BDDF2848((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

+ (id)objCRenames
{
  return sub_1BDDF2A04();
}

+ (id)renameObjCSequence:(id)a3 after:(int64_t)a4 in:(id)a5
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a5;
  v8 = sub_1BDDF2ADC();

  return v8;
}

+ (void)retainOrReleaseWithInitial:(id)a3 current:(id)a4 forReplica:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  sub_1BDDF2C70((uint64_t)v7, (uint64_t)v8, (uint64_t)v9);

}

+ (void)retainOrReleaseWithInitial:(id)a3 current:(id)a4 forReplica:(id)a5 copyingFrom:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  sub_1BDDF2EAC((uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12);

}

+ (void)retainObjCSequence:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BDDF3148((uint64_t)v3, (void (*)(uint64_t))sub_1BDF0DD70);

}

+ (void)releaseObjCSequence:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BDDF3148((uint64_t)v3, (void (*)(uint64_t))sub_1BDF0DF6C);

}

- (CRGlobalContextObjC)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[CRGlobalContextObjC init](&v3, sel_init);
}

@end
