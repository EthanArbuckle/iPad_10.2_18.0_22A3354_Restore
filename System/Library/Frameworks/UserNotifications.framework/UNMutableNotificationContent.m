@implementation UNMutableNotificationContent

- (void)setContentType:(id)a3
{
  NSString *v4;
  NSString *contentType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contentType = self->super._contentType;
  self->super._contentType = v4;

}

- (void)setCommunicationContext:(id)a3
{
  _UNNotificationCommunicationContext *v4;
  _UNNotificationCommunicationContext *communicationContext;

  v4 = (_UNNotificationCommunicationContext *)objc_msgSend(a3, "copy");
  communicationContext = self->super._communicationContext;
  self->super._communicationContext = v4;

}

- (void)setAccessoryImageName:(id)a3
{
  objc_storeStrong((id *)&self->super._accessoryImageName, a3);
}

- (void)setAttachments:(NSArray *)attachments
{
  NSArray *v4;
  NSArray *v5;

  if (attachments)
  {
    v4 = (NSArray *)-[NSArray copy](attachments, "copy");
    v5 = self->super._attachments;
    self->super._attachments = v4;
  }
  else
  {
    v5 = self->super._attachments;
    self->super._attachments = (NSArray *)MEMORY[0x1E0C9AA60];
  }

}

- (void)setBadge:(NSNumber *)badge
{
  NSNumber *v4;
  NSNumber *v5;

  v4 = (NSNumber *)-[NSNumber copy](badge, "copy");
  v5 = self->super._badge;
  self->super._badge = v4;

}

- (void)setBody:(NSString *)body
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)-[NSString copy](body, "copy");
  v5 = self->super._body;
  self->super._body = v4;

}

- (void)setAttributedBody:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedBody;

  v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
  attributedBody = self->super._attributedBody;
  self->super._attributedBody = v4;

}

- (void)setCategoryIdentifier:(NSString *)categoryIdentifier
{
  NSString *v4;
  NSString *v5;

  if (categoryIdentifier)
  {
    v4 = (NSString *)-[NSString copy](categoryIdentifier, "copy");
    v5 = self->super._categoryIdentifier;
    self->super._categoryIdentifier = v4;
  }
  else
  {
    v5 = self->super._categoryIdentifier;
    self->super._categoryIdentifier = (NSString *)&stru_1E57F06A0;
  }

}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->super._date, a3);
}

- (void)setDefaultActionTitle:(id)a3
{
  NSString *v4;
  NSString *defaultActionTitle;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  defaultActionTitle = self->super._defaultActionTitle;
  self->super._defaultActionTitle = v4;

}

- (void)setDefaultActionURL:(id)a3
{
  NSURL *v4;
  NSURL *defaultActionURL;

  v4 = (NSURL *)objc_msgSend(a3, "copy");
  defaultActionURL = self->super._defaultActionURL;
  self->super._defaultActionURL = v4;

}

- (void)setDefaultActionBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *defaultActionBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  defaultActionBundleIdentifier = self->super._defaultActionBundleIdentifier;
  self->super._defaultActionBundleIdentifier = v4;

}

- (void)setExpirationDate:(id)a3
{
  NSDate *v4;
  NSDate *expirationDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  expirationDate = self->super._expirationDate;
  self->super._expirationDate = v4;

}

- (void)setHeader:(id)a3
{
  NSString *v4;
  NSString *header;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  header = self->super._header;
  self->super._header = v4;

}

- (void)setFooter:(id)a3
{
  NSString *v4;
  NSString *footer;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  footer = self->super._footer;
  self->super._footer = v4;

}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->super._icon, a3);
}

- (void)setHasDefaultAction:(BOOL)a3
{
  -[UNMutableNotificationContent setShouldSuppressDefaultAction:](self, "setShouldSuppressDefaultAction:", !a3);
}

- (void)setLaunchImageName:(NSString *)launchImageName
{
  NSString *v3;

  if (launchImageName)
    v3 = launchImageName;
  else
    v3 = (NSString *)&stru_1E57F06A0;
  objc_storeStrong((id *)&self->super._launchImageName, v3);
}

- (void)setPeopleIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *peopleIdentifiers;

  if (a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    peopleIdentifiers = self->super._peopleIdentifiers;
    self->super._peopleIdentifiers = v4;
  }
  else
  {
    peopleIdentifiers = self->super._peopleIdentifiers;
    self->super._peopleIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];
  }

}

- (void)setShouldHideDate:(BOOL)a3
{
  self->super._shouldHideDate = a3;
}

- (void)setShouldHideTime:(BOOL)a3
{
  self->super._shouldHideTime = a3;
}

- (void)setShouldIgnoreDoNotDisturb:(BOOL)a3
{
  self->super._shouldIgnoreDoNotDisturb = a3;
}

- (void)setShouldIgnoreDowntime:(BOOL)a3
{
  self->super._shouldIgnoreDowntime = a3;
}

- (void)setShouldAuthenticateDefaultAction:(BOOL)a3
{
  self->super._shouldAuthenticateDefaultAction = a3;
}

- (void)setShouldBackgroundDefaultAction:(BOOL)a3
{
  self->super._shouldBackgroundDefaultAction = a3;
}

- (void)setShouldPreventNotificationDismissalAfterDefaultAction:(BOOL)a3
{
  self->super._shouldPreventNotificationDismissalAfterDefaultAction = a3;
}

- (void)setShouldShowSubordinateIcon:(BOOL)a3
{
  self->super._shouldShowSubordinateIcon = a3;
}

- (void)setShouldSuppressDefaultAction:(BOOL)a3
{
  self->super._shouldSuppressDefaultAction = a3;
}

- (void)setShouldSuppressScreenLightUp:(BOOL)a3
{
  self->super._shouldSuppressScreenLightUp = a3;
}

- (void)setShouldSuppressSyncDismissalWhenRemoved:(BOOL)a3
{
  self->super._shouldSuppressSyncDismissalWhenRemoved = a3;
}

- (void)setShouldUseRequestIdentifierForDismissalSync:(BOOL)a3
{
  self->super._shouldUseRequestIdentifierForDismissalSync = a3;
}

- (void)setShouldPreemptPresentedNotification:(BOOL)a3
{
  self->super._shouldPreemptPresentedNotification = a3;
}

- (void)setShouldDisplayActionsInline:(BOOL)a3
{
  self->super._shouldDisplayActionsInline = a3;
}

- (void)setSound:(UNNotificationSound *)sound
{
  UNNotificationSound *v4;
  UNNotificationSound *v5;

  v4 = (UNNotificationSound *)-[UNNotificationSound copy](sound, "copy");
  v5 = self->super._sound;
  self->super._sound = v4;

}

- (void)setSubtitle:(NSString *)subtitle
{
  objc_storeStrong((id *)&self->super._subtitle, subtitle);
}

- (void)setThreadIdentifier:(NSString *)threadIdentifier
{
  NSString *v4;
  NSString *v5;

  if (threadIdentifier)
  {
    v4 = (NSString *)-[NSString copy](threadIdentifier, "copy");
    v5 = self->super._threadIdentifier;
    self->super._threadIdentifier = v4;
  }
  else
  {
    v5 = self->super._threadIdentifier;
    self->super._threadIdentifier = (NSString *)&stru_1E57F06A0;
  }

}

- (void)setTitle:(NSString *)title
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)-[NSString copy](title, "copy");
  v5 = self->super._title;
  self->super._title = v4;

}

- (void)setTopicIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *topicIdentifiers;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  topicIdentifiers = self->super._topicIdentifiers;
  self->super._topicIdentifiers = v4;

}

- (void)setRealertCount:(unint64_t)a3
{
  self->super._realertCount = a3;
}

- (void)setSummaryArgument:(NSString *)summaryArgument
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)-[NSString copy](summaryArgument, "copy");
  v5 = self->super._summaryArgument;
  self->super._summaryArgument = v4;

}

- (void)setSummaryArgumentCount:(NSUInteger)summaryArgumentCount
{
  self->super._summaryArgumentCount = summaryArgumentCount;
}

- (void)setTargetContentIdentifier:(NSString *)targetContentIdentifier
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)-[NSString copy](targetContentIdentifier, "copy");
  v5 = self->super._targetContentIdentifier;
  self->super._targetContentIdentifier = v4;

}

- (void)setInterruptionLevel:(UNNotificationInterruptionLevel)interruptionLevel
{
  self->super._interruptionLevel = interruptionLevel;
}

- (void)setRelevanceScore:(double)relevanceScore
{
  if (relevanceScore >= 0.0)
  {
    if (relevanceScore <= 1.0)
      self->super._relevanceScore = relevanceScore;
    else
      self->super._relevanceScore = 1.0;
  }
  else
  {
    self->super._relevanceScore = 0.0;
  }
}

- (void)setFilterCriteria:(NSString *)filterCriteria
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)-[NSString copy](filterCriteria, "copy");
  v5 = self->super._filterCriteria;
  self->super._filterCriteria = v4;

}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  self->super._screenCaptureProhibited = a3;
}

- (void)setSpeechLanguage:(id)a3
{
  NSString *v4;
  NSString *speechLanguage;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  speechLanguage = self->super._speechLanguage;
  self->super._speechLanguage = v4;

}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  NSDictionary *v4;
  NSDictionary *v5;

  v4 = (NSDictionary *)-[NSDictionary copy](userInfo, "copy");
  v5 = self->super._userInfo;
  self->super._userInfo = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5;
  unint64_t v6;
  void *v7;
  NSUInteger v8;
  void *v9;
  UNNotificationInterruptionLevel v10;
  double v11;
  double v12;
  void *v13;
  BOOL v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  BOOL v32;
  BOOL v33;
  BOOL v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  UNNotificationContent *v40;
  id v41;
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
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  -[UNNotificationContent speechLanguage](self, "speechLanguage");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = +[UNNotificationContent allocWithZone:](UNNotificationContent, "allocWithZone:", a3);
  -[UNNotificationContent contentType](self, "contentType");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent communicationContext](self, "communicationContext");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent accessoryImageName](self, "accessoryImageName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent attachments](self, "attachments");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent badge](self, "badge");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent body](self, "body");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent attributedBody](self, "attributedBody");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent categoryIdentifier](self, "categoryIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent date](self, "date");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent icon](self, "icon");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent defaultActionTitle](self, "defaultActionTitle");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent defaultActionURL](self, "defaultActionURL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent defaultActionBundleIdentifier](self, "defaultActionBundleIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent expirationDate](self, "expirationDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent header](self, "header");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent footer](self, "footer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent launchImageName](self, "launchImageName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent peopleIdentifiers](self, "peopleIdentifiers");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[UNNotificationContent shouldHideDate](self, "shouldHideDate");
  v34 = -[UNNotificationContent shouldHideTime](self, "shouldHideTime");
  v33 = -[UNNotificationContent shouldIgnoreDoNotDisturb](self, "shouldIgnoreDoNotDisturb");
  v32 = -[UNNotificationContent shouldIgnoreDowntime](self, "shouldIgnoreDowntime");
  v31 = -[UNNotificationContent shouldSuppressScreenLightUp](self, "shouldSuppressScreenLightUp");
  v30 = -[UNNotificationContent shouldAuthenticateDefaultAction](self, "shouldAuthenticateDefaultAction");
  v29 = -[UNNotificationContent shouldBackgroundDefaultAction](self, "shouldBackgroundDefaultAction");
  v28 = -[UNNotificationContent shouldPreventNotificationDismissalAfterDefaultAction](self, "shouldPreventNotificationDismissalAfterDefaultAction");
  v25 = -[UNNotificationContent shouldShowSubordinateIcon](self, "shouldShowSubordinateIcon");
  v27 = -[UNNotificationContent shouldSuppressDefaultAction](self, "shouldSuppressDefaultAction");
  v26 = -[UNNotificationContent shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved");
  v24 = -[UNNotificationContent shouldUseRequestIdentifierForDismissalSync](self, "shouldUseRequestIdentifierForDismissalSync");
  v23 = -[UNNotificationContent shouldPreemptPresentedNotification](self, "shouldPreemptPresentedNotification");
  v5 = -[UNNotificationContent shouldDisplayActionsInline](self, "shouldDisplayActionsInline");
  -[UNNotificationContent sound](self, "sound");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent subtitle](self, "subtitle");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent threadIdentifier](self, "threadIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent title](self, "title");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationContent topicIdentifiers](self, "topicIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UNNotificationContent realertCount](self, "realertCount");
  -[UNNotificationContent summaryArgument](self, "summaryArgument");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UNNotificationContent summaryArgumentCount](self, "summaryArgumentCount");
  -[UNNotificationContent targetContentIdentifier](self, "targetContentIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UNNotificationContent interruptionLevel](self, "interruptionLevel");
  -[UNNotificationContent relevanceScore](self, "relevanceScore");
  v12 = v11;
  -[UNNotificationContent filterCriteria](self, "filterCriteria");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[UNNotificationContent screenCaptureProhibited](self, "screenCaptureProhibited");
  -[UNNotificationContent userInfo](self, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = v14;
  BYTE5(v18) = v5;
  BYTE4(v18) = v23;
  BYTE3(v18) = v24;
  BYTE2(v18) = v26;
  BYTE1(v18) = v27;
  LOBYTE(v18) = v25;
  HIBYTE(v17) = v28;
  BYTE6(v17) = v29;
  BYTE5(v17) = v30;
  BYTE4(v17) = v31;
  BYTE3(v17) = v32;
  BYTE2(v17) = v33;
  BYTE1(v17) = v34;
  LOBYTE(v17) = v35;
  v41 = -[UNNotificationContent _initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:](v40, "_initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:", v57, v56, v55, v54, v52, v51, v12, v53, v47,
          v50,
          v49,
          v48,
          v46,
          v39,
          v38,
          v37,
          v45,
          v36,
          v44,
          v17,
          v18,
          v43,
          v42,
          v20,
          v22,
          v21,
          v6,
          v7,
          v8,
          v9,
          v10,
          v13,
          v19,
          v58,
          v15);

  return v41;
}

@end
