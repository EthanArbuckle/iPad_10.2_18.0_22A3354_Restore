@implementation AMLFeaturesDonation

- (AMLFeaturesConfiguration)featuresConfiguration
{
  return (AMLFeaturesConfiguration *)sub_235F6F43C();
}

- (void)setFeaturesConfiguration:(id)a3
{
  id v4;
  AMLFeaturesDonation *v5;

  v4 = a3;
  v5 = self;
  sub_235F6F490((uint64_t)v4);

}

- (AMLFeaturesDonation)initWithFeaturesConfiguration:(id)a3
{
  return (AMLFeaturesDonation *)AMLFeaturesDonation.init(featuresConfiguration:)((uint64_t)a3);
}

- (id)copyWithZone:(void *)a3
{
  return (id)sub_235F6F5C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_QWORD *__return_ptr))AMLFeaturesDonation.copy(with:));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMLFeaturesDonation *v5;

  v4 = a3;
  v5 = self;
  AMLFeaturesDonation.encode(with:)((NSCoder)v4);

}

- (AMLFeaturesDonation)initWithCoder:(id)a3
{
  return (AMLFeaturesDonation *)AMLFeaturesDonation.init(coder:)(a3);
}

- (id)donateFeature:(id)a3 metadata:(id)a4 completionBlock:(id)a5
{
  uint64_t (*v8)();
  id v9;
  AMLFeaturesDonation *v10;
  void *v11;
  void *v12;

  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v8;
    v8 = sub_235F729E8;
  }
  swift_unknownObjectRetain();
  v9 = a4;
  v10 = self;
  sub_235F6FE98((uint64_t)a3);
  v12 = v11;
  sub_235F72898((uint64_t)v8);
  swift_unknownObjectRelease();

  return v12;
}

- (id)donateFeatureDictionaries:(id)a3 metadata:(id)a4 completionBlock:(id)a5
{
  uint64_t (*v7)();
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  AMLFeaturesDonation *v11;
  void *v12;

  v7 = (uint64_t (*)())_Block_copy(a5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563997E0);
  v8 = sub_235F9B450();
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v7 = sub_235F729E8;
  }
  else
  {
    v9 = 0;
  }
  v10 = a4;
  v11 = self;
  v12 = (void *)sub_235F7128C(v8, v10, (uint64_t)v7, v9);
  sub_235F72898((uint64_t)v7);

  swift_bridgeObjectRelease();
  return v12;
}

- (id)donateFeaturesBatch:(id)a3 metadata:(id)a4 completionBlock:(id)a5
{
  void *v8;
  id v9;
  id v10;
  AMLFeaturesDonation *v11;
  void *v12;
  void *v13;

  v8 = _Block_copy(a5);
  if (v8)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v8;
    v8 = sub_235F728CC;
  }
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_235F71DBC((uint64_t)v9);
  v13 = v12;
  sub_235F72898((uint64_t)v8);

  return v13;
}

- (AMLFeaturesDonation)init
{
  AMLFeaturesDonation.init()();
}

- (void).cxx_destruct
{

  sub_235F72808(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AMLFeaturesDonation____lazy_storage___indexFeaturesConfiguration), *(_QWORD *)&self->featuresConfiguration[OBJC_IVAR___AMLFeaturesDonation____lazy_storage___indexFeaturesConfiguration], *(void **)&self->$__lazy_storage_$_indexFeaturesConfiguration[OBJC_IVAR___AMLFeaturesDonation____lazy_storage___indexFeaturesConfiguration]);
}

- (NSString)description
{
  return (NSString *)sub_235F72234(self, (uint64_t)a2, (void (*)(void))AMLFeaturesDonation.description.getter);
}

@end
