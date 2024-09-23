@implementation EKColor(CalendarUIKit)

- (id)CUIK_color
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "data");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v1, &uniqueAddress);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (CUIKReminderColorDeserializer_onceToken != -1)
      dispatch_once(&CUIKReminderColorDeserializer_onceToken, &__block_literal_global_13);
    objc_msgSend((id)CUIKReminderColorDeserializer_deserializer, "deserializeColor:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
      objc_setAssociatedObject(v1, &uniqueAddress, v2, (void *)1);
  }

  return v2;
}

@end
