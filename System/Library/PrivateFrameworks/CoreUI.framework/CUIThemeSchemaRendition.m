@implementation CUIThemeSchemaRendition

- (unint64_t)numberOfSlices
{
  return self->_nimages;
}

- (CGRect)sliceRects
{
  return self->_layoutRects;
}

- (CUIPSDGradient)gradient
{
  return self->_gradient;
}

- (CUIThemeSchemaRendition)initWithCoreUIOptions:(id)a3 forKey:(const _renditionkeytoken *)a4
{
  CUIThemeSchemaRendition *v6;
  CUIThemeSchemaRendition *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CUIThemeSchemaRendition;
  v6 = -[CUIThemeSchemaRendition init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_intrinsicSize = CGSizeZero;
    -[CUIThemeRendition _initializeRenditionKey:](v6, "_initializeRenditionKey:", a4);
    -[CUIThemeRendition setOpacity:](v7, "setOpacity:", 1.0);
    -[CUIThemeRendition setBlendMode:](v7, "setBlendMode:", 0);
    if (+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.systemappearance")))
    {
      -[CUIThemeSchemaRendition _initializeCoreUIOptions:](v7, "_initializeCoreUIOptions:", a3);
    }
  }
  return v7;
}

- (void)dealloc
{
  unint64_t v3;
  CGImage **image;
  objc_super v5;

  if (self->_nimages)
  {
    v3 = 0;
    image = self->_image;
    do
    {
      CGImageRelease(image[v3]);
      image[v3++] = 0;
    }
    while (v3 < self->_nimages);
  }

  v5.receiver = self;
  v5.super_class = (Class)CUIThemeSchemaRendition;
  -[CUIThemeRendition dealloc](&v5, sel_dealloc);
}

- (double)scale
{
  unsigned int v2;

  v2 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)-[CUIThemeRendition key](self, "key"), 12);
  if (v2 <= 1)
    return (double)1;
  else
    return (double)v2;
}

- (id)slices
{
  NSMutableArray *v3;
  unint64_t v4;
  CGSize *p_size;
  double width;
  double height;
  double v8;
  double v9;

  v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", self->_nimages);
  if (self->_nimages)
  {
    v4 = 0;
    p_size = &self->_layoutRects[0].size;
    do
    {
      width = p_size[-1].width;
      height = p_size[-1].height;
      v8 = p_size->width;
      v9 = p_size->height;
      p_size += 2;
      -[NSMutableArray addObject:](v3, "addObject:", +[NSValue valueWithRect:](NSValue, "valueWithRect:", width, height, v8, v9));
      ++v4;
    }
    while (v4 < self->_nimages);
  }
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3);
}

- (CGRect)alignmentRectangle
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_elementRect.origin.x;
  y = self->_elementRect.origin.y;
  width = self->_elementRect.size.width;
  height = self->_elementRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)edgeInsets:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  CGRect *p_elementRect;
  double y;
  double height;
  double v10;
  double v11;
  double v12;
  double v13;
  double x;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v3 = a3;
  v5 = -[CUIThemeSchemaRendition referenceImage](self, "referenceImage");
  v6 = v5;
  p_elementRect = &self->_elementRect;
  y = p_elementRect->origin.y;
  if (v3)
    height = p_elementRect->size.height + 1.0;
  else
    height = p_elementRect->size.height;
  objc_msgSend(v5, "size");
  if (height > v10)
  {
    objc_msgSend(v6, "size");
    height = v11;
  }
  v12 = y + -1.0;
  if (!v3)
    v12 = y;
  if (v12 >= 0.0)
    v13 = v12;
  else
    v13 = 0.0;
  x = p_elementRect->origin.x;
  objc_msgSend(v6, "size");
  v16 = v15 - p_elementRect->size.width - p_elementRect->origin.x;
  objc_msgSend(v6, "size");
  v18 = v17 - height - v13;
  v19 = x;
  v20 = v13;
  v21 = v16;
  result.size.height = v18;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.var3 = right;
  result.var2 = bottom;
  result.var1 = left;
  result.var0 = top;
  return result;
}

- (id)coreUIOptions
{
  return self->cuiInfo;
}

- (id)referenceImage
{
  return 0;
}

- (id)defaultTemplateName
{
  _renditionkeytoken *v2;
  const char *v3;
  char v5[256];

  v2 = -[CUIThemeRendition key](self, "key");
  v3 = CUISystemThemeRenditionKeyFormat();
  CUICopyKeySignature(v5, 0x100uLL, (int *)v2, (uint64_t)v3, 0);
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5);
}

- (int64_t)columnSlices
{
  int64_t result;
  int64_t v4;

  result = self->_columnSlices;
  if (result <= 0)
  {
    v4 = -[CUIThemeRendition type](self, "type");
    result = 1;
    switch(v4)
    {
      case 0:
      case 2:
        break;
      case 1:
        result = 4;
        break;
      case 3:
        result = 3;
        break;
      default:
        if (v4 != 1004)
          result = -1;
        break;
    }
    self->_columnSlices = result;
  }
  return result;
}

- (int64_t)rowSlices
{
  int64_t result;
  uint64_t v4;

  result = self->_rowSlices;
  if (result <= 0)
  {
    v4 = -[CUIThemeRendition type](self, "type");
    result = 1;
    if (v4 > 2)
    {
      if (v4 == 3)
      {
        result = 3;
        goto LABEL_10;
      }
      if (v4 != 1004)
        goto LABEL_8;
    }
    else if ((unint64_t)v4 >= 2)
    {
      if (v4 == 2)
      {
        result = 4;
        goto LABEL_10;
      }
LABEL_8:
      result = -1;
    }
LABEL_10:
    self->_rowSlices = result;
  }
  return result;
}

- (CGPoint)renditionCoordinatesForPartFeatures:(int64_t)a3
{
  int v3;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  double v10;
  double v11;
  CGPoint result;

  v3 = a3;
  if ((a3 & 1) != 0)
  {
    v6 = -[CUIThemeSchemaRendition value](self, "value");
LABEL_6:
    v5 = v6;
    goto LABEL_7;
  }
  if ((a3 & 0x4000) != 0)
  {
    v6 = -[CUIThemeSchemaRendition dimension1](self, "dimension1");
    goto LABEL_6;
  }
  v5 = 0;
LABEL_7:
  if ((*(_QWORD *)&v3 & 0x20004) == 0 || (v3 & 0x10000) != 0)
  {
    if ((v3 & 0x8000) != 0)
      v9 = -[CUIThemeSchemaRendition dimension2](self, "dimension2");
    else
      v9 = 0;
  }
  else
  {
    v7 = -[CUIThemeSchemaRendition presentationState](self, "presentationState");
    v8 = v7 == 1;
    if (!v7)
      v8 = 2;
    if ((*(_QWORD *)&v3 & 0x20004) == 0x20004)
      v9 = v8;
    else
      v9 = v7 == 0;
  }
  v10 = (double)v5;
  v11 = (double)v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (unsigned)state
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 10);
}

- (unsigned)previousState
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 19);
}

- (unsigned)presentationState
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 14);
}

- (unsigned)direction
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 4);
}

- (unsigned)value
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 6);
}

- (unsigned)previousValue
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 18);
}

- (unsigned)size
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 3);
}

- (unsigned)dimension1
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 8);
}

- (unsigned)dimension2
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 9);
}

- (unsigned)drawingLayer
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 11);
}

- (unsigned)keyScale
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 12);
}

- (unsigned)identifier
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 17);
}

- (unsigned)layer
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 11);
}

- (unsigned)appearance
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 7);
}

- (unsigned)localization
{
  return -[CUIThemeRendition valueForTokenIdentifier:](self, "valueForTokenIdentifier:", 13);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaRendition;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ -- st:%u p.st:%u val:%u dim1:%u lay:%u scl:%u id:%u sz:%u dir:%u"), -[CUIThemeRendition description](&v3, sel_description), -[CUIThemeSchemaRendition state](self, "state"), -[CUIThemeSchemaRendition presentationState](self, "presentationState"), -[CUIThemeSchemaRendition value](self, "value"), -[CUIThemeSchemaRendition dimension1](self, "dimension1"), -[CUIThemeSchemaRendition drawingLayer](self, "drawingLayer"), -[CUIThemeSchemaRendition keyScale](self, "keyScale"), -[CUIThemeSchemaRendition identifier](self, "identifier"), -[CUIThemeSchemaRendition size](self, "size"), -[CUIThemeSchemaRendition direction](self, "direction"));
}

- (id)typeLocalizedString
{
  return objc_msgSend((id)objc_opt_class(self, a2), "displayNameForRenditionType:", -[CUIThemeRendition type](self, "type"));
}

- (id)stringForState:(unsigned __int16)a3
{
  const __CFString *v3;

  if (a3 > 5u)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E41AB490[(__int16)a3];
  return -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", v3, &stru_1E41B97C0, 0);
}

- (id)stateLocalizedString
{
  return -[CUIThemeSchemaRendition stringForState:](self, "stringForState:", -[CUIThemeSchemaRendition state](self, "state"));
}

- (id)previousStateLocalizedString
{
  return -[CUIThemeSchemaRendition stringForState:](self, "stringForState:", -[CUIThemeSchemaRendition previousState](self, "previousState"));
}

- (id)directionLocalizedString
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[CUIThemeSchemaRendition direction](self, "direction");
  if (v2 > 5)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E41AB4C0[(__int16)v2];
  return -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", v3, &stru_1E41B97C0, 0);
}

- (id)stringForValue:(unsigned __int16)a3
{
  const __CFString *v3;

  if (a3 > 2u)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E41AB4F0[(__int16)a3];
  return -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", v3, &stru_1E41B97C0, 0);
}

- (id)valueLocalizedString
{
  return -[CUIThemeSchemaRendition stringForValue:](self, "stringForValue:", -[CUIThemeSchemaRendition value](self, "value"));
}

- (id)previousValueLocalizedString
{
  return -[CUIThemeSchemaRendition stringForValue:](self, "stringForValue:", -[CUIThemeSchemaRendition previousValue](self, "previousValue"));
}

- (id)sizeLocalizedString
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[CUIThemeSchemaRendition size](self, "size");
  if (v2 > 3)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E41AB508[(__int16)v2];
  return -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", v3, &stru_1E41B97C0, 0);
}

- (id)presentationStateLocalizedString
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[CUIThemeSchemaRendition presentationState](self, "presentationState");
  if (v2 > 2)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E41AB528[(__int16)v2];
  return -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", v3, &stru_1E41B97C0, 0);
}

- (id)dimension1LocalizedString
{
  return +[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CUIThemeSchemaRendition dimension1](self, "dimension1")), 1);
}

- (id)dimension2LocalizedString
{
  return +[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CUIThemeSchemaRendition dimension2](self, "dimension2")), 1);
}

- (id)drawingLayerLocalizedString
{
  unsigned int v2;
  const __CFString *v3;

  v2 = -[CUIThemeSchemaRendition drawingLayer](self, "drawingLayer");
  if (v2 > 7)
    v3 = CFSTR("Unknown");
  else
    v3 = off_1E41AB540[(__int16)v2];
  return -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", v3, &stru_1E41B97C0, 0);
}

- (id)scaleLocalizedString
{
  return +[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[CUIThemeSchemaRendition keyScale](self, "keyScale")), 1);
}

@end
