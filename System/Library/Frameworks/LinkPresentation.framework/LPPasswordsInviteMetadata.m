@implementation LPPasswordsInviteMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPPasswordsInviteMetadata)initWithCoder:(id)a3
{
  id v4;
  LPPasswordsInviteMetadata *v5;
  uint64_t v6;
  NSString *groupName;
  uint64_t v8;
  NSString *urlParameters;
  LPPasswordsInviteMetadata *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPPasswordsInviteMetadata;
  v5 = -[LPPasswordsInviteMetadata init](&v12, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("groupName"));
    v6 = objc_claimAutoreleasedReturnValue();
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v6;

    decodeStringForKey(v4, (uint64_t)CFSTR("urlParameters"));
    v8 = objc_claimAutoreleasedReturnValue();
    urlParameters = v5->_urlParameters;
    v5->_urlParameters = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_groupName, CFSTR("groupName"));
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_urlParameters, CFSTR("urlParameters"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPPasswordsInviteMetadata *v4;
  void *v5;
  void *v6;
  LPPasswordsInviteMetadata *v7;

  v4 = +[LPPasswordsInviteMetadata allocWithZone:](LPPasswordsInviteMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPPasswordsInviteMetadata groupName](self, "groupName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPPasswordsInviteMetadata setGroupName:](v4, "setGroupName:", v5);

    -[LPPasswordsInviteMetadata urlParameters](self, "urlParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPPasswordsInviteMetadata setUrlParameters:](v4, "setUrlParameters:", v6);

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  id v6;
  NSString *groupName;
  void *v8;
  NSString *urlParameters;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPPasswordsInviteMetadata;
  if (-[LPPasswordsInviteMetadata isEqual:](&v12, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      groupName = self->_groupName;
      objc_msgSend(v6, "groupName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(groupName) = objectsAreEqual_0(groupName, v8);

      if ((groupName & 1) != 0)
      {
        urlParameters = self->_urlParameters;
        objc_msgSend(v6, "urlParameters");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objectsAreEqual_0(urlParameters, v10);

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("groupName"), CFSTR("urlParameters"), 0);
}

- (BOOL)_disallowsURLOverrideByDelegate
{
  return 1;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)urlParameters
{
  return self->_urlParameters;
}

- (void)setUrlParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_urlParameters, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

- (id)_subtitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("You have been invited to join the group “%@”."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPPasswordsInviteMetadata groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_baseURL
{
  return CFSTR("prefs:root=PASSWORDS&");
}

- (id)_overrideURL
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v3 = (void *)getSFPasswordManagerURLClass_softClass;
  v31 = getSFPasswordManagerURLClass_softClass;
  if (!getSFPasswordManagerURLClass_softClass)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __getSFPasswordManagerURLClass_block_invoke;
    v27[3] = &unk_1E44A7DB0;
    v27[4] = &v28;
    __getSFPasswordManagerURLClass_block_invoke((uint64_t)v27);
    v3 = (void *)v29[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v28, 8);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3998]);
    -[LPPasswordsInviteMetadata urlParameters](self, "urlParameters");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_1E44AB1C8;
    objc_msgSend(v5, "setQuery:", v8);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v5, "queryItems", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "passwordManagerURLWithParameters:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[LPPasswordsInviteMetadata _baseURL](self, "_baseURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[LPPasswordsInviteMetadata urlParameters](self, "urlParameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      -[LPPasswordsInviteMetadata urlParameters](self, "urlParameters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", v20);
      v21 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v21;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  void *v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(a3, "unspecializedPresentationProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LPLocalizedString(CFSTR("Shared Passwords"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captionBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "top");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leading");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v5);

  -[LPPasswordsInviteMetadata _subtitle](self, "_subtitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captionBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottom");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leading");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v9);

  objc_msgSend(v4, "captionBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottom");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leading");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaximumNumberOfLines:", &unk_1E44EEA50);

  objc_msgSend(v4, "captionBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLeadingIcon:", 0);

  objc_msgSend(v4, "captionBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTrailingIcon:", 0);

  objc_msgSend(v4, "setOverrideAllowOpeningSensitiveURLs:", MEMORY[0x1E0C9AAB0]);
  -[LPPasswordsInviteMetadata _overrideURL](self, "_overrideURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideURL:", v18);

  +[LPResources passwordsInviteIcon](LPResources, "passwordsInviteIcon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v19);

  objc_msgSend(v4, "setStyle:", 48);
  return v4;
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isSharedPasswordsInviteURL:](LPPresentationSpecializations, "isSharedPasswordsInviteURL:", a3);
}

- (id)previewImageForTransformer:(id)a3
{
  +[LPResources passwordsInviteIcon](LPResources, "passwordsInviteIcon", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)previewSummaryForTransformer:(id)a3
{
  -[LPPasswordsInviteMetadata _subtitle](self, "_subtitle", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldDonateToSharedWithYouForTransformer:(id)a3
{
  return 0;
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  LPLocalizedString(CFSTR("Shared Passwords Invitation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v3);

  +[LPImage _PNGImageNamed:](LPImage, "_PNGImageNamed:", CFSTR("PasswordsInvite"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

@end
