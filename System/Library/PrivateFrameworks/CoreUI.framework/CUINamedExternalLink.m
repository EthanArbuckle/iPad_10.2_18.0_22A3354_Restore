@implementation CUINamedExternalLink

- (NSString)assetPackIdentifier
{
  return (NSString *)-[CUIThemeRendition assetPackIdentifier](-[CUINamedLookup _rendition](self, "_rendition"), "assetPackIdentifier");
}

@end
