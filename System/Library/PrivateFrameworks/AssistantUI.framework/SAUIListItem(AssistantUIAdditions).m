@implementation SAUIListItem(AssistantUIAdditions)

- (id)afui_appInfo
{
  void *v2;
  char isKindOfClass;
  void *v4;
  void *v5;

  objc_msgSend(a1, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(a1, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)afui_setSelectionTextWithDisambiguationList:()AssistantUIAdditions
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "selectionResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(a1, "selectionText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v6, "selectionResponse");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setSelectionText:", v5);

      v4 = 0;
    }
  }

}

@end
