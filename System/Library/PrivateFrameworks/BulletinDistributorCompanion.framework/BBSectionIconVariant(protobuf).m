@implementation BBSectionIconVariant(protobuf)

+ (id)sectionIconVariantFromProtobuf:()protobuf
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)MEMORY[0x24BE0FE78];
  v4 = a3;
  v5 = objc_msgSend(v4, "format");
  objc_msgSend(v4, "imageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "variantWithFormat:imageData:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "systemImageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSystemImageName:", v8);

  v9 = objc_msgSend(v4, "precomposed");
  objc_msgSend(v7, "setPrecomposed:", v9);
  return v7;
}

- (id)blt_protobuf
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "systemImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSystemImageName:", v3);

  objc_msgSend(v2, "setFormat:", objc_msgSend(a1, "format"));
  objc_msgSend(a1, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImageData:", v4);

  objc_msgSend(v2, "setPrecomposed:", objc_msgSend(a1, "isPrecomposed"));
  return v2;
}

@end
