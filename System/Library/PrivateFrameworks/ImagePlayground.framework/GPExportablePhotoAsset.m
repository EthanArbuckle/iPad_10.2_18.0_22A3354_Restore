@implementation GPExportablePhotoAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GPExportablePhotoAsset)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GPExportablePhotoAsset *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageURLWrapper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewImage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pixelWidth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pixelHeight"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipeData"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[GPExportablePhotoAsset initWithIdentifier:imageURLWrapper:previewImage:pixelWidth:pixelHeight:creationDate:recipeData:](self, "initWithIdentifier:imageURLWrapper:previewImage:pixelWidth:pixelHeight:creationDate:recipeData:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[GPExportablePhotoAsset identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[GPExportablePhotoAsset imageURLWrapper](self, "imageURLWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("imageURLWrapper"));

  -[GPExportablePhotoAsset previewImage](self, "previewImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("previewImage"));

  -[GPExportablePhotoAsset pixelWidth](self, "pixelWidth");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("pixelWidth"));

  -[GPExportablePhotoAsset pixelHeight](self, "pixelHeight");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("pixelHeight"));

  -[GPExportablePhotoAsset creationDate](self, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("creationDate"));

  -[GPExportablePhotoAsset recipeData](self, "recipeData");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("recipeData"));

}

- (NSString)identifier
{
  GPExportablePhotoAsset *v3;
  void *v4;
  _BYTE v6[32];

  sub_23ECDDC40((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__identifier, (uint64_t)v6);
  v3 = self;
  swift_dynamicCast();

  v4 = (void *)sub_23EFD14E4();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (NSSecurityScopedURLWrapper)imageURLWrapper
{
  return (NSSecurityScopedURLWrapper *)sub_23EEAFA84(self, (uint64_t)a2, &OBJC_IVAR___GPExportablePhotoAsset__imageURLWrapper, &qword_256DDC428);
}

- (UIImage)previewImage
{
  return (UIImage *)sub_23EEAFA84(self, (uint64_t)a2, &OBJC_IVAR___GPExportablePhotoAsset__previewImage, (unint64_t *)&qword_256DD5500);
}

- (NSNumber)pixelWidth
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___GPExportablePhotoAsset_pixelWidth));
}

- (NSNumber)pixelHeight
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___GPExportablePhotoAsset_pixelHeight));
}

- (NSDate)creationDate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  void *v7;
  _BYTE v9[32];

  v3 = sub_23EFCE124();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_23ECDDC40((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__creationDate, (uint64_t)v9);
  swift_dynamicCast();
  v7 = (void *)sub_23EFCE0D0();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v7;
}

- (GPGenerationRecipeData)recipeData
{
  GPExportablePhotoAsset *v3;
  void *v5;
  _BYTE v6[32];

  sub_23ECDDC40((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__recipeData, (uint64_t)v6);
  type metadata accessor for GPGenerationRecipeData(0);
  v3 = self;
  swift_dynamicCast();

  return (GPGenerationRecipeData *)v5;
}

- (GPExportablePhotoAsset)initWithIdentifier:(id)a3 imageURLWrapper:(id)a4 previewImage:(id)a5 pixelWidth:(id)a6 pixelHeight:(id)a7 creationDate:(id)a8 recipeData:(id)a9
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v13 = sub_23EFCE124();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_23EFD1514();
  v18 = v17;
  sub_23EFCE100();
  return (GPExportablePhotoAsset *)GPExportablePhotoAsset.init(identifier:imageURLWrapper:previewImage:pixelWidth:pixelHeight:creationDate:recipeData:)(v16, v18, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)v15, (uint64_t)a9);
}

- (GPExportablePhotoAsset)init
{
  GPExportablePhotoAsset *result;

  result = (GPExportablePhotoAsset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__identifier);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__imageURLWrapper);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__previewImage);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__creationDate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPExportablePhotoAsset__recipeData);
}

@end
