@implementation NSUserActivity

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    return 0;
  if (self == a3)
    return 1;
  return -[NSUUID isEqual:](-[NSUserActivity _uniqueIdentifier](self, "_uniqueIdentifier"), "isEqual:", objc_msgSend(a3, "_uniqueIdentifier"));
}

- (NSUUID)_uniqueIdentifier
{
  return (NSUUID *)-[UAUserActivity uniqueIdentifier](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "uniqueIdentifier");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_delegate, 0);
  objc_storeWeak(&self->_frameworkDelegate, 0);
  objc_msgSend(self->_internal, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)NSUserActivity;
  -[NSUserActivity dealloc](&v3, sel_dealloc);
}

- (void)resignCurrent
{
  -[UAUserActivity resignCurrent](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "resignCurrent");
}

- (NSDictionary)_options
{
  return (NSDictionary *)-[UAUserActivity options](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "options");
}

- (void)invalidate
{
  -[UAUserActivity invalidate](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "invalidate");
}

- (void)setContentUserAction:(id)a3
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    -[UAUserActivity setContentUserAction:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setContentUserAction:", a3);
}

- (void)setEligibleForPublicIndexing:(BOOL)eligibleForPublicIndexing
{
  _BOOL8 v3;

  v3 = eligibleForPublicIndexing;
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    -[UAUserActivity setEligibleForPublicIndexing:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setEligibleForPublicIndexing:", v3);
}

- (void)setKeywords:(NSSet *)keywords
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    -[UAUserActivity setKeywords:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setKeywords:", keywords);
}

- (BOOL)isEligibleForHandoff
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    return -[UAUserActivity isEligibleForHandoff](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "isEligibleForHandoff");
  else
    return 1;
}

+ (void)deleteAllSavedUserActivitiesWithCompletionHandler:(void *)handler
{
  if (getUAUserActivityClass() && (getUAUserActivityClass(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_msgSend(getUAUserActivityClass(), "deleteAllSavedUserActivitiesWithCompletionHandler:", handler);
  }
  else if (handler)
  {
    (*((void (**)(void *))handler + 2))(handler);
  }
}

- (void)setRequiredUserInfoKeys:(NSSet *)requiredUserInfoKeys
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    -[UAUserActivity setRequiredUserInfoKeys:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setRequiredUserInfoKeys:", requiredUserInfoKeys);
}

- (void)setWebpageURL:(NSURL *)webpageURL
{
  -[UAUserActivity setWebpageURL:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setWebpageURL:", webpageURL);
}

- (void)setEligibleForPrediction:(BOOL)eligibleForPrediction
{
  -[UAUserActivity setEligibleForPrediction:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setEligibleForPrediction:", eligibleForPrediction);
}

- (BOOL)_createUserActivityStringsWithOptions:(id)a3 completionHandler:(id)a4
{
  -[NSUserActivity _internalUserActivity](self, "_internalUserActivity", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UAUserActivity createUserActivityStringsWithSaving:options:completionHandler:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "createUserActivityStringsWithSaving:options:completionHandler:", 1, 0, a4);
  else
    return 0;
}

- (BOOL)isEligibleForPublicIndexing
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    return -[UAUserActivity isEligibleForPublicIndexing](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "isEligibleForPublicIndexing");
  else
    return 0;
}

- (NSSet)keywords
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    return (NSSet *)-[UAUserActivity keywords](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "keywords");
  else
    return 0;
}

- (int64_t)_suggestedActionType
{
  return -[UAUserActivity suggestedActionType](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "suggestedActionType");
}

- (void)becomeCurrent
{
  -[UAUserActivity becomeCurrent](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "becomeCurrent");
}

- (void)setPersistentIdentifier:(NSUserActivityPersistentIdentifier)persistentIdentifier
{
  -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UAUserActivity setPersistentIdentifier:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setPersistentIdentifier:", persistentIdentifier);
}

- (void)setEligibleForHandoff:(BOOL)eligibleForHandoff
{
  _BOOL8 v3;

  v3 = eligibleForHandoff;
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    -[UAUserActivity setEligibleForHandoff:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setEligibleForHandoff:", v3);
}

- (void)setDelegate:(id)delegate
{
  NSUserActivity *v4;
  UAUserActivity *v5;

  v4 = self;
  objc_storeWeak(&self->_delegate, delegate);
  if ((-[UAUserActivity isInvalidated](-[NSUserActivity _internalUserActivity](v4, "_internalUserActivity"), "isInvalidated") & 1) == 0)
  {
    v5 = -[NSUserActivity _internalUserActivity](v4, "_internalUserActivity");
    if (!delegate && !-[NSUserActivity _frameworkDelegate](v4, "_frameworkDelegate"))
      v4 = 0;
    -[UAUserActivity setDelegate:](v5, "setDelegate:", v4);
  }
}

- (void)_setFrameworkDelegate:(id)a3
{
  UAUserActivity *v5;
  NSUserActivity *v6;

  objc_storeWeak(&self->_frameworkDelegate, a3);
  if ((-[UAUserActivity isInvalidated](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "isInvalidated") & 1) == 0)
  {
    v5 = -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
    if ((unint64_t)a3 | (unint64_t)-[NSUserActivity delegate](self, "delegate"))
      v6 = self;
    else
      v6 = 0;
    -[UAUserActivity setDelegate:](v5, "setDelegate:", v6);
  }
}

- (void)willSynchronizeActivity
{
  NSUserActivityDelegate *v3;
  id v4;

  v3 = -[NSUserActivity _frameworkDelegate](self, "_frameworkDelegate");
  v4 = -[NSUserActivity delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSUserActivityDelegate userActivityWillSave:](v3, "userActivityWillSave:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "userActivityWillSave:", self);
}

- (NSUserActivityDelegate)_frameworkDelegate
{
  return (NSUserActivityDelegate *)objc_loadWeak(&self->_frameworkDelegate);
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)setEligibleForSearch:(BOOL)eligibleForSearch
{
  _BOOL8 v3;

  v3 = eligibleForSearch;
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    -[UAUserActivity setEligibleForSearch:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setEligibleForSearch:", v3);
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  -[UAUserActivity setUserInfo:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setUserInfo:", userInfo);
}

- (void)setTitle:(NSString *)title
{
  -[UAUserActivity setTitle:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setTitle:", title);
}

- (BOOL)isEligibleForSearch
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    return -[UAUserActivity isEligibleForSearch](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "isEligibleForSearch");
  else
    return 0;
}

- (NSString)title
{
  return (NSString *)-[UAUserActivity title](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "title");
}

- (BOOL)isEligibleForPrediction
{
  return -[UAUserActivity isEligibleForPrediction](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "isEligibleForPrediction");
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)-[UAUserActivity userInfo](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "userInfo");
}

- (NSURL)webpageURL
{
  return (NSURL *)-[UAUserActivity webpageURL](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "webpageURL");
}

+ (void)_fetchUserActivityWithUUID:(id)a3 completionHandler:(id)a4
{
  void *UAUserActivityClass;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x1E0C80C00];
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(getUAUserActivityClass(), "showUserActivityUIProgressForUUID:", a3);
  UAUserActivityClass = getUAUserActivityClass();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_completionHandler___block_invoke;
  v7[3] = &unk_1E0F51CF0;
  v7[4] = a3;
  v7[5] = a4;
  objc_msgSend(UAUserActivityClass, "fetchUserActivityWithUUID:completionHandler:", a3, v7);
}

- (id)_initWithTypeIdentifier:(id)a3 suggestedActionType:(int64_t)a4 options:(id)a5
{
  return -[NSUserActivity initWithInternalUserActivity:](self, "initWithInternalUserActivity:", (id)objc_msgSend(objc_alloc((Class)getUAUserActivityClass()), "initWithTypeIdentifier:suggestedActionType:options:", a3, a4, a5));
}

void __86__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSUserActivity *v4;
  NSError *v5;
  uint64_t v6;
  NSError *v7;

  if (a2)
  {
    v4 = -[NSUserActivity initWithInternalUserActivity:]([NSUserActivity alloc], "initWithInternalUserActivity:", a2);
    v7 = 0;
  }
  else
  {
    if (a3)
      v5 = +[NSUserActivity _userFacingErrorForLaunchServicesError:userInfo:](NSUserActivity, "_userFacingErrorForLaunchServicesError:userInfo:", a3, 0);
    else
      v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3328, 0);
    v7 = v5;
    v4 = 0;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, NSUserActivity *, NSError *))(v6 + 16))(v6, v4, v7);
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(getUAUserActivityClass(), "endUserActivityUIProgressForUUID:", *(_QWORD *)(a1 + 32));

}

- (NSUserActivity)initWithInternalUserActivity:(id)a3
{
  NSUserActivity *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSUserActivity;
  v4 = -[NSUserActivity init](&v6, sel_init);
  if (v4)
  {
    v4->_internal = a3;
    -[UAUserActivity setDelegate:](-[NSUserActivity _internalUserActivity](v4, "_internalUserActivity"), "setDelegate:", v4);
    -[UAUserActivity setParentUserActivity:](-[NSUserActivity _internalUserActivity](v4, "_internalUserActivity"), "setParentUserActivity:", v4);
  }
  return v4;
}

- (NSUserActivity)initWithActivityType:(NSString *)activityType
{
  NSUserActivity *v4;
  uint64_t v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)NSUserActivity;
  v4 = -[NSUserActivity init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)getUAUserActivityClass()), "initWithTypeIdentifier:options:", activityType, 0);
    v4->_internal = (id)v5;
    if (v5)
    {
      -[UAUserActivity setParentUserActivity:](-[NSUserActivity _internalUserActivity](v4, "_internalUserActivity"), "setParentUserActivity:", v4);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

+ (id)_currentUserActivityUUID
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140 && (getUAUserActivityClass(), (objc_opt_respondsToSelector() & 1) != 0))
    return (id)objc_msgSend(getUAUserActivityClass(), "currentUserActivityUUID");
  else
    return 0;
}

- (void)setNeedsSave:(BOOL)needsSave
{
  -[UAUserActivity setNeedsSave:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setNeedsSave:", needsSave);
}

- (void)addUserInfoEntriesFromDictionary:(NSDictionary *)otherDictionary
{
  -[UAUserActivity addUserInfoEntriesFromDictionary:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "addUserInfoEntriesFromDictionary:", otherDictionary);
}

- (NSString)activityType
{
  return (NSString *)-[UAUserActivity typeIdentifier](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "typeIdentifier");
}

- (NSUserActivityPersistentIdentifier)persistentIdentifier
{
  -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (NSUserActivityPersistentIdentifier)-[UAUserActivity persistentIdentifier](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "persistentIdentifier");
  else
    return 0;
}

- (UAUserActivity)_internalUserActivity
{
  return (UAUserActivity *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_frameworkDelegate);
  objc_destroyWeak(&self->_delegate);
}

- (NSUserActivity)init
{
  return -[NSUserActivity initWithActivityType:](self, "initWithActivityType:", 0);
}

- (BOOL)needsSave
{
  return -[UAUserActivity needsSave](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "needsSave");
}

- (NSURL)referrerURL
{
  return (NSURL *)-[UAUserActivity referrerURL](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "referrerURL");
}

- (void)setReferrerURL:(NSURL *)referrerURL
{
  -[UAUserActivity setReferrerURL:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setReferrerURL:", referrerURL);
}

- (id)contentType
{
  return 0;
}

- (id)contentAttributes
{
  return 0;
}

- (id)contentUserAction
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    return (id)-[UAUserActivity contentUserAction](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "contentUserAction");
  else
    return 0;
}

- (BOOL)supportsContinuationStreams
{
  return -[UAUserActivity supportsContinuationStreams](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "supportsContinuationStreams");
}

- (void)setSupportsContinuationStreams:(BOOL)supportsContinuationStreams
{
  -[UAUserActivity setSupportsContinuationStreams:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setSupportsContinuationStreams:", supportsContinuationStreams);
}

- (void)getContinuationStreamsWithCompletionHandler:(void *)completionHandler
{
  UAUserActivity *v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  if (completionHandler)
  {
    v4 = -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __62__NSUserActivity_getContinuationStreamsWithCompletionHandler___block_invoke;
    v5[3] = &unk_1E0F51C88;
    v5[4] = completionHandler;
    -[UAUserActivity getContinuationStreamsWithCompletionHandler:](v4, "getContinuationStreamsWithCompletionHandler:", v5);
  }
}

uint64_t __62__NSUserActivity_getContinuationStreamsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  +[NSUserActivity _userFacingErrorForLaunchServicesError:userInfo:](NSUserActivity, "_userFacingErrorForLaunchServicesError:userInfo:", a4, 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSSet)requiredUserInfoKeys
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    return (NSSet *)-[UAUserActivity requiredUserInfoKeys](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "requiredUserInfoKeys");
  else
    return 0;
}

- (NSDate)expirationDate
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    return (NSDate *)-[UAUserActivity expirationDate](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "expirationDate");
  else
    return 0;
}

- (void)setExpirationDate:(NSDate *)expirationDate
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    -[UAUserActivity setExpirationDate:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setExpirationDate:", expirationDate);
}

+ (void)deleteSavedUserActivitiesWithPersistentIdentifiers:(NSArray *)persistentIdentifiers completionHandler:(void *)handler
{
  if (getUAUserActivityClass() && (getUAUserActivityClass(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_msgSend(getUAUserActivityClass(), "deleteSavedUserActivitiesWithPersistentIdentifiers:completionHandler:", persistentIdentifiers, handler);
  }
  else if (handler)
  {
    (*((void (**)(void *))handler + 2))(handler);
  }
}

- (unint64_t)hash
{
  return -[NSUUID hash](-[NSUserActivity _uniqueIdentifier](self, "_uniqueIdentifier"), "hash");
}

- (NSString)targetContentIdentifier
{
  if (-[NSUserActivity _internalUserActivity](self, "_internalUserActivity")
    && (-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), (objc_opt_respondsToSelector() & 1) != 0))
  {
    return (NSString *)-[UAUserActivity targetContentIdentifier](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "targetContentIdentifier");
  }
  else
  {
    return 0;
  }
}

- (void)setTargetContentIdentifier:(NSString *)targetContentIdentifier
{
  if (-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"))
  {
    -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[UAUserActivity setTargetContentIdentifier:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setTargetContentIdentifier:", targetContentIdentifier);
  }
}

- (id)typeIdentifier
{
  if (typeIdentifier_sOnce != -1)
    dispatch_once(&typeIdentifier_sOnce, &__block_literal_global_65);
  return -[NSUserActivity activityType](self, "activityType");
}

void __32__NSUserActivity_typeIdentifier__block_invoke()
{
  NSLog((NSString *)CFSTR("NSUserActivity %s DEPRECATED: Please use the activityType property, not the typeIdentifier property. If you see this error, please write a bug against the this application and relate it to <rdar://problem/16494343>"), "-[NSUserActivity typeIdentifier]_block_invoke");
}

- (NSUserActivity)initWithTypeIdentifier:(id)a3
{
  if (initWithTypeIdentifier__sOnce != -1)
    dispatch_once(&initWithTypeIdentifier__sOnce, &__block_literal_global_19);
  return -[NSUserActivity initWithActivityType:](self, "initWithActivityType:", a3);
}

void __41__NSUserActivity_initWithTypeIdentifier___block_invoke()
{
  NSLog((NSString *)CFSTR("NSUserActivity %s DEPRECATED: Please use initWithActivityType:, not initWithTypeIdentifier:. If you see this error, please write a bug against the this application and relate it to <rdar://problem/16494343>"), "-[NSUserActivity initWithTypeIdentifier:]_block_invoke");
}

- (id)webPageURL
{
  if (webPageURL_sOnce != -1)
    dispatch_once(&webPageURL_sOnce, &__block_literal_global_22);
  return (id)-[UAUserActivity webpageURL](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "webpageURL");
}

void __28__NSUserActivity_webPageURL__block_invoke()
{
  NSLog((NSString *)CFSTR("NSUserActivity %s DEPRECATED: Please use the webpageURL property, not the webPageURL property. If you see this error, please write a bug against the this application and relate it to <rdar://problem/16494343>"), "-[NSUserActivity webPageURL]_block_invoke");
}

- (void)setWebPageURL:(id)a3
{
  if (setWebPageURL__sOnce != -1)
    dispatch_once(&setWebPageURL__sOnce, &__block_literal_global_25);
  -[UAUserActivity setWebpageURL:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setWebpageURL:", a3);
}

void __32__NSUserActivity_setWebPageURL___block_invoke()
{
  NSLog((NSString *)CFSTR("NSUserActivity %s DEPRECATED: Please use the webpageURL property, not the webPageURL property. If you see this error, please write a bug against the this application and relate it to <rdar://problem/16494343>"), "-[NSUserActivity setWebPageURL:]_block_invoke");
}

- (void)didSynchronizeActivity
{
  NSUserActivityDelegate *v3;
  id v4;

  v3 = -[NSUserActivity _frameworkDelegate](self, "_frameworkDelegate");
  v4 = -[NSUserActivity delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSUserActivityDelegate userActivityWasContinued:](v3, "userActivityWasContinued:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "userActivityWasContinued:", self);
}

- (void)didReceiveInputStream:(id)a3 outputStream:(id)a4
{
  NSUserActivityDelegate *v7;
  id v8;

  v7 = -[NSUserActivity _frameworkDelegate](self, "_frameworkDelegate");
  v8 = -[NSUserActivity delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSUserActivityDelegate userActivity:didReceiveInputStream:outputStream:](v7, "userActivity:didReceiveInputStream:outputStream:", self, a3, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "userActivity:didReceiveInputStream:outputStream:", self, a3, a4);
}

- (NSString)_subtitle
{
  return 0;
}

- (NSString)_contentType
{
  return 0;
}

- (NSString)_contentIdentifier
{
  return 0;
}

- (NSDictionary)_contentAttributes
{
  return 0;
}

- (void)_addKeywordsFromArray:(id)a3
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  if (_MergedGlobals_140)
    -[UAUserActivity addKeywordsFromArray:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "addKeywordsFromArray:", a3);
}

- (id)_parentUserActivity
{
  return 0;
}

+ (BOOL)_supportsUserActivityAppLinks
{
  if (qword_1ECD0A438 != -1)
    dispatch_once(&qword_1ECD0A438, &__block_literal_global_293_0);
  return _MergedGlobals_140;
}

- (id)_initWithUserActivityData:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = objc_msgSend(objc_alloc((Class)getUAUserActivityClass()), "initWithUserActivityData:options:", a3, 0);
  if (!v4
    || (v5 = (void *)v4,
        self = -[NSUserActivity initWithInternalUserActivity:](self, "initWithInternalUserActivity:", v4),
        v5,
        !self))
  {
    -[NSUserActivity dealloc](self, "dealloc");
    return 0;
  }
  return self;
}

- (id)_initWithUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5
{
  uint64_t v6;
  void *v7;

  v6 = objc_msgSend(objc_alloc((Class)getUAUserActivityClass()), "initWithUserActivityStrings:optionalString:tertiaryData:options:", a3, a4, a5, 0);
  if (!v6
    || (v7 = (void *)v6,
        self = -[NSUserActivity initWithInternalUserActivity:](self, "initWithInternalUserActivity:", v6),
        v7,
        !self))
  {
    -[NSUserActivity dealloc](self, "dealloc");
    return 0;
  }
  return self;
}

- (BOOL)_createUserActivityDataWithOptions:(id)a3 completionHandler:(id)a4
{
  -[NSUserActivity _internalUserActivity](self, "_internalUserActivity", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UAUserActivity createUserActivityDataWithSaving:options:completionHandler:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "createUserActivityDataWithSaving:options:completionHandler:", 1, 0, a4);
  else
    return 0;
}

- (void)_prepareUserActivityForLaunchingWithOptions:(id)a3 completionHandler:(id)a4
{
  -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UAUserActivity prepareUserActivityForLaunchingWithOptions:completionHandler:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "prepareUserActivityForLaunchingWithOptions:completionHandler:", a3, a4);
}

- (NSString)_teamIdentifier
{
  -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (NSString *)-[UAUserActivity teamID](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "teamID");
  else
    return 0;
}

+ (BOOL)_currentUserActivityUUIDWithOptions:(id)a3 completionHandler:(id)a4
{
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(getUAUserActivityClass(), "currentUserActivityUUIDWithOptions:completionHandler:", a3, a4);
  else
    return 0;
}

- (id)_determineMatchingApplicationBundleIdentifierWithOptions:(id)a3
{
  -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[UAUserActivity determineMatchingApplicationBundleIdentfierWithOptions:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "determineMatchingApplicationBundleIdentfierWithOptions:", a3);
  else
    return 0;
}

+ (id)_fetchUserActivityWithUUID:(id)a3 intervalToWaitForDocumentSynchronizationToComplete:(double)a4 completionHandler:(id)a5
{
  void *UAUserActivityClass;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    UAUserActivityClass = getUAUserActivityClass();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __137__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_intervalToWaitForDocumentSynchronizationToComplete_completionHandler___block_invoke;
    v11[3] = &unk_1E0F51CF0;
    v11[4] = a3;
    v11[5] = a5;
    return (id)objc_msgSend(UAUserActivityClass, "fetchUserActivityWithUUID:intervalToWaitForDocumentSynchronizationToComplete:completionHandler:", a3, v11, a4);
  }
  else
  {
    objc_msgSend(a1, "_fetchUserActivityWithUUID:completionHandler:", a3, a5);
    return 0;
  }
}

void __137__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_intervalToWaitForDocumentSynchronizationToComplete_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSUserActivity *v4;
  NSError *v5;
  uint64_t v6;
  NSError *v7;

  if (a2)
  {
    v4 = -[NSUserActivity initWithInternalUserActivity:]([NSUserActivity alloc], "initWithInternalUserActivity:", a2);
    v7 = 0;
  }
  else
  {
    if (a3)
      v5 = +[NSUserActivity _userFacingErrorForLaunchServicesError:userInfo:](NSUserActivity, "_userFacingErrorForLaunchServicesError:userInfo:", a3, 0);
    else
      v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3328, 0);
    v7 = v5;
    v4 = 0;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, NSUserActivity *, NSError *))(v6 + 16))(v6, v4, v7);
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(getUAUserActivityClass(), "endUserActivityUIProgressForUUID:", *(_QWORD *)(a1 + 32));

}

+ (void)_registerUserActivityType:(id)a3 dynamicActivityType:(id)a4
{
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(getUAUserActivityClass(), "addDynamicUserActivity:matching:", a4, a3);
}

+ (void)_unregisterUserActivityType:(id)a3 dynamicActivityType:(id)a4
{
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(getUAUserActivityClass(), "removeDynamicUserActivity:matching:", a4, a3);
}

- (id)_initWithUserActivityType:(id)a3 dynamicActivityType:(id)a4 options:(id)a5
{
  NSUserActivity *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NSUserActivity;
  v8 = -[NSUserActivity init](&v10, sel_init);
  if (v8
    && objc_msgSend(getUAUserActivityClass(), "instancesRespondToSelector:", sel_initWithTypeIdentifier_dynamicIdentifier_options_))
  {
    v8->_internal = (id)objc_msgSend(objc_alloc((Class)getUAUserActivityClass()), "initWithTypeIdentifier:dynamicIdentifier:options:", a3, a4, a5);
  }
  return v8;
}

- (NSDictionary)_frameworkPayload
{
  return 0;
}

- (NSDate)_lastActivityDate
{
  return 0;
}

- (void)_setOptions:(id)a3
{
  -[UAUserActivity setOptions:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setOptions:", a3);
}

- (void)_resignCurrent
{
  -[UAUserActivity resignCurrent](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "resignCurrent");
}

+ (id)_userFacingErrorForLaunchServicesError:(id)a3 userInfo:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v12;

  if (!a3)
    return a3;
  v6 = (void *)objc_msgSend(a3, "domain");
  v7 = objc_msgSend(a3, "code");
  if (!objc_msgSend(v6, "isEqual:", getUAContinuityErrorDomain()))
  {
    if (objc_msgSend(v6, "isEqual:", CFSTR("NSPOSIXErrorDomain")))
    {
      v10 = v7 - 45;
      if ((unint64_t)(v7 - 45) <= 0x21)
      {
        if (((1 << v10) & 0x8060) != 0)
          goto LABEL_19;
        if (((1 << v10) & 0x200000001) != 0)
        {
          v9 = 3328;
          if (CFSTR("NSCocoaErrorDomain"))
            goto LABEL_22;
          return a3;
        }
      }
      if (v7 == 2)
      {
LABEL_19:
        v9 = 4609;
        if (CFSTR("NSCocoaErrorDomain"))
          goto LABEL_22;
        return a3;
      }
    }
    else if ((objc_msgSend(v6, "isEqual:", CFSTR("NSCocoaErrorDomain")) & 1) != 0)
    {
      return a3;
    }
    v9 = 4608;
    if (CFSTR("NSCocoaErrorDomain"))
      goto LABEL_22;
    return a3;
  }
  v8 = 4608;
  if (v7 == -110)
    v8 = 4611;
  if (v7 == -109)
    v9 = 4610;
  else
    v9 = v8;
  if (!CFSTR("NSCocoaErrorDomain"))
    return a3;
LABEL_22:
  v12 = (id)objc_msgSend(a4, "mutableCopy");
  if (v12 || (v12 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary")) != 0)
    objc_msgSend(v12, "setObject:forKey:", a3, CFSTR("NSUnderlyingError"));
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), v9, v12);
}

- (CSSearchableItemAttributeSet)contentAttributeSet
{
  -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (CSSearchableItemAttributeSet *)-[UAUserActivity contentAttributeSet](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "contentAttributeSet");
  else
    return 0;
}

- (void)setContentAttributeSet:(CSSearchableItemAttributeSet *)contentAttributeSet
{
  -[NSUserActivity _internalUserActivity](self, "_internalUserActivity");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UAUserActivity setContentAttributeSet:](-[NSUserActivity _internalUserActivity](self, "_internalUserActivity"), "setContentAttributeSet:", contentAttributeSet);
}

@end
