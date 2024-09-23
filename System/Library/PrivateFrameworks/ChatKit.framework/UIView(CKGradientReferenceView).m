@implementation UIView(CKGradientReferenceView)

- (void)setGradientViewsNeedLayout
{
  void *v2;
  _QWORD v3[5];

  +[CKGradientView gradientViews](CKGradientView, "gradientViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__UIView_CKGradientReferenceView__setGradientViewsNeedLayout__block_invoke;
  v3[3] = &unk_1E2757500;
  v3[4] = a1;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

- (void)layoutGradientViewsIfNeeded
{
  void *v2;
  _QWORD v3[5];

  +[CKGradientView gradientViews](CKGradientView, "gradientViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__UIView_CKGradientReferenceView__layoutGradientViewsIfNeeded__block_invoke;
  v3[3] = &unk_1E2757500;
  v3[4] = a1;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

@end
