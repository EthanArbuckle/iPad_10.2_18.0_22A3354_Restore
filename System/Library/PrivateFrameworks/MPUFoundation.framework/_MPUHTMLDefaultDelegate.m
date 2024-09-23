@implementation _MPUHTMLDefaultDelegate

- (id)parser:(id)a3 attributesForTagName:(id)a4 tagAttributes:(id)a5 currentState:(id)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v21;
  void *v22;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a6, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BDF65F8];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x24BDF65F8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v12, "fontDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("b")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("strong")))
  {
    objc_msgSend(v12, "pointSize");
    v16 = v14;
    v17 = 2;
LABEL_7:
    _MPUHTMLDefaultDelegateFontByAddingTraits(v16, v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v18, v11);

    goto LABEL_8;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("i")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("em")))
  {
    objc_msgSend(v12, "pointSize");
    v16 = v14;
    v17 = 1;
    goto LABEL_7;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("u")))
  {
    objc_msgSend(v13, "setObject:forKey:", &unk_24DD76E70, *MEMORY[0x24BDF66D8]);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("a")))
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("href"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v13, "setObject:forKey:", v22, *MEMORY[0x24BDF6618]);

  }
LABEL_8:
  if (objc_msgSend(v13, "count"))
    v19 = v13;
  else
    v19 = 0;

  return v19;
}

- (id)defaultAttributesForParser:(id)a3
{
  return self->_defaultAttributes;
}

- (id)parser:(id)a3 prependStringForTagName:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("br")))
    return CFSTR("\n");
  else
    return 0;
}

- (NSDictionary)defaultAttributes
{
  return self->_defaultAttributes;
}

- (void)setDefaultAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
}

@end
