@implementation DDRemoteTimeLineViewControllerProvider

- (void)createViewControllerWithCompletionHandler:(id)a3
{
  double v5;
  double Helper_x8__OBJC_CLASS___APApplication;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t i;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  APBaseExtensionShieldView *shieldView;
  DDEKDayViewController *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  uint64_t v80;
  void *v81;
  DDRemoteTimeLineViewControllerProvider *v82;
  void *v83;
  void *v84;
  void *v85;
  void (**v86)(id, DDEKDayViewController *);
  void *v87;
  _QWORD v88[5];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  const __CFString *v97;
  void *v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v86 = (void (**)(id, DDEKDayViewController *))a3;
  Helper_x8__OBJC_CLASS___APApplication = gotLoadHelper_x8__OBJC_CLASS___APApplication(v5);
  objc_msgSend(*(id *)(v7 + 1672), "applicationWithBundleIdentifier:", CFSTR("com.apple.mobilecal"), Helper_x8__OBJC_CLASS___APApplication);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v87, "isEffectivelyLocked"))
  {
    v93 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.mobilecal"), 1, &v93);
    v9 = v93;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DDRemoteTimeLineViewControllerProvider.m"), 112, CFSTR("couldn't get calendar app properties LS db %@"), v9);

    }
    objc_msgSend(v8, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    gotLoadHelper_x8__OBJC_CLASS___ISIcon(v11);
    v13 = (void *)objc_msgSend(objc_alloc(*(Class *)(v12 + 2080)), "initWithBundleIdentifier:", CFSTR("com.apple.mobilecal"));
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    objc_msgSend(MEMORY[0x1E0CEA950], "screens");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v90;
      v18 = 1.0;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v90 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "scale");
          if (v18 < v20)
            v18 = v20;
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
      }
      while (v16);
    }
    else
    {
      v18 = 1.0;
    }

    gotLoadHelper_x8__OBJC_CLASS___ISImageDescriptor(v21);
    v23 = (void *)objc_msgSend(objc_alloc(*(Class *)(v22 + 2096)), "initWithSize:scale:", 64.0, 64.0, v18);
    objc_msgSend(v23, "setDrawBorder:", 1);
    objc_msgSend(v13, "prepareImageForDescriptor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CEA638];
    v26 = objc_msgSend(v24, "CGImage");
    objc_msgSend(v24, "scale");
    objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    gotLoadHelper_x8__OBJC_CLASS___APBaseExtensionShieldView(v28);
    v30 = (void *)objc_msgSend(objc_alloc(*(Class *)(v29 + 1728)), "initWithLocalizedApplicationName:iconImage:unlockButtonHidden:", v10, v27, 1);
    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundColor:", v31);

    shieldView = self->_shieldView;
    self->_shieldView = (APBaseExtensionShieldView *)v30;

  }
  v33 = -[EKDayViewController initWithTargetSizeClass:]([DDEKDayViewController alloc], "initWithTargetSizeClass:", 0);
  -[EKDayViewController setDelegate:](v33, "setDelegate:", self);
  -[EKDayViewController setDataSource:](v33, "setDataSource:", self);
  -[EKDayViewController setShowsBanner:](v33, "setShowsBanner:", 0);
  -[EKDayViewController setAllowsSelection:](v33, "setAllowsSelection:", 0);
  -[EKDayViewController setAllowsDaySwitching:](v33, "setAllowsDaySwitching:", 0);
  v34 = objc_alloc_init(MEMORY[0x1E0CAA078]);
  -[DDRemoteTimeLineViewControllerProvider setStore:](self, "setStore:", v34);

  -[DDRemoteActionViewControllerProvider actionContext](self, "actionContext");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "context");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[DDRemoteActionViewControllerProvider actionContext](self, "actionContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "context");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("AllResults"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      v40 = 0;
      goto LABEL_22;
    }
    -[DDRemoteActionViewControllerProvider actionContext](self, "actionContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "context");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v44, "mutableCopy");

    -[DDRemoteActionViewControllerProvider actionContext](self, "actionContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v41, "result");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, CFSTR("AllResults"));
  }
  else
  {
    v97 = CFSTR("AllResults");
    -[DDRemoteActionViewControllerProvider actionContext](self, "actionContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v41, "result");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  -[DDRemoteTimeLineViewControllerProvider store](self, "store");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDRemoteActionViewControllerProvider actionContext](self, "actionContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "associatedResults");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  DDUIEventForResults(v45, v47, v40);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  -[DDRemoteTimeLineViewControllerProvider store](self, "store");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDRemoteActionViewControllerProvider actionContext](self, "actionContext");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "associatedResults");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDRemoteActionViewControllerProvider actionContext](self, "actionContext");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "hostApplicationIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  DDUISuggestedEventForResults(v49, v51, v40, v53, 0, 0);
  v54 = objc_claimAutoreleasedReturnValue();

  v55 = (void *)v54;
  v56 = v87;
  if (!v55)
    goto LABEL_32;
  objc_msgSend(v55, "title");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "length");

  if (v58)
  {
    objc_msgSend(v55, "title");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setTitle:", v59);

  }
  objc_msgSend(v55, "startDate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    objc_msgSend(v48, "setAllDay:", 0);
    objc_msgSend(v55, "startDate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setStartDate:", v61);

    objc_msgSend(v55, "endDate");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setEndDate:", v62);

  }
  objc_msgSend(v55, "startDate");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v63)
  {
    objc_msgSend(v55, "duration");
    if (v64 > 0.0)
    {
      if ((objc_msgSend(v48, "isAllDay") & 1) != 0)
        goto LABEL_32;
      objc_msgSend(v48, "startDate");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "duration");
      objc_msgSend(v63, "dateByAddingTimeInterval:");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setEndDate:", v65);

    }
  }

LABEL_32:
  v85 = v55;
  -[DDRemoteTimeLineViewControllerProvider store](self, "store");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "defaultCalendarForNewEvents");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setCalendar:", v67);

  v68 = objc_alloc_init(MEMORY[0x1E0CA9FD0]);
  objc_msgSend(v68, "setParticipantStatus:", 4);
  v94 = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setAttendees:", v69);

  objc_msgSend(v48, "setStatus:", 2);
  -[DDRemoteTimeLineViewControllerProvider setEvent:](self, "setEvent:", v48);
  -[DDEKDayViewController setDd_event:](v33, "setDd_event:", v48);
  objc_msgSend(v48, "startDate");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70)
    objc_msgSend(v48, "startDate");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDayViewController calendar](v33, "calendar");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "components:fromDate:", 62, v71);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKDayViewController setDisplayDate:](v33, "setDisplayDate:", v73);
  if (self->_shieldView)
  {
    -[DDEKDayViewController view](v33, "view");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addSubview:", self->_shieldView);
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_shieldView, 9, 0, v74, 9, 1.0, 0.0);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addConstraint:", v75);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_shieldView, 10, 0, v74, 10, 1.0, 0.0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addConstraint:", v76);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_shieldView, 7, 0, v74, 7, 1.0, 0.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addConstraint:", v77);

    v56 = v87;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_shieldView, 8, 0, v74, 8, 1.0, 0.0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "addConstraint:", v78);

    gotLoadHelper_x8__OBJC_CLASS___APGuard(v79);
    v81 = *(void **)(v80 + 1680);
    v82 = self;
    objc_msgSend(v81, "sharedGuard");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __84__DDRemoteTimeLineViewControllerProvider_createViewControllerWithCompletionHandler___block_invoke;
    v88[3] = &unk_1E42582B0;
    v88[4] = v82;
    objc_msgSend(v83, "authenticateForSubject:completion:", v87, v88);

  }
  v86[2](v86, v33);

}

void __84__DDRemoteTimeLineViewControllerProvider_createViewControllerWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  BOOL v3;
  id v4;
  _QWORD block[5];

  v2 = *(void **)(a1 + 32);
  if (v2)
    v3 = a2 == 0;
  else
    v3 = 1;
  if (!v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__DDRemoteTimeLineViewControllerProvider_createViewControllerWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E42580C8;
    block[4] = v2;
    v4 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __84__DDRemoteTimeLineViewControllerProvider_createViewControllerWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (id)dayViewController:(id)a3 eventsForStartDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  id v40;
  NSObject *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[DDRemoteTimeLineViewControllerProvider setEvents:](self, "setEvents:", 0);
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  -[DDRemoteTimeLineViewControllerProvider store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __87__DDRemoteTimeLineViewControllerProvider_dayViewController_eventsForStartDate_endDate___block_invoke;
  v38[3] = &unk_1E4258320;
  v38[4] = self;
  v33 = v7;
  v39 = v33;
  v11 = v8;
  v40 = v11;
  v12 = v9;
  v41 = v12;
  objc_msgSend(v10, "requestFullAccessToEventsWithCompletion:", v38);

  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[DDRemoteTimeLineViewControllerProvider events](self, "events");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v20, "isAllDay"))
          v21 = v13;
        else
          v21 = v14;
        objc_msgSend(v21, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v17);
  }

  -[DDRemoteTimeLineViewControllerProvider event](self, "event");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v22;
  if (v22)
  {
    if (objc_msgSend(v22, "isAllDay"))
      v25 = v13;
    else
      v25 = v14;
    objc_msgSend(v25, "addObject:", v24);
    -[DDRemoteTimeLineViewControllerProvider events](self, "events");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "arrayByAddingObject:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDRemoteTimeLineViewControllerProvider setEvents:](self, "setEvents:", v27);

  }
  gotLoadHelper_x8__OBJC_CLASS___CUIKOccurrencesCollection(v23);
  v29 = objc_alloc(*(Class *)(v28 + 3520));
  -[DDRemoteTimeLineViewControllerProvider events](self, "events");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithOccurrences:timedOccurrences:allDayOccurrences:", v30, v14, v13);

  return v31;
}

void __87__DDRemoteTimeLineViewControllerProvider_dayViewController_eventsForStartDate_endDate___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  if (a2)
  {
    dispatch_get_global_queue(21, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __87__DDRemoteTimeLineViewControllerProvider_dayViewController_eventsForStartDate_endDate___block_invoke_2;
    v5[3] = &unk_1E42582F8;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v7 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    dispatch_async(v3, v5);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

void __87__DDRemoteTimeLineViewControllerProvider_dayViewController_eventsForStartDate_endDate___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarsForEntityType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForEventsWithStartDate:endDate:calendars:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventsMatchingPredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEvents:", v8);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __87__DDRemoteTimeLineViewControllerProvider_dayViewController_eventsForStartDate_endDate___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHidden") ^ 1;
}

- (BOOL)dayViewControllerShouldRespondToApplicationDidBecomeActiveStateChange:(id)a3
{
  return 1;
}

- (id)dayViewController:(id)a3 createEventAtDate:(id)a4 allDay:(BOOL)a5
{
  return 0;
}

- (BOOL)dayViewControllerShouldAllowLongPress:(id)a3
{
  return 0;
}

- (void)dayViewControllerDidReloadData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDRemoteTimeLineViewControllerProvider event](self, "event");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollEventIntoView:animated:", v5, 0);

}

- (BOOL)delegateWantsToHandleDayViewController:(id)a3 gestureCommittingOccurrence:(id)a4
{
  return 0;
}

- (BOOL)dayviewControllerShouldAllowSwipeToChangeDays:(id)a3
{
  return 1;
}

- (BOOL)dayViewControllerShouldShowDetachDialogOnGestureDraggingEnd:(id)a3
{
  return 0;
}

- (id)selectedEventsForEditMenu
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSArray)events
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (EKEvent)event
{
  return (EKEvent *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (EKEventStore)store
{
  return (EKEventStore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_shieldView, 0);
}

@end
