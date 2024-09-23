@implementation IMActionShowLocation

- (NSNumber)latitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___IMActionShowLocation_latitude));
}

- (NSNumber)longitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___IMActionShowLocation_longitude));
}

- (NSString)query
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionShowLocation_query);
}

- (NSString)label
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionShowLocation_label);
}

- (NSString)fallbackUrl
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionShowLocation_fallbackUrl);
}

- (IMActionShowLocation)initWithLatitude:(id)a3 longitude:(id)a4 query:(id)a5 label:(id)a6 fallbackUrl:(id)a7
{
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  id v22;
  id v23;
  objc_super v25;

  v8 = (uint64_t)a6;
  if (a5)
  {
    v12 = sub_19E36F888();
    v14 = v13;
    if (v8)
      goto LABEL_3;
LABEL_6:
    v16 = 0;
    if (a7)
      goto LABEL_4;
LABEL_7:
    v17 = 0;
    v18 = 0;
    goto LABEL_8;
  }
  v12 = 0;
  v14 = 0;
  if (!a6)
    goto LABEL_6;
LABEL_3:
  v8 = sub_19E36F888();
  v16 = v15;
  if (!a7)
    goto LABEL_7;
LABEL_4:
  v17 = sub_19E36F888();
LABEL_8:
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMActionShowLocation_latitude) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMActionShowLocation_longitude) = (Class)a4;
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionShowLocation_query);
  *v19 = v12;
  v19[1] = v14;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionShowLocation_label);
  *v20 = v8;
  v20[1] = v16;
  v21 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionShowLocation_fallbackUrl);
  *v21 = v17;
  v21[1] = v18;
  v25.receiver = self;
  v25.super_class = (Class)IMActionShowLocation;
  v22 = a3;
  v23 = a4;
  return -[IMActionShowLocation init](&v25, sel_init);
}

- (IMActionShowLocation)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMActionShowLocation *)IMActionShowLocation.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMActionShowLocation *v2;
  void *v3;

  v2 = self;
  sub_19E32B314();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (IMActionShowLocation)init
{
  IMActionShowLocation *result;

  result = (IMActionShowLocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
