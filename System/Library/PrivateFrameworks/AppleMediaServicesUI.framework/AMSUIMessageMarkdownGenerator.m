@implementation AMSUIMessageMarkdownGenerator

- (AMSUIMessageMarkdownGenerator)initWithMarkdownString:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  AMSUIMessageMarkdownGenerator *v8;
  NSMutableAttributedString *v9;
  NSMutableAttributedString *accumulator;
  AMSUIMarkdownParser *v11;
  AMSUIMarkdownParser *parser;
  uint64_t v13;
  NSMutableArray *attributeStack;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIMessageMarkdownGenerator;
  v8 = -[AMSUIMessageMarkdownGenerator init](&v16, sel_init);
  if (v8)
  {
    v9 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x24BDD1688]);
    accumulator = v8->_accumulator;
    v8->_accumulator = v9;

    objc_storeStrong((id *)&v8->_configuration, a4);
    v8->_didParseEverything = 1;
    v11 = -[AMSUIMarkdownParser initWithString:]([AMSUIMarkdownParser alloc], "initWithString:", v6);
    parser = v8->_parser;
    v8->_parser = v11;

    -[AMSUIMarkdownParser setDelegate:](v8->_parser, "setDelegate:", v8);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    attributeStack = v8->_attributeStack;
    v8->_attributeStack = (NSMutableArray *)v13;

  }
  return v8;
}

- (id)generate
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[AMSUIMessageMarkdownGenerator parser](self, "parser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parse");

  v4 = objc_alloc(MEMORY[0x24BDD1458]);
  -[AMSUIMessageMarkdownGenerator accumulator](self, "accumulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAttributedString:", v5);

  return v6;
}

- (void)popAttributes
{
  id v2;

  -[AMSUIMessageMarkdownGenerator attributeStack](self, "attributeStack");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeLastObject");

}

- (void)pushAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  -[AMSUIMessageMarkdownGenerator attributeStack](self, "attributeStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCED8];
    -[AMSUIMessageMarkdownGenerator attributeStack](self, "attributeStack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addEntriesFromDictionary:", v4);
    -[AMSUIMessageMarkdownGenerator attributeStack](self, "attributeStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v10;
    v11 = v12;
  }
  else
  {
    -[AMSUIMessageMarkdownGenerator attributeStack](self, "attributeStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v11 = v4;
  }
  objc_msgSend(v10, "addObject:", v11);

}

- (void)appendStyledString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[AMSUIMessageMarkdownGenerator attributeStack](self, "attributeStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AMSUISymbol"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[AMSUIMessageMarkdownGenerator setSymbol:](self, "setSymbol:", v9);
    }
    else
    {
      -[AMSUIMessageMarkdownGenerator accumulator](self, "accumulator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v9, v5);
      objc_msgSend(v7, "appendAttributedString:", v8);

    }
  }

}

- (id)currentFont
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[AMSUIMessageMarkdownGenerator attributeStack](self, "attributeStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBB360]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (!v6)
  {
    -[AMSUIMessageMarkdownGenerator configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)currentFontAddingFontAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[AMSUIMessageMarkdownGenerator currentFont](self, "currentFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorByAddingAttributes:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v8, "fontWithDescriptor:size:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fontWithTraits:(unsigned int)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[AMSUIMessageMarkdownGenerator currentFont](self, "currentFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "symbolicTraits") | a3;
  objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v4, "pointSize");
    objc_msgSend(v8, "fontWithDescriptor:size:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      v20 = 2114;
      v21 = v4;
      v22 = 1024;
      v23 = v6;
      _os_log_impl(&dword_211102000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Font %{public}@, does not support traits %u", (uint8_t *)&v16, 0x26u);

    }
    v9 = v4;
  }
  v14 = v9;

  return v14;
}

- (id)reconcileElementAttributes:(id)a3 withFont:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  double v26;
  uint64_t *v27;
  void *v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[3];

  v52[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("font-family"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v6, "familyName");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("font-name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v6, "fontName");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    v46 = v11;

    objc_msgSend(v6, "pointSize");
    v17 = v16;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("font-size"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v15;
    if (v18)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("font-size"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v17 = v20;

    }
    v21 = (double *)MEMORY[0x24BEBB608];
    objc_msgSend(v6, "fontDescriptor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x24BEBB590];
    objc_msgSend(v22, "objectForKey:", *MEMORY[0x24BEBB590]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
    v26 = *v21;

    v27 = (uint64_t *)MEMORY[0x24BEBB620];
    if (v25)
    {
      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BEBB620]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      if (v29 != 0.0)
        v26 = v29;

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE07CD0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v30;
    else
      v31 = 0;

    if (v31)
    {
      +[AMSUIFontParser weightForString:](AMSUIFontParser, "weightForString:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (!v32)
      {
        objc_msgSend(v31, "doubleValue");
        v32 = v31;
      }
      objc_msgSend(v32, "doubleValue");
      v26 = v34;

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("font-weight"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x24BEBB528];
    if (v35)
    {
      v37 = *MEMORY[0x24BEBB540];
      v38 = v46;
      v51[1] = v23;
      v52[0] = v46;
      v51[0] = v37;
      v49 = *v27;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v39;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "fontDescriptorWithFontAttributes:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = v45;
    }
    else
    {
      v43 = v45;
      v47 = *MEMORY[0x24BEBB550];
      v48 = v45;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "fontDescriptorWithFontAttributes:", v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v46;
    }

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v42, v17);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (void)parserDidStartDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v4, "setAlignment:", 4);
  v5 = (void *)MEMORY[0x24BDBCED8];
  v8 = *MEMORY[0x24BEBB3A8];
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageMarkdownGenerator pushAttributes:](self, "pushAttributes:", v7);

}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = objc_opt_class();
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_211102000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to parse with error: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  -[AMSUIMessageMarkdownGenerator setDidParseEverything:](self, "setDidParseEverything:", 0);

}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  void *v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD *v35;
  _QWORD *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[2];
  _QWORD v64[2];
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  _QWORD v69[2];
  _QWORD v70[2];
  uint64_t v71;
  void *v72;
  _QWORD v73[2];
  _QWORD v74[3];

  v74[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  -[AMSUIMessageMarkdownGenerator accumulator](self, "accumulator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginEditing");

  switch(a4)
  {
    case 0uLL:
      v71 = *MEMORY[0x24BEBB548];
      v72 = &unk_24CB8C958;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator currentFontAddingFontAttributes:](self, "currentFontAddingFontAttributes:", v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator reconcileElementAttributes:withFont:](self, "reconcileElementAttributes:withFont:", v8, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BDBCED8];
      v22 = *MEMORY[0x24BEBB360];
      v70[0] = v13;
      v23 = *MEMORY[0x24BEBB368];
      v69[0] = v22;
      v69[1] = v23;
      -[AMSUIMessageMarkdownGenerator configuration](self, "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "color");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v70[1] = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dictionaryWithDictionary:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator pushAttributes:](self, "pushAttributes:", v27);

      goto LABEL_17;
    case 1uLL:
      -[AMSUIMessageMarkdownGenerator fontWithTraits:](self, "fontWithTraits:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator reconcileElementAttributes:withFont:](self, "reconcileElementAttributes:withFont:", v8, v28);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x24BDBCED8];
      v30 = *MEMORY[0x24BEBB360];
      v74[0] = v11;
      v31 = *MEMORY[0x24BEBB368];
      v73[0] = v30;
      v73[1] = v31;
      -[AMSUIMessageMarkdownGenerator configuration](self, "configuration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "color");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v33;
      v34 = (void *)MEMORY[0x24BDBCE70];
      v35 = v74;
      v36 = v73;
      goto LABEL_7;
    case 2uLL:
      -[AMSUIMessageMarkdownGenerator fontWithTraits:](self, "fontWithTraits:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator reconcileElementAttributes:withFont:](self, "reconcileElementAttributes:withFont:", v8, v37);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x24BDBCED8];
      v38 = *MEMORY[0x24BEBB360];
      v64[0] = v11;
      v39 = *MEMORY[0x24BEBB368];
      v63[0] = v38;
      v63[1] = v39;
      -[AMSUIMessageMarkdownGenerator configuration](self, "configuration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "color");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v33;
      v34 = (void *)MEMORY[0x24BDBCE70];
      v35 = v64;
      v36 = v63;
LABEL_7:
      v40 = 2;
      goto LABEL_11;
    case 3uLL:
      v41 = (void *)MEMORY[0x24BDBCED8];
      v67 = *MEMORY[0x24BEBB360];
      -[AMSUIMessageMarkdownGenerator fontWithTraits:](self, "fontWithTraits:", 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v42;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "dictionaryWithDictionary:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator pushAttributes:](self, "pushAttributes:", v44);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("href"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v45)
        break;
      v46 = (void *)MEMORY[0x24BDBCED8];
      v65 = *MEMORY[0x24BEBB388];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("href"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "dictionaryWithDictionary:", v32);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator pushAttributes:](self, "pushAttributes:", v47);

      goto LABEL_12;
    case 4uLL:
      -[AMSUIMessageMarkdownGenerator currentFont](self, "currentFont");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator reconcileElementAttributes:withFont:](self, "reconcileElementAttributes:withFont:", v8, v48);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x24BDBCED8];
      v49 = *MEMORY[0x24BEBB360];
      v61[0] = *MEMORY[0x24BEBB440];
      v61[1] = v49;
      v62[0] = &unk_24CB8C0F8;
      v62[1] = v11;
      v61[2] = *MEMORY[0x24BEBB368];
      -[AMSUIMessageMarkdownGenerator configuration](self, "configuration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "color");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v62[2] = v33;
      v34 = (void *)MEMORY[0x24BDBCE70];
      v35 = v62;
      v36 = v61;
      v40 = 3;
LABEL_11:
      objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, v40);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dictionaryWithDictionary:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator pushAttributes:](self, "pushAttributes:", v51);

LABEL_12:
      goto LABEL_18;
    case 5uLL:
      -[AMSUIMessageMarkdownGenerator currentFont](self, "currentFont");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator reconcileElementAttributes:withFont:](self, "reconcileElementAttributes:withFont:", v8, v52);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = (void *)MEMORY[0x24BDBCED8];
      v54 = *MEMORY[0x24BEBB360];
      v59[0] = *MEMORY[0x24BEBB3D8];
      v59[1] = v54;
      v60[0] = &unk_24CB8C0F8;
      v60[1] = v11;
      v59[2] = *MEMORY[0x24BEBB368];
      -[AMSUIMessageMarkdownGenerator configuration](self, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "strikeThroughColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      if (!v14)
      {
        -[AMSUIMessageMarkdownGenerator configuration](self, "configuration");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "color");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v60[2] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 3);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "dictionaryWithDictionary:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator pushAttributes:](self, "pushAttributes:", v56);

      if (v14)
        goto LABEL_16;
      goto LABEL_3;
    case 6uLL:
    case 7uLL:
      -[AMSUIMessageMarkdownGenerator currentFont](self, "currentFont");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator reconcileElementAttributes:withFont:](self, "reconcileElementAttributes:withFont:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BDBCED8];
      v57[0] = *MEMORY[0x24BEBB3A8];
      -[AMSUIMessageMarkdownGenerator configuration](self, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "paragraphStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x24BEBB360];
      v58[0] = v14;
      v58[1] = v11;
      v16 = *MEMORY[0x24BEBB368];
      v57[1] = v15;
      v57[2] = v16;
      -[AMSUIMessageMarkdownGenerator configuration](self, "configuration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "color");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v58[2] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dictionaryWithDictionary:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIMessageMarkdownGenerator pushAttributes:](self, "pushAttributes:", v19);

LABEL_3:
LABEL_16:

LABEL_17:
      goto LABEL_18;
    case 8uLL:
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AMSUISymbol"));
      -[AMSUIMessageMarkdownGenerator pushAttributes:](self, "pushAttributes:", v11);
LABEL_18:

      break;
    default:
      break;
  }

}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  if (a4 == 8)
  {
    -[AMSUIMessageMarkdownGenerator symbol](self, "symbol", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x24BEBD640];
      -[AMSUIMessageMarkdownGenerator symbol](self, "symbol");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ams_imageWithSystemSymbolName:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x24BDBCED8];
      -[AMSUIMessageMarkdownGenerator attributeStack](self, "attributeStack");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryWithDictionary:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BEBD660];
      -[AMSUIMessageMarkdownGenerator currentFont](self, "currentFont");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "configurationWithFont:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD660], "ams_imageSymbolConfigurationWithDictionary:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
      {
        objc_msgSend(v15, "configurationByApplyingConfiguration:", v16);
        v18 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = v16;
      }
      -[AMSUIMessageMarkdownGenerator configuration](self, "configuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "color");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = (void *)MEMORY[0x24BEBD660];
        -[AMSUIMessageMarkdownGenerator configuration](self, "configuration");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "color");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v23;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "configurationWithPaletteColors:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "configurationByApplyingConfiguration:", v18);
        v26 = objc_claimAutoreleasedReturnValue();

        v18 = (id)v26;
      }
      if (v18)
      {
        objc_msgSend(v8, "ams_imageWithSymbolConfiguration:", v18);
        v27 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v27;
      }
      v28 = objc_alloc_init(MEMORY[0x24BEBB4B8]);
      objc_msgSend(v28, "setImage:", v8);
      -[AMSUIMessageMarkdownGenerator accumulator](self, "accumulator");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "appendAttributedString:", v30);

    }
  }
  -[AMSUIMessageMarkdownGenerator popAttributes](self, "popAttributes");
  -[AMSUIMessageMarkdownGenerator accumulator](self, "accumulator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "endEditing");

  -[AMSUIMessageMarkdownGenerator setSymbol:](self, "setSymbol:", 0);
}

- (void)parser:(id)a3 didFindArtworkWithIdentifier:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x24BEBB4B8];
  v6 = a4;
  v10 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x24BEBD640], "ams_imageWithSystemSymbolName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setImage:", v7);
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageMarkdownGenerator accumulator](self, "accumulator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendAttributedString:", v8);

}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AMSUIMessageMarkdownGenerator appendStyledString:](self, "appendStyledString:", v5);

}

- (void)parserDidFindNewline:(id)a3
{
  -[AMSUIMessageMarkdownGenerator appendStyledString:](self, "appendStyledString:", CFSTR("\n"));
}

- (NSMutableAttributedString)accumulator
{
  return self->_accumulator;
}

- (void)setAccumulator:(id)a3
{
  objc_storeStrong((id *)&self->_accumulator, a3);
}

- (AMSUIMarkdownParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
  objc_storeStrong((id *)&self->_parser, a3);
}

- (NSMutableArray)attributeStack
{
  return self->_attributeStack;
}

- (void)setAttributeStack:(id)a3
{
  objc_storeStrong((id *)&self->_attributeStack, a3);
}

- (BOOL)didParseEverything
{
  return self->_didParseEverything;
}

- (void)setDidParseEverything:(BOOL)a3
{
  self->_didParseEverything = a3;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
  objc_storeStrong((id *)&self->_symbol, a3);
}

- (NSDictionary)symbolAttributes
{
  return self->_symbolAttributes;
}

- (void)setSymbolAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_symbolAttributes, a3);
}

- (AMSUIMessageMarkdownConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_symbolAttributes, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
  objc_storeStrong((id *)&self->_attributeStack, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_accumulator, 0);
}

@end
