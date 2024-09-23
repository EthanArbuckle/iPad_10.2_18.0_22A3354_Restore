@implementation CHSGaugeParameters

- (CHSGaugeParameters)initWithLeadingText:(id)a3 trailingText:(id)a4 style:(unint64_t)a5 gradientColors:(id)a6 gradientLocations:(id)a7 fraction:(double)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  CHSGaugeParameters *v18;
  uint64_t v19;
  NSAttributedString *leadingText;
  uint64_t v21;
  NSAttributedString *trailingText;
  uint64_t v23;
  NSArray *gradientColors;
  uint64_t v25;
  NSArray *gradientLocations;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CHSGaugeParameters;
  v18 = -[CHSGaugeParameters init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    leadingText = v18->_leadingText;
    v18->_leadingText = (NSAttributedString *)v19;

    v21 = objc_msgSend(v15, "copy");
    trailingText = v18->_trailingText;
    v18->_trailingText = (NSAttributedString *)v21;

    v18->_style = a5;
    v23 = objc_msgSend(v16, "copy");
    gradientColors = v18->_gradientColors;
    v18->_gradientColors = (NSArray *)v23;

    v25 = objc_msgSend(v17, "copy");
    gradientLocations = v18->_gradientLocations;
    v18->_gradientLocations = (NSArray *)v25;

    v18->_fraction = a8;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  NSAttributedString *leadingText;
  uint64_t v11;
  id v12;
  id v13;
  NSAttributedString *trailingText;
  id v15;
  id v16;
  unint64_t style;
  id v18;
  id v19;
  NSArray *gradientColors;
  id v21;
  id v22;
  NSArray *gradientLocations;
  id v24;
  id v25;
  double fraction;
  id v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  leadingText = self->_leadingText;
  v11 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __30__CHSGaugeParameters_isEqual___block_invoke;
  v43[3] = &unk_1E2A5AAF0;
  v12 = v9;
  v44 = v12;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", leadingText, v43);
  trailingText = self->_trailingText;
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __30__CHSGaugeParameters_isEqual___block_invoke_2;
  v41[3] = &unk_1E2A5AAF0;
  v15 = v12;
  v42 = v15;
  v16 = (id)objc_msgSend(v5, "appendObject:counterpart:", trailingText, v41);
  style = self->_style;
  v39[0] = v11;
  v39[1] = 3221225472;
  v39[2] = __30__CHSGaugeParameters_isEqual___block_invoke_3;
  v39[3] = &unk_1E2A5A558;
  v18 = v15;
  v40 = v18;
  v19 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", style, v39);
  gradientColors = self->_gradientColors;
  v37[0] = v11;
  v37[1] = 3221225472;
  v37[2] = __30__CHSGaugeParameters_isEqual___block_invoke_4;
  v37[3] = &unk_1E2A5A218;
  v21 = v18;
  v38 = v21;
  v22 = (id)objc_msgSend(v5, "appendObject:counterpart:", gradientColors, v37);
  gradientLocations = self->_gradientLocations;
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __30__CHSGaugeParameters_isEqual___block_invoke_5;
  v35[3] = &unk_1E2A5A218;
  v24 = v21;
  v36 = v24;
  v25 = (id)objc_msgSend(v5, "appendObject:counterpart:", gradientLocations, v35);
  fraction = self->_fraction;
  v30 = v11;
  v31 = 3221225472;
  v32 = __30__CHSGaugeParameters_isEqual___block_invoke_6;
  v33 = &unk_1E2A5A4E0;
  v27 = v24;
  v34 = v27;
  v28 = (id)objc_msgSend(v5, "appendDouble:counterpart:", &v30, fraction);
  LOBYTE(v24) = objc_msgSend(v5, "isEqual", v30, v31, v32, v33);

  return (char)v24;
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "leadingText");
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trailingText");
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "style");
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "gradientColors");
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "gradientLocations");
}

uint64_t __30__CHSGaugeParameters_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fraction");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_leadingText);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_trailingText);
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_style);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_gradientColors);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_gradientLocations);
  v9 = (id)objc_msgSend(v3, "appendDouble:", self->_fraction);
  v10 = objc_msgSend(v3, "hash");

  return v10;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_leadingText, CFSTR("leadingText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_trailingText, CFSTR("trailingText"));
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_style, CFSTR("style"));
  objc_msgSend(v4, "encodeCollection:forKey:", self->_gradientColors, CFSTR("gradientColors"));
  objc_msgSend(v4, "encodeCollection:forKey:", self->_gradientLocations, CFSTR("gradientLocations"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("fraction"), self->_fraction);

}

- (CHSGaugeParameters)initWithBSXPCCoder:(id)a3
{
  id v4;
  CHSGaugeParameters *v5;
  uint64_t v6;
  NSAttributedString *leadingText;
  uint64_t v8;
  NSAttributedString *trailingText;
  uint64_t v10;
  uint64_t v11;
  NSArray *gradientColors;
  uint64_t v13;
  uint64_t v14;
  NSArray *gradientLocations;
  double v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CHSGaugeParameters;
  v5 = -[CHSGaugeParameters init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leadingText"));
    v6 = objc_claimAutoreleasedReturnValue();
    leadingText = v5->_leadingText;
    v5->_leadingText = (NSAttributedString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trailingText"));
    v8 = objc_claimAutoreleasedReturnValue();
    trailingText = v5->_trailingText;
    v5->_trailingText = (NSAttributedString *)v8;

    v5->_style = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("style"));
    v10 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v10, objc_opt_class(), CFSTR("gradientColors"));
    v11 = objc_claimAutoreleasedReturnValue();
    gradientColors = v5->_gradientColors;
    v5->_gradientColors = (NSArray *)v11;

    v13 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v13, objc_opt_class(), CFSTR("gradientLocations"));
    v14 = objc_claimAutoreleasedReturnValue();
    gradientLocations = v5->_gradientLocations;
    v5->_gradientLocations = (NSArray *)v14;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fraction"));
    v5->_fraction = v16;
  }

  return v5;
}

- (NSAttributedString)leadingText
{
  return self->_leadingText;
}

- (NSAttributedString)trailingText
{
  return self->_trailingText;
}

- (unint64_t)style
{
  return self->_style;
}

- (NSArray)gradientColors
{
  return self->_gradientColors;
}

- (NSArray)gradientLocations
{
  return self->_gradientLocations;
}

- (double)fraction
{
  return self->_fraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLocations, 0);
  objc_storeStrong((id *)&self->_gradientColors, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
}

@end
