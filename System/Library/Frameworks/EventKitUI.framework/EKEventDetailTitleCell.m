@implementation EKEventDetailTitleCell

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailTitleCell;
  -[EKEventDetailTitleCell dealloc](&v4, sel_dealloc);
}

+ (void)_registerForInvalidation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__EKEventDetailTitleCell__registerForInvalidation__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_registerForInvalidation_onceToken != -1)
    dispatch_once(&_registerForInvalidation_onceToken, block);
}

void __50__EKEventDetailTitleCell__registerForInvalidation__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__invalidateCachedFonts, *MEMORY[0x1E0DC48E8], 0);

}

- (EKEventDetailTitleCell)initWithEvent:(id)a3 editable:(BOOL)a4 style:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  EKEventDetailTitleCell *v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKEventDetailTitleCell;
  v9 = -[EKEventDetailCell initWithEvent:editable:style:](&v12, sel_initWithEvent_editable_style_, v8, v6, a5);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CAA0A8], "geocodeEventIfNeeded:", v8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel_contentSizeCategoryChanged_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v9;
}

- (void)layoutMarginsDidChange
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailTitleCell;
  -[EKEventDetailCell layoutMarginsDidChange](&v4, sel_layoutMarginsDidChange);
  -[EKEventDetailTitleCell frame](self, "frame");
  -[EKEventDetailTitleCell layoutForWidth:position:](self, "layoutForWidth:position:", self->_lastPosition, v3);
}

- (void)contentSizeCategoryChanged:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_editButton, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

}

- (BOOL)_useLargeFonts
{
  return 0;
}

- (UIView)sourceViewForPopover
{
  void *editButton;

  editButton = self->_editButton;
  if (!editButton)
  {
    editButton = self->_titleView;
    if (!editButton)
      editButton = self;
  }
  return (UIView *)editButton;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = objc_msgSend(v17, "length");
  -[EKEventDetailTitleCell _titleView](self, "_titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4)
  {
    EventKitUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Untitled event"), CFSTR("New Event"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v10);
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v5, "setText:", v17);

  if (-[EKEvent status](self->super._event, "status") == EKEventStatusCanceled)
  {
    v7 = -[EKEventDetailTitleCell _useLargeFonts](self, "_useLargeFonts");
    v8 = (void *)objc_opt_class();
    if (v7)
      objc_msgSend(v8, "_largeTitleFont");
    else
      objc_msgSend(v8, "_titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v6, v12, v13, v14, v15, *MEMORY[0x1E0DC11A8], 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v17, v9);
    -[EKEventDetailTitleCell _titleView](self, "_titleView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAttributedText:", v10);

    goto LABEL_8;
  }
LABEL_9:
  self->_visibleItems |= 1u;

}

- (void)_setDateTimeString:(id)a3 line:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[NSMutableArray count](self->_dateTimeViews, "count") > a4 || objc_msgSend(v7, "length"))
  {
    -[EKEventDetailTitleCell _dateTimeViewForLine:](self, "_dateTimeViewForLine:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v7);

  }
}

- (void)setTravelTimeString:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[EKEventDetailTitleCell _travelTimeView](self, "_travelTimeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v6);

    v5 = self->_visibleItems | 0x10;
  }
  else
  {
    v5 = self->_visibleItems & 0xFFFFFFEF;
  }
  self->_visibleItems = v5;

}

- (void)setRecurrenceString:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    -[EKEventDetailTitleCell _recurrenceView](self, "_recurrenceView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v7);

    -[EKEventDetailTitleCell _recurrenceButton](self, "_recurrenceButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:forState:", v7, 0);

    v6 = self->_visibleItems | 0x20;
  }
  else
  {
    v6 = self->_visibleItems & 0xFFFFFFDF;
  }
  self->_visibleItems = v6;

}

- (void)setStatusString:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[EKEventDetailTitleCell _statusView](self, "_statusView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v6);

    v5 = self->_visibleItems | 0x40;
  }
  else
  {
    v5 = self->_visibleItems & 0xFFFFFFBF;
  }
  self->_visibleItems = v5;

}

- (void)setPrimaryTextColor:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UILabel setTextColor:](self->_titleView, "setTextColor:", v4);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_locationItems;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "locationView", (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTextColor:", v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)setNumberOfTitleLines:(unint64_t)a3
{
  if (self->_numberOfTitleLines != a3)
  {
    self->_numberOfTitleLines = a3;
    -[UILabel setNumberOfLines:](self->_titleView, "setNumberOfLines:");
  }
}

+ (void)_invalidateCachedFonts
{
  _fontUpdateTokenBody = 0;
  _fontUpdateTokenFootnote = 0;
  _fontUpdateTokenLargeBody = 0;
}

+ (id)_titleFont
{
  objc_msgSend(a1, "_registerForInvalidation");
  if (_fontUpdateTokenBody != -1)
    dispatch_once(&_fontUpdateTokenBody, &__block_literal_global_200);
  return (id)_titleFont_font;
}

void __36__EKEventDetailTitleCell__titleFont__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B58], 32770, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v2, 0.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_titleFont_font;
  _titleFont_font = v0;

}

+ (id)_largeTitleFont
{
  objc_msgSend(a1, "_registerForInvalidation");
  if (_fontUpdateTokenLargeBody != -1)
    dispatch_once(&_fontUpdateTokenLargeBody, &__block_literal_global_202);
  return (id)_largeTitleFont_font;
}

void __41__EKEventDetailTitleCell__largeTitleFont__block_invoke()
{
  void *v0;
  double v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lineHeight");
  CalRoundToScreenScale(v1 * 1.5);
  objc_msgSend(v4, "fontWithSize:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_largeTitleFont_font;
  _largeTitleFont_font = v2;

}

+ (id)_locationFont
{
  objc_msgSend(a1, "_registerForInvalidation");
  if (_fontUpdateTokenFootnote != -1)
    dispatch_once(&_fontUpdateTokenFootnote, &__block_literal_global_203);
  return (id)_locationFont_font;
}

void __39__EKEventDetailTitleCell__locationFont__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_locationFont_font;
  _locationFont_font = v0;

}

- (void)addLocation:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *locationItems;
  EKEventDetailLocationItem *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length")
    && +[EKEventDetailLocationItem isValidLocation:event:](EKEventDetailLocationItem, "isValidLocation:event:", v7, self->super._event))
  {
    if (!self->_locationItems)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      locationItems = self->_locationItems;
      self->_locationItems = v4;

    }
    v6 = -[EKEventDetailLocationItem initWithLocationName:forEvent:]([EKEventDetailLocationItem alloc], "initWithLocationName:forEvent:", v7, self->super._event);
    -[EKEventDetailLocationItem setHasMapItemLaunchOptionFromTimeToLeaveNotification:](v6, "setHasMapItemLaunchOptionFromTimeToLeaveNotification:", -[EKEventDetailTitleCell hasMapItemLaunchOptionFromTimeToLeaveNotification](self, "hasMapItemLaunchOptionFromTimeToLeaveNotification"));
    -[EKEventDetailLocationItem updateAttributedString](v6, "updateAttributedString");
    -[NSMutableArray addObject:](self->_locationItems, "addObject:", v6);
    self->_visibleItems |= 2u;

  }
}

- (BOOL)update
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableArray *locationItems;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  EKEvent *event;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  UILabel *titleView;
  void *v57;
  void *v58;
  NSMutableArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  void *v64;
  UILabel *travelTimeView;
  void *v66;
  void *v67;
  NSMutableArray *dateTimeViews;
  UILabel *recurrenceView;
  void *v70;
  UILabel *v71;
  void *v72;
  UILabel *statusView;
  void *v74;
  UILabel *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  uint64_t v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  EKEventStatus v90;
  _QWORD v91[5];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  id v97;
  id v98;
  id v99;
  _QWORD v100[5];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint8_t v109[128];
  uint8_t buf[4];
  uint64_t v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CAA0A8], "geocodeEventIfNeeded:", self->super._event);
  self->_visibleItems = 0;
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v3 = self->_locationItems;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v106 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "locationView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeFromSuperview");

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
    }
    while (v5);
  }

  locationItems = self->_locationItems;
  self->_locationItems = 0;

  v90 = -[EKEvent status](self->super._event, "status");
  -[EKEvent title](self->super._event, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailTitleCell setTitle:](self, "setTitle:", v10);

  -[EKEvent locationsWithoutPrediction](self->super._event, "locationsWithoutPrediction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v102;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v102 != v14)
          objc_enumerationMutation(v11);
        -[EKEventDetailTitleCell addLocation:](self, "addLocation:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
    }
    while (v13);
  }
  -[EKEvent attendees](self->super._event, "attendees");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = MEMORY[0x1E0C809B0];
  v100[1] = 3221225472;
  v100[2] = __32__EKEventDetailTitleCell_update__block_invoke;
  v100[3] = &unk_1E601ACA0;
  v100[4] = self;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v100);

  -[EKEvent preferredLocation](self->super._event, "preferredLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isStructured") && objc_msgSend(v17, "isPrediction"))
  {
    -[EKEventDetailTitleCell delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "proposedTime");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {

    }
    else
    {
      -[EKEventDetailTitleCell delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "minimalMode");

      if ((v21 & 1) == 0)
      {
        -[EKEventDetailTitleCell _suggestedLocationCell](self, "_suggestedLocationCell");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setEvent:", self->super._event);

        self->_visibleItems |= 0x100u;
      }
    }
  }
  if (-[EKEventDetailTitleCell _shouldShowConferenceCell](self, "_shouldShowConferenceCell"))
  {
    -[EKEventDetailTitleCell _conferenceDetailView](self, "_conferenceDetailView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "update");

    self->_visibleItems |= 0x200u;
  }
  -[EKEvent calendar](self->super._event, "calendar");
  v24 = objc_claimAutoreleasedReturnValue();
  v88 = (void *)v24;
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(self))
  {
    -[EKEventDetailTitleCell setColor:](self, "setColor:", 0);
  }
  else
  {
    -[EKEvent eventStore](self->super._event, "eventStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "colorForCalendar:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailTitleCell setColor:](self, "setColor:", v26);

  }
  v27 = EKUIWidthSizeClassForViewHierarchy(self);
  if (!v27)
  {
    -[EKEventDetailTitleCell traitCollection](self, "traitCollection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v28, "horizontalSizeClass");

    v29 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v111 = v27;
      _os_log_impl(&dword_1AF84D000, v29, OS_LOG_TYPE_ERROR, "Size class from EKUIWidthSizeClassForViewHierarchy was unspecified, so fall back to getting size class from view's trait collection [%ld]", buf, 0xCu);
    }
    if (!v27)
    {
      v30 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v27 = 1;
        v111 = 1;
        _os_log_impl(&dword_1AF84D000, v30, OS_LOG_TYPE_ERROR, "Size class from view's trait collection was unspecified, so fall back to default size class [%ld]", buf, 0xCu);
      }
      else
      {
        v27 = 1;
      }
    }
  }
  v89 = v17;
  event = self->super._event;
  v98 = 0;
  v99 = 0;
  v96 = 0;
  v97 = 0;
  -[EKEventDetailTitleCell delegate](self, "delegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "proposedTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  CalDetailStringsForCalendarEvent(event, v27, &v99, &v98, &v97, &v96, v33, 0);
  v34 = v99;
  v35 = v98;
  v36 = v97;
  v37 = v96;

  v87 = v34;
  -[EKEventDetailTitleCell _setDateTimeString:line:](self, "_setDateTimeString:line:", v34, 0);
  v86 = v35;
  -[EKEventDetailTitleCell _setDateTimeString:line:](self, "_setDateTimeString:line:", v35, 1);
  v85 = v36;
  -[EKEventDetailTitleCell _setDateTimeString:line:](self, "_setDateTimeString:line:", v36, 2);
  v84 = v37;
  -[EKEventDetailTitleCell _setDateTimeString:line:](self, "_setDateTimeString:line:", v37, 3);
  -[EKEvent travelTime](self->super._event, "travelTime");
  if (v38 == 0.0)
  {
    -[EKEventDetailTitleCell setTravelTimeString:](self, "setTravelTimeString:", 0);
  }
  else
  {
    -[EKEvent travelTime](self->super._event, "travelTime");
    CUIKDisplayStringTravelTimeAndDuration();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailTitleCell setTravelTimeString:](self, "setTravelTimeString:", v39);

  }
  if (!-[EKEvent isOrWasPartOfRecurringSeries](self->super._event, "isOrWasPartOfRecurringSeries"))
  {
    v40 = 0;
    goto LABEL_43;
  }
  -[EKEvent singleRecurrenceRule](self->super._event, "singleRecurrenceRule");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v40)
  {
LABEL_43:
    v49 = 0;
    goto LABEL_44;
  }
  -[EKEvent startDate](self->super._event, "startDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEvent eventStore](self->super._event, "eventStore");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "timeZone");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKStringForRecurrenceRule();
  v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Repeats %@"), &stru_1E601DFA8, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    v48 = v44;
  else
    v48 = &stru_1E601DFA8;
  objc_msgSend(v45, "localizedStringWithFormat:", v47, v48);
  v49 = objc_claimAutoreleasedReturnValue();

LABEL_44:
  if (v90 == EKEventStatusCanceled)
  {
    EventKitUIBundle();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("Event has been canceled"), &stru_1E601DFA8, 0);
    v51 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v51 = 0;
  }
  -[EKEventDetailTitleCell setRecurrenceString:](self, "setRecurrenceString:", v49);
  v82 = (void *)v51;
  -[EKEventDetailTitleCell setStatusString:](self, "setStatusString:", v51);
  if (!self->_observingLocaleChanges)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObserver:selector:name:object:", self, sel_update, *MEMORY[0x1E0D0CA70], 0);

    self->_observingLocaleChanges = 1;
  }
  v53 = -[EKEventDetailTitleCell _useLargeFonts](self, "_useLargeFonts");
  v54 = (void *)objc_opt_class();
  v83 = (void *)v49;
  if (v53)
    objc_msgSend(v54, "_largeTitleFont");
  else
    objc_msgSend(v54, "_titleFont");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_titleView, "setFont:", v55);
  titleView = self->_titleView;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](titleView, "setTextColor:", v57);

  objc_msgSend((id)objc_opt_class(), "_locationFont");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v59 = self->_locationItems;
  v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v93;
    do
    {
      for (k = 0; k != v61; ++k)
      {
        if (*(_QWORD *)v93 != v62)
          objc_enumerationMutation(v59);
        objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * k), "locationView");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setFont:", v58);

      }
      v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v92, v109, 16);
    }
    while (v61);
  }

  travelTimeView = self->_travelTimeView;
  objc_msgSend((id)objc_opt_class(), "_locationFont");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](travelTimeView, "setFont:", v66);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_travelTimeView, "setTextColor:", v67);

  dateTimeViews = self->_dateTimeViews;
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __32__EKEventDetailTitleCell_update__block_invoke_213;
  v91[3] = &unk_1E601B590;
  v91[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](dateTimeViews, "enumerateObjectsUsingBlock:", v91);
  recurrenceView = self->_recurrenceView;
  objc_msgSend((id)objc_opt_class(), "_locationFont");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](recurrenceView, "setFont:", v70);

  v71 = self->_recurrenceView;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v71, "setTextColor:", v72);

  statusView = self->_statusView;
  objc_msgSend((id)objc_opt_class(), "_locationFont");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](statusView, "setFont:", v74);

  v75 = self->_statusView;
  if (v90 == EKEventStatusCanceled)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v75, "setTextColor:", v76);

  -[UILabel setLineBreakMode:](self->_travelTimeView, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "pointSize");
  v79 = v78;

  if (v79 >= 18.5)
  {
    -[UILabel setLineBreakMode:](self->_recurrenceView, "setLineBreakMode:", 0);
    -[UILabel setLineBreakMode:](self->_statusView, "setLineBreakMode:", 0);
    v80 = 0;
  }
  else
  {
    v80 = 1;
  }
  -[UILabel setNumberOfLines:](self->_statusView, "setNumberOfLines:", v80);

  return 1;
}

void __32__EKEventDetailTitleCell_update__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "participantType") == 2)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 1128);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "locationTitle", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if ((v11 & 1) != 0)
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v12 = *(void **)(a1 + 32);
      objc_msgSend(v3, "name");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addLocation:", v4);
    }

  }
}

void __32__EKEventDetailTitleCell_update__block_invoke_213(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend((id)objc_opt_class(), "_locationFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v2);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pointSize");
  v6 = v5;

  if (v6 >= 18.5)
  {
    objc_msgSend(v8, "setLineBreakMode:", 0);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  objc_msgSend(v8, "setNumberOfLines:", v7);

}

- (BOOL)_shouldShowConferenceCell
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;
  void *v9;

  -[EKEventDetailTitleCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[EKEventDetailTitleCell delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "showsDetectedConferenceItem");

  }
  else
  {
    v6 = 0;
  }
  -[EKEvent virtualConference](self->super._event, "virtualConference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    -[EKEvent conferenceURLForDisplay](self->super._event, "conferenceURLForDisplay");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v8 = v6;
    else
      v8 = 0;

  }
  return v8;
}

- (void)editButtonTapped
{
  void *v3;
  id v4;

  -[EKEventDetailTitleCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKEventDetailTitleCell delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editButtonPressed");

  }
}

- (void)nextButtonTapped
{
  void *v3;
  id v4;

  -[EKEventDetailTitleCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKEventDetailTitleCell delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextButtonPressed");

  }
}

- (void)previousButtonTapped
{
  void *v3;
  id v4;

  -[EKEventDetailTitleCell delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKEventDetailTitleCell delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousButtonPressed");

  }
}

- (void)showRecurrenceDiff:(id)a3
{
  id v4;
  EKUIRecurrenceDifferenceViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EKUIRecurrenceDifferenceViewController *v10;

  v4 = a3;
  v5 = [EKUIRecurrenceDifferenceViewController alloc];
  -[EKEventDetailCell event](self, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[EKUIRecurrenceDifferenceViewController initWithEvent:andSummary:](v5, "initWithEvent:andSummary:", v6, v4);

  -[EKEventDetailTitleCell delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "owningViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v10, 1);

}

- (void)setHideTopCellSeparator:(BOOL)a3
{
  if (self->_hideTopCellSeparator != a3)
  {
    self->_hideTopCellSeparator = a3;
    -[EKEventDetailTitleCell _updateSeparatorStyle](self, "_updateSeparatorStyle");
  }
}

- (void)setHideBottomCellSeparator:(BOOL)a3
{
  if (self->_hideBottomCellSeparator != a3)
  {
    self->_hideBottomCellSeparator = a3;
    -[EKEventDetailTitleCell _updateSeparatorStyle](self, "_updateSeparatorStyle");
  }
}

- (void)_updateSeparatorStyle
{
  uint64_t v3;

  if (!self->_hideBottomCellSeparator && !self->_hideTopCellSeparator)
  {
    -[EKEventDetailTitleCell setSeparatorStyle:](self, "setSeparatorStyle:", 1);
LABEL_10:
    -[EKUITableViewCell setDrawsOwnRowSeparators:](self, "setDrawsOwnRowSeparators:", 0);
    return;
  }
  -[EKEventDetailTitleCell setSeparatorStyle:](self, "setSeparatorStyle:", 0);
  if (self->_hideBottomCellSeparator && self->_hideTopCellSeparator)
    goto LABEL_10;
  -[EKUITableViewCell setDrawsOwnRowSeparators:](self, "setDrawsOwnRowSeparators:", 1);
  if (self->_hideBottomCellSeparator)
    v3 = 1;
  else
    v3 = 4;
  -[EKUITableViewCell setSeparatorEdges:](self, "setSeparatorEdges:", v3);
}

- (id)_titleView
{
  UILabel *titleView;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  titleView = self->_titleView;
  if (!titleView)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v5 = self->_titleView;
    self->_titleView = v4;

    -[UILabel setLineBreakMode:](self->_titleView, "setLineBreakMode:", 0);
    -[UILabel setNumberOfLines:](self->_titleView, "setNumberOfLines:", -[EKEventDetailTitleCell numberOfTitleLines](self, "numberOfTitleLines"));
    -[UILabel setLineBreakMode:](self->_titleView, "setLineBreakMode:", 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](self->_titleView, "setBackgroundColor:", v6);

    titleView = self->_titleView;
  }
  return titleView;
}

- (void)handleTapOnLabel:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  unint64_t v25;
  NSUInteger location;
  NSUInteger v27;
  BOOL v28;
  void *v29;
  id v30;

  if (!self->_showAllLocation)
  {
    v4 = a3;
    objc_msgSend(v4, "view");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v30);
    v6 = v5;
    v8 = v7;

    objc_msgSend(v30, "bounds");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v30, "layoutManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "textContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "usedRectForTextContainer:", v14);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    objc_msgSend(v30, "layoutManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "textContainer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v24, 0, v6 - -(v16 - (v10 - v20) * 0.5), v8 - -(v18 - (v12 - v22) * 0.5));

    location = self->_showLocationRange.location;
    v28 = v25 >= location;
    v27 = v25 - location;
    v28 = !v28 || v27 >= self->_showLocationRange.length;
    if (!v28)
    {
      self->_showAllLocation = 1;
      -[EKEventDetailTitleCell delegate](self, "delegate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "refreshForHeightChange");

    }
  }
}

- (id)_dateTimeViewForLine:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *dateTimeViews;
  NSMutableArray *v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;

  if (a3 <= 3)
  {
    v23 = v4;
    v24 = v3;
    dateTimeViews = self->_dateTimeViews;
    if (!dateTimeViews)
    {
      v17 = (NSMutableArray *)objc_opt_new();
      v18 = self->_dateTimeViews;
      self->_dateTimeViews = v17;

      dateTimeViews = self->_dateTimeViews;
    }
    if (-[NSMutableArray count](dateTimeViews, "count", v10, v9, v8, v7, v6, v5, v23, v24, v11, v12) <= a3)
    {
      do
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTextColor:", v20);

        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setBackgroundColor:", v21);

        -[NSMutableArray addObject:](self->_dateTimeViews, "addObject:", v19);
      }
      while (-[NSMutableArray count](self->_dateTimeViews, "count") <= a3);
    }
    -[NSMutableArray objectAtIndexedSubscript:](self->_dateTimeViews, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)_travelTimeView
{
  UILabel *travelTimeView;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;

  travelTimeView = self->_travelTimeView;
  if (!travelTimeView)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v5 = self->_travelTimeView;
    self->_travelTimeView = v4;

    v6 = self->_travelTimeView;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6, "setTextColor:", v7);

    v8 = self->_travelTimeView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[UILabel setNumberOfLines:](self->_travelTimeView, "setNumberOfLines:", 0);
    travelTimeView = self->_travelTimeView;
  }
  return travelTimeView;
}

- (id)_recurrenceView
{
  UILabel *recurrenceView;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;

  recurrenceView = self->_recurrenceView;
  if (!recurrenceView)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v5 = self->_recurrenceView;
    self->_recurrenceView = v4;

    v6 = self->_recurrenceView;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6, "setTextColor:", v7);

    v8 = self->_recurrenceView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[UILabel setNumberOfLines:](self->_recurrenceView, "setNumberOfLines:", 0);
    recurrenceView = self->_recurrenceView;
  }
  return recurrenceView;
}

- (id)_recurrenceButton
{
  void *v3;
  UIButton *v4;
  UIButton *recurrenceButton;
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
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
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
  UIButton *v39;
  id *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id location;
  _QWORD v50[2];
  _QWORD v51[5];

  v51[3] = *MEMORY[0x1E0C80C00];
  if (!self->_recurrenceButton)
  {
    objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleLineBreakMode:", 4);
    objc_msgSend(v3, "setTitleLineBreakMode:", 0);
    objc_msgSend(v3, "setTitleTextAttributesTransformer:", &__block_literal_global_221);
    objc_msgSend(v3, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v3, 0);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    recurrenceButton = self->_recurrenceButton;
    self->_recurrenceButton = v4;

    -[UILabel frame](self->_recurrenceView, "frame");
    -[UIButton setFrame:](self->_recurrenceButton, "setFrame:");

  }
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0DC3428];
  EventKitUIBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Go to Next Occurrence"), &stru_1E601DFA8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.forward.circle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_2;
  v47[3] = &unk_1E6019DA8;
  objc_copyWeak(&v48, &location);
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, v9, 0, v47);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3428];
  EventKitUIBundle();
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "localizedStringForKey:value:table:", CFSTR("Go to Previous Occurrence"), &stru_1E601DFA8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.backward.circle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_3;
  v45[3] = &unk_1E6019DA8;
  objc_copyWeak(&v46, &location);
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v13, v14, 0, v45);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventDetailTitleCell delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v16, "shouldShowNextButton");

  if ((v12 & 1) == 0)
    objc_msgSend(v10, "setAttributes:", 1);
  -[EKEventDetailTitleCell delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldShowPreviousButton");

  if ((v18 & 1) == 0)
    objc_msgSend(v15, "setAttributes:", 1);
  -[EKEventDetailCell event](self, "event");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isDetached");

  v21 = 0x1E0DC3000;
  v22 = 0x1E0C99000;
  if (v20)
  {
    v23 = (void *)MEMORY[0x1E0CAA0B8];
    -[EKEventDetailCell event](self, "event");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "originalItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailCell event](self, "event");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "diffSummaryBetweenObject:andObject:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[EKUIRecurrenceDifferenceViewController shouldShowRecurrenceDiff:](EKUIRecurrenceDifferenceViewController, "shouldShowRecurrenceDiff:", v27))
    {
      v28 = (void *)MEMORY[0x1E0DC3428];
      EventKitUIBundle();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Show Event Changes"), &stru_1E601DFA8, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("slider.horizontal.2.gobackward"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_4;
      v42[3] = &unk_1E60193D0;
      v41 = &v44;
      objc_copyWeak(&v44, &location);
      v43 = v27;
      objc_msgSend(v28, "actionWithTitle:image:identifier:handler:", v30, v31, 0, v42);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (void *)MEMORY[0x1E0DC39D0];
      v51[0] = v10;
      v51[1] = v15;
      v51[2] = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "menuWithChildren:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setMenu:](self->_recurrenceButton, "setMenu:", v35);

      objc_destroyWeak(&v44);
    }

    v22 = 0x1E0C99000uLL;
    v21 = 0x1E0DC3000uLL;
  }
  v36 = *(void **)(v21 + 2512);
  v50[0] = v10;
  v50[1] = v15;
  objc_msgSend(*(id *)(v22 + 3360), "arrayWithObjects:count:", v50, 2, v41);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "menuWithChildren:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setMenu:](self->_recurrenceButton, "setMenu:", v38);

  -[UIButton setShowsMenuAsPrimaryAction:](self->_recurrenceButton, "setShowsMenuAsPrimaryAction:", 1);
  v39 = self->_recurrenceButton;

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);
  return v39;
}

id __43__EKEventDetailTitleCell__recurrenceButton__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  CalendarAppTintColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0DC1140]);

  +[EKEventDetailTitleCell _locationFont](EKEventDetailTitleCell, "_locationFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0DC1138]);

  return v2;
}

void __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "nextButtonTapped");

}

void __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "previousButtonTapped");

}

void __43__EKEventDetailTitleCell__recurrenceButton__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "showRecurrenceDiff:", *(_QWORD *)(a1 + 32));

}

- (id)_statusView
{
  UILabel *statusView;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;

  statusView = self->_statusView;
  if (!statusView)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    v5 = self->_statusView;
    self->_statusView = v4;

    v6 = self->_statusView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.917647059, 0.0, 0.0, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6, "setTextColor:", v7);

    v8 = self->_statusView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

    statusView = self->_statusView;
  }
  return statusView;
}

- (id)_editButton
{
  UIButton *editButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;
  UIButton *v8;
  void *v9;
  void *v10;

  editButton = self->_editButton;
  if (!editButton)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_editButton;
    self->_editButton = v4;

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](self->_editButton, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v6);

    v8 = self->_editButton;
    EventKitUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Edit"), &stru_1E601DFA8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v8, "setTitle:forState:", v10, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_editButton, "addTarget:action:forControlEvents:", self, sel_editButtonTapped, 64);
    editButton = self->_editButton;
  }
  return editButton;
}

- (id)_suggestedLocationCell
{
  EKEventDetailSuggestedLocationCell *suggestedLocationCell;
  EKEventDetailSuggestedLocationCell *v4;
  EKEventDetailSuggestedLocationCell *v5;

  suggestedLocationCell = self->_suggestedLocationCell;
  if (!suggestedLocationCell)
  {
    v4 = -[EKEventDetailSuggestedLocationCell initWithInlineStyle:]([EKEventDetailSuggestedLocationCell alloc], "initWithInlineStyle:", 0);
    v5 = self->_suggestedLocationCell;
    self->_suggestedLocationCell = v4;

    -[EKEventDetailSuggestedLocationCell setDelegate:](self->_suggestedLocationCell, "setDelegate:", self);
    suggestedLocationCell = self->_suggestedLocationCell;
  }
  return suggestedLocationCell;
}

- (id)_conferenceDetailView
{
  EKEventDetailConferenceCell *conferenceDetailView;
  EKEventDetailConferenceCell *v4;
  EKEventDetailConferenceCell *v5;

  conferenceDetailView = self->_conferenceDetailView;
  if (!conferenceDetailView)
  {
    v4 = -[EKEventDetailConferenceCell initWithEvent:editable:]([EKEventDetailConferenceCell alloc], "initWithEvent:editable:", self->super._event, 0);
    v5 = self->_conferenceDetailView;
    self->_conferenceDetailView = v4;

    -[EKEventDetailConferenceCell setDelegate:](self->_conferenceDetailView, "setDelegate:", self);
    conferenceDetailView = self->_conferenceDetailView;
  }
  return conferenceDetailView;
}

- (double)titleHeight
{
  CGRect v3;

  -[UILabel frame](self->_titleView, "frame");
  return CGRectGetMaxY(v3);
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventDetailTitleCell;
  -[EKUITableViewCell layoutSubviews](&v4, sel_layoutSubviews);
  -[EKEventDetailTitleCell bounds](self, "bounds");
  -[EKEventDetailTitleCell _layoutForWidth:](self, "_layoutForWidth:", v3);
}

- (double)_layoutForWidth:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  EKEventDetailTitleCell *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  char IsLeftToRight;
  EKEventDetailTitleCell *v34;
  EKEventDetailTitleCell *v35;
  double v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  BOOL v56;
  void *v57;
  _BOOL4 v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  _BOOL4 v64;
  double v65;
  UILabel *titleView;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  BOOL v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  void *v85;
  double v86;
  NSMutableArray *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t j;
  void *v91;
  uint64_t v92;
  uint64_t i;
  void *v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  void *v130;
  double v131;
  double v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  void *v149;
  double v150;
  double v151;
  void *v152;
  double v153;
  double v154;
  double v155;
  int v156;
  double v157;
  void *v158;
  double MaxY;
  void *v160;
  double v161;
  id *p_isa;
  double v163;
  double v164;
  double *v165;
  double v166;
  double *v167;
  double v168;
  double v169;
  void *v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double x;
  double y;
  double width;
  double height;
  CGFloat v181;
  void *v182;
  double v183;
  double *v184;
  double v185;
  void *v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  CGFloat v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  EKEventDetailTitleCell *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  BOOL v207;
  NSMutableArray *dateTimeViews;
  int *v209;
  id v210;
  UILabel *v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  void *v223;
  UILabel *travelTimeView;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  int v230;
  double v231;
  void *v232;
  double v233;
  double v234;
  double v235;
  UILabel *statusView;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  int v244;
  double v245;
  void *v246;
  double v247;
  double v248;
  double v249;
  double v250;
  int v252;
  double v253;
  unsigned int v254;
  unsigned int visibleItems;
  double v256;
  double v257;
  uint64_t v259;
  NSMutableArray *obj;
  void *v261;
  void *v262;
  void *v263;
  double v264;
  void *v265;
  double v266;
  double v267;
  double v268;
  uint64_t v269;
  double v270;
  uint64_t v271;
  EKEventDetailTitleCell *v272;
  _QWORD v273[12];
  BOOL v274;
  _QWORD v275[3];
  char v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  uint64_t v285;
  double *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  double *v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  double v294;
  _BYTE v295[128];
  uint64_t v296;
  void *v297;
  _BYTE v298[128];
  uint64_t v299;
  CGRect v300;
  CGRect v301;
  CGRect v302;
  CGRect v303;

  v299 = *MEMORY[0x1E0C80C00];
  v254 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", 0);
  v272 = self;
  -[EKEventDetailTitleCell delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EKEventDetailTitleCell delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v5, "shouldShowEditButtonInline");

    -[EKEventDetailTitleCell delegate](v272, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "shouldShowNextButton") & 1) != 0)
    {
      v252 = 1;
    }
    else
    {
      -[EKEventDetailTitleCell delegate](v272, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v252 = objc_msgSend(v8, "shouldShowPreviousButton");

    }
    v7 = v272;

  }
  else
  {
    v252 = 0;
    v7 = self;
  }
  -[EKEventDetailTitleCell layoutMargins](v7, "layoutMargins");
  v270 = v9;
  -[EKEventDetailTitleCell layoutMargins](v7, "layoutMargins");
  v268 = v10;
  -[EKEventDetailTitleCell safeAreaInsets](v7, "safeAreaInsets");
  v267 = v11;
  -[EKEventDetailTitleCell safeAreaInsets](v7, "safeAreaInsets");
  v13 = v12;
  v289 = 0;
  v290 = (double *)&v289;
  v291 = 0x3010000000;
  v293 = 0;
  v294 = 0.0;
  v292 = "";
  -[EKEventDetailCell detailsLeftInset](v7, "detailsLeftInset");
  v15 = v14;
  objc_msgSend((id)objc_opt_class(), "_titleFont");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_scaledValueForValue:", 30.0);
  v18 = v17;
  -[UILabel _firstBaselineOffsetFromTop](v272->_titleView, "_firstBaselineOffsetFromTop");
  v293 = v15;
  v294 = v18 - v19;

  v20 = *((_QWORD *)v290 + 5);
  v285 = 0;
  v286 = (double *)&v285;
  v287 = 0x2020000000;
  v288 = v20;
  if (!(_DWORD)v4)
  {
    v35 = v272;
    -[UIButton removeFromSuperview](v272->_editButton, "removeFromSuperview");
    goto LABEL_27;
  }
  -[EKEventDetailTitleCell _editButton](v272, "_editButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeToFit");

  -[UIButton layoutIfNeeded](v272->_editButton, "layoutIfNeeded");
  -[UIButton frame](v272->_editButton, "frame");
  v264 = v22;
  v24 = v23;
  v25 = v290[4];
  v266 = v290[5];
  -[UIButton titleLabel](v272->_editButton, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v28 = v27;
  -[UIButton titleLabel](v272->_editButton, "titleLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  v31 = v30;

  -[EKEventDetailTitleCell traitCollection](v272, "traitCollection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUIUsesLargeTextLayout(v32))
  {
    IsLeftToRight = CalInterfaceIsLeftToRight();

    v34 = v272;
    if ((IsLeftToRight & 1) != 0)
      goto LABEL_14;
  }
  else
  {

    v34 = v272;
  }
  -[EKEventDetailTitleCell layoutMargins](v34, "layoutMargins");
  v25 = v24 - v28 - v31 + a3 - v36 - v24;
LABEL_14:
  if ((v34->_visibleItems & 1) != 0)
  {
    -[EKEventDetailTitleCell traitCollection](v34, "traitCollection");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = EKUIUsesLargeTextLayout(v37);

    if (!v38)
    {
      -[UILabel font](v272->_titleView, "font");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton titleLabel](v272->_editButton, "titleLabel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "font");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "ascender");
      v43 = v42;
      objc_msgSend(v39, "capHeight");
      v45 = v44;
      objc_msgSend(v41, "ascender");
      v47 = v46;
      objc_msgSend(v39, "capHeight");
      v49 = v48;
      -[UIButton titleLabel](v272->_editButton, "titleLabel");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "frame");
      v52 = v51;

      CalRoundToScreenScale(v43 + v45 - (v47 + v49) - v52);
      v54 = v53;

      v266 = v266 + v54;
    }
    v34 = v272;
  }
  if ((CalInterfaceIsLeftToRight() & 1) != 0
    || (-[EKEventDetailTitleCell traitCollection](v34, "traitCollection"),
        v55 = (void *)objc_claimAutoreleasedReturnValue(),
        v56 = EKUIUsesLargeTextLayout(v55),
        v55,
        v34 = v272,
        v56))
  {
    if (CalInterfaceIsLeftToRight())
    {
      -[EKEventDetailTitleCell traitCollection](v34, "traitCollection");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = EKUIUsesLargeTextLayout(v57);

      v34 = v272;
      if (v58)
      {
        -[EKEventDetailTitleCell safeAreaInsets](v272, "safeAreaInsets");
        v25 = v25 + v59;
      }
    }
  }
  else
  {
    -[EKEventDetailTitleCell layoutMargins](v272, "layoutMargins");
    v25 = v60;
  }
  -[EKEventDetailTitleCell contentView](v34, "contentView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "convertRect:fromView:", v34, v25, v266, v24, v264);
  -[UIButton setFrame:](v34->_editButton, "setFrame:");

  -[EKEventDetailTitleCell contentView](v272, "contentView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addSubview:", v272->_editButton);

  -[EKEventDetailTitleCell traitCollection](v272, "traitCollection");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = EKUIUsesLargeTextLayout(v63);

  if (v64)
  {
    v300.origin.x = v25;
    v300.size.height = v264;
    v300.origin.y = v266;
    v300.size.width = v24;
    v35 = v272;
    v290[5] = CGRectGetMaxY(v300);
  }
  else
  {
    v35 = v272;
  }
LABEL_27:
  v65 = a3 - v270 - v268;
  v257 = v267 + v13;
  titleView = v35->_titleView;
  if ((v35->_visibleItems & 1) != 0)
  {
    -[UILabel frame](titleView, "frame");
    v68 = v67;
    v69 = v290[4];
    v70 = v290[5];
    -[EKEventDetailTitleCell traitCollection](v35, "traitCollection");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = EKUIUsesLargeTextLayout(v71);

    v73 = a3 - v270 - v268;
    if (!v72)
    {
      -[UIButton frame](v272->_editButton, "frame");
      v73 = v65 - v74;
    }
    -[UILabel setFrame:](v272->_titleView, "setFrame:", CalRoundRectToScreenScale(v69, v70, v73, v68));
    -[UILabel sizeToFit](v272->_titleView, "sizeToFit");
    if ((CalInterfaceIsLeftToRight() & 1) == 0)
    {
      -[UILabel frame](v272->_titleView, "frame");
      -[UILabel setFrame:](v272->_titleView, "setFrame:", a3 - v257 - v75 - v76);
    }
    -[UILabel frame](v272->_titleView, "frame");
    v78 = v77;
    -[EKEventDetailTitleCell contentView](v272, "contentView");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addSubview:", v272->_titleView);

    v35 = v272;
    -[UILabel _lastLineBaseline](v272->_titleView, "_lastLineBaseline");
    v286[3] = v78 + v80;
  }
  else
  {
    -[UILabel removeFromSuperview](titleView, "removeFromSuperview");
  }
  if (CalInterfaceIsLeftToRight())
  {
    v81 = EKUIScaleFactor();
    v82 = -1.0;
  }
  else
  {
    v81 = EKUIScaleFactor();
    v82 = 1.0;
  }
  v290[4] = v82 / v81 + v290[4];
  visibleItems = v35->_visibleItems;
  objc_msgSend((id)objc_opt_class(), "_locationFont");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "_scaledValueForValue:", 37.0);
  v253 = v84;

  objc_msgSend((id)objc_opt_class(), "_locationFont");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "_scaledValueForValue:", 22.0);
  v256 = v86;

  if ((visibleItems & 2) != 0)
  {
    v283 = 0uLL;
    v284 = 0uLL;
    v281 = 0uLL;
    v282 = 0uLL;
    obj = v272->_locationItems;
    v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v281, v298, 16);
    if (v92)
    {
      v259 = *MEMORY[0x1E0DC1140];
      v269 = *(_QWORD *)v282;
      do
      {
        v271 = v92;
        for (i = 0; i != v271; ++i)
        {
          if (*(_QWORD *)v282 != v269)
            objc_enumerationMutation(obj);
          v94 = *(void **)(*((_QWORD *)&v281 + 1) + 8 * i);
          objc_msgSend(v94, "locationView");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "frame");
          v97 = v96;
          v99 = v98;
          objc_msgSend(v94, "updateAttributedString");
          objc_msgSend(v95, "setFrame:", v97, v99, v65, 0.0);
          objc_msgSend(v95, "sizeToFit");
          objc_msgSend(v95, "font");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "_scaledValueForValue:", 22.0);
          v102 = v101;

          objc_msgSend(v95, "frame");
          if (v103 > v102 * 8.0 && !v272->_showAllLocation)
          {
            objc_msgSend(v95, "frame");
            v105 = v104;
            objc_msgSend(v95, "frame");
            objc_msgSend(v95, "setFrame:", v105);
            v296 = v259;
            objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v297 = v106;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v297, &v296, 1);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "setLinkTextAttributes:", v107);

            objc_msgSend(v95, "layoutManager");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "textContainer");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = objc_msgSend(v108, "glyphRangeForTextContainer:", v109);
            v112 = v111;

            objc_msgSend(v95, "attributedText");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "attributesAtIndex:effectiveRange:", 0, 0);
            v265 = (void *)objc_claimAutoreleasedReturnValue();

            v114 = objc_alloc(MEMORY[0x1E0CB3778]);
            objc_msgSend(MEMORY[0x1E0CB3940], "ellipsisString");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = (void *)objc_msgSend(v114, "initWithString:attributes:", v115, v265);

            EventKitUIBundle();
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "localizedStringForKey:value:table:", CFSTR("ShowMoreLocation"), CFSTR("   Show More"), 0);
            v262 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v265);
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            CalendarAppTintColor();
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v263, "setObject:forKeyedSubscript:", v118, v259);

            v119 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v262, v263);
            objc_msgSend(v116, "appendAttributedString:", v119);

            v120 = objc_alloc(MEMORY[0x1E0DC12C0]);
            objc_msgSend(v95, "textContainer");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "size");
            v122 = (void *)objc_msgSend(v120, "initWithSize:");

            v261 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1320]), "initWithAttributedString:", v116);
            v123 = (void *)objc_opt_new();
            objc_msgSend(v123, "addTextContainer:", v122);
            objc_msgSend(v261, "addLayoutManager:", v123);
            objc_msgSend(v123, "boundingRectForGlyphRange:inTextContainer:", 0, objc_msgSend(v116, "length"), v122);
            v125 = v124;
            objc_msgSend(v95, "layoutManager");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "textContainer");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "boundingRectForGlyphRange:inTextContainer:", v112 + v110 - 1, 1, v127);
            v129 = v128;

            objc_msgSend(v95, "textContainer");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v130, "size");
            v132 = v131;

            objc_msgSend(v95, "layoutManager");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "textContainer");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            v135 = objc_msgSend(v133, "glyphIndexForPoint:inTextContainer:", v134, v132 - v125, v129);

            objc_msgSend(v95, "layoutManager");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = objc_msgSend(v136, "characterIndexForGlyphAtIndex:", v135);

            objc_msgSend(v95, "textStorage");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "string");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            v140 = objc_msgSend(v139, "length");
            v272->_showLocationRange.location = v137 - 1;
            v272->_showLocationRange.length = v140 - (v137 - 1);

            objc_msgSend(v95, "textStorage");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v141, "replaceCharactersInRange:withAttributedString:", v272->_showLocationRange.location, v272->_showLocationRange.length, v116);

            objc_msgSend(v94, "tapRecognizer");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v141) = v142 == 0;

            if ((_DWORD)v141)
            {
              v143 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v272, sel_handleTapOnLabel_);
              objc_msgSend(v95, "addGestureRecognizer:", v143);

            }
          }
          objc_msgSend(v95, "frame");
          v145 = v144;
          v147 = v146;
          v148 = v286[3];
          objc_msgSend(v95, "font");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "_scaledValueForValue:", 23.0);
          v151 = v150;
          objc_msgSend(v95, "font");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "ascender");
          v290[5] = v148 + v151 - v153 + -4.0;

          v154 = v290[4];
          v155 = v290[5];
          v156 = CalInterfaceIsLeftToRight();
          v157 = a3 - v257 - v145 - v154;
          if (v156)
            v157 = v154;
          objc_msgSend(v95, "setFrame:", CalRoundRectToScreenScale(v157, v155, v145, v147));
          -[EKEventDetailTitleCell contentView](v272, "contentView");
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "addSubview:", v95);

          v301.origin.x = v154;
          v301.origin.y = v155;
          v301.size.width = v145;
          v301.size.height = v147;
          MaxY = CGRectGetMaxY(v301);
          objc_msgSend(v95, "font");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "descender");
          v286[3] = MaxY + v161 + -8.0;

          v290[5] = v286[3];
        }
        v92 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v281, v298, 16);
      }
      while (v92);
    }

  }
  else
  {
    v279 = 0uLL;
    v280 = 0uLL;
    v277 = 0uLL;
    v278 = 0uLL;
    v87 = v272->_locationItems;
    v88 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v87, "countByEnumeratingWithState:objects:count:", &v277, v295, 16);
    if (v88)
    {
      v89 = *(_QWORD *)v278;
      do
      {
        for (j = 0; j != v88; ++j)
        {
          if (*(_QWORD *)v278 != v89)
            objc_enumerationMutation(v87);
          objc_msgSend(*(id *)(*((_QWORD *)&v277 + 1) + 8 * j), "locationView");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "removeFromSuperview");

        }
        v88 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v87, "countByEnumeratingWithState:objects:count:", &v277, v295, 16);
      }
      while (v88);
    }

    v290[5] = v286[3];
  }
  p_isa = (id *)&v272->super.super.super.super.super.super.isa;
  if (CalInterfaceIsLeftToRight())
  {
    v163 = EKUIScaleFactor();
    v164 = -1.0;
  }
  else
  {
    v163 = EKUIScaleFactor();
    v164 = 1.0;
  }
  v165 = v290;
  v290[4] = v290[4] - v164 / v163;
  if ((visibleItems & 0x100) != 0)
  {
    if ((visibleItems & 2) != 0)
      v169 = v165[5] + 5.5;
    else
      v169 = v165[5] + 5.5 + 8.0;
    v165[5] = v169;
    -[EKEventDetailTitleCell _suggestedLocationCell](v272, "_suggestedLocationCell");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v171) = 1148846080;
    LODWORD(v172) = 1112014848;
    objc_msgSend(v170, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3 - v257, 0.0, v171, v172);
    v174 = v173;
    v176 = v175;

    v302.origin.x = CalRoundRectToScreenScale(0.0, v169, v174, v176);
    x = v302.origin.x;
    y = v302.origin.y;
    width = v302.size.width;
    height = v302.size.height;
    v181 = CGRectGetMaxY(v302);
    v286[3] = v181;
    v290[5] = v181 + -8.0;
    -[EKEventDetailSuggestedLocationCell setFrame:](v272->_suggestedLocationCell, "setFrame:", x, y, width, height);
    -[EKEventDetailTitleCell contentView](v272, "contentView");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v182, "addSubview:", v272->_suggestedLocationCell);

    p_isa = (id *)&v272->super.super.super.super.super.super.isa;
    if ((v272->_visibleItems & 0x200) != 0)
    {
      v167 = v290;
      v166 = v290[5];
      v168 = 23.5;
LABEL_75:
      v185 = v166 + v168;
      v167[5] = v166 + v168;
      objc_msgSend(p_isa, "_conferenceDetailView");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v187) = 1148846080;
      LODWORD(v188) = 1112014848;
      objc_msgSend(v186, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3 - v257, 0.0, v187, v188);
      v190 = v189;
      v192 = v191;

      v303.origin.x = CalRoundRectToScreenScale(0.0, v185, v190, v192);
      v193 = v303.origin.x;
      v194 = v303.origin.y;
      v195 = v303.size.width;
      v196 = v303.size.height;
      v197 = CGRectGetMaxY(v303);
      v286[3] = v197;
      v290[5] = v197 + -8.0;
      -[EKEventDetailConferenceCell setFrame:](v272->_conferenceDetailView, "setFrame:", v193, v194, v195, v196);
      -[EKEventDetailTitleCell contentView](v272, "contentView");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "addSubview:", v272->_conferenceDetailView);

      v184 = v290;
      v183 = v290[5];
      p_isa = (id *)&v272->super.super.super.super.super.super.isa;
      goto LABEL_76;
    }
  }
  else
  {
    -[EKEventDetailSuggestedLocationCell removeFromSuperview](v272->_suggestedLocationCell, "removeFromSuperview");
    v166 = v286[3];
    v167 = v290;
    v290[5] = v166;
    if ((v272->_visibleItems & 0x200) != 0)
    {
      if ((visibleItems & 2) != 0)
        v168 = 8.0;
      else
        v168 = 13.5;
      goto LABEL_75;
    }
  }
  objc_msgSend(p_isa[146], "removeFromSuperview");
  v183 = v286[3];
  v184 = v290;
  v290[5] = v183;
LABEL_76:
  v184[5] = v253 + v183;
  objc_msgSend(p_isa[136], "startCalendarDate");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v199, "dayComponents");
  v200 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEvent endCalendarDate](v272->super._event, "endCalendarDate");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "dayComponents");
  v202 = (void *)objc_claimAutoreleasedReturnValue();

  v203 = v272;
  v204 = objc_msgSend(v200, "day");
  if (v204 == objc_msgSend(v202, "day") && (v205 = objc_msgSend(v200, "month"), v205 == objc_msgSend(v202, "month")))
  {
    v206 = objc_msgSend(v200, "year");
    v207 = v206 != objc_msgSend(v202, "year");
  }
  else
  {
    v207 = 1;
  }
  v275[0] = 0;
  v275[1] = v275;
  v275[2] = 0x2020000000;
  dateTimeViews = v272->_dateTimeViews;
  v276 = 0;
  v273[0] = MEMORY[0x1E0C809B0];
  v273[1] = 3221225472;
  v273[2] = __42__EKEventDetailTitleCell__layoutForWidth___block_invoke;
  v273[3] = &unk_1E601B5D8;
  *(double *)&v273[8] = a3;
  v273[9] = 0;
  v273[4] = v272;
  v273[5] = v275;
  v273[6] = &v289;
  v273[7] = &v285;
  *(double *)&v273[10] = v65;
  *(double *)&v273[11] = v256;
  v274 = v207;
  -[NSMutableArray enumerateObjectsUsingBlock:](dateTimeViews, "enumerateObjectsUsingBlock:", v273);
  if ((v272->_visibleItems & 0x20) != 0)
  {
    v209 = &OBJC_IVAR___EKEventDetailTitleCell__recurrenceButton;
    if (!v252)
      v209 = &OBJC_IVAR___EKEventDetailTitleCell__recurrenceView;
    v210 = *(id *)((char *)&v272->super.super.super.super.super.super.isa + *v209);
    v211 = v272->_recurrenceView;
    objc_msgSend(v210, "frame");
    objc_msgSend(v210, "sizeThatFits:", v65, 0.0);
    v214 = v213;
    if (v65 >= v212)
      v215 = v212;
    else
      v215 = v65;
    -[UILabel _firstLineBaseline](v211, "_firstLineBaseline");
    v216 = v290[4];
    v218 = v290[5] - v217;
    v290[5] = v218;
    objc_msgSend(v210, "sizeToFit");
    -[UILabel sizeToFit](v272->_recurrenceView, "sizeToFit");
    if (CalInterfaceIsLeftToRight())
      v219 = v216;
    else
      v219 = a3 - v257 - v215 - v216;
    objc_msgSend(v210, "setFrame:", CalRoundRectToScreenScale(v219, v218, v215, v214));
    -[UILabel setFrame:](v272->_recurrenceView, "setFrame:", CalRoundRectToScreenScale(v219, v218, v215, v214));
    v220 = v290[5];
    -[UILabel _lastLineBaseline](v211, "_lastLineBaseline");
    v222 = v220 + v221;
    v286[3] = v222;
    v290[5] = v256 + v222;
    -[EKEventDetailTitleCell contentView](v272, "contentView");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "addSubview:", v210);

    v203 = v272;
  }
  else
  {
    -[UILabel removeFromSuperview](v272->_recurrenceView, "removeFromSuperview");
    -[UIButton removeFromSuperview](v272->_recurrenceButton, "removeFromSuperview");
  }
  travelTimeView = v203->_travelTimeView;
  if ((v203->_visibleItems & 0x10) != 0)
  {
    -[UILabel sizeToFit](travelTimeView, "sizeToFit");
    -[UILabel frame](v203->_travelTimeView, "frame");
    v226 = v225;
    -[UILabel sizeToFit](v203->_travelTimeView, "sizeToFit");
    -[UILabel _firstLineBaseline](v203->_travelTimeView, "_firstLineBaseline");
    v227 = v290[4];
    v229 = v290[5] - v228;
    v290[5] = v229;
    v230 = CalInterfaceIsLeftToRight();
    v231 = a3 - v257 - v65 - v227;
    if (v230)
      v231 = v227;
    -[UILabel setFrame:](v203->_travelTimeView, "setFrame:", CalRoundRectToScreenScale(v231, v229, v65, v226));
    -[EKEventDetailTitleCell contentView](v203, "contentView");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v232, "addSubview:", v203->_travelTimeView);

    v233 = v290[5];
    v203 = v272;
    -[UILabel _lastLineBaseline](v272->_travelTimeView, "_lastLineBaseline");
    v235 = v233 + v234;
    v286[3] = v235;
    v290[5] = v256 + v235;
  }
  else
  {
    -[UILabel removeFromSuperview](travelTimeView, "removeFromSuperview");
  }
  statusView = v203->_statusView;
  if ((v203->_visibleItems & 0x40) != 0)
  {
    -[UILabel frame](statusView, "frame");
    -[UILabel sizeThatFits:](v203->_statusView, "sizeThatFits:", v65, 0.0);
    v238 = v237;
    v240 = v239;
    -[UILabel _firstLineBaseline](v203->_statusView, "_firstLineBaseline");
    v241 = v290[4];
    v243 = v290[5] - v242;
    v290[5] = v243;
    -[UILabel sizeToFit](v203->_statusView, "sizeToFit");
    v244 = CalInterfaceIsLeftToRight();
    v245 = a3 - v257 - v238 - v241;
    if (v244)
      v245 = v241;
    -[UILabel setFrame:](v203->_statusView, "setFrame:", CalRoundRectToScreenScale(v245, v243, v238, v240));
    -[EKEventDetailTitleCell contentView](v203, "contentView");
    v246 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v246, "addSubview:", v203->_statusView);

    v247 = v290[5];
    v203 = v272;
    -[UILabel _lastLineBaseline](v272->_statusView, "_lastLineBaseline");
    v249 = v247 + v248;
    v286[3] = v249;
    v290[5] = v256 + v249;
  }
  else
  {
    -[UILabel removeFromSuperview](statusView, "removeFromSuperview");
  }
  if (v203->_hideTopCellSeparator || v203->_hideBottomCellSeparator)
    -[EKEventDetailTitleCell _updateSeparatorStyle](v203, "_updateSeparatorStyle");
  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v254);
  v250 = v286[3];
  _Block_object_dispose(v275, 8);

  _Block_object_dispose(&v285, 8);
  _Block_object_dispose(&v289, 8);
  return v250;
}

void __42__EKEventDetailTitleCell__layoutForWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  BOOL IsRegularInViewHierarchy;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v26;
  double v27;
  uint64_t v28;
  double MaxY;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  uint8_t v42[16];
  CGRect v43;
  CGRect v44;

  v5 = a2;
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
  {
    objc_msgSend(v5, "removeFromSuperview");
    goto LABEL_24;
  }
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "detailsLeftInset");
  v13 = v11 - v12;
  objc_msgSend(*(id *)(a1 + 32), "detailsRightInset");
  objc_msgSend(v5, "setFrame:", v8, v9, v13 - v14 - *(double *)(a1 + 72), v10);
  objc_msgSend(v5, "sizeToFit");
  objc_msgSend(v5, "frame");
  v16 = v15;
  v18 = v17;
  if (!a3)
  {
    v19 = 0;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "_dateTimeViewForLine:", a3 - 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "window");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

  }
  else if ((EKUIHasFallbackSizingContext() & 1) == 0)
  {
    v25 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_1AF84D000, v25, OS_LOG_TYPE_DEBUG, "Unable to determine size class for event detail title cell", v42, 2u);
    }
    goto LABEL_14;
  }
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(*(void **)(a1 + 32));
  if ((a3 & 1) == 0
    || !IsRegularInViewHierarchy
    || (objc_msgSend(v19, "bounds"), v16 + CGRectGetWidth(v43) >= *(double *)(a1 + 80)))
  {
LABEL_14:
    objc_msgSend(v5, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "ascender");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 40)
                                                                - v27;

    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(double *)(v28 + 32);
    v24 = *(double *)(v28 + 40);
    v44.origin.x = v22;
    v44.origin.y = v24;
    v44.size.width = v16;
    v44.size.height = v18;
    MaxY = CGRectGetMaxY(v44);
    objc_msgSend(v5, "font");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "descender");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = MaxY + v31;

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24)
                                                                + *(double *)(a1 + 88);
    goto LABEL_15;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v22 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  objc_msgSend(v19, "frame");
  v24 = v23;
LABEL_15:
  if (CalInterfaceIsLeftToRight() && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    || (CalInterfaceIsLeftToRight() & 1) == 0 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v32 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "layoutMargins");
    v34 = v32 - v33 - v16;
    objc_msgSend(*(id *)(a1 + 32), "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "convertRect:fromView:", *(_QWORD *)(a1 + 32), v34, v24, v16, v18);
    v22 = v36;
    v24 = v37;
    v16 = v38;
    v18 = v39;

  }
  v40 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v40 + 24) && *(_BYTE *)(a1 + 96))
    *(_BYTE *)(v40 + 24) = 0;
  objc_msgSend(v5, "setFrame:", v22, v24, v16, v18);
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addSubview:", v5);

LABEL_24:
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)EKEventDetailTitleCell;
  -[EKEventDetailCell layoutForWidth:position:](&v18, sel_layoutForWidth_position_);
  self->_lastPosition = a4;
  -[EKEventDetailTitleCell _layoutForWidth:](self, "_layoutForWidth:", a3);
  v8 = v7;
  -[EKEventDetailTitleCell frame](self, "frame");
  v10 = v9;
  v12 = v11;
  if ((a4 & 4) != 0)
  {
    v16 = (void *)objc_opt_class();
    if ((a4 & 1) != 0)
      objc_msgSend(v16, "detailsTopVerticalInset");
    else
      objc_msgSend(v16, "detailsBottomVerticalInset");
    v15 = v17;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_locationFont");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_scaledValueForValue:", 24.0);
    v15 = v14;

  }
  -[EKEventDetailTitleCell setFrame:](self, "setFrame:", v10, v12, a3, ceil(v8) + v15);
}

- (void)_promptForSpanWithSourceView:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  EKEvent *event;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v6 = a3;
  v7 = a4;
  if ((-[EKEvent isOrWasPartOfRecurringSeries](self->super._event, "isOrWasPartOfRecurringSeries") & 1) != 0)
  {
    -[EKEventDetailTitleCell window](self, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      do
      {
        objc_msgSend(v9, "presentedViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "presentedViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v11;
      }
      while (v12);
    }
    else
    {
      v11 = v9;
    }
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__16;
    v40 = __Block_byref_object_dispose__16;
    v41 = 0;
    objc_msgSend(v6, "bannerPopoverSourceRect");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v6, "bannerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertRect:fromView:", v21, v14, v16, v18, v20);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    event = self->super._event;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __71__EKEventDetailTitleCell__promptForSpanWithSourceView_completionBlock___block_invoke;
    v33[3] = &unk_1E601B600;
    v34 = v7;
    v35 = &v36;
    +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v11, v6, event, v33, v23, v25, v27, v29);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v37[5];
    v37[5] = v31;

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __71__EKEventDetailTitleCell__promptForSpanWithSourceView_completionBlock___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (a2 <= 2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)didTapAddSuggestedLocationCell:(id)a3 disambiguatedLocation:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__EKEventDetailTitleCell_didTapAddSuggestedLocationCell_disambiguatedLocation___block_invoke;
  v8[3] = &unk_1E601B628;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[EKEventDetailTitleCell _promptForSpanWithSourceView:completionBlock:](self, "_promptForSpanWithSourceView:completionBlock:", a3, v8);

}

void __79__EKEventDetailTitleCell_didTapAddSuggestedLocationCell_disambiguatedLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 1128);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "locationTitle", (_QWORD)v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 40), "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "address");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

  }
  objc_msgSend(MEMORY[0x1E0CAA060], "_locationStringForLocations:", v4, (_QWORD)v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setTitle:", v15);

  v16 = (void *)MEMORY[0x1E0CAA160];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "preferredLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predictedLOI");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userInteractionWithPredictedLocationOfInterest:interaction:", v18, 7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "confirmPredictedLocation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_saveEventWithSpan:", a2);

}

- (void)didTapDismissSuggestedLocationCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CAA160];
  -[EKEvent preferredLocation](self->super._event, "preferredLocation", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predictedLOI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInteractionWithPredictedLocationOfInterest:interaction:", v6, 8);

  -[EKEvent rejectPredictedLocation](self->super._event, "rejectPredictedLocation");
  -[EKEventDetailTitleCell _saveEventWithSpan:](self, "_saveEventWithSpan:", 4);
}

- (void)_saveEventWithSpan:(int64_t)a3
{
  void *v5;
  EKEvent *event;
  char v7;
  id v8;
  void *v9;
  EKEvent *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[UIResponder EKUI_editor](self, "EKUI_editor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  event = self->super._event;
  v14 = 0;
  v7 = objc_msgSend(v5, "saveEvent:span:error:", event, a3, &v14);
  v8 = v14;
  if ((v7 & 1) == 0)
  {
    v9 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      v10 = self->super._event;
      v11 = v9;
      -[EKEvent title](v10, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_ERROR, "Error saving event %@ from the buttons detail item: %@", buf, 0x16u);

    }
  }
  -[EKEventDetailTitleCell delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predictionWasActedOn");

}

- (id)owningViewController
{
  void *v2;
  void *v3;

  -[EKEventDetailTitleCell delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "owningViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)conferenceCellUpdated:(id)a3
{
  id v3;

  -[EKEventDetailTitleCell delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshForHeightChange");

}

- (BOOL)conferenceCellShouldPresentShareSheet:(id)a3
{
  EKEventDetailTitleCell *v3;
  void *v4;

  v3 = self;
  -[EKEventDetailTitleCell delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "titleCellShouldPresentShareSheet:", v3);

  return (char)v3;
}

- (void)conferenceCell:(id)a3 requestPresentShareSheetWithActivityItems:(id)a4 withPopoverSourceView:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[EKEventDetailTitleCell delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "titleCell:requestPresentShareSheetWithActivityItems:withPopoverSourceView:", self, v8, v7);

}

- (EKEventDetailTitleCellDelegate)delegate
{
  return (EKEventDetailTitleCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasMapItemLaunchOptionFromTimeToLeaveNotification
{
  return self->_hasMapItemLaunchOptionFromTimeToLeaveNotification;
}

- (void)setHasMapItemLaunchOptionFromTimeToLeaveNotification:(BOOL)a3
{
  self->_hasMapItemLaunchOptionFromTimeToLeaveNotification = a3;
}

- (BOOL)showingInlineDayView
{
  return self->_showingInlineDayView;
}

- (void)setShowingInlineDayView:(BOOL)a3
{
  self->_showingInlineDayView = a3;
}

- (unint64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recurrenceButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_recurrenceView, 0);
  objc_storeStrong((id *)&self->_dateTimeViews, 0);
  objc_storeStrong((id *)&self->_travelTimeView, 0);
  objc_storeStrong((id *)&self->_conferenceDetailView, 0);
  objc_storeStrong((id *)&self->_suggestedLocationCell, 0);
  objc_storeStrong((id *)&self->_locationItems, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
