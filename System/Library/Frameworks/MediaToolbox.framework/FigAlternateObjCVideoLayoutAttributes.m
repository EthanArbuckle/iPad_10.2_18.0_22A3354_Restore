@implementation FigAlternateObjCVideoLayoutAttributes

- (FigAlternateObjCVideoLayoutAttributes)initWithTagCollection:(OpaqueCMTagCollection *)a3
{
  FigAlternateObjCVideoLayoutAttributes *v4;
  OpaqueCMTagCollection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigAlternateObjCVideoLayoutAttributes;
  v4 = -[FigAlternateObjCVideoLayoutAttributes init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      v5 = (OpaqueCMTagCollection *)CFRetain(a3);
    else
      v5 = 0;
    v4->_tagCollection = v5;
  }
  return v4;
}

- (void)dealloc
{
  OpaqueCMTagCollection *tagCollection;
  objc_super v4;

  tagCollection = self->_tagCollection;
  if (tagCollection)
    CFRelease(tagCollection);
  v4.receiver = self;
  v4.super_class = (Class)FigAlternateObjCVideoLayoutAttributes;
  -[FigAlternateObjCVideoLayoutAttributes dealloc](&v4, sel_dealloc);
}

- (unint64_t)stereoViewComponents
{
  unint64_t result;
  BOOL v3;
  CMItemCount numberOfTagsCopied;
  CMTag tagBuffer;

  tagBuffer = (CMTag)*MEMORY[0x1E0CA5208];
  numberOfTagsCopied = 0;
  result = (unint64_t)self->_tagCollection;
  if (result)
  {
    if (CMTagCollectionGetTagsWithCategory((CMTagCollectionRef)result, kCMTagCategory_StereoView, &tagBuffer, 1, &numberOfTagsCopied))
    {
      v3 = 0;
    }
    else
    {
      v3 = numberOfTagsCopied == 1;
    }
    if (v3)
      return CMTagGetFlagsValue(tagBuffer);
    else
      return 0;
  }
  return result;
}

- (unint64_t)projectionType
{
  unint64_t v2;
  OpaqueCMTagCollection *tagCollection;
  BOOL v4;
  CMItemCount numberOfTagsCopied;
  CMTag tagBuffer;

  v2 = 1919247220;
  tagBuffer = (CMTag)*MEMORY[0x1E0CA5208];
  numberOfTagsCopied = 0;
  tagCollection = self->_tagCollection;
  if (tagCollection)
  {
    if (CMTagCollectionGetTagsWithCategory(tagCollection, kCMTagCategory_ProjectionType, &tagBuffer, 1, &numberOfTagsCopied))
    {
      v4 = 0;
    }
    else
    {
      v4 = numberOfTagsCopied == 1;
    }
    if (v4)
      return CMTagGetFlagsValue(tagBuffer);
  }
  return v2;
}

- (unint64_t)packingType
{
  unint64_t v2;
  OpaqueCMTagCollection *tagCollection;
  BOOL v4;
  CMItemCount numberOfTagsCopied;
  CMTag tagBuffer;

  v2 = 1852796517;
  tagBuffer = (CMTag)*MEMORY[0x1E0CA5208];
  numberOfTagsCopied = 0;
  tagCollection = self->_tagCollection;
  if (tagCollection)
  {
    if (CMTagCollectionGetTagsWithCategory(tagCollection, kCMTagCategory_PackingType, &tagBuffer, 1, &numberOfTagsCopied))
    {
      v4 = 0;
    }
    else
    {
      v4 = numberOfTagsCopied == 1;
    }
    if (v4)
      return CMTagGetFlagsValue(tagBuffer);
  }
  return v2;
}

@end
