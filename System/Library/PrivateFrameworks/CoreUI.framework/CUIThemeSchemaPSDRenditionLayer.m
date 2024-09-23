@implementation CUIThemeSchemaPSDRenditionLayer

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaPSDRenditionLayer;
  return objc_msgSend(-[CUIThemeSchemaPSDLayer description](&v3, sel_description), "stringByAppendingFormat:", CFSTR("\rRendition: %@"), -[CUIThemeSchemaRendition description](-[CUIThemeSchemaPSDRenditionLayer rendition](self, "rendition"), "description"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaPSDRenditionLayer;
  -[CUIThemeSchemaPSDLayer dealloc](&v3, sel_dealloc);
}

- (CUIThemeSchemaRendition)rendition
{
  return self->rendition;
}

- (void)setRendition:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
