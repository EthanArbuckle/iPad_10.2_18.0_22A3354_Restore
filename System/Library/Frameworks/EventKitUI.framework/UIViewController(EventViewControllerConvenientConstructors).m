@implementation UIViewController(EventViewControllerConvenientConstructors)

+ (uint64_t)eventDetailViewControllerWithEvent:()EventViewControllerConvenientConstructors delegate:context:
{
  return objc_msgSend(a1, "eventDetailViewControllerWithEvent:delegate:context:allowInlinePreview:previewInline:minimalMode:", a3, a4, a5, 1, 1, 0);
}

+ (EKEventViewController)eventDetailViewControllerWithEvent:()EventViewControllerConvenientConstructors delegate:context:allowInlinePreview:previewInline:minimalMode:
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  EKEventViewController *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  objc_msgSend(v13, "calendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "type");

  v18 = (void *)EKWeakLinkClass();
  v19 = EKWeakLinkClass();
  if (v17 == 4 && (v20 = (objc_class *)v19, objc_msgSend(v18, "authorizationStatusForEntityType:", 0) == 3))
  {
    v21 = (void *)EKWeakLinkClass();
    v22 = objc_alloc_init(v20);
    v23 = (void *)objc_msgSend((id)objc_msgSend(v18, "alloc"), "initWithConfiguration:", v22);
    objc_msgSend(v13, "birthdayContactIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "descriptorForRequiredKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "unifiedContactWithIdentifier:keysToFetch:error:", v24, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "viewControllerForContact:", v27);
    v28 = (EKEventViewController *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewController setContactStore:](v28, "setContactStore:", v23);
    -[EKEventViewController setShouldShowLinkedContacts:](v28, "setShouldShowLinkedContacts:", 1);
    -[EKEventViewController setDisplayMode:](v28, "setDisplayMode:", 1);
    -[EKEventViewController setActions:](v28, "setActions:", -[EKEventViewController actions](v28, "actions") | 0x400);
    -[EKEventViewController setAllowsEditing:](v28, "setAllowsEditing:", 0);
    if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EEEB13F8))
      -[EKEventViewController setDelegate:](v28, "setDelegate:", v14);

  }
  else
  {
    v28 = objc_alloc_init(EKEventViewController);
    -[EKEventViewController setContext:](v28, "setContext:", v15);
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("EKUIEventDetailsContext_AllowsCalendarPreview"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
      -[EKEventViewController setAllowsCalendarPreview:](v28, "setAllowsCalendarPreview:", objc_msgSend(v29, "BOOLValue"));
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("EKUIEventDetailsContext_CalendarPreviewIsInlineDayView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      -[EKEventViewController setCalendarPreviewIsInlineDayView:](v28, "setCalendarPreviewIsInlineDayView:", objc_msgSend(v31, "BOOLValue"));
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("EKUIEventDetailsContext_MinimalMode"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
      -[EKEventViewController setMinimalMode:](v28, "setMinimalMode:", objc_msgSend(v32, "BOOLValue"));
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("EKUIEventDetailsContext_AllowsConferenceItem"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
      -[EKEventViewController setShowsDetectedConferenceItem:](v28, "setShowsDetectedConferenceItem:", objc_msgSend(v33, "BOOLValue"));
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("EKUIEventDetailsContext_ShowsDoneButton"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
      -[EKEventViewController setShowsDoneButton:](v28, "setShowsDoneButton:", objc_msgSend(v34, "BOOLValue"));
    if (objc_msgSend(v14, "conformsToProtocol:", &unk_1EEED6090))
      -[EKEventViewController setDelegate:](v28, "setDelegate:", v14);
    -[EKEventViewController setAllowsCalendarPreview:](v28, "setAllowsCalendarPreview:", a6);
    -[EKEventViewController setCalendarPreviewIsInlineDayView:](v28, "setCalendarPreviewIsInlineDayView:", a7);
    -[EKEventViewController setMinimalMode:](v28, "setMinimalMode:", a8);
    -[EKEventViewController setAllowsEditing:](v28, "setAllowsEditing:", 1);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[EKEventViewController setEditorShowTransition:](v28, "setEditorShowTransition:", objc_msgSend(v14, "editorShowTransition"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[EKEventViewController setEditorHideTransition:](v28, "setEditorHideTransition:", objc_msgSend(v14, "editorHideTransition"));
    -[EKEventViewController setEvent:](v28, "setEvent:", v13);

  }
  return v28;
}

@end
