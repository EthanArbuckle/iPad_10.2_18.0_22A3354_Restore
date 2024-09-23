@implementation ParticipantVideoOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.ParticipantVideoOverlayView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("ConversationKit.ParticipantMonogramView"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  void *v10;
  int v11;

  -[ParticipantVideoOverlayViewAccessibility _accessibilityMonogramView](self, "_accessibilityMonogramView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    -[ParticipantVideoOverlayViewAccessibility _accessibilityImageOverlayView](self, "_accessibilityImageOverlayView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "accessibilityIdentification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsString:", CFSTR("paused"));

    if (v7)
    {
      v8 = CFSTR("roster.paused");
    }
    else
    {
      objc_msgSend(v5, "accessibilityIdentification");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsString:", CFSTR("bad-connection"));

      if (!v11)
      {
        _AXAssert();
        v9 = 0;
        goto LABEL_9;
      }
      v8 = CFSTR("roster.bad.connection");
    }
    accessibilityLocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v3, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v9;
}

- (id)_accessibilityMonogramView
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ParticipantVideoOverlayViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", MEMORY[0x23490C0EC](CFSTR("ConversationKit.ParticipantMonogramView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityImageOverlayView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_opt_class();
  -[ParticipantVideoOverlayViewAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

@end
