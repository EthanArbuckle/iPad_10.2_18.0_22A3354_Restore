@implementation CLKSimpleTextProvider

- (CLKSimpleTextProvider)initWithText:(NSString *)text
{
  return -[CLKSimpleTextProvider initWithText:shortText:accessibilityLabel:](self, "initWithText:shortText:accessibilityLabel:", text, 0, 0);
}

- (CLKSimpleTextProvider)initWithText:(NSString *)text shortText:(NSString *)shortText
{
  return -[CLKSimpleTextProvider initWithText:shortText:accessibilityLabel:](self, "initWithText:shortText:accessibilityLabel:", text, shortText, 0);
}

- (CLKSimpleTextProvider)initWithText:(NSString *)text shortText:(NSString *)shortText accessibilityLabel:(NSString *)accessibilityLabel
{
  NSString *v8;
  NSString *v9;
  NSString *v10;
  CLKSimpleTextProvider *v11;
  CLKSimpleTextProvider *v12;
  objc_super v14;

  v8 = text;
  v9 = shortText;
  v10 = accessibilityLabel;
  v14.receiver = self;
  v14.super_class = (Class)CLKSimpleTextProvider;
  v11 = -[CLKTextProvider initPrivate](&v14, sel_initPrivate);
  v12 = v11;
  if (v11)
  {
    -[CLKSimpleTextProvider setText:](v11, "setText:", v8);
    -[CLKSimpleTextProvider setShortText:](v12, "setShortText:", v9);
    -[CLKTextProvider setAccessibilityLabel:](v12, "setAccessibilityLabel:", v10);
  }

  return v12;
}

+ (CLKSimpleTextProvider)textProviderWithText:(NSString *)text
{
  return (CLKSimpleTextProvider *)objc_msgSend(a1, "textProviderWithText:shortText:", text, 0);
}

+ (CLKSimpleTextProvider)textProviderWithText:(NSString *)text shortText:(NSString *)shortText
{
  return (CLKSimpleTextProvider *)objc_msgSend(a1, "textProviderWithText:shortText:accessibilityLabel:", text, shortText, 0);
}

+ (CLKSimpleTextProvider)textProviderWithText:(NSString *)text shortText:(NSString *)shortText accessibilityLabel:(NSString *)accessibilityLabel
{
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void *v11;

  v8 = accessibilityLabel;
  v9 = shortText;
  v10 = text;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithText:shortText:accessibilityLabel:", v10, v9, v8);

  return (CLKSimpleTextProvider *)v11;
}

+ (id)finalizedTextProviderWithText:(id)a3
{
  return (id)objc_msgSend(a1, "finalizedTextProviderWithText:monospaceNumbers:", a3, 0);
}

+ (id)finalizedTextProviderWithText:(id)a3 monospaceNumbers:(BOOL)a4
{
  void *v4;

  objc_msgSend(a1, "textProviderWithText:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalize");
  return v4;
}

- (id)_sessionAttributedTextForIndex:(unint64_t)a3 withStyle:(id)a4
{
  id v6;
  int *v7;
  void *v8;
  id v9;
  int v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  double v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  _QWORD v78[2];
  _QWORD v79[2];
  uint64_t v80;
  void *v81;
  _QWORD v82[2];
  _QWORD v83[4];

  v83[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3)
  {
    if (a3 != 1)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = &OBJC_IVAR___CLKSimpleTextProvider__shortText;
  }
  else
  {
    v7 = &OBJC_IVAR___CLKSimpleTextProvider__text;
  }
  v8 = *(Class *)((char *)&self->super.super.isa + *v7);
LABEL_7:
  v9 = v8;
  if (objc_msgSend(v6, "uppercase")
    && !-[CLKTextProvider ignoreUppercaseStyle](self, "ignoreUppercaseStyle"))
  {
    v10 = !-[CLKSimpleTextProvider useLowercaseSmallCaps](self, "useLowercaseSmallCaps");
  }
  else
  {
    v10 = 0;
  }
  v11 = self->_useAllSmallCaps && CLKSmallCapsAllowed() && !self->_useNoContentDashFormatting;
  v12 = self->_useLowercaseSmallCaps && CLKSmallCapsAllowed() && !self->_useNoContentDashFormatting;
  if ((v10 | v11) == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uppercaseStringWithLocale:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v14;
  }
  if (!v9)
  {
    v20 = 0;
    goto LABEL_52;
  }
  objc_msgSend(v6, "font");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = (uint64_t *)MEMORY[0x24BEBD270];
  if (v11)
  {
    objc_msgSend(v6, "smallCapsBaseFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "CLKFontWithLocalizedSmallCaps");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v12)
    {
      v26 = 0;
      v21 = (void *)v15;
      goto LABEL_38;
    }
    objc_msgSend(v6, "smallCapsBaseFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "CLKFontWithLocalizedLowerCaseSmallCaps");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v19;

  if (CLKUsesFauxSmallCaps())
  {
    objc_msgSend(v6, "smallCapsBaseFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if (v24)
    {
      objc_msgSend(v21, "pointSize");
      objc_msgSend(v21, "fontWithSize:", v25 + -2.5);
    }
    else
    {
      objc_msgSend(v6, "smallCapsBaseFont");
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *v17;
    v83[0] = v27;
    v29 = *MEMORY[0x24BDC4C20];
    v82[0] = v28;
    v82[1] = v29;
    v80 = *MEMORY[0x24BDC4C18];
    v81 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v30;
    v31 = (void *)MEMORY[0x24BDBCE70];
    v32 = v83;
    v33 = v82;
    goto LABEL_36;
  }
  if (!v11 && !v12)
  {
    v26 = 0;
    goto LABEL_38;
  }
  if ((CTFontGetSymbolicTraits((CTFontRef)v21) & 1) != 0)
  {
    objc_msgSend(v21, "pointSize");
    objc_msgSend(v21, "fontWithSize:", v67 * 0.75);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = *v17;
    v79[0] = v27;
    v69 = *MEMORY[0x24BDC4C20];
    v78[0] = v68;
    v78[1] = v69;
    v76 = *MEMORY[0x24BDC4C18];
    v77 = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v30;
    v31 = (void *)MEMORY[0x24BDBCE70];
    v32 = v79;
    v33 = v78;
LABEL_36:
    objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_38;
  }
  v74 = *v17;
  v75 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:
  -[CLKTextProvider fontFeatures](self, "fontFeatures");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    -[CLKTextProvider fontFeatures](self, "fontFeatures");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "CLKFontByApplyingFeatureSettings:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v37 = (void *)objc_msgSend(v26, "mutableCopy");
      v38 = *v17;
      objc_msgSend(v37, "objectForKeyedSubscript:", *v17);
      v39 = v6;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKTextProvider fontFeatures](self, "fontFeatures");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "CLKFontByApplyingFeatureSettings:", v41);
      v42 = v26;
      v43 = v9;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v44, v38);

      v9 = v43;
      v6 = v39;

      v26 = v37;
    }
  }
  else
  {
    v36 = v21;
  }
  v71 = v36;
  if (self->_useNoContentDashFormatting)
  {
    objc_msgSend(v36, "fontDescriptor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    _AlternatePunctuationAttributes();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "fontDescriptorByAddingAttributes:", v46);
    v70 = v6;
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD5E0], "fontWithDescriptor:size:", v47, 0.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v9);
    v50 = v9;
    v51 = objc_msgSend(v9, "length");
    v52 = 305.0 / (double)CTFontGetUnitsPerEm((CTFontRef)v36);
    objc_msgSend(v36, "pointSize");
    v54 = v26;
    v55 = *MEMORY[0x24BEBD280];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v53 * v52);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v55;
    v26 = v54;
    objc_msgSend(v49, "addAttribute:value:range:", v57, v56, 0, v51);

    objc_msgSend(v49, "addAttribute:value:range:", *MEMORY[0x24BEBD270], v48, 0, v51);
    v6 = v70;

  }
  else
  {
    v58 = objc_alloc(MEMORY[0x24BDD1458]);
    v59 = v58;
    if (v26)
    {
      v50 = v9;
      v49 = (void *)objc_msgSend(v58, "initWithString:attributes:", v9, v26);
    }
    else
    {
      v72 = *MEMORY[0x24BEBD270];
      v73 = v36;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v9;
      v49 = (void *)objc_msgSend(v59, "initWithString:attributes:", v9, v60);

    }
  }
  objc_msgSend(v49, "_attributedStringWithOtherAttributesFromStyle:", v6, v70);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "shouldEmbedTintColors"))
  {
    -[CLKTextProvider tintColor](self, "tintColor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v50;
    v62 = v71;
    if (v61)
    {
      -[CLKTextProvider tintColor](self, "tintColor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_attributedStringWithForegroundColor:", v63);
      v64 = v26;
      v65 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v65;
      v26 = v64;
    }
  }
  else
  {
    v9 = v50;
    v62 = v71;
  }

LABEL_52:
  return v20;
}

- (BOOL)_validate
{
  NSString *text;
  NSObject *v4;

  text = self->_text;
  if (!text)
  {
    CLKLoggingObjectForDomain(10);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[CLKSimpleTextProvider _validate].cold.1((uint64_t)self, v4);

  }
  return text != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKSimpleTextProvider;
  -[CLKTextProvider description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  CLKSimpleTextProvider *v4;
  CLKSimpleTextProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLKSimpleTextProvider;
  v4 = -[CLKTextProvider copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4 != self)
  {
    objc_storeStrong((id *)&v4->_text, self->_text);
    objc_storeStrong((id *)&v5->_shortText, self->_shortText);
    v5->_useNoContentDashFormatting = self->_useNoContentDashFormatting;
    v5->_useAllSmallCaps = self->_useAllSmallCaps;
    v5->_useLowercaseSmallCaps = self->_useLowercaseSmallCaps;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void **v4;
  BOOL v5;
  objc_super v7;

  v4 = (void **)a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKSimpleTextProvider;
  v5 = -[CLKTextProvider isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && CLKEqualObjects(self->_text, v4[17])
    && CLKEqualObjects(self->_shortText, v4[18])
    && self->_useNoContentDashFormatting == *((unsigned __int8 *)v4 + 128)
    && self->_useAllSmallCaps == *((unsigned __int8 *)v4 + 129)
    && self->_useLowercaseSmallCaps == *((unsigned __int8 *)v4 + 130);

  return v5;
}

- (unint64_t)hash
{
  id v3;
  NSUInteger v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKSimpleTextProvider;
  v3 = -[CLKTextProvider hash](&v6, sel_hash);
  v4 = (NSUInteger)v3 + -[NSString hash](self->_text, "hash");
  return v4
       + 4 * -[NSString hash](self->_shortText, "hash")
       + 32 * self->_useNoContentDashFormatting
       + ((unint64_t)self->_useAllSmallCaps << 6)
       + ((unint64_t)self->_useLowercaseSmallCaps << 7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKSimpleTextProvider;
  v4 = a3;
  -[CLKTextProvider encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, CFSTR("_text"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_shortText, CFSTR("_shortText"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_useNoContentDashFormatting, CFSTR("useNoContentDashFormatting"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_useAllSmallCaps, CFSTR("useAllSmallCaps"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_useLowercaseSmallCaps, CFSTR("useLowercaseSmallCaps"));

}

- (CLKSimpleTextProvider)initWithCoder:(id)a3
{
  id v4;
  CLKSimpleTextProvider *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSString *shortText;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKSimpleTextProvider;
  v5 = -[CLKTextProvider initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shortText"));
    v8 = objc_claimAutoreleasedReturnValue();
    shortText = v5->_shortText;
    v5->_shortText = (NSString *)v8;

    v5->_useNoContentDashFormatting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useNoContentDashFormatting"));
    v5->_useAllSmallCaps = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useAllSmallCaps"));
    v5->_useLowercaseSmallCaps = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useLowercaseSmallCaps"));
  }

  return v5;
}

- (id)attributedString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD1458]);
  v4 = v3;
  if (self->_text)
  {
    v5 = (void *)objc_msgSend(v3, "initWithString:");
  }
  else
  {
    CLKLocalizedString(CFSTR("EMPTY_TEXT_DASHES"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "initWithString:", v6);

  }
  return v5;
}

- (id)_initWithJSONObjectRepresentation:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLKSimpleTextProvider;
  v5 = -[CLKTextProvider _initWithJSONObjectRepresentation:](&v10, sel__initWithJSONObjectRepresentation_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a string - invalid value: %@"), CFSTR("text"), v6);
    objc_storeStrong(v5 + 17, v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shortText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a string - invalid value: %@"), CFSTR("shortText"), v7);
      objc_storeStrong(v5 + 18, v7);
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smallCaps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), CFSTR("smallCaps"), v7);
      *((_BYTE *)v5 + 130) = objc_msgSend(v8, "BOOLValue");
    }

  }
  return v5;
}

- (id)JSONObjectRepresentation
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKSimpleTextProvider;
  -[CLKTextProvider JSONObjectRepresentation](&v5, sel_JSONObjectRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_text, CFSTR("text"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_shortText, CFSTR("shortText"));
  if (self->_useLowercaseSmallCaps)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("smallCaps"));
  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(NSString *)text
{
  objc_setProperty_nonatomic_copy(self, a2, text, 136);
}

- (NSString)shortText
{
  return self->_shortText;
}

- (void)setShortText:(NSString *)shortText
{
  objc_setProperty_nonatomic_copy(self, a2, shortText, 144);
}

- (BOOL)useNoContentDashFormatting
{
  return self->_useNoContentDashFormatting;
}

- (void)setUseNoContentDashFormatting:(BOOL)a3
{
  self->_useNoContentDashFormatting = a3;
}

- (BOOL)useAllSmallCaps
{
  return self->_useAllSmallCaps;
}

- (void)setUseAllSmallCaps:(BOOL)a3
{
  self->_useAllSmallCaps = a3;
}

- (BOOL)useLowercaseSmallCaps
{
  return self->_useLowercaseSmallCaps;
}

- (void)setUseLowercaseSmallCaps:(BOOL)a3
{
  self->_useLowercaseSmallCaps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)_validate
{
  void *v3;
  id v4;
  id v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  v4 = v3;
  v6 = 138412802;
  v7 = CFSTR("text");
  v8 = 2112;
  v9 = v3;
  v10 = 2112;
  v11 = (id)objc_opt_class();
  v5 = v11;
  _os_log_fault_impl(&dword_2114F4000, a2, OS_LOG_TYPE_FAULT, "Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", (uint8_t *)&v6, 0x20u);

}

@end
