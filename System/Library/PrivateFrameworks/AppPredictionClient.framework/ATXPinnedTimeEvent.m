@implementation ATXPinnedTimeEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (UTType)uniformType
{
  return (UTType *)objc_msgSend(MEMORY[0x1E0CEC3F8], "exportedTypeWithIdentifier:conformingToType:", CFSTR("com.proactive.pinnedTimeEvent"), *MEMORY[0x1E0CEC528]);
}

- (ATXPinnedTimeEvent)initWithURL:(id)a3 sourceBundleIdentifier:(id)a4 iconData:(id)a5 title:(id)a6 summary:(id)a7 location:(id)a8 siteName:(id)a9 durationHint:(double)a10 actions:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  ATXPinnedTimeEvent *v26;
  uint64_t v27;
  NSUUID *uuid;
  uint64_t v29;
  NSString *title;
  uint64_t v31;
  NSString *sourceBundleIdentifier;
  uint64_t v33;
  NSData *iconData;
  uint64_t v35;
  NSString *summary;
  uint64_t v37;
  NSString *siteName;
  uint64_t v39;
  NSArray *actions;
  ATXPinnedTimeEvent *v41;
  id v43;
  objc_super v44;

  v43 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a11;
  v44.receiver = self;
  v44.super_class = (Class)ATXPinnedTimeEvent;
  v26 = -[ATXPinnedTimeEvent init](&v44, sel_init);
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v27 = objc_claimAutoreleasedReturnValue();
    uuid = v26->_uuid;
    v26->_uuid = (NSUUID *)v27;

    v26->_eventType = 0;
    objc_storeStrong((id *)&v26->_url, a3);
    v29 = objc_msgSend(v21, "copy");
    title = v26->_title;
    v26->_title = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    sourceBundleIdentifier = v26->_sourceBundleIdentifier;
    v26->_sourceBundleIdentifier = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    iconData = v26->_iconData;
    v26->_iconData = (NSData *)v33;

    v35 = objc_msgSend(v22, "copy");
    summary = v26->_summary;
    v26->_summary = (NSString *)v35;

    objc_storeStrong((id *)&v26->_location, a8);
    v37 = objc_msgSend(v24, "copy");
    siteName = v26->_siteName;
    v26->_siteName = (NSString *)v37;

    v26->_durationHint = a10;
    v39 = objc_msgSend(v25, "copy");
    actions = v26->_actions;
    v26->_actions = (NSArray *)v39;

    v41 = v26;
  }

  return v26;
}

- (ATXPinnedTimeEvent)initWithTitle:(id)a3 icon:(id)a4 location:(id)a5 sourceBundleIdentifier:(id)a6 durationHint:(double)a7 actions:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  ATXPinnedTimeEvent *v19;
  uint64_t v20;
  NSUUID *uuid;
  uint64_t v22;
  NSString *title;
  uint64_t v24;
  NSString *sourceBundleIdentifier;
  uint64_t v26;
  NSArray *actions;
  ATXPinnedTimeEvent *v28;
  objc_super v30;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)ATXPinnedTimeEvent;
  v19 = -[ATXPinnedTimeEvent init](&v30, sel_init);
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = objc_claimAutoreleasedReturnValue();
    uuid = v19->_uuid;
    v19->_uuid = (NSUUID *)v20;

    v19->_eventType = 1;
    v22 = objc_msgSend(v14, "copy");
    title = v19->_title;
    v19->_title = (NSString *)v22;

    objc_storeStrong((id *)&v19->_icon, a4);
    objc_storeStrong((id *)&v19->_location, a5);
    v24 = objc_msgSend(v17, "copy");
    sourceBundleIdentifier = v19->_sourceBundleIdentifier;
    v19->_sourceBundleIdentifier = (NSString *)v24;

    v19->_durationHint = a7;
    v26 = objc_msgSend(v18, "copy");
    actions = v19->_actions;
    v19->_actions = (NSArray *)v26;

    v28 = v19;
  }

  return v19;
}

- (ATXPinnedTimeEvent)initWithTitle:(id)a3 icon:(id)a4 location:(id)a5 sourceBundleIdentifier:(id)a6 durationHint:(double)a7 actions:(id)a8 date:(id)a9 label:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  ATXPinnedTimeEvent *v23;
  uint64_t v24;
  NSUUID *uuid;
  uint64_t v26;
  NSString *title;
  uint64_t v28;
  NSString *sourceBundleIdentifier;
  uint64_t v30;
  NSArray *actions;
  uint64_t v32;
  NSDate *date;
  uint64_t v34;
  NSString *label;
  ATXPinnedTimeEvent *v36;
  id v38;
  objc_super v39;

  v17 = a3;
  v38 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)ATXPinnedTimeEvent;
  v23 = -[ATXPinnedTimeEvent init](&v39, sel_init);
  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v24 = objc_claimAutoreleasedReturnValue();
    uuid = v23->_uuid;
    v23->_uuid = (NSUUID *)v24;

    v23->_eventType = 2;
    v26 = objc_msgSend(v17, "copy");
    title = v23->_title;
    v23->_title = (NSString *)v26;

    objc_storeStrong((id *)&v23->_icon, a4);
    objc_storeStrong((id *)&v23->_location, a5);
    v28 = objc_msgSend(v19, "copy");
    sourceBundleIdentifier = v23->_sourceBundleIdentifier;
    v23->_sourceBundleIdentifier = (NSString *)v28;

    v23->_durationHint = a7;
    v30 = objc_msgSend(v20, "copy");
    actions = v23->_actions;
    v23->_actions = (NSArray *)v30;

    v32 = objc_msgSend(v21, "copy");
    date = v23->_date;
    v23->_date = (NSDate *)v32;

    v34 = objc_msgSend(v22, "copy");
    label = v23->_label;
    v23->_label = (NSString *)v34;

    v36 = v23;
  }

  return v23;
}

- (ATXPinnedTimeEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *uuid;
  void *v19;
  void *v20;
  void *v21;
  ATXPinnedTimeEvent *v22;
  ATXPinnedTimeEvent *v23;
  void *v24;
  ATXPinnedTimeEvent *v25;
  NSUUID *v26;
  void *v28;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceBundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("durationHint"));
    if (v9 == 0.0)
      v10 = 1800.0;
    else
      v10 = v9;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("actions"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = (void *)MEMORY[0x1E0C9AA60];
    if (v12)
      v14 = (void *)v12;
    v15 = v14;

    if (v6 == 2)
    {
      v29 = v7;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("label"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
      uuid = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = -[ATXPinnedTimeEvent initWithTitle:icon:location:sourceBundleIdentifier:durationHint:actions:date:label:](self, "initWithTitle:icon:location:sourceBundleIdentifier:durationHint:actions:date:label:", v8, v24, v11, v29, v15, uuid, v10, v16);
        self = v25;
        if (v25)
          objc_storeStrong((id *)&v25->_uuid, v5);
        v23 = self;
      }
      else
      {
        v23 = 0;
      }

      goto LABEL_27;
    }
    if (v6 == 1)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        self = -[ATXPinnedTimeEvent initWithTitle:icon:location:sourceBundleIdentifier:durationHint:actions:](self, "initWithTitle:icon:location:sourceBundleIdentifier:durationHint:actions:", v8, v16, v11, v7, v15, v10);
        if (!self)
        {
          v23 = 0;
          goto LABEL_28;
        }
        v29 = v7;
        v26 = v5;
        uuid = self->_uuid;
        self->_uuid = v26;
        goto LABEL_22;
      }
    }
    else
    {
      if (v6)
      {
        v23 = 0;
LABEL_29:

        goto LABEL_30;
      }
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconData"));
        v28 = v8;
        v17 = v7;
        uuid = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summary"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siteName"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v17;
        v21 = v17;
        v8 = v28;
        v22 = -[ATXPinnedTimeEvent initWithURL:sourceBundleIdentifier:iconData:title:summary:location:siteName:durationHint:actions:](self, "initWithURL:sourceBundleIdentifier:iconData:title:summary:location:siteName:durationHint:actions:", v16, v21, uuid, v28, v19, v11, v10, v20, v15);
        self = v22;
        if (v22)
          objc_storeStrong((id *)&v22->_uuid, v5);

LABEL_22:
        v23 = self;
LABEL_27:

        v7 = v29;
        goto LABEL_28;
      }
    }
    v23 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v23 = 0;
LABEL_30:

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t eventType;
  id v5;

  eventType = self->_eventType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", eventType, CFSTR("eventType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceBundleIdentifier, CFSTR("sourceBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconData, CFSTR("iconData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_siteName, CFSTR("siteName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_summary, CFSTR("summary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("durationHint"), self->_durationHint);
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_actions, CFSTR("actions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_label, CFSTR("label"));

}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (double)durationHint
{
  return self->_durationHint;
}

- (ATXTimeEventLocation)location
{
  return self->_location;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)label
{
  return self->_label;
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSString)summary
{
  return self->_summary;
}

- (NSString)siteName
{
  return self->_siteName;
}

- (ATXTimeEventIcon)icon
{
  return self->_icon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_siteName, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
}

@end
