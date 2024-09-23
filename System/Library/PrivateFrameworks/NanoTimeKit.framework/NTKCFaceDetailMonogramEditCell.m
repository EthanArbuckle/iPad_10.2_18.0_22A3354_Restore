@implementation NTKCFaceDetailMonogramEditCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailMonogramEditCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  NTKCFaceDetailMonogramEditCell *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailMonogramEditCell;
  v5 = -[NTKCFaceDetailRowActionCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v5)
  {
    NTKCCustomizationLocalizedString(CFSTR("MONOGRAM_EDIT"), (uint64_t)CFSTR("Edit Monogram"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailMonogramEditCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__monogramChanged, CFSTR("NTKCustomMonogramChangedNotification"), 0);

    -[NTKCFaceDetailMonogramEditCell _monogramChanged](v5, "_monogramChanged");
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("NTKCustomMonogramChangedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)NTKCFaceDetailMonogramEditCell;
  -[NTKCDetailTableViewCell dealloc](&v4, sel_dealloc);
}

- (void)_monogramChanged
{
  void *v3;
  void *v4;

  +[NTKMonogram monogram](NTKMonogram, "monogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailMonogramEditCell detailTextLabel](self, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v3);

  -[NTKCFaceDetailMonogramEditCell setNeedsLayout](self, "setNeedsLayout");
}

@end
