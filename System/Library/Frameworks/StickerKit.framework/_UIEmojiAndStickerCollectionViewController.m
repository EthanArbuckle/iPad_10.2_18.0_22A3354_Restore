@implementation _UIEmojiAndStickerCollectionViewController

+ (id)newInstanceWithConfiguration:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("UIEmojiAndStickerCollectionViewController"))), "initWithConfiguration:", v3);

  return v4;
}

- (_UIEmojiAndStickerCollectionViewControllerDelegate)delegate
{
  return (_UIEmojiAndStickerCollectionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong(&self->_configuration, a3);
}

- (_UIKeyboardEmojiKeyDisplayController)emojiKeyManager
{
  return self->_emojiKeyManager;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_emojiKeyManager, 0);
  objc_storeStrong(&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
