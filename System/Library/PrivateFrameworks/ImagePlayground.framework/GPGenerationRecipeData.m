@implementation GPGenerationRecipeData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GPGenerationRecipeData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  GPGenerationRecipeData *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("underlyingData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GPGenerationRecipeData initWithUnderlyingData:](self, "initWithUnderlyingData:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GPGenerationRecipeData underlyingData](self, "underlyingData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("underlyingData"));

}

- (NSData)underlyingData
{
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___GPGenerationRecipeData_underlyingData);
  v3 = *(_QWORD *)&self->underlyingData[OBJC_IVAR___GPGenerationRecipeData_underlyingData];
  sub_23ED044A0(v2, v3);
  v4 = (void *)sub_23EFCE088();
  sub_23ED04528(v2, v3);
  return (NSData *)v4;
}

- (GPGenerationRecipeData)initWithUnderlyingData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  objc_super v10;

  v4 = a3;
  v5 = sub_23EFCE094();
  v7 = v6;

  v8 = (uint64_t *)((char *)self + OBJC_IVAR___GPGenerationRecipeData_underlyingData);
  *v8 = v5;
  v8[1] = v7;
  v10.receiver = self;
  v10.super_class = (Class)GPGenerationRecipeData;
  return -[GPGenerationRecipeData init](&v10, sel_init);
}

- (id)getRecipeInfo
{
  GPGenerationRecipeData *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = (unint64_t)GPGenerationRecipeData.getRecipeInfo()();

  if (v3)
  {
    v4 = (void *)sub_23EFD13F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)getDrawOnImageRecipe
{
  GPGenerationRecipeData *v2;
  GPDrawOnImageRecipe_optional *v3;
  void *v4;
  void *v5;

  v2 = self;
  GPGenerationRecipeData.getDrawOnImageRecipe()(v3);
  v5 = v4;

  return v5;
}

- (GPGenerationRecipeData)init
{
  GPGenerationRecipeData *result;

  result = (GPGenerationRecipeData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23ED04528(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___GPGenerationRecipeData_underlyingData), *(_QWORD *)&self->underlyingData[OBJC_IVAR___GPGenerationRecipeData_underlyingData]);
}

@end
