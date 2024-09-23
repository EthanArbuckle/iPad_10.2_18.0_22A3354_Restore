@implementation CHSWidgetTintParameters

- (CHSWidgetTintParameters)init
{
  CHSWidgetTintParameters *v2;
  CHSWidgetTintParameters *v3;
  BSColor *primaryTintColor;
  BSColor *secondaryTintColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHSWidgetTintParameters;
  v2 = -[CHSWidgetTintParameters init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    primaryTintColor = v2->_primaryTintColor;
    v2->_primaryTintColor = 0;

    secondaryTintColor = v3->_secondaryTintColor;
    v3->_secondaryTintColor = 0;

    v3->_filterStyle = 0;
    v3->_fraction = 1.0;
    v3->_accentedAlternateBackground = 0;
    v3->_accentedDesaturatedMode = 0;
  }
  return v3;
}

- (id)_initWithTintParameters:(id)a3
{
  id *v4;
  CHSWidgetTintParameters *v5;
  CHSWidgetTintParameters *v6;

  v4 = (id *)a3;
  v5 = -[CHSWidgetTintParameters init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_primaryTintColor, v4[1]);
    objc_storeStrong((id *)&v6->_secondaryTintColor, v4[2]);
    v6->_filterStyle = (int64_t)v4[3];
    v6->_fallbackFilterStyle = (int64_t)v4[4];
    *(_QWORD *)&v6->_fraction = v4[5];
    v6->_accentedAlternateBackground = *((_BYTE *)v4 + 48);
    v6->_accentedDesaturatedMode = (int64_t)v4[7];
  }

  return v6;
}

- (CHSWidgetTintParameters)initWithPrimaryTintColor:(id)a3 secondaryTintColor:(id)a4 filterStyle:(int64_t)a5 fallbackFilterStyle:(int64_t)a6 fraction:(double)a7
{
  id v13;
  id v14;
  CHSWidgetTintParameters *v15;
  CHSWidgetTintParameters *v16;
  objc_super v18;

  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CHSWidgetTintParameters;
  v15 = -[CHSWidgetTintParameters init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_filterStyle = a5;
    v15->_fallbackFilterStyle = a6;
    objc_storeStrong((id *)&v15->_primaryTintColor, a3);
    objc_storeStrong((id *)&v16->_secondaryTintColor, a4);
    v16->_fraction = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  BSColor *primaryTintColor;
  uint64_t v11;
  id v12;
  id v13;
  BSColor *secondaryTintColor;
  id v15;
  id v16;
  int64_t filterStyle;
  id v18;
  id v19;
  int64_t fallbackFilterStyle;
  id v21;
  id v22;
  double fraction;
  id v24;
  id v25;
  _BOOL8 accentedAlternateBackground;
  id v27;
  id v28;
  int64_t accentedDesaturatedMode;
  id v30;
  id v31;
  _QWORD v33[4];
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
  _QWORD v45[4];
  id v46;

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

  primaryTintColor = self->_primaryTintColor;
  v11 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke;
  v45[3] = &unk_1E2A5A530;
  v12 = v9;
  v46 = v12;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", primaryTintColor, v45);
  secondaryTintColor = self->_secondaryTintColor;
  v43[0] = v11;
  v43[1] = 3221225472;
  v43[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_2;
  v43[3] = &unk_1E2A5A530;
  v15 = v12;
  v44 = v15;
  v16 = (id)objc_msgSend(v5, "appendObject:counterpart:", secondaryTintColor, v43);
  filterStyle = self->_filterStyle;
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_3;
  v41[3] = &unk_1E2A5A558;
  v18 = v15;
  v42 = v18;
  v19 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", filterStyle, v41);
  fallbackFilterStyle = self->_fallbackFilterStyle;
  v39[0] = v11;
  v39[1] = 3221225472;
  v39[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_4;
  v39[3] = &unk_1E2A5A558;
  v21 = v18;
  v40 = v21;
  v22 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", fallbackFilterStyle, v39);
  fraction = self->_fraction;
  v37[0] = v11;
  v37[1] = 3221225472;
  v37[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_5;
  v37[3] = &unk_1E2A5A4E0;
  v24 = v21;
  v38 = v24;
  v25 = (id)objc_msgSend(v5, "appendDouble:counterpart:", v37, fraction);
  accentedAlternateBackground = self->_accentedAlternateBackground;
  v35[0] = v11;
  v35[1] = 3221225472;
  v35[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_6;
  v35[3] = &unk_1E2A5A508;
  v27 = v24;
  v36 = v27;
  v28 = (id)objc_msgSend(v5, "appendBool:counterpart:", accentedAlternateBackground, v35);
  accentedDesaturatedMode = self->_accentedDesaturatedMode;
  v33[0] = v11;
  v33[1] = 3221225472;
  v33[2] = __35__CHSWidgetTintParameters_isEqual___block_invoke_7;
  v33[3] = &unk_1E2A5A558;
  v30 = v27;
  v34 = v30;
  v31 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", accentedDesaturatedMode, v33);
  LOBYTE(v27) = objc_msgSend(v5, "isEqual");

  return (char)v27;
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "primaryTintColor");
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "secondaryTintColor");
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "filterStyle");
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fallbackFilterStyle");
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fraction");
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accentedAlternateBackground");
}

uint64_t __35__CHSWidgetTintParameters_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accentedDesaturatedMode");
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
  id v10;
  unint64_t v11;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_primaryTintColor);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_secondaryTintColor);
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_filterStyle);
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_fallbackFilterStyle);
  v8 = (id)objc_msgSend(v3, "appendDouble:", self->_fraction);
  v9 = (id)objc_msgSend(v3, "appendBool:", self->_accentedAlternateBackground);
  v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_accentedDesaturatedMode);
  v11 = objc_msgSend(v3, "hash");

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetTintParameters _initWithTintParameters:]([CHSWidgetTintParameters alloc], "_initWithTintParameters:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSWidgetTintParameters _initWithTintParameters:](+[CHSMutableWidgetTintParameters allocWithZone:](CHSMutableWidgetTintParameters, "allocWithZone:", a3), "_initWithTintParameters:", self);
}

- (unint64_t)effectiveRenderingMode
{
  if (self->_filterStyle >= 2uLL)
    return 1;
  else
    return 2;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_primaryTintColor, CFSTR("primaryTintColor"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_secondaryTintColor, CFSTR("secondaryTintColor"));
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_filterStyle, CFSTR("filterStyle"));
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_fallbackFilterStyle, CFSTR("fallbackFilterStyle"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("fraction"), self->_fraction);
  objc_msgSend(v4, "encodeBool:forKey:", self->_accentedAlternateBackground, CFSTR("accentedAlternateBackground"));
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_accentedDesaturatedMode, CFSTR("accentedDesaturatedMode"));

}

- (CHSWidgetTintParameters)initWithBSXPCCoder:(id)a3
{
  id v4;
  CHSWidgetTintParameters *v5;
  uint64_t v6;
  BSColor *primaryTintColor;
  uint64_t v8;
  BSColor *secondaryTintColor;
  double v10;

  v4 = a3;
  v5 = -[CHSWidgetTintParameters init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryTintColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    primaryTintColor = v5->_primaryTintColor;
    v5->_primaryTintColor = (BSColor *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryTintColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    secondaryTintColor = v5->_secondaryTintColor;
    v5->_secondaryTintColor = (BSColor *)v8;

    v5->_filterStyle = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("filterStyle"));
    v5->_fallbackFilterStyle = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("fallbackFilterStyle"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fraction"));
    v5->_fraction = v10;
    v5->_accentedAlternateBackground = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accentedAlternateBackground"));
    v5->_accentedDesaturatedMode = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("accentedDesaturatedMode"));
  }

  return v5;
}

- (BSColor)primaryTintColor
{
  return self->_primaryTintColor;
}

- (BSColor)secondaryTintColor
{
  return self->_secondaryTintColor;
}

- (int64_t)filterStyle
{
  return self->_filterStyle;
}

- (int64_t)fallbackFilterStyle
{
  return self->_fallbackFilterStyle;
}

- (double)fraction
{
  return self->_fraction;
}

- (BOOL)accentedAlternateBackground
{
  return self->_accentedAlternateBackground;
}

- (int64_t)accentedDesaturatedMode
{
  return self->_accentedDesaturatedMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTintColor, 0);
  objc_storeStrong((id *)&self->_primaryTintColor, 0);
}

@end
