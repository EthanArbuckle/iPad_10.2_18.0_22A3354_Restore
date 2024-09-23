@implementation PXFocusTimelineEventAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXFocusTimelineEvent");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXFocusTimelineEvent"), CFSTR("time"), "{?=qiIq}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXFocusTimelineEvent"), CFSTR("type"), "Q", 0);

}

- (id)accessibilityFocusEventTimeString
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMTime time;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3810000000;
  v6 = "";
  v7 = 0;
  v8 = 0;
  v9 = 0;
  AXPerformSafeBlock();
  time = *(CMTime *)(v4 + 4);
  _Block_object_dispose(&v3, 8);
  CMTimeGetSeconds(&time);
  UIAXTimeStringForDuration();
  return (id)objc_claimAutoreleasedReturnValue();
}

double __70__PXFocusTimelineEventAccessibility_accessibilityFocusEventTimeString__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double result;
  __int128 v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "time");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v4;
  *(_OWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 48) = v5;
  return result;
}

- (id)accessibilityFocusEventTypeString
{
  uint64_t v2;
  __CFString *v3;
  void *v4;

  v2 = -[PXFocusTimelineEventAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("type"));
  if (v2 == 1)
  {
    v3 = CFSTR("manual.focus.event");
  }
  else
  {
    if (v2)
    {
      v4 = 0;
      return v4;
    }
    v3 = CFSTR("auto.focus.event");
  }
  accessibilityPhotosUICoreLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

@end
