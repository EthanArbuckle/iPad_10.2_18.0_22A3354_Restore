@implementation EKEventReportJunkView

- (EKEventReportJunkView)initWithViewController:(id)a3
{
  id v5;
  EKEventReportJunkView *v6;
  EKEventReportJunkView *v7;
  void *v8;
  uint64_t v9;
  EKEventDetailsHighlightControl *control;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  EKEventDetailsHighlightControl *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EKEventReportJunkView;
  v6 = -[EKEventReportJunkView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventReportJunkView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = objc_opt_new();
    control = v7->_control;
    v7->_control = (EKEventDetailsHighlightControl *)v9;

    -[EKEventDetailsHighlightControl setTranslatesAutoresizingMaskIntoConstraints:](v7->_control, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKEventDetailsHighlightControl setEnabled:](v7->_control, "setEnabled:", 0);
    LODWORD(v11) = 1148846080;
    -[EKEventDetailsHighlightControl setContentCompressionResistancePriority:forAxis:](v7->_control, "setContentCompressionResistancePriority:forAxis:", 1, v11);
    LODWORD(v12) = 1148846080;
    -[EKEventReportJunkView setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 1, v12);
    -[EKEventReportJunkView addSubview:](v7, "addSubview:", v7->_control);
    _NSDictionaryOfVariableBindings(CFSTR("_control"), v7->_control, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_control]-(16)-|"), 0, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventReportJunkView addConstraints:](v7, "addConstraints:", v14);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_control]|"), 0, 0, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventReportJunkView addConstraints:](v7, "addConstraints:", v15);

    v16 = v7->_control;
    EventKitUIBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("This invitation is from an unknown contact."), &stru_1E601DFA8, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailsHighlightControl setTitleText:](v16, "setTitleText:", v18);

    -[EKEventReportJunkView updateActionText](v7, "updateActionText");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v7, sel_tapped_);
    objc_msgSend(v19, "setNumberOfTapsRequired:", 1);
    -[EKEventReportJunkView addGestureRecognizer:](v7, "addGestureRecognizer:", v19);

  }
  return v7;
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventReportJunkView;
  -[EKEventReportJunkView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[EKEventReportJunkView updateActionText](self, "updateActionText");
}

- (void)updateActionText
{
  EKEventDetailsHighlightControl *control;
  void *v4;
  void *v5;
  id v6;

  control = self->_control;
  EventKitUIBundle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Report Junk…"), &stru_1E601DFA8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventReportJunkView tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailsHighlightControl setActionText:color:](control, "setActionText:color:", v4, v5);

}

- (void)tapped:(id)a3
{
  _BOOL4 v4;
  void *v5;
  EKEventViewController *controller;
  id v7;

  v4 = -[EKEventReportJunkView isLargeDayView](self, "isLargeDayView", a3);
  -[EKEventViewController event](self->_controller, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  controller = self->_controller;
  v7 = v5;
  if (v4)
    PresentJunkAlertDialogForEvent(v5, controller);
  else
    PresentJunkAlertControllerForEvent(v5, controller);

}

- (BOOL)isLargeDayView
{
  return self->_isLargeDayView;
}

- (void)setIsLargeDayView:(BOOL)a3
{
  self->_isLargeDayView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_control, 0);
}

@end
