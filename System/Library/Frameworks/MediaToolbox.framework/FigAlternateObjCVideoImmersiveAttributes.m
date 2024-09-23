@implementation FigAlternateObjCVideoImmersiveAttributes

- (FigAlternateObjCVideoImmersiveAttributes)initWithTagCollection:(OpaqueCMTagCollection *)a3
{
  FigAlternateObjCVideoImmersiveAttributes *v4;
  OpaqueCMTagCollection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigAlternateObjCVideoImmersiveAttributes;
  v4 = -[FigAlternateObjCVideoImmersiveAttributes init](&v7, sel_init);
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
  v4.super_class = (Class)FigAlternateObjCVideoImmersiveAttributes;
  -[FigAlternateObjCVideoImmersiveAttributes dealloc](&v4, sel_dealloc);
}

- (int64_t)channelLayout
{
  int64_t result;

  result = (int64_t)self->_tagCollection;
  if (result)
  {
    FigTagCollectionGetTagsWithCategory();
    return 0;
  }
  return result;
}

- (int64_t)projection
{
  int64_t result;

  result = (int64_t)self->_tagCollection;
  if (result)
  {
    FigTagCollectionGetTagsWithCategory();
    return 0;
  }
  return result;
}

- (int64_t)packing
{
  int64_t result;

  result = (int64_t)self->_tagCollection;
  if (result)
  {
    FigTagCollectionGetTagsWithCategory();
    return 0;
  }
  return result;
}

@end
