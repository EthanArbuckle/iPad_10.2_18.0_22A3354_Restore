@implementation CNCardSharedProfileGroupItem

- (void)setSharedProfileStateOracle:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
}

- (id)displayLabel
{
  return &stru_1E20507A8;
}

- (id)displayStringForValue:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;

  -[CNCardSharedProfileGroupItem sharedProfileStateOracle](self, "sharedProfileStateOracle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "effectiveStateForContact");

  if (v5 == 1)
  {
LABEL_9:
    -[CNCardSharedProfileGroupItem sharedByDisplayString](self, "sharedByDisplayString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
  if (v5 == 3)
  {
    -[CNPropertyGroupItem contact](self, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sharedPhotoDisplayPreference");

    -[CNCardSharedProfileGroupItem sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pendingNickname");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = 0;
    }
    else
    {
      -[CNCardSharedProfileGroupItem sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentNickname");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13 == 0;

    }
    v11 = 0;
    if (v7 && !v10)
      goto LABEL_9;
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
}

- (id)contactDisplayName
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v3, "setStyle:", 1000);
  objc_msgSend(v3, "setFallbackStyle:", -1);
  -[CNPropertyGroupItem contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromContact:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &stru_1E20507A8;
  v7 = v6;

  return v7;
}

- (id)sharedByDisplayString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SNAP_DISPLAY_PREFERENCE_CONTACT_CARD_VALUE_ALWAYS_UPDATE"), &stru_1E20507A8, CFSTR("Localized"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCardSharedProfileGroupItem contactDisplayName](self, "contactDisplayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)sharedPhotoDisplayPreferenceForValue:(id)a3
{
  return objc_msgSend(a3, "integerValue");
}

- (int64_t)sharedPhotoDisplayPreference
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CNPropertyGroupItem labeledValue](self, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNCardSharedProfileGroupItem sharedPhotoDisplayPreferenceForValue:](self, "sharedPhotoDisplayPreferenceForValue:", v4);

  return v5;
}

@end
