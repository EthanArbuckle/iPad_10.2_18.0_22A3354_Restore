@implementation SGTextMessageBirthdayCongratsModel

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SGTransformerInstance *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D81060], "descriptorForName:version:locale:", CFSTR("SGTextMessageBirthdayCongratsModel"), CFSTR("CG=3&NG=1&FV=1.1"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D19EE0];
  objc_msgSend(MEMORY[0x1E0D19EF8], "withMethods:", &unk_1E7E10A40);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = 0;
  LOBYTE(v11) = 0;
  objc_msgSend(MEMORY[0x1E0D81028], "withBucketSize:characterNGramRange:tokenNGramRange:shouldNormalizeTokens:shouldNormalizeCharacters:localeForNonwordTokens:tokenizeNewlines:", 10000, 1, 3, 1, 1, 1, v11, 0, v12, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "withTransformers:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SGTransformerInstance initWithTransformer:sessionDescriptor:modelClass:]([SGTransformerInstance alloc], "initWithTransformer:sessionDescriptor:modelClass:", v8, v3, objc_opt_class());
  return v9;
}

@end
