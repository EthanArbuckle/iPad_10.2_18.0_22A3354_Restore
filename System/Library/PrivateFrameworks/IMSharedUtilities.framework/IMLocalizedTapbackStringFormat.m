@implementation IMLocalizedTapbackStringFormat

- (int64_t)localizedStringFormatType
{
  return self->_localizedStringFormatType;
}

- (NSString)localizedFormatString
{
  return self->_localizedFormatString;
}

- (IMLocalizedTapbackStringFormat)initWithLocalizedStringFormatType:(int64_t)a3 unlocalizedFormatString:(id)a4
{
  id v6;
  IMLocalizedTapbackStringFormat *v7;
  IMLocalizedTapbackStringFormat *v8;
  void *v9;
  uint64_t v10;
  NSString *localizedFormatString;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v6 = a4;
  v22.receiver = self;
  v22.super_class = (Class)IMLocalizedTapbackStringFormat;
  v7 = -[IMLocalizedTapbackStringFormat init](&v22, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_localizedStringFormatType = a3;
    IMSharedUtilitiesFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v6, &stru_1E3FBBA48, CFSTR("IMSharedUtilities"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedFormatString = v8->_localizedFormatString;
    v8->_localizedFormatString = (NSString *)v10;

    -[NSString uppercaseString](v8->_localizedFormatString, "uppercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", v8->_localizedFormatString);

    if (v13)
    {
      IMLogHandleForCategory("IMLocalizedTapbackStringFormat");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_19E36CEA0((uint64_t)v6, v14, v15, v16, v17, v18, v19, v20);

    }
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedFormatString, 0);
}

- (IMLocalizedTapbackStringFormat)initWithLocalizedStringFormatType:(int64_t)a3 unlocalizedFormatString:(id)a4 languageIdentifier:(id)a5
{
  id v8;
  id v9;
  IMLocalizedTapbackStringFormat *v10;
  IMLocalizedTapbackStringFormat *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  NSString *localizedFormatString;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)IMLocalizedTapbackStringFormat;
  v10 = -[IMLocalizedTapbackStringFormat init](&v31, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_localizedStringFormatType = a3;
    IMSharedUtilitiesFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(v12, "localizations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v9;
    objc_msgSend(v12, "preferredLocalizations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "preferredLocalizationsFromArray:forPreferences:", v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "localizedStringForKey:value:table:localization:", v8, 0, CFSTR("IMSharedUtilities"), v19);
    v20 = objc_claimAutoreleasedReturnValue();
    localizedFormatString = v11->_localizedFormatString;
    v11->_localizedFormatString = (NSString *)v20;

    -[NSString uppercaseString](v11->_localizedFormatString, "uppercaseString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v22, "isEqualToString:", v11->_localizedFormatString);

    if ((_DWORD)v14)
    {
      IMLogHandleForCategory("IMLocalizedTapbackStringFormat");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_19E36CEA0((uint64_t)v8, v23, v24, v25, v26, v27, v28, v29);

    }
    v9 = (id)v19;
  }

  return v11;
}

@end
