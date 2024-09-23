@implementation CHSWidgetDescriptor(ATXSuggestionLayoutOptions)

- (unint64_t)atx_layoutOptions
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (4 * objc_msgSend(a1, "supportedFamilies")) & 8;
  v3 = v2 & 0xFFFFFFFFFFFFFFEFLL | (16 * (((unint64_t)objc_msgSend(a1, "supportedFamilies") >> 2) & 1));
  v4 = v3 & 0xFFFFFFFFFFFFFFBFLL | ((((unint64_t)objc_msgSend(a1, "supportedFamilies") >> 3) & 1) << 6);
  return v4 & 0xFFFFFFFFFFFFFF7FLL | ((((unint64_t)objc_msgSend(a1, "supportedFamilies") >> 4) & 1) << 7);
}

@end
