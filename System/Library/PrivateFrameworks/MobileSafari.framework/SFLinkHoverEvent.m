@implementation SFLinkHoverEvent

- (SFLinkHoverEvent)initWithHoveredLinkURL:(id)a3 forCurrentURL:(id)a4 modifierFlags:(int64_t)a5 frame:(id)a6 targetFrame:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SFLinkHoverEvent *v17;
  SFLinkHoverEvent *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  SFLinkHoverEvent *v22;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SFLinkHoverEvent;
  v17 = -[SFLinkHoverEvent init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_url, a3);
    v18->_modifierFlags = a5;
    v18->_hasTargetFrame = v16 != 0;
    v19 = objc_msgSend(v15, "frameID");
    v18->_targetFrameIsSameAsFrame = v19 == objc_msgSend(v16, "frameID");
    objc_msgSend(v13, "fragment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");
    if (v21)
      LOBYTE(v21) = objc_msgSend(v13, "safari_isSameAsURLRemovingFragment:", v14);
    v18->_hasFragmentOnSamePage = v21;

    v22 = v18;
  }

  return v18;
}

- (id)_formattedMessage
{
  void *v3;
  void *v4;
  NSURL *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  -[NSURL safari_defaultStatusMessageString](self->_url, "safari_defaultStatusMessageString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v3);
  }
  else
  {
    v5 = self->_url;
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setLineSpacing:", 1.5);
    objc_msgSend(v7, "setBaseWritingDirection:", 0);
    objc_msgSend(v7, "setAlignment:", 0);
    v21[0] = *MEMORY[0x1E0DC1140];
    v8 = v21[0];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = *MEMORY[0x1E0DC1178];
    v22[0] = v9;
    v22[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v8;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[NSURL safari_isURLTooLongToDisplay](v5, "safari_isURLTooLongToDisplay"))
    {
      v13 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[NSURL safari_userVisibleStringConsideringLongURLs](v5, "safari_userVisibleStringConsideringLongURLs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v10);

    }
    else
    {
      -[NSURL safari_attributedStringWithSimplificationOptions:attributes:attributesForDeemphasizedText:attributesForHTTPSProtocol:](v5, "safari_attributedStringWithSimplificationOptions:attributes:attributesForDeemphasizedText:attributesForHTTPSProtocol:", 5, v10, v12, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v16);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithFormat:options:locale:", v17, 0, 0, v15);

  }
  return v4;
}

- (NSAttributedString)attributedMessageString
{
  NSAttributedString *attributedMessage;
  NSAttributedString *v4;
  NSAttributedString *v5;

  attributedMessage = self->_attributedMessage;
  if (!attributedMessage)
  {
    -[SFLinkHoverEvent _formattedMessage](self, "_formattedMessage");
    v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_attributedMessage;
    self->_attributedMessage = v4;

    attributedMessage = self->_attributedMessage;
  }
  return attributedMessage;
}

- (BOOL)isEmpty
{
  return self->_url == 0;
}

- (BOOL)isEqual:(id)a3
{
  SFLinkHoverEvent *v4;
  SFLinkHoverEvent *v5;
  void *v6;
  int64_t modifierFlags;
  BOOL v8;

  v4 = (SFLinkHoverEvent *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SFLinkHoverEvent url](v5, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (WBSIsEqual())
      {
        modifierFlags = self->_modifierFlags;
        v8 = modifierFlags == -[SFLinkHoverEvent modifierFlags](v5, "modifierFlags");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_modifierFlags ^ -[NSURL hash](self->_url, "hash");
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
}

@end
