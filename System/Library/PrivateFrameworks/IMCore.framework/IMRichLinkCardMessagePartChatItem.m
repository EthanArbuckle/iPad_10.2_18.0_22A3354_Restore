@implementation IMRichLinkCardMessagePartChatItem

- (IMRichLinkCardMessagePartChatItem)initWithItem:(id)a3 richCards:(id)a4 selectedIndex:(int64_t)a5
{
  id v8;
  id v9;
  IMRichLinkCardMessagePartChatItem *v10;
  void *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMRichLinkCardMessagePartChatItem;
  v10 = -[IMChatItem _initWithItem:](&v13, sel__initWithItem_, v8);
  if (v10)
  {
    objc_msgSend(v8, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMTranscriptChatItem _setGUID:](v10, "_setGUID:", v11);

    -[IMRichLinkCardMessagePartChatItem _setSelectedIndex:](v10, "_setSelectedIndex:", a5);
    objc_storeStrong((id *)&v10->_richCards, a4);
  }

  return v10;
}

- (void)_setSelectedIndex:(int64_t)a3
{
  self->_selectedIndex = a3;
}

- (IMRichCards)richCards
{
  return self->_richCards;
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richCards, 0);
}

@end
