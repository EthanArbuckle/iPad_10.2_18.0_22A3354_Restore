@implementation MFCaptionLabel

- (MFCaptionLabel)initWithFrame:(CGRect)a3
{
  MFCaptionLabel *v3;
  MFCaptionLabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFCaptionLabel;
  v3 = -[MFCaptionLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MFCaptionLabel setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFCaptionLabel setNumberOfLines:](v4, "setNumberOfLines:", 0);
  }
  return v4;
}

+ (EFLazyCache)attributedStringsCache
{
  if (attributedStringsCache_onceToken != -1)
    dispatch_once(&attributedStringsCache_onceToken, &__block_literal_global_5);
  return (EFLazyCache *)(id)attributedStringsCache_sAttributedStringsCache;
}

void __40__MFCaptionLabel_attributedStringsCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EED8]), "initWithCountLimit:", 10);
  v1 = (void *)attributedStringsCache_sAttributedStringsCache;
  attributedStringsCache_sAttributedStringsCache = v0;

}

- (void)setToRecipients:(id)a3
{
  NSArray *v5;

  v5 = (NSArray *)a3;
  if (self->_toRecipients != v5)
  {
    objc_storeStrong((id *)&self->_toRecipients, a3);
    -[MFCaptionLabel _setNeedsLabelUpdate](self, "_setNeedsLabelUpdate");
  }

}

- (void)setCcRecipients:(id)a3
{
  NSArray *v5;

  v5 = (NSArray *)a3;
  if (self->_ccRecipients != v5)
  {
    objc_storeStrong((id *)&self->_ccRecipients, a3);
    -[MFCaptionLabel _setNeedsLabelUpdate](self, "_setNeedsLabelUpdate");
  }

}

- (void)setBccRecipients:(id)a3
{
  NSArray *v5;

  v5 = (NSArray *)a3;
  if (self->_bccRecipients != v5)
  {
    objc_storeStrong((id *)&self->_bccRecipients, a3);
    -[MFCaptionLabel _setNeedsLabelUpdate](self, "_setNeedsLabelUpdate");
  }

}

- (void)setFromSenders:(id)a3
{
  NSArray *v5;

  v5 = (NSArray *)a3;
  if (self->_fromSenders != v5)
  {
    objc_storeStrong((id *)&self->_fromSenders, a3);
    -[MFCaptionLabel _setNeedsLabelUpdate](self, "_setNeedsLabelUpdate");
  }

}

- (void)setOtherSigners:(id)a3
{
  NSArray *v5;

  v5 = (NSArray *)a3;
  if (self->_otherSigners != v5)
  {
    objc_storeStrong((id *)&self->_otherSigners, a3);
    -[MFCaptionLabel _setNeedsLabelUpdate](self, "_setNeedsLabelUpdate");
  }

}

- (void)setReplyToSenders:(id)a3
{
  NSArray *v5;

  v5 = (NSArray *)a3;
  if (self->_replyToSenders != v5)
  {
    objc_storeStrong((id *)&self->_replyToSenders, a3);
    -[MFCaptionLabel _setNeedsLabelUpdate](self, "_setNeedsLabelUpdate");
  }

}

- (void)setHasDifferentReplyToAddress:(BOOL)a3
{
  if (self->_hasDifferentReplyToAddress != a3)
  {
    self->_hasDifferentReplyToAddress = a3;
    -[MFCaptionLabel _setNeedsLabelUpdate](self, "_setNeedsLabelUpdate");
  }
}

- (void)setPreventAutoUpdatingLabel:(BOOL)a3
{
  if (self->_preventAutoUpdatingLabel != a3)
  {
    self->_preventAutoUpdatingLabel = a3;
    if (!a3)
      -[MFCaptionLabel _setNeedsLabelUpdate](self, "_setNeedsLabelUpdate");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3);
  -[MFCaptionLabel bounds](self, "bounds");
  v9 = v8 - CGRectGetWidth(v11);
  if (v9 < 0.0)
    v9 = -v9;
  if (v9 > 0.00000011920929)
    -[MFCaptionLabel _setNeedsLabelUpdate](self, "_setNeedsLabelUpdate");
  v10.receiver = self;
  v10.super_class = (Class)MFCaptionLabel;
  -[MFCaptionLabel setBounds:](&v10, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3);
  -[MFCaptionLabel frame](self, "frame");
  v9 = v8 - CGRectGetWidth(v11);
  if (v9 < 0.0)
    v9 = -v9;
  if (v9 > 0.00000011920929)
    -[MFCaptionLabel _setNeedsLabelUpdate](self, "_setNeedsLabelUpdate");
  v10.receiver = self;
  v10.super_class = (Class)MFCaptionLabel;
  -[MFCaptionLabel setFrame:](&v10, sel_setFrame_, x, y, width, height);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFCaptionLabel;
  -[MFCaptionLabel layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_needsLabelUpdate)
    -[MFCaptionLabel updateLabelNow](self, "updateLabelNow");
}

- (void)_setNeedsLabelUpdate
{
  if (!-[MFCaptionLabel preventAutoUpdatingLabel](self, "preventAutoUpdatingLabel"))
  {
    self->_needsLabelUpdate = 1;
    -[MFCaptionLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_stringAtIndexForCombinedRecipientLists:(unint64_t)a3
{
  NSArray *v5;
  uint64_t v6;
  NSArray *v7;
  void *v8;
  uint64_t i;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = self->_toRecipients;
  v12 = self->_ccRecipients;
  v13 = self->_bccRecipients;
  v14 = self->_fromSenders;
  v15 = self->_otherSigners;
  v5 = v11;
  v6 = 0;
  while (a3 >= -[NSArray count](v5, "count", v11, v12, v13, v14, v15, v16))
  {
    a3 -= -[NSArray count](v5, "count");
    if ((unint64_t)++v6 <= 4)
    {
      v7 = (&v11)[v6];

      v5 = v7;
    }
  }
  if (a3 >= -[NSArray count](v5, "count"))
  {
    v8 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  for (i = 4; i != -1; --i)
  return v8;
}

- (id)_whitespaceTextAttachment
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  +[MFModernLabelledAtomList spaceBetweenColonAndFirstAtomNaturalEdge](MFModernLabelledAtomList, "spaceBetweenColonAndFirstAtomNaturalEdge");
  v6 = v5;
  v7 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v7, "setBounds:", v2, v3, v6, v4);
  return v7;
}

- (void)updateLabelNow
{
  void *v4;
  CGFloat Width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  CGRect v27;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFCaptionLabel.m"), 188, CFSTR("Current thread must be main"));

  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MFCaptionLabel bounds](self, "bounds");
  Width = CGRectGetWidth(v27);
  -[NSArray componentsJoinedByString:](self->_toRecipients, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_ccRecipients, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_bccRecipients, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_fromSenders, "componentsJoinedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_otherSigners, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%fTo:%@Cc:%@Bcc:%@From:%@Other:%@"), *(_QWORD *)&Width, v6, v7, v8, v9, v10);
  v24 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "attributedStringsCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __32__MFCaptionLabel_updateLabelNow__block_invoke;
  v26[3] = &unk_1E5A65AD0;
  v26[4] = self;
  objc_msgSend(v11, "objectForKey:generator:", v24, v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    objc_msgSend(v13, "appendAttributedString:", v12);
    -[MFCaptionLabel _whitespaceStringWithWidth:](self, "_whitespaceStringWithWidth:", 4.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendAttributedString:", v14);

    -[MFCaptionLabel _chevronAttributedString](self, "_chevronAttributedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendAttributedString:", v15);

    if (-[NSArray count](self->_replyToSenders, "count"))
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR("\n"));
      objc_msgSend(v13, "appendAttributedString:", v16);

      -[MFCaptionLabel _formattedReplyToString](self, "_formattedReplyToString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendAttributedString:", v17);

      if (-[MFCaptionLabel hasDifferentReplyToAddress](self, "hasDifferentReplyToAddress"))
      {
        v18 = (void *)MEMORY[0x1E0CB3498];
        -[MFCaptionLabel _whitespaceTextAttachment](self, "_whitespaceTextAttachment");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "attributedStringWithAttachment:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendAttributedString:", v20);

        -[MFCaptionLabel _questionMarkAttributedString](self, "_questionMarkAttributedString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendAttributedString:", v21);

      }
      -[MFCaptionLabel _whitespaceStringWithWidth:](self, "_whitespaceStringWithWidth:", 4.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendAttributedString:", v22);

      -[MFCaptionLabel _chevronAttributedString](self, "_chevronAttributedString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendAttributedString:", v23);

    }
    -[MFCaptionLabel setAttributedText:](self, "setAttributedText:", v13);

  }
  else
  {
    -[MFCaptionLabel setAttributedText:](self, "setAttributedText:", 0);
  }
  self->_needsLabelUpdate = 0;

}

uint64_t __32__MFCaptionLabel_updateLabelNow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_formattedAttributedString");
}

- (id)_attributedStringForImage:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v5, "setImage:", v4);
  objc_msgSend(v4, "size");
  v7 = v6;
  v9 = v8;
  -[MFCaptionLabel font](self, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "capHeight");

  UIRoundToViewScale();
  objc_msgSend(v5, "setBounds:", 0.0, v11, v7, v9);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_chevronImage
{
  void *v2;
  void *v3;

  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedImage:forKey:", &__block_literal_global_33, CFSTR("captionLabel.chevronImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __31__MFCaptionLabel__chevronImage__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", CFSTR("chevron.forward"), 19);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "mailSubtitleGrayColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithTintColor:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_chevronAttributedString
{
  void *v3;
  void *v4;

  -[MFCaptionLabel _chevronImage](self, "_chevronImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFCaptionLabel _attributedStringForImage:](self, "_attributedStringForImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_questionMarkImage
{
  void *v2;
  void *v3;

  +[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedImage:forKey:", &__block_literal_global_38, CFSTR("captionLabel.questionMark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __36__MFCaptionLabel__questionMarkImage__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:forView:", CFSTR("questionmark.circle.fill"), 19);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "mailSubtitleGrayColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageWithTintColor:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_questionMarkAttributedString
{
  void *v3;
  void *v4;

  -[MFCaptionLabel _questionMarkImage](self, "_questionMarkImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFCaptionLabel _attributedStringForImage:](self, "_attributedStringForImage:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_whitespaceStringWithWidth:(double)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, a3, 0.0);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_maxWidthForRecipientList
{
  void *v3;
  double Width;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  CGRect v13;

  -[MFCaptionLabel _chevronImage](self, "_chevronImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFCaptionLabel bounds](self, "bounds");
  Width = CGRectGetWidth(v13);
  objc_msgSend(v3, "size");
  v6 = Width - v5 + -4.0;
  if (-[MFCaptionLabel hasDifferentReplyToAddress](self, "hasDifferentReplyToAddress"))
  {
    -[MFCaptionLabel _questionMarkImage](self, "_questionMarkImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v9 = v8;
    -[MFCaptionLabel _whitespaceTextAttachment](self, "_whitespaceTextAttachment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v6 = v6 - v9 - v11;

  }
  return v6;
}

- (id)lengthValidationBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__MFCaptionLabel_lengthValidationBlock__block_invoke;
  aBlock[3] = &unk_1E5A65B18;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

BOOL __39__MFCaptionLabel_lengthValidationBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(v5, "stringByAppendingString:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;
  v16 = *MEMORY[0x1E0DC1138];
  objc_msgSend(*(id *)(a1 + 32), "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeWithAttributes:", v10);
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "_maxWidthForRecipientList");
  v14 = v12 <= v13;

  return v14;
}

- (id)_concatenateStringForRecipientList:(id)a3 recipientCount:(unint64_t)a4 prefixGenerationBlock:(id)a5 listSuffix:(id)a6
{
  id v9;
  void (**v10)(id, _QWORD);
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v30;

  v9 = a3;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = a6;
  if (objc_msgSend(v9, "length"))
  {
    if (v11)
    {
      objc_msgSend(v9, "stringByAppendingString:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v12;
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v9);
    if (a4)
    {
      v30 = v11;
      v14 = 0;
      v15 = *MEMORY[0x1E0DC1140];
      do
      {
        v10[2](v10, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
        {
          objc_msgSend(v13, "string");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "rangeOfString:", v16);
          v20 = v19;

          if (v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v14)
            {
              objc_msgSend(MEMORY[0x1E0DC3658], "mailModernLabelledAtomDefaultTextColor");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addAttribute:value:range:", v15, v21, v18, v20);
            }
            else
            {
              objc_msgSend(v13, "deleteCharactersInRange:", v18, v20);
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v22);
              v23 = objc_claimAutoreleasedReturnValue();

              v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v23);
              v24 = (void *)MEMORY[0x1E0CB3498];
              -[MFCaptionLabel _whitespaceTextAttachment](self, "_whitespaceTextAttachment");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "attributedStringWithAttachment:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "insertAttributedString:atIndex:", v26, objc_msgSend(v21, "length"));

              v27 = objc_msgSend(v21, "length");
              objc_msgSend(MEMORY[0x1E0DC3658], "mailModernLabelledAtomDefaultTextColor");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addAttribute:value:range:", v15, v28, 0, v27);

              objc_msgSend(v13, "insertAttributedString:atIndex:", v21, 0);
              v16 = (void *)v23;
            }

          }
        }

        ++v14;
      }
      while (a4 != v14);
      v11 = v30;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_formattedReplyToString
{
  NSUInteger v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v11;
  id v12;
  _QWORD aBlock[5];
  BOOL v14;

  v3 = -[NSArray count](self->_replyToSenders, "count");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__MFCaptionLabel__formattedReplyToString__block_invoke_2;
  aBlock[3] = &unk_1E5A65B60;
  aBlock[4] = self;
  v14 = v3 > 1;
  v4 = _Block_copy(aBlock);
  +[MFAddressConcatenator defaultRecipientListConcatenator](MFAddressConcatenator, "defaultRecipientListConcatenator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  -[MFCaptionLabel lengthValidationBlock](self, "lengthValidationBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getCommaSeparatedAddressList:andListSuffix:withAddressCount:prefixForAddressAtIndex:stringForAddressAtIndex:lengthValidationBlock:", &v12, &v11, v3, &__block_literal_global_45, v4, v6);
  v7 = v12;
  v8 = v11;

  -[MFCaptionLabel _concatenateStringForRecipientList:recipientCount:prefixGenerationBlock:listSuffix:](self, "_concatenateStringForRecipientList:recipientCount:prefixGenerationBlock:listSuffix:", v7, v3, &__block_literal_global_45, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __41__MFCaptionLabel__formattedReplyToString__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (a2 || (_EFLocalizedString(), (v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v2 = 0;
  }
  else
  {
    v4 = (void *)v3;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@ "), &stru_1E5A6A588, v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id __41__MFCaptionLabel__formattedReplyToString__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 816));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "replyToSenders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "captionLabel:displayNameForEmailAddress:abbreviated:", v5, v8, *(unsigned __int8 *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "replyToSenders");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_formattedAttributedString
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  _QWORD v20[5];
  BOOL v21;
  _QWORD aBlock[5];

  v3 = -[NSArray count](self->_toRecipients, "count");
  v4 = -[NSArray count](self->_ccRecipients, "count") + v3;
  v5 = -[NSArray count](self->_bccRecipients, "count");
  v6 = v4 + v5 + -[NSArray count](self->_fromSenders, "count");
  v7 = -[NSArray count](self->_otherSigners, "count");
  v8 = MEMORY[0x1E0C809B0];
  v9 = v6 + v7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__MFCaptionLabel__formattedAttributedString__block_invoke;
  aBlock[3] = &unk_1E5A65B88;
  aBlock[4] = self;
  v10 = _Block_copy(aBlock);
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __44__MFCaptionLabel__formattedAttributedString__block_invoke_2;
  v20[3] = &unk_1E5A65B60;
  v20[4] = self;
  v21 = v9 > 1;
  v11 = _Block_copy(v20);
  +[MFAddressConcatenator defaultRecipientListConcatenator](MFAddressConcatenator, "defaultRecipientListConcatenator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = 0;
  -[MFCaptionLabel lengthValidationBlock](self, "lengthValidationBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getCommaSeparatedAddressList:andListSuffix:withAddressCount:prefixForAddressAtIndex:stringForAddressAtIndex:lengthValidationBlock:", &v19, &v18, v9, v10, v11, v13);
  v14 = v19;
  v15 = v18;

  -[MFCaptionLabel _concatenateStringForRecipientList:recipientCount:prefixGenerationBlock:listSuffix:](self, "_concatenateStringForRecipientList:recipientCount:prefixGenerationBlock:listSuffix:", v14, v9, v10, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __44__MFCaptionLabel__formattedAttributedString__block_invoke(uint64_t a1, char *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;

  if (a2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TO"), &stru_1E5A6A588, CFSTR("Main"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if ((char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 824), "count") == a2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CC"), &stru_1E5A6A588, CFSTR("Main"));
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 824), "count");
  if ((char *)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "count") + v8) == a2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BCC"), &stru_1E5A6A588, CFSTR("Main"));
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 824), "count");
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "count");
  if ((char *)(v12 + v11 + objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "count")) == a2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FROM"), &stru_1E5A6A588, CFSTR("Main"));
    v14 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v14;
  }
  v15 = (char *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 824), "count");
  v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "count");
  v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "count");
  if (&v15[v16 + v17 + objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 856), "count")] == a2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("OTHER_SIGNERS"), &stru_1E5A6A588, CFSTR("Main"));
    v18 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v18;
  }
  if (v4)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("RECIPIENT_TYPES_SEPARATOR"), &stru_1E5A6A588, CFSTR("Main"));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = &stru_1E5A6A588;
    }
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@%@ "), v20, v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
    {

    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

id __44__MFCaptionLabel__formattedAttributedString__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_stringAtIndexForCombinedRecipientLists:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 816));
  objc_msgSend(WeakRetained, "captionLabel:displayNameForEmailAddress:abbreviated:", *(_QWORD *)(a1 + 32), v3, *(unsigned __int8 *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v3;
  v7 = v5;

  return v7;
}

- (MFCaptionLabelDataSource)dataSource
{
  return (MFCaptionLabelDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (NSArray)fromSenders
{
  return self->_fromSenders;
}

- (NSArray)otherSigners
{
  return self->_otherSigners;
}

- (NSArray)replyToSenders
{
  return self->_replyToSenders;
}

- (BOOL)preventAutoUpdatingLabel
{
  return self->_preventAutoUpdatingLabel;
}

- (BOOL)hasDifferentReplyToAddress
{
  return self->_hasDifferentReplyToAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyToSenders, 0);
  objc_storeStrong((id *)&self->_otherSigners, 0);
  objc_storeStrong((id *)&self->_fromSenders, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
