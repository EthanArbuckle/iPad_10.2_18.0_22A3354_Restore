@implementation AKToolbarUtilities

+ (int64_t)attributeTagForCurrentSelectionState:(id)a3
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;

  v3 = 765101;
  objc_msgSend(a3, "currentPageController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "selectedAnnotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v3 = 765106;
  }

  return v3;
}

@end
