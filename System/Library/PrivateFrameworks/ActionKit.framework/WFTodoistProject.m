@implementation WFTodoistProject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("projectId");
  v3[1] = CFSTR("name");
  v4[0] = CFSTR("id");
  v4[1] = CFSTR("name");
  v3[2] = CFSTR("color");
  v3[3] = CFSTR("collapsed");
  v4[2] = CFSTR("color");
  v4[3] = CFSTR("collapsed");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorJSONTransformer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[20];
  _QWORD v27[22];

  v27[20] = *MEMORY[0x24BDAC8D0];
  v19 = (id)MEMORY[0x24BEC3A10];
  v26[0] = &unk_24F93B108;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 3089457151);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v25;
  v26[1] = &unk_24F93B120;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 3678418431);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v24;
  v26[2] = &unk_24F93B138;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 4288230399);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v23;
  v26[3] = &unk_24F93B150;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 4207935743);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v22;
  v26[4] = &unk_24F93B168;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 2948086783);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v21;
  v26[5] = &unk_24F93B180;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 2127317503);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v18;
  v26[6] = &unk_24F93B198;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 697579775);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v17;
  v26[7] = &unk_24F93B1B0;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 1791802623);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v16;
  v26[8] = &unk_24F93B1C8;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 361737727);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v15;
  v26[9] = &unk_24F93B1E0;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 346748415);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v14;
  v26[10] = &unk_24F93B1F8;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 2529422335);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v13;
  v26[11] = &unk_24F93B210;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 1081343999);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27[11] = v2;
  v26[12] = &unk_24F93B228;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 2286813183);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[12] = v3;
  v26[13] = &unk_24F93B240;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 2939743231);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[13] = v4;
  v26[14] = &unk_24F93B258;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 3952536575);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[14] = v5;
  v26[15] = &unk_24F93B270;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 3763442943);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[15] = v6;
  v26[16] = &unk_24F93B288;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 4287464959);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[16] = v7;
  v26[17] = &unk_24F93B2A0;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 2155905279);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[17] = v8;
  v26[18] = &unk_24F93B2B8;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 3099113727);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[18] = v9;
  v26[19] = &unk_24F93B2D0;
  objc_msgSend(MEMORY[0x24BEC1398], "colorWithRGBAValue:", 3433862143);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[19] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "mtl_valueMappingTransformerWithDictionary:", v11);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)collapsedJSONTransformer
{
  return (id)objc_msgSend(MEMORY[0x24BDD1970], "mtl_BOOLeanValueTransformer");
}

- (int64_t)projectId
{
  return self->_projectId;
}

- (NSString)name
{
  return self->_name;
}

- (WFColor)color
{
  return self->_color;
}

- (BOOL)collapsed
{
  return self->_collapsed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
