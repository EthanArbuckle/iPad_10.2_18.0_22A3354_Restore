@implementation AMLPipelineLogger

- (AMLFeaturesConfiguration)featuresConfiguration
{
  return (AMLFeaturesConfiguration *)sub_235F6CF68();
}

- (void)setFeaturesConfiguration:(id)a3
{
  id v4;
  AMLPipelineLogger *v5;

  v4 = a3;
  v5 = self;
  sub_235F6CFC0((uint64_t)v4);

}

- (AMLPipelineLogger)initWithFeaturesConfiguration:(id)a3
{
  return (AMLPipelineLogger *)AMLPipelineLogger.init(featuresConfiguration:)((uint64_t)a3);
}

- (id)copyWithZone:(void *)a3
{
  AMLPipelineLogger *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  AMLPipelineLogger.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_235F9B6B4();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  AMLPipelineLogger *v5;

  v4 = a3;
  v5 = self;
  AMLPipelineLogger.encode(with:)((NSCoder)v4);

}

- (AMLPipelineLogger)initWithCoder:(id)a3
{
  return (AMLPipelineLogger *)AMLPipelineLogger.init(coder:)(a3);
}

- (id)logPipeline:(id)a3 features:(id)a4 metadata:(id)a5 async:(BOOL)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  AMLPipelineLogger *v13;
  void *v14;

  v8 = sub_235F9B3FC();
  v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399870);
  v11 = sub_235F9B3CC();
  v12 = a5;
  v13 = self;
  sub_235F6D450(v8, v10, v11, v12);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  return v14;
}

- (id)logPipelineAsync:(id)a3 features:(id)a4 metadata:(id)a5 async:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  id v13;
  AMLPipelineLogger *v14;
  void *v15;

  v6 = a6;
  v9 = sub_235F9B3FC();
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256399870);
  v12 = sub_235F9B3CC();
  v13 = a5;
  v14 = self;
  sub_235F6DA14(v9, v11, v12, v13, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15 = (void *)sub_235F9B3F0();
  swift_bridgeObjectRelease();
  return v15;
}

- (AMLPipelineLogger)init
{
  AMLPipelineLogger.init()();
}

- (void).cxx_destruct
{

}

@end
