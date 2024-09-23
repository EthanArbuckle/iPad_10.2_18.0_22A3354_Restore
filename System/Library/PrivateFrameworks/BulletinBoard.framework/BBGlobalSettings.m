@implementation BBGlobalSettings

- (BBGlobalSettings)initWithContentPreviewSetting:(int64_t)a3 announceSetting:(int64_t)a4 announceHeadphonesSetting:(int64_t)a5 announceCarPlaySetting:(int64_t)a6 scheduledDeliverySetting:(int64_t)a7 scheduledDeliveryTimes:(id)a8 scheduledDeliveryShowNextSummarySetting:(int64_t)a9 notificationListDisplayStyleSetting:(int64_t)a10 summarizationSetting:(int64_t)a11 highlightsSettings:(int64_t)a12
{
  id v18;
  BBGlobalSettings *v19;
  BBGlobalSettings *v20;
  uint64_t v21;
  NSArray *globalScheduledDeliveryTimes;
  objc_super v24;

  v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BBGlobalSettings;
  v19 = -[BBGlobalSettings init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_globalContentPreviewSetting = a3;
    v19->_globalAnnounceSetting = a4;
    v19->_globalAnnounceHeadphonesSetting = a5;
    v19->_globalAnnounceCarPlaySetting = a6;
    v19->_globalScheduledDeliverySetting = a7;
    v21 = objc_msgSend(v18, "copy");
    globalScheduledDeliveryTimes = v20->_globalScheduledDeliveryTimes;
    v20->_globalScheduledDeliveryTimes = (NSArray *)v21;

    v20->_globalScheduledDeliveryShowNextSummarySetting = a9;
    v20->_globalNotificationListDisplayStyleSetting = a10;
    v20->_globalSummarizationSetting = a11;
    v20->_globalHighlightsSetting = a12;
  }

  return v20;
}

- (id)description
{
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (-[BBGlobalSettings globalContentPreviewSetting](self, "globalContentPreviewSetting"))
  {
    BBStringFromBBContentPreviewSetting(-[BBGlobalSettings globalContentPreviewSetting](self, "globalContentPreviewSetting"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR(" Global Settings: "), "stringByAppendingFormat:", CFSTR("Content Preview Setting: '%@'"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR(" Global Settings: ");
  }
  if (-[BBGlobalSettings globalAnnounceSetting](self, "globalAnnounceSetting"))
  {
    BBStringFromBBAnnounceSetting(-[BBGlobalSettings globalAnnounceSetting](self, "globalAnnounceSetting"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR("Announce Setting: '%@'"), v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v6;
  }
  if (-[BBGlobalSettings globalAnnounceHeadphonesSetting](self, "globalAnnounceHeadphonesSetting"))
  {
    BBStringFromBBAnnounceSetting(-[BBGlobalSettings globalAnnounceHeadphonesSetting](self, "globalAnnounceHeadphonesSetting"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR("Announce Headphone Setting: '%@'"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v8;
  }
  if (-[BBGlobalSettings globalAnnounceCarPlaySetting](self, "globalAnnounceCarPlaySetting"))
  {
    BBStringFromBBAnnounceCarPlaySetting(-[BBGlobalSettings globalAnnounceCarPlaySetting](self, "globalAnnounceCarPlaySetting"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR("Announce CarPlay Setting: '%@'"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v10;
  }
  if (-[BBGlobalSettings globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"))
  {
    BBStringFromBBScheduledDeliverySetting(-[BBGlobalSettings globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR("Scheduled Delivery Setting: '%@'"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v12;
  }
  -[BBGlobalSettings globalScheduledDeliveryTimes](self, "globalScheduledDeliveryTimes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR("Scheduled Delivery Times: [ "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[BBGlobalSettings globalScheduledDeliveryTimes](self, "globalScheduledDeliveryTimes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v34;
      do
      {
        v19 = 0;
        v20 = v14;
        do
        {
          if (*(_QWORD *)v34 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(" %li:%li,"), objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v19), "hour"), objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v19), "minute"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          ++v19;
          v20 = v14;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v17);
    }

    objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(" ]"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (-[BBGlobalSettings globalScheduledDeliveryShowNextSummarySetting](self, "globalScheduledDeliveryShowNextSummarySetting"))
  {
    BBStringFromBBSystemSetting(-[BBGlobalSettings globalScheduledDeliveryShowNextSummarySetting](self, "globalScheduledDeliveryShowNextSummarySetting"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR("Scheduled Delivery Show Next Summary Setting: '%@'"), v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v22;
  }
  if (-[BBGlobalSettings globalNotificationListDisplayStyleSetting](self, "globalNotificationListDisplayStyleSetting"))
  {
    BBStringFromBBNotificationListDisplayStyleSetting(-[BBGlobalSettings globalNotificationListDisplayStyleSetting](self, "globalNotificationListDisplayStyleSetting"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR("Notification List State Setting: '%@'"), v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v24;
  }
  if (-[BBGlobalSettings globalSummarizationSetting](self, "globalSummarizationSetting"))
  {
    BBStringFromBBSystemSetting(-[BBGlobalSettings globalSummarizationSetting](self, "globalSummarizationSetting"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR("Summarization Setting: '%@'"), v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v26;
  }
  if (-[BBGlobalSettings globalHighlightsSetting](self, "globalHighlightsSetting"))
  {
    BBStringFromBBSystemSetting(-[BBGlobalSettings globalHighlightsSetting](self, "globalHighlightsSetting"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR("Highlights Setting: '%@'"), v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v28;
  }
  v32.receiver = self;
  v32.super_class = (Class)BBGlobalSettings;
  -[BBGlobalSettings description](&v32, sel_description);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringByAppendingString:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;

  v3 = -[BBGlobalSettings globalContentPreviewSetting](self, "globalContentPreviewSetting");
  v4 = -[BBGlobalSettings globalAnnounceSetting](self, "globalAnnounceSetting") ^ v3;
  v5 = -[BBGlobalSettings globalAnnounceHeadphonesSetting](self, "globalAnnounceHeadphonesSetting");
  v6 = v4 ^ v5 ^ -[BBGlobalSettings globalAnnounceCarPlaySetting](self, "globalAnnounceCarPlaySetting");
  v7 = -[BBGlobalSettings globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting");
  -[BBGlobalSettings globalScheduledDeliveryTimes](self, "globalScheduledDeliveryTimes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = -[BBGlobalSettings globalScheduledDeliveryShowNextSummarySetting](self, "globalScheduledDeliveryShowNextSummarySetting");
  v11 = v10 ^ -[BBGlobalSettings globalNotificationListDisplayStyleSetting](self, "globalNotificationListDisplayStyleSetting");
  v12 = v11 ^ -[BBGlobalSettings globalSummarizationSetting](self, "globalSummarizationSetting");
  v13 = v9 ^ v12 ^ -[BBGlobalSettings globalHighlightsSetting](self, "globalHighlightsSetting");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  BBGlobalSettings *v4;
  BBGlobalSettings *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  BOOL v17;

  v4 = (BBGlobalSettings *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = -[BBGlobalSettings globalContentPreviewSetting](self, "globalContentPreviewSetting");
      if (v6 == -[BBGlobalSettings globalContentPreviewSetting](v5, "globalContentPreviewSetting")
        && (v7 = -[BBGlobalSettings globalAnnounceSetting](self, "globalAnnounceSetting"),
            v7 == -[BBGlobalSettings globalAnnounceSetting](v5, "globalAnnounceSetting"))
        && (v8 = -[BBGlobalSettings globalAnnounceHeadphonesSetting](self, "globalAnnounceHeadphonesSetting"),
            v8 == -[BBGlobalSettings globalAnnounceHeadphonesSetting](v5, "globalAnnounceHeadphonesSetting"))
        && (v9 = -[BBGlobalSettings globalAnnounceCarPlaySetting](self, "globalAnnounceCarPlaySetting"),
            v9 == -[BBGlobalSettings globalAnnounceCarPlaySetting](v5, "globalAnnounceCarPlaySetting"))
        && (v10 = -[BBGlobalSettings globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"),
            v10 == -[BBGlobalSettings globalScheduledDeliverySetting](v5, "globalScheduledDeliverySetting")))
      {
        -[BBGlobalSettings globalScheduledDeliveryTimes](self, "globalScheduledDeliveryTimes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[BBGlobalSettings globalScheduledDeliveryTimes](v5, "globalScheduledDeliveryTimes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToArray:", v12)
          && (v13 = -[BBGlobalSettings globalScheduledDeliveryShowNextSummarySetting](self, "globalScheduledDeliveryShowNextSummarySetting"), v13 == -[BBGlobalSettings globalScheduledDeliveryShowNextSummarySetting](v5, "globalScheduledDeliveryShowNextSummarySetting"))&& (v14 = -[BBGlobalSettings globalNotificationListDisplayStyleSetting](self, "globalNotificationListDisplayStyleSetting"), v14 == -[BBGlobalSettings globalNotificationListDisplayStyleSetting](v5, "globalNotificationListDisplayStyleSetting"))&& (v15 = -[BBGlobalSettings globalSummarizationSetting](self, "globalSummarizationSetting"), v15 == -[BBGlobalSettings globalSummarizationSetting](v5, "globalSummarizationSetting")))
        {
          v16 = -[BBGlobalSettings globalHighlightsSetting](self, "globalHighlightsSetting");
          v17 = v16 == -[BBGlobalSettings globalHighlightsSetting](v5, "globalHighlightsSetting");
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setGlobalContentPreviewSetting:", -[BBGlobalSettings globalContentPreviewSetting](self, "globalContentPreviewSetting"));
  objc_msgSend(v4, "setGlobalAnnounceSetting:", -[BBGlobalSettings globalAnnounceSetting](self, "globalAnnounceSetting"));
  objc_msgSend(v4, "setGlobalAnnounceHeadphonesSetting:", -[BBGlobalSettings globalAnnounceHeadphonesSetting](self, "globalAnnounceHeadphonesSetting"));
  objc_msgSend(v4, "setGlobalAnnounceCarPlaySetting:", -[BBGlobalSettings globalAnnounceCarPlaySetting](self, "globalAnnounceCarPlaySetting"));
  objc_msgSend(v4, "setGlobalScheduledDeliverySetting:", -[BBGlobalSettings globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"));
  -[BBGlobalSettings globalScheduledDeliveryTimes](self, "globalScheduledDeliveryTimes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlobalScheduledDeliveryTimes:", v5);

  objc_msgSend(v4, "setGlobalScheduledDeliveryShowNextSummarySetting:", -[BBGlobalSettings globalScheduledDeliveryShowNextSummarySetting](self, "globalScheduledDeliveryShowNextSummarySetting"));
  objc_msgSend(v4, "setGlobalNotificationListDisplayStyleSetting:", -[BBGlobalSettings globalNotificationListDisplayStyleSetting](self, "globalNotificationListDisplayStyleSetting"));
  objc_msgSend(v4, "setGlobalSummarizationSetting:", -[BBGlobalSettings globalSummarizationSetting](self, "globalSummarizationSetting"));
  objc_msgSend(v4, "setGlobalHighlightsSetting:", -[BBGlobalSettings globalHighlightsSetting](self, "globalHighlightsSetting"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalContentPreviewSetting](self, "globalContentPreviewSetting"), CFSTR("contentPreviews"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalAnnounceSetting](self, "globalAnnounceSetting"), CFSTR("announce"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalAnnounceHeadphonesSetting](self, "globalAnnounceHeadphonesSetting"), CFSTR("announceHeadphones"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalAnnounceCarPlaySetting](self, "globalAnnounceCarPlaySetting"), CFSTR("announceCarPlay"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalScheduledDeliverySetting](self, "globalScheduledDeliverySetting"), CFSTR("scheduledDelivery"));
  -[BBGlobalSettings globalScheduledDeliveryTimes](self, "globalScheduledDeliveryTimes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("scheduledDeliveryTimes"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalScheduledDeliveryShowNextSummarySetting](self, "globalScheduledDeliveryShowNextSummarySetting"), CFSTR("scheduledDeliveryShowNextSummary"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalNotificationListDisplayStyleSetting](self, "globalNotificationListDisplayStyleSetting"), CFSTR("notificationListDisplayStyle"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalSummarizationSetting](self, "globalSummarizationSetting"), CFSTR("summarization"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[BBGlobalSettings globalHighlightsSetting](self, "globalHighlightsSetting"), CFSTR("highlights"));

}

- (BBGlobalSettings)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BBGlobalSettings *v14;

  v3 = a3;
  v4 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("contentPreviews"));
  if (objc_msgSend(v3, "containsValueForKey:", CFSTR("announce")))
    v5 = CFSTR("announce");
  else
    v5 = CFSTR("spokenNotifications");
  v6 = objc_msgSend(v3, "decodeIntegerForKey:", v5);
  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("announceHeadphones"));
  v8 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("announceCarPlay"));
  v9 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("scheduledDelivery"));
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v12, CFSTR("scheduledDeliveryTimes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[BBGlobalSettings initWithContentPreviewSetting:announceSetting:announceHeadphonesSetting:announceCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:summarizationSetting:highlightsSettings:](self, "initWithContentPreviewSetting:announceSetting:announceHeadphonesSetting:announceCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:summarizationSetting:highlightsSettings:", v4, v6, v7, v8, v9, v13, objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("scheduledDeliveryShowNextSummary")), objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("notificationListDisplayStyle")), objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("summarization")), objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("highlights")));
  return v14;
}

- (int64_t)globalSpokenNotificationSetting
{
  return BBSpokenNotificationSettingForAnnounceSetting(-[BBGlobalSettings globalAnnounceSetting](self, "globalAnnounceSetting"));
}

- (int64_t)globalContentPreviewSetting
{
  return self->_globalContentPreviewSetting;
}

- (void)setGlobalContentPreviewSetting:(int64_t)a3
{
  self->_globalContentPreviewSetting = a3;
}

- (int64_t)globalAnnounceSetting
{
  return self->_globalAnnounceSetting;
}

- (void)setGlobalAnnounceSetting:(int64_t)a3
{
  self->_globalAnnounceSetting = a3;
}

- (int64_t)globalAnnounceHeadphonesSetting
{
  return self->_globalAnnounceHeadphonesSetting;
}

- (void)setGlobalAnnounceHeadphonesSetting:(int64_t)a3
{
  self->_globalAnnounceHeadphonesSetting = a3;
}

- (int64_t)globalAnnounceCarPlaySetting
{
  return self->_globalAnnounceCarPlaySetting;
}

- (void)setGlobalAnnounceCarPlaySetting:(int64_t)a3
{
  self->_globalAnnounceCarPlaySetting = a3;
}

- (int64_t)globalScheduledDeliverySetting
{
  return self->_globalScheduledDeliverySetting;
}

- (void)setGlobalScheduledDeliverySetting:(int64_t)a3
{
  self->_globalScheduledDeliverySetting = a3;
}

- (NSArray)globalScheduledDeliveryTimes
{
  return self->_globalScheduledDeliveryTimes;
}

- (void)setGlobalScheduledDeliveryTimes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)globalScheduledDeliveryShowNextSummarySetting
{
  return self->_globalScheduledDeliveryShowNextSummarySetting;
}

- (void)setGlobalScheduledDeliveryShowNextSummarySetting:(int64_t)a3
{
  self->_globalScheduledDeliveryShowNextSummarySetting = a3;
}

- (int64_t)globalNotificationListDisplayStyleSetting
{
  return self->_globalNotificationListDisplayStyleSetting;
}

- (void)setGlobalNotificationListDisplayStyleSetting:(int64_t)a3
{
  self->_globalNotificationListDisplayStyleSetting = a3;
}

- (int64_t)globalSummarizationSetting
{
  return self->_globalSummarizationSetting;
}

- (void)setGlobalSummarizationSetting:(int64_t)a3
{
  self->_globalSummarizationSetting = a3;
}

- (int64_t)globalHighlightsSetting
{
  return self->_globalHighlightsSetting;
}

- (void)setGlobalHighlightsSetting:(int64_t)a3
{
  self->_globalHighlightsSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalScheduledDeliveryTimes, 0);
}

@end
