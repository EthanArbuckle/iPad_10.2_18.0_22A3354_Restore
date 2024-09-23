@implementation AMLRawSignalsDonation

- (AMLRawSignalsConfiguration)rawSignalsConfiguration
{
  return (AMLRawSignalsConfiguration *)sub_235F95B34();
}

- (void)setRawSignalsConfiguration:(id)a3
{
  id v4;
  AMLRawSignalsDonation *v5;

  v4 = a3;
  v5 = self;
  sub_235F95B88((uint64_t)v4);

}

- (AMLRawSignalsDonation)initWithRawSignalsConfiguration:(id)a3
{
  return (AMLRawSignalsDonation *)AMLRawSignalsDonation.init(rawSignalsConfiguration:)((uint64_t)a3);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_235F6F5C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))AMLRawSignalsDonation.copy(with:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMLRawSignalsDonation *v5;

  v4 = a3;
  v5 = self;
  AMLRawSignalsDonation.encode(with:)((NSCoder)v4);

}

- (AMLRawSignalsDonation)initWithCoder:(id)a3
{
  return (AMLRawSignalsDonation *)AMLRawSignalsDonation.init(coder:)(a3);
}

- (id)donateRawSignals:(id)a3 metadata:(id)a4 completionBlock:(id)a5
{
  uint64_t (*v7)();
  id v8;
  AMLRawSignalsDonation *v9;
  void *v10;

  v7 = (uint64_t (*)())_Block_copy(a5);
  if (v7)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v7;
    v7 = sub_235F729E8;
  }
  swift_unknownObjectRetain();
  v8 = a4;
  v9 = self;
  v10 = (void *)sub_235F96454();
  sub_235F72898((uint64_t)v7);
  swift_unknownObjectRelease();

  return v10;
}

- (id)donateRawSignalsBatch:(id)a3 metadata:(id)a4 completionBlock:(id)a5
{
  uint64_t (*v8)();
  id v9;
  id v10;
  AMLRawSignalsDonation *v11;
  void *v12;
  void *v13;

  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v8;
    v8 = sub_235F729E8;
  }
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_235F977DC();
  v13 = v12;
  sub_235F72898((uint64_t)v8);

  return v13;
}

- (AMLRawSignalsDonation)init
{
  AMLRawSignalsDonation.init()();
}

- (void).cxx_destruct
{

  sub_235F72808(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMLRawSignalsDonation____lazy_storage___indexSignalsConfiguration), *(_QWORD *)&self->rawSignalsConfiguration[OBJC_IVAR___AMLRawSignalsDonation____lazy_storage___indexSignalsConfiguration], *(void **)&self->$__lazy_storage_$_indexSignalsConfiguration[OBJC_IVAR___AMLRawSignalsDonation____lazy_storage___indexSignalsConfiguration]);
}

- (NSString)description
{
  return (NSString *)sub_235F884E8(self, (uint64_t)a2, (void (*)(void))AMLRawSignalsDonation.description.getter);
}

@end
