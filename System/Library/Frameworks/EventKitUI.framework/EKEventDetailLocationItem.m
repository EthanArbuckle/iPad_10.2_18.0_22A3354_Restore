@implementation EKEventDetailLocationItem

- (EKEventDetailLocationItem)initWithLocationName:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  EKEventDetailLocationItem *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSString *locationComment;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)EKEventDetailLocationItem;
  v8 = -[EKEventDetailLocationItem init](&v24, sel_init);
  if (v8)
  {
    if (objc_msgSend(v7, "hasAttendees"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v7, "attendees", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v21 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            if (objc_msgSend(v14, "participantType") == 2)
            {
              objc_msgSend(v14, "name");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v6);

              if (v16)
              {
                v8->_locationIsAttendee = 1;
                v8->_locationStatus = objc_msgSend(v14, "participantStatus");
                objc_msgSend(v14, "comment");
                v17 = objc_claimAutoreleasedReturnValue();
                locationComment = v8->_locationComment;
                v8->_locationComment = (NSString *)v17;

                goto LABEL_14;
              }
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_14:

    }
    -[EKEventDetailLocationItem updateLocation:forEvent:](v8, "updateLocation:forEvent:", v6, v7);
  }

  return v8;
}

+ (BOOL)isValidLocation:(id)a3 event:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "hasAttendees"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v6, "attendees", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v12, "participantType") == 2)
          {
            objc_msgSend(v12, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", v5);

            if (v14)
            {
              objc_msgSend(v12, "comment");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v15, "length"))
              {

              }
              else
              {
                objc_msgSend(v6, "virtualConference");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "serializationBlockTitle");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "isEqualToString:", v5);

                if ((v18 & 1) != 0)
                {
                  v19 = 0;
                  goto LABEL_17;
                }
              }
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v9)
          continue;
        break;
      }
    }
    v19 = 1;
LABEL_17:

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

- (void)updateAttributedString
{
  void *v3;
  uint64_t v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  CalendarAppTintColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_locationIsAttendee || !self->_locationURL)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  v23 = *MEMORY[0x1E0DC1140];
  v24[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", self->_locationTitle, v5);
  if (self->_locationIsAttendee)
  {
    objc_msgSend((id)objc_opt_class(), "_locationFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    attributedStatusGlyph();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v8);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    objc_msgSend(v9, "appendAttributedString:", v10);
    objc_msgSend(v9, "appendAttributedString:", v6);
    if (-[NSString length](self->_locationComment, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D0CDF8], "sharedInstance");
      v21 = v8;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "commentIconStringForFont:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
      objc_msgSend(v9, "appendAttributedString:", v12);
      objc_msgSend(v9, "appendAttributedString:", v20);
      objc_msgSend(v9, "appendAttributedString:", v10);
      EventKitUIBundle();
      v22 = v6;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("“%@”"), &stru_1E601DFA8, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v14, self->_locationComment);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v15, v5);
      objc_msgSend(v9, "appendAttributedString:", v16);

      v6 = v22;
      v8 = v21;

    }
    -[EKEventDetailLocationItem locationView](self, "locationView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAttributedText:", v9);

  }
  else
  {
    -[EKEventDetailLocationItem locationView](self, "locationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v6);
  }

  -[EKEventDetailLocationItem locationView](self, "locationView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_locationFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v19);

}

- (void)updateLocation:(id)a3 forEvent:(id)a4
{
  id v6;
  NSURL *locationURL;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UITapGestureRecognizer *locationTapRecognizer;
  UITapGestureRecognizer *v14;
  UITapGestureRecognizer *v15;
  void *v16;
  void *v17;
  char v18;
  NSURL *v19;
  NSURL *v20;
  NSURL *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  locationURL = self->_locationURL;
  self->_locationURL = 0;

  objc_msgSend(v6, "preferredLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPrediction");

  if (v9)
  {
    -[EKEventDetailLocationItem locationView](self, "locationView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 3;
LABEL_3:
    objc_msgSend(v10, "setDataDetectorTypes:", v12);

    goto LABEL_5;
  }
  if (!self->_locationIsAttendee)
  {
    objc_msgSend(MEMORY[0x1E0CAA0A8], "mapsURLForLocation:onEvent:hasMapItemLaunchOptionFromTimeToLeaveNotification:", v22, v6, -[EKEventDetailLocationItem hasMapItemLaunchOptionFromTimeToLeaveNotification](self, "hasMapItemLaunchOptionFromTimeToLeaveNotification"));
    v19 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v20 = self->_locationURL;
    self->_locationURL = v19;

    v21 = self->_locationURL;
    -[EKEventDetailLocationItem locationView](self, "locationView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v21)
      v12 = 0;
    else
      v12 = 7;
    goto LABEL_3;
  }
LABEL_5:
  locationTapRecognizer = self->_locationTapRecognizer;
  if (self->_locationURL)
  {
    if (!locationTapRecognizer)
    {
      v14 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__locationTapped);
      v15 = self->_locationTapRecognizer;
      self->_locationTapRecognizer = v14;

    }
    -[EKEventDetailLocationItem locationView](self, "locationView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addGestureRecognizer:", self->_locationTapRecognizer);
  }
  else
  {
    if (!locationTapRecognizer)
      goto LABEL_12;
    -[EKEventDetailLocationItem locationView](self, "locationView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeGestureRecognizer:", self->_locationTapRecognizer);
  }

LABEL_12:
  -[EKEventDetailLocationItem locationTitle](self, "locationTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v22, "isEqualToString:", v17);

  if ((v18 & 1) == 0)
  {
    -[EKEventDetailLocationItem setLocationTitle:](self, "setLocationTitle:", v22);
    -[EKEventDetailLocationItem updateAttributedString](self, "updateAttributedString");
  }

}

- (id)locationView
{
  EKTextViewWithLabelTextMetrics *locationView;
  EKTextViewWithLabelTextMetrics *v4;
  EKTextViewWithLabelTextMetrics *v5;
  EKTextViewWithLabelTextMetrics *v6;
  EKTextViewWithLabelTextMetrics *v7;
  void *v8;

  locationView = self->_locationView;
  if (!locationView)
  {
    v4 = [EKTextViewWithLabelTextMetrics alloc];
    v5 = -[EKTextViewWithLabelTextMetrics initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_locationView;
    self->_locationView = v5;

    -[EKTextViewWithLabelTextMetrics setLineBreakMode:](self->_locationView, "setLineBreakMode:", 2);
    v7 = self->_locationView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTextViewWithLabelTextMetrics setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[EKTextViewWithLabelTextMetrics setOpaque:](self->_locationView, "setOpaque:", 0);
    -[EKTextViewWithLabelTextMetrics setDelegate:](self->_locationView, "setDelegate:", self);
    locationView = self->_locationView;
  }
  return locationView;
}

- (void)textViewDidChangeSelection:(id)a3
{
  EKTextViewWithLabelTextMetrics *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  EKTextViewWithLabelTextMetrics *v9;

  v4 = (EKTextViewWithLabelTextMetrics *)a3;
  if (self->_locationView == v4)
  {
    v9 = v4;
    -[EKTextViewWithLabelTextMetrics selectedTextRange](v4, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    if (v5)
    {
      -[EKTextViewWithLabelTextMetrics selectedTextRange](v9, "selectedTextRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEmpty");

      v4 = v9;
      if ((v7 & 1) == 0)
      {
        -[EKTextViewWithLabelTextMetrics text](v9, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKTextViewWithLabelTextMetrics setSelectedRange:](v9, "setSelectedRange:", 0, objc_msgSend(v8, "length"));

        v4 = v9;
      }
    }
  }

}

- (void)_locationTapped
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  -[EKTextViewWithLabelTextMetrics selectedTextRange](self->_locationView, "selectedTextRange");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[EKTextViewWithLabelTextMetrics selectedTextRange](self->_locationView, "selectedTextRange"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEmpty"),
        v5,
        v4,
        !v6))
  {
    -[EKTextViewWithLabelTextMetrics setSelectedTextRange:](self->_locationView, "setSelectedTextRange:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "openURL:configuration:completionHandler:", self->_locationURL, 0, &__block_literal_global_48);

  }
}

void __44__EKEventDetailLocationItem__locationTapped__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (!v4)
  {
    v6 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_ERROR, "Failed to open URL when location tapped: %@", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification
{
  return self->_hasMapItemLaunchOptionFromTimeToLeaveNotification;
}

- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3
{
  self->_hasMapItemLaunchOptionFromTimeToLeaveNotification = a3;
}

- (NSString)locationTitle
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLocationTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (UITapGestureRecognizer)tapRecognizer
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTapRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_locationTitle, 0);
  objc_storeStrong((id *)&self->_locationComment, 0);
  objc_storeStrong((id *)&self->_locationTapRecognizer, 0);
  objc_storeStrong((id *)&self->_locationURL, 0);
  objc_storeStrong((id *)&self->_locationView, 0);
}

@end
