@implementation CHSScreenshotPresentationAttributes

- (unint64_t)hash
{
  int64_t v3;
  NSUInteger v4;

  v3 = self->_colorScheme + self->_allowsPrivacySensitiveContent + self->_userWantsWidgetDataWhenPasscodeLocked + 19;
  v4 = -[NSString hash](self->_additionalSettingsContext, "hash");
  return v3 ^ v4 ^ -[CHSWidgetTintParameters hash](self->_tintParameters, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int64_t colorScheme;
  uint64_t v11;
  id v12;
  id v13;
  _BOOL8 allowsPrivacySensitiveContent;
  id v15;
  id v16;
  _BOOL8 userWantsWidgetDataWhenPasscodeLocked;
  id v18;
  id v19;
  NSString *additionalSettingsContext;
  id v21;
  id v22;
  CHSWidgetTintParameters *tintParameters;
  id v24;
  char v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    colorScheme = self->_colorScheme;
    v11 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke;
    v35[3] = &unk_1E2A5A5D0;
    v12 = v8;
    v36 = v12;
    v13 = (id)objc_msgSend(v9, "appendInteger:counterpart:", colorScheme, v35);
    allowsPrivacySensitiveContent = self->_allowsPrivacySensitiveContent;
    v33[0] = v11;
    v33[1] = 3221225472;
    v33[2] = __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_2;
    v33[3] = &unk_1E2A5A508;
    v15 = v12;
    v34 = v15;
    v16 = (id)objc_msgSend(v9, "appendBool:counterpart:", allowsPrivacySensitiveContent, v33);
    userWantsWidgetDataWhenPasscodeLocked = self->_userWantsWidgetDataWhenPasscodeLocked;
    v31[0] = v11;
    v31[1] = 3221225472;
    v31[2] = __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_3;
    v31[3] = &unk_1E2A5A508;
    v18 = v15;
    v32 = v18;
    v19 = (id)objc_msgSend(v9, "appendBool:counterpart:", userWantsWidgetDataWhenPasscodeLocked, v31);
    additionalSettingsContext = self->_additionalSettingsContext;
    v29[0] = v11;
    v29[1] = 3221225472;
    v29[2] = __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_4;
    v29[3] = &unk_1E2A5A5A8;
    v21 = v18;
    v30 = v21;
    v22 = (id)objc_msgSend(v9, "appendString:counterpart:", additionalSettingsContext, v29);
    tintParameters = self->_tintParameters;
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_5;
    v27[3] = &unk_1E2A5AAC0;
    v28 = v21;
    v24 = (id)objc_msgSend(v9, "appendObject:counterpart:", tintParameters, v27);
    v25 = objc_msgSend(v9, "isEqual");

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

uint64_t __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
}

uint64_t __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 17);
}

id __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 24);
}

id __47__CHSScreenshotPresentationAttributes_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 32);
}

- (int64_t)colorScheme
{
  return self->_colorScheme;
}

- (BOOL)allowsPrivacySensitiveContent
{
  return self->_allowsPrivacySensitiveContent;
}

- (BOOL)userWantsWidgetDataWhenPasscodeLocked
{
  return self->_userWantsWidgetDataWhenPasscodeLocked;
}

- (CHSWidgetTintParameters)tintParameters
{
  return self->_tintParameters;
}

- (NSString)additionalSettingsContext
{
  return self->_additionalSettingsContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintParameters, 0);
  objc_storeStrong((id *)&self->_additionalSettingsContext, 0);
}

@end
