@implementation IKTextParser

+ (id)textWithDOMElement:(id)a3 usingParseBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "_attributedStringFromDomElement:usingParseBlock:", v7, v6);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v8[1];
  v8[1] = v9;

  return v8;
}

+ (id)textWithAttributedString:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (NSString)string
{
  void *v2;
  void *v3;

  -[IKTextParser attributedString](self, "attributedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)attributedStringWithFont:(id)a3 style:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[IKTextParser _attributesWithFont:style:](self, "_attributesWithFont:style:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTextParser _attributedStringWithDefaultAttributes:fontHandler:style:](self, "_attributedStringWithDefaultAttributes:fontHandler:style:", v7, 0, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)attributedStringWithFont:(id)a3 foregroundColor:(id)a4 textAlignment:(int64_t)a5 style:(id)a6
{
  id v10;
  void *v11;
  void *v12;

  v10 = a6;
  -[IKTextParser _attributesWithFont:style:foregroundColor:textAlignment:](self, "_attributesWithFont:style:foregroundColor:textAlignment:", a3, v10, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTextParser _attributedStringWithDefaultAttributes:fontHandler:style:](self, "_attributedStringWithDefaultAttributes:fontHandler:style:", v11, 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4
{
  return -[IKTextParser attributedStringWithFontHandler:style:defaultAttributes:](self, "attributedStringWithFontHandler:style:defaultAttributes:", a3, a4, 0);
}

- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4 defaultAttributes:(id *)a5
{
  void (*v8)(void);
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void (*)(void))*((_QWORD *)a3 + 2);
  v9 = a4;
  v10 = a3;
  v8();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTextParser _attributesWithFont:style:](self, "_attributesWithFont:style:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v12);
  -[IKTextParser _attributedStringWithDefaultAttributes:fontHandler:style:](self, "_attributedStringWithDefaultAttributes:fontHandler:style:", v12, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4 foregroundColor:(id)a5 textAlignment:(int64_t)a6
{
  return -[IKTextParser attributedStringWithFontHandler:style:foregroundColor:textAlignment:defaultAttributes:](self, "attributedStringWithFontHandler:style:foregroundColor:textAlignment:defaultAttributes:", a3, a4, a5, a6, 0);
}

- (id)attributedStringWithFontHandler:(id)a3 style:(id)a4 foregroundColor:(id)a5 textAlignment:(int64_t)a6 defaultAttributes:(id *)a7
{
  void (*v12)(id, id);
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v12 = (void (*)(id, id))*((_QWORD *)a3 + 2);
  v13 = a5;
  v14 = a4;
  v12(a3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKTextParser _attributesWithFont:style:foregroundColor:textAlignment:](self, "_attributesWithFont:style:foregroundColor:textAlignment:", v15, v14, v13, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7)
    *a7 = objc_retainAutorelease(v16);
  -[IKTextParser _attributedStringWithDefaultAttributes:fontHandler:style:](self, "_attributedStringWithDefaultAttributes:fontHandler:style:", v16, 0, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_attributesWithFont:(id)a3 style:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "ikColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v6, "textAlignment");
  if ((unint64_t)(v10 - 1) >= 4)
    v11 = 4;
  else
    v11 = v10 - 1;
  -[IKTextParser _attributesWithFont:style:foregroundColor:textAlignment:](self, "_attributesWithFont:style:foregroundColor:textAlignment:", v7, v6, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_attributesWithFont:(id)a3 style:(id)a4 foregroundColor:(id)a5 textAlignment:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CEA098]);
  if (v11)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CEA0A0]);
  objc_msgSend(v10, "textShadow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "letterSpacing");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CEA0F0]);
  if (v15)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CEA0B0]);
  objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v17, "ik_applyViewElementStyle:", v10);
  objc_msgSend(v17, "setAlignment:", a6);
  objc_msgSend(v17, "setLineBreakMode:", 4);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CEA0D0]);
  v18 = (void *)objc_msgSend(v13, "copy");

  return v18;
}

- (id)_attributedStringWithDefaultAttributes:(id)a3 fontHandler:(id)a4 style:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSAttributedString *attributedString;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[IKTextParser attributedString](self, "attributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = objc_msgSend(v12, "length");
  objc_msgSend(v12, "addAttributes:range:", v10, 0, v13);
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA0A0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    attributedString = self->_attributedString;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__IKTextParser__attributedStringWithDefaultAttributes_fontHandler_style___block_invoke;
    v19[3] = &unk_1E9F4E1D0;
    v20 = v9;
    v21 = v14;
    v24 = v8;
    v22 = v15;
    v23 = v12;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](attributedString, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, v19);

  }
  objc_msgSend(v12, "removeAttribute:range:", CFSTR("bold"), 0, v13);
  objc_msgSend(v12, "removeAttribute:range:", CFSTR("italic"), 0, v13);
  objc_msgSend(v12, "removeAttribute:range:", CFSTR("span"), 0, v13);
  v17 = (void *)objc_msgSend(v12, "copy");

  return v17;
}

void __73__IKTextParser__attributedStringWithDefaultAttributes_fontHandler_style___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  double v33;
  void *v34;
  void *v35;
  id v36;

  v36 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fontSize");
  v8 = v7;
  v9 = *MEMORY[0x1E0CEA098];
  objc_msgSend(v36, "valueForKey:", *MEMORY[0x1E0CEA098]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    v11 = *(void **)(a1 + 40);
  v12 = v11;

  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("styleableElement"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textElement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && (v16 = *(_QWORD *)(a1 + 64)) != 0)
  {
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;

      v8 = 0.0;
      v12 = v19;
    }

  }
  else
  {
    objc_msgSend(v12, "pointSize");
    if (v8 == v20)
      v8 = 0.0;
  }
  objc_msgSend(v12, "fontDescriptor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(v36, "valueForKey:", *MEMORY[0x1E0CEA0A0]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23
    || (objc_msgSend(v15, "ikColor"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v24, "color"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24,
        v23))
  {
    if (v23 != *(void **)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 56), "addAttribute:value:range:", v22, v23, a3, a4);
  }
  objc_msgSend(v36, "objectForKey:", CFSTR("strike"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(*(id *)(a1 + 56), "addAttribute:value:range:", *MEMORY[0x1E0CEA0F8], &unk_1E9F8C5A8, a3, a4);
  objc_msgSend(v36, "objectForKey:", CFSTR("bold"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26 != 0;

  objc_msgSend(v36, "objectForKey:", CFSTR("italic"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (v28 != 0) | (2 * v27);
  if ((_DWORD)v29 || v8 > 0.0)
  {
    v30 = v21;
    v31 = v30;
    if ((_DWORD)v29)
    {
      objc_msgSend(v30, "fontDescriptorWithSymbolicTraits:", v29);
      v32 = objc_claimAutoreleasedReturnValue();

      v31 = (void *)v32;
    }
    if (v8 == 0.0)
    {
      objc_msgSend(v12, "pointSize");
      v8 = v33;
    }
    v34 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v31, v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addAttribute:value:range:", v9, v35, a3, a4);

  }
  else if (v12 != *(id *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 56), "addAttribute:value:range:", v9, v12, a3, a4);
  }

}

- (id)_attributedStringFromDomElement:(id)a3 usingParseBlock:(id)a4
{
  id v6;
  void (**v7)(id, IKTextParser *, id, char *);
  id v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  const __CFString **v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  _BYTE v37[128];
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, IKTextParser *, id, char *))a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v36 = 1;
  objc_msgSend(v6, "childNodesAsArray");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7[2](v7, self, v6, &v36);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[__CFString string](v10, "string");
      v11 = (uint64_t)v10;
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    if (!v36)
    {

      v9 = 0;
    }
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v36)
  {
    objc_msgSend(v6, "textContent");
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (__CFString *)v12;
  }
  objc_msgSend(v6, "nodeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("b")))
  {
    v44 = CFSTR("bold");
    v45[0] = MEMORY[0x1E0C9AAB0];
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = v45;
    v16 = &v44;
LABEL_20:
    objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("i")))
  {
    v42 = CFSTR("italic");
    v43 = MEMORY[0x1E0C9AAB0];
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v43;
    v16 = &v42;
    goto LABEL_20;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("span")))
  {
    v40 = CFSTR("span");
    v41 = MEMORY[0x1E0C9AAB0];
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v41;
    v16 = &v40;
    goto LABEL_20;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("strike")))
  {
    v38 = CFSTR("strike");
    v39 = MEMORY[0x1E0C9AAB0];
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = &v39;
    v16 = &v38;
    goto LABEL_20;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("date")))
  {
    -[IKTextParser _stringFromDateElement:unformattedString:](self, "_stringFromDateElement:unformattedString:", v6, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v13, "isEqualToString:", CFSTR("duration")))
  {
    -[IKTextParser _stringFromDurationElement:unformattedString:](self, "_stringFromDurationElement:unformattedString:", v6, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v13, "isEqualToString:", CFSTR("number")))
    {
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("br")))
      {

        v17 = 0;
        v10 = CFSTR("\n");
      }
      else
      {
        v17 = 0;
      }
      goto LABEL_21;
    }
    -[IKTextParser _stringFromNumberElement:unformattedString:](self, "_stringFromNumberElement:unformattedString:", v6, v10);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27 = v26;
  if (v26)
  {
    v28 = v26;

    v10 = v28;
  }

  v17 = 0;
  v9 = 0;
LABEL_21:
  v30 = v10;
  v31 = v6;
  if (-[__CFString length](v10, "length"))
  {
    if (!v11)
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, 0);
    v18 = v13;
    v29 = (void *)v11;
    objc_msgSend(v8, "appendAttributedString:", v11);
  }
  else
  {
    v18 = v13;
    v29 = (void *)v11;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        -[IKTextParser _attributedStringFromDomElement:usingParseBlock:](self, "_attributedStringFromDomElement:usingParseBlock:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendAttributedString:", v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v21);
  }

  if (v17)
    objc_msgSend(v8, "addAttributes:range:", v17, 0, objc_msgSend(v8, "length"));

  return v8;
}

- (id)_stringFromDateElement:(id)a3 unformattedString:(id)a4
{
  id v5;
  id v6;
  id v7;
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

  v5 = a3;
  v6 = a4;
  if (!_stringFromDateElement_unformattedString__sSimpleInputFormatter)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v8 = (void *)_stringFromDateElement_unformattedString__sSimpleInputFormatter;
    _stringFromDateElement_unformattedString__sSimpleInputFormatter = (uint64_t)v7;

    objc_msgSend((id)_stringFromDateElement_unformattedString__sSimpleInputFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  }
  objc_msgSend(v5, "getAttribute:", CFSTR("locale"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v9);
  else
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_stringFromDateElement_unformattedString__sSimpleInputFormatter, "setLocale:", v10);
  if (!v6)
  {
    objc_msgSend(v5, "textContent");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)_stringFromDateElement_unformattedString__sSimpleInputFormatter, "dateFromString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_11;
  +[IKFormatting isoDateFormatter](IKFormatting, "isoDateFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateFromString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    || (+[IKFormatting rfc1123DateFormatter](IKFormatting, "rfc1123DateFormatter"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "dateFromString:", v6),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v11))
  {
LABEL_11:
    +[IKFormatting sharedInstance](IKFormatting, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getAttribute:", CFSTR("format"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "formatDate:format:", v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  if (v16)
    v17 = v16;
  else
    v17 = v6;
  v18 = v17;

  return v18;
}

- (id)_stringFromDurationElement:(id)a3 unformattedString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (_stringFromDurationElement_unformattedString__sInputFormatter)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v12 = (void *)_stringFromDurationElement_unformattedString__sInputFormatter;
    _stringFromDurationElement_unformattedString__sInputFormatter = (uint64_t)v11;

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(v5, "textContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  objc_msgSend((id)_stringFromDurationElement_unformattedString__sInputFormatter, "numberFromString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[IKFormatting sharedInstance](IKFormatting, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "formatDuration:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if (v10)
    v13 = v10;
  else
    v13 = v7;
  v14 = v13;

  return v14;
}

- (id)_stringFromNumberElement:(id)a3 unformattedString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (_stringFromNumberElement_unformattedString__sInputFormatter)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v15 = (void *)_stringFromNumberElement_unformattedString__sInputFormatter;
    _stringFromNumberElement_unformattedString__sInputFormatter = (uint64_t)v14;

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(v5, "textContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  objc_msgSend((id)_stringFromNumberElement_unformattedString__sInputFormatter, "numberFromString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[IKFormatting sharedInstance](IKFormatting, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getAttribute:", CFSTR("style"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getAttribute:", CFSTR("postiveFormat"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getAttribute:", CFSTR("negativeFormat"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "formatNumber:style:postiveFormat:negativeFormat:", v8, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  if (v13)
    v16 = v13;
  else
    v16 = v7;
  v17 = v16;

  return v17;
}

- (unint64_t)hash
{
  return -[NSAttributedString hash](self->_attributedString, "hash");
}

- (BOOL)isEqual:(id)a3
{
  IKTextParser *v4;
  NSAttributedString *attributedString;
  char v6;

  v4 = (IKTextParser *)a3;
  if (self == v4)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  attributedString = self->_attributedString;
  if (attributedString == v4->_attributedString)
LABEL_5:
    v6 = 1;
  else
    v6 = -[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:");
LABEL_7:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSAttributedString mutableCopyWithZone:](self->_attributedString, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
