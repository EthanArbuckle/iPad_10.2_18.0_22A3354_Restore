@implementation UIImage

void __42__UIImage_ChatKitAdditions__abImageNamed___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AddressBookUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)abImageNamed__sABBundle;
  abImageNamed__sABBundle = v0;

}

uint64_t __52__UIImage_ChatKitAdditions____ck_ASTCRepresentation__block_invoke()
{
  uint64_t v0;
  uint64_t result;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CBC830];
  v2[0] = *MEMORY[0x1E0CBCA18];
  v2[1] = v0;
  v3[0] = *MEMORY[0x1E0CBC840];
  v3[1] = &unk_1E28703D8;
  v2[2] = *MEMORY[0x1E0CBC848];
  v3[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  result = objc_claimAutoreleasedReturnValue();
  __ck_ASTCRepresentation_imageProperties = result;
  return result;
}

void __73__UIImage_ChatKitAdditions__ckImageWithTintColor_insets_traitCollection___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  v4 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  objc_msgSend(v2, "size");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "size");
  objc_msgSend(v2, "drawInRect:", v3, v4, v6, v7);
  v8 = *(void **)(a1 + 40);
  if (v8)
  {
    objc_msgSend(v8, "set");
    v9 = (void *)MEMORY[0x1E0CEA390];
    v11 = *(double *)(a1 + 48);
    v10 = *(double *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "size");
    v13 = v12 + *(double *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "size");
    objc_msgSend(v9, "bezierPathWithRect:", v10, v11, v13, v14 + *(double *)(a1 + 64));
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fillWithBlendMode:alpha:", 18, 1.0);

  }
}

void __38__UIImage_ChatKit__ck_imageWithEmoji___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v5, "renderInContext:", v4);
}

uint64_t __48__UIImage_CAHelper____ck_imageScaledToFillSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end
