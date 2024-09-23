@implementation SFWebExtensionEnabledRemotelyBanner

- (SFWebExtensionEnabledRemotelyBanner)initWithExtension:(id)a3
{
  id v4;
  SFWebExtensionEnabledRemotelyBanner *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *remotelyEnabledExtensions;
  SFWebExtensionEnabledRemotelyBanner *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SFLinkBanner init](self, "init");
  if (v5)
  {
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner titleLabel](v5, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    objc_msgSend(MEMORY[0x1E0D89C08], "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hasAnyExtensionManagement");

    v9 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner setMessageLabelText:](v5, "setMessageLabelText:", v12);

    objc_msgSend(v4, "icon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner icon](v5, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v13);

    objc_msgSend(MEMORY[0x1E0D89C08], "sharedController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hasAnyExtensionManagement");

    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFLinkBanner setOpenButtonTitle:](v5, "setOpenButtonTitle:", v16);

    v21[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    remotelyEnabledExtensions = v5->_remotelyEnabledExtensions;
    v5->_remotelyEnabledExtensions = (NSArray *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)addExtension:(id)a3
{
  NSArray *v4;
  NSArray *remotelyEnabledExtensions;
  NSUInteger v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  -[NSArray arrayByAddingObject:](self->_remotelyEnabledExtensions, "arrayByAddingObject:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  remotelyEnabledExtensions = self->_remotelyEnabledExtensions;
  self->_remotelyEnabledExtensions = v4;

  v6 = -[NSArray count](self->_remotelyEnabledExtensions, "count");
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFLinkBanner titleLabel](self, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("puzzlepiece.extension"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFLinkBanner icon](self, "icon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v9);

  objc_msgSend(MEMORY[0x1E0D89C08], "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v11, "hasAnyExtensionManagement");

  if (!(_DWORD)v10)
  {
    if (v6 != 3)
    {
      if (v6 == 2)
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        goto LABEL_8;
      }
      v19 = (void *)MEMORY[0x1E0CB3940];
LABEL_15:
      _WBSLocalizedString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray firstObject](self->_remotelyEnabledExtensions, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "displayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v13, v15, v6 - 1);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v18 = (void *)MEMORY[0x1E0CB3940];
LABEL_12:
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_remotelyEnabledExtensions, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_remotelyEnabledExtensions, "objectAtIndexedSubscript:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_remotelyEnabledExtensions, "objectAtIndexedSubscript:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v13, v15, v17, v21);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (v6 == 3)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    goto LABEL_12;
  }
  if (v6 != 2)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    goto LABEL_15;
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
LABEL_8:
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_remotelyEnabledExtensions, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_remotelyEnabledExtensions, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "displayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v15, v17);
  v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_16:
  -[SFLinkBanner setMessageLabelText:](self, "setMessageLabelText:", v22);

}

- (id)preferredButtonBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemGray5Color");
}

- (id)preferredButtonTintColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotelyEnabledExtensions, 0);
}

@end
