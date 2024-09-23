@implementation ICASPaletteEngagementType

- (ICASPaletteEngagementType)initWithPaletteEngagementType:(int64_t)a3
{
  ICASPaletteEngagementType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASPaletteEngagementType;
  result = -[ICASPaletteEngagementType init](&v5, sel_init);
  if (result)
    result->_paletteEngagementType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  if (-[ICASPaletteEngagementType paletteEngagementType](self, "paletteEngagementType", a3))
    return CFSTR("movePalette");
  else
    return CFSTR("unknown");
}

- (int64_t)paletteEngagementType
{
  return self->_paletteEngagementType;
}

@end
