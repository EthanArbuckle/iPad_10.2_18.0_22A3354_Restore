@implementation ICHashtagController(App)

- (void)checkForHashtagInEditedRange:()App ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;

  v20 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    LOWORD(v19) = a9;
    objc_msgSend(a1, "_checkForHashtagInEditedRange:ofTextStorage:note:textView:allowAutoExplicitHashtag:isEndingEditing:languageHasSpaces:parentAttachment:", a3, a4, v20, v16, v17, a8, v19, v18);
  }

}

@end
