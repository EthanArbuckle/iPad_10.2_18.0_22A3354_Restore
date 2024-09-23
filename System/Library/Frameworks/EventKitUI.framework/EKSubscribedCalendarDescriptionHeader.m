@implementation EKSubscribedCalendarDescriptionHeader

- (EKSubscribedCalendarDescriptionHeader)initWithParentWidth:(double)a3
{
  return -[EKSubscribedCalendarDescriptionHeader initWithParentWidth:showHolidayCalendarDescription:](self, "initWithParentWidth:showHolidayCalendarDescription:", 0, a3);
}

- (EKSubscribedCalendarDescriptionHeader)initWithParentWidth:(double)a3 showHolidayCalendarDescription:(BOOL)a4
{
  _BOOL4 v4;
  EKSubscribedCalendarDescriptionHeader *v6;
  UILabel *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *label;
  objc_super v18;

  v4 = a4;
  v18.receiver = self;
  v18.super_class = (Class)EKSubscribedCalendarDescriptionHeader;
  v6 = -[EKSubscribedCalendarDescriptionHeader init](&v18, sel_init);
  if (v6)
  {
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
    {
      v10 = CFSTR("Holiday calendar explanation");
      v11 = CFSTR("Holiday calendars are read-only feeds of data from external sources. You can subscribe to this feed to get events as they are updated by the data provider.");
    }
    else
    {
      v10 = CFSTR("Subscribed calendar explanation");
      v11 = CFSTR("Subscription calendars are read-only feeds of data from external sources. You can subscribe to this feed to get events as they are updated by the data provider.");
    }
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v7, "setText:", v12);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v7, "setFont:", v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v7, "setBackgroundColor:", v14);

    -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v7, "setTextColor:", v15);

    -[EKSubscribedCalendarDescriptionHeader addSubview:](v6, "addSubview:", v7);
    label = v6->_label;
    v6->_label = v7;

    -[EKSubscribedCalendarDescriptionHeader updateLayoutForWidth:](v6, "updateLayoutForWidth:", a3);
  }
  return v6;
}

- (BOOL)updateLayoutForWidth:(double)a3
{
  double Height;
  double v7;
  double v8;
  CGRect v9;

  if (self->_lastParentWidth == a3)
    return 0;
  -[EKSubscribedCalendarDescriptionHeader bounds](self, "bounds");
  Height = CGRectGetHeight(v9);
  -[UILabel setFrame:](self->_label, "setFrame:", 0.0, 0.0, a3 + -80.0, 1.79769313e308);
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[UILabel frame](self->_label, "frame");
  v8 = v7;
  -[UILabel setFrame:](self->_label, "setFrame:", 40.0, 12.0);
  -[EKSubscribedCalendarDescriptionHeader frame](self, "frame");
  -[EKSubscribedCalendarDescriptionHeader setFrame:](self, "setFrame:");
  self->_lastParentWidth = a3;
  return Height != v8 + 24.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
