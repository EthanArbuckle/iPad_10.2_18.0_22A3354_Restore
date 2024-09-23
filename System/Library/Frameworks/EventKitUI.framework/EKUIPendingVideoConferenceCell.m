@implementation EKUIPendingVideoConferenceCell

- (EKUIPendingVideoConferenceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EKUIPendingVideoConferenceCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EKUIPendingVideoConferenceCell;
  v4 = -[EKUILocationEditItemCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Pending Video Call"), &stru_1E601DFA8, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v4->super._title, "setText:", v6);

    -[UIActivityIndicatorView setHidden:](v4->super._spinner, "setHidden:", 0);
    -[UIImageView setHidden:](v4->super._image, "setHidden:", 1);
    -[UIActivityIndicatorView startAnimating](v4->super._spinner, "startAnimating");
  }
  return v4;
}

@end
