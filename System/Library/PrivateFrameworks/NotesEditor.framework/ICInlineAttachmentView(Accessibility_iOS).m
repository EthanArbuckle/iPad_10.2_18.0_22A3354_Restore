@implementation ICInlineAttachmentView(Accessibility_iOS)

- (uint64_t)textRangeInNote
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "textAttachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "rangeForAttachment:", v2);

  return v4;
}

- (id)supportedRotorTypes
{
  void *v1;
  void *v2;
  void *v3;
  const __CFString **v4;
  void *v5;
  NSObject *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "textAttachment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "isMentionAttachment"))
  {
    v9[0] = CFSTR("ICAccessibilityRotorTypeMentions");
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = (const __CFString **)v9;
LABEL_5:
    objc_msgSend(v3, "arrayWithObjects:count:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v2, "isHashtagAttachment"))
  {
    v8 = CFSTR("ICAccessibilityRotorTypeTags");
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = &v8;
    goto LABEL_5;
  }
  v6 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ICInlineAttachmentView(Accessibility_iOS) supportedRotorTypes].cold.1(v6);

  v5 = (void *)MEMORY[0x1E0C9AA60];
LABEL_9:

  return v5;
}

- (void)supportedRotorTypes
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD7B0000, log, OS_LOG_TYPE_ERROR, "Unsupported inline attachment type for the accessibility rotor", v1, 2u);
}

@end
