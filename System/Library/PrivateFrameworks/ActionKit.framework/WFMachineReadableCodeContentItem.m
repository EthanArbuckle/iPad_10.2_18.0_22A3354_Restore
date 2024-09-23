@implementation WFMachineReadableCodeContentItem

- (WFMachineReadableCode)codeObject
{
  return (WFMachineReadableCode *)-[WFMachineReadableCodeContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if ((Class)objc_opt_class() == a3)
  {
    v9 = (void *)MEMORY[0x24BE19590];
    -[WFMachineReadableCodeContentItem codeObject](self, "codeObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "object:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    return v8;
  }
  if ((Class)objc_opt_class() == a3)
  {
    -[WFMachineReadableCodeContentItem generateImageOfSize:error:](self, "generateImageOfSize:error:", a5, 556.0, 556.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x24BE19590], "object:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    goto LABEL_8;
  }
  v8 = 0;
  return v8;
}

- (id)generateImageOfSize:(CGSize)a3 error:(id *)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;

  height = a3.height;
  width = a3.width;
  v7 = (void *)MEMORY[0x24BDBF658];
  -[WFMachineReadableCodeContentItem codeObject](self, "codeObject", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMachineReadableCodeContentItem codeObject](self, "codeObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorCorrectionLevel");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("M");
  if (v12)
    v14 = (const __CFString *)v12;
  objc_msgSend(v7, "filterWithName:keysAndValues:", CFSTR("CIQRCodeGenerator"), CFSTR("inputMessage"), v10, CFSTR("inputCorrectionLevel"), v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC1378], "contextWithSize:scale:", width, height, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = objc_retainAutorelease(v16);
    CGContextSetInterpolationQuality((CGContextRef)objc_msgSend(v18, "CGContext"), kCGInterpolationNone);
    v19 = (void *)MEMORY[0x24BDBF648];
    v20 = objc_retainAutorelease(v18);
    objc_msgSend(v19, "contextWithCGContext:options:", objc_msgSend(v20, "CGContext"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "outputImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "outputImage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "extent");
    objc_msgSend(v21, "drawImage:inRect:fromRect:", v22, 0.0, 0.0, width, height, v24, v25, v26, v27);

    objc_msgSend(v20, "image");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIQRCodeGenerator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[WFMachineReadableCodeContentItem codeObject](self, "codeObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      getAVMetadataObjectTypeQRCode();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFMachineReadableCodeContentItem;
    v9 = -[WFGenericFileContentItem canGenerateRepresentationForType:](&v11, sel_canGenerateRepresentationForType_, v4);
  }

  return v9;
}

- (WFObjectType)preferredObjectType
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  void *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMachineReadableCodeContentItem codeObject](self, "codeObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorCorrectionLevel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = -[WFMachineReadableCodeContentItem canGenerateRepresentationForType:](self, "canGenerateRepresentationForType:", v3);

  if (!v7)
  {
LABEL_5:
    v11.receiver = self;
    v11.super_class = (Class)WFMachineReadableCodeContentItem;
    -[WFMachineReadableCodeContentItem preferredObjectType](&v11, sel_preferredObjectType);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = v3;
LABEL_6:
  v9 = v8;

  return (WFObjectType *)v9;
}

- (WFFileType)preferredFileType
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  objc_super v10;

  -[WFMachineReadableCodeContentItem codeObject](self, "codeObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorCorrectionLevel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFMachineReadableCodeContentItem canGenerateRepresentationForType:](self, "canGenerateRepresentationForType:", v6);

  if (!v7)
  {
LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)WFMachineReadableCodeContentItem;
    -[WFMachineReadableCodeContentItem preferredFileType](&v10, sel_preferredFileType);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return (WFFileType *)v8;
  }
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF84F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  return (WFFileType *)v8;
}

+ (id)qrCodeItemWithString:(id)a3 errorCorrectionLevel:(id)a4
{
  id v5;
  id v6;
  WFMachineReadableCode *v7;
  void *v8;
  WFMachineReadableCode *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = [WFMachineReadableCode alloc];
  getAVMetadataObjectTypeQRCode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[WFMachineReadableCode initWithType:stringValue:errorCorrectionLevel:](v7, "initWithType:stringValue:errorCorrectionLevel:", v8, v6, v5);

  +[WFContentItem itemWithObject:](WFMachineReadableCodeContentItem, "itemWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(v4, "isEqualToClass:", objc_opt_class()) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFMachineReadableCodeContentItem;
    v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Barcode"), CFSTR("Barcode"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Barcodes"), CFSTR("Barcodes"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Barcodes"));
}

@end
