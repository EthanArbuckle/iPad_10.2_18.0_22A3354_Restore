@implementation ICAttributionViewConfiguration

+ (OS_dispatch_queue)loadDataQueue
{
  if (loadDataQueue_token != -1)
    dispatch_once(&loadDataQueue_token, &__block_literal_global_16);
  return (OS_dispatch_queue *)(id)loadDataQueue_loadDataQueue;
}

void __47__ICAttributionViewConfiguration_loadDataQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.notes.attribution.configuration.load-data-queue", attr);
  v2 = (void *)loadDataQueue_loadDataQueue;
  loadDataQueue_loadDataQueue = (uint64_t)v1;

}

- (ICAttributionViewConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  ICAttributionViewConfiguration *v5;
  uint64_t v6;
  ICAttributionViewConfigurationSharedState *sharedState;
  void *v8;
  uint64_t v9;
  NSArray *editGroups;
  uint64_t v11;
  ICTTTextEdit *textEdit;
  NSUInteger v13;
  NSUInteger v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  NSAttributedString *attribution;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t v33;
  id attributionTextStorage;
  uint64_t v35;
  NSDate *timestamp;
  uint64_t v37;
  NSAttributedString *formattedTimestamp;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  uint64_t v43;
  id formattedTimestampTextStorage;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  uint64_t v49;
  NSDate *explicitTimestamp;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  uint64_t v55;
  UIImage *statusImage;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  id v63;
  void *v64;
  uint64_t v65;
  NSMutableArray *highlightConfigurations;
  void *v67;
  ICAttributionViewConfiguration *v68;
  uint64_t v69;
  NSArray *childConfigurations;
  void *v71;
  uint64_t v72;
  NSArray *unreadUserIDs;
  _QWORD v75[4];
  ICAttributionViewConfiguration *v76;
  objc_super v77;

  v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)ICAttributionViewConfiguration;
  v5 = -[ICAttributionViewConfiguration init](&v77, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sharedState");
    v6 = objc_claimAutoreleasedReturnValue();
    sharedState = v5->_sharedState;
    v5->_sharedState = (ICAttributionViewConfigurationSharedState *)v6;

    objc_msgSend(v4, "editGroups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    editGroups = v5->_editGroups;
    v5->_editGroups = (NSArray *)v9;

    objc_msgSend(v4, "textEdit");
    v11 = objc_claimAutoreleasedReturnValue();
    textEdit = v5->_textEdit;
    v5->_textEdit = (ICTTTextEdit *)v11;

    v5->_range.location = objc_msgSend(v4, "range");
    v5->_range.length = v13;
    v5->_trimmedRange.location = objc_msgSend(v4, "trimmedRange");
    v5->_trimmedRange.length = v14;
    objc_msgSend(v4, "frame");
    v5->_frame.origin.x = v15;
    v5->_frame.origin.y = v16;
    v5->_frame.size.width = v17;
    v5->_frame.size.height = v18;
    objc_msgSend(v4, "adjustedFrame");
    v5->_adjustedFrame.origin.x = v19;
    v5->_adjustedFrame.origin.y = v20;
    v5->_adjustedFrame.size.width = v21;
    v5->_adjustedFrame.size.height = v22;
    objc_msgSend(v4, "associatedTextFrame");
    v5->_associatedTextFrame.origin.x = v23;
    v5->_associatedTextFrame.origin.y = v24;
    v5->_associatedTextFrame.size.width = v25;
    v5->_associatedTextFrame.size.height = v26;
    objc_msgSend(v4, "attribution");
    v27 = objc_claimAutoreleasedReturnValue();
    attribution = v5->_attribution;
    v5->_attribution = (NSAttributedString *)v27;

    objc_msgSend(v4, "attributionFrame");
    v5->_attributionFrame.origin.x = v29;
    v5->_attributionFrame.origin.y = v30;
    v5->_attributionFrame.size.width = v31;
    v5->_attributionFrame.size.height = v32;
    v5->_forcesAttributionHidden = objc_msgSend(v4, "forcesAttributionHidden");
    objc_msgSend(v4, "attributionTextStorage");
    v33 = objc_claimAutoreleasedReturnValue();
    attributionTextStorage = v5->_attributionTextStorage;
    v5->_attributionTextStorage = (id)v33;

    objc_msgSend(v4, "timestamp");
    v35 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v35;

    v5->_forcesTimestampHidden = objc_msgSend(v4, "forcesTimestampHidden");
    objc_msgSend(v4, "formattedTimestamp");
    v37 = objc_claimAutoreleasedReturnValue();
    formattedTimestamp = v5->_formattedTimestamp;
    v5->_formattedTimestamp = (NSAttributedString *)v37;

    objc_msgSend(v4, "formattedTimestampFrame");
    v5->_formattedTimestampFrame.origin.x = v39;
    v5->_formattedTimestampFrame.origin.y = v40;
    v5->_formattedTimestampFrame.size.width = v41;
    v5->_formattedTimestampFrame.size.height = v42;
    objc_msgSend(v4, "formattedTimestampTextStorage");
    v43 = objc_claimAutoreleasedReturnValue();
    formattedTimestampTextStorage = v5->_formattedTimestampTextStorage;
    v5->_formattedTimestampTextStorage = (id)v43;

    objc_msgSend(v4, "adjustedFormattedTimestampFrame");
    v5->_adjustedFormattedTimestampFrame.origin.x = v45;
    v5->_adjustedFormattedTimestampFrame.origin.y = v46;
    v5->_adjustedFormattedTimestampFrame.size.width = v47;
    v5->_adjustedFormattedTimestampFrame.size.height = v48;
    objc_msgSend(v4, "explicitTimestamp");
    v49 = objc_claimAutoreleasedReturnValue();
    explicitTimestamp = v5->_explicitTimestamp;
    v5->_explicitTimestamp = (NSDate *)v49;

    objc_msgSend(v4, "disclosureImageFrame");
    v5->_disclosureImageFrame.origin.x = v51;
    v5->_disclosureImageFrame.origin.y = v52;
    v5->_disclosureImageFrame.size.width = v53;
    v5->_disclosureImageFrame.size.height = v54;
    objc_msgSend(v4, "statusImage");
    v55 = objc_claimAutoreleasedReturnValue();
    statusImage = v5->_statusImage;
    v5->_statusImage = (UIImage *)v55;

    objc_msgSend(v4, "statusImageFrame");
    v5->_statusImageFrame.origin.x = v57;
    v5->_statusImageFrame.origin.y = v58;
    v5->_statusImageFrame.size.width = v59;
    v5->_statusImageFrame.size.height = v60;
    objc_msgSend(v4, "appliedHorizontalAdjustmentRatio");
    v5->_appliedHorizontalAdjustmentRatio = v61;
    objc_msgSend(v4, "preferredHighlightValue");
    v5->_preferredHighlightValue = v62;
    v63 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "highlightConfigurations");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v63, "initWithArray:copyItems:", v64, 1);
    highlightConfigurations = v5->_highlightConfigurations;
    v5->_highlightConfigurations = (NSMutableArray *)v65;

    objc_msgSend(v4, "childConfigurations");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __56__ICAttributionViewConfiguration_initWithConfiguration___block_invoke;
    v75[3] = &unk_1EA7DFC70;
    v68 = v5;
    v76 = v68;
    objc_msgSend(v67, "ic_map:", v75);
    v69 = objc_claimAutoreleasedReturnValue();
    childConfigurations = v68->_childConfigurations;
    v68->_childConfigurations = (NSArray *)v69;

    v68->_preview = objc_msgSend(v4, "isPreview");
    v68->_focused = objc_msgSend(v4, "isFocused");
    v68->_blurred = objc_msgSend(v4, "isBlurred");
    objc_msgSend(v4, "unreadUserIDs");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "copy");
    unreadUserIDs = v68->_unreadUserIDs;
    v68->_unreadUserIDs = (NSArray *)v72;

    v68->_forceVisible = objc_msgSend(v4, "forceVisible");
    v68->_dataLoaded = objc_msgSend(v4, "isDataLoaded");

  }
  return v5;
}

id __56__ICAttributionViewConfiguration_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "copy");
  objc_msgSend(v3, "setParentConfiguration:", *(_QWORD *)(a1 + 32));
  return v3;
}

- (ICAttributionViewConfiguration)initWithSharedState:(id)a3 editGroups:(id)a4 parentConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICAttributionViewConfiguration *v11;
  ICAttributionViewConfiguration *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ICAttributionViewConfiguration;
  v11 = -[ICAttributionViewConfiguration init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_editGroups, a4);
    objc_storeWeak((id *)&v12->_parentConfiguration, v10);
    objc_msgSend(v9, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "range");
    -[ICAttributionViewConfiguration commonInitWithSharedState:range:](v12, "commonInitWithSharedState:range:", v8, v14, v15);

  }
  return v12;
}

- (ICAttributionViewConfiguration)initWithSharedState:(id)a3 textEdit:(id)a4 parentConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICAttributionViewConfiguration *v11;
  ICAttributionViewConfiguration *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICAttributionViewConfiguration;
  v11 = -[ICAttributionViewConfiguration init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_textEdit, a4);
    objc_storeWeak((id *)&v12->_parentConfiguration, v10);
    v13 = objc_msgSend(v9, "range");
    -[ICAttributionViewConfiguration commonInitWithSharedState:range:](v12, "commonInitWithSharedState:range:", v8, v13, v14);
  }

  return v12;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v18;
  void *v19;

  if (-[ICAttributionViewConfiguration forcesAttributionHidden](self, "forcesAttributionHidden"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[ICAttributionViewConfiguration attribution](self, "attribution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICAttributionViewConfiguration attribution](self, "attribution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (-[ICAttributionViewConfiguration forcesTimestampHidden](self, "forcesTimestampHidden"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[ICAttributionViewConfiguration formattedTimestamp](self, "formattedTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("[%@]"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICAttributionViewConfiguration formattedTimestamp](self, "formattedTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[ICAttributionViewConfiguration childConfigurations](self, "childConfigurations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[ICAttributionViewConfiguration childConfigurations](self, "childConfigurations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ic_map:", &__block_literal_global_16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB3940];
    -[ICAttributionViewConfiguration adjustedFrame](self, "adjustedFrame");
    ICStringFromRect();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("<Frame: %@\n Name: %@\n Time: %@\n%@>"), v17, v6, v10, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[ICAttributionViewConfiguration adjustedFrame](self, "adjustedFrame");
    ICStringFromRect();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("<Frame: %@\n Name: %@\n Time: %@>"), v15, v6, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

id __50__ICAttributionViewConfiguration_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "debugDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_map:", &__block_literal_global_20_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("\n"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __50__ICAttributionViewConfiguration_debugDescription__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t%@"), a2);
}

- (BOOL)isEqualToAttributionViewConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v7 = a3;
  -[ICAttributionViewConfiguration textEdit](self, "textEdit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "textEdit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v15 = 0;
      v9 = 0;
      goto LABEL_7;
    }
  }
  -[ICAttributionViewConfiguration textEdit](self, "textEdit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textEdit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", v4))
  {
    v9 = 1;
LABEL_7:
    -[ICAttributionViewConfiguration editGroups](self, "editGroups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v7, "editGroups"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[ICAttributionViewConfiguration editGroups](self, "editGroups");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "editGroups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "isEqual:", v13);

      if (v11)
        goto LABEL_13;
    }
    else
    {
      v10 = 1;
    }

LABEL_13:
    if (!v9)
      goto LABEL_15;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_14:

LABEL_15:
  if (!v8)

  return v10;
}

- (BOOL)isAttributionHidden
{
  void *v2;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  if (!-[ICAttributionViewConfiguration forcesAttributionHidden](self, "forcesAttributionHidden")
    && !-[ICAttributionViewConfiguration isBlurred](self, "isBlurred"))
  {
    -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5 && -[ICAttributionViewConfiguration isFocused](self, "isFocused"))
    {
      v4 = 1;
LABEL_12:

      return v4;
    }
    -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (-[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "isFocused")))
    {
      -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "isBlurred");

      if (!v6)
        goto LABEL_12;
    }
    else
    {
      v4 = 1;
    }

    goto LABEL_12;
  }
  return 1;
}

- (BOOL)isTimestampHidden
{
  int v3;
  void *v5;
  void *v6;

  if (-[ICAttributionViewConfiguration forcesTimestampHidden](self, "forcesTimestampHidden")
    || -[ICAttributionViewConfiguration isPreview](self, "isPreview")
    || -[ICAttributionViewConfiguration isFocused](self, "isFocused")
    || -[ICAttributionViewConfiguration isBlurred](self, "isBlurred"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "isFocused") ^ 1;

    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (BOOL)isStatusImageHidden
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  -[ICAttributionViewConfiguration statusImageFrame](self, "statusImageFrame");
  v4 = v3;
  v6 = v5;
  -[ICAttributionViewConfiguration unreadUserIDs](self, "unreadUserIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = 1;
    if (!-[ICAttributionViewConfiguration isFocused](self, "isFocused") && v6 != 0.0 && v4 != 0.0)
    {
      -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isFocused"))
          v8 = -[ICAttributionViewConfiguration isBlurred](self, "isBlurred");

      }
      else
      {
        v8 = -[ICAttributionViewConfiguration isBlurred](self, "isBlurred");
      }

    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)isDisclosureImageHidden
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  if (-[ICAttributionViewConfiguration isBlurred](self, "isBlurred")
    || -[ICAttributionViewConfiguration isPreview](self, "isPreview"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      -[ICAttributionViewConfiguration childConfigurations](self, "childConfigurations");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v5, "count") > 1)
        LOBYTE(v3) = 0;
      else
        v3 = !-[ICAttributionViewConfiguration forcesTimestampHidden](self, "forcesTimestampHidden");

    }
  }
  return v3;
}

- (void)setFocused:(BOOL)a3
{
  self->_focused = a3;
  if (a3)
    self->_blurred = 0;
  -[ICAttributionViewConfiguration updateHighlightAlpha](self, "updateHighlightAlpha");
}

- (void)setBlurred:(BOOL)a3
{
  self->_blurred = a3;
  if (a3)
    self->_focused = 0;
  -[ICAttributionViewConfiguration updateHighlightAlpha](self, "updateHighlightAlpha");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_frame, a3))
  {
    self->_frame.origin.x = x;
    self->_frame.origin.y = y;
    self->_frame.size.width = width;
    self->_frame.size.height = height;
    -[ICAttributionViewConfiguration setAdjustedFrame:](self, "setAdjustedFrame:", x, y, width, height);
  }
}

- (void)setAdjustedFrame:(CGRect)a3
{
  double y;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _QWORD v14[6];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  y = a3.origin.y;
  v20 = *MEMORY[0x1E0C80C00];
  self->_adjustedFrame = a3;
  -[ICAttributionViewConfiguration frame](self, "frame");
  v6 = y - v5;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ICAttributionViewConfiguration highlightConfigurations](self, "highlightConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "frame");
        objc_msgSend(v12, "setAdjustedFrame:");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[ICAttributionViewConfiguration childConfigurations](self, "childConfigurations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__ICAttributionViewConfiguration_setAdjustedFrame___block_invoke;
  v14[3] = &unk_1EA7DFD18;
  *(double *)&v14[5] = v6;
  v14[4] = self;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

}

void __51__ICAttributionViewConfiguration_setAdjustedFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  id v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  if (a3)
  {
    v5 = a2;
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12 - *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "childConfigurations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", a3 - 1);
    v52 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v52, "adjustedFrame");
    v16 = v15;
    objc_msgSend(v52, "formattedTimestampFrame");
    if (v13 >= v16 + v17)
      v18 = v13;
    else
      v18 = v16 + v17;
    objc_msgSend(v5, "setAdjustedFrame:", v7, v18, v9, v11);
    objc_msgSend(v5, "adjustedFrame");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    objc_msgSend(v52, "adjustedFrame");
    v56.origin.x = v27;
    v56.origin.y = v28;
    v56.size.width = v29;
    v56.size.height = v30;
    v53.origin.x = v20;
    v53.origin.y = v22;
    v53.size.width = v24;
    v53.size.height = v26;
    v54 = CGRectIntersection(v53, v56);
    x = v54.origin.x;
    y = v54.origin.y;
    width = v54.size.width;
    height = v54.size.height;
    objc_msgSend(v52, "formattedTimestampFrame");
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v55.origin.x = x;
    v55.origin.y = y;
    v55.size.width = width;
    v55.size.height = height;
    if (!CGRectIsNull(v55))
    {
      objc_msgSend(v52, "formattedTimestampFrame");
      v36 = v43;
      v45 = v44;
      v40 = v46;
      v42 = v47;
      objc_msgSend(*(id *)(a1 + 32), "childConfigurations");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "firstObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v49, "attributionFrame");
      if (height >= v50)
        v51 = v50;
      else
        v51 = height;
      v38 = v45 - v51;

    }
    objc_msgSend(v52, "setAdjustedFormattedTimestampFrame:", v36, v38, v40, v42);

  }
}

- (void)setTrimmedRange:(_NSRange)a3
{
  if (self->_trimmedRange.location != a3.location || self->_trimmedRange.length != a3.length)
  {
    self->_trimmedRange = a3;
    -[ICAttributionViewConfiguration rectForRange:](self, "rectForRange:");
    -[ICAttributionViewConfiguration setAssociatedTextFrame:](self, "setAssociatedTextFrame:");
  }
}

- (void)addEditGroup:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *editGroups;
  NSUInteger v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSRange v17;
  id v18;
  NSRange v19;
  NSRange v20;

  v18 = a3;
  -[ICAttributionViewConfiguration editGroups](self, "editGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObject:", v18);
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  editGroups = self->_editGroups;
  self->_editGroups = v5;

  v19.location = objc_msgSend(v18, "range");
  v19.length = v7;
  self->_range = NSUnionRange(self->_range, v19);
  if (-[ICAttributionViewConfiguration hasValidRange](self, "hasValidRange"))
  {
    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "noteTextStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v18, "range");
    v13 = objc_msgSend(v9, "ic_rangeByTrimmingCharactersInSet:inRange:", v10, v11, v12);
    v15 = v14;

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = objc_msgSend(v18, "range");
      v15 = v16;
    }
    v20.location = v13;
    v20.length = v15;
    v17 = NSUnionRange(self->_trimmedRange, v20);
    -[ICAttributionViewConfiguration setTrimmedRange:](self, "setTrimmedRange:", v17.location, v17.length);
  }

}

- (void)loadDataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "loadDataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__ICAttributionViewConfiguration_loadDataWithCompletion___block_invoke;
  v7[3] = &unk_1EA7DFD40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __57__ICAttributionViewConfiguration_loadDataWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "synchronouslyLoadData");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)synchronouslyLoadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[ICAttributionViewConfiguration hasValidRange](self, "hasValidRange"))
  {
    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "note");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__ICAttributionViewConfiguration_synchronouslyLoadData__block_invoke;
    v16[3] = &unk_1EA7DD2D8;
    v16[4] = self;
    objc_msgSend(v5, "performBlockAndWait:", v16);

    -[ICAttributionViewConfiguration updateStatusImage](self, "updateStatusImage");
    -[ICAttributionViewConfiguration updateFrames](self, "updateFrames");
    -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[ICAttributionViewConfiguration updateHighlightFrames](self, "updateHighlightFrames");
      -[ICAttributionViewConfiguration updateChildConfigurations](self, "updateChildConfigurations");
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[ICAttributionViewConfiguration childConfigurations](self, "childConfigurations", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "synchronouslyLoadData");
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        }
        while (v9);
      }

    }
    -[ICAttributionViewConfiguration setDataLoaded:](self, "setDataLoaded:", 1);
  }
}

uint64_t __55__ICAttributionViewConfiguration_synchronouslyLoadData__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateAttribution");
  objc_msgSend(*(id *)(a1 + 32), "updateTimestamp");
  return objc_msgSend(*(id *)(a1 + 32), "updateUnreadUserIDs");
}

- (BOOL)hasValidRange
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  -[ICAttributionViewConfiguration sharedState](self, "sharedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteTextStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICAttributionViewConfiguration range](self, "range");
  if (objc_msgSend(v5, "ic_rangeIsValid:", v6, v7))
  {
    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "noteTextStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ICAttributionViewConfiguration trimmedRange](self, "trimmedRange");
    v13 = objc_msgSend(v10, "ic_rangeIsValid:", v11, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  ICAttributionViewConfiguration *v4;
  ICAttributionViewConfiguration *v5;
  BOOL v6;

  v4 = (ICAttributionViewConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ICAttributionViewConfiguration isEqualToAttributionViewConfiguration:](self, "isEqualToAttributionViewConfiguration:", v5);

  return v6;
}

- (unint64_t)hash
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  result = self->_hash;
  if (!result)
  {
    -[ICAttributionViewConfiguration textEdit](self, "textEdit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "hash");

    }
    -[ICAttributionViewConfiguration editGroups](self, "editGroups");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hash");

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v10 = ICHashWithObject(*(void **)(*((_QWORD *)&v23 + 1) + 8 * i)) - v10 + 32 * v10;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    self->_hash = ICHashWithHashKeys(v5, v16, v17, v18, v19, v20, v21, v22, v10);
    return self->_hash;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ICAttributionViewConfiguration initWithConfiguration:](+[ICAttributionViewConfiguration allocWithZone:](ICAttributionViewConfiguration, "allocWithZone:", a3), "initWithConfiguration:", self);
}

- (void)commonInitWithSharedState:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  CGSize v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  id v17;

  length = a4.length;
  location = a4.location;
  v17 = a3;
  objc_storeStrong((id *)&self->_sharedState, a3);
  self->_range.location = location;
  self->_range.length = length;
  v8 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_frame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_frame.size = v8;
  self->_dataLoaded = 0;
  *(_WORD *)&self->_focused = 0;
  if (-[ICAttributionViewConfiguration hasValidRange](self, "hasValidRange"))
  {
    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "noteTextStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "ic_rangeByTrimmingCharactersInSet:inRange:", v11, location, length);
    v14 = v13;

    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v15 = location;
    else
      v15 = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v16 = length;
    else
      v16 = v14;
    -[ICAttributionViewConfiguration setTrimmedRange:](self, "setTrimmedRange:", v15, v16);
    -[ICAttributionViewConfiguration updateFrames](self, "updateFrames");
  }

}

- (void)updateAttribution
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  char v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  -[ICAttributionViewConfiguration attributionUserID](self, "attributionUserID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionViewConfiguration sharedState](self, "sharedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortNameForUserID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0DC1140];
  v35[0] = *MEMORY[0x1E0DC1140];
  -[ICAttributionViewConfiguration sharedState](self, "sharedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highlightColorForUserID:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v8;
  v9 = *MEMORY[0x1E0DC1138];
  v35[1] = *MEMORY[0x1E0DC1138];
  -[ICAttributionViewConfiguration sharedState](self, "sharedState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v5, v12);
  -[ICAttributionViewConfiguration userIDs](self, "userIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 >= 2)
  {
    v33[0] = v6;
    if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v9;
    v34[0] = v16;
    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "secondaryFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3940];
    -[ICAttributionViewConfiguration userIDs](self, "userIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringWithFormat:", CFSTR(" + %lu"), objc_msgSend(v21, "count") - 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v22, v19);
    objc_msgSend(v13, "appendAttributedString:", v23);

  }
  -[ICAttributionViewConfiguration attribution](self, "attribution");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((void *)*MEMORY[0x1E0C9B0D0] == v13)
    v26 = 0;
  else
    v26 = v13;
  v27 = v26;
  if (v25 == v24)
    v28 = 0;
  else
    v28 = v24;
  v29 = v28;
  if (v27 | v29)
  {
    v30 = (void *)v29;
    if (v27 && v29)
    {
      v31 = objc_msgSend((id)v27, "isEqual:", v29);

      if ((v31 & 1) != 0)
        goto LABEL_20;
    }
    else
    {

    }
    v32 = (void *)objc_msgSend(v13, "copy");
    -[ICAttributionViewConfiguration setAttribution:](self, "setAttribution:", v32);

    -[ICAttributionViewConfiguration updateAttributionTextStorage](self, "updateAttributionTextStorage");
  }
  else
  {

  }
LABEL_20:

}

- (void)updateStatusImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  UIImage *v8;
  UIImage *statusImage;
  id v10;
  _QWORD v11[7];

  if (!-[ICAttributionViewConfiguration isStatusImageHidden](self, "isStatusImageHidden"))
  {
    -[ICAttributionViewConfiguration statusImageFrame](self, "statusImageFrame");
    v4 = v3;
    v6 = v5;
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v3, v5);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__ICAttributionViewConfiguration_updateStatusImage__block_invoke;
    v11[3] = &unk_1EA7DFD68;
    v11[4] = self;
    *(double *)&v11[5] = v4;
    *(double *)&v11[6] = v6;
    objc_msgSend(v10, "imageWithActions:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithRenderingMode:", 1);
    v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
    statusImage = self->_statusImage;
    self->_statusImage = v8;

  }
}

uint64_t __51__ICAttributionViewConfiguration_updateStatusImage__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawStatusImageInContext:canvasSize:", objc_msgSend(a2, "CGContext"), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)drawStatusImageInContext:(CGContext *)a3 canvasSize:(CGSize)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;

  height = a4.height;
  width = a4.width;
  v28 = *MEMORY[0x1E0C80C00];
  -[ICAttributionViewConfiguration unreadUserIDs](self, "unreadUserIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") <= 2)
    v9 = 4.0;
  else
    v9 = 3.0;
  v10 = objc_msgSend(v8, "count");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = (height + -10.0) * 0.5;
    v15 = (width - ((double)(unint64_t)(v10 - 1) * v9 + 10.0)) * 0.5;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v11);
        v18 = v15 + 10.0;
        if (v15 + 10.0 <= 16.0)
        {
          v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
          -[ICAttributionViewConfiguration sharedState](self, "sharedState", v18, (_QWORD)v23);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "highlightColorForUserID:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_retainAutorelease(v21);
          CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v22, "CGColor"));
          v29.size.width = 10.0;
          v29.size.height = 10.0;
          v29.origin.x = v15;
          v29.origin.y = v14;
          CGContextFillEllipseInRect(a3, v29);
          v15 = v9 + v15;

        }
        ++v17;
      }
      while (v13 != v17);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v18);
    }
    while (v13);
  }

}

- (void)updateTimestamp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  char v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  -[ICAttributionViewConfiguration explicitTimestamp](self, "explicitTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttributionViewConfiguration explicitTimestamp](self, "explicitTimestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[ICAttributionViewConfiguration textEdit](self, "textEdit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICAttributionViewConfiguration textEdit](self, "textEdit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timestamp");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  -[ICAttributionViewConfiguration editGroups](self, "editGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "latestTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttributionViewConfiguration editGroups](self, "editGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") <= 1)
    goto LABEL_8;
  v9 = (void *)MEMORY[0x1E0C99E60];
  -[ICAttributionViewConfiguration editGroups](self, "editGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ic_compactMap:", &__block_literal_global_38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 == 1)
  {
    -[ICAttributionViewConfiguration editGroups](self, "editGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForKeyPath:", CFSTR("@max.latestTimestamp"));
    v15 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v15;
  }
LABEL_9:
  objc_msgSend(v4, "ic_briefFormattedDate");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &stru_1EA7E9860;
  if (v16)
    v18 = (__CFString *)v16;
  v19 = v18;

  v34[0] = *MEMORY[0x1E0DC1140];
  if (objc_msgSend(MEMORY[0x1E0DC3708], "ic_isVision"))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v20;
  v34[1] = *MEMORY[0x1E0DC1138];
  -[ICAttributionViewConfiguration sharedState](self, "sharedState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "secondaryFont");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v19, v23);
  -[ICAttributionViewConfiguration setTimestamp:](self, "setTimestamp:", v4);
  -[ICAttributionViewConfiguration formattedTimestamp](self, "formattedTimestamp");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((void *)*MEMORY[0x1E0C9B0D0] == v24)
    v27 = 0;
  else
    v27 = v24;
  v28 = v27;
  if (v26 == v25)
    v29 = 0;
  else
    v29 = v25;
  v30 = v29;
  if (v28 | v30)
  {
    v31 = (void *)v30;
    if (v28 && v30)
    {
      v32 = objc_msgSend((id)v28, "isEqual:", v30);

      if ((v32 & 1) != 0)
        goto LABEL_28;
    }
    else
    {

    }
    v33 = (void *)objc_msgSend(v24, "copy");
    -[ICAttributionViewConfiguration setFormattedTimestamp:](self, "setFormattedTimestamp:", v33);

    -[ICAttributionViewConfiguration updateFormattedTimestampTextStorage](self, "updateFormattedTimestampTextStorage");
  }
  else
  {

  }
LABEL_28:

}

uint64_t __49__ICAttributionViewConfiguration_updateTimestamp__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB3B18];
  v3 = objc_msgSend(a2, "range");
  return objc_msgSend(v2, "valueWithRange:", v3, v4);
}

- (UIImage)disclosureImage
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[ICAttributionViewConfiguration isFocused](self, "isFocused");
  -[ICAttributionViewConfiguration sharedState](self, "sharedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "expandedDisclosureImage");
  else
    objc_msgSend(v4, "collapsedDisclosureImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v6;
}

- (void)updateFrames
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double y;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  CGFloat v45;
  CGSize size;
  void *v47;
  int v48;
  CGFloat v49;
  CGFloat v50;
  CGSize v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t);
  void *v55;
  ICAttributionViewConfiguration *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;

  if (-[ICAttributionViewConfiguration hasValidRange](self, "hasValidRange"))
  {
    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "primaryFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lineHeight");
    v6 = v5;

    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secondaryFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lineHeight");
    v10 = v9;

    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "expandedDisclosureImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "size");
    v14 = v13 + 4.0;

    if (-[ICAttributionViewConfiguration forcesAttributionHidden](self, "forcesAttributionHidden"))
      v15 = 0.0;
    else
      v15 = v6;
    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "panelWidth");
    v18 = v17 - v14 + -16.0;

    self->_attributionFrame.origin.x = 0.0;
    self->_attributionFrame.origin.y = 0.0;
    self->_attributionFrame.size.width = v18;
    self->_attributionFrame.size.height = v15;
    self->_disclosureImageFrame.origin.x = v18;
    self->_disclosureImageFrame.origin.y = 0.0;
    self->_disclosureImageFrame.size.width = v14;
    self->_disclosureImageFrame.size.height = v15;
    v19 = -[ICAttributionViewConfiguration isAttributionHidden](self, "isAttributionHidden");
    v20 = (v15 - v15) * -0.5;
    if (!v19)
      v20 = 0.0;
    self->_statusImageFrame.origin.x = self->_disclosureImageFrame.origin.x + self->_disclosureImageFrame.size.width;
    self->_statusImageFrame.origin.y = v20;
    self->_statusImageFrame.size.width = 16.0;
    self->_statusImageFrame.size.height = v15;
    if (-[ICAttributionViewConfiguration forcesTimestampHidden](self, "forcesTimestampHidden")
      || -[ICAttributionViewConfiguration isDataLoaded](self, "isDataLoaded")
      && (-[ICAttributionViewConfiguration timestamp](self, "timestamp"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v21,
          !v21))
    {
      v10 = 0.0;
    }
    self->_formattedTimestampFrame.origin.x = 0.0;
    self->_formattedTimestampFrame.origin.y = self->_attributionFrame.size.height;
    self->_formattedTimestampFrame.size.width = v18;
    self->_formattedTimestampFrame.size.height = v10;
    v22 = -[ICAttributionViewConfiguration trimmedRange](self, "trimmedRange");
    -[ICAttributionViewConfiguration rectForRange:](self, "rectForRange:", v22, v23);
    self->_associatedTextFrame.origin.x = v24;
    self->_associatedTextFrame.origin.y = v25;
    self->_associatedTextFrame.size.width = v26;
    self->_associatedTextFrame.size.height = v27;
    -[ICAttributionViewConfiguration frame](self, "frame");
    v29 = v28;
    -[ICAttributionViewConfiguration frame](self, "frame");
    if (v30 == 0.0)
    {
      -[ICAttributionViewConfiguration frame](self, "frame");
      if (v31 == 0.0)
      {
        -[ICAttributionViewConfiguration sharedState](self, "sharedState");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "topTextViewInset");
        v34 = v33;
        y = self->_associatedTextFrame.origin.y;
        -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "adjustedFrame");
        v38 = v37;

        v39 = -[ICAttributionViewConfiguration trimmedRange](self, "trimmedRange");
        v60 = 0;
        v61 = &v60;
        v62 = 0x2020000000;
        v63 = 0;
        v52 = MEMORY[0x1E0C809B0];
        v53 = 3221225472;
        v54 = __46__ICAttributionViewConfiguration_updateFrames__block_invoke;
        v55 = &unk_1EA7DFDD0;
        v58 = v39;
        v59 = 1;
        v56 = self;
        v57 = &v60;
        performBlockOnMainThreadAndWait();
        v29 = v34 + y - v38;
        if (!*((_BYTE *)v61 + 24))
        {
          -[ICAttributionViewConfiguration rectForRange:](self, "rectForRange:", -[ICAttributionViewConfiguration trimmedRange](self, "trimmedRange", v52, 3221225472, __46__ICAttributionViewConfiguration_updateFrames__block_invoke, &unk_1EA7DFDD0, self, &v60, v58, 1), 1);
          v41 = v40;
          -[ICAttributionViewConfiguration attributionFrame](self, "attributionFrame");
          if (v41 > v42)
          {
            -[ICAttributionViewConfiguration attributionFrame](self, "attributionFrame");
            v29 = v29 + (v41 - v43) * 0.5;
          }
        }
        _Block_object_dispose(&v60, 8);
      }
    }
    -[ICAttributionViewConfiguration sharedState](self, "sharedState", v52, v53, v54, v55, v56, v57, v58, v59);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "panelWidth");
    self->_frame.origin.x = 0.0;
    self->_frame.origin.y = v29;
    self->_frame.size.width = v45;
    self->_frame.size.height = v15 + v10 + 4.0;

    size = self->_frame.size;
    self->_adjustedFrame.origin = self->_frame.origin;
    self->_adjustedFrame.size = size;
    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isRTL");

    if (v48)
    {
      self->_statusImageFrame.origin.x = 0.0;
      v49 = self->_statusImageFrame.size.width + 0.0;
      self->_disclosureImageFrame.origin.x = v49;
      v50 = v49 + self->_disclosureImageFrame.size.width;
      self->_attributionFrame.origin.x = v50;
      self->_formattedTimestampFrame.origin.x = v50;
    }
    v51 = self->_formattedTimestampFrame.size;
    self->_adjustedFormattedTimestampFrame.origin = self->_formattedTimestampFrame.origin;
    self->_adjustedFormattedTimestampFrame.size = v51;
  }
}

void __46__ICAttributionViewConfiguration_updateFrames__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "sharedState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "noteTextStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __46__ICAttributionViewConfiguration_updateFrames__block_invoke_2;
  v6[3] = &unk_1EA7DD260;
  v3 = *(_QWORD *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 40);
  v4 = *MEMORY[0x1E0DC10F8];
  v6[1] = 3221225472;
  objc_msgSend(v2, "enumerateAttribute:inRange:options:usingBlock:", v4, v3, *(_QWORD *)(a1 + 56), 0, v6);

}

void __46__ICAttributionViewConfiguration_updateFrames__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

- (void)updateHighlightFrames
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *v5;
  NSMutableArray *highlightConfigurations;
  NSMutableArray *v7;

  if (-[ICAttributionViewConfiguration hasValidRange](self, "hasValidRange"))
  {
    -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      highlightConfigurations = self->_highlightConfigurations;
      self->_highlightConfigurations = v5;

    }
    else
    {
      v7 = v4;
      performBlockOnMainThreadAndWait();
      if ((-[NSMutableArray isEqualToArray:](self->_highlightConfigurations, "isEqualToArray:", v7) & 1) == 0)
        objc_storeStrong((id *)&self->_highlightConfigurations, v5);
      -[ICAttributionViewConfiguration updateHighlightAlpha](self, "updateHighlightAlpha");

    }
  }
}

void __55__ICAttributionViewConfiguration_updateHighlightFrames__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "sharedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteTextStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0DC10F8];
  v5 = objc_msgSend(*(id *)(a1 + 32), "range");
  v7 = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ICAttributionViewConfiguration_updateHighlightFrames__block_invoke_2;
  v9[3] = &unk_1EA7DDF00;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v4, v5, v7, 0, v9);

}

void __55__ICAttributionViewConfiguration_updateHighlightFrames__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
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
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  ICAttributionViewHighlightConfiguration *v28;
  void *v29;
  id v30;

  v7 = a2;
  objc_opt_class();
  ICDynamicCast();
  v30 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v30;
  if (v30)
  {
    v9 = (void *)MEMORY[0x1E0D639F0];
    objc_msgSend(v30, "fileType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "typeUTIIsInlineDrawing:", v10))
    {

    }
    else
    {
      v11 = (void *)MEMORY[0x1E0D639F0];
      objc_msgSend(v30, "fileType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v11, "typeUTIIsSystemPaper:", v12);

      v8 = v30;
      if (!(_DWORD)v11)
        goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 32), "rectForRange:", a3, a4);
    v14 = v13;
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 32), "sharedState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0.0;
    if ((objc_msgSend(v17, "isRTL") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "statusImageFrame");
      v20 = v19;
      objc_msgSend(*(id *)(a1 + 32), "statusImageFrame");
      v18 = v20 + v21;
    }

    objc_msgSend(*(id *)(a1 + 32), "frame");
    v23 = v14 - v22 + 8.0;
    objc_msgSend(*(id *)(a1 + 32), "editGroupForRange:", a3, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "userID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "sharedState");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "highlightColorForUserID:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_alloc_init(ICAttributionViewHighlightConfiguration);
    objc_msgSend(v30, "attachmentIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttributionViewHighlightConfiguration setIdentifier:](v28, "setIdentifier:", v29);

    -[ICAttributionViewHighlightConfiguration setFrame:](v28, "setFrame:", v18, v23, 4.0, v16);
    -[ICAttributionViewHighlightConfiguration setAdjustedFrame:](v28, "setAdjustedFrame:", v18, v23, 4.0, v16);
    -[ICAttributionViewHighlightConfiguration setColor:](v28, "setColor:", v27);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v28);

    v8 = v30;
  }
LABEL_8:

}

- (void)updateHighlightAlpha
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_highlightConfigurations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v9 = -[ICAttributionViewConfiguration isBlurred](self, "isBlurred", (_QWORD)v11);
        v10 = 0.0;
        if (!v9)
          -[ICAttributionViewConfiguration preferredHighlightValue](self, "preferredHighlightValue", 0.0);
        objc_msgSend(v8, "setAlpha:", v10);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)updateChildConfigurations
{
  NSArray *childConfigurations;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  ICAttributionViewConfiguration *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  ICAttributionViewConfiguration *v25;
  void *v26;
  ICAttributionViewConfiguration *v27;
  double v28;
  double v29;
  ICAttributionViewConfiguration *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  char v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  double v88;
  double v89;
  double v90;
  int v91;
  int v92;
  _BOOL4 v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  char v103;
  uint64_t v104;
  void *v105;
  void *v106;
  NSArray *v107;
  NSArray *v108;
  uint64_t v109;
  void *v110;
  id v111;
  id v112;
  id obj;
  id obja;
  uint64_t v115;
  uint64_t v116;
  _QWORD v117[5];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _QWORD v126[5];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  _BYTE v132[128];
  void *v133;
  _BYTE v134[128];
  uint64_t v135;
  CGRect v136;
  CGRect v137;

  v135 = *MEMORY[0x1E0C80C00];
  childConfigurations = self->_childConfigurations;
  self->_childConfigurations = (NSArray *)MEMORY[0x1E0C9AA60];

  -[ICAttributionViewConfiguration parentConfiguration](self, "parentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  -[ICAttributionViewConfiguration editGroups](self, "editGroups");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v134, 16);
  if (!v6)
    goto LABEL_29;
  v7 = v6;
  v8 = *(_QWORD *)v128;
  v109 = *(_QWORD *)v128;
  do
  {
    v9 = 0;
    v111 = (id)v7;
    do
    {
      if (*(_QWORD *)v128 != v8)
        objc_enumerationMutation(obj);
      v115 = v9;
      v10 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v9);
      -[ICAttributionViewConfiguration editGroups](self, "editGroups");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12 >= 2)
      {
        v126[0] = MEMORY[0x1E0C809B0];
        v126[1] = 3221225472;
        v126[2] = __59__ICAttributionViewConfiguration_updateChildConfigurations__block_invoke;
        v126[3] = &unk_1EA7DFDF8;
        v126[4] = v10;
        objc_msgSend(v5, "ic_objectPassingTest:", v126);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v10, "latestTimestamp");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "timestamp");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "ic_isLaterThanDate:", v15);

          v17 = v115;
          if (v16)
          {
            objc_msgSend(v10, "latestTimestamp");
            v18 = (ICAttributionViewConfiguration *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setExplicitTimestamp:", v18);
            goto LABEL_25;
          }
        }
        else
        {
          v30 = [ICAttributionViewConfiguration alloc];
          -[ICAttributionViewConfiguration sharedState](self, "sharedState");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[ICAttributionViewConfiguration initWithSharedState:editGroups:parentConfiguration:](v30, "initWithSharedState:editGroups:parentConfiguration:", v31, v32, self);

          -[ICAttributionViewConfiguration synchronouslyLoadData](v18, "synchronouslyLoadData");
          -[ICAttributionViewConfiguration frame](self, "frame");
          v34 = v33;
          -[ICAttributionViewConfiguration frame](v18, "frame");
          v36 = v35;
          objc_msgSend(v5, "lastObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            -[ICAttributionViewConfiguration frame](v18, "frame");
            v39 = v38;
            v34 = v40;
            v36 = v41;
            objc_msgSend(v37, "frame");
            v43 = v42;
            objc_msgSend(v37, "frame");
            v45 = v43 + v44;
          }
          else
          {
            v45 = 0.0;
            v39 = 0.0;
          }
          -[ICAttributionViewConfiguration setFrame:](v18, "setFrame:", v39, v45, v34, v36);
          -[ICAttributionViewConfiguration setForceVisible:](v18, "setForceVisible:", 1);
          objc_msgSend(v5, "addObject:", v18);

          v17 = v115;
LABEL_25:

        }
        goto LABEL_27;
      }
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      objc_msgSend(v10, "edits");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v123;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v123 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i);
            v25 = [ICAttributionViewConfiguration alloc];
            -[ICAttributionViewConfiguration sharedState](self, "sharedState");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = -[ICAttributionViewConfiguration initWithSharedState:textEdit:parentConfiguration:](v25, "initWithSharedState:textEdit:parentConfiguration:", v26, v24, self);

            -[ICAttributionViewConfiguration setForcesAttributionHidden:](v27, "setForcesAttributionHidden:", objc_msgSend(v5, "count") != 0);
            if (!objc_msgSend(v5, "count"))
            {
              -[ICAttributionViewConfiguration frame](self, "frame");
              v29 = v28;
              -[ICAttributionViewConfiguration frame](v27, "frame");
              -[ICAttributionViewConfiguration setFrame:](v27, "setFrame:", 0.0, 0.0, v29);
              -[ICAttributionViewConfiguration setForceVisible:](v27, "setForceVisible:", 1);
            }
            objc_msgSend(v5, "addObject:", v27);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v122, v132, 16);
        }
        while (v21);
      }

      v8 = v109;
      v7 = (uint64_t)v111;
      v17 = v115;
LABEL_27:
      v9 = v17 + 1;
    }
    while (v9 != v7);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v134, 16);
  }
  while (v7);
LABEL_29:

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v112 = v5;
  v116 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
  if (v116)
  {
    obja = *(id *)v119;
    v110 = v46;
    do
    {
      v47 = 0;
      do
      {
        if (*(id *)v119 != obja)
          objc_enumerationMutation(v112);
        v48 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v47);
        objc_msgSend(v48, "synchronouslyLoadData");
        if ((objc_msgSend(v48, "isAttributionHidden") & 1) == 0)
        {
          v117[0] = MEMORY[0x1E0C809B0];
          v117[1] = 3221225472;
          v117[2] = __59__ICAttributionViewConfiguration_updateChildConfigurations__block_invoke_2;
          v117[3] = &unk_1EA7DFDF8;
          v117[4] = v48;
          objc_msgSend(v46, "ic_objectPassingTest:", v117);
          v49 = objc_claimAutoreleasedReturnValue();
          if (v49)
          {
            v50 = (void *)v49;
            objc_msgSend(v48, "timestamp");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "timestamp");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v51, "ic_isLaterThanDate:", v52);

            if (v53)
            {
              objc_msgSend(v48, "timestamp");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setExplicitTimestamp:", v54);

            }
            goto LABEL_60;
          }
        }
        objc_msgSend(v46, "lastObject");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v55;
        if (!v55)
        {
          v92 = 0;
          v91 = 0;
          v93 = 1;
          goto LABEL_56;
        }
        objc_msgSend(v55, "frame");
        v57 = v56;
        v59 = v58;
        v61 = v60;
        v63 = v62;
        objc_msgSend(v48, "frame");
        v137.origin.x = v64;
        v137.origin.y = v65;
        v137.size.width = v66;
        v137.size.height = v67;
        v136.origin.x = v57;
        v136.origin.y = v59;
        v136.size.width = v61;
        v136.size.height = v63;
        if (CGRectIntersectsRect(v136, v137)
          || (objc_msgSend(v48, "frame"), v69 = v68, objc_msgSend(v50, "frame"), v69 <= v70))
        {
          objc_msgSend(v50, "timestamp");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "timestamp");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v71, "ic_isEarlierThanDate:", v72)
            && !objc_msgSend(v50, "forceVisible"))
          {
            v103 = objc_msgSend(v48, "forceVisible");

            if ((v103 & 1) == 0)
            {
              objc_msgSend(v48, "setForcesAttributionHidden:", objc_msgSend(v50, "isAttributionHidden"));
              objc_msgSend(v50, "frame");
              objc_msgSend(v48, "setFrame:");
              objc_msgSend(v46, "removeObject:", v50);
LABEL_59:
              objc_msgSend(v46, "addObject:", v48);
              goto LABEL_60;
            }
          }
          else
          {

          }
          objc_msgSend(v48, "editGroups");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v73, "count"))
          {

LABEL_52:
            v91 = 1;
            goto LABEL_53;
          }
          v74 = objc_msgSend(v48, "isAttributionHidden");

          if ((v74 & 1) != 0)
            goto LABEL_52;
          objc_msgSend(v48, "frame");
          v76 = v75;
          v78 = v77;
          v80 = v79;
          objc_msgSend(v50, "frame");
          v83 = v81 + v82;
          objc_msgSend(v48, "textEdit");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = objc_msgSend(v84, "range");
          -[ICAttributionViewConfiguration rectForRange:](self, "rectForRange:", v85, v86);
          v88 = v87;
          v90 = v89;

          if ((objc_msgSend(v48, "forceVisible") & 1) == 0 && v80 + v83 > v88 + v90)
            goto LABEL_52;
          objc_msgSend(v48, "setFrame:", v76, v83, v78, v80);
        }
        v91 = 0;
LABEL_53:
        objc_msgSend(v48, "formattedTimestamp");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "string");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "formattedTimestamp");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "string");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v95, "isEqualToString:", v97);

        objc_msgSend(v48, "timestamp");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "timestamp");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "timeIntervalSinceDate:", v99);
        v101 = v100;

        v102 = -v101;
        if (v101 >= 0.0)
          v102 = v101;
        v93 = v102 >= 86400.0;
        v46 = v110;
LABEL_56:
        if ((objc_msgSend(v48, "forceVisible") & 1) != 0 || ((v91 | v92) & 1) == 0 && v93)
          goto LABEL_59;
LABEL_60:

        ++v47;
      }
      while (v116 != v47);
      v104 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v118, v131, 16);
      v116 = v104;
    }
    while (v104);
  }

  if (objc_msgSend(v46, "count") == 1)
  {
    -[ICAttributionViewConfiguration timestamp](self, "timestamp");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "firstObject");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "setExplicitTimestamp:", v105);

  }
  v107 = (NSArray *)objc_msgSend(v46, "copy");
  v108 = self->_childConfigurations;
  self->_childConfigurations = v107;

}

uint64_t __59__ICAttributionViewConfiguration_updateChildConfigurations__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

uint64_t __59__ICAttributionViewConfiguration_updateChildConfigurations__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isAttributionHidden") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "userIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqual:", v6);

  }
  return v4;
}

- (CGRect)rectForRange:(_NSRange)a3
{
  __int128 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  CGRect result;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x4010000000;
  v15 = &unk_1DDA28851;
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *MEMORY[0x1E0C9D648];
  v17 = v3;
  performBlockOnMainThreadAndWait();
  v4 = v13[4];
  v5 = v13[5];
  v6 = v13[6];
  v7 = v13[7];
  _Block_object_dispose(&v12, 8);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

void __47__ICAttributionViewConfiguration_rectForRange___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "sharedState");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ic_rectForRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;

}

- (id)editGroupForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  _QWORD v8[6];

  length = a3.length;
  location = a3.location;
  -[ICAttributionViewConfiguration editGroups](self, "editGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ICAttributionViewConfiguration_editGroupForRange___block_invoke;
  v8[3] = &__block_descriptor_48_e34_B32__0__ICTTTextEditGroup_8Q16_B24l;
  v8[4] = location;
  v8[5] = length;
  objc_msgSend(v5, "ic_objectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __52__ICAttributionViewConfiguration_editGroupForRange___block_invoke(NSRange *a1, void *a2)
{
  NSRange v4;

  v4.location = objc_msgSend(a2, "range");
  return NSIntersectionRange(v4, a1[32]).length != 0;
}

- (NSString)attributionUserID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICAttributionViewConfiguration textEdit](self, "textEdit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttributionViewConfiguration textEdit](self, "textEdit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replicaID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userIDForReplicaID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICAttributionViewConfiguration editGroups](self, "editGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (NSOrderedSet)userIDs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionViewConfiguration textEdit](self, "textEdit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICAttributionViewConfiguration attributionUserID](self, "attributionUserID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ic_addNonNilObject:", v5);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[ICAttributionViewConfiguration editGroups](self, "editGroups", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "userID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "ic_addNonNilObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSOrderedSet *)v11;
}

- (void)updateUnreadUserIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  NSArray *v20;
  NSArray *unreadUserIDs;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttributionViewConfiguration textEdit](self, "textEdit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttributionViewConfiguration sharedState](self, "sharedState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttributionViewConfiguration timestamp](self, "timestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttributionViewConfiguration attributionUserID](self, "attributionUserID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isTimestampUnread:forUserID:", v5, v6);

    if (v7)
    {
      -[ICAttributionViewConfiguration attributionUserID](self, "attributionUserID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "ic_addNonNilObject:", v8);
LABEL_14:

    }
  }
  else
  {
    -[ICAttributionViewConfiguration editGroups](self, "editGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[ICAttributionViewConfiguration editGroups](self, "editGroups");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v8);
            v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            -[ICAttributionViewConfiguration sharedState](self, "sharedState");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "latestTimestamp");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "userID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v15, "isTimestampUnread:forUserID:", v16, v17);

            if (v18)
            {
              objc_msgSend(v14, "userID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "ic_addNonNilObject:", v19);

            }
          }
          v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v11);
      }
      goto LABEL_14;
    }
  }
  objc_msgSend(v22, "array");
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  unreadUserIDs = self->_unreadUserIDs;
  self->_unreadUserIDs = v20;

}

- (ICAttributionViewConfigurationSharedState)sharedState
{
  return self->_sharedState;
}

- (NSArray)editGroups
{
  return self->_editGroups;
}

- (ICTTTextEdit)textEdit
{
  return self->_textEdit;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)trimmedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_trimmedRange.length;
  location = self->_trimmedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (CGRect)attributionFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_attributionFrame.origin.x;
  y = self->_attributionFrame.origin.y;
  width = self->_attributionFrame.size.width;
  height = self->_attributionFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSAttributedString)attribution
{
  return self->_attribution;
}

- (void)setAttribution:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (CGRect)formattedTimestampFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_formattedTimestampFrame.origin.x;
  y = self->_formattedTimestampFrame.origin.y;
  width = self->_formattedTimestampFrame.size.width;
  height = self->_formattedTimestampFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSAttributedString)formattedTimestamp
{
  return self->_formattedTimestamp;
}

- (void)setFormattedTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CGRect)disclosureImageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_disclosureImageFrame.origin.x;
  y = self->_disclosureImageFrame.origin.y;
  width = self->_disclosureImageFrame.size.width;
  height = self->_disclosureImageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)statusImageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_statusImageFrame.origin.x;
  y = self->_statusImageFrame.origin.y;
  width = self->_statusImageFrame.size.width;
  height = self->_statusImageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIImage)statusImage
{
  return self->_statusImage;
}

- (void)setStatusImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSMutableArray)highlightConfigurations
{
  return self->_highlightConfigurations;
}

- (void)setHighlightConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_highlightConfigurations, a3);
}

- (CGRect)associatedTextFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_associatedTextFrame.origin.x;
  y = self->_associatedTextFrame.origin.y;
  width = self->_associatedTextFrame.size.width;
  height = self->_associatedTextFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAssociatedTextFrame:(CGRect)a3
{
  self->_associatedTextFrame = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)adjustedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_adjustedFrame.origin.x;
  y = self->_adjustedFrame.origin.y;
  width = self->_adjustedFrame.size.width;
  height = self->_adjustedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)adjustedFormattedTimestampFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_adjustedFormattedTimestampFrame.origin.x;
  y = self->_adjustedFormattedTimestampFrame.origin.y;
  width = self->_adjustedFormattedTimestampFrame.size.width;
  height = self->_adjustedFormattedTimestampFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAdjustedFormattedTimestampFrame:(CGRect)a3
{
  self->_adjustedFormattedTimestampFrame = a3;
}

- (double)appliedHorizontalAdjustmentRatio
{
  return self->_appliedHorizontalAdjustmentRatio;
}

- (void)setAppliedHorizontalAdjustmentRatio:(double)a3
{
  self->_appliedHorizontalAdjustmentRatio = a3;
}

- (double)preferredHighlightValue
{
  return self->_preferredHighlightValue;
}

- (void)setPreferredHighlightValue:(double)a3
{
  self->_preferredHighlightValue = a3;
}

- (BOOL)forcesAttributionHidden
{
  return self->_forcesAttributionHidden;
}

- (void)setForcesAttributionHidden:(BOOL)a3
{
  self->_forcesAttributionHidden = a3;
}

- (BOOL)forcesTimestampHidden
{
  return self->_forcesTimestampHidden;
}

- (void)setForcesTimestampHidden:(BOOL)a3
{
  self->_forcesTimestampHidden = a3;
}

- (BOOL)isPreview
{
  return self->_preview;
}

- (void)setPreview:(BOOL)a3
{
  self->_preview = a3;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (BOOL)isBlurred
{
  return self->_blurred;
}

- (NSArray)childConfigurations
{
  return self->_childConfigurations;
}

- (ICAttributionViewConfiguration)parentConfiguration
{
  return (ICAttributionViewConfiguration *)objc_loadWeakRetained((id *)&self->_parentConfiguration);
}

- (void)setParentConfiguration:(id)a3
{
  objc_storeWeak((id *)&self->_parentConfiguration, a3);
}

- (id)attributionTextStorage
{
  return self->_attributionTextStorage;
}

- (void)setAttributionTextStorage:(id)a3
{
  objc_storeStrong(&self->_attributionTextStorage, a3);
}

- (NSDate)explicitTimestamp
{
  return self->_explicitTimestamp;
}

- (void)setExplicitTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)formattedTimestampTextStorage
{
  return self->_formattedTimestampTextStorage;
}

- (void)setFormattedTimestampTextStorage:(id)a3
{
  objc_storeStrong(&self->_formattedTimestampTextStorage, a3);
}

- (NSArray)unreadUserIDs
{
  return self->_unreadUserIDs;
}

- (BOOL)forceVisible
{
  return self->_forceVisible;
}

- (void)setForceVisible:(BOOL)a3
{
  self->_forceVisible = a3;
}

- (BOOL)isDataLoaded
{
  return self->_dataLoaded;
}

- (void)setDataLoaded:(BOOL)a3
{
  self->_dataLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unreadUserIDs, 0);
  objc_storeStrong(&self->_formattedTimestampTextStorage, 0);
  objc_storeStrong((id *)&self->_explicitTimestamp, 0);
  objc_storeStrong(&self->_attributionTextStorage, 0);
  objc_destroyWeak((id *)&self->_parentConfiguration);
  objc_storeStrong((id *)&self->_childConfigurations, 0);
  objc_storeStrong((id *)&self->_highlightConfigurations, 0);
  objc_storeStrong((id *)&self->_statusImage, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_formattedTimestamp, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_textEdit, 0);
  objc_storeStrong((id *)&self->_editGroups, 0);
  objc_storeStrong((id *)&self->_sharedState, 0);
}

- (void)updateAttributionTextStorage
{
  ICAttributionViewConfiguration *v2;

  v2 = self;
  sub_1DD95B2EC((SEL *)&selRef_attribution, (SEL *)&selRef_setAttributionTextStorage_);

}

- (void)updateFormattedTimestampTextStorage
{
  ICAttributionViewConfiguration *v2;

  v2 = self;
  sub_1DD95B2EC((SEL *)&selRef_formattedTimestamp, (SEL *)&selRef_setFormattedTimestampTextStorage_);

}

@end
