@implementation MPUHTMLEscapedDescriptionML

id __MPUHTMLEscapedDescriptionML_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  _MPUHTMLEscapedLyricsMLEntities(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("<br>"), 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

@end
