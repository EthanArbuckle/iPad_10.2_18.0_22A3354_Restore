@implementation FedStatsCategoricalTypePreEncoderFactory

+ (id)preEncoderForVariant:(id)a3 parameters:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  __objc2_class *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(CFSTR("huffman"), "isEqual:", v7))
  {
    v9 = FedStatsCategoricalTypeHuffmanEncoder;
LABEL_7:
    -[__objc2_class instanceWithParameters:error:](v9, "instanceWithParameters:error:", v8, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(CFSTR("ipv4"), "isEqual:", v7))
  {
    v9 = FedStatsCategoricalTypeIPv4Encoder;
    goto LABEL_7;
  }
  if (objc_msgSend(CFSTR("ipv6"), "isEqual:", v7))
  {
    v9 = FedStatsCategoricalTypeIPv6Encoder;
    goto LABEL_7;
  }
  if (a5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }
LABEL_8:

  return a5;
}

+ (id)forVariant:(id)a3 mutateParameters:(id)a4 usingFieldValues:(id)a5 assetURLs:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  __objc2_class *v15;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(CFSTR("huffman"), "isEqual:", v11))
  {
    v15 = FedStatsCategoricalTypeHuffmanEncoder;
LABEL_7:
    -[__objc2_class mutateParameters:usingFieldValues:assetURLs:requiredFields:assetNames:error:](v15, "mutateParameters:usingFieldValues:assetURLs:requiredFields:assetNames:error:", v12, v13, v14, 0, 0, a7);
    a7 = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(CFSTR("ipv4"), "isEqual:", v11))
  {
    v15 = FedStatsCategoricalTypeIPv4Encoder;
    goto LABEL_7;
  }
  if (objc_msgSend(CFSTR("ipv6"), "isEqual:", v11))
  {
    v15 = FedStatsCategoricalTypeIPv6Encoder;
    goto LABEL_7;
  }
  if (a7)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[FedStatsError errorWithCode:description:](FedStatsError, "errorWithCode:description:", 900, v17);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    a7 = 0;
  }
LABEL_8:

  return a7;
}

+ (id)forVariant:(id)a3 assetNamesInParameters:(id)a4 usingFieldValues:(id)a5
{
  id v7;
  id v8;
  id v9;
  __objc2_class *v10;
  id *v11;
  uint64_t *v12;
  int v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(CFSTR("huffman"), "isEqual:", v7))
  {
    v10 = FedStatsCategoricalTypeHuffmanEncoder;
    v20 = MEMORY[0x24BDBD1A8];
    v11 = (id *)&v20;
    v12 = &v20;
  }
  else if (objc_msgSend(CFSTR("ipv4"), "isEqual:", v7))
  {
    v10 = FedStatsCategoricalTypeIPv4Encoder;
    v19 = MEMORY[0x24BDBD1A8];
    v11 = (id *)&v19;
    v12 = &v19;
  }
  else
  {
    v13 = objc_msgSend(CFSTR("ipv6"), "isEqual:", v7);
    v14 = (void *)MEMORY[0x24BDBD1A8];
    if (!v13)
    {
      v16 = 0;
      goto LABEL_8;
    }
    v10 = FedStatsCategoricalTypeIPv6Encoder;
    v18 = MEMORY[0x24BDBD1A8];
    v11 = (id *)&v18;
    v12 = &v18;
  }
  v15 = (id)-[__objc2_class mutateParameters:usingFieldValues:assetURLs:requiredFields:assetNames:error:](v10, "mutateParameters:usingFieldValues:assetURLs:requiredFields:assetNames:error:", v8, v9, 0, 0, v12, 0);
  v16 = *v11;
  v14 = v16;
LABEL_8:

  return v16;
}

+ (id)forVariant:(id)a3 requiredFieldsInParameters:(id)a4
{
  id v5;
  id v6;
  __objc2_class *v7;
  id *v8;
  uint64_t *v9;
  int v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(CFSTR("huffman"), "isEqual:", v5))
  {
    v7 = FedStatsCategoricalTypeHuffmanEncoder;
    v17 = MEMORY[0x24BDBD1A8];
    v8 = (id *)&v17;
    v9 = &v17;
  }
  else if (objc_msgSend(CFSTR("ipv4"), "isEqual:", v5))
  {
    v7 = FedStatsCategoricalTypeIPv4Encoder;
    v16 = MEMORY[0x24BDBD1A8];
    v8 = (id *)&v16;
    v9 = &v16;
  }
  else
  {
    v10 = objc_msgSend(CFSTR("ipv6"), "isEqual:", v5);
    v11 = (void *)MEMORY[0x24BDBD1A8];
    if (!v10)
    {
      v13 = 0;
      goto LABEL_8;
    }
    v7 = FedStatsCategoricalTypeIPv6Encoder;
    v15 = MEMORY[0x24BDBD1A8];
    v8 = (id *)&v15;
    v9 = &v15;
  }
  v12 = (id)-[__objc2_class mutateParameters:usingFieldValues:assetURLs:requiredFields:assetNames:error:](v7, "mutateParameters:usingFieldValues:assetURLs:requiredFields:assetNames:error:", v6, 0, 0, v9, 0, 0);
  v13 = *v8;
  v11 = v13;
LABEL_8:

  return v13;
}

@end
