@implementation CKHandwritingBalloonView

- (CKBalloonDescriptor_t)balloonDescriptor
{
  CKBalloonDescriptor_t *result;
  objc_super v5;

  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v5.receiver = self;
  v5.super_class = (Class)CKHandwritingBalloonView;
  result = (CKBalloonDescriptor_t *)-[CKBalloonDescriptor_t balloonDescriptor](&v5, sel_balloonDescriptor);
  retstr->var1 = 0;
  return result;
}

- (CGRect)maskFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  char v21;
  CGRect result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKHandwritingBalloonView balloonDescriptor](self, "balloonDescriptor");
  objc_msgSend(v3, "extensionBalloonContentInsetsForOrientation:", 2 * (v21 != 0));
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v20.receiver = self;
  v20.super_class = (Class)CKHandwritingBalloonView;
  -[CKTranscriptPluginBalloonView maskFrame](&v20, sel_maskFrame);
  v13 = v7 + v12;
  v15 = v5 + v14;
  v17 = v16 - (v7 + v11);
  v19 = v18 - (v5 + v9);
  result.size.height = v19;
  result.size.width = v17;
  result.origin.y = v15;
  result.origin.x = v13;
  return result;
}

- (BOOL)shouldMaskWhenOpaque
{
  return 0;
}

@end
