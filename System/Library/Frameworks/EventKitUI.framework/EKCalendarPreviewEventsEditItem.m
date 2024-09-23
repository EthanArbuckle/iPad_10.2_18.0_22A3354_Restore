@implementation EKCalendarPreviewEventsEditItem

- (EKCalendarPreviewEventsEditItem)initWithPreviewSummary:(id)a3
{
  id v5;
  EKCalendarPreviewEventsEditItem *v6;
  EKCalendarPreviewEventsEditItem *v7;
  EKICSPreviewController *v8;
  void *v9;
  uint64_t v10;
  EKICSPreviewController *previewController;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKCalendarPreviewEventsEditItem;
  v6 = -[EKCalendarPreviewEventsEditItem init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_previewSummary, a3);
    v8 = [EKICSPreviewController alloc];
    -[DAESubscribedCalendarSummary data](v7->_previewSummary, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[EKICSPreviewController initWithData:eventStore:](v8, "initWithData:eventStore:", v9, 0);
    previewController = v7->_previewController;
    v7->_previewController = (EKICSPreviewController *)v10;

    -[EKICSPreviewController setShowListViewForOneEvent:](v7->_previewController, "setShowListViewForOneEvent:", 1);
  }

  return v7;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *previewEventViews;
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
  uint64_t v21;
  id v22;
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
  uint64_t v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  _QWORD v49[6];

  v49[4] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0DC3D50]);
  -[EKICSPreviewController model](self->_previewController, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v45 = v7;
    v46 = v6;
    -[EKCalendarPreviewEventsEditItem chooseEventsForPreview:count:](self, "chooseEventsForPreview:count:", v6, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __57__EKCalendarPreviewEventsEditItem_cellForSubitemAtIndex___block_invoke;
    v48[3] = &unk_1E601B488;
    v48[4] = self;
    objc_msgSend(v44, "CalMap:", v48);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    previewEventViews = self->_previewEventViews;
    self->_previewEventViews = v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithArrangedSubviews:", self->_previewEventViews);
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setAxis:", 1);
    objc_msgSend(v10, "setDirectionalLayoutMargins:", 10.0, 20.0, 10.0, 10.0);
    objc_msgSend(v10, "setLayoutMarginsRelativeArrangement:", 1);
    objc_msgSend(v10, "setSpacing:", 6.0);
    objc_msgSend(v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    v36 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v10, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v40;
    objc_msgSend(v10, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v35;
    objc_msgSend(v10, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v15;
    objc_msgSend(v10, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v4;
    objc_msgSend(v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v20);

    v21 = v45 - objc_msgSend(v44, "count");
    if (v21 >= 1)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTextColor:", v23);

      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFont:", v24);

      v25 = (void *)MEMORY[0x1E0CB3940];
      EventKitUIBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("x_more_events_dotdotdot"), &stru_1E601DFA8, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v27, v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setText:", v28);

      objc_msgSend(v10, "addArrangedSubview:", v22);
    }
    v4 = v47;
    objc_msgSend(v47, "setAccessoryType:", 1);

    v6 = v46;
  }
  else
  {
    objc_msgSend(v4, "defaultContentConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    EventKitUIBundle();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("No Events"), &stru_1E601DFA8, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setText:", v31);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "textProperties");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setColor:", v32);

    objc_msgSend(v4, "setContentConfiguration:", v29);
  }

  return v4;
}

EKCalendarPreviewEventView *__57__EKCalendarPreviewEventsEditItem_cellForSubitemAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EKCalendarPreviewEventView *v4;

  v3 = a2;
  v4 = -[EKCalendarPreviewEventView initWithEvent:calendar:]([EKCalendarPreviewEventView alloc], "initWithEvent:calendar:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  return v4;
}

- (id)chooseEventsForPreview:(id)a3 count:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "nextOccurrenceOrDetachmentAfter:", v6);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (!v14)
          v14 = v13;
        objc_msgSend(v7, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_46);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __64__EKCalendarPreviewEventsEditItem_chooseEventsForPreview_count___block_invoke_2;
  v21[3] = &unk_1E601B4D0;
  v22 = v6;
  v15 = v6;
  v16 = objc_msgSend(v7, "indexOfObjectPassingTest:", v21);
  v17 = objc_msgSend(v7, "count");
  v18 = v17;
  if (v17 < a4)
    a4 = v17;
  if (v16 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v7, "count") - v16 < a4)
    v16 = v18 - a4;
  objc_msgSend(v7, "subarrayWithRange:", v16, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __64__EKCalendarPreviewEventsEditItem_chooseEventsForPreview_count___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __64__EKCalendarPreviewEventsEditItem_chooseEventsForPreview_count___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CalIsAfterDate:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)headerTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Preview"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)calendarEditor:(id)a3 didSelectSubitem:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[EKICSPreviewController viewController](self->_previewController, "viewController", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOverrideCalendarColor:", -[EKCalendar CGColor](self->super._calendar, "CGColor"));
  -[EKCalendarEditItem delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "owningNavigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKICSPreviewController viewController](self->_previewController, "viewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v7, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewController, 0);
  objc_storeStrong((id *)&self->_previewEventViews, 0);
  objc_storeStrong((id *)&self->_previewSummary, 0);
}

@end
