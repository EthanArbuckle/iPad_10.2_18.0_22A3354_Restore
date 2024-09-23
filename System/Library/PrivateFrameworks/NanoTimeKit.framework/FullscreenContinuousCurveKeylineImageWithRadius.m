@implementation FullscreenContinuousCurveKeylineImageWithRadius

id ___FullscreenContinuousCurveKeylineImageWithRadius_block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  NTKFaceFullscreenKeylineFrame();
  v3 = v2;
  v5 = v4;
  v6 = *(double *)(a1 + 32);
  v7 = v6 * NTKFaceLibraryPageWidthForZoomLevel(1) / v2;
  objc_msgSend(MEMORY[0x1E0DC3830], "defaultFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v8, v3, v5);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___FullscreenContinuousCurveKeylineImageWithRadius_block_invoke_2;
  v12[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v12[4] = v7;
  objc_msgSend(v9, "imageWithActions:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void ___FullscreenContinuousCurveKeylineImageWithRadius_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;

  objc_msgSend(a2, "format");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v9;
  v14.size.height = v11;
  v15 = CGRectInset(v14, 0.75, 0.75);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height, *(double *)(a1 + 32));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "set");

  objc_msgSend(v13, "setLineWidth:", 1.5);
  objc_msgSend(v13, "stroke");

}

@end
