@implementation ATXStackRotationSession

- (ATXStackRotationSession)initWithStartingStackChangeEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  ATXStackRotationSession *v12;
  NSObject *v13;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "widgetUniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blendingCacheId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reason");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5 && v7 && v6 && v8 && v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", &unk_1E83CC1D8, 0);
    BYTE2(v15) = 0;
    LOWORD(v15) = 0;
    self = -[ATXStackRotationSession initWithStartingStackChangeEvent:endingStackChangeEvent:engagementStatus:engagementStatusHistory:systemSuggestSuggestionLayout:dwellStartDate:longestDwell:isNPlusOneRotation:isFirstNPlusOneRotation:completed:](self, "initWithStartingStackChangeEvent:endingStackChangeEvent:engagementStatus:engagementStatusHistory:systemSuggestSuggestionLayout:dwellStartDate:longestDwell:isNPlusOneRotation:isFirstNPlusOneRotation:completed:", v4, 0, 0, v11, 0, 0, 0.0, v15);

    v12 = self;
  }
  else
  {
    __atxlog_handle_metrics();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ATXStackRotationSession initWithStartingStackChangeEvent:].cold.1((uint64_t)self, (uint64_t)v4, v13);

    v12 = 0;
  }

  return v12;
}

- (ATXStackRotationSession)initWithStartingStackChangeEvent:(id)a3 endingStackChangeEvent:(id)a4 engagementStatus:(unint64_t)a5 engagementStatusHistory:(id)a6 systemSuggestSuggestionLayout:(id)a7 dwellStartDate:(id)a8 longestDwell:(double)a9 isNPlusOneRotation:(BOOL)a10 isFirstNPlusOneRotation:(BOOL)a11 completed:(BOOL)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  ATXStackRotationSession *v23;
  ATXStackRotationSession *v24;
  id v27;
  objc_super v28;

  v19 = a3;
  v20 = a4;
  v21 = a6;
  v27 = a7;
  v22 = a8;
  v28.receiver = self;
  v28.super_class = (Class)ATXStackRotationSession;
  v23 = -[ATXStackRotationSession init](&v28, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_startingStackChangeEvent, a3);
    objc_storeStrong((id *)&v24->_endingStackChangeEvent, a4);
    v24->_engagementStatus = a5;
    objc_storeStrong((id *)&v24->_engagementStatusHistory, a6);
    objc_storeStrong((id *)&v24->_systemSuggestSuggestionLayout, a7);
    objc_storeStrong((id *)&v24->_dwellStartDate, a8);
    v24->_longestDwell = a9;
    v24->_isNPlusOneRotation = a10;
    v24->_isFirstNPlusOneRotation = a11;
    v24->_completed = a12;
  }

  return v24;
}

- (void)updateIsNPlusOneRotation:(BOOL)a3 isFirstNPlusOneRotation:(BOOL)a4
{
  self->_isNPlusOneRotation = a3;
  self->_isFirstNPlusOneRotation = a4;
}

- (void)updateWithSystemSuggestSuggestionLayout:(id)a3
{
  objc_storeStrong((id *)&self->_systemSuggestSuggestionLayout, a3);
}

- (void)markStackShownAtDate:(id)a3
{
  objc_storeStrong((id *)&self->_dwellStartDate, a3);
  -[ATXStackRotationSession tryUpdateStackRotationEngagementStatus:](self, "tryUpdateStackRotationEngagementStatus:", 1);
}

- (void)markStackHiddenAtDate:(id)a3
{
  id v4;
  NSDate *dwellStartDate;
  double v6;
  double v7;
  id v8;

  v4 = a3;
  dwellStartDate = self->_dwellStartDate;
  v8 = v4;
  if (v4 && dwellStartDate)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    v7 = v6;
    if (v6 >= *(double *)&kATXMinTimeIntervalToBeConsideredDwell)
      -[ATXStackRotationSession tryUpdateStackRotationEngagementStatus:](self, "tryUpdateStackRotationEngagementStatus:", 3);
    if (v7 > self->_longestDwell)
      self->_longestDwell = v7;
    dwellStartDate = self->_dwellStartDate;
  }
  self->_dwellStartDate = 0;

}

- (void)markStackTapped
{
  -[ATXStackRotationSession tryUpdateStackRotationEngagementStatus:](self, "tryUpdateStackRotationEngagementStatus:", 4);
}

- (void)markAddedToStack
{
  -[ATXStackRotationSession tryUpdateStackRotationEngagementStatus:](self, "tryUpdateStackRotationEngagementStatus:", 7);
}

- (void)markRejectedRotationDismissOnce
{
  -[ATXStackRotationSession tryUpdateStackRotationEngagementStatus:](self, "tryUpdateStackRotationEngagementStatus:", 5);
}

- (void)markRejectedRotationNeverShowAgain
{
  -[ATXStackRotationSession tryUpdateStackRotationEngagementStatus:](self, "tryUpdateStackRotationEngagementStatus:", 6);
}

- (void)finalizeWithEndingStackChangeEvent:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_endingStackChangeEvent, a3);
  objc_msgSend(v9, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXStackRotationSession markStackHiddenAtDate:](self, "markStackHiddenAtDate:", v5);

  objc_msgSend(v9, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringForATXHomeScreenStackChangeReason();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
    -[ATXStackRotationSession tryUpdateStackRotationEngagementStatus:](self, "tryUpdateStackRotationEngagementStatus:", 2);
  self->_completed = 1;

}

- (void)tryUpdateStackRotationEngagementStatus:(unint64_t)a3
{
  NSMutableArray *engagementStatusHistory;
  void *v6;

  engagementStatusHistory = self->_engagementStatusHistory;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](engagementStatusHistory, "addObject:", v6);

  if (self->_engagementStatus < a3)
    self->_engagementStatus = a3;
}

- (NSString)widgetUniqueId
{
  void *v2;
  void *v3;
  __CFString *v4;
  NSObject *v5;

  -[ATXHomeScreenEvent widgetUniqueId](self->_startingStackChangeEvent, "widgetUniqueId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXStackRotationSession widgetUniqueId].cold.1();

    v4 = &stru_1E82FDC98;
  }

  return (NSString *)v4;
}

- (NSString)widgetBundleId
{
  void *v2;
  void *v3;
  __CFString *v4;
  NSObject *v5;

  -[ATXHomeScreenEvent widgetBundleId](self->_startingStackChangeEvent, "widgetBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXStackRotationSession widgetBundleId].cold.1();

    v4 = &stru_1E82FDC98;
  }

  return (NSString *)v4;
}

- (NSString)widgetKind
{
  void *v2;
  void *v3;
  __CFString *v4;
  NSObject *v5;

  -[ATXHomeScreenEvent widgetKind](self->_startingStackChangeEvent, "widgetKind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXStackRotationSession widgetKind].cold.1();

    v4 = &stru_1E82FDC98;
  }

  return (NSString *)v4;
}

- (int)stackLocation
{
  -[ATXHomeScreenEvent stackLocation](self->_startingStackChangeEvent, "stackLocation");
  return ATXPBStackLocationForLocation();
}

- (NSString)blendingCacheId
{
  void *v2;
  void *v3;
  __CFString *v4;
  NSObject *v5;

  -[ATXHomeScreenEvent blendingCacheId](self->_startingStackChangeEvent, "blendingCacheId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    __atxlog_handle_metrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXStackRotationSession blendingCacheId].cold.1();

    v4 = &stru_1E82FDC98;
  }

  return (NSString *)v4;
}

- (NSDate)sessionStartDate
{
  return (NSDate *)-[ATXHomeScreenEvent date](self->_startingStackChangeEvent, "date");
}

- (NSDate)sessionEndDate
{
  return (NSDate *)-[ATXHomeScreenEvent date](self->_endingStackChangeEvent, "date");
}

- (NSString)rotationReason
{
  return (NSString *)-[ATXHomeScreenEvent reason](self->_startingStackChangeEvent, "reason");
}

- (BOOL)isEqual:(id)a3
{
  ATXStackRotationSession *v4;
  ATXStackRotationSession *v5;
  BOOL v6;

  v4 = (ATXStackRotationSession *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXStackRotationSession isEqualToATXStackRotationSession:](self, "isEqualToATXStackRotationSession:", v5);

  return v6;
}

- (BOOL)isEqualToATXStackRotationSession:(id)a3
{
  id *v4;
  ATXHomeScreenEvent *startingStackChangeEvent;
  ATXHomeScreenEvent *v6;
  ATXHomeScreenEvent *v7;
  ATXHomeScreenEvent *v8;
  char v9;
  ATXHomeScreenEvent *endingStackChangeEvent;
  ATXHomeScreenEvent *v11;
  ATXHomeScreenEvent *v12;
  ATXHomeScreenEvent *v13;
  char v14;
  NSMutableArray *engagementStatusHistory;
  NSMutableArray *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  char v19;
  ATXSuggestionLayout *systemSuggestSuggestionLayout;
  ATXSuggestionLayout *v21;
  ATXSuggestionLayout *v22;
  ATXSuggestionLayout *v23;
  char v24;
  NSDate *dwellStartDate;
  NSDate *v26;
  NSDate *v27;
  NSDate *v28;
  char v29;
  BOOL v30;

  v4 = (id *)a3;
  startingStackChangeEvent = self->_startingStackChangeEvent;
  v6 = (ATXHomeScreenEvent *)v4[2];
  if (startingStackChangeEvent == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = startingStackChangeEvent;
    v9 = -[ATXHomeScreenEvent isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_26;
  }
  endingStackChangeEvent = self->_endingStackChangeEvent;
  v11 = (ATXHomeScreenEvent *)v4[3];
  if (endingStackChangeEvent == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = endingStackChangeEvent;
    v14 = -[ATXHomeScreenEvent isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_26;
  }
  if ((id)self->_engagementStatus != v4[4])
  {
LABEL_26:
    v30 = 0;
    goto LABEL_27;
  }
  engagementStatusHistory = self->_engagementStatusHistory;
  v16 = (NSMutableArray *)v4[5];
  if (engagementStatusHistory == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = engagementStatusHistory;
    v19 = -[NSMutableArray isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_26;
  }
  systemSuggestSuggestionLayout = self->_systemSuggestSuggestionLayout;
  v21 = (ATXSuggestionLayout *)v4[6];
  if (systemSuggestSuggestionLayout == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = systemSuggestSuggestionLayout;
    v24 = -[ATXSuggestionLayout isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_26;
  }
  dwellStartDate = self->_dwellStartDate;
  v26 = (NSDate *)v4[7];
  if (dwellStartDate == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = dwellStartDate;
    v29 = -[NSDate isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_26;
  }
  if (self->_longestDwell != *((double *)v4 + 8)
    || self->_isNPlusOneRotation != *((unsigned __int8 *)v4 + 8)
    || self->_isFirstNPlusOneRotation != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_26;
  }
  v30 = self->_completed == *((unsigned __int8 *)v4 + 10);
LABEL_27:

  return v30;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXStackRotationSession rotationReason](self, "rotationReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXStackRotationSession widgetUniqueId](self, "widgetUniqueId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXStackRotationSession widgetBundleId](self, "widgetBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXStackRotationSession blendingCacheId](self, "blendingCacheId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXStackRotationSession sessionStartDate](self, "sessionStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXStackRotationSession sessionEndDate](self, "sessionEndDate");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = CFSTR("YES");
  if (self->_completed)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (self->_isNPlusOneRotation)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (!self->_isFirstNPlusOneRotation)
    v13 = CFSTR("NO");
  v16 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ - rotationReason: %@, widgetId: %@, widgetBundleId: %@, blendingId: %@, startDate: %@, endDate: %@, dwellStart: %@, dwellSession: %f, engagementStatus: %lu, completed: %@, isNPlusOne: %@, isFirstNPlusOne: %@"), v5, v6, v7, v8, v9, v10, v11, self->_dwellStartDate, *(_QWORD *)&self->_longestDwell, self->_engagementStatus, v14, v15, v13);

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ATXHomeScreenEvent *startingStackChangeEvent;
  id v5;

  startingStackChangeEvent = self->_startingStackChangeEvent;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startingStackChangeEvent, CFSTR("codingKeyForStartingStackChangeEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endingStackChangeEvent, CFSTR("codingKeyForEndingStackChangeEvent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_engagementStatus, CFSTR("codingKeyForEngagementStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_engagementStatusHistory, CFSTR("codingKeyForEngagementStatusHistory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_systemSuggestSuggestionLayout, CFSTR("codingKeyForSystemSuggestSuggestionLayout"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dwellStartDate, CFSTR("codingKeyForDwellStartDate"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("codingKeyForLongestDwell"), self->_longestDwell);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isNPlusOneRotation, CFSTR("codingKeyForNPlusOneRotation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFirstNPlusOneRotation, CFSTR("codingKeyForFirstNPlusOneRotation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_completed, CFSTR("codingKeyForCompleted"));

}

- (ATXStackRotationSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXStackRotationSession *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  char v45;
  char v46;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_metrics();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForStartingStackChangeEvent"), v4, 1, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "error"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_metrics();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForEndingStackChangeEvent"), v4, 0, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15
      || (v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codingKeyForEngagementStatus")),
          objc_msgSend(v4, "error"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          v17))
    {
      v10 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0D81610];
      v20 = (void *)MEMORY[0x1CAA48B6C]();
      v21 = objc_alloc(MEMORY[0x1E0C99E60]);
      v22 = objc_opt_class();
      v23 = (void *)objc_msgSend(v21, "initWithObjects:", v22, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v20);
      __atxlog_handle_metrics();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v23, CFSTR("codingKeyForEngagementStatusHistory"), v4, 1, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25
        && (objc_msgSend(v4, "error"), v26 = (void *)objc_claimAutoreleasedReturnValue(), v26, !v26))
      {
        v27 = (void *)MEMORY[0x1E0D81610];
        v28 = objc_opt_class();
        __atxlog_handle_metrics();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v28, CFSTR("codingKeyForSystemSuggestSuggestionLayout"), v4, 0, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "error");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v10 = 0;
        }
        else
        {
          v32 = (void *)MEMORY[0x1E0D81610];
          v33 = objc_opt_class();
          __atxlog_handle_metrics();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v33, CFSTR("codingKeyForDwellStartDate"), v4, 0, CFSTR("com.apple.proactive.StackRotationStatus"), -1, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "error");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
            goto LABEL_19;
          objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("codingKeyForLongestDwell"));
          v38 = v37;
          objc_msgSend(v4, "error");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
            goto LABEL_19;
          v40 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("codingKeyForNPlusOneRotation"));
          objc_msgSend(v4, "error");
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
            goto LABEL_19;
          v46 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("codingKeyForFirstNPlusOneRotation"));
          objc_msgSend(v4, "error");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42
            || (v45 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("codingKeyForCompleted")),
                objc_msgSend(v4, "error"),
                v43 = (void *)objc_claimAutoreleasedReturnValue(),
                v43,
                v43))
          {
LABEL_19:
            v10 = 0;
          }
          else
          {
            BYTE2(v44) = v45;
            BYTE1(v44) = v46;
            LOBYTE(v44) = v40;
            self = -[ATXStackRotationSession initWithStartingStackChangeEvent:endingStackChangeEvent:engagementStatus:engagementStatusHistory:systemSuggestSuggestionLayout:dwellStartDate:longestDwell:isNPlusOneRotation:isFirstNPlusOneRotation:completed:](self, "initWithStartingStackChangeEvent:endingStackChangeEvent:engagementStatus:engagementStatusHistory:systemSuggestSuggestionLayout:dwellStartDate:longestDwell:isNPlusOneRotation:isFirstNPlusOneRotation:completed:", v8, v14, v16, v25, v30, v35, v38, v44);
            v10 = self;
          }

        }
      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ATXHomeScreenEvent)startingStackChangeEvent
{
  return self->_startingStackChangeEvent;
}

- (ATXHomeScreenEvent)endingStackChangeEvent
{
  return self->_endingStackChangeEvent;
}

- (unint64_t)engagementStatus
{
  return self->_engagementStatus;
}

- (void)setEngagementStatus:(unint64_t)a3
{
  self->_engagementStatus = a3;
}

- (NSMutableArray)engagementStatusHistory
{
  return self->_engagementStatusHistory;
}

- (ATXSuggestionLayout)systemSuggestSuggestionLayout
{
  return self->_systemSuggestSuggestionLayout;
}

- (NSDate)dwellStartDate
{
  return self->_dwellStartDate;
}

- (void)setDwellStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_dwellStartDate, a3);
}

- (double)longestDwell
{
  return self->_longestDwell;
}

- (void)setLongestDwell:(double)a3
{
  self->_longestDwell = a3;
}

- (BOOL)isNPlusOneRotation
{
  return self->_isNPlusOneRotation;
}

- (void)setIsNPlusOneRotation:(BOOL)a3
{
  self->_isNPlusOneRotation = a3;
}

- (BOOL)isFirstNPlusOneRotation
{
  return self->_isFirstNPlusOneRotation;
}

- (void)setIsFirstNPlusOneRotation:(BOOL)a3
{
  self->_isFirstNPlusOneRotation = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dwellStartDate, 0);
  objc_storeStrong((id *)&self->_systemSuggestSuggestionLayout, 0);
  objc_storeStrong((id *)&self->_engagementStatusHistory, 0);
  objc_storeStrong((id *)&self->_endingStackChangeEvent, 0);
  objc_storeStrong((id *)&self->_startingStackChangeEvent, 0);
}

- (void)initWithStartingStackChangeEvent:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v5 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_ERROR, "%@ - could not create new session from homescreen event: %@", v7, 0x16u);

}

- (void)widgetUniqueId
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "%@ - could not find widgetUniqueId", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)widgetBundleId
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "%@ - could not find widgetBundleId", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)widgetKind
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "%@ - could not find widgetKind", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)blendingCacheId
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "%@ - could not find blendingCacheId", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
