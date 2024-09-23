@implementation UIViewController(EKUIAppEntityAnnotation)

- (void)EKUI_annotateIfNeededWithAppEntityForEvent:()EKUIAppEntityAnnotation isEditing:
{
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (CalendarLinkLibraryCore())
  {
    v6 = objc_msgSend(a1, "isViewLoaded");
    if (v9)
    {
      if (v6 && (objc_msgSend(v9, "isNew") & 1) == 0)
      {
        objc_msgSend(a1, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "Cal_annotateWithEvent:", v9);

        objc_msgSend(a1, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "Cal_updateEntityAnnotationStateIsSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:", 1, 0, 0, 0, a4, 1);

      }
    }
  }

}

@end
