@implementation UITableViewCell(HUCheckmarkAdditions)

+ (id)hu_emptyCheckmarkPlaceholderImage
{
  if (qword_1ED57FAC0 != -1)
    dispatch_once(&qword_1ED57FAC0, &__block_literal_global_186);
  return (id)_MergedGlobals_1_4;
}

- (void)hu_configureCheckmarkForImageView:()HUCheckmarkAdditions checked:
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (a4)
  {
    v4 = (void *)MEMORY[0x1E0CEA638];
    v5 = a3;
    objc_msgSend(v4, "hu_cellCheckmarkImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

    objc_msgSend(MEMORY[0x1E0CEA638], "hu_cellCheckmarkImage");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlightedImage:");

  }
  else
  {
    v8 = a3;
    objc_msgSend((id)objc_opt_class(), "hu_emptyCheckmarkPlaceholderImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v7);

    objc_msgSend(v8, "setHighlightedImage:", 0);
  }

}

@end
