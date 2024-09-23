@implementation UIImage(MailUI)

+ (id)mui_imageFromSuggestionToken:()MailUI
{
  id v4;
  __CFString *v5;
  __CFString **v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;

  v4 = a3;
  v5 = CFSTR("magnifyingglass");
  switch(objc_msgSend(v4, "tokenKind"))
  {
    case 0:
      break;
    case 2:
      v6 = MFImageGlyphSearchAttachment;
      goto LABEL_22;
    case 3:
      v6 = MFImageGlyphSearchAudio;
      goto LABEL_22;
    case 5:
    case 7:
      v6 = MFImageGlyphSearchDate;
      goto LABEL_22;
    case 6:
      v6 = MFImageGlyphSearchDocument;
      goto LABEL_22;
    case 9:
      v6 = MFImageGlyphSearchIgnore;
      goto LABEL_22;
    case 10:
    case 17:
      v6 = MFImageGlyphSearchImage;
      goto LABEL_22;
    case 11:
    case 14:
      v6 = MFImageGlyphSearchEmail;
      goto LABEL_22;
    case 12:
      v6 = MFImageGlyphSearchMailbox;
      goto LABEL_22;
    case 13:
      v6 = MFImageGlyphSearchDefaultLocation;
      goto LABEL_22;
    case 16:
    case 46:
      v6 = MFImageGlyphSearchPersonCompletion;
      goto LABEL_22;
    case 19:
      v6 = MFImageGlyphSearchReadIndicator;
      goto LABEL_22;
    case 20:
      v6 = MFImageGlyphSearchReply;
      goto LABEL_22;
    case 22:
      v6 = MFImageGlyphSearchSourceCode;
      goto LABEL_22;
    case 24:
    case 25:
    case 33:
      v6 = MFImageGlyphSearchFlag;
      goto LABEL_22;
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
      v6 = MFImageGlyphSearchFlagFilled;
      goto LABEL_22;
    case 36:
      v6 = MFImageGlyphSearchMovie;
      goto LABEL_22;
    case 37:
      v6 = MFImageGlyphSearchDefaultLink;
LABEL_22:
      v8 = *v6;

      v5 = v8;
      break;
    default:
      _ef_log_UIImage();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[UIImage(MailUI) mui_imageFromSuggestionToken:].cold.1(v4, v7);

      break;
  }
  objc_msgSend(a1, "mui_imageWithSystemSymbolName:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)mui_imageWithSystemSymbolName:()MailUI
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:");
}

+ (uint64_t)mui_imageWithSystemSymbolName:()MailUI accessibilityDescription:
{
  return objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:");
}

+ (void)mui_imageFromSuggestionToken:()MailUI .cold.1(void *a1, NSObject *a2)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 134218242;
  v5 = objc_msgSend(a1, "tokenKind");
  v6 = 2112;
  v7 = a1;
  _os_log_error_impl(&dword_1D5522000, a2, OS_LOG_TYPE_ERROR, "Detected unsupported kind: %ld for token: %@", (uint8_t *)&v4, 0x16u);
}

@end
