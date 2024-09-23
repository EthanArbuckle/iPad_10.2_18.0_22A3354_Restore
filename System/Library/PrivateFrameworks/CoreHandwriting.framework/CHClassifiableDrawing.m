@implementation CHClassifiableDrawing

- (CHClassifiableDrawing)initWithDrawing:(id)a3 characterSet:(id)a4 expandCodePoints:(BOOL)a5 normalizationContext:(CGRect)a6 maxCandidateCount:(unint64_t)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  CHClassifiableDrawing *v18;
  CHClassifiableDrawing *v19;
  objc_super v21;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v16 = a3;
  v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)CHClassifiableDrawing;
  v18 = -[CHClassifiableDrawing init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_drawing, a3);
    objc_storeStrong((id *)&v19->_characterSet, a4);
    v19->_expandCodePoints = a5;
    v19->_normalizationContext.origin.x = x;
    v19->_normalizationContext.origin.y = y;
    v19->_normalizationContext.size.width = width;
    v19->_normalizationContext.size.height = height;
    v19->_maxCandidateCount = a7;
  }

  return v19;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (NSCharacterSet)characterSet
{
  return self->_characterSet;
}

- (BOOL)expandCodePoints
{
  return self->_expandCodePoints;
}

- (CGRect)normalizationContext
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizationContext.origin.x;
  y = self->_normalizationContext.origin.y;
  width = self->_normalizationContext.size.width;
  height = self->_normalizationContext.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)maxCandidateCount
{
  return self->_maxCandidateCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterSet, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

@end
