@implementation _SWHighlightMentionEvent

- (_SWHighlightMentionEvent)initWithHighlight:(id)a3 mentionedPerson:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  _SWHighlightMentionEvent *v9;
  objc_super v11;

  v6 = a4;
  objc_msgSend(a3, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)_SWHighlightMentionEvent;
  v9 = -[SWHighlightMentionEvent initWithHighlightURL:mentionedPersonHandle:mentionedPersonIdentity:](&v11, sel_initWithHighlightURL_mentionedPersonHandle_mentionedPersonIdentity_, v7, v8, 0);

  return v9;
}

@end
