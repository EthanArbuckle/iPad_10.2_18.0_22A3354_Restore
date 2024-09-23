@implementation CKOrganicPendingMomentShareBalloonView

- (void)prepareForReuse
{
  __int128 v3;
  _OWORD v4[3];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKOrganicPendingMomentShareBalloonView;
  -[CKAttachmentBalloonView prepareForReuse](&v5, sel_prepareForReuse);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[CKOrganicPendingMomentShareBalloonView setTransform:](self, "setTransform:", v4);
}

- (void)prepareForDisplay
{
  void *v3;
  double v4;
  double v5;
  __int128 v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKOrganicPendingMomentShareBalloonView;
  -[CKPendingMomentShareBalloonView prepareForDisplay](&v10, sel_prepareForDisplay);
  -[CKOrganicPendingMomentShareBalloonView layoutRecipe](self, "layoutRecipe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rotation");
  v5 = v4;

  memset(&v9, 0, sizeof(v9));
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v8.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformRotate(&v9, &v8, v5 * 3.14159265 / 180.0);
  v7 = v9;
  -[CKOrganicPendingMomentShareBalloonView setTransform:](self, "setTransform:", &v7);
}

- (CKOrganicImageLayoutRecipe)layoutRecipe
{
  return self->_layoutRecipe;
}

- (void)setLayoutRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_layoutRecipe, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutRecipe, 0);
}

@end
