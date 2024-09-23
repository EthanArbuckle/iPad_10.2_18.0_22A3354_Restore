@implementation DNDMode(Record)

+ (id)modeForRecord:()Record
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v3 = a3;
  if (objc_msgSend(v3, "symbolDescriptorTintStyle"))
    goto LABEL_5;
  objc_msgSend(v3, "symbolDescriptorTintColorNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

LABEL_5:
    v6 = objc_alloc(MEMORY[0x1E0D1D710]);
    v7 = objc_msgSend(v3, "symbolDescriptorTintStyle");
    objc_msgSend(v3, "symbolDescriptorTintColorNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "symbolDescriptorImageName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithTintStyle:tintColorNames:imageName:", v7, v8, v9);

    goto LABEL_6;
  }
  objc_msgSend(v3, "symbolDescriptorImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_5;
LABEL_6:
  v10 = objc_alloc(MEMORY[0x1E0D1D5F0]);
  objc_msgSend(v3, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "symbolImageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColorName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "semanticType");
  v16 = objc_msgSend(v3, "visibility");
  objc_msgSend(v3, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v10, "initWithName:modeIdentifier:symbolImageName:tintColorName:symbolDescriptor:semanticType:visibility:identifier:", v11, v12, v13, v14, v5, v15, v16, v17);

  return v18;
}

- (DNDSMutableModeRecord)makeRecord
{
  DNDSMutableModeRecord *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = objc_alloc_init(DNDSMutableModeRecord);
  objc_msgSend(a1, "_name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeRecord setName:](v2, "setName:", v3);

  objc_msgSend(a1, "modeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeRecord setModeIdentifier:](v2, "setModeIdentifier:", v4);

  objc_msgSend(a1, "_symbolImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeRecord setSymbolImageName:](v2, "setSymbolImageName:", v5);

  objc_msgSend(a1, "_tintColorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeRecord setTintColorName:](v2, "setTintColorName:", v6);

  objc_msgSend(a1, "symbolDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeRecord setSymbolDescriptorTintStyle:](v2, "setSymbolDescriptorTintStyle:", objc_msgSend(v7, "tintStyle"));

  objc_msgSend(a1, "symbolDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tintColorNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeRecord setSymbolDescriptorTintColorNames:](v2, "setSymbolDescriptorTintColorNames:", v9);

  objc_msgSend(a1, "symbolDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeRecord setSymbolDescriptorImageName:](v2, "setSymbolDescriptorImageName:", v11);

  -[DNDSMutableModeRecord setSemanticType:](v2, "setSemanticType:", objc_msgSend(a1, "semanticType"));
  -[DNDSMutableModeRecord setVisibility:](v2, "setVisibility:", objc_msgSend(a1, "visibility"));
  objc_msgSend(a1, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableModeRecord setIdentifier:](v2, "setIdentifier:", v12);

  return v2;
}

@end
