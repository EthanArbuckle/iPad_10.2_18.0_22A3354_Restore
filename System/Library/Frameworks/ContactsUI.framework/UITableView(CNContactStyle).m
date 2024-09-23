@implementation UITableView(CNContactStyle)

- (void)_cnui_applyContactStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a1, "_cnui_contactStyle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v8, "backgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setBackgroundColor:", v3);

  }
  if ((objc_msgSend(v8, "usesOpaqueBackground") & 1) == 0)
    objc_msgSend(a1, "setBackgroundColor:", 0);
  objc_msgSend(v8, "sectionIndexBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "sectionIndexBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setSectionIndexBackgroundColor:", v5);

  }
  objc_msgSend(v8, "separatorColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "separatorColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setSeparatorColor:", v7);

  }
  if (objc_msgSend(v8, "separatorStyle"))
    objc_msgSend(a1, "setSeparatorStyle:", objc_msgSend(v8, "separatorStyle"));
  if (objc_msgSend(v8, "separatorBackdropOverlayBlendMode"))
    objc_msgSend(a1, "_setSeparatorBackdropOverlayBlendMode:", objc_msgSend(v8, "separatorBackdropOverlayBlendMode"));
  objc_msgSend(a1, "setOpaque:", objc_msgSend(v8, "usesOpaqueBackground"));

}

@end
