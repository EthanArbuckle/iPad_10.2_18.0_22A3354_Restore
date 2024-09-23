@implementation EKUIRecurrenceDifferenceViewController

- (EKUIRecurrenceDifferenceViewController)initWithEvent:(id)a3 andSummary:(id)a4
{
  id v7;
  id v8;
  EKUIRecurrenceDifferenceViewController *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EKUIRecurrenceDifferenceViewController;
  v9 = -[EKUIRecurrenceDifferenceViewController initWithStyle:](&v13, sel_initWithStyle_, 2);
  if (v9)
  {
    EventKitUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Event Changes"), &stru_1E601DFA8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIRecurrenceDifferenceViewController setTitle:](v9, "setTitle:", v11);

    objc_storeStrong((id *)&v9->_event, a3);
    objc_storeStrong((id *)&v9->_diffSummary, a4);
    -[EKUIRecurrenceDifferenceViewController findSemanticAlarmDifferenceFromOriginal:](v9, "findSemanticAlarmDifferenceFromOriginal:", v9->_event);
    -[EKUIRecurrenceDifferenceViewController findSemanticAttendeeDifferenceFromOriginal:](v9, "findSemanticAttendeeDifferenceFromOriginal:", v9->_event);
  }

  return v9;
}

+ (BOOL)shouldShowRecurrenceDiff:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  if (shouldShowRecurrenceDiff__onceToken != -1)
    dispatch_once(&shouldShowRecurrenceDiff__onceToken, &__block_literal_global_30);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__EKUIRecurrenceDifferenceViewController_shouldShowRecurrenceDiff___block_invoke_2;
  v6[3] = &unk_1E601AAD0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __67__EKUIRecurrenceDifferenceViewController_shouldShowRecurrenceDiff___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[19];

  v12[18] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CA9EF8];
  v12[0] = *MEMORY[0x1E0CA9F50];
  v12[1] = v0;
  v1 = *MEMORY[0x1E0CA9F40];
  v12[2] = *MEMORY[0x1E0CA9E88];
  v12[3] = v1;
  v2 = *MEMORY[0x1E0CA9F48];
  v12[4] = *MEMORY[0x1E0CA9EE0];
  v12[5] = v2;
  v3 = *MEMORY[0x1E0CA9F58];
  v12[6] = *MEMORY[0x1E0CA9EE8];
  v12[7] = v3;
  v4 = *MEMORY[0x1E0CA9F10];
  v12[8] = *MEMORY[0x1E0CA9EC0];
  v12[9] = v4;
  v5 = *MEMORY[0x1E0CA9F60];
  v12[10] = *MEMORY[0x1E0CA9F00];
  v12[11] = v5;
  v6 = *MEMORY[0x1E0CA9E80];
  v12[12] = *MEMORY[0x1E0CA9E70];
  v12[13] = v6;
  v7 = *MEMORY[0x1E0CA9EA8];
  v12[14] = *MEMORY[0x1E0CA9E78];
  v12[15] = v7;
  v8 = *MEMORY[0x1E0CA9EB0];
  v12[16] = *MEMORY[0x1E0CA9EB8];
  v12[17] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)shouldShowRecurrenceDiff__changesToShowDiffFor;
  shouldShowRecurrenceDiff__changesToShowDiffFor = v10;

}

uint64_t __67__EKUIRecurrenceDifferenceViewController_shouldShowRecurrenceDiff___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)shouldShowRecurrenceDiff__changesToShowDiffFor, "containsObject:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)loadView
{
  void *v2;
  NSMutableArray *v4;
  NSMutableArray *changedRows;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)EKUIRecurrenceDifferenceViewController;
  -[EKUIRecurrenceDifferenceViewController loadView](&v29, sel_loadView);
  v4 = (NSMutableArray *)objc_opt_new();
  changedRows = self->_changedRows;
  self->_changedRows = v4;

  -[NSDictionary allKeys](self->_diffSummary, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0CA9F50]);

  if (v7)
    -[NSMutableArray addObject:](self->_changedRows, "addObject:", &unk_1E606F288);
  -[NSDictionary allKeys](self->_diffSummary, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", *MEMORY[0x1E0CA9EF8]);

  if (v9)
    -[NSMutableArray addObject:](self->_changedRows, "addObject:", &unk_1E606F2A0);
  -[NSDictionary allKeys](self->_diffSummary, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsObject:", *MEMORY[0x1E0CA9E88]) & 1) != 0)
    goto LABEL_12;
  -[NSDictionary allKeys](self->_diffSummary, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "containsObject:", *MEMORY[0x1E0CA9F40]) & 1) != 0)
  {
LABEL_11:

LABEL_12:
LABEL_13:
    -[NSMutableArray addObject:](self->_changedRows, "addObject:", &unk_1E606F2B8);
    goto LABEL_14;
  }
  -[NSDictionary allKeys](self->_diffSummary, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0CA9EE0]) & 1) != 0)
  {
LABEL_10:

    goto LABEL_11;
  }
  -[NSDictionary allKeys](self->_diffSummary, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "containsObject:", *MEMORY[0x1E0CA9F48]) & 1) != 0)
  {

    goto LABEL_10;
  }
  -[NSDictionary allKeys](self->_diffSummary, "allKeys");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "containsObject:", *MEMORY[0x1E0CA9EE8]);

  if ((v28 & 1) != 0)
    goto LABEL_13;
LABEL_14:
  -[NSDictionary allKeys](self->_diffSummary, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", *MEMORY[0x1E0CA9F58]);

  if (v14)
    -[NSMutableArray addObject:](self->_changedRows, "addObject:", &unk_1E606F2D0);
  -[NSDictionary allKeys](self->_diffSummary, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", *MEMORY[0x1E0CA9EC0]);

  if (v16)
    -[NSMutableArray addObject:](self->_changedRows, "addObject:", &unk_1E606F2E8);
  -[NSDictionary allKeys](self->_diffSummary, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", *MEMORY[0x1E0CA9F00]);

  if (v18)
    -[NSMutableArray addObject:](self->_changedRows, "addObject:", &unk_1E606F300);
  -[NSDictionary allKeys](self->_diffSummary, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "containsObject:", *MEMORY[0x1E0CA9F60]);

  if ((_DWORD)v20)
  {
    -[EKEvent URL](self->_event, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      -[EKEvent originalItem](self->_event, "originalItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URL");
      v22 = objc_claimAutoreleasedReturnValue();
      if (!v22)
      {

        goto LABEL_30;
      }
      v2 = (void *)v22;
    }
    -[EKEvent URL](self->_event, "URL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEvent originalItem](self->_event, "originalItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "URL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "isEqual:", v25);

    if (v21)
    {

      if ((v26 & 1) != 0)
        goto LABEL_30;
      goto LABEL_28;
    }

    if ((v26 & 1) == 0)
LABEL_28:
      -[NSMutableArray addObject:](self->_changedRows, "addObject:", &unk_1E606F318);
  }
LABEL_30:
  if (-[NSArray count](self->_attendeesAdded, "count") || -[NSArray count](self->_attendeesRemoved, "count"))
    -[NSMutableArray addObject:](self->_changedRows, "addObject:", &unk_1E606F330);
  if (-[NSArray count](self->_alarmsAdded, "count") || -[NSArray count](self->_alarmsRemoved, "count"))
    -[NSMutableArray addObject:](self->_changedRows, "addObject:", &unk_1E606F348);
}

- (id)titleForDiffType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0:
      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Title");
      goto LABEL_12;
    case 1:
      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Location");
      goto LABEL_12;
    case 2:
      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Date and Time");
      goto LABEL_12;
    case 3:
      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Travel Time");
      goto LABEL_12;
    case 4:
      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Availability");
      goto LABEL_12;
    case 5:
      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Notes");
      goto LABEL_12;
    case 6:
      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("URL");
      goto LABEL_12;
    case 7:
      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Alarms");
      goto LABEL_12;
    case 8:
      EventKitUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("Attendees");
LABEL_12:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E601DFA8, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (int64_t)rowCountForDiffType:(int64_t)a3
{
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;

  -[EKEvent originalItem](self->_event, "originalItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 2;
  switch(a3)
  {
    case 0:
    case 2:
    case 4:
      break;
    case 1:
      -[EKEvent location](self->_event, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");
      objc_msgSend(v5, "location");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      -[EKEvent travelTime](self->_event, "travelTime");
      v11 = v10;
      objc_msgSend(v5, "travelTime");
      if (v11 <= 0.0)
        v6 = v12 > 0.0;
      else
        v6 = (v12 > 0.0) + 1;
      break;
    case 5:
      -[EKEvent displayNotes](self->_event, "displayNotes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "length");
      objc_msgSend(v5, "displayNotes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v13 = v9;
      v14 = objc_msgSend(v9, "length");
      if (v8)
        v6 = (v14 != 0) + 1;
      else
        v6 = v14 != 0;
      goto LABEL_15;
    case 6:
      -[EKEvent URL](self->_event, "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "absoluteString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "length");
      objc_msgSend(v5, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");
      if (v15)
        v6 = (v18 != 0) + 1;
      else
        v6 = v18 != 0;

LABEL_15:
      break;
    case 7:
      v19 = -[NSArray count](self->_alarmsAdded, "count");
      v20 = 1048;
      goto LABEL_18;
    case 8:
      v19 = -[NSArray count](self->_attendeesAdded, "count");
      v20 = 1064;
LABEL_18:
      v21 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v20), "count");
      if (v19)
        v6 = (v21 != 0) + 1;
      else
        v6 = v21 != 0;
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)dateTimeStringForEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  -[EKUIRecurrenceDifferenceViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  v17 = 0;
  v18 = 0;
  if (v6 <= 1)
    v7 = 1;
  else
    v7 = v6;
  v15 = 0;
  v16 = 0;
  CalDetailStringsForCalendarEvent(v4, v7, &v18, &v17, &v16, &v15, 0, 0);

  v8 = v18;
  v9 = v17;
  v10 = (unint64_t)v16;
  v11 = (unint64_t)v15;
  v12 = (void *)objc_opt_new();
  v13 = v12;
  if (v8)
  {
    objc_msgSend(v12, "appendString:", v8);
    if (!v9 && !v10 && !v11)
      goto LABEL_17;
    objc_msgSend(v13, "appendString:", CFSTR("\n"));
  }
  if (v9)
  {
    objc_msgSend(v13, "appendString:", v9);
    if (!(v10 | v11))
      goto LABEL_17;
    objc_msgSend(v13, "appendString:", CFSTR("\n"));
  }
  if (v10)
  {
    objc_msgSend(v13, "appendString:", v10);
    if (v11)
    {
      objc_msgSend(v13, "appendString:", CFSTR("\n"));
LABEL_16:
      objc_msgSend(v13, "appendString:", v11);
    }
  }
  else if (v11)
  {
    goto LABEL_16;
  }
LABEL_17:

  return v13;
}

- (void)findSemanticAlarmDifferenceFromOriginal:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSArray *alarmsAdded;
  NSArray *v22;
  NSArray *alarmsRemoved;
  void *v25;
  id obj;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "alarms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v25 = v3;
  objc_msgSend(v3, "originalItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alarms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v8);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = v9;
  obj = (id)-[NSArray copy](v9, "copy");
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v12 = (void *)-[NSArray copy](v30, "copy");
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v32;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v32 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
              objc_msgSend(v11, "semanticIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "semanticIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v18, "isEqualToString:", v19);

              if (v20)
              {
                -[NSArray removeObject:](v27, "removeObject:", v11);
                -[NSArray removeObject:](v30, "removeObject:", v17);
                goto LABEL_16;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v14)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v29);
  }

  alarmsAdded = self->_alarmsAdded;
  self->_alarmsAdded = v30;
  v22 = v30;

  alarmsRemoved = self->_alarmsRemoved;
  self->_alarmsRemoved = v27;

}

- (void)findSemanticAttendeeDifferenceFromOriginal:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSArray *attendeesAdded;
  NSArray *v34;
  NSArray *attendeesRemoved;
  EKUIRecurrenceDifferenceViewController *v36;
  void *v37;
  id obj;
  NSArray *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSArray *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v36 = self;
  v59 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "attendees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v43 = (NSArray *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "originalItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attendees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v8);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();

  v41 = v3;
  objc_msgSend(v3, "selfAttendee");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v39 = v9;
  obj = (id)-[NSArray copy](v9, "copy");
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v42)
  {
    v40 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v53 != v40)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v12 = (void *)-[NSArray copy](v43, "copy", v36);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v49;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v49 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
              objc_msgSend(v11, "semanticIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "semanticIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v18, "isEqualToString:", v19);

              if (v20)
              {
                -[NSArray removeObject:](v39, "removeObject:", v11);
                -[NSArray removeObject:](v43, "removeObject:", v17);
                goto LABEL_16;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            if (v14)
              continue;
            break;
          }
        }
LABEL_16:

        if ((objc_msgSend(v41, "isExternallyOrganizedInvitation") & 1) == 0)
        {
          objc_msgSend(v11, "semanticIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "semanticIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToString:", v22);

          if (v23)
            -[NSArray removeObject:](v39, "removeObject:", v11);
        }
      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    }
    while (v42);
  }

  if ((objc_msgSend(v41, "isExternallyOrganizedInvitation") & 1) == 0)
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v24 = (void *)-[NSArray copy](v43, "copy");
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v45;
      while (2)
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v45 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * k);
          objc_msgSend(v29, "semanticIdentifier", v36);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "semanticIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v30, "isEqualToString:", v31);

          if (v32)
          {
            -[NSArray removeObject:](v43, "removeObject:", v29);
            goto LABEL_32;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
        if (v26)
          continue;
        break;
      }
    }
LABEL_32:

  }
  attendeesAdded = v36->_attendeesAdded;
  v36->_attendeesAdded = v43;
  v34 = v43;

  attendeesRemoved = v36->_attendeesRemoved;
  v36->_attendeesRemoved = v39;

}

- (id)stringForAlarms:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  EKUIRecurrenceDifferenceViewController *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__EKUIRecurrenceDifferenceViewController_stringForAlarms___block_invoke;
  v11[3] = &unk_1E601AAF8;
  v6 = v5;
  v12 = v6;
  v13 = self;
  v14 = v4;
  v7 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  v8 = v14;
  v9 = v6;

  return v9;
}

uint64_t __58__EKUIRecurrenceDifferenceViewController_stringForAlarms___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  double v6;
  void *v7;
  uint64_t result;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "relativeOffset");
  CalStringForRelativeOffset(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1016), "isAllDay"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v7);

  result = objc_msgSend(*(id *)(a1 + 48), "count");
  if (result - 1 > a3)
    return objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return result;
}

- (id)stringForAttendees:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__EKUIRecurrenceDifferenceViewController_stringForAttendees___block_invoke;
  v10[3] = &unk_1E601AB20;
  v5 = v4;
  v11 = v5;
  v12 = v3;
  v6 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v7 = v12;
  v8 = v5;

  return v8;
}

void __61__EKUIRecurrenceDifferenceViewController_stringForAttendees___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CAA0E8], "participantForSortingWithEKParticipant:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v8 = v5;
  objc_msgSend(v5, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 > a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));

}

- (id)descriptionForDiffType:(int64_t)a3 row:(BOOL)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  EKEvent *v14;
  EKEvent *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  int v23;
  double v24;
  void *v25;
  void *v26;
  EKEvent *event;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  EKEvent *v34;
  EKEvent *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int *v39;
  int *v40;
  void *v41;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  _QWORD v50[2];
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v48 = (void *)objc_opt_new();
  v52 = *MEMORY[0x1E0DC1138];
  v7 = v52;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v8;
  v53 = *MEMORY[0x1E0DC1140];
  v9 = v53;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v52, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v50[0] = v7;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v9;
  v51[0] = v11;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEvent originalItem](self->_event, "originalItem");
  v14 = (EKEvent *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (a4)
  {
    v16 = v48;
    if ((unint64_t)(a3 - 7) >= 2)
    {
LABEL_8:
      v17 = objc_alloc(MEMORY[0x1E0CB3498]);
      EventKitUIBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("This Occurrence:\n <no loc>");
      v21 = CFSTR("This Occurrence:\n");
    }
    else
    {
LABEL_3:
      v17 = objc_alloc(MEMORY[0x1E0CB3498]);
      EventKitUIBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("Removed:\n <no loc>");
      v21 = CFSTR("Removed:\n");
    }
    objc_msgSend(v18, "localizedStringForKey:value:table:", v20, v21, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v17, "initWithString:attributes:", v25, v13);
    v23 = 0;
  }
  else
  {
    v16 = v48;
    switch(a3)
    {
      case 0:
      case 2:
      case 4:
        goto LABEL_14;
      case 1:
        -[EKEvent location](v14, "location");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 3:
        -[EKEvent travelTime](v14, "travelTime");
        if (v24 <= 0.0)
          goto LABEL_8;
        goto LABEL_14;
      case 5:
        -[EKEvent displayNotes](v14, "displayNotes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v28 = v22;
        v29 = objc_msgSend(v22, "length");

        if (v29)
          goto LABEL_14;
        goto LABEL_8;
      case 6:
        -[EKEvent URL](v14, "URL");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "absoluteString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "length");

        if (!v45)
          goto LABEL_8;
LABEL_14:
        v30 = objc_alloc(MEMORY[0x1E0CB3498]);
        EventKitUIBundle();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Original:\n <no loc>"), CFSTR("Original:\n"), 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v30, "initWithString:attributes:", v32, v13);
        objc_msgSend(v48, "appendAttributedString:", v33);

        v23 = 0;
        event = v15;
        goto LABEL_15;
      case 7:
        v46 = 1040;
        goto LABEL_36;
      case 8:
        v46 = 1056;
LABEL_36:
        if (!objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v46), "count"))
          goto LABEL_3;
        v47 = objc_alloc(MEMORY[0x1E0CB3498]);
        EventKitUIBundle();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Added:\n <no loc>"), CFSTR("Added:\n"), 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v47, "initWithString:attributes:", v25, v13);
        v23 = 1;
        break;
      default:
        v23 = 0;
        v16 = v48;
        goto LABEL_11;
    }
  }
  objc_msgSend(v16, "appendAttributedString:", v26);

LABEL_11:
  event = self->_event;
LABEL_15:
  v34 = event;
  v35 = v34;
  switch(a3)
  {
    case 0:
      -[EKEvent title](v34, "title");
      v36 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 1:
    case 5:
      -[EKEvent location](v34, "location");
      v36 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 2:
      -[EKUIRecurrenceDifferenceViewController dateTimeStringForEvent:](self, "dateTimeStringForEvent:", v34);
      v36 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 3:
      -[EKEvent travelTime](v34, "travelTime");
      CUIKDisplayStringTravelTimeAndDuration();
      v36 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 4:
      -[EKEvent availability](v34, "availability");
      CUIKDisplayStringForAvailability();
      v36 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 6:
      -[EKEvent URL](v34, "URL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "absoluteString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
        break;
      goto LABEL_30;
    case 7:
      v39 = &OBJC_IVAR___EKUIRecurrenceDifferenceViewController__alarmsRemoved;
      if (v23)
        v39 = &OBJC_IVAR___EKUIRecurrenceDifferenceViewController__alarmsAdded;
      -[EKUIRecurrenceDifferenceViewController stringForAlarms:](self, "stringForAlarms:", *(Class *)((char *)&self->super.super.super.super.isa + *v39));
      v36 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    case 8:
      v40 = &OBJC_IVAR___EKUIRecurrenceDifferenceViewController__attendeesRemoved;
      if (v23)
        v40 = &OBJC_IVAR___EKUIRecurrenceDifferenceViewController__attendeesAdded;
      -[EKUIRecurrenceDifferenceViewController stringForAttendees:](self, "stringForAttendees:", *(Class *)((char *)&self->super.super.super.super.isa + *v40));
      v36 = objc_claimAutoreleasedReturnValue();
LABEL_29:
      v38 = (void *)v36;
      if (v36)
      {
LABEL_30:
        v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v38, v49);
        objc_msgSend(v16, "appendAttributedString:", v41);

      }
      break;
    default:
      break;
  }

  return v16;
}

- (void)revertChangeForDiffType:(int64_t)a3 row:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  uint64_t j;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *n;
  void *v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t ii;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t m;
  void *v42;
  int64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  NSArray *obj;
  id obja;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  -[EKEvent shallowCopyWithoutChanges](self->_event, "shallowCopyWithoutChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  switch(a3)
  {
    case 0:
      objc_msgSend(v7, "title");
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:", v9);
      goto LABEL_63;
    case 1:
      objc_msgSend(v6, "originalItem");
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[NSArray structuredLocationWithoutPrediction](v9, "structuredLocationWithoutPrediction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setStructuredLocationWithoutPrediction:", v10);
      goto LABEL_5;
    case 2:
      objc_msgSend(v6, "originalStartDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setStartDate:", v11);

      objc_msgSend(v6, "startDate");
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "duration");
      -[NSArray dateByAddingTimeInterval:](v9, "dateByAddingTimeInterval:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEndDate:", v10);
LABEL_5:

      goto LABEL_63;
    case 3:
      objc_msgSend(v7, "travelTime");
      objc_msgSend(v6, "setTravelTime:");
      break;
    case 4:
      objc_msgSend(v6, "setAvailability:", objc_msgSend(v7, "availability"));
      break;
    case 5:
      objc_msgSend(v7, "displayNotes");
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDisplayNotes:", v9);
      goto LABEL_63;
    case 6:
      objc_msgSend(v7, "URL");
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setURL:", v9);
      goto LABEL_63;
    case 7:
      if (a4 == 1 || !-[NSArray count](self->_alarmsAdded, "count"))
      {
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        obj = self->_alarmsRemoved;
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v74 != v25)
                objc_enumerationMutation(obj);
              objc_msgSend(v6, "addAlarm:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i));
            }
            v24 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
          }
          while (v24);
        }
      }
      else
      {
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        objc_msgSend(v6, "alarms");
        obj = (NSArray *)objc_claimAutoreleasedReturnValue();
        v49 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
        if (v49)
        {
          v43 = a4;
          v44 = v8;
          v46 = *(id *)v70;
          do
          {
            for (j = 0; j != v49; ++j)
            {
              if (*(id *)v70 != v46)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
              v65 = 0u;
              v66 = 0u;
              v67 = 0u;
              v68 = 0u;
              v14 = self->_alarmsAdded;
              v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v66;
                do
                {
                  for (k = 0; k != v16; ++k)
                  {
                    if (*(_QWORD *)v66 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
                    objc_msgSend(v13, "semanticIdentifier");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "semanticIdentifier");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = objc_msgSend(v20, "isEqualToString:", v21);

                    if (v22)
                      objc_msgSend(v6, "removeAlarm:", v13);
                  }
                  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
                }
                while (v16);
              }

            }
            v49 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
          }
          while (v49);
          a4 = v43;
          v8 = v44;
        }
      }

      goto LABEL_37;
    case 8:
LABEL_37:
      if (a4 == 1 || !-[NSArray count](self->_attendeesAdded, "count"))
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v9 = self->_attendeesRemoved;
        v38 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
        if (v38)
        {
          v39 = v38;
          v40 = *(_QWORD *)v62;
          do
          {
            for (m = 0; m != v39; ++m)
            {
              if (*(_QWORD *)v62 != v40)
                objc_enumerationMutation(v9);
              objc_msgSend(v6, "addAttendee:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * m));
            }
            v39 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
          }
          while (v39);
        }
LABEL_63:

      }
      else
      {
        v45 = v8;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v6, "attendees");
        v47 = (id)objc_claimAutoreleasedReturnValue();
        obja = (id)objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
        if (obja)
        {
          v48 = *(_QWORD *)v58;
          do
          {
            for (n = 0; n != obja; n = (char *)n + 1)
            {
              if (*(_QWORD *)v58 != v48)
                objc_enumerationMutation(v47);
              v28 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)n);
              v53 = 0u;
              v54 = 0u;
              v55 = 0u;
              v56 = 0u;
              v29 = self->_attendeesAdded;
              v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
              if (v30)
              {
                v31 = v30;
                v32 = *(_QWORD *)v54;
                do
                {
                  for (ii = 0; ii != v31; ++ii)
                  {
                    if (*(_QWORD *)v54 != v32)
                      objc_enumerationMutation(v29);
                    v34 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * ii);
                    objc_msgSend(v28, "semanticIdentifier");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "semanticIdentifier");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = objc_msgSend(v35, "isEqualToString:", v36);

                    if (v37)
                      objc_msgSend(v6, "removeAttendee:", v28);
                  }
                  v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v53, v77, 16);
                }
                while (v31);
              }

            }
            obja = (id)objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v57, v78, 16);
          }
          while (obja);
        }

        v8 = v45;
      }
      break;
    default:
      break;
  }
  objc_msgSend(v6, "eventStore");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "saveEvent:span:error:", v6, 0, 0);

}

- (int64_t)diffTypeForSection:(int64_t)a3
{
  int64_t v3;
  void *v6;
  int64_t v7;

  v3 = a3 - 1;
  if (a3 < 1 || -[NSMutableArray count](self->_changedRows, "count") < (unint64_t)a3)
    return 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_changedRows, "objectAtIndexedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (int64_t)diffTypeForIndexPath:(id)a3
{
  return -[EKUIRecurrenceDifferenceViewController diffTypeForSection:](self, "diffTypeForSection:", objc_msgSend(a3, "section"));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_changedRows, "count", a3) + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return -[EKUIRecurrenceDifferenceViewController rowCountForDiffType:](self, "rowCountForDiffType:", -[EKUIRecurrenceDifferenceViewController diffTypeForSection:](self, "diffTypeForSection:", a4));
  else
    return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (objc_class *)MEMORY[0x1E0DC3D50];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("DifferenceCell"));
  v8 = -[EKUIRecurrenceDifferenceViewController diffTypeForIndexPath:](self, "diffTypeForIndexPath:", v6);
  v9 = objc_msgSend(v6, "row");

  -[EKUIRecurrenceDifferenceViewController descriptionForDiffType:row:](self, "descriptionForDiffType:row:", v8, v9 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttributedText:", v10);

  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  objc_msgSend(v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineBreakMode:", 0);

  objc_msgSend(v7, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeToFit");

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a4)
  {
    -[EKUIRecurrenceDifferenceViewController titleForDiffType:](self, "titleForDiffType:", -[EKUIRecurrenceDifferenceViewController diffTypeForSection:](self, "diffTypeForSection:", a4));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("This event is an occurrence of a repeating event. It has some differences from the repeating event it originated from."), &stru_1E601DFA8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;

  EventKitUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Revert"), &stru_1E601DFA8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;
  int64_t v7;
  int64_t v8;

  v5 = a4;
  if (-[EKEvent isEditable](self->_event, "isEditable")
    && (-[EKEvent isExternallyOrganizedInvitation](self->_event, "isExternallyOrganizedInvitation") & 1) == 0)
  {
    v7 = -[EKUIRecurrenceDifferenceViewController diffTypeForIndexPath:](self, "diffTypeForIndexPath:", v5);
    v6 = (unint64_t)(v7 - 7) < 2
      || (v8 = v7, objc_msgSend(v5, "row") == 1)
      || -[EKUIRecurrenceDifferenceViewController rowCountForDiffType:](self, "rowCountForDiffType:", v8) == 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (a4 == 1)
  {
    v10 = -[EKUIRecurrenceDifferenceViewController diffTypeForIndexPath:](self, "diffTypeForIndexPath:", v9);
    -[EKUIRecurrenceDifferenceViewController revertChangeForDiffType:row:](self, "revertChangeForDiffType:row:", v10, objc_msgSend(v9, "row"));
    -[NSMutableArray removeObjectAtIndex:](self->_changedRows, "removeObjectAtIndex:", objc_msgSend(v9, "section") - 1);
    objc_msgSend(v8, "beginUpdates");
    v11 = -[EKUIRecurrenceDifferenceViewController rowCountForDiffType:](self, "rowCountForDiffType:", v10);
    if (v11 == 2)
    {
      if ((unint64_t)(v10 - 7) > 1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, objc_msgSend(v9, "section"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v13;
        v16[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v14, 100);

        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v9, "section"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "deleteSections:withRowAnimation:", v15, 100);

      }
      else
      {
        v17 = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v13, 100);
      }
    }
    else
    {
      if (v11 != 1)
      {
LABEL_9:
        objc_msgSend(v8, "endUpdates");
        goto LABEL_10;
      }
      v18[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v12, 100);

      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(v9, "section"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteSections:withRowAnimation:", v13, 100);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendeesRemoved, 0);
  objc_storeStrong((id *)&self->_attendeesAdded, 0);
  objc_storeStrong((id *)&self->_alarmsRemoved, 0);
  objc_storeStrong((id *)&self->_alarmsAdded, 0);
  objc_storeStrong((id *)&self->_changedRows, 0);
  objc_storeStrong((id *)&self->_diffSummary, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
