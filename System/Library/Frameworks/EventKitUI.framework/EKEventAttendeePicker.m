@implementation EKEventAttendeePicker

- (EKEventAttendeePicker)initWithFrame:(CGRect)a3 event:(id)a4 calendar:(id)a5 overriddenEventStartDate:(id)a6 overriddenEventEndDate:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  id v18;
  id v19;
  EKEventAttendeePicker *v20;
  EKEventAttendeePicker *v21;
  id *p_event;
  NSMutableDictionary *v23;
  NSMutableDictionary *recipientAddressesToRecipients;
  NSOperationQueue *v25;
  NSOperationQueue *availabilityQueue;
  objc_class *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  CNAutocompleteFetchContext *fetchContext;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSMutableArray *searchResults;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v47;
  id v48;
  objc_super v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v49.receiver = self;
  v49.super_class = (Class)EKEventAttendeePicker;
  v20 = -[EKEventAttendeePicker init](&v49, sel_init);
  v21 = v20;
  if (v20)
  {
    v48 = v19;
    v20->_initialFrame.origin.x = x;
    v20->_initialFrame.origin.y = y;
    v20->_initialFrame.size.width = width;
    v20->_initialFrame.size.height = height;
    p_event = (id *)&v20->_event;
    objc_storeStrong((id *)&v20->_event, a4);
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    recipientAddressesToRecipients = v21->_recipientAddressesToRecipients;
    v21->_recipientAddressesToRecipients = v23;

    objc_storeStrong((id *)&v21->_overriddenEventStartDate, a6);
    objc_storeStrong((id *)&v21->_overriddenEventEndDate, a7);
    v21->_hasChanges = 0;
    v25 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    availabilityQueue = v21->_availabilityQueue;
    v21->_availabilityQueue = v25;

    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "title");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@"), v28, v47);
    -[NSOperationQueue setName:](v21->_availabilityQueue, "setName:", v29);
    EKWeakLinkClass();
    v30 = objc_opt_new();
    fetchContext = v21->_fetchContext;
    v21->_fetchContext = (CNAutocompleteFetchContext *)v30;

    objc_msgSend(v16, "title");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteFetchContext setTitle:](v21->_fetchContext, "setTitle:", v32);

    if (v18)
    {
      -[CNAutocompleteFetchContext setDate:](v21->_fetchContext, "setDate:", v18);
    }
    else
    {
      objc_msgSend(v16, "startDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAutocompleteFetchContext setDate:](v21->_fetchContext, "setDate:", v33);

    }
    objc_msgSend(v16, "location");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteFetchContext setLocationUUID:](v21->_fetchContext, "setLocationUUID:", v34);

    v35 = v17;
    if (v16)
    {
      objc_msgSend(v16, "calendar");
      v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = v17;
    }
    v37 = v36;
    objc_msgSend(v36, "source");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sourceIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteFetchContext setSendingAddressAccountIdentifier:](v21->_fetchContext, "setSendingAddressAccountIdentifier:", v39);

    objc_msgSend(v37, "selfIdentityEmail");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteFetchContext setSendingAddress:](v21->_fetchContext, "setSendingAddress:", v40);

    v41 = objc_opt_new();
    searchResults = v21->_searchResults;
    v21->_searchResults = (NSMutableArray *)v41;

    objc_msgSend(*p_event, "calendar");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "maxAttendees");
    objc_msgSend(*p_event, "roomAttendees");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v21->_maxNumberOfAttendees = v44 + ~objc_msgSend(v45, "count");

    v17 = v35;
    v19 = v48;
  }

  return v21;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_availabilityQueue, "cancelAllOperations");
  -[CNComposeRecipientTextView setDelegate:](self->_composeRecipientView, "setDelegate:", 0);
  if (self->_lastSearchId)
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_searchManager, "cancelTaskWithID:");
  v3.receiver = self;
  v3.super_class = (Class)EKEventAttendeePicker;
  -[EKEventAttendeePicker dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  EKEventAttendeePickerBGView *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  CNAutocompleteResultsTableViewController *v8;
  CNAutocompleteResultsTableViewController *autocompleteTableViewController;
  double v10;
  double v11;
  double width;
  CNComposeRecipientTextView *v13;
  CNComposeRecipientTextView *composeRecipientView;
  void *v15;
  CNComposeRecipientTextView *v16;
  void *v17;
  CNComposeRecipientTextView *v18;
  void *v19;
  void *v20;
  UIScrollView *v21;
  UIScrollView *recipientScrollView;
  _QWORD v23[4];
  id v24;
  id location;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  objc_initWeak(&location, self);
  v3 = -[EKEventAttendeePickerBGView initWithFrame:]([EKEventAttendeePickerBGView alloc], "initWithFrame:", self->_initialFrame.origin.x, self->_initialFrame.origin.y, self->_initialFrame.size.width, self->_initialFrame.size.height);
  -[EKEventAttendeePickerBGView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventAttendeePickerBGView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __33__EKEventAttendeePicker_loadView__block_invoke;
  v23[3] = &unk_1E6018A70;
  objc_copyWeak(&v24, &location);
  -[EKEventAttendeePickerBGView setBoundsChangeCallback:](v3, "setBoundsChangeCallback:", v23);
  -[EKEventAttendeePicker setView:](self, "setView:", v3);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v6 = (void *)getCNAutocompleteResultsTableViewControllerClass_softClass;
  v30 = getCNAutocompleteResultsTableViewControllerClass_softClass;
  if (!getCNAutocompleteResultsTableViewControllerClass_softClass)
  {
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __getCNAutocompleteResultsTableViewControllerClass_block_invoke;
    v26[3] = &unk_1E6018EE8;
    v26[4] = &v27;
    __getCNAutocompleteResultsTableViewControllerClass_block_invoke((uint64_t)v26);
    v6 = (void *)v28[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v27, 8);
  v8 = (CNAutocompleteResultsTableViewController *)objc_msgSend([v7 alloc], "initWithStyle:", 1);
  autocompleteTableViewController = self->_autocompleteTableViewController;
  self->_autocompleteTableViewController = v8;

  -[CNAutocompleteResultsTableViewController setDelegate:](self->_autocompleteTableViewController, "setDelegate:", self);
  objc_msgSend(getCNComposeRecipientTextViewClass(), "preferredHeight");
  v11 = v10;
  width = self->_initialFrame.size.width;
  v13 = (CNComposeRecipientTextView *)objc_msgSend(objc_alloc((Class)getCNComposeRecipientTextViewClass()), "initWithFrame:", 0.0, 0.0, width, v10);
  composeRecipientView = self->_composeRecipientView;
  self->_composeRecipientView = v13;

  -[CNComposeRecipientTextView setAutoresizingMask:](self->_composeRecipientView, "setAutoresizingMask:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView setBackgroundColor:](self->_composeRecipientView, "setBackgroundColor:", v15);

  v16 = self->_composeRecipientView;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView setAddresses:](v16, "setAddresses:", v17);

  -[CNComposeRecipientTextView setDelegate:](self->_composeRecipientView, "setDelegate:", self);
  v18 = self->_composeRecipientView;
  EventKitUIBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("To:"), &stru_1E601DFA8, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNComposeRecipientTextView setLabel:](v18, "setLabel:", v20);

  v21 = (UIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", 0.0, 0.0, self->_initialFrame.size.width, v11);
  recipientScrollView = self->_recipientScrollView;
  self->_recipientScrollView = v21;

  -[UIScrollView setContentSize:](self->_recipientScrollView, "setContentSize:", width, v11);
  -[UIScrollView setAutoresizingMask:](self->_recipientScrollView, "setAutoresizingMask:", 2);
  -[UIScrollView addSubview:](self->_recipientScrollView, "addSubview:", self->_composeRecipientView);
  -[EKEventAttendeePickerBGView addSubview:](v3, "addSubview:", self->_recipientScrollView);
  -[CNComposeRecipientTextView setMaxRecipients:](self->_composeRecipientView, "setMaxRecipients:", self->_maxNumberOfAttendees);
  -[EKEventAttendeePicker _setRecipientsOnComposeView](self, "_setRecipientsOnComposeView");
  if (-[EKEventAttendeePicker _zeroKeyworkSearchEnabled](self, "_zeroKeyworkSearchEnabled"))
    -[EKEventAttendeePicker searchForCorecipients](self, "searchForCorecipients");
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
}

void __33__EKEventAttendeePicker_loadView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_adjustLayoutOfSubviews");

}

- (void)viewDidLoad
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventAttendeePicker;
  -[EKEventAttendeePicker viewDidLoad](&v4, sel_viewDidLoad);
  -[CNComposeRecipientTextView becomeFirstResponder](self->_composeRecipientView, "becomeFirstResponder");
  -[EKEventAttendeePicker _invalidateAtomPresentationOptionsForAllRecipients](self, "_invalidateAtomPresentationOptionsForAllRecipients");
  if (-[EKEventAttendeePicker shouldSuggestFamilySharees](self, "shouldSuggestFamilySharees"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __36__EKEventAttendeePicker_viewDidLoad__block_invoke;
    v3[3] = &unk_1E6019D80;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0CAA090], "requestFamilyShareesWithCompletion:", v3);
  }
}

void __36__EKEventAttendeePicker_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  objc_class *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  id v29;
  id v30;
  id obj;
  uint64_t v32;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  Class (*v46)(uint64_t);
  void *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v30 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v4;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v35)
  {
    v5 = 0;
    v32 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v41 != v32)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1E0D135C0];
        objc_msgSend(v7, "firstName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "nameComponentsWithFirstName:lastName:nickname:nameSuffix:", v9, v10, 0, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x1E0D135E0];
        objc_msgSend(v7, "emailAddress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "calDAVResultWithAddress:displayName:nameComponents:resultType:groupMembersProvider:userInfo:", v13, v14, v11, 0, 0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(getCNComposeRecipientClass_1(), "composeRecipientWithAutocompleteResult:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v16);
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(*(id *)(a1 + 32), "filterOutFamilySharees");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v37;
          while (2)
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v37 != v19)
                objc_enumerationMutation(v17);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "isEqualToSharee:", v7) & 1) != 0)
              {

                ++v5;
                goto LABEL_16;
              }
            }
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
            if (v18)
              continue;
            break;
          }
        }

LABEL_16:
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v35);
  }
  else
  {
    v5 = 0;
  }

  if (v5 != objc_msgSend(obj, "count"))
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v21 = (void *)getCNComposeRecipientGroupClass_softClass;
    v52 = getCNComposeRecipientGroupClass_softClass;
    if (!getCNComposeRecipientGroupClass_softClass)
    {
      v44 = MEMORY[0x1E0C809B0];
      v45 = 3221225472;
      v46 = __getCNComposeRecipientGroupClass_block_invoke;
      v47 = &unk_1E6018EE8;
      v48 = &v49;
      __getCNComposeRecipientGroupClass_block_invoke((uint64_t)&v44);
      v21 = (void *)v50[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v49, 8);
    v23 = [v22 alloc];
    EventKitUIBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("My iCloud Family"), &stru_1E601DFA8, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v23, "initWithChildren:displayString:", v34, v25);

    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v27 = (void *)getCNComposeRecipientOriginContextClass_softClass;
    v52 = getCNComposeRecipientOriginContextClass_softClass;
    if (!getCNComposeRecipientOriginContextClass_softClass)
    {
      v44 = MEMORY[0x1E0C809B0];
      v45 = 3221225472;
      v46 = __getCNComposeRecipientOriginContextClass_block_invoke;
      v47 = &unk_1E6018EE8;
      v48 = &v49;
      __getCNComposeRecipientOriginContextClass_block_invoke((uint64_t)&v44);
      v27 = (void *)v50[3];
    }
    v28 = objc_retainAutorelease(v27);
    _Block_object_dispose(&v49, 8);
    v29 = objc_alloc_init(v28);
    objc_msgSend(v29, "setSearchTerm:", &stru_1E601DFA8);
    objc_msgSend(v29, "setResultType:", 16);
    objc_msgSend(v26, "setOriginContext:", v29);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "insertObject:atIndex:", v26, 0);
    objc_msgSend(*(id *)(a1 + 32), "_refreshSearchResults");

  }
}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventAttendeePicker;
  -[EKEventAttendeePicker viewLayoutMarginsDidChange](&v4, sel_viewLayoutMarginsDidChange);
  -[EKEventAttendeePicker view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  -[CNComposeRecipientTextView setLayoutMargins:](self->_composeRecipientView, "setLayoutMargins:");

}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventAttendeePicker;
  -[EKEventAttendeePicker viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[EKEventAttendeePicker _adjustLayoutOfSubviews](self, "_adjustLayoutOfSubviews");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CNComposeRecipientTextView becomeFirstResponder](self->_composeRecipientView, "becomeFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)EKEventAttendeePicker;
  -[EKEventAttendeePicker viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[EKEventAttendeePicker scrollComposeViewToEnd](self, "scrollComposeViewToEnd");
  v5.receiver = self;
  v5.super_class = (Class)EKEventAttendeePicker;
  -[EKEventAttendeePicker viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)commitRemainingText
{
  -[CNComposeRecipientTextView finishEnteringRecipient](self->_composeRecipientView, "finishEnteringRecipient");
}

- (NSString)remainingText
{
  return (NSString *)-[CNComposeRecipientTextView text](self->_composeRecipientView, "text");
}

- (NSArray)addresses
{
  return (NSArray *)-[CNComposeRecipientTextView addresses](self->_composeRecipientView, "addresses");
}

- (NSArray)recipients
{
  void *v2;

  if (self->_composeRecipientView)
  {
    -[CNComposeRecipientTextView recipients](self->_composeRecipientView, "recipients");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)-[NSArray copy](self->_recipients, "copy");
  }
  return (NSArray *)v2;
}

- (void)setRecipients:(id)a3
{
  NSArray *v4;
  NSArray *recipients;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  recipients = self->_recipients;
  self->_recipients = v4;

  self->_hasChanges = 0;
  if (self->_composeRecipientView)
    -[EKEventAttendeePicker _setRecipientsOnComposeView](self, "_setRecipientsOnComposeView");
}

- (void)_setRecipientsOnComposeView
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  CNAutocompleteFetchContext *fetchContext;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  CNAutocompleteFetchContext *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[CNComposeRecipientTextView setAddresses:](self->_composeRecipientView, "setAddresses:", 0);
  self->_suppressAvailabilityRequests = 1;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = self->_recipients;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        -[CNComposeRecipientTextView addRecipient:](self->_composeRecipientView, "addRecipient:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7++), (_QWORD)v17);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v5);
  }

  self->_suppressAvailabilityRequests = 0;
  -[NSMutableDictionary removeAllObjects](self->_recipientAddressesToRecipients, "removeAllObjects");
  -[NSOperationQueue cancelAllOperations](self->_availabilityQueue, "cancelAllOperations");
  -[EKEventAttendeePicker _requestAvailabilityForRecipients:](self, "_requestAvailabilityForRecipients:", self->_recipients);
  -[CNComposeRecipientTextView uncommentedAddresses](self->_composeRecipientView, "uncommentedAddresses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v10 = v9;
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fetchContext = self->_fetchContext;
    *(_DWORD *)buf = 138412802;
    v22 = v12;
    v23 = 2112;
    v24 = fetchContext;
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_DEBUG, "[%@] Setting fetch context [%@] otherAddressesAlreadyChosen to [%@]", buf, 0x20u);

  }
  -[EKEvent attendees](self->_event, "attendees", (_QWORD)v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "CalMap:", &__block_literal_global_58);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteFetchContext setOtherAddressesAlreadyChosen:](self->_fetchContext, "setOtherAddressesAlreadyChosen:", v16);

  -[EKEventAttendeePicker updateMaxAttendeeInfoText](self, "updateMaxAttendeeInfoText");
  -[EKEventAttendeePicker scrollComposeViewToEnd](self, "scrollComposeViewToEnd");

}

id __52__EKEventAttendeePicker__setRecipientsOnComposeView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resourceSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_lookUpRecipientForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_recipientAddressesToRecipients, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    EKUtils_AdjustedAttendeeAddress();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_recipientAddressesToRecipients, "objectForKey:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_requestAvailabilityForRecipients:(id)a3
{
  id v4;
  _BOOL4 suppressAvailabilityRequests;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  id v21;
  NSDate *overriddenEventStartDate;
  NSObject *v23;
  NSDate *overriddenEventEndDate;
  NSDate *v25;
  NSDate *v26;
  id v27;
  void *v28;
  void *v29;
  EKEventAttendeePicker *v30;
  NSObject *v31;
  NSDate *v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  EKEventAttendeePicker *v37;
  id v38;
  id location;
  _QWORD aBlock[5];
  _QWORD v41[5];
  id v42;
  char v43;
  char v44;
  uint8_t buf[4];
  EKEventAttendeePicker *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[EKEventAttendeePicker showAvailability](self, "showAvailability"))
  {
    if (v4 && objc_msgSend(v4, "count"))
    {
      suppressAvailabilityRequests = self->_suppressAvailabilityRequests;
      v6 = kEKUILogHandle;
      v7 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG);
      if (suppressAvailabilityRequests)
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          v8 = "Suppressing availability requests.  Will not look up availability for recipients.";
          v9 = v6;
LABEL_11:
          v11 = 2;
          goto LABEL_12;
        }
      }
      else
      {
        if (v7)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "Preparing to request availability for recipients.", buf, 2u);
        }
        v13 = objc_msgSend(v4, "count");
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
        if ((-[EKEvent isStartDateDirty](self->_event, "isStartDateDirty") & 1) != 0)
          v15 = 1;
        else
          v15 = -[EKEvent isEndDateDirty](self->_event, "isEndDateDirty");
        -[EKEvent calendar](self->_event, "calendar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "source");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "constraints");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "supportsIgnoringEventsInAvailabilityRequests");

        v20 = MEMORY[0x1E0C809B0];
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke;
        v41[3] = &unk_1E601C648;
        v41[4] = self;
        v43 = v15;
        v44 = v19;
        v21 = v14;
        v42 = v21;
        objc_msgSend(v4, "enumerateObjectsUsingBlock:", v41);
        -[EKEventAttendeePicker _invalidateAtomPresentationOptionsForAllRecipients](self, "_invalidateAtomPresentationOptionsForAllRecipients");
        if (objc_msgSend(v21, "count"))
        {
          aBlock[0] = v20;
          aBlock[1] = 3221225472;
          aBlock[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_54;
          aBlock[3] = &unk_1E601A650;
          aBlock[4] = self;
          v34 = _Block_copy(aBlock);
          overriddenEventStartDate = self->_overriddenEventStartDate;
          if (overriddenEventStartDate)
          {
            v32 = overriddenEventStartDate;
          }
          else
          {
            -[EKEvent startDate](self->_event, "startDate");
            v32 = (NSDate *)objc_claimAutoreleasedReturnValue();
          }
          overriddenEventEndDate = self->_overriddenEventEndDate;
          if (overriddenEventEndDate)
          {
            v25 = overriddenEventEndDate;
          }
          else
          {
            -[EKEvent endDateUnadjustedForLegacyClients](self->_event, "endDateUnadjustedForLegacyClients");
            v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
          }
          v26 = v25;
          v27 = objc_alloc(MEMORY[0x1E0CAA130]);
          -[EKEvent calendar](self->_event, "calendar");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "source");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (EKEventAttendeePicker *)objc_msgSend(v27, "initWithSource:startDate:endDate:ignoredEvent:addresses:resultsBlock:", v29, v32, v26, self->_event, v21, v34);

          objc_initWeak(&location, v30);
          v35[0] = v20;
          v35[1] = 3221225472;
          v35[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_59;
          v35[3] = &unk_1E601A540;
          objc_copyWeak(&v38, &location);
          v36 = v21;
          v37 = self;
          -[EKEventAttendeePicker setCompletionBlock:](v30, "setCompletionBlock:", v35);
          v31 = kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v30;
            _os_log_impl(&dword_1AF84D000, v31, OS_LOG_TYPE_DEBUG, "Adding availability operation: [%@]", buf, 0xCu);
          }
          -[NSOperationQueue addOperation:](self->_availabilityQueue, "addOperation:", v30, v32);

          objc_destroyWeak(&v38);
          objc_destroyWeak(&location);

        }
        else
        {
          v23 = kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AF84D000, v23, OS_LOG_TYPE_DEBUG, "There are no recipients for which to issue an availability request.", buf, 2u);
          }
        }

      }
    }
    else
    {
      v12 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v8 = "No recipients were given.  Will not look up availability for recipients.";
        v9 = v12;
        goto LABEL_11;
      }
    }
  }
  else
  {
    v10 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v46 = self;
      v8 = "[%@] says not to show availability.  Will not look up availability for recipients.";
      v9 = v10;
      v11 = 12;
LABEL_12:
      _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_DEBUG, v8, buf, v11);
    }
  }

}

void __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_addressForRecipient:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (*(_BYTE *)(a1 + 48)
      || !objc_msgSend((id)objc_opt_class(), "_participantHasResponded:", v3)
      || *(_BYTE *)(a1 + 49))
    {
      v5 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        v9 = 138412546;
        v10 = v4;
        v11 = 2112;
        v12 = v3;
        _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEBUG, "Will use address [%@] to get availability for recipient [%@]", (uint8_t *)&v9, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setObject:forKey:", v3, v4);
      v6 = 512;
    }
    else
    {
      v8 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        v9 = 138412290;
        v10 = v3;
        _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_DEBUG, "This event's source does not support ignoring events in availability requests and the participant has already responded.  The attendee will likely be marked as busy because they've already responded, but that can be misleading if they've accepted.  Will not get availability for recipient: [%@]", (uint8_t *)&v9, 0xCu);
      }
      v6 = 0;
    }
  }
  else
  {
    v7 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_ERROR, "No address found.  Will not get availability for recipient: [%@]", (uint8_t *)&v9, 0xCu);
    }
    v6 = 4096;
  }
  objc_msgSend(*(id *)(a1 + 32), "_setAtomPresentationOption:forRecipient:", v6, v3);

}

void __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_2;
  v6[3] = &unk_1E6018EC0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_3;
  v4[3] = &unk_1E601A678;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateAtomPresentationOptionsForAllRecipients");
}

void __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_lookUpRecipientForAddress:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(MEMORY[0x1E0CA9FE8], "spansIncludeBusyPeriod:", v6))
      v8 = 2048;
    else
      v8 = 1024;
    objc_msgSend(*(id *)(a1 + 32), "_setAtomPresentationOption:forRecipient:", v8, v7);
  }
  else
  {
    v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_ERROR, "No recipient found for original address: [%@].  Will not update atom presentation options for a recipient.", (uint8_t *)&v10, 0xCu);
    }
  }

}

void __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_59(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v3 = v2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    *(_DWORD *)buf = 138412290;
    v17 = WeakRetained;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_DEBUG, "Availability operation completed: [%@]", buf, 0xCu);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)(a1 + 48));
  LOBYTE(v5) = objc_msgSend(v7, "isCancelled");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_60;
  v11[3] = &unk_1E601C0B0;
  v12 = v6;
  v15 = (char)v5;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v13 = v8;
  v14 = v9;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __59__EKEventAttendeePicker__requestAvailabilityForRecipients___block_invoke_60(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  __int128 v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = kEKUILogHandle;
    if (!os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      goto LABEL_8;
    v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v30 = v3;
    v4 = "Error encountered during availability request: [%@]";
    v5 = v2;
    v6 = 12;
    goto LABEL_7;
  }
  if (*(_BYTE *)(a1 + 56))
  {
    v7 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v4 = "An availability operation was cancelled.";
      v5 = v7;
      v6 = 2;
LABEL_7:
      _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEBUG, v4, buf, v6);
    }
  }
LABEL_8:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v26;
    *(_QWORD *)&v10 = 138412802;
    v23 = v10;
    v24 = v8;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 48), "_lookUpRecipientForAddress:", v14, v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 1104), "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 && objc_msgSend(v16, "unsignedIntegerValue") == 512)
          {
            v18 = (void *)kEKUILogHandle;
            if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
            {
              v19 = v18;
              +[EKUIMailUtilities atomPresentationOptionsAsString:](EKUIMailUtilities, "atomPresentationOptionsAsString:", 4096);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v23;
              v30 = v15;
              v31 = 2112;
              v32 = v14;
              v33 = 2112;
              v34 = v20;
              _os_log_impl(&dword_1AF84D000, v19, OS_LOG_TYPE_DEBUG, "Setting the icon for recipient [%@] with address [%@] to [%@] because the availability request associated with this recipient has completed and the spinner is still being shown.", buf, 0x20u);

              v8 = v24;
            }
            objc_msgSend(*(id *)(a1 + 48), "_setAtomPresentationOption:forRecipient:", 4096, v15);
          }

        }
        else
        {
          v21 = kEKUILogHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v14;
            _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_DEBUG, "Could not find recipient for address [%@].  Will not possibly adjust availability icon.", buf, 0xCu);
          }
        }

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v11);
  }

  return objc_msgSend(*(id *)(a1 + 48), "_invalidateAtomPresentationOptionsForAllRecipients");
}

+ (id)_addressForRecipient:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v3 = a3;
  objc_getAssociatedObject(v3, &kEKUI_CNComposeReciepentParticipantKey_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "normalizedAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (objc_msgSend(v3, "kind") && objc_msgSend(v3, "kind") != 1)
      {
        v9 = objc_msgSend(v3, "kind");

        if (v9 != 4)
        {
          v7 = 0;
          goto LABEL_8;
        }
      }
      else
      {

      }
      objc_msgSend(v3, "normalizedAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_8:

  return v7;
}

+ (BOOL)_participantHasResponded:(id)a3
{
  void *v3;
  void *v4;
  char HasResponded;

  objc_getAssociatedObject(a3, &kEKUI_CNComposeReciepentParticipantKey_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    HasResponded = EKUIAttendeeUtils_AttendeeHasResponded(v3);
  else
    HasResponded = 0;

  return HasResponded;
}

- (void)_setAtomPresentationOption:(unint64_t)a3 forRecipient:(id)a4
{
  id v6;
  NSMutableDictionary *atomPresentationOptionsByRecipient;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  if (!atomPresentationOptionsByRecipient)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = self->_atomPresentationOptionsByRecipient;
    self->_atomPresentationOptionsByRecipient = v8;

    atomPresentationOptionsByRecipient = self->_atomPresentationOptionsByRecipient;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](atomPresentationOptionsByRecipient, "setObject:forKey:", v10, v6);

  v11 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v12 = v11;
    +[EKUIMailUtilities atomPresentationOptionsAsString:](EKUIMailUtilities, "atomPresentationOptionsAsString:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v13;
    _os_log_impl(&dword_1AF84D000, v12, OS_LOG_TYPE_DEBUG, "Atom presentation of recipient [%@] set to [%@]", (uint8_t *)&v14, 0x16u);

  }
}

- (void)_invalidateAtomPresentationOptionsForAllRecipients
{
  -[CNComposeRecipientTextView invalidateAtomPresentationOptions](self->_composeRecipientView, "invalidateAtomPresentationOptions");
}

- (void)_copyRecipientsFromComposeView
{
  NSArray *v3;
  NSArray *recipients;
  id v5;

  -[CNComposeRecipientTextView recipients](self->_composeRecipientView, "recipients");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (NSArray *)objc_msgSend(v5, "copy");
  recipients = self->_recipients;
  self->_recipients = v3;

}

- (id)_searchResultsView
{
  UITableView *searchResultsView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UITableView *v11;
  UITableView *v12;

  searchResultsView = self->_searchResultsView;
  if (!searchResultsView)
  {
    -[EKEventAttendeePicker view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

    objc_msgSend(getCNComposeRecipientTextViewClass(), "preferredHeight");
    v10 = v9;
    -[CNAutocompleteResultsTableViewController tableView](self->_autocompleteTableViewController, "tableView");
    v11 = (UITableView *)objc_claimAutoreleasedReturnValue();
    v12 = self->_searchResultsView;
    self->_searchResultsView = v11;

    -[UITableView setFrame:](self->_searchResultsView, "setFrame:", 0.0, v10, v6, v8 - v10);
    -[UITableView setAutoresizingMask:](self->_searchResultsView, "setAutoresizingMask:", 18);
    -[UITableView setKeyboardDismissMode:](self->_searchResultsView, "setKeyboardDismissMode:", 1);
    searchResultsView = self->_searchResultsView;
  }
  return searchResultsView;
}

- (void)_hideSearchResultsViewAndCancelOutstandingSearches:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  NSNumber *lastSearchId;
  int v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v5 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "[%@] Hiding search results view and canceling outstanding searches", (uint8_t *)&v12, 0xCu);

  }
  self->_showingSearchField = 0;
  v9 = self->_searchResults;
  objc_sync_enter(v9);
  -[NSMutableArray removeAllObjects](self->_searchResults, "removeAllObjects");
  objc_sync_exit(v9);

  -[CNAutocompleteResultsTableViewController invalidatePreferredRecipients](self->_autocompleteTableViewController, "invalidatePreferredRecipients");
  if (v3 && self->_lastSearchId)
  {
    -[EKEventAttendeePicker _searchManager](self, "_searchManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelTaskWithID:", self->_lastSearchId);

    lastSearchId = self->_lastSearchId;
    self->_lastSearchId = 0;

  }
  -[EKEventAttendeePicker _adjustLayoutOfSubviews](self, "_adjustLayoutOfSubviews");
  -[UITableView removeFromSuperview](self->_searchResultsView, "removeFromSuperview");
  -[CNComposeRecipientTextView setSeparatorHidden:](self->_composeRecipientView, "setSeparatorHidden:", 0);
}

- (void)_showSearchResultsView
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEBUG, "[%@] Showing search results view", (uint8_t *)&v10, 0xCu);

  }
  self->_showingSearchField = 1;
  -[EKEventAttendeePicker _searchResultsView](self, "_searchResultsView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[EKEventAttendeePicker view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v7);

  }
  -[CNComposeRecipientTextView setSeparatorHidden:](self->_composeRecipientView, "setSeparatorHidden:", 1);
  -[EKEventAttendeePicker _adjustLayoutOfSubviews](self, "_adjustLayoutOfSubviews");

}

- (double)_maxScrollerHeight
{
  void *v3;
  double Height;
  double v5;
  double v6;
  CGRect v8;

  -[EKEventAttendeePicker view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v8);

  if (!-[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover"))
  {
    objc_msgSend(MEMORY[0x1E0DC3938], "defaultSize");
    if (v5 < Height)
    {
      objc_msgSend(MEMORY[0x1E0DC3938], "defaultSize");
      return Height - v6;
    }
  }
  return Height;
}

- (BOOL)_zeroKeyworkSearchEnabled
{
  void *v3;
  BOOL IsCompact;
  void *v5;
  void *v6;

  -[EKEventAttendeePicker recipients](self, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    IsCompact = 1;
  }
  else
  {
    -[EKEventAttendeePicker view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v5))
    {
      IsCompact = 1;
    }
    else
    {
      -[EKEventAttendeePicker view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      IsCompact = EKUICurrentHeightSizeClassIsCompact(v6);

    }
  }

  return IsCompact;
}

- (void)updateMaxAttendeeInfoText
{
  int64_t maxNumberOfAttendees;
  void *v4;
  uint64_t v5;
  void *v6;
  CNComposeRecipientTextView *composeRecipientView;
  void *v8;
  id v9;

  maxNumberOfAttendees = self->_maxNumberOfAttendees;
  -[CNComposeRecipientTextView recipients](self->_composeRecipientView, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (maxNumberOfAttendees < 1 || (double)maxNumberOfAttendees * 0.9 >= (double)v5)
  {
    -[CNComposeRecipientTextView setComposeFieldInfoText:](self->_composeRecipientView, "setComposeFieldInfoText:", &stru_1E601DFA8);
  }
  else
  {
    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("(%d / %d) invitees"), &stru_1E601DFA8, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    composeRecipientView = self->_composeRecipientView;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v9, v5, maxNumberOfAttendees);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTextView setComposeFieldInfoText:](composeRecipientView, "setComposeFieldInfoText:", v8);

  }
}

- (void)scrollComposeViewToEnd
{
  double v3;
  double v4;
  double v5;

  if ((-[CNComposeRecipientTextView isFirstResponder](self->_composeRecipientView, "isFirstResponder") & 1) == 0)
    -[CNComposeRecipientTextView becomeFirstResponder](self->_composeRecipientView, "becomeFirstResponder");
  -[UIScrollView contentSize](self->_recipientScrollView, "contentSize");
  v4 = v3;
  -[UIScrollView frame](self->_recipientScrollView, "frame");
  -[UIScrollView setContentOffset:animated:](self->_recipientScrollView, "setContentOffset:animated:", 0, 0.0, v4 - v5);
}

- (id)_searchManager
{
  CNAutocompleteSearchManager *searchManager;
  void *v5;
  objc_class *v6;
  CNAutocompleteSearchManager *v7;
  CNAutocompleteSearchManager *v8;
  CNAutocompleteSearchManager *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  searchManager = self->_searchManager;
  if (searchManager)
    return searchManager;
  if (self->_ABAccessDenied)
    return 0;
  if ((unint64_t)(objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) - 1) > 1)
  {
    if (!self->_ABAccessDenied)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2050000000;
      v5 = (void *)getCNAutocompleteSearchManagerClass_softClass;
      v15 = getCNAutocompleteSearchManagerClass_softClass;
      if (!getCNAutocompleteSearchManagerClass_softClass)
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __getCNAutocompleteSearchManagerClass_block_invoke;
        v11[3] = &unk_1E6018EE8;
        v11[4] = &v12;
        __getCNAutocompleteSearchManagerClass_block_invoke((uint64_t)v11);
        v5 = (void *)v13[3];
      }
      v6 = objc_retainAutorelease(v5);
      _Block_object_dispose(&v12, 8);
      v7 = (CNAutocompleteSearchManager *)objc_msgSend([v6 alloc], "initWithAutocompleteSearchType:", 3);
      v8 = self->_searchManager;
      self->_searchManager = v7;

      -[CNAutocompleteSearchManager setFetchDelegate:](self->_searchManager, "setFetchDelegate:", self);
      searchManager = self->_searchManager;
      if (self->_searchAccountID)
      {
        -[CNAutocompleteSearchManager setSearchTypes:](searchManager, "setSearchTypes:", 27);
        v9 = self->_searchManager;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self->_searchAccountID);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAutocompleteSearchManager setSearchAccountIDs:](v9, "setSearchAccountIDs:", v10);

        searchManager = self->_searchManager;
      }
      return searchManager;
    }
    return 0;
  }
  self->_ABAccessDenied = 1;
  return 0;
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  EKEventAttendeePicker *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__EKEventAttendeePicker_consumeAutocompleteSearchResults_taskID___block_invoke;
  block[3] = &unk_1E6018660;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __65__EKEventAttendeePicker_consumeAutocompleteSearchResults_taskID___block_invoke(id *a1)
{
  uint64_t result;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1[4], "isEqual:", *((_QWORD *)a1[5] + 127));
  if ((_DWORD)result)
  {
    result = objc_msgSend(a1[6], "count");
    if (result)
    {
      v3 = (void *)kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        v4 = v3;
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = a1[6];
        v9 = 138412546;
        v10 = v6;
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEBUG, "[%@] Consuming autocomplete results: %@", (uint8_t *)&v9, 0x16u);

      }
      v8 = *((id *)a1[5] + 143);
      objc_sync_enter(v8);
      objc_msgSend(*((id *)a1[5] + 143), "addObjectsFromArray:", a1[6]);
      objc_sync_exit(v8);

      return objc_msgSend(a1[5], "_refreshSearchResults");
    }
  }
  return result;
}

- (void)consumeCorecipientSearchResults:(id)a3 taskID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  EKEventAttendeePicker *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__EKEventAttendeePicker_consumeCorecipientSearchResults_taskID___block_invoke;
  block[3] = &unk_1E6018660;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __64__EKEventAttendeePicker_consumeCorecipientSearchResults_taskID___block_invoke(id *a1)
{
  uint64_t result;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(a1[4], "isEqual:", *((_QWORD *)a1[5] + 127));
  if ((_DWORD)result)
  {
    result = objc_msgSend(a1[6], "count");
    if (result)
    {
      v3 = (void *)kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
      {
        v4 = v3;
        v5 = (objc_class *)objc_opt_class();
        NSStringFromClass(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = a1[6];
        v9 = 138412546;
        v10 = v6;
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEBUG, "[%@] Consuming corecipient results: %@", (uint8_t *)&v9, 0x16u);

      }
      v8 = *((id *)a1[5] + 143);
      objc_sync_enter(v8);
      objc_msgSend(*((id *)a1[5] + 143), "addObjectsFromArray:", a1[6]);
      objc_sync_exit(v8);

      return objc_msgSend(a1[5], "_refreshSearchResults");
    }
  }
  return result;
}

- (void)finishedSearchingForAutocompleteResults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__EKEventAttendeePicker_finishedSearchingForAutocompleteResults__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

_BYTE *__64__EKEventAttendeePicker_finishedSearchingForAutocompleteResults__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *result;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v3 = v2;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144);
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_DEBUG, "[%@] Finished searching for autocomplete results with final results: %@", (uint8_t *)&v9, 0x16u);

  }
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "count");
  result = *(_BYTE **)(a1 + 32);
  if (!v7)
    return (_BYTE *)objc_msgSend(result, "_hideSearchResultsViewAndCancelOutstandingSearches:", 0);
  if (result[1000])
    return (_BYTE *)objc_msgSend(result, "_refreshSearchResults");
  return result;
}

- (void)finishedSearchingForCorecipients
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__EKEventAttendeePicker_finishedSearchingForCorecipients__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

_BYTE *__57__EKEventAttendeePicker_finishedSearchingForCorecipients__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *result;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v3 = v2;
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1144);
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_DEBUG, "[%@] Finished searching for autocomplete results with final results: %@", (uint8_t *)&v9, 0x16u);

  }
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1144), "count");
  result = *(_BYTE **)(a1 + 32);
  if (!v7)
    return (_BYTE *)objc_msgSend(result, "_hideSearchResultsViewAndCancelOutstandingSearches:", 0);
  if (result[1000])
    return (_BYTE *)objc_msgSend(result, "_refreshSearchResults");
  return result;
}

- (void)finishedTaskWithID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  EKEventAttendeePicker *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__EKEventAttendeePicker_finishedTaskWithID___block_invoke;
  v6[3] = &unk_1E6018EC0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __44__EKEventAttendeePicker_finishedTaskWithID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1016)))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(v2 + 1016);
    *(_QWORD *)(v2 + 1016) = 0;

  }
}

- (void)_refreshSearchResults
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  NSMutableArray *searchResults;
  int v8;
  void *v9;
  __int16 v10;
  NSMutableArray *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_searchResults, "count") && !self->_showingSearchField)
    -[EKEventAttendeePicker _showSearchResultsView](self, "_showSearchResultsView");
  v3 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    searchResults = self->_searchResults;
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = searchResults;
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEBUG, "[%@] Refreshing search results: %@", (uint8_t *)&v8, 0x16u);

  }
  -[CNAutocompleteResultsTableViewController setRecipients:](self->_autocompleteTableViewController, "setRecipients:", self->_searchResults);
}

- (void)searchWithText:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  CNAutocompleteFetchContext *fetchContext;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *lastSearchId;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  CNAutocompleteFetchContext *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    fetchContext = self->_fetchContext;
    v15 = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = fetchContext;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_DEBUG, "[%@] Beginning text search with text [%@] context [%@]", (uint8_t *)&v15, 0x20u);

  }
  if (self->_lastSearchId)
  {
    -[EKEventAttendeePicker _searchManager](self, "_searchManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancelTaskWithID:", self->_lastSearchId);

  }
  v11 = self->_searchResults;
  objc_sync_enter(v11);
  -[NSMutableArray removeAllObjects](self->_searchResults, "removeAllObjects");
  objc_sync_exit(v11);

  -[EKEventAttendeePicker _searchManager](self, "_searchManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchForText:withAutocompleteFetchContext:consumer:", v4, self->_fetchContext, self);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  lastSearchId = self->_lastSearchId;
  self->_lastSearchId = v13;

}

- (void)searchForCorecipients
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  CNAutocompleteFetchContext *fetchContext;
  void *v8;
  NSNumber *lastSearchId;
  NSMutableArray *v10;
  void *v11;
  NSNumber *v12;
  NSNumber *v13;
  int v14;
  void *v15;
  __int16 v16;
  CNAutocompleteFetchContext *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    fetchContext = self->_fetchContext;
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = fetchContext;
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEBUG, "[%@] Beginning context search with context: %@", (uint8_t *)&v14, 0x16u);

  }
  if (self->_lastSearchId)
  {
    -[EKEventAttendeePicker _searchManager](self, "_searchManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelTaskWithID:", self->_lastSearchId);

    lastSearchId = self->_lastSearchId;
    self->_lastSearchId = 0;

  }
  v10 = self->_searchResults;
  objc_sync_enter(v10);
  -[NSMutableArray removeAllObjects](self->_searchResults, "removeAllObjects");
  objc_sync_exit(v10);

  if (-[EKEventAttendeePicker _zeroKeyworkSearchEnabled](self, "_zeroKeyworkSearchEnabled"))
  {
    -[EKEventAttendeePicker _searchManager](self, "_searchManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchForCorecipientsWithAutocompleteFetchContext:consumer:", self->_fetchContext, self);
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v13 = self->_lastSearchId;
    self->_lastSearchId = v12;

  }
  else
  {
    -[EKEventAttendeePicker _hideSearchResultsViewAndCancelOutstandingSearches:](self, "_hideSearchResultsViewAndCancelOutstandingSearches:", 0);
  }
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventAttendeePicker _requestAvailabilityForRecipients:](self, "_requestAvailabilityForRecipients:", v7, v8, v9);
  -[EKEventAttendeePicker _updateFetchContextChosenAddresses](self, "_updateFetchContextChosenAddresses");
  -[EKEventAttendeePicker scrollComposeViewToEnd](self, "scrollComposeViewToEnd");
  -[EKEventAttendeePicker updateMaxAttendeeInfoText](self, "updateMaxAttendeeInfoText");
  -[EKEventAttendeePicker _copyRecipientsFromComposeView](self, "_copyRecipientsFromComposeView");
  if (-[EKEventAttendeePicker _appearState](self, "_appearState") == 2)
    -[EKEventAttendeePicker _invalidateAtomPresentationOptionsForAllRecipients](self, "_invalidateAtomPresentationOptionsForAllRecipients");
  self->_hasChanges = 1;
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  objc_msgSend(a3, "removeRecipient:", a4);
  -[EKEventAttendeePicker _updateFetchContextChosenAddresses](self, "_updateFetchContextChosenAddresses");
  -[EKEventAttendeePicker updateMaxAttendeeInfoText](self, "updateMaxAttendeeInfoText");
  -[EKEventAttendeePicker _copyRecipientsFromComposeView](self, "_copyRecipientsFromComposeView");
  -[EKEventAttendeePicker _invalidateAtomPresentationOptionsForAllRecipients](self, "_invalidateAtomPresentationOptionsForAllRecipients");
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "clearText");
  -[EKEventAttendeePicker _hideSearchResultsViewAndCancelOutstandingSearches:](self, "_hideSearchResultsViewAndCancelOutstandingSearches:", 1);
  objc_msgSend(v7, "addAddress:", v6);

}

- (void)_adjustLayoutOfSubviews
{
  double Height;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  void *v19;
  double MaxY;
  void *v21;
  double v22;
  double MinX;
  double v24;
  double Width;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  -[CNComposeRecipientTextView frame](self->_composeRecipientView, "frame");
  Height = CGRectGetHeight(v34);
  objc_msgSend(getCNComposeRecipientTextViewClass(), "preferredHeight");
  v5 = v4;
  -[EKEventAttendeePicker _maxScrollerHeight](self, "_maxScrollerHeight");
  v7 = v6 * 0.333;
  if (Height <= v7)
    v7 = Height;
  if (Height >= v5)
    v8 = v7;
  else
    v8 = v5;
  -[EKEventAttendeePicker view](self, "view", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeAreaInsets");
  v11 = v8 + v10;

  -[UIScrollView frame](self->_recipientScrollView, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[EKEventAttendeePicker _searchResultsView](self, "_searchResultsView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAlpha:", 0.0);
  objc_msgSend(v18, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v18, "frame");
    MaxY = CGRectGetMaxY(v35);
    v36.origin.x = v13;
    v36.origin.y = v15;
    v36.size.width = v17;
    v36.size.height = v11;
    if (MaxY <= CGRectGetMaxY(v36))
    {
      -[EKEventAttendeePicker view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "frame");
      MaxY = v22;

    }
    v37.origin.x = v13;
    v37.origin.y = v15;
    v37.size.width = v17;
    v37.size.height = v11;
    MinX = CGRectGetMinX(v37);
    v38.origin.x = v13;
    v38.origin.y = v15;
    v38.size.width = v17;
    v38.size.height = v11;
    v24 = CGRectGetMaxY(v38);
    v39.origin.x = v13;
    v39.origin.y = v15;
    v39.size.width = v17;
    v39.size.height = v11;
    Width = CGRectGetWidth(v39);
    v40.origin.x = v13;
    v40.origin.y = v15;
    v40.size.width = v17;
    v40.size.height = v11;
    objc_msgSend(v18, "setFrame:", MinX, v24, Width, MaxY - CGRectGetMaxY(v40));
  }
  v26 = (void *)MEMORY[0x1E0DC3F10];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __48__EKEventAttendeePicker__adjustLayoutOfSubviews__block_invoke;
  v28[3] = &unk_1E601C670;
  v30 = v13;
  v31 = v15;
  v32 = v17;
  v33 = v11;
  v28[4] = self;
  v29 = v18;
  v27 = v18;
  objc_msgSend(v26, "animateWithDuration:animations:", v28, 0.2);

}

uint64_t __48__EKEventAttendeePicker__adjustLayoutOfSubviews__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "contentOffset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "contentSize");
  v7 = v6;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "frame");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setContentOffset:animated:", 0, v3, fmin(v5, v7 - v8));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  CGFloat width;
  BOOL v7;
  _QWORD v8[7];
  BOOL v9;
  CGRect v10;

  height = a4.height;
  width = a4.width;
  -[CNComposeRecipientTextView bounds](self->_composeRecipientView, "bounds", a3);
  v7 = height > CGRectGetHeight(v10);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__EKEventAttendeePicker_composeHeaderView_didChangeSize___block_invoke;
  v8[3] = &unk_1E601C698;
  v8[4] = self;
  *(CGFloat *)&v8[5] = width;
  *(double *)&v8[6] = height;
  v9 = v7;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v8, 0.2);
  -[EKEventAttendeePicker _adjustLayoutOfSubviews](self, "_adjustLayoutOfSubviews");
}

uint64_t __57__EKEventAttendeePicker_composeHeaderView_didChangeSize___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "frame");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setFrame:");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 32), "scrollComposeViewToEnd");
  return result;
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "length"))
    -[EKEventAttendeePicker searchWithText:](self, "searchWithText:", v5);
  else
    -[EKEventAttendeePicker searchForCorecipients](self, "searchForCorecipients");

}

- (id)peoplePickerPrompt
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Add invitees to this Event."), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)showAvailability
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[EKEvent calendar](self->_event, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsAvailabilityRequests");

  return v5;
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[EKEventAttendeePicker _CNContactPickerViewController](self, "_CNContactPickerViewController", a3);
  v14 = (id)objc_opt_new();
  objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "setModalPresentationStyle:", 18);
  -[EKEvent calendar](self->_event, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsPhoneNumbers");

  if (v6)
    v7 = CFSTR("emailAddresses.@count > 0 || phoneNumbers.@count > 0");
  else
    v7 = CFSTR("emailAddresses.@count > 0");
  if (v6)
    v8 = CFSTR("(emailAddresses.@count == 1) || (emailAddresses.@count == 0 && phoneNumbers.@count == 1)");
  else
    v8 = CFSTR("emailAddresses.@count == 1");
  if (v6)
    v9 = CFSTR("(key == 'emailAddresses') || (key == 'phoneNumbers')");
  else
    v9 = CFSTR("(key == 'emailAddresses')");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicateForEnablingContact:", v10);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicateForSelectionOfContact:", v11);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicateForSelectionOfProperty:", v12);

  -[EKEventAttendeePicker navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentModalViewController:withTransition:", v14, 8);

}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  void *v4;

  -[EKEventAttendeePicker navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  -[CNComposeRecipientTextView becomeFirstResponder](self->_composeRecipientView, "becomeFirstResponder");
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  v5 = (void *)objc_msgSend(objc_alloc((Class)getCNComposeRecipientClass_1()), "initWithContact:address:kind:", 0, v4, objc_msgSend(v4, "cal_isPhoneNumber"));

  return v5;
}

- (BOOL)recipientViewShouldIgnoreFirstResponderChanges:(id)a3
{
  return 1;
}

- (unint64_t)presentationOptionsForRecipient:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t maxNumberOfAttendees;
  id WeakRetained;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_atomPresentationOptionsByRecipient, "objectForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKey:](self->_atomPresentationOptionsByRecipient, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "unsignedIntegerValue");

  }
  maxNumberOfAttendees = self->_maxNumberOfAttendees;
  if (-[NSArray count](self->_recipients, "count") > maxNumberOfAttendees
    && -[NSArray indexOfObject:inRange:](self->_recipients, "indexOfObject:inRange:", v4, maxNumberOfAttendees, -[NSArray count](self->_recipients, "count") - maxNumberOfAttendees) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 1;
    goto LABEL_14;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_addressValidationDelegate);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)&self->_addressValidationDelegate);
    objc_msgSend(v4, "normalizedAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "eventAttendeePicker:getValidationStatusForAddress:", self, v10);

    switch(v11)
    {
      case 3:
        goto LABEL_9;
      case 2:
        break;
      case 1:
LABEL_9:
        v5 |= 8uLL;
        break;
      default:
        v5 |= 8uLL;
        v12 = objc_loadWeakRetained((id *)&self->_addressValidationDelegate);
        objc_msgSend(v4, "normalizedAddress");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "eventAttendeePicker:cacheValidationStatus:forAddress:", self, 1, v13);

        break;
    }
  }
  v14 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v15 = v14;
    +[EKUIMailUtilities atomPresentationOptionsAsString:](EKUIMailUtilities, "atomPresentationOptionsAsString:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v16;
    v20 = 2112;
    v21 = v4;
    _os_log_impl(&dword_1AF84D000, v15, OS_LOG_TYPE_DEBUG, "Returning presentation options [%@] for recipient: [%@]", (uint8_t *)&v18, 0x16u);

  }
LABEL_14:

  return v5;
}

- (BOOL)composeRecipientViewShowingSearchResults:(id)a3
{
  return self->_showingSearchField;
}

- (void)selectNextSearchResultForComposeRecipientView:(id)a3
{
  -[CNAutocompleteResultsTableViewController selectNextSearchResult](self->_autocompleteTableViewController, "selectNextSearchResult", a3);
}

- (BOOL)expandSelectedSearchResultForComposeRecipientView:(id)a3
{
  return -[CNAutocompleteResultsTableViewController expandSelectedRecipient](self->_autocompleteTableViewController, "expandSelectedRecipient", a3);
}

- (BOOL)collapseSelectedSearchResultForComposeRecipientView:(id)a3
{
  return -[CNAutocompleteResultsTableViewController collapseSelectedRecipient](self->_autocompleteTableViewController, "collapseSelectedRecipient", a3);
}

- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3
{
  -[CNAutocompleteResultsTableViewController selectPreviousSearchResult](self->_autocompleteTableViewController, "selectPreviousSearchResult", a3);
}

- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3 context:(unint64_t)a4
{
  return -[CNAutocompleteResultsTableViewController confirmSelectedRecipient](self->_autocompleteTableViewController, "confirmSelectedRecipient", a3, a4);
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  CNComposeRecipient *displayedRecipient;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "contact");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0D0C360];
    objc_msgSend(v5, "displayString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "personNameComponentsFromString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v9, "familyName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFamilyName:", v10);

    objc_msgSend(v9, "givenName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGivenName:", v11);

    v12 = (void *)MEMORY[0x1E0C97338];
    v13 = *MEMORY[0x1E0C97000];
    objc_msgSend(v5, "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "labeledValueWithLabel:value:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEmailAddresses:", v16);

  }
  v17 = objc_alloc_init(MEMORY[0x1E0C972A0]);
  objc_msgSend(v17, "setIncludeIncludeManagedAppleIDs:", 1);
  objc_msgSend(v17, "setIncludeSuggestedContacts:", 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v17);
  -[objc_class viewControllerForUnknownContact:](-[EKEventAttendeePicker _CNContactViewController](self, "_CNContactViewController"), "viewControllerForUnknownContact:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setContactStore:", v18);
  objc_msgSend(v19, "setHidesBottomBarWhenPushed:", 1);
  objc_msgSend(v19, "setModalPresentationStyle:", 3);
  objc_msgSend(v19, "setDisplayMode:", 1);
  objc_msgSend(v19, "setAllowsEditing:", 0);
  objc_msgSend(v5, "sourceType");
  objc_msgSend(v5, "autocompleteResult");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "recentsIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (objc_class *)EKWeakLinkClass();
    EKWeakLinkStringConstant();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = [v22 alloc];
    objc_msgSend(v5, "autocompleteResult");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "recentsIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithRecentContactID:domain:", v26, v23);
    objc_msgSend(v19, "setRecentsData:", v27);

    objc_msgSend(v19, "setDelegate:", self);
  }
  displayedRecipient = self->_displayedRecipient;
  self->_displayedRecipient = (CNComposeRecipient *)v5;

  -[EKEventAttendeePicker navigationController](self, "navigationController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "pushViewController:animated:", v19, 1);

}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  CNComposeRecipientTextView *composeRecipientView;
  id v8;
  void *v9;

  if (a4)
  {
    composeRecipientView = self->_composeRecipientView;
    v8 = a4;
    -[CNComposeRecipientTextView clearText](composeRecipientView, "clearText");
    -[CNComposeRecipientTextView addRecipient:](self->_composeRecipientView, "addRecipient:", v8);
    -[EKEventAttendeePicker _searchManager](self, "_searchManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didSelectRecipient:atIndex:", v8, a5);

    -[EKEventAttendeePicker _hideSearchResultsViewAndCancelOutstandingSearches:](self, "_hideSearchResultsViewAndCancelOutstandingSearches:", 1);
    -[EKEventAttendeePicker _updateFetchContextChosenAddresses](self, "_updateFetchContextChosenAddresses");
    -[EKEventAttendeePicker searchForCorecipients](self, "searchForCorecipients");
  }
}

- (void)_updateFetchContextChosenAddresses
{
  id v3;

  -[CNComposeRecipientTextView uncommentedAddresses](self->_composeRecipientView, "uncommentedAddresses");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteFetchContext setOtherAddressesAlreadyChosen:](self->_fetchContext, "setOtherAddressesAlreadyChosen:", v3);

}

- (void)contactViewControllerDidExecuteClearRecentsDataAction:(id)a3
{
  CNComposeRecipient *displayedRecipient;
  id v5;
  id v6;

  -[CNAutocompleteResultsTableViewController invalidateSearchResultRecipient:](self->_autocompleteTableViewController, "invalidateSearchResultRecipient:", self->_displayedRecipient);
  displayedRecipient = self->_displayedRecipient;
  self->_displayedRecipient = 0;

  -[EKEventAttendeePicker navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

}

- (void)contactPickerDidCancel:(id)a3
{
  -[EKEventAttendeePicker composeRecipientViewDidFinishPickingRecipient:](self, "composeRecipientViewDidFinishPickingRecipient:", self->_composeRecipientView);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a4;
  objc_msgSend(v19, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 1)
  {
    objc_msgSend(v19, "emailAddresses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc((Class)getCNComposeRecipientClass_1());
    objc_msgSend(v8, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithContact:address:kind:", v19, v10, 0);
    goto LABEL_6;
  }
  objc_msgSend(v19, "phoneNumbers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") != 1)
  {
LABEL_8:

    goto LABEL_9;
  }
  -[EKEvent calendar](self->_event, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportsPhoneNumbers");

  if (v14)
  {
    objc_msgSend(v19, "phoneNumbers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc((Class)getCNComposeRecipientClass_1());
    objc_msgSend(v10, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v16, "initWithContact:address:kind:", v19, v17, 1);

LABEL_6:
    if (v11)
    {
      objc_msgSend(v19, "CalDisplayName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDisplayString:", v18);

      -[CNComposeRecipientTextView addRecipient:](self->_composeRecipientView, "addRecipient:", v11);
      goto LABEL_8;
    }
  }
LABEL_9:
  -[EKEventAttendeePicker composeRecipientViewDidFinishPickingRecipient:](self, "composeRecipientViewDidFinishPickingRecipient:", self->_composeRecipientView);

}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  objc_msgSend(v18, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C966A8]);

  if (v6)
  {
    v7 = objc_alloc((Class)getCNComposeRecipientClass_1());
    objc_msgSend(v18, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithContact:address:kind:", v8, v9, 0);
    goto LABEL_6;
  }
  objc_msgSend(v18, "key");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
LABEL_8:

    goto LABEL_9;
  }
  -[EKEvent calendar](self->_event, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsPhoneNumbers");

  if (v13)
  {
    objc_msgSend(v18, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc((Class)getCNComposeRecipientClass_1());
    objc_msgSend(v18, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v14, "initWithContact:address:kind:", v9, v15, 1);

LABEL_6:
    if (v10)
    {
      objc_msgSend(v18, "contact");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "CalDisplayName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDisplayString:", v17);

      -[CNComposeRecipientTextView addRecipient:](self->_composeRecipientView, "addRecipient:", v10);
      goto LABEL_8;
    }
  }
LABEL_9:
  -[EKEventAttendeePicker composeRecipientViewDidFinishPickingRecipient:](self, "composeRecipientViewDidFinishPickingRecipient:", self->_composeRecipientView);

}

- (BOOL)getSupplementalGroupsForSearchQuery:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (Class)_CNContactViewController
{
  return (Class)EKWeakLinkClass();
}

- (Class)_CNContactPickerViewController
{
  return (Class)EKWeakLinkClass();
}

- (NSString)searchAccountID
{
  return self->_searchAccountID;
}

- (void)setSearchAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (EKEventAttendeePickerDelegate)addressValidationDelegate
{
  return (EKEventAttendeePickerDelegate *)objc_loadWeakRetained((id *)&self->_addressValidationDelegate);
}

- (void)setAddressValidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_addressValidationDelegate, a3);
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (void)setHasChanges:(BOOL)a3
{
  self->_hasChanges = a3;
}

- (BOOL)shouldSuggestFamilySharees
{
  return self->_shouldSuggestFamilySharees;
}

- (void)setShouldSuggestFamilySharees:(BOOL)a3
{
  self->_shouldSuggestFamilySharees = a3;
}

- (NSArray)filterOutFamilySharees
{
  return self->_filterOutFamilySharees;
}

- (void)setFilterOutFamilySharees:(id)a3
{
  objc_storeStrong((id *)&self->_filterOutFamilySharees, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterOutFamilySharees, 0);
  objc_destroyWeak((id *)&self->_addressValidationDelegate);
  objc_storeStrong((id *)&self->_searchAccountID, 0);
  objc_storeStrong((id *)&self->_displayedRecipient, 0);
  objc_storeStrong((id *)&self->_fetchContext, 0);
  objc_storeStrong((id *)&self->_autocompleteTableViewController, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_overriddenEventEndDate, 0);
  objc_storeStrong((id *)&self->_overriddenEventStartDate, 0);
  objc_storeStrong((id *)&self->_atomPresentationOptionsByRecipient, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_recipientAddressesToRecipients, 0);
  objc_storeStrong((id *)&self->_availabilityQueue, 0);
  objc_storeStrong((id *)&self->_lastSearchId, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
  objc_storeStrong((id *)&self->_searchResultsView, 0);
  objc_storeStrong((id *)&self->_recipientScrollView, 0);
  objc_storeStrong((id *)&self->_composeRecipientView, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
}

@end
