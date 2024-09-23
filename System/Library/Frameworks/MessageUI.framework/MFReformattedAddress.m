@implementation MFReformattedAddress

- (MFReformattedAddress)initWithAddress:(id)a3
{
  id v4;
  MFReformattedAddress *v5;
  uint64_t v6;
  NSString *address;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFReformattedAddress;
  v5 = -[MFReformattedAddress init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    address = v5->_address;
    v5->_address = (NSString *)v6;

    -[MFReformattedAddress setMiddleTruncationRange:](v5, "setMiddleTruncationRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *address;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  address = self->_address;
  v7 = -[MFReformattedAddress middleTruncationRange](self, "middleTruncationRange");
  -[NSString mf_substringTruncatedInRange:](address, "mf_substringTruncatedInRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: %@ (%@)>"), v5, self, address, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)localPart
{
  void *v2;
  void *v3;

  -[NSString componentsSeparatedByString:](self->_address, "componentsSeparatedByString:", CFSTR("@"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)domainPart
{
  void *v2;
  void *v3;

  -[NSString componentsSeparatedByString:](self->_address, "componentsSeparatedByString:", CFSTR("@"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (double)widthWithFontSize:(double)a3 maximumWidth:(double)a4 options:(unint64_t)a5
{
  void *v5;
  double v6;
  double v7;

  -[MFReformattedAddress attributedStringWithFontSize:maximumWidth:options:](self, "attributedStringWithFontSize:maximumWidth:options:", a5, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;

  return v7;
}

- (id)attributedStringWithFontSize:(double)a3 maximumWidth:(double)a4 options:(unint64_t)a5
{
  char v5;
  NSString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  _BOOL4 v18;
  id v19;
  unint64_t v20;
  _QWORD *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  BOOL (*v35)(uint64_t, uint64_t);
  void *v36;
  id v37;
  id v38;
  double v39;
  _QWORD v40[4];
  id v41;
  double v42;
  uint64_t v43;
  _QWORD v44[2];

  v5 = a5;
  v44[1] = *MEMORY[0x1E0C80C00];
  v9 = self->_address;
  v10 = -[MFReformattedAddress middleTruncationRange](self, "middleTruncationRange");
  -[NSString mf_substringTruncatedInRange:](v9, "mf_substringTruncatedInRange:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0CB3778]);
  v43 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithString:attributes:", v12, v15);

  objc_msgSend(v16, "size");
  v18 = v17 > a4;
  if ((v5 & 1) == 0 && v17 > a4)
  {
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __74__MFReformattedAddress_attributedStringWithFontSize_maximumWidth_options___block_invoke;
    v40[3] = &unk_1E5A65630;
    v19 = v16;
    v41 = v19;
    v42 = a4;
    v20 = MFFirstIndexInRangePassingTest(0, 9uLL, v40);
    v21 = (_QWORD *)MEMORY[0x1E0DC1150];
    v18 = v20 == 0x7FFFFFFFFFFFFFFFLL;
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v19, "mf_removeAttribute:", *MEMORY[0x1E0DC1150]);
    }
    else
    {
      v22 = (double)v20 * -0.100000001;
      *(float *)&v22 = v22;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "mf_addAttribute:value:", *v21, v23);

    }
  }
  if ((v5 & 2) == 0 && v18)
  {
    objc_msgSend(v16, "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");

    v26 = objc_msgSend(v25, "length") - 1;
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __74__MFReformattedAddress_attributedStringWithFontSize_maximumWidth_options___block_invoke_2;
    v36 = &unk_1E5A65540;
    v27 = v25;
    v37 = v27;
    v28 = v16;
    v38 = v28;
    v39 = a4;
    v29 = MFLastIndexPassingTest(v26, &v33);
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v28, "mf_setString:", v27, v33, v34, v35, v36, v37);
    }
    else
    {
      objc_msgSend(v27, "mf_substringTruncatedToIndex:", v29, v33, v34, v35, v36, v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "mf_setString:", v30);

    }
  }
  if ((MFAddressHasSafeDomain(self->_address) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mf_addAttribute:value:", *MEMORY[0x1E0DC1140], v31);

  }
  return v16;
}

BOOL __74__MFReformattedAddress_attributedStringWithFontSize_maximumWidth_options___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  double v7;

  v3 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0DC1150];
  v5 = (double)a2 * -0.100000001;
  *(float *)&v5 = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mf_addAttribute:value:", v4, v6);

  objc_msgSend(*(id *)(a1 + 32), "size");
  return v7 <= *(double *)(a1 + 40);
}

BOOL __74__MFReformattedAddress_attributedStringWithFontSize_maximumWidth_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  _BOOL8 v5;

  objc_msgSend(*(id *)(a1 + 32), "mf_substringTruncatedToIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mf_setString:", v3);
  objc_msgSend(*(id *)(a1 + 40), "size");
  v5 = v4 <= *(double *)(a1 + 48);

  return v5;
}

- (_NSRange)middleTruncationRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_middleTruncationRange.length;
  location = self->_middleTruncationRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setMiddleTruncationRange:(_NSRange)a3
{
  self->_middleTruncationRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

@end
