@implementation ATXTimeEventPresentation

- (ATXTimeEventPresentation)initWithCardIcons:(id)a3 shouldOverlapIcons:(BOOL)a4 subtitleGlyph:(id)a5 hasCheckbox:(BOOL)a6 allowsRescheduling:(BOOL)a7
{
  id v12;
  id v13;
  ATXTimeEventPresentation *v14;
  uint64_t v15;
  NSArray *icons;
  uint64_t v17;
  NSString *subtitleGlyph;
  NSArray *fields;
  objc_super v21;

  v12 = a3;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXTimeEventPresentation;
  v14 = -[ATXTimeEventPresentation init](&v21, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    icons = v14->_icons;
    v14->_icons = (NSArray *)v15;

    v14->_overlapIcons = a4;
    v17 = objc_msgSend(v13, "copy");
    subtitleGlyph = v14->_subtitleGlyph;
    v14->_subtitleGlyph = (NSString *)v17;

    v14->_hasCheckbox = a6;
    fields = v14->_fields;
    v14->_fields = (NSArray *)MEMORY[0x1E0C9AA60];

    v14->_allowsRescheduling = a7;
  }

  return v14;
}

- (ATXTimeEventPresentation)initWithCardIcon:(id)a3 fields:(id)a4 backgroundImageData:(id)a5 logoImageData:(id)a6 subtitleGlyph:(id)a7 allowsRescheduling:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ATXTimeEventPresentation *v19;
  uint64_t v20;
  NSArray *icons;
  uint64_t v22;
  NSArray *fields;
  uint64_t v24;
  NSString *subtitleGlyph;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v27.receiver = self;
  v27.super_class = (Class)ATXTimeEventPresentation;
  v19 = -[ATXTimeEventPresentation init](&v27, sel_init);
  if (v19)
  {
    v28[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    icons = v19->_icons;
    v19->_icons = (NSArray *)v20;

    v22 = objc_msgSend(v15, "copy");
    fields = v19->_fields;
    v19->_fields = (NSArray *)v22;

    objc_storeStrong((id *)&v19->_backgroundImageData, a5);
    objc_storeStrong((id *)&v19->_logoImageData, a6);
    v24 = objc_msgSend(v18, "copy");
    subtitleGlyph = v19->_subtitleGlyph;
    v19->_subtitleGlyph = (NSString *)v24;

    v19->_allowsRescheduling = a8;
  }

  return v19;
}

- (ATXTimeEventPresentation)initWithRouteMapIcons:(id)a3 subtitleGlyph:(id)a4 allowsRescheduling:(BOOL)a5
{
  id v8;
  id v9;
  ATXTimeEventPresentation *v10;
  uint64_t v11;
  NSArray *icons;
  uint64_t v13;
  NSString *subtitleGlyph;
  NSArray *fields;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXTimeEventPresentation;
  v10 = -[ATXTimeEventPresentation init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    icons = v10->_icons;
    v10->_icons = (NSArray *)v11;

    v10->_supportsRouteMap = 1;
    v13 = objc_msgSend(v9, "copy");
    subtitleGlyph = v10->_subtitleGlyph;
    v10->_subtitleGlyph = (NSString *)v13;

    fields = v10->_fields;
    v10->_fields = (NSArray *)MEMORY[0x1E0C9AA60];

    v10->_allowsRescheduling = a5;
  }

  return v10;
}

- (ATXTimeEventPresentation)initWithPinnedTimeEvent:(id)a3 subtitleGlyph:(id)a4 allowsRescheduling:(BOOL)a5
{
  id v9;
  id v10;
  ATXTimeEventPresentation *v11;
  ATXTimeEventPresentation *v12;
  uint64_t v13;
  NSString *subtitleGlyph;
  NSArray *fields;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXTimeEventPresentation;
  v11 = -[ATXTimeEventPresentation init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pinnedTimeEvent, a3);
    v13 = objc_msgSend(v10, "copy");
    subtitleGlyph = v12->_subtitleGlyph;
    v12->_subtitleGlyph = (NSString *)v13;

    fields = v12->_fields;
    v12->_fields = (NSArray *)MEMORY[0x1E0C9AA60];

    v12->_allowsRescheduling = a5;
  }

  return v12;
}

- (ATXTimeEventPresentation)initWithWidget:(id)a3 allowsRescheduling:(BOOL)a4
{
  id v7;
  ATXTimeEventPresentation *v8;
  ATXTimeEventPresentation *v9;
  NSArray *fields;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXTimeEventPresentation;
  v8 = -[ATXTimeEventPresentation init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_widget, a3);
    fields = v9->_fields;
    v9->_fields = (NSArray *)MEMORY[0x1E0C9AA60];

    v9->_allowsRescheduling = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXTimeScheduledWidget *widget;
  id v5;

  widget = self->_widget;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", widget, CFSTR("widget"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icons, CFSTR("icons"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsRouteMap, CFSTR("routeMap"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasCheckbox, CFSTR("hasCheckbox"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_overlapIcons, CFSTR("overlapIcons"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitleGlyph, CFSTR("subtitleGlyph"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pinnedTimeEvent, CFSTR("pinnedTimeEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundImageData, CFSTR("backgroundImageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_logoImageData, CFSTR("logoImageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fields, CFSTR("fields"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowsRescheduling, CFSTR("allowsRescheduling"));

}

- (ATXTimeEventPresentation)initWithCoder:(id)a3
{
  id v4;
  ATXTimeEventPresentation *v5;
  uint64_t v6;
  ATXTimeScheduledWidget *widget;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *icons;
  uint64_t v15;
  NSString *subtitleGlyph;
  uint64_t v17;
  ATXPinnedTimeEvent *pinnedTimeEvent;
  uint64_t v19;
  NSData *backgroundImageData;
  uint64_t v21;
  NSData *logoImageData;
  uint64_t v23;
  NSArray *fields;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ATXTimeEventPresentation;
  v5 = -[ATXTimeEventPresentation init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widget"));
    v6 = objc_claimAutoreleasedReturnValue();
    widget = v5->_widget;
    v5->_widget = (ATXTimeScheduledWidget *)v6;

    v8 = (void *)MEMORY[0x1A85A4F90]();
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    objc_opt_self();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v11, 0);

    objc_autoreleasePoolPop(v8);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("icons"));
    v13 = objc_claimAutoreleasedReturnValue();
    icons = v5->_icons;
    v5->_icons = (NSArray *)v13;

    v5->_supportsRouteMap = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("routeMap"));
    v5->_hasCheckbox = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasCheckbox"));
    v5->_overlapIcons = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("overlapIcons"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitleGlyph"));
    v15 = objc_claimAutoreleasedReturnValue();
    subtitleGlyph = v5->_subtitleGlyph;
    v5->_subtitleGlyph = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pinnedTimeEvent"));
    v17 = objc_claimAutoreleasedReturnValue();
    pinnedTimeEvent = v5->_pinnedTimeEvent;
    v5->_pinnedTimeEvent = (ATXPinnedTimeEvent *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundImageData"));
    v19 = objc_claimAutoreleasedReturnValue();
    backgroundImageData = v5->_backgroundImageData;
    v5->_backgroundImageData = (NSData *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoImageData"));
    v21 = objc_claimAutoreleasedReturnValue();
    logoImageData = v5->_logoImageData;
    v5->_logoImageData = (NSData *)v21;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("fields"));
    v23 = objc_claimAutoreleasedReturnValue();
    fields = v5->_fields;
    v5->_fields = (NSArray *)v23;

    v5->_allowsRescheduling = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsRescheduling"));
  }

  return v5;
}

- (NSArray)icons
{
  return self->_icons;
}

- (BOOL)overlapIcons
{
  return self->_overlapIcons;
}

- (BOOL)hasCheckbox
{
  return self->_hasCheckbox;
}

- (NSData)backgroundImageData
{
  return self->_backgroundImageData;
}

- (NSData)logoImageData
{
  return self->_logoImageData;
}

- (NSArray)fields
{
  return self->_fields;
}

- (ATXTimeScheduledWidget)widget
{
  return self->_widget;
}

- (BOOL)supportsRouteMap
{
  return self->_supportsRouteMap;
}

- (ATXPinnedTimeEvent)pinnedTimeEvent
{
  return self->_pinnedTimeEvent;
}

- (NSString)subtitleGlyph
{
  return self->_subtitleGlyph;
}

- (BOOL)allowsRescheduling
{
  return self->_allowsRescheduling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleGlyph, 0);
  objc_storeStrong((id *)&self->_pinnedTimeEvent, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_logoImageData, 0);
  objc_storeStrong((id *)&self->_backgroundImageData, 0);
  objc_storeStrong((id *)&self->_icons, 0);
}

@end
