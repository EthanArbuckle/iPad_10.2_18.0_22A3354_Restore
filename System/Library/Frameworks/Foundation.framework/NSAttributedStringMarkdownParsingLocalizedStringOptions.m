@implementation NSAttributedStringMarkdownParsingLocalizedStringOptions

uint64_t ___NSAttributedStringMarkdownParsingLocalizedStringOptions_block_invoke()
{
  id v0;

  qword_1ECD09B40 = objc_alloc_init(NSAttributedStringMarkdownParsingOptions);
  objc_msgSend((id)qword_1ECD09B40, "setAllowsExtendedAttributes:", 1);
  objc_msgSend((id)qword_1ECD09B40, "setInterpretedSyntax:", 2);
  objc_msgSend((id)qword_1ECD09B40, "setFailurePolicy:", 1);
  v0 = -[NSArray firstObject](-[NSBundle preferredLocalizations](+[NSBundle mainBundle](NSBundle, "mainBundle"), "preferredLocalizations"), "firstObject");
  return objc_msgSend((id)qword_1ECD09B40, "setLanguageCode:", v0);
}

@end
