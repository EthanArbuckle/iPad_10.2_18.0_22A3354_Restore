@implementation BWSemanticStyleSetFencedAnimationInfo

+ (id)fencedAnimationInfoWithSemanticStyleSet:(id)a3 fencePortSendRight:(id)a4
{
  BWSemanticStyleSetFencedAnimationInfo *v6;
  _QWORD *v7;
  objc_super v9;

  v6 = [BWSemanticStyleSetFencedAnimationInfo alloc];
  if (v6)
  {
    v9.receiver = v6;
    v9.super_class = (Class)BWSemanticStyleSetFencedAnimationInfo;
    v7 = objc_msgSendSuper2(&v9, sel_initWithFencePortSendRight_, a4);
    if (v7)
      v7[3] = objc_msgSend(a3, "copy");
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSemanticStyleSetFencedAnimationInfo;
  -[BWFencedAnimationInfo dealloc](&v3, sel_dealloc);
}

- (id)description
{
  FigCaptureSemanticStyleSet *semanticStyleSet;
  objc_super v4;

  semanticStyleSet = self->_semanticStyleSet;
  v4.receiver = self;
  v4.super_class = (Class)BWSemanticStyleSetFencedAnimationInfo;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BWSemanticStyleSetFencedAnimationInfo: { %@, %@ }"), semanticStyleSet, -[BWFencedAnimationInfo description](&v4, sel_description));
}

- (FigCaptureSemanticStyleSet)semanticStyleSet
{
  return self->_semanticStyleSet;
}

@end
