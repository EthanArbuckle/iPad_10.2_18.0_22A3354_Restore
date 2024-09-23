@implementation CNPropertyGroupAlertItem

- (id)displayLabel
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[CNPropertyGroupItem property](self, "property");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0C96680]);

  CNContactsUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("RINGTONE_CARD_ITEM_LABEL");
  else
    v6 = CFSTR("TEXTTONE_CARD_ITEM_LABEL");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E20507A8, CFSTR("Localized"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)labeledValue
{
  void *v2;
  void *v3;

  -[CNPropertyGroupItem group](self, "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labeledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)emptyValueForLabel:(id)a3
{
  return objc_alloc_init(MEMORY[0x1E0C971B8]);
}

- (void)setLabeledValue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNPropertyGroupItem group](self, "group");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabeledValue:", v4);

}

- (id)displayStringForValue:(id)a3
{
  id v4;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_25;
  objc_msgSend(v4, "sound");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ALERT_SOUND_LABEL_AND_VALUE"), &stru_1E20507A8, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGroupAlertItem _toneManager](self, "_toneManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sound");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nameForToneIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v5, "vibration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ALERT_VIBRATION_LABEL_AND_VALUE"), &stru_1E20507A8, CFSTR("Localized"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPropertyGroupAlertItem _vibrationManager](self, "_vibrationManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vibration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "nameOfVibrationWithIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v17, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  if (objc_msgSend(v5, "ignoreMute"))
  {
    CNContactsUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ALERT_IGNORE_MUTE_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v13)
    objc_msgSend(v24, "appendString:", v13);
  if (v21)
  {
    if (objc_msgSend(v25, "length"))
      objc_msgSend(v25, "appendString:", CFSTR("\n"));
    objc_msgSend(v25, "appendString:", v21);
  }
  if (v23)
  {
    if (objc_msgSend(v25, "length"))
      objc_msgSend(v25, "appendString:", CFSTR("\n"));
    objc_msgSend(v25, "appendString:", v23);
  }
  v26 = objc_msgSend(v25, "length") ? v25 : 0;

  if (!v26)
  {
LABEL_25:
    CNContactsUIBundle();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("RINGTONE_CARD_ITEM_DEFAULT_VALUE"), &stru_1E20507A8, CFSTR("Localized"));
    v26 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v26;
}

- (BOOL)isValidValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "sound");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CNPropertyGroupAlertItem _toneManager](self, "_toneManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sound");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "toneWithIdentifierIsValid:", v8);

    }
    else
    {
      v9 = 1;
    }
    objc_msgSend(v5, "vibration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CNPropertyGroupAlertItem _vibrationManager](self, "_vibrationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "vibration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 &= objc_msgSend(v11, "vibrationWithIdentifierIsValid:", v12);

    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (id)replacementForInvalidValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "sound");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vibration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v5)
    {
      -[CNPropertyGroupAlertItem _toneManager](self, "_toneManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sound");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "toneWithIdentifierIsValid:", v8);

      if ((v9 & 1) == 0)
      {

        v5 = 0;
      }
    }
    if (v6)
    {
      -[CNPropertyGroupAlertItem _vibrationManager](self, "_vibrationManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "vibration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "vibrationWithIdentifierIsValid:", v11);

      if ((v12 & 1) == 0)
      {

        v6 = 0;
      }
    }
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C971B8]), "initWithSound:vibration:ignoreMute:", v5, v6, objc_msgSend(v4, "ignoreMute"));

  return v13;
}

- (BOOL)canRemove
{
  return 0;
}

- (BOOL)isEquivalentToItem:(id)a3 whenEditing:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v5 = a3;
  -[CNPropertyGroupItem property](self, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "property");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    -[CNPropertyGroupAlertItem labeledValue](self, "labeledValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "labeledValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CNPropertyGroupItem property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertyGroupAlertItem labeledValue](self, "labeledValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> [%@] %@"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_toneManager
{
  return (id)objc_msgSend((Class)getTLToneManagerClass[0](), "sharedToneManager");
}

- (id)_vibrationManager
{
  return (id)objc_msgSend((Class)getTLVibrationManagerClass[0](), "sharedVibrationManager");
}

@end
