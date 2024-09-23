@implementation AMSUIFontParser

+ (id)fontWithDictionary:(id)a3
{
  return (id)objc_msgSend(a1, "fontWithDictionary:compatibleWith:", a3, 0);
}

+ (id)fontWithDictionary:(id)a3 compatibleWith:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE07CB8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE07CC8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE07CC0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE07CD0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;

    v17 = &unk_24CB8C050;
    if (v9)
      v17 = v9;
    v18 = v17;

    +[AMSUIFontParser fontTextStyleForString:](AMSUIFontParser, "fontTextStyleForString:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSUIFontParser systemDesignForString:](AMSUIFontParser, "systemDesignForString:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v37 = v14;
      objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v19, v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v20)
      {
        objc_msgSend(v21, "fontDescriptorWithDesign:", v20);
        v23 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)v23;
      }
      objc_msgSend(a1, "weightForString:", v16);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v16)
      {
        v26 = *MEMORY[0x24BEBB590];
        v39 = v24;
        v40 = v26;
        v38 = *MEMORY[0x24BEBB620];
        v36 = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fontDescriptorByAddingAttributes:", v28);
        v35 = v16;
        v29 = v25;
        v30 = v12;
        v31 = v7;
        v32 = objc_claimAutoreleasedReturnValue();

        v18 = v36;
        v22 = (void *)v32;
        v7 = v31;
        v12 = v30;
        v25 = v29;
        v16 = v35;
      }
      v33 = (void *)MEMORY[0x24BEBB520];
      objc_msgSend(v18, "doubleValue", v35);
      objc_msgSend(v33, "fontWithDescriptor:size:", v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v37;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)fontTextStyleForString:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[11];
  _QWORD v18[12];

  v18[11] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BEBE210];
  v17[0] = CFSTR("largetitle");
  v17[1] = CFSTR("title1");
  v5 = *MEMORY[0x24BEBE240];
  v18[0] = v4;
  v18[1] = v5;
  v6 = *MEMORY[0x24BEBE248];
  v17[2] = CFSTR("title2");
  v17[3] = CFSTR("title3");
  v7 = *MEMORY[0x24BEBE250];
  v18[2] = v6;
  v18[3] = v7;
  v8 = *MEMORY[0x24BEBE200];
  v17[4] = CFSTR("headline");
  v17[5] = CFSTR("subheadline");
  v9 = *MEMORY[0x24BEBE220];
  v18[4] = v8;
  v18[5] = v9;
  v10 = *MEMORY[0x24BEBE1D0];
  v17[6] = CFSTR("body");
  v17[7] = CFSTR("callout");
  v11 = *MEMORY[0x24BEBE1D8];
  v18[6] = v10;
  v18[7] = v11;
  v12 = *MEMORY[0x24BEBE1F0];
  v17[8] = CFSTR("footnote");
  v17[9] = CFSTR("caption1");
  v13 = *MEMORY[0x24BEBE1E0];
  v18[8] = v12;
  v18[9] = v13;
  v17[10] = CFSTR("caption2");
  v18[10] = *MEMORY[0x24BEBE1E8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)systemDesignForString:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BEBB568];
  v10[0] = CFSTR("default");
  v10[1] = CFSTR("rounded");
  v5 = *MEMORY[0x24BEBB578];
  v11[0] = v4;
  v11[1] = v5;
  v10[2] = CFSTR("serif");
  v10[3] = CFSTR("monospaced");
  v6 = *MEMORY[0x24BEBB570];
  v11[2] = *MEMORY[0x24BEBB580];
  v11[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)weightForString:(id)a3
{
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
  void *v13;
  void *v15;
  _QWORD v16[9];
  _QWORD v17[11];

  v17[9] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("ultralight");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB628]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v16[1] = CFSTR("thin");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB618]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  v16[2] = CFSTR("light");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB5F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  v16[3] = CFSTR("regular");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB608]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  v16[4] = CFSTR("medium");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB600]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v7;
  v16[5] = CFSTR("semibold");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB610]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v8;
  v16[6] = CFSTR("bold");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB5E8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v9;
  v16[7] = CFSTR("heavy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB5F0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v10;
  v16[8] = CFSTR("black");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBB5E0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKeyedSubscript:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
