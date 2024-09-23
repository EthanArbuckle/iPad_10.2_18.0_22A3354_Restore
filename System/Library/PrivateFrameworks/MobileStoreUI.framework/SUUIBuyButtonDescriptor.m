@implementation SUUIBuyButtonDescriptor

- (void)setButtonText:(id)a3
{
  NSString *v4;
  NSString *buttonText;

  if (self->_buttonText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    buttonText = self->_buttonText;
    self->_buttonText = v4;

  }
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (void)setConfirmationText:(id)a3
{
  NSString *v4;
  NSString *confirmationText;

  if (self->_confirmationText != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    confirmationText = self->_confirmationText;
    self->_confirmationText = v4;

  }
}

- (void)setElementType:(unint64_t)a3
{
  self->_elementType = a3;
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (void)setStoreIdentifier:(id)a3
{
  SUUIStoreIdentifier *v4;
  SUUIStoreIdentifier *storeIdentifier;

  if (self->_storeIdentifier != a3)
  {
    v4 = (SUUIStoreIdentifier *)objc_msgSend(a3, "copy");
    storeIdentifier = self->_storeIdentifier;
    self->_storeIdentifier = v4;

  }
}

- (void)setVariantIdentifier:(id)a3
{
  NSString *v4;
  NSString *variantIdentifier;

  if (self->_variantIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    variantIdentifier = self->_variantIdentifier;
    self->_variantIdentifier = v4;

  }
}

- (BOOL)canPersonalizeUsingItemState:(id)a3
{
  id v4;
  void *v5;
  int64_t itemIdentifier;
  void *v7;
  uint64_t v8;
  SUUIStoreIdentifier *storeIdentifier;
  void *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;

  v4 = a3;
  v5 = v4;
  if (self->_buttonType > 3uLL)
    goto LABEL_9;
  itemIdentifier = self->_itemIdentifier;
  objc_msgSend(v4, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  if (itemIdentifier != v8)
    goto LABEL_9;
  storeIdentifier = self->_storeIdentifier;
  if (!storeIdentifier
    || (objc_msgSend(v5, "storeIdentifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = -[SUUIStoreIdentifier isEqual:](storeIdentifier, "isEqual:", v10),
        v10,
        v11))
  {
    objc_msgSend(v5, "variantIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIBuyButtonDescriptor variantIdentifier](self, "variantIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = 1;
    if (v12 && v13)
      v15 = objc_msgSend(v12, "isEqualToString:", v13);

  }
  else
  {
LABEL_9:
    v15 = 0;
  }

  return v15;
}

- (BOOL)canPerformLocalActionWithItemState:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;

  v4 = a3;
  if (-[SUUIBuyButtonDescriptor canPersonalizeUsingItemState:](self, "canPersonalizeUsingItemState:", v4))
  {
    v5 = self->_buttonType != 2;
    v6 = v5 ^ objc_msgSend(v4, "activeStateIsPreview");
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (NSString)confirmationText
{
  return self->_confirmationText;
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (SUUIStoreIdentifier)storeIdentifier
{
  return self->_storeIdentifier;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)showingConfirmation
{
  return self->_showingConfirmation;
}

- (void)setShowingConfirmation:(BOOL)a3
{
  self->_showingConfirmation = a3;
}

- (int64_t)progressType
{
  return self->_progressType;
}

- (void)setProgressType:(int64_t)a3
{
  self->_progressType = a3;
}

- (BOOL)showsUniversal
{
  return self->_showsUniversal;
}

- (void)setShowsUniversal:(BOOL)a3
{
  self->_showsUniversal = a3;
}

- (BOOL)shouldSuppressEnabled
{
  return self->_shouldSuppressEnabled;
}

- (void)setShouldSuppressEnabled:(BOOL)a3
{
  self->_shouldSuppressEnabled = a3;
}

- (BOOL)shouldSuppressCloudRestore
{
  return self->_shouldSuppressCloudRestore;
}

- (void)setShouldSuppressCloudRestore:(BOOL)a3
{
  self->_shouldSuppressCloudRestore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_confirmationText, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
}

@end
