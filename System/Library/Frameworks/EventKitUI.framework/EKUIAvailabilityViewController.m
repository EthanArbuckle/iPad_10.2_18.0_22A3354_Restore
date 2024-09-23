@implementation EKUIAvailabilityViewController

+ (id)presentAvailabilityViewControllerForEvent:(id)a3 fromViewController:(id)a4
{
  id v5;
  id v6;
  EKUIAvailabilityViewController *v7;
  EKUIAvailabilityNavigationController *v8;

  v5 = a4;
  v6 = a3;
  v7 = -[EKUIAvailabilityViewController initWithEvent:]([EKUIAvailabilityViewController alloc], "initWithEvent:", v6);

  -[EKUIAvailabilityViewController setFromDetail:](v7, "setFromDetail:", 1);
  v8 = -[EKUIAvailabilityNavigationController initWithRootViewController:]([EKUIAvailabilityNavigationController alloc], "initWithRootViewController:", v7);
  -[EKUIAvailabilityViewController preferredContentSize](v7, "preferredContentSize");
  -[EKUIAvailabilityNavigationController setPreferredContentSize:](v8, "setPreferredContentSize:");
  objc_msgSend(v5, "presentViewController:animated:completion:", v8, 1, 0);

  return v7;
}

- (EKUIAvailabilityViewController)initWithEvent:(id)a3
{
  return -[EKUIAvailabilityViewController initWithEvent:isAttendeeProposeTime:proposedStartDate:proposedEndDate:](self, "initWithEvent:isAttendeeProposeTime:proposedStartDate:proposedEndDate:", a3, 0, 0, 0);
}

- (EKUIAvailabilityViewController)initWithEvent:(id)a3 isAttendeeProposeTime:(BOOL)a4 proposedStartDate:(id)a5 proposedEndDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  EKUIAvailabilityViewController *v14;
  EKUIAvailabilityViewController *v15;
  uint64_t v16;
  NSMutableArray *participantAvailabilityViews;
  uint64_t v18;
  NSMutableArray *freeSpanViews;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  NSMutableArray *hourLines;
  uint64_t v28;
  NSOperationQueue *availabilityRequestsQueue;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  EKUIAvailabilityTitleContainerView *titleContainer;
  uint64_t v39;
  NSMutableArray *titleConstraints;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  UIView *largeDateNavContainer;
  uint64_t v46;
  EKUIResizingDateLabel *largeWeekdayLabel;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  uint64_t v52;
  UIButton *previousButton;
  double v54;
  void *v55;
  void *v56;
  uint64_t v57;
  UIButton *nextButton;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSLayoutConstraint *largeNavLeadingConstraint;
  uint64_t v71;
  UIView *dateNavContainer;
  uint64_t v73;
  EKUIResizingDateLabel *weekdayLabel;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  EKUIResizingDateLabel *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  uint64_t v89;
  UIBarButtonItem *topNextTime;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  UIBarButtonItem *topSpacer;
  void *v99;
  uint64_t v100;
  UIBarButtonItem *topSpinner;
  uint64_t v102;
  UIBarButtonItem *doneButton;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  uint64_t v108;
  UIBarButtonItem *bottomSpinner;
  id v110;
  void *v111;
  void *v112;
  uint64_t v113;
  UIBarButtonItem *bottomNextTime;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  objc_super v125;
  _QWORD v126[3];
  _QWORD v127[2];
  const __CFString *v128;
  EKUIResizingDateLabel *v129;
  _QWORD v130[3];
  _QWORD v131[3];
  const __CFString *v132;
  EKUIResizingDateLabel *v133;
  _QWORD v134[3];
  _QWORD v135[5];

  v135[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v125.receiver = self;
  v125.super_class = (Class)EKUIAvailabilityViewController;
  v14 = -[EKUIAvailabilityViewController init](&v125, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_event, a3);
    v15->_isAttendeeProposeTime = a4;
    v15->_availableWidth = 1440.0;
    v16 = objc_opt_new();
    participantAvailabilityViews = v15->_participantAvailabilityViews;
    v15->_participantAvailabilityViews = (NSMutableArray *)v16;

    v18 = objc_opt_new();
    freeSpanViews = v15->_freeSpanViews;
    v15->_freeSpanViews = (NSMutableArray *)v18;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v15, sel__contentSizeCategoryChanged_, *MEMORY[0x1E0DC48E8], 0);

    if (v12)
    {
      v21 = v12;
    }
    else
    {
      objc_msgSend(v11, "startDate");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;
    if (v13)
    {
      v23 = v13;
    }
    else
    {
      objc_msgSend(v11, "endDateUnadjustedForLegacyClients");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;
    v123 = v12;
    v121 = v22;
    if (!a4)
    {
      objc_msgSend(v11, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v15->_modifiedStartDate, v22);
    v25 = v24;
    if (!a4)
    {

      objc_msgSend(v11, "endDateUnadjustedForLegacyClients");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v120 = v24;
    v122 = v13;
    v124 = v11;
    objc_storeStrong((id *)&v15->_modifiedEndDate, v25);
    if (!a4)

    v26 = objc_opt_new();
    hourLines = v15->_hourLines;
    v15->_hourLines = (NSMutableArray *)v26;

    v28 = objc_opt_new();
    availabilityRequestsQueue = v15->_availabilityRequestsQueue;
    v15->_availabilityRequestsQueue = (NSOperationQueue *)v28;

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](v15->_availabilityRequestsQueue, "setName:", v30);

    -[EKUIAvailabilityViewController configureParticipants](v15, "configureParticipants");
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 44.0);
    v15->_rowHeight = v31;
    v32 = (void *)objc_opt_new();
    objc_msgSend(v32, "configureWithTransparentBackground");
    -[EKUIAvailabilityViewController navigationItem](v15, "navigationItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setScrollEdgeAppearance:", v32);

    -[EKUIAvailabilityViewController navigationItem](v15, "navigationItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v32;
    objc_msgSend(v34, "setStandardAppearance:", v32);

    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v15, sel_cancelTapped_);
    -[EKUIAvailabilityViewController navigationItem](v15, "navigationItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setLeftBarButtonItem:", v35);

    v37 = objc_opt_new();
    titleContainer = v15->_titleContainer;
    v15->_titleContainer = (EKUIAvailabilityTitleContainerView *)v37;

    -[EKUIAvailabilityTitleContainerView setTranslatesAutoresizingMaskIntoConstraints:](v15->_titleContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v39 = objc_opt_new();
    titleConstraints = v15->_titleConstraints;
    v15->_titleConstraints = (NSMutableArray *)v39;

    -[EKUIAvailabilityViewController titleContainer](v15, "titleContainer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController navigationItem](v15, "navigationItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setTitleView:", v41);

    v43 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v44 = objc_msgSend(v43, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    largeDateNavContainer = v15->_largeDateNavContainer;
    v15->_largeDateNavContainer = (UIView *)v44;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v15->_largeDateNavContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v46 = objc_opt_new();
    largeWeekdayLabel = v15->_largeWeekdayLabel;
    v15->_largeWeekdayLabel = (EKUIResizingDateLabel *)v46;

    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIResizingDateLabel setFont:](v15->_largeWeekdayLabel, "setFont:", v48);

    -[EKUIResizingDateLabel setTranslatesAutoresizingMaskIntoConstraints:](v15->_largeWeekdayLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v49) = 1132068864;
    -[EKUIResizingDateLabel setContentCompressionResistancePriority:forAxis:](v15->_largeWeekdayLabel, "setContentCompressionResistancePriority:forAxis:", 0, v49);
    -[UIView addSubview:](v15->_largeDateNavContainer, "addSubview:", v15->_largeWeekdayLabel);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.backward"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setImage:", v51);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v50, 0);
    v52 = objc_claimAutoreleasedReturnValue();
    previousButton = v15->_previousButton;
    v15->_previousButton = (UIButton *)v52;

    -[UIButton setAdjustsImageSizeForAccessibilityContentSizeCategory:](v15->_previousButton, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v15->_previousButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v54) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v15->_previousButton, "setContentHuggingPriority:forAxis:", 0, v54);
    -[UIButton addTarget:action:forControlEvents:](v15->_previousButton, "addTarget:action:forControlEvents:", v15);
    -[UIView addSubview:](v15->_largeDateNavContainer, "addSubview:", v15->_previousButton);
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.forward"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setImage:", v56);

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v55, 0);
    v57 = objc_claimAutoreleasedReturnValue();
    nextButton = v15->_nextButton;
    v15->_nextButton = (UIButton *)v57;

    -[UIButton setAdjustsImageSizeForAccessibilityContentSizeCategory:](v15->_nextButton, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 0);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v15->_nextButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v59) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v15->_nextButton, "setContentHuggingPriority:forAxis:", 0, v59);
    -[UIButton addTarget:action:forControlEvents:](v15->_nextButton, "addTarget:action:forControlEvents:", v15);
    -[UIView addSubview:](v15->_largeDateNavContainer, "addSubview:", v15->_nextButton);
    v60 = (void *)MEMORY[0x1E0CB3718];
    v134[0] = CFSTR("prev");
    v135[0] = v15->_previousButton;
    v134[1] = CFSTR("date");
    v135[1] = v15->_largeWeekdayLabel;
    v134[2] = CFSTR("next");
    v135[2] = v15->_nextButton;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v135, v134, 3);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[prev][next][date]|"), 1024, 0, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "activateConstraints:", v62);

    v63 = (void *)MEMORY[0x1E0CB3718];
    v132 = CFSTR("date");
    v133 = v15->_largeWeekdayLabel;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[date]|"), 0, 0, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "activateConstraints:", v65);

    v66 = (void *)MEMORY[0x1E0CB3718];
    -[EKUIAvailabilityViewController previousButton](v15, "previousButton");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController largeDateNavContainer](v15, "largeDateNavContainer");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v67, 5, 0, v68, 5, 1.0, 0.0);
    v69 = objc_claimAutoreleasedReturnValue();
    largeNavLeadingConstraint = v15->_largeNavLeadingConstraint;
    v15->_largeNavLeadingConstraint = (NSLayoutConstraint *)v69;

    -[NSLayoutConstraint setActive:](v15->_largeNavLeadingConstraint, "setActive:", 1);
    v71 = objc_opt_new();
    dateNavContainer = v15->_dateNavContainer;
    v15->_dateNavContainer = (UIView *)v71;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v15->_dateNavContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v73 = objc_opt_new();
    weekdayLabel = v15->_weekdayLabel;
    v15->_weekdayLabel = (EKUIResizingDateLabel *)v73;

    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIResizingDateLabel setFont:](v15->_weekdayLabel, "setFont:", v75);

    -[EKUIResizingDateLabel setTranslatesAutoresizingMaskIntoConstraints:](v15->_weekdayLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIResizingDateLabel setTextAlignment:](v15->_weekdayLabel, "setTextAlignment:", 1);
    LODWORD(v76) = 1132068864;
    -[EKUIResizingDateLabel setContentCompressionResistancePriority:forAxis:](v15->_weekdayLabel, "setContentCompressionResistancePriority:forAxis:", 0, v76);
    -[UIView addSubview:](v15->_dateNavContainer, "addSubview:", v15->_weekdayLabel);
    v118 = v50;
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v50, 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 0);
    objc_msgSend(v77, "addTarget:action:forControlEvents:", v15, sel_previousDayTapped_, 64);
    objc_msgSend(v77, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v15->_dateNavContainer, "addSubview:", v77);
    v117 = v55;
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v55, 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 0);
    objc_msgSend(v78, "addTarget:action:forControlEvents:", v15, sel_nextDayTapped_, 64);
    objc_msgSend(v78, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v15->_dateNavContainer, "addSubview:", v78);
    v79 = (void *)MEMORY[0x1E0CB3718];
    v116 = v77;
    v131[0] = v77;
    v130[0] = CFSTR("prev");
    v130[1] = CFSTR("date");
    v80 = v15->_weekdayLabel;
    v130[2] = CFSTR("next");
    v131[1] = v80;
    v131[2] = v78;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v131, v130, 3);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(>=0)-[prev]-[date]-[next]-(>=0)-|"), 1024, 0, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "activateConstraints:", v82);

    v83 = (void *)MEMORY[0x1E0CB3718];
    v128 = CFSTR("date");
    v129 = v15->_weekdayLabel;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[date]|"), 0, 0, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "activateConstraints:", v85);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15->_weekdayLabel, 9, 0, v15->_dateNavContainer, 9, 1.0, 0.0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setActive:", 1);

    v87 = objc_alloc(MEMORY[0x1E0DC34F0]);
    +[EKUIAvailabilityViewController nextTimeString](EKUIAvailabilityViewController, "nextTimeString");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v87, "initWithTitle:style:target:action:", v88, 0, v15, sel_nextAvailableTimeTapped_);
    topNextTime = v15->_topNextTime;
    v15->_topNextTime = (UIBarButtonItem *)v89;

    if (-[EKUIAvailabilityViewController isAttendeeProposeTime](v15, "isAttendeeProposeTime"))
    {
      -[UIBarButtonItem setEnabled:](v15->_topNextTime, "setEnabled:", 1);
    }
    else
    {
      -[EKUIAvailabilityViewController event](v15, "event");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setEnabled:](v15->_topNextTime, "setEnabled:", objc_msgSend(v91, "isEditable"));

    }
    v92 = (void *)MEMORY[0x1E0C99E60];
    +[EKUIAvailabilityViewController cancelNextTimeString](EKUIAvailabilityViewController, "cancelNextTimeString");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v127[0] = v93;
    +[EKUIAvailabilityViewController nextTimeString](EKUIAvailabilityViewController, "nextTimeString");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v127[1] = v94;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 2);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "setWithArray:", v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setPossibleTitles:](v15->_topNextTime, "setPossibleTitles:", v96);

    objc_msgSend(MEMORY[0x1E0DC34F0], "fixedSpaceItemOfWidth:", 15.0);
    v97 = objc_claimAutoreleasedReturnValue();
    topSpacer = v15->_topSpacer;
    v15->_topSpacer = (UIBarButtonItem *)v97;

    v99 = (void *)objc_opt_new();
    objc_msgSend(v99, "startAnimating");
    v100 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v99);
    topSpinner = v15->_topSpinner;
    v15->_topSpinner = (UIBarButtonItem *)v100;

    v102 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v15, sel_doneTapped_);
    doneButton = v15->_doneButton;
    v15->_doneButton = (UIBarButtonItem *)v102;

    if (-[EKUIAvailabilityViewController isAttendeeProposeTime](v15, "isAttendeeProposeTime"))
    {
      -[UIBarButtonItem setEnabled:](v15->_doneButton, "setEnabled:", 1);
    }
    else
    {
      -[EKUIAvailabilityViewController event](v15, "event");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setEnabled:](v15->_doneButton, "setEnabled:", objc_msgSend(v104, "isEditable"));

    }
    v126[0] = v15->_doneButton;
    v126[1] = v15->_topSpacer;
    v126[2] = v15->_topSpinner;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 3);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController navigationItem](v15, "navigationItem");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setRightBarButtonItems:", v105);

    v107 = (void *)objc_opt_new();
    objc_msgSend(v107, "startAnimating");
    v108 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v107);
    bottomSpinner = v15->_bottomSpinner;
    v15->_bottomSpinner = (UIBarButtonItem *)v108;

    v110 = objc_alloc(MEMORY[0x1E0DC34F0]);
    EventKitUIBundle();
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "localizedStringForKey:value:table:", CFSTR("Next Available Time"), &stru_1E601DFA8, 0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v110, "initWithTitle:style:target:action:", v112, 0, v15, sel_nextAvailableTimeTapped_);
    bottomNextTime = v15->_bottomNextTime;
    v15->_bottomNextTime = (UIBarButtonItem *)v113;

    v15->_fetchingData = 1;
    v12 = v123;
    v11 = v124;
    v13 = v122;
  }

  return v15;
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  +[EKUILargeTextUtilities clearCache](EKUILargeTextUtilities, "clearCache", a3);
}

+ (id)nextTimeString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Next Available Time"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)cancelNextTimeString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Stop Searching"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 18.0);
  v4 = v3 + 13.0;
  -[EKUIAvailabilityViewController participants](self, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = 5;
  if (v6 > 5)
    v7 = v6;
  v8 = (double)v7;
  -[EKUIAvailabilityViewController rowHeight](self, "rowHeight");
  v10 = v4 + v8 * v9;
  v11 = 880.0;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[EKUIAvailabilityViewController preferredContentSize](self, "preferredContentSize");
  -[EKUIAvailabilityViewController sizeWillBeCompact:](self, "sizeWillBeCompact:", width < v8);
  v9.receiver = self;
  v9.super_class = (Class)EKUIAvailabilityViewController;
  -[EKUIAvailabilityViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  -[EKUIAvailabilityViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[EKUIAvailabilityViewController preferredContentSize](self, "preferredContentSize");
  -[EKUIAvailabilityViewController sizeWillBeCompact:](self, "sizeWillBeCompact:", v5 < v6);

  v7.receiver = self;
  v7.super_class = (Class)EKUIAvailabilityViewController;
  -[EKUIAvailabilityViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
}

- (void)sizeWillBeCompact:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  v3 = a3;
  if (-[EKUIAvailabilityViewController compact](self, "compact") != a3)
  {
    -[EKUIAvailabilityViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKUIAvailabilityParticipantList listWidthForCompact:orientation:](EKUIAvailabilityParticipantList, "listWidthForCompact:orientation:", v3, EKUIInterfaceOrientationForViewHierarchy(v6));
    v8 = v7;
    -[EKUIAvailabilityViewController participantWidthConstraint](self, "participantWidthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", v8);

    -[EKUIAvailabilityViewController setCompact:](self, "setCompact:", v3);
    -[EKUIAvailabilityViewController configureNavBarAndToolBar](self, "configureNavBarAndToolBar");
    -[EKUIAvailabilityViewController layout](self, "layout");
  }
}

+ (double)defaultTimelineHeight
{
  double v2;

  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 18.0);
  return v2 + 68.0;
}

- (void)configureNavBarAndToolBar
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD v87[5];
  _QWORD v88[3];
  _QWORD v89[3];
  const __CFString *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  void *v98;
  _QWORD v99[3];
  _QWORD v100[5];

  v100[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[EKUIAvailabilityViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:animated:", -[EKUIAvailabilityViewController compact](self, "compact") ^ 1, 0);

  v5 = -[EKUIAvailabilityViewController searchingForNextAvailableTime](self, "searchingForNextAvailableTime");
  -[EKUIAvailabilityViewController topNextTime](self, "topNextTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[EKUIAvailabilityViewController cancelNextTimeString](EKUIAvailabilityViewController, "cancelNextTimeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

    -[EKUIAvailabilityViewController bottomNextTime](self, "bottomNextTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKUIAvailabilityViewController cancelNextTimeString](EKUIAvailabilityViewController, "cancelNextTimeString");
  }
  else
  {
    +[EKUIAvailabilityViewController nextTimeString](EKUIAvailabilityViewController, "nextTimeString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v9);

    -[EKUIAvailabilityViewController bottomNextTime](self, "bottomNextTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKUIAvailabilityViewController nextTimeString](EKUIAvailabilityViewController, "nextTimeString");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v10);

  -[EKUIAvailabilityViewController dateNavContainer](self, "dateNavContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeFromSuperview");

  -[EKUIAvailabilityViewController largeDateNavContainer](self, "largeDateNavContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFromSuperview");

  v13 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIAvailabilityViewController titleConstraints](self, "titleConstraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deactivateConstraints:", v14);

  -[EKUIAvailabilityViewController titleConstraints](self, "titleConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  +[EKUIAvailabilityViewController defaultTimelineHeight](EKUIAvailabilityViewController, "defaultTimelineHeight");
  v17 = v16;
  -[EKUIAvailabilityViewController timelineHeightConstraint](self, "timelineHeightConstraint");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", v17);

  if (-[EKUIAvailabilityViewController compact](self, "compact"))
  {
    objc_msgSend(v3, "configureWithDefaultBackground");
    if (-[EKUIAvailabilityViewController fetchingData](self, "fetchingData")
      && !-[EKUIAvailabilityViewController searchingForNextAvailableTime](self, "searchingForNextAvailableTime"))
    {
      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v100[0] = v19;
      -[EKUIAvailabilityViewController bottomSpinner](self, "bottomSpinner");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v100[1] = v20;
      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v100[2] = v21;
      v22 = v100;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v99[0] = v19;
      -[EKUIAvailabilityViewController bottomNextTime](self, "bottomNextTime");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v99[1] = v20;
      objc_msgSend(MEMORY[0x1E0DC34F0], "flexibleSpaceItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v99[2] = v21;
      v22 = v99;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v41, 1);

    -[EKUIAvailabilityViewController navigationItem](self, "navigationItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController doneButton](self, "doneButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setRightBarButtonItems:animated:", v44, 0);

    v35 = (void *)objc_opt_new();
    objc_msgSend(v35, "configureWithOpaqueBackground");
    -[EKUIAvailabilityViewController navigationController](self, "navigationController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "toolbar");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setScrollEdgeAppearance:", v35);

    -[EKUIAvailabilityViewController navigationController](self, "navigationController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "toolbar");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setStandardAppearance:", v35);

    -[EKUIAvailabilityViewController navigationController](self, "navigationController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "toolbar");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setCompactAppearance:", v35);

    -[EKUIAvailabilityViewController navigationController](self, "navigationController");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "toolbar");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setScrollEdgeAppearance:", v35);

    -[EKUIAvailabilityViewController navigationController](self, "navigationController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "toolbar");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setTranslucent:", 0);

    -[EKUIAvailabilityViewController titleContainer](self, "titleContainer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "frame");
    v57 = v56;
    -[EKUIAvailabilityViewController weekdayLabel](self, "weekdayLabel");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "minDateLabelWidth");
    v60 = v59 + 100.0;

    if (v57 >= v60)
    {
      -[EKUIAvailabilityViewController navigationItem](self, "navigationItem");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "_setBottomPalette:", 0);

      -[EKUIAvailabilityViewController titleContainer](self, "titleContainer");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIAvailabilityViewController dateNavContainer](self, "dateNavContainer");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "addSubview:", v73);

    }
    else
    {
      -[EKUIAvailabilityViewController palette](self, "palette");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v61)
      {
        v62 = objc_alloc_init(MEMORY[0x1E0DC4290]);
        -[EKUIAvailabilityViewController setPalette:](self, "setPalette:", v62);

        -[EKUIAvailabilityViewController palette](self, "palette");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setPreferredHeight:", 40.0);

      }
      -[EKUIAvailabilityViewController palette](self, "palette");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIAvailabilityViewController navigationItem](self, "navigationItem");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "_setBottomPalette:", v64);

      -[EKUIAvailabilityViewController palette](self, "palette");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "contentView");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIAvailabilityViewController dateNavContainer](self, "dateNavContainer");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "addSubview:", v68);

      +[EKUIAvailabilityViewController defaultTimelineHeight](EKUIAvailabilityViewController, "defaultTimelineHeight");
      v70 = v69 + 40.0;
      -[EKUIAvailabilityViewController timelineHeightConstraint](self, "timelineHeightConstraint");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setConstant:", v70);
    }

    -[EKUIAvailabilityViewController titleConstraints](self, "titleConstraints");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = (void *)MEMORY[0x1E0CB3718];
    v96 = CFSTR("date");
    -[EKUIAvailabilityViewController dateNavContainer](self, "dateNavContainer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v76;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[date]|"), 0, 0, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addObjectsFromArray:", v78);

    -[EKUIAvailabilityViewController titleConstraints](self, "titleConstraints");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)MEMORY[0x1E0CB3718];
    v94 = CFSTR("date");
    -[EKUIAvailabilityViewController dateNavContainer](self, "dateNavContainer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[date]|"), 0, 0, v38);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObjectsFromArray:", v80);
  }
  else
  {
    objc_msgSend(v3, "configureWithTransparentBackground");
    -[EKUIAvailabilityViewController titleContainer](self, "titleContainer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController largeDateNavContainer](self, "largeDateNavContainer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v24);

    -[EKUIAvailabilityViewController titleConstraints](self, "titleConstraints");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x1E0CB3718];
    v92 = CFSTR("date");
    -[EKUIAvailabilityViewController largeDateNavContainer](self, "largeDateNavContainer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[date]|"), 0, 0, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObjectsFromArray:", v29);

    -[EKUIAvailabilityViewController titleConstraints](self, "titleConstraints");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CB3718];
    v90 = CFSTR("date");
    -[EKUIAvailabilityViewController largeDateNavContainer](self, "largeDateNavContainer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[date]|"), 0, 0, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObjectsFromArray:", v34);

    if (-[EKUIAvailabilityViewController fetchingData](self, "fetchingData")
      && !-[EKUIAvailabilityViewController searchingForNextAvailableTime](self, "searchingForNextAvailableTime"))
    {
      -[EKUIAvailabilityViewController navigationItem](self, "navigationItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIAvailabilityViewController doneButton](self, "doneButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = v36;
      -[EKUIAvailabilityViewController topSpacer](self, "topSpacer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v89[1] = v37;
      -[EKUIAvailabilityViewController topSpinner](self, "topSpinner");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v89[2] = v38;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = v89;
    }
    else
    {
      -[EKUIAvailabilityViewController navigationItem](self, "navigationItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIAvailabilityViewController doneButton](self, "doneButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v88[0] = v36;
      -[EKUIAvailabilityViewController topSpacer](self, "topSpacer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v88[1] = v37;
      -[EKUIAvailabilityViewController topNextTime](self, "topNextTime");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v88[2] = v38;
      v39 = (void *)MEMORY[0x1E0C99D20];
      v40 = v88;
    }
    objc_msgSend(v39, "arrayWithObjects:count:", v40, 3);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setRightBarButtonItems:animated:", v80, 1);
  }

  v81 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIAvailabilityViewController titleConstraints](self, "titleConstraints");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "activateConstraints:", v82);

  -[EKUIAvailabilityViewController navigationItem](self, "navigationItem");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setScrollEdgeAppearance:", v3);

  -[EKUIAvailabilityViewController navigationItem](self, "navigationItem");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setStandardAppearance:", v3);

  -[EKUIAvailabilityViewController navigationItem](self, "navigationItem");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setCompactAppearance:", v3);

  -[EKUIAvailabilityViewController navigationItem](self, "navigationItem");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setCompactScrollEdgeAppearance:", v3);

  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __59__EKUIAvailabilityViewController_configureNavBarAndToolBar__block_invoke;
  v87[3] = &unk_1E6018688;
  v87[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], v87);
  -[EKUIAvailabilityViewController configureUnavailableStateForEvent](self, "configureUnavailableStateForEvent");

}

uint64_t __59__EKUIAvailabilityViewController_configureNavBarAndToolBar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layout");
}

- (void)cancelTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[EKUIAvailabilityViewController availabilityRequestsQueue](self, "availabilityRequestsQueue", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllOperations");

  -[EKEditItemViewController editDelegate](self, "editDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[EKEditItemViewController editDelegate](self, "editDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "editItemViewController:didCompleteWithAction:", self, 0);
  }
  else
  {
    -[EKUIAvailabilityViewController presentingViewController](self, "presentingViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)nextDayTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingDays:inCalendar:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController setDate:](self, "setDate:", v5);

}

- (void)previousDayTapped:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingDays:inCalendar:", -1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController setDate:](self, "setDate:", v5);

}

- (void)nextAvailableTimeTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[EKUIAvailabilityViewController searchingForNextAvailableTime](self, "searchingForNextAvailableTime", a3))
  {
    -[EKUIAvailabilityViewController setSearchingForNextAvailableTime:](self, "setSearchingForNextAvailableTime:", 0);
    -[EKUIAvailabilityViewController configureNavBarAndToolBar](self, "configureNavBarAndToolBar");
  }
  else
  {
    -[EKUIAvailabilityViewController setSearchingForNextAvailableTime:](self, "setSearchingForNextAvailableTime:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateForStartOfDayInTimeZone:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v7, "isBeforeDate:", v8);

    if ((_DWORD)v5)
    {
      -[EKUIAvailabilityViewController setDate:](self, "setDate:", v8);
    }
    else if (!-[EKUIAvailabilityViewController fetchingData](self, "fetchingData"))
    {
      -[EKUIAvailabilityViewController findNextFreeSpan](self, "findNextFreeSpan");
    }

  }
}

- (void)doneTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  int v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  EKUIAvailabilityViewController *v21;
  id v22;
  void (**v23)(_QWORD);
  _QWORD aBlock[5];

  v4 = a3;
  -[EKUIAvailabilityViewController availabilityRequestsQueue](self, "availabilityRequestsQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelAllOperations");

  -[EKUIAvailabilityViewController modifiedStartDate](self, "modifiedStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EKUIAvailabilityViewController isAttendeeProposeTime](self, "isAttendeeProposeTime");
  -[EKUIAvailabilityViewController event](self, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "proposedStartDate");
  else
    objc_msgSend(v8, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "isEqualToDate:", v10);

  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__EKUIAvailabilityViewController_doneTapped___block_invoke;
  aBlock[3] = &unk_1E6018688;
  aBlock[4] = self;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (!-[EKUIAvailabilityViewController isAttendeeProposeTime](self, "isAttendeeProposeTime")
    && -[EKUIAvailabilityViewController fromDetail](self, "fromDetail")
    && (v14 = v11 ^ 1,
        -[EKUIAvailabilityViewController event](self, "event"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "hasChanges") | v14,
        v15,
        v16 == 1))
  {
    -[EKUIAvailabilityViewController event](self, "event");
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __45__EKUIAvailabilityViewController_doneTapped___block_invoke_2;
    v19[3] = &unk_1E6019358;
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v21 = self;
    v22 = v4;
    v23 = v13;
    v17 = v20;
    v18 = +[EKUISendInviteAlertController presentInviteAlertWithOptions:viewController:withCompletionHandler:](EKUISendInviteAlertController, "presentInviteAlertWithOptions:viewController:withCompletionHandler:", 4, self, v19);

  }
  else
  {
    v13[2](v13);
  }

}

void __45__EKUIAvailabilityViewController_doneTapped___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "editDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "saveAndDismiss");
  }
  else
  {
    objc_msgSend(v3, "presentingViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

void __45__EKUIAvailabilityViewController_doneTapped___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "rollback");
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  if (a2)
    return;
  objc_msgSend(*(id *)(a1 + 40), "modifiedStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStartDate:", v3);

  objc_msgSend(*(id *)(a1 + 40), "modifiedEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEndDateUnadjustedForLegacyClients:", v4);

  if (!objc_msgSend(*(id *)(a1 + 32), "isOrWasPartOfRecurringSeries"))
  {
    objc_msgSend(*(id *)(a1 + 40), "saveBlock");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, *(_QWORD *)(a1 + 32), 0);

    goto LABEL_8;
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  v20 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__EKUIAvailabilityViewController_doneTapped___block_invoke_118;
  v11[3] = &unk_1E601AC78;
  v11[4] = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 56);
  v14 = &v15;
  +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:", 0, v6, v5, v12, v11);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v16[5];
  v16[5] = v8;

  _Block_object_dispose(&v15, 8);
}

void __45__EKUIAvailabilityViewController_doneTapped___block_invoke_118(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if ((unint64_t)(a2 - 3) >= 3)
  {
    v13 = v3;
    v14 = v2;
    if (a2 == 2)
      v9 = 2;
    else
      v9 = a2 == 1;
    objc_msgSend(*(id *)(a1 + 32), "saveBlock", v5, v4, v13, v14, v6, v7);
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, *(_QWORD *)(a1 + 40), v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

  }
}

- (void)loadView
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  EKUIAvailabilityParticipantList *v42;
  void *v43;
  EKUIAvailabilityParticipantList *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  _QWORD v104[5];
  _QWORD v105[6];

  v105[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  objc_msgSend(v8, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  v99 = v8;
  -[EKUIAvailabilityViewController setView:](self, "setView:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setHidden:", 1);
  objc_msgSend(v10, "setNumberOfLines:", 3);
  objc_msgSend(v10, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v12);

  objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);
  -[EKUIAvailabilityViewController setUnavailableLabel:](self, "setUnavailableLabel:", v10);
  -[EKUIAvailabilityViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v10);

  v14 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIAvailabilityViewController view](self, "view");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 9, 0, v102, 9, 1.0, 0.0);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v105[0] = v100;
  v15 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIAvailabilityViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 10, 0, v16, 10, 1.0, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v17;
  v18 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIAvailabilityViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 5, 0, v19, 5, 1.0, 16.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v105[2] = v20;
  v21 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIAvailabilityViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v10;
  objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10, 3, 0, v22, 3, 1.0, 16.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v105[3] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v24);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v25, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v26);

  -[EKUIAvailabilityViewController setContainerView:](self, "setContainerView:", v25);
  -[EKUIAvailabilityViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController containerView](self, "containerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", v28);

  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKUIAvailabilityViewController setScrollView:](self, "setScrollView:", v29);
  objc_msgSend(v29, "setDelegate:", self);
  objc_msgSend(v29, "setBounces:", 0);
  objc_msgSend(v25, "addSubview:", v29);
  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setBackgroundColor:", v31);

  objc_msgSend(v25, "addSubview:", v30);
  v32 = (void *)objc_opt_new();
  EventKitUIBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("INVITEES"), &stru_1E601DFA8, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setText:", v34);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFont:", v35);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTextColor:", v36);

  objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v32, "setAdjustsFontForContentSizeCategory:", 1);
  LODWORD(v37) = 1148846080;
  objc_msgSend(v32, "setContentHuggingPriority:forAxis:", 0, v37);
  v101 = v32;
  objc_msgSend(v30, "addSubview:", v32);
  v38 = (void *)objc_opt_new();
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setBackgroundColor:", v39);

  objc_msgSend(v38, "setHidden:", 1);
  v103 = v30;
  objc_msgSend(v30, "addSubview:", v38);
  -[EKUIAvailabilityViewController setParticipantDivider:](self, "setParticipantDivider:", v38);
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_singleTap_);
  objc_msgSend(v40, "setNumberOfTapsRequired:", 1);
  if (-[EKUIAvailabilityViewController isAttendeeProposeTime](self, "isAttendeeProposeTime"))
  {
    objc_msgSend(v40, "setEnabled:", 1);
  }
  else
  {
    -[EKUIAvailabilityViewController event](self, "event");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setEnabled:", objc_msgSend(v41, "isEditable"));

  }
  objc_msgSend(v40, "setCancelsTouchesInView:", 0);
  v95 = v40;
  objc_msgSend(v29, "addGestureRecognizer:", v40);
  v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", self, sel_viewPinched_);
  objc_msgSend(v29, "addGestureRecognizer:");
  v42 = [EKUIAvailabilityParticipantList alloc];
  -[EKUIAvailabilityViewController participants](self, "participants");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[EKUIAvailabilityParticipantList initWithParticipants:viewController:](v42, "initWithParticipants:viewController:", v43, self);

  -[EKUIAvailabilityViewController setParticipantList:](self, "setParticipantList:", v44);
  -[EKUIAvailabilityParticipantList setDelegate:](v44, "setDelegate:", self);
  -[EKUIAvailabilityParticipantList setBounces:](v44, "setBounces:", 0);
  -[EKUIAvailabilityParticipantList setShowsVerticalScrollIndicator:](v44, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityParticipantList setBackgroundColor:](v44, "setBackgroundColor:", v45);

  objc_msgSend(v25, "addSubview:", v44);
  v46 = (void *)objc_opt_new();
  objc_msgSend(v46, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setBackgroundColor:", v47);

  objc_msgSend(v25, "addSubview:", v46);
  v48 = (void *)objc_opt_new();
  objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setBackgroundColor:", v49);

  objc_msgSend(v48, "setDelegate:", self);
  objc_msgSend(v48, "setBounces:", 0);
  objc_msgSend(v48, "setShowsHorizontalScrollIndicator:", 0);
  -[EKUIAvailabilityViewController setTimelineView:](self, "setTimelineView:", v48);
  v97 = v25;
  objc_msgSend(v25, "addSubview:", v48);
  v96 = v38;
  v93 = v46;
  _NSDictionaryOfVariableBindings(CFSTR("scrollView,participantList,timeLine,participantListHeader,participantListDivider,participantDivider,inviteesLabel"), v29, v44, v48, v30, v46, v38, v101, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityParticipantList setTranslatesAutoresizingMaskIntoConstraints:](v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKUIAvailabilityParticipantList setTranslatesAutoresizingMaskIntoConstraints:](v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v51 = (void *)MEMORY[0x1E0CB3718];
  -[EKUIAvailabilityViewController view](self, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "window");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIAvailabilityParticipantList listWidthForCompact:orientation:](EKUIAvailabilityParticipantList, "listWidthForCompact:orientation:", 0, EKUIInterfaceOrientationForViewHierarchy(v53));
  objc_msgSend(v51, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v44, 7, 0, 0, 0, 1.0, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController setParticipantWidthConstraint:](self, "setParticipantWidthConstraint:", v55);

  -[EKUIAvailabilityViewController participantWidthConstraint](self, "participantWidthConstraint");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v30, 7, 0, v44, 7, 1.0, 0.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 1);

  v58 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[participantListHeader][timeLine]|"), 0, &unk_1E606FBB0, v50);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "activateConstraints:", v59);

  v60 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[participantList][scrollView]|"), 0, &unk_1E606FBB0, v50);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "activateConstraints:", v61);

  objc_msgSend(v101, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "safeAreaLayoutGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v66, "setConstant:", 22.0);
  objc_msgSend(v66, "setActive:", 1);
  v67 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[inviteesLabel]-(11)-|"), 0, &unk_1E606FBB0, v50);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "activateConstraints:", v68);

  v69 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[participantDivider]|"), 0, &unk_1E606FBB0, v50);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "activateConstraints:", v70);

  v71 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[participantDivider(==dividerWidth)]-(dividerWidth)-|"), 0, &unk_1E606FBB0, v50);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "activateConstraints:", v72);

  v73 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[participantListDivider]|"), 0, &unk_1E606FBB0, v50);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "activateConstraints:", v74);

  v75 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:[participantListDivider(==dividerWidth)][scrollView]"), 0, &unk_1E606FBB0, v50);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "activateConstraints:", v76);

  v77 = (void *)MEMORY[0x1E0CB3718];
  +[EKUIAvailabilityViewController defaultTimelineHeight](EKUIAvailabilityViewController, "defaultTimelineHeight");
  objc_msgSend(v77, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v48, 8, 0, 0, 0, 1.0, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController setTimelineHeightConstraint:](self, "setTimelineHeightConstraint:", v79);

  -[EKUIAvailabilityViewController timelineHeightConstraint](self, "timelineHeightConstraint");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setActive:", 1);

  v81 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[timeLine][scrollView]|"), 0, &unk_1E606FBB0, v50);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "activateConstraints:", v82);

  v83 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[participantListHeader][participantList]|"), 0, &unk_1E606FBB0, v50);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "activateConstraints:", v84);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v103, 8, 0, v48, 8, 1.0, 0.0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setActive:", 1);

  v86 = 23;
  do
  {
    v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setBackgroundColor:", v88);

    -[EKUIAvailabilityViewController scrollView](self, "scrollView");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "addSubview:", v87);

    -[EKUIAvailabilityViewController hourLines](self, "hourLines");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "addObject:", v87);

    --v86;
  }
  while (v86);
  -[EKUIAvailabilityViewController participants](self, "participants");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = MEMORY[0x1E0C809B0];
  v104[1] = 3221225472;
  v104[2] = __42__EKUIAvailabilityViewController_loadView__block_invoke;
  v104[3] = &unk_1E601ACA0;
  v104[4] = self;
  objc_msgSend(v91, "enumerateObjectsUsingBlock:", v104);

  -[EKUIAvailabilityViewController updateForContentCategory](self, "updateForContentCategory");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "addObserver:selector:name:object:", self, sel_contentCategorySizeChanged_, *MEMORY[0x1E0DC48E8], 0);

}

void __42__EKUIAvailabilityViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  EKUIAvailabilityRowView *v6;

  v3 = a2;
  v6 = -[EKUIAvailabilityRowView initWithParticipant:]([EKUIAvailabilityRowView alloc], "initWithParticipant:", v3);

  objc_msgSend(*(id *)(a1 + 32), "participantAvailabilityViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v6);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKUIAvailabilityViewController;
  -[EKEditItemViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[EKUIAvailabilityViewController configureUnavailableStateForEvent](self, "configureUnavailableStateForEvent");
}

- (void)configureUnavailableStateForEvent
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CA9FE8];
  -[EKUIAvailabilityViewController event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "availabilityPanelVisibilityForEvent:", v4);

  switch(v5)
  {
    case 0:
      -[EKUIAvailabilityViewController setAvailabilityPanelAvailable:unavailableMessage:](self, "setAvailabilityPanelAvailable:unavailableMessage:", 1, 0);
      return;
    case 1:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      v7 = CFSTR("No event is selected.");
      goto LABEL_9;
    case 2:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      v7 = CFSTR("This calendar does not support availability.");
      goto LABEL_9;
    case 3:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      v7 = CFSTR("You cannot see availability for all-day events.");
      goto LABEL_9;
    case 4:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      v7 = CFSTR("You cannot see availability for events spanning multiple days.");
      goto LABEL_9;
    case 5:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      v7 = CFSTR("You can only see availability for events with invitees.");
      goto LABEL_9;
    case 6:
      EventKitUIBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v6;
      v7 = CFSTR("You cannot see the status of attendees.");
LABEL_9:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E601DFA8, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIAvailabilityViewController setAvailabilityPanelAvailable:unavailableMessage:](self, "setAvailabilityPanelAvailable:unavailableMessage:", 0, v8);

      break;
    default:
      return;
  }
}

- (void)setAvailabilityPanelAvailable:(BOOL)a3 unavailableMessage:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v16 = a4;
  -[EKUIAvailabilityViewController unavailableLabel](self, "unavailableLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "setHidden:", 1);

    -[UIButton setEnabled:](self->_previousButton, "setEnabled:", 1);
    -[UIButton setEnabled:](self->_nextButton, "setEnabled:", 1);
    if (-[EKUIAvailabilityViewController isAttendeeProposeTime](self, "isAttendeeProposeTime"))
    {
      -[UIBarButtonItem setEnabled:](self->_topNextTime, "setEnabled:", 1);
    }
    else
    {
      -[EKUIAvailabilityViewController event](self, "event");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setEnabled:](self->_topNextTime, "setEnabled:", objc_msgSend(v13, "isEditable"));

    }
    if (-[EKUIAvailabilityViewController isAttendeeProposeTime](self, "isAttendeeProposeTime"))
    {
      -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 1);
    }
    else
    {
      -[EKUIAvailabilityViewController event](self, "event");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", objc_msgSend(v14, "isEditable"));

    }
    -[EKUIAvailabilityViewController containerView](self, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 0);

    -[EKUIAvailabilityViewController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[EKUIAvailabilityViewController compact](self, "compact") ^ 1;
    v10 = v11;
  }
  else
  {
    objc_msgSend(v6, "setHidden:", 0);

    -[EKUIAvailabilityViewController unavailableLabel](self, "unavailableLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v16);

    -[UIButton setEnabled:](self->_previousButton, "setEnabled:", 0);
    -[UIButton setEnabled:](self->_nextButton, "setEnabled:", 0);
    -[UIBarButtonItem setEnabled:](self->_topNextTime, "setEnabled:", 0);
    -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 0);
    -[EKUIAvailabilityViewController containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    -[EKUIAvailabilityViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 1;
  }
  objc_msgSend(v10, "setToolbarHidden:animated:", v12, 0);

}

- (void)updateForContentCategory
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  -[EKUIAvailabilityViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0DC4900];

  if ((unint64_t)v4 <= v5)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 18.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController weekdayLabel](self, "weekdayLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v10);

    v8 = (void *)MEMORY[0x1E0DC1350];
    v9 = 18.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 22.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController weekdayLabel](self, "weekdayLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    v8 = (void *)MEMORY[0x1E0DC1350];
    v9 = 22.0;
  }
  objc_msgSend(v8, "boldSystemFontOfSize:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController largeWeekdayLabel](self, "largeWeekdayLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  +[EKUIAvailabilityViewController defaultTimelineHeight](EKUIAvailabilityViewController, "defaultTimelineHeight");
  v15 = v14;
  -[EKUIAvailabilityViewController timelineHeightConstraint](self, "timelineHeightConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConstant:", v15);

  -[EKUIAvailabilityViewController timelineView](self, "timelineView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLabels");

  -[EKUIAvailabilityViewController view](self, "view");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNeedsLayout");

}

- (void)configureParticipants
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D0CD20];
  -[EKUIAvailabilityViewController event](self, "event");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "participantsForAvailabilityViewControllerFromEvent:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController setParticipants:](self, "setParticipants:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIAvailabilityViewController;
  -[EKEditItemViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[EKUIAvailabilityViewController modifiedStartDate](self, "modifiedStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController setDate:](self, "setDate:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUIAvailabilityViewController;
  -[EKUIAvailabilityViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[EKUIAvailabilityViewController modifiedStartDate](self, "modifiedStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EKUIAvailabilityViewController updateCurrentEventAtTime:](self, "updateCurrentEventAtTime:", v4);

  if (!v5)
  {
    -[EKUIAvailabilityViewController scrollView](self, "scrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentOffset:", 510.0, 0.0);

  }
}

- (void)layout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  char IsLeftToRight;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t i;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[6];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  -[EKUIAvailabilityViewController weekdayLabel](self, "weekdayLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutSubviews");

  -[EKUIAvailabilityViewController largeWeekdayLabel](self, "largeWeekdayLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutSubviews");

  -[EKUIAvailabilityViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = EKUIInterfaceOrientationForViewHierarchy(v6);

  if (!-[EKUIAvailabilityViewController compact](self, "compact"))
  {
    if (CalInterfaceIsLeftToRight())
    {
      +[EKUIAvailabilityParticipantList listWidthForCompact:orientation:](EKUIAvailabilityParticipantList, "listWidthForCompact:orientation:", 0, v7);
      v9 = v8;
    }
    else
    {
      -[EKUIAvailabilityViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;
      +[EKUIAvailabilityParticipantList listWidthForCompact:orientation:](EKUIAvailabilityParticipantList, "listWidthForCompact:orientation:", 0, v7);
      v9 = v12 - v13;

    }
    -[EKUIAvailabilityViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController largeDateNavContainer](self, "largeDateNavContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertPoint:toView:", v15, v9, 0.0);
    v17 = v16;

    IsLeftToRight = CalInterfaceIsLeftToRight();
    if ((IsLeftToRight & 1) == 0)
    {
      -[EKUIAvailabilityViewController largeDateNavContainer](self, "largeDateNavContainer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      v17 = v19 - v17;
    }
    -[EKUIAvailabilityViewController largeNavLeadingConstraint](self, "largeNavLeadingConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setConstant:", v17);

    if ((IsLeftToRight & 1) == 0)
  }
  -[EKUIAvailabilityViewController participantAvailabilityViews](self, "participantAvailabilityViews");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (double)(unint64_t)objc_msgSend(v21, "count");
  -[EKUIAvailabilityViewController rowHeight](self, "rowHeight");
  v24 = v23 * v22;

  -[EKUIAvailabilityViewController participantList](self, "participantList");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController rowHeight](self, "rowHeight");
  objc_msgSend(v25, "setRowHeight:");

  +[EKUIAvailabilityParticipantList listWidthForCompact:orientation:](EKUIAvailabilityParticipantList, "listWidthForCompact:orientation:", -[EKUIAvailabilityViewController compact](self, "compact"), v7);
  v27 = v26;
  -[EKUIAvailabilityViewController participantList](self, "participantList");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setContentSize:", v27, v24);

  -[EKUIAvailabilityViewController timelineView](self, "timelineView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController timelineWidth](self, "timelineWidth");
  objc_msgSend(v29, "setContentWidth:");

  -[EKUIAvailabilityViewController hourLines](self, "hourLines");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __40__EKUIAvailabilityViewController_layout__block_invoke;
  v69[3] = &unk_1E601ACC8;
  v69[4] = self;
  *(double *)&v69[5] = v24;
  objc_msgSend(v30, "enumerateObjectsUsingBlock:", v69);

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[EKUIAvailabilityViewController participantAvailabilityViews](self, "participantAvailabilityViews");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v66;
    v35 = 0.0;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v66 != v34)
          objc_enumerationMutation(v31);
        v37 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        -[EKUIAvailabilityViewController availableWidth](self, "availableWidth");
        v39 = v38;
        -[EKUIAvailabilityViewController rowHeight](self, "rowHeight");
        objc_msgSend(v37, "setFrame:", 0.0, v35, v39, v40);
        -[EKUIAvailabilityViewController rowHeight](self, "rowHeight");
        v35 = v35 + v41;
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v33);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[EKUIAvailabilityViewController freeSpanViews](self, "freeSpanViews", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v62 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        objc_msgSend(v47, "startDate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "endDate");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIAvailabilityViewController frameForFreeSpanViewAtStart:endDate:duration:](self, "frameForFreeSpanViewAtStart:endDate:duration:", v48, v49, 0.0);
        objc_msgSend(v47, "setFrame:");

        objc_msgSend(v47, "setNeedsDisplay");
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v44);
  }

  -[EKUIAvailabilityViewController eventTime](self, "eventTime");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController eventTime](self, "eventTime");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "startDate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController event](self, "event");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "duration");
  -[EKUIAvailabilityViewController frameForFreeSpanViewAtStart:endDate:duration:](self, "frameForFreeSpanViewAtStart:endDate:duration:", v52, 0);
  objc_msgSend(v50, "setFrame:");

  -[EKUIAvailabilityViewController availableWidth](self, "availableWidth");
  v55 = v54;
  -[EKUIAvailabilityViewController participantAvailabilityViews](self, "participantAvailabilityViews");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (double)(unint64_t)objc_msgSend(v56, "count");
  -[EKUIAvailabilityViewController rowHeight](self, "rowHeight");
  v59 = v58 * v57;
  -[EKUIAvailabilityViewController scrollView](self, "scrollView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setContentSize:", v55, v59);

}

void __40__EKUIAvailabilityViewController_layout__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v5 = *(void **)(a1 + 32);
  v13 = a2;
  objc_msgSend(v5, "timelineWidth");
  v7 = (double)(unint64_t)(a3 + 1) / 24.0 * v6 + -0.5;
  v8 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  if (v8 >= v11)
    v12 = v8;
  else
    v12 = v11;
  objc_msgSend(v13, "setFrame:", v7, 0.0, 0.5, v12);

}

- (void)setDate:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[EKUIAvailabilityViewController event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZone");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateForStartOfDayInTimeZone:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "isEqualToDate:", v7);

  if ((v5 & 1) == 0)
  {
    -[EKUIAvailabilityViewController setCurrentStartDate:](self, "setCurrentStartDate:", v6);
    -[EKUIAvailabilityViewController weekdayLabel](self, "weekdayLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDate:", v11);

    -[EKUIAvailabilityViewController largeWeekdayLabel](self, "largeWeekdayLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDate:", v11);

    -[EKUIAvailabilityViewController eventTime](self, "eventTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

    -[EKUIAvailabilityViewController setEventTime:](self, "setEventTime:", 0);
    -[EKUIAvailabilityViewController clearFreeSpanViews](self, "clearFreeSpanViews");
    -[EKUIAvailabilityViewController fetchAvailability](self, "fetchAvailability");
  }

}

- (void)clearFreeSpanViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[EKUIAvailabilityViewController freeSpanViews](self, "freeSpanViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[EKUIAvailabilityViewController freeSpanViews](self, "freeSpanViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (void)fetchAvailability
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  EKUIAvailabilityViewController *v31;
  id v32;
  id v33;
  id from;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id location;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[EKUIAvailabilityViewController setFetchingData:](self, "setFetchingData:", 1);
  -[EKUIAvailabilityViewController configureNavBarAndToolBar](self, "configureNavBarAndToolBar");
  -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 86399.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[EKUIAvailabilityViewController availabilityRequestsQueue](self, "availabilityRequestsQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllOperations");

  v5 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[EKUIAvailabilityViewController participantAvailabilityViews](self, "participantAvailabilityViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v40;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v9);
        -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startLoadForDate:", v11);

        objc_msgSend(v10, "participant");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "absoluteString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v14);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v7);
  }

  -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CAA130]);
  -[EKUIAvailabilityViewController event](self, "event");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "calendar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "source");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController event](self, "event");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke;
  v35[3] = &unk_1E601ACF0;
  objc_copyWeak(&v38, &location);
  v23 = v15;
  v36 = v23;
  v24 = v5;
  v37 = v24;
  v25 = (void *)objc_msgSend(v16, "initWithSource:startDate:endDate:ignoredEvent:addresses:resultsBlock:", v19, v20, v28, v21, v22, v35);

  objc_initWeak(&from, v25);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_3;
  v29[3] = &unk_1E601AD18;
  objc_copyWeak(&v32, &location);
  v26 = v23;
  v30 = v26;
  objc_copyWeak(&v33, &from);
  v31 = self;
  objc_msgSend(v25, "setCompletionBlock:", v29);
  -[EKUIAvailabilityViewController availabilityRequestsQueue](self, "availabilityRequestsQueue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addOperation:", v25);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

}

void __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "currentStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqualToDate:", v5);

  if ((_DWORD)v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_2;
    v7[3] = &unk_1E601A678;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
}

void __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addToSpans:", v5);

}

void __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "currentStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isEqualToDate:", v4);

  if ((_DWORD)v3)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 56));
    if ((objc_msgSend(v5, "isCancelled") & 1) == 0)
    {
      objc_msgSend(WeakRetained, "setFetchingData:", 0);
      objc_msgSend(v5, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 40), "setSearchingForNextAvailableTime:", 0);
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "participantAvailabilityViews");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v23;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v23 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11++), "completedLoad");
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          }
          while (v9);
        }

      }
      else
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "participantAvailabilityViews");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v19;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v19 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "completedLoad");
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v14);
        }

        objc_msgSend(*(id *)(a1 + 40), "findPossibleEventRanges");
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_4;
      block[3] = &unk_1E6018688;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }

  }
}

uint64_t __51__EKUIAvailabilityViewController_fetchAvailability__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureNavBarAndToolBar");
}

- (BOOL)span:(id)a3 overlapsWithDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "CalIsBeforeOrSameAsDate:", v6))
  {
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "CalIsAfterOrSameAsDate:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)dedupSpans:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  char v20;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = (id)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v3;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v6 = v24;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (!v7)
        {

LABEL_19:
          objc_msgSend(v6, "addObject:", v5);
          continue;
        }
        v8 = v7;
        v26 = i;
        v27 = v5;
        v9 = 0;
        v10 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v8; ++j)
          {
            if (*(_QWORD *)v29 != v10)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
            objc_msgSend(v12, "startDate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "startDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "isEqualToDate:", v14))
            {
              objc_msgSend(v12, "endDate");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "endDate");
              v16 = v8;
              v17 = v10;
              v18 = v6;
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v15, "isEqualToDate:", v19);

              v6 = v18;
              v10 = v17;
              v8 = v16;
              v5 = v27;

            }
            else
            {
              v20 = 0;
            }

            v9 |= v20;
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v8);

        i = v26;
        if ((v9 & 1) == 0)
          goto LABEL_19;
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v25);
  }

  return v24;
}

- (id)mergeSpan:(id)a3 intoSpans:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v37;
  EKUIAvailabilityViewController *v38;
  id v39;
  char v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(MEMORY[0x1E0CA9FE8], "showTypeAsBusy:", objc_msgSend(v6, "type")))
    goto LABEL_22;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (!v9)
  {

LABEL_20:
    v30 = objc_alloc(MEMORY[0x1E0CA9FE0]);
    objc_msgSend(v6, "startDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v30, "initWithStartDate:endDate:type:", v31, v32, objc_msgSend(v6, "type"));

    objc_msgSend(v7, "addObject:", v28);
    goto LABEL_21;
  }
  v10 = v9;
  v37 = v7;
  v38 = self;
  v40 = 0;
  v11 = *(_QWORD *)v42;
  v39 = v6;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v42 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
      objc_msgSend(v6, "startDate", v37);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "CalIsAfterOrSameAsDate:", v15) & 1) != 0)
      {
        objc_msgSend(v6, "endDate");
        v16 = v11;
        v17 = v8;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "endDate");
        v19 = v10;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v18, "CalIsBeforeOrSameAsDate:", v20);

        v10 = v19;
        v8 = v17;
        v11 = v16;
        self = v38;
        v6 = v39;

        if ((v21 & 1) != 0)
        {
          v29 = v37;

          goto LABEL_23;
        }
      }
      else
      {

      }
      objc_msgSend(v13, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[EKUIAvailabilityViewController span:overlapsWithDate:](self, "span:overlapsWithDate:", v6, v22);

      if (v23)
      {
        objc_msgSend(v6, "startDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setStartDate:", v24);

        v40 = 1;
      }
      objc_msgSend(v13, "endDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[EKUIAvailabilityViewController span:overlapsWithDate:](self, "span:overlapsWithDate:", v6, v25);

      if (v26)
      {
        objc_msgSend(v6, "endDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setEndDate:", v27);

        v40 = 1;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  }
  while (v10);

  v7 = v37;
  if ((v40 & 1) == 0)
    goto LABEL_20;
  -[EKUIAvailabilityViewController dedupSpans:](self, "dedupSpans:", v37);
  v28 = v37;
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  v33 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "arrayWithArray:", v34);
  v35 = objc_claimAutoreleasedReturnValue();

  v7 = (id)v35;
LABEL_22:
  v29 = v7;
LABEL_23:

  return v29;
}

uint64_t __54__EKUIAvailabilityViewController_mergeSpan_intoSpans___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)findPossibleEventRanges
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id obj;
  _QWORD block[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[EKUIAvailabilityViewController participantAvailabilityViews](self, "participantAvailabilityViews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v8, "spans");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v38;
          do
          {
            v13 = 0;
            v14 = v3;
            do
            {
              if (*(_QWORD *)v38 != v12)
                objc_enumerationMutation(v9);
              -[EKUIAvailabilityViewController mergeSpan:intoSpans:](self, "mergeSpan:intoSpans:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v13), v14);
              v3 = (void *)objc_claimAutoreleasedReturnValue();

              ++v13;
              v14 = v3;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v11);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v5);
  }

  v15 = (void *)objc_opt_new();
  -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = v3;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      v21 = 0;
      v22 = v16;
      do
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v21);
        objc_msgSend(v23, "startDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v22, "CalIsBeforeDate:", v24);

        if (v25)
        {
          v26 = objc_alloc(MEMORY[0x1E0CA9FE0]);
          objc_msgSend(v23, "startDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v26, "initWithStartDate:endDate:type:", v22, v27, 2);

          objc_msgSend(v15, "addObject:", v28);
        }
        objc_msgSend(v23, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        ++v21;
        v22 = v16;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v19);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__EKUIAvailabilityViewController_findPossibleEventRanges__block_invoke;
  block[3] = &unk_1E6018EC0;
  block[4] = self;
  v32 = v15;
  v29 = v15;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __57__EKUIAvailabilityViewController_findPossibleEventRanges__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t result;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "clearFreeSpanViews");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v7, "endDate", (_QWORD)v24);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "startDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceDate:", v9);
        v11 = v10;

        objc_msgSend(*(id *)(a1 + 32), "event");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "duration");
        v14 = v13;

        if (v11 >= v14)
        {
          v15 = *(void **)(a1 + 32);
          objc_msgSend(v7, "startDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "endDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "eventFreeSpanAtStart:endDate:isFreeSpan:", v16, v17, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 32), "freeSpanViews");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v18);

          objc_msgSend(*(id *)(a1 + 32), "scrollView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addSubview:", v18);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);
  }

  v21 = *(void **)(a1 + 32);
  objc_msgSend(v21, "modifiedStartDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "updateCurrentEventAtTime:", v22);

  result = objc_msgSend(*(id *)(a1 + 32), "searchingForNextAvailableTime");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "findNextFreeSpan");
  return result;
}

- (void)findNextFreeSpan
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[EKUIAvailabilityViewController freeSpanViews](self, "freeSpanViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
      objc_msgSend(v8, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIAvailabilityViewController modifiedStartDate](self, "modifiedStartDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isAfterDate:", v10);

      if (v11)
        break;
      objc_msgSend(v8, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIAvailabilityViewController modifiedEndDate](self, "modifiedEndDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isAfterDate:", v13);

      if (v14)
      {
        -[EKUIAvailabilityViewController modifiedStartDate](self, "modifiedStartDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dateByAddingHours:inCalendar:", 1, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIAvailabilityViewController setModifiedStartDate:](self, "setModifiedStartDate:", v19);

        -[EKUIAvailabilityViewController modifiedStartDate](self, "modifiedStartDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIAvailabilityViewController event](self, "event");
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v21, "duration");
        objc_msgSend(v20, "dateByAddingTimeInterval:");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "endDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v21) = objc_msgSend(v22, "isBeforeDate:", v23);

        if ((v21 & 1) == 0)
        {
          objc_msgSend(v8, "endDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKUIAvailabilityViewController event](self, "event");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "duration");
          objc_msgSend(v24, "dateByAddingTimeInterval:", -v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKUIAvailabilityViewController setModifiedStartDate:](self, "setModifiedStartDate:", v27);

        }
        -[EKUIAvailabilityViewController modifiedStartDate](self, "modifiedStartDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKUIAvailabilityViewController updateCurrentEventAtTime:](self, "updateCurrentEventAtTime:", v28);

        -[EKUIAvailabilityViewController setSearchingForNextAvailableTime:](self, "setSearchingForNextAvailableTime:", 0);
        goto LABEL_15;
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    objc_msgSend(v8, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController setModifiedStartDate:](self, "setModifiedStartDate:", v15);

    -[EKUIAvailabilityViewController modifiedStartDate](self, "modifiedStartDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController updateCurrentEventAtTime:](self, "updateCurrentEventAtTime:", v16);

    -[EKUIAvailabilityViewController setSearchingForNextAvailableTime:](self, "setSearchingForNextAvailableTime:", 0);
LABEL_15:

    return;
  }
LABEL_10:

  -[EKUIAvailabilityViewController nextDayTapped:](self, "nextDayTapped:", 0);
}

- (void)singleTap:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void (**v15)(_QWORD, __n128, double);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v30;
  double v31;
  __n128 v33;
  int IsLeftToRight;
  __n128 v35;
  double v36;
  double v37;
  double v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD aBlock[5];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKUIAvailabilityViewController scrollView](self, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;

  -[EKUIAvailabilityViewController timelineWidth](self, "timelineWidth");
  v9 = v8 / 24.0;
  -[EKUIAvailabilityViewController event](self, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "duration");
  v12 = v9 * (v11 / 3600.0);

  v38 = v12;
  v13 = v7 - v12 * 0.5;
  v14 = v7 + v12 * 0.5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__EKUIAvailabilityViewController_singleTap___block_invoke;
  aBlock[3] = &unk_1E601AD40;
  aBlock[4] = self;
  v15 = (void (**)(_QWORD, __n128, double))_Block_copy(aBlock);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[EKUIAvailabilityViewController freeSpanViews](self, "freeSpanViews");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = v9 * 0.25;
    v20 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v22, "frame");
        v24 = v23;
        objc_msgSend(v22, "frame");
        v26 = v25;
        objc_msgSend(v22, "frame");
        v28 = v26 + v27;
        if (v7 > v24 && v7 < v28)
        {
          v30 = v13 - v24 >= 0.0 ? v13 - v24 : -(v13 - v24);
          v31 = v28 - v14 >= 0.0 ? v28 - v14 : -(v28 - v14);
          if (v30 < v19 || v31 < v19)
          {
            IsLeftToRight = CalTimeDirectionIsLeftToRight();
            v35.n128_u64[0] = 0;
            if (IsLeftToRight)
              v35.n128_f64[0] = v38;
            v35.n128_f64[0] = v28 - v35.n128_f64[0];
            v36 = -0.0;
            if (!IsLeftToRight)
              v36 = v38;
            v37 = v24 + v36;
            if (v30 <= v31)
              v35.n128_f64[0] = v37;
            v15[2](v15, v35, 60.0);

            goto LABEL_34;
          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v18)
        continue;
      break;
    }
  }

  if (CalTimeDirectionIsLeftToRight())
    v33.n128_f64[0] = v13;
  else
    v33.n128_f64[0] = v14;
  v15[2](v15, v33, 900.0);
LABEL_34:

}

void __44__EKUIAvailabilityViewController_singleTap___block_invoke(uint64_t a1, double a2, double a3)
{
  int IsLeftToRight;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  unint64_t v22;
  void *v23;
  void *v24;
  double v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  IsLeftToRight = CalTimeDirectionIsLeftToRight();
  objc_msgSend(*(id *)(a1 + 32), "timelineWidth");
  if (!IsLeftToRight)
  {
    a2 = v7 - a2;
    objc_msgSend(*(id *)(a1 + 32), "timelineWidth");
  }
  v8 = floor(a2 / v7 * 86400.0 / a3 + 0.5) * a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "components:fromDate:", 64, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDateUnadjustedForLegacyClients");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "components:fromDate:", 64, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * objc_msgSend(v14, "minute") + 0x888888888888888, 1) <= 0x888888888888888uLL
    && objc_msgSend(v11, "minute") <= 9)
  {
    HIDWORD(v15) = -2023406815 * (int)v8 + 9544368;
    LODWORD(v15) = HIDWORD(v15);
    if ((v15 >> 3) <= 0x2468AC)
      v8 = v8 + (double)(60 * objc_msgSend(v11, "minute"));
  }
  objc_msgSend(*(id *)(a1 + 32), "currentStartDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dateByAddingTimeInterval:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "event");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentStartDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "daylightSavingTimeOffsetForDate:", v20);
  v22 = (unint64_t)v21;

  objc_msgSend(*(id *)(a1 + 32), "event");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeZone");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "daylightSavingTimeOffsetForDate:", v17);
  v26 = (unint64_t)v25;

  v27 = *(void **)(a1 + 32);
  objc_msgSend(v27, "currentStartDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dateByAddingTimeInterval:", v8 + (double)(uint64_t)(v22 - v26));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "updateCurrentEventAtTime:", v29);

}

- (void)viewPinched:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  id v38;

  v38 = a3;
  v4 = objc_msgSend(v38, "state");
  if ((unint64_t)(v4 - 3) <= 2)
    -[EKUIAvailabilityViewController layout](self, "layout");
  if ((objc_msgSend(v38, "numberOfTouches") & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    if (v4 == 2)
    {
      -[EKUIAvailabilityViewController timelineView](self, "timelineView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "minWidth");
      v11 = v10;

      -[EKUIAvailabilityViewController pinchStartWidth](self, "pinchStartWidth");
      v13 = v12;
      objc_msgSend(v38, "scale");
      v15 = v13 * v14;
      if (v11 >= v15)
        v15 = v11;
      if (v15 > 5000.0)
        v15 = 5000.0;
      -[EKUIAvailabilityViewController setAvailableWidth:](self, "setAvailableWidth:", v15);
      -[EKUIAvailabilityViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "locationOfTouch:inView:", 0, v16);
      v18 = v17;
      v19 = -[EKUIAvailabilityViewController compact](self, "compact");
      -[EKUIAvailabilityViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[EKUIAvailabilityParticipantList listWidthForCompact:orientation:](EKUIAvailabilityParticipantList, "listWidthForCompact:orientation:", v19, EKUIInterfaceOrientationForViewHierarchy(v21));
      v23 = v18 - v22;

      -[EKUIAvailabilityViewController pinchStartRatio](self, "pinchStartRatio");
      v25 = v24;
      -[EKUIAvailabilityViewController availableWidth](self, "availableWidth");
      v27 = -(v23 - v25 * v26);
      -[EKUIAvailabilityViewController scrollView](self, "scrollView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "contentOffset");
      v30 = v29;

      if (v27 >= 0.0)
        v31 = v27;
      else
        v31 = 0.0;
      -[EKUIAvailabilityViewController availableWidth](self, "availableWidth");
      v33 = v32;
      -[EKUIAvailabilityViewController scrollView](self, "scrollView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "frame");
      v36 = v33 - v35;

      if (v31 < v36)
        v36 = v31;
      -[EKUIAvailabilityViewController scrollView](self, "scrollView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setContentOffset:animated:", 0, v36, v30);

      -[EKUIAvailabilityViewController layout](self, "layout");
    }
    else if (v4 == 1)
    {
      -[EKUIAvailabilityViewController availableWidth](self, "availableWidth");
      -[EKUIAvailabilityViewController setPinchStartWidth:](self, "setPinchStartWidth:");
      -[EKUIAvailabilityViewController scrollView](self, "scrollView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "locationOfTouch:inView:", 0, v5);
      v7 = v6;
      -[EKUIAvailabilityViewController pinchStartWidth](self, "pinchStartWidth");
      -[EKUIAvailabilityViewController setPinchStartRatio:](self, "setPinchStartRatio:", v7 / v8);

    }
  }

}

- (BOOL)span:(id)a3 overlapsWithStartDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(MEMORY[0x1E0CA9FE8], "showTypeAsBusy:", objc_msgSend(v7, "type")))
  {
    objc_msgSend(v7, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "CalIsBeforeOrSameAsDate:", v8) & 1) != 0)
    {
      objc_msgSend(v7, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "CalIsAfterDate:", v8);

      if ((v12 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_msgSend(v7, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "CalIsBeforeDate:", v9) & 1) != 0)
    {
      objc_msgSend(v7, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "CalIsAfterOrSameAsDate:", v9);

      if ((v16 & 1) != 0)
      {
LABEL_9:
        v13 = 1;
        goto LABEL_15;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "CalIsAfterOrSameAsDate:", v8))
    {
      objc_msgSend(v7, "endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v18, "CalIsBeforeOrSameAsDate:", v9);

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
LABEL_15:

  return v13;
}

- (BOOL)updateCurrentEventAtTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id obj;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKUIAvailabilityViewController event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  objc_msgSend(v4, "dateByAddingTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIAvailabilityViewController setModifiedStartDate:](self, "setModifiedStartDate:", v4);
  -[EKUIAvailabilityViewController setModifiedEndDate:](self, "setModifiedEndDate:", v6);
  -[EKUIAvailabilityViewController eventTime](self, "eventTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  v8 = objc_alloc(MEMORY[0x1E0D0C2B8]);
  -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithStartDate:duration:", v9, 86400.0);

  if ((objc_msgSend(v10, "containsDate:", v4) & 1) != 0 || objc_msgSend(v10, "containsDate:", v6))
  {
    -[EKUIAvailabilityViewController eventFreeSpanAtStart:endDate:isFreeSpan:](self, "eventFreeSpanAtStart:endDate:isFreeSpan:", v4, v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController setEventTime:](self, "setEventTime:", v11);

    -[EKUIAvailabilityViewController scrollView](self, "scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController eventTime](self, "eventTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    -[EKUIAvailabilityViewController scrollView](self, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController eventTime](self, "eventTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v16 = 1;
    objc_msgSend(v14, "scrollRectToVisible:animated:", 1);

    if (!-[EKUIAvailabilityViewController fetchingData](self, "fetchingData"))
    {
      v31 = v10;
      v33 = (void *)objc_opt_new();
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      -[EKUIAvailabilityViewController participantAvailabilityViews](self, "participantAvailabilityViews");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v17)
      {
        v18 = v17;
        v34 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v40 != v34)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            objc_msgSend(v20, "spans", v31);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v36;
              while (2)
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v36 != v24)
                    objc_enumerationMutation(v21);
                  if (-[EKUIAvailabilityViewController span:overlapsWithStartDate:endDate:](self, "span:overlapsWithStartDate:endDate:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), v4, v6))
                  {
                    v26 = (void *)MEMORY[0x1E0CAA0E8];
                    objc_msgSend(v20, "participant");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "participantForSortingWithEKParticipant:", v27);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v33, "addObject:", v28);
                    goto LABEL_19;
                  }
                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
                if (v23)
                  continue;
                break;
              }
            }
LABEL_19:

          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v18);
      }

      -[EKUIAvailabilityViewController setBusyParticipants:](self, "setBusyParticipants:", v33);
      -[EKUIAvailabilityViewController participantList](self, "participantList");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setBusyParticipants:", v33);

      v16 = 1;
      v10 = v31;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (CGRect)frameForFreeSpanViewAtStart:(id)a3 endDate:(id)a4 duration:(double)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int IsLeftToRight;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  v7 = a4;
  -[EKUIAvailabilityViewController convertDateIntoOffset:](self, "convertDateIntoOffset:", a3);
  v9 = v8;
  if (v7)
  {
    -[EKUIAvailabilityViewController convertDateIntoOffset:](self, "convertDateIntoOffset:", v7);
    v11 = v10;
    if (CalTimeDirectionIsLeftToRight())
      v12 = v11 - v9;
    else
      v12 = v9 - v11;
  }
  else
  {
    -[EKUIAvailabilityViewController event](self, "event");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "duration");
    v15 = v14 / 86400.0;
    -[EKUIAvailabilityViewController timelineWidth](self, "timelineWidth");
    v17 = v16;
    v12 = v15 * v16;

    IsLeftToRight = CalTimeDirectionIsLeftToRight();
    v19 = -(v15 * v17);
    if (IsLeftToRight)
      v19 = v12;
    v11 = v9 + v19;
  }
  +[EKUIAvailabilityRowView padInset](EKUIAvailabilityRowView, "padInset");
  v21 = v20;
  +[EKUIAvailabilityRowView cornerRadius](EKUIAvailabilityRowView, "cornerRadius");
  if (v12 < v22)
  {
    +[EKUIAvailabilityRowView cornerRadius](EKUIAvailabilityRowView, "cornerRadius");
    v12 = v23;
  }
  if (!CalTimeDirectionIsLeftToRight())
    v9 = v11;
  -[EKUIAvailabilityViewController participantAvailabilityViews](self, "participantAvailabilityViews");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (double)(unint64_t)objc_msgSend(v24, "count");
  -[EKUIAvailabilityViewController rowHeight](self, "rowHeight");
  v27 = v21 * -2.0 + v25 * v26;

  v28 = v9;
  v29 = v21;
  v30 = v12;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)eventFreeSpanAtStart:(id)a3 endDate:(id)a4 isFreeSpan:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  EKUIAvailabilityFreeSpanView *v17;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[EKUIAvailabilityViewController event](self, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKUIAvailabilityViewController frameForFreeSpanViewAtStart:endDate:duration:](self, "frameForFreeSpanViewAtStart:endDate:duration:", v9, v8, 0.0);
  v17 = -[EKUIAvailabilityFreeSpanView initWithFrame:andColor:startDate:endDate:isFreeSpan:]([EKUIAvailabilityFreeSpanView alloc], "initWithFrame:andColor:startDate:endDate:isFreeSpan:", v12, v9, v8, v5, v13, v14, v15, v16);

  return v17;
}

- (double)convertDateIntoOffset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = a3;
  -[EKUIAvailabilityViewController event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "daylightSavingTimeOffsetForDate:", v7);
  v9 = (unint64_t)v8;

  -[EKUIAvailabilityViewController event](self, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "daylightSavingTimeOffsetForDate:", v4);
  v13 = (unint64_t)v12;

  -[EKUIAvailabilityViewController currentStartDate](self, "currentStartDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v14);
  v16 = v15;

  -[EKUIAvailabilityViewController timelineWidth](self, "timelineWidth");
  v18 = (v16 + (double)(uint64_t)(v13 - v9)) / 86400.0 * v17;
  if ((CalTimeDirectionIsLeftToRight() & 1) == 0)
  {
    -[EKUIAvailabilityViewController timelineWidth](self, "timelineWidth");
    return v19 - v18;
  }
  return v18;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  v21 = a3;
  -[EKUIAvailabilityViewController scrollView](self, "scrollView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v21)
  {
    -[EKUIAvailabilityViewController timelineView](self, "timelineView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentOffset");
    objc_msgSend(v5, "setHorizontalScrollOffset:");

    -[EKUIAvailabilityViewController participantList](self, "participantList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentOffset");
    objc_msgSend(v6, "setVerticalScrollOffset:", v7);

  }
  -[EKUIAvailabilityViewController participantList](self, "participantList");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v21)
  {
    -[EKUIAvailabilityViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIAvailabilityViewController scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentOffset");
    v12 = v11;
    objc_msgSend(v21, "contentOffset");
    objc_msgSend(v9, "setContentOffset:", v12);

    objc_msgSend(v21, "contentOffset");
    v14 = v13 == 0.0;
    -[EKUIAvailabilityViewController participantDivider](self, "participantDivider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", v14);

  }
  -[EKUIAvailabilityViewController timelineView](self, "timelineView");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 == v21)
  {
    -[EKUIAvailabilityViewController scrollView](self, "scrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentOffset");
    v19 = v18;
    -[EKUIAvailabilityViewController scrollView](self, "scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentOffset");
    objc_msgSend(v17, "setContentOffset:", v19);

  }
}

- (id)saveBlock
{
  return objc_getProperty(self, a2, 1056, 1);
}

- (void)setSaveBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1056);
}

- (BOOL)fromDetail
{
  return self->_fromDetail;
}

- (void)setFromDetail:(BOOL)a3
{
  self->_fromDetail = a3;
}

- (BOOL)isAttendeeProposeTime
{
  return self->_isAttendeeProposeTime;
}

- (void)setIsAttendeeProposeTime:(BOOL)a3
{
  self->_isAttendeeProposeTime = a3;
}

- (NSDate)modifiedStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setModifiedStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1064);
}

- (NSDate)modifiedEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setModifiedEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1072);
}

- (NSArray)busyParticipants
{
  return (NSArray *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setBusyParticipants:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1080);
}

- (EKEvent)event
{
  return (EKEvent *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (EKUIAvailabilityParticipantList)participantList
{
  return self->_participantList;
}

- (void)setParticipantList:(id)a3
{
  objc_storeStrong((id *)&self->_participantList, a3);
}

- (NSMutableArray)participantAvailabilityViews
{
  return self->_participantAvailabilityViews;
}

- (void)setParticipantAvailabilityViews:(id)a3
{
  objc_storeStrong((id *)&self->_participantAvailabilityViews, a3);
}

- (NSMutableArray)freeSpanViews
{
  return self->_freeSpanViews;
}

- (void)setFreeSpanViews:(id)a3
{
  objc_storeStrong((id *)&self->_freeSpanViews, a3);
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (NSDate)currentStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setCurrentStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (UIView)containerView
{
  return (UIView *)objc_getProperty(self, a2, 1136, 1);
}

- (void)setContainerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1136);
}

- (UILabel)unavailableLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setUnavailableLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1144);
}

- (EKUIAvailabilityTitleContainerView)titleContainer
{
  return (EKUIAvailabilityTitleContainerView *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setTitleContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (UIView)largeDateNavContainer
{
  return (UIView *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setLargeDateNavContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1160);
}

- (UIView)dateNavContainer
{
  return (UIView *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setDateNavContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1168);
}

- (EKUIResizingDateLabel)weekdayLabel
{
  return (EKUIResizingDateLabel *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setWeekdayLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1176);
}

- (EKUIResizingDateLabel)largeWeekdayLabel
{
  return (EKUIResizingDateLabel *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setLargeWeekdayLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1184);
}

- (UIButton)previousButton
{
  return (UIButton *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setPreviousButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (UIButton)nextButton
{
  return (UIButton *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setNextButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (UIView)participantDivider
{
  return (UIView *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setParticipantDivider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (UIBarButtonItem)topNextTime
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setTopNextTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1216);
}

- (UIBarButtonItem)bottomNextTime
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setBottomNextTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1224);
}

- (UIBarButtonItem)topSpacer
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setTopSpacer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1232);
}

- (UIBarButtonItem)topSpinner
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1240, 1);
}

- (void)setTopSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1240);
}

- (UIBarButtonItem)bottomSpinner
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1248, 1);
}

- (void)setBottomSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1248);
}

- (UIBarButtonItem)doneButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setDoneButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (BOOL)searchingForNextAvailableTime
{
  return self->_searchingForNextAvailableTime;
}

- (void)setSearchingForNextAvailableTime:(BOOL)a3
{
  self->_searchingForNextAvailableTime = a3;
}

- (BOOL)fetchingData
{
  return self->_fetchingData;
}

- (void)setFetchingData:(BOOL)a3
{
  self->_fetchingData = a3;
}

- (BOOL)compact
{
  return self->_compact;
}

- (void)setCompact:(BOOL)a3
{
  self->_compact = a3;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setScrollView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (EKUIAvailabilityTimelineView)timelineView
{
  return (EKUIAvailabilityTimelineView *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setTimelineView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1272);
}

- (EKUIAvailabilityFreeSpanView)eventTime
{
  return (EKUIAvailabilityFreeSpanView *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setEventTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1280);
}

- (double)availableWidth
{
  return self->_availableWidth;
}

- (void)setAvailableWidth:(double)a3
{
  self->_availableWidth = a3;
}

- (double)pinchStartWidth
{
  return self->_pinchStartWidth;
}

- (void)setPinchStartWidth:(double)a3
{
  self->_pinchStartWidth = a3;
}

- (double)pinchStartRatio
{
  return self->_pinchStartRatio;
}

- (void)setPinchStartRatio:(double)a3
{
  self->_pinchStartRatio = a3;
}

- (double)rowHeight
{
  return self->_rowHeight;
}

- (void)setRowHeight:(double)a3
{
  self->_rowHeight = a3;
}

- (NSMutableArray)hourLines
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1320, 1);
}

- (void)setHourLines:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1320);
}

- (NSLayoutConstraint)participantWidthConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1328, 1);
}

- (void)setParticipantWidthConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1328);
}

- (NSLayoutConstraint)timelineHeightConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1336, 1);
}

- (void)setTimelineHeightConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1336);
}

- (NSLayoutConstraint)largeNavLeadingConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1344, 1);
}

- (void)setLargeNavLeadingConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1344);
}

- (NSMutableArray)titleConstraints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1352, 1);
}

- (void)setTitleConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1352);
}

- (NSOperationQueue)availabilityRequestsQueue
{
  return self->_availabilityRequestsQueue;
}

- (void)setAvailabilityRequestsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityRequestsQueue, a3);
}

- (_UINavigationBarPalette)palette
{
  return (_UINavigationBarPalette *)objc_getProperty(self, a2, 1368, 1);
}

- (void)setPalette:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1368);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_availabilityRequestsQueue, 0);
  objc_storeStrong((id *)&self->_titleConstraints, 0);
  objc_storeStrong((id *)&self->_largeNavLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_timelineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_participantWidthConstraint, 0);
  objc_storeStrong((id *)&self->_hourLines, 0);
  objc_storeStrong((id *)&self->_eventTime, 0);
  objc_storeStrong((id *)&self->_timelineView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_bottomSpinner, 0);
  objc_storeStrong((id *)&self->_topSpinner, 0);
  objc_storeStrong((id *)&self->_topSpacer, 0);
  objc_storeStrong((id *)&self->_bottomNextTime, 0);
  objc_storeStrong((id *)&self->_topNextTime, 0);
  objc_storeStrong((id *)&self->_participantDivider, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_previousButton, 0);
  objc_storeStrong((id *)&self->_largeWeekdayLabel, 0);
  objc_storeStrong((id *)&self->_weekdayLabel, 0);
  objc_storeStrong((id *)&self->_dateNavContainer, 0);
  objc_storeStrong((id *)&self->_largeDateNavContainer, 0);
  objc_storeStrong((id *)&self->_titleContainer, 0);
  objc_storeStrong((id *)&self->_unavailableLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_currentStartDate, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_freeSpanViews, 0);
  objc_storeStrong((id *)&self->_participantAvailabilityViews, 0);
  objc_storeStrong((id *)&self->_participantList, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_busyParticipants, 0);
  objc_storeStrong((id *)&self->_modifiedEndDate, 0);
  objc_storeStrong((id *)&self->_modifiedStartDate, 0);
  objc_storeStrong(&self->_saveBlock, 0);
}

@end
