@implementation UIContextMenuInteraction(MobileSafariExtras)

- (_SFUIViewPopoverSourceInfo)safari_popoverSourceInfo
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _SFUIViewPopoverSourceInfo *v11;
  _SFUIViewPopoverSourceInfo *v12;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationInView:", v2);
  v4 = v3;
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  v7 = v2;
  objc_msgSend(v7, "indexPathForItemAtPoint:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_msgSend(v7, "cellForItemAtIndexPath:", v8), (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_6:
    v12 = [_SFUIViewPopoverSourceInfo alloc];
    v11 = -[_SFUIViewPopoverSourceInfo initWithView:rect:](v12, "initWithView:rect:", v2, v4, v6, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    goto LABEL_7;
  }
  v10 = (void *)v9;
  v11 = -[_SFUIViewPopoverSourceInfo initWithView:]([_SFUIViewPopoverSourceInfo alloc], "initWithView:", v9);

LABEL_7:
  return v11;
}

@end
