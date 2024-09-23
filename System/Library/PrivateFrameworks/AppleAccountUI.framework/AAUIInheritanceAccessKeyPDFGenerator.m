@implementation AAUIInheritanceAccessKeyPDFGenerator

- (AAUIInheritanceAccessKeyPDFGenerator)initWithAppleAccount:(id)a3 localContactInfo:(id)a4
{
  id v6;
  id v7;
  AAUIInheritanceAccessKeyPDFGenerator *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *v12;
  uint64_t v13;
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  NSString *ownerDisplayName;
  uint64_t v18;
  NSString *ownerFirstName;
  uint64_t v20;
  NSString *ownerEmailAddress;
  NSString *contactDisplayName;
  id v23;
  void *v24;
  uint64_t v25;
  AAInheritanceContactController *contactController;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AAUIInheritanceAccessKeyPDFGenerator;
  v8 = -[AAUIInheritanceAccessKeyPDFGenerator init](&v28, sel_init);
  if (v8)
  {
    if ((objc_msgSend(v7, "contactType") & 4) != 0)
    {
      objc_msgSend(v6, "aa_fullName");
      v16 = objc_claimAutoreleasedReturnValue();
      ownerDisplayName = v8->_ownerDisplayName;
      v8->_ownerDisplayName = (NSString *)v16;

      objc_msgSend(v6, "aa_firstName");
      v18 = objc_claimAutoreleasedReturnValue();
      ownerFirstName = v8->_ownerFirstName;
      v8->_ownerFirstName = (NSString *)v18;

      objc_msgSend(v6, "aa_primaryEmail");
      v20 = objc_claimAutoreleasedReturnValue();
      ownerEmailAddress = v8->_ownerEmailAddress;
      v8->_ownerEmailAddress = (NSString *)v20;

      objc_msgSend(v7, "displayName");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(v7, "contactType") & 8) == 0)
      {
LABEL_7:
        v23 = objc_alloc(MEMORY[0x1E0CFAC80]);
        objc_msgSend(v7, "inheritanceContactInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "initWithContactInfo:contactType:", v24, objc_msgSend(v7, "contactType"));
        contactController = v8->_contactController;
        v8->_contactController = (AAInheritanceContactController *)v25;

        goto LABEL_8;
      }
      objc_msgSend(v7, "displayName");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v8->_ownerDisplayName;
      v8->_ownerDisplayName = (NSString *)v9;

      objc_msgSend(v7, "firstName");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v8->_ownerFirstName;
      v8->_ownerFirstName = (NSString *)v11;

      objc_msgSend(v7, "handle");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v8->_ownerEmailAddress;
      v8->_ownerEmailAddress = (NSString *)v13;

      objc_msgSend(v6, "aa_fullName");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    contactDisplayName = v8->_contactDisplayName;
    v8->_contactDisplayName = (NSString *)v15;

    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (id)createPDFDocumentData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[7];
  __int128 v9;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3840]);
  -[AAUIInheritanceAccessKeyPDFGenerator _pdfMetaData](self, "_pdfMetaData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDocumentInfo:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3838]), "initWithBounds:format:", v3, 0.0, 0.0, 612.0, 792.0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__AAUIInheritanceAccessKeyPDFGenerator_createPDFDocumentData__block_invoke;
  v8[3] = &unk_1EA2DD828;
  v8[5] = 0;
  v8[6] = 0;
  v8[4] = self;
  v9 = xmmword_1DB639290;
  objc_msgSend(v5, "PDFDataWithActions:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __61__AAUIInheritanceAccessKeyPDFGenerator_createPDFDocumentData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  v3 = a2;
  objc_msgSend(v3, "beginPage");
  objc_msgSend(*(id *)(a1 + 32), "_renderLogoImageWithPageRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_renderTitleWithPageRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "_renderAccountDetailsWithPageRect:yPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v4 + 15.0);
  objc_msgSend(*(id *)(a1 + 32), "_renderMessageWithPageRect:yPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v5 + 15.0);
  v7 = v6;
  v8 = *(void **)(a1 + 32);
  v9 = v6 + 15.0;
  v10 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v8, "_renderRectBoxWithPageRect:yPosition:drawContext:", v10, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v9);
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "_renderQRCodeImageWithPageRect:yPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v7 + 30.0);
  objc_msgSend(*(id *)(a1 + 32), "_renderAccessKeyWithPageRect:yPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v13 + 15.0);
  return objc_msgSend(*(id *)(a1 + 32), "_renderFooterWithPageRect:yPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v12 + 15.0);
}

- (id)_pdfMetaData
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0C9DB88];
  objc_msgSend(MEMORY[0x1E0CFAD50], "printAccessKeyDocumentMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_renderLogoImageWithPageRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  id v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("applelogo"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v7 = CGRectGetWidth(v19) * 0.05;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v8 = CGRectGetHeight(v20) * 0.05;
  objc_msgSend(v18, "size");
  v10 = v7 / v9;
  objc_msgSend(v18, "size");
  v12 = fmin(v10, v8 / v11);
  objc_msgSend(v18, "size");
  v14 = v13 * v12;
  objc_msgSend(v18, "size");
  v16 = v15 * v12;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v17 = CGRectGetWidth(v21) * 0.08;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  objc_msgSend(v18, "drawInRect:", v17, CGRectGetHeight(v22) * 0.035, v14, v16);

}

- (double)_renderTitleWithPageRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  _QWORD v20[2];
  _QWORD v21[3];
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 26.0, *MEMORY[0x1E0DC1448]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v8, "setAlignment:", 1);
  objc_msgSend(v8, "setLineBreakMode:", 0);
  v9 = *MEMORY[0x1E0DC1178];
  v20[0] = *MEMORY[0x1E0DC1138];
  v20[1] = v9;
  v21[0] = v7;
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CFAD50], "printAccessKeyDocumentTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v12, v10);

  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v14 = CGRectGetWidth(v22) * 0.08;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v15 = CGRectGetHeight(v23) * 0.12;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v16 = CGRectGetWidth(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v17 = v16 + CGRectGetWidth(v25) * -0.16;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v18 = CGRectGetHeight(v26) * 0.08;
  objc_msgSend(v13, "drawInRect:", v14, v15, v17, v18);

  return v15 + v18;
}

- (double)_renderAccountDetailsWithPageRect:(CGRect)a3 yPosition:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat v20;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(MEMORY[0x1E0CFAD50], "printAccessKeyOwnerNameField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIInheritanceAccessKeyPDFGenerator _attributedStringWithField:value:](self, "_attributedStringWithField:value:", v11, self->_ownerDisplayName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendAttributedString:", v12);

  objc_msgSend(MEMORY[0x1E0CFAD50], "printAccessKeyOwnerAppleIDField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIInheritanceAccessKeyPDFGenerator _attributedStringWithField:value:](self, "_attributedStringWithField:value:", v13, self->_ownerEmailAddress);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendAttributedString:", v14);

  objc_msgSend(MEMORY[0x1E0CFAD50], "printAccessKeyBeneficiaryNameField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIInheritanceAccessKeyPDFGenerator _attributedStringWithField:value:](self, "_attributedStringWithField:value:", v15, self->_contactDisplayName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendAttributedString:", v16);

  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v17 = CGRectGetWidth(v22) * 0.08;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v18 = CGRectGetWidth(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v19 = v18 + CGRectGetWidth(v24) * -0.16;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v20 = CGRectGetHeight(v25) * 0.07;
  objc_msgSend(v10, "drawInRect:", v17, a4, v19, v20);

  return v20 + a4;
}

- (id)_attributedStringWithField:(id)a3 value:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB3778];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1448]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  v23 = *MEMORY[0x1E0DC1138];
  v12 = v23;
  v24[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithString:attributes:", v10, v13);

  objc_msgSend(v8, "appendAttributedString:", v14);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1440]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  v21 = v12;
  v22 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithString:attributes:", v16, v18);

  objc_msgSend(v8, "appendAttributedString:", v19);
  return v8;
}

- (double)_renderMessageWithPageRect:(CGRect)a3 yPosition:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  _QWORD v22[2];
  _QWORD v23[3];
  CGRect v24;
  CGRect v25;
  CGRect v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1440]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v11, "setAlignment:", 4);
  objc_msgSend(v11, "setLineBreakMode:", 0);
  objc_msgSend(v11, "setParagraphSpacing:", 0.4);
  v12 = *MEMORY[0x1E0DC1178];
  v22[0] = *MEMORY[0x1E0DC1138];
  v22[1] = v12;
  v23[0] = v10;
  v23[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CFAD50], "printAccessKeyDocumentMessage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v15, self->_ownerFirstName, self->_ownerFirstName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v13);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v18 = CGRectGetWidth(v24) * 0.08;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v19 = CGRectGetWidth(v25) + v18 * -2.0;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v20 = CGRectGetHeight(v26) * 0.26;
  objc_msgSend(v17, "drawInRect:", v18, a4, v19, v20);

  return v20 + a4;
}

- (double)_renderRectBoxWithPageRect:(CGRect)a3 yPosition:(double)a4 drawContext:(CGContext *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v11;
  const CGFloat *Components;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGContextSaveGState(a5);
  CGContextSetLineWidth(a5, 1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v11, "cgColor"));
  CGContextSetStrokeColor(a5, Components);

  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v13 = CGRectGetWidth(v18) * 0.08;
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v14 = CGRectGetWidth(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v15 = v14 + CGRectGetWidth(v20) * -0.16;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v16 = CGRectGetHeight(v21) * 0.28;
  v22.origin.x = v13;
  v22.origin.y = a4;
  v22.size.width = v15;
  v22.size.height = v16;
  CGContextAddRect(a5, v22);
  CGContextStrokePath(a5);
  CGContextRestoreGState(a5);
  return v16 + a4;
}

- (double)_renderQRCodeImageWithPageRect:(CGRect)a3 yPosition:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void *)MEMORY[0x1E0DC3870];
  -[AAInheritanceContactController accessKeyQRCodeImageDataWithSize:](self->_contactController, "accessKeyQRCodeImageDataWithSize:", CGRectGetWidth(a3) * 0.5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithData:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v12 = CGRectGetWidth(v23) * 0.15;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v13 = CGRectGetHeight(v24) * 0.1;
  objc_msgSend(v11, "size");
  v15 = v12 / v14;
  objc_msgSend(v11, "size");
  v17 = fmin(v15, v13 / v16);
  objc_msgSend(v11, "size");
  v19 = v18 * v17;
  objc_msgSend(v11, "size");
  v21 = v20 * v17;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  objc_msgSend(v11, "drawInRect:", (CGRectGetWidth(v25) - v19) * 0.5, a4, v19, v21);

  return v21 + a4;
}

- (void)_renderAccessKeyWithPageRect:(CGRect)a3 yPosition:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CGFloat v19;
  CGFloat v20;
  _QWORD v21[2];
  _QWORD v22[3];
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 18.0, *MEMORY[0x1E0DC1448]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v11, "setAlignment:", 1);
  objc_msgSend(v11, "setLineBreakMode:", 0);
  v12 = *MEMORY[0x1E0DC1178];
  v21[0] = *MEMORY[0x1E0DC1138];
  v21[1] = v12;
  v22[0] = v10;
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CFAD50], "printAccessKeyPrefix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAInheritanceContactController accessKeyString](self->_contactController, "accessKeyString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@: %@"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v17, v13);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v19 = CGRectGetWidth(v23) * 0.14;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v20 = CGRectGetWidth(v24) + v19 * -2.0;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  objc_msgSend(v18, "drawInRect:", v19, a4, v20, CGRectGetHeight(v25) * 0.12);

}

- (void)_renderFooterWithPageRect:(CGRect)a3 yPosition:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  CGFloat v16;
  double v17;
  double v18;
  _QWORD v19[2];
  _QWORD v20[3];
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1448]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v10, "setAlignment:", 1);
  objc_msgSend(v10, "setLineBreakMode:", 0);
  v11 = *MEMORY[0x1E0DC1178];
  v19[0] = *MEMORY[0x1E0DC1138];
  v19[1] = v11;
  v20[0] = v9;
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CFAD50], "printAccessKeyFooter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v12);

  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v16 = CGRectGetWidth(v21) * 0.08;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v17 = CGRectGetWidth(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v18 = v17 + CGRectGetWidth(v23) * -0.16;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  objc_msgSend(v15, "drawInRect:", v16, a4, v18, CGRectGetHeight(v24) * 0.04);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactController, 0);
  objc_storeStrong((id *)&self->_contactDisplayName, 0);
  objc_storeStrong((id *)&self->_ownerEmailAddress, 0);
  objc_storeStrong((id *)&self->_ownerFirstName, 0);
  objc_storeStrong((id *)&self->_ownerDisplayName, 0);
}

@end
