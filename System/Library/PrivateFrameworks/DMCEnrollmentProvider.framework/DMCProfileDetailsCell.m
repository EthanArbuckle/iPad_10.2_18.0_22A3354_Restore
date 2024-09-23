@implementation DMCProfileDetailsCell

+ (id)cellIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setDetails:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unsigned __int8 v18;

  v4 = a3;
  -[DMCProfileDetailsCell setAccessoryType:](self, "setAccessoryType:", 1);
  -[DMCProfileDetailsCell setSelectionStyle:](self, "setSelectionStyle:", 3);
  v18 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "isManagedAppPayload"))
    {
      objc_msgSend(v5, "managedApp");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "iconForVariant:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (!objc_msgSend(v5, "isManagedBookPayload"))
      {
        v16 = 0;
        v17 = 0;
        -[DMCProfileDetailsCell _titleFromPayloadInfo:outSubtitle1:outSubtitle2:outNearExpiration:](self, "_titleFromPayloadInfo:outSubtitle1:outSubtitle2:outNearExpiration:", v5, &v17, &v16, &v18);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v17;
        v10 = v16;
        v8 = 0;
        if (objc_msgSend(v5, "showIcon"))
        {
          +[DMCIconFactory gearIcon](DMCIconFactory, "gearIcon");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if ((objc_msgSend(v5, "hasDetails") & 1) == 0)
        {
          -[DMCProfileDetailsCell setAccessoryType:](self, "setAccessoryType:", 0);
          -[DMCProfileDetailsCell setSelectionStyle:](self, "setSelectionStyle:", 0);
        }
        goto LABEL_9;
      }
      objc_msgSend(v5, "managedBook");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "friendlyName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[DMCApplicationProxy bookIconForVariant:](DMCApplicationProxy, "bookIconForVariant:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = 0;
    v9 = 0;
LABEL_9:

    goto LABEL_11;
  }
  if (v4)
  {
    v14 = 0;
    v15 = 0;
    -[DMCProfileDetailsCell _titleFromCertificate:outSubtitle1:outSubtitle2:outNearExpiration:](self, "_titleFromCertificate:outSubtitle1:outSubtitle2:outNearExpiration:", v4, &v15, &v14, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    v10 = v14;
    +[DMCIconFactory gearIcon](DMCIconFactory, "gearIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSLog(CFSTR("DMCProfileDetailsCell could not construct a cell for details: %@"), 0);
    v8 = 0;
    v10 = 0;
    v9 = 0;
    v7 = 0;
  }
LABEL_11:
  -[DMCProfileDetailsCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v8);
  objc_msgSend(v12, "setText:", v7);
  -[DMCProfileDetailsCell _attributedSubtitleComboWithSubtitle1:subtitle2:nearExpiration:](self, "_attributedSubtitleComboWithSubtitle1:subtitle2:nearExpiration:", v9, v10, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSecondaryAttributedText:", v13);

  -[DMCProfileDetailsCell setContentConfiguration:](self, "setContentConfiguration:", v12);
}

- (id)_titleFromPayloadInfo:(id)a3 outSubtitle1:(id *)a4 outSubtitle2:(id *)a5 outNearExpiration:(BOOL *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a3;
  objc_msgSend(v10, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtitle1Label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtitle1Description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileDetailsCell _textForLabel:value:](self, "_textForLabel:value:", v12, v13);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "certificateExpirationDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && (objc_msgSend(v14, "DMCProfilePastExpiration") & 1) != 0)
  {
    -[DMCProfileDetailsCell _expirationSubtitleForExpiry:outNearExpiration:](self, "_expirationSubtitleForExpiry:outNearExpiration:", v15, a6);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "subtitle2Label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subtitle2Description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCProfileDetailsCell _textForLabel:value:](self, "_textForLabel:value:", v16, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_titleFromCertificate:(__SecCertificate *)a3 outSubtitle1:(id *)a4 outSubtitle2:(id *)a5 outNearExpiration:(BOOL *)a6
{
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v10 = (__CFString *)SecCertificateCopySubjectSummary(a3);
  v11 = v10;
  if (v10)
    v12 = v10;
  v13 = (void *)SecCertificateCopyIssuerSummary();
  if (v13)
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_ISSUED_BY"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCProfileDetailsCell _textForLabel:value:](self, "_textForLabel:value:", v14, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = (void *)MEMORY[0x24BDBCE60];
  SecCertificateNotValidAfter();
  objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[DMCProfileDetailsCell _expirationSubtitleForExpiry:outNearExpiration:](self, "_expirationSubtitleForExpiry:outNearExpiration:", v16, a6);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_expirationSubtitleForExpiry:(id)a3 outNearExpiration:(BOOL *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD1500];
  v7 = a3;
  objc_msgSend(v6, "localizedStringFromDate:dateStyle:timeStyle:", v7, 3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v7, "DMCProfileNearOrPastExpiration");
  +[DMCProfileDetailsCell localizedExpirationLabelForExpiry:](DMCProfileDetailsCell, "localizedExpirationLabelForExpiry:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DMCProfileDetailsCell _textForLabel:value:](self, "_textForLabel:value:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)localizedExpirationLabelForExpiry:(id)a3
{
  if (objc_msgSend(a3, "DMCProfilePastExpiration"))
    return DMCEnrollmentLocalizedString(CFSTR("DMC_EXPIRED"));
  else
    return DMCEnrollmentLocalizedString(CFSTR("DMC_EXPIRES"));
}

- (id)_textForLabel:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" %@"), v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = v5;
    }
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (id)_attributes:(id)a3 modifiedWithAttributes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_attributedSubtitleComboWithSubtitle1:(id)a3 subtitle2:(id)a4 nearExpiration:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v5 = a5;
  v23[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v10 = *MEMORY[0x24BEBB368];
  v22 = *MEMORY[0x24BEBB368];
  objc_msgSend(MEMORY[0x24BDF6950], "DMCProfileSecondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v7, v12);
    objc_msgSend(v9, "appendAttributedString:", v13);

  }
  if (v8)
  {
    if (v5)
    {
      v20 = v10;
      objc_msgSend(MEMORY[0x24BDF6950], "DMCProfileRedColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
    }
    v16 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n%@"), v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithString:attributes:", v17, v12);
    objc_msgSend(v9, "appendAttributedString:", v18);

  }
  return v9;
}

@end
