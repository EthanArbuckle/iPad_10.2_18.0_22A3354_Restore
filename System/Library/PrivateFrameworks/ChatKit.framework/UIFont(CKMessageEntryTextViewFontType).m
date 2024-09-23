@implementation UIFont(CKMessageEntryTextViewFontType)

+ (id)ck_fontWithMessageEntryTextViewFontType:()CKMessageEntryTextViewFontType
{
  void *v4;
  void *v5;
  uint64_t v6;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  switch((unint64_t)a3)
  {
    case 0uLL:
      objc_msgSend(v4, "balloonTextFont");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1uLL:
      objc_msgSend(v4, "singleBigEmojiFont");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2uLL:
      objc_msgSend(v4, "multipleBigEmojiFont");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3uLL:
      objc_msgSend(v4, "singleBigAssetFont");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      a3 = (void *)v6;
      break;
    default:
      break;
  }

  return a3;
}

@end
