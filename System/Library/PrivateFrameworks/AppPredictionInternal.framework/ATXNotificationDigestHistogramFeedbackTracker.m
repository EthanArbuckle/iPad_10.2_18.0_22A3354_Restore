@implementation ATXNotificationDigestHistogramFeedbackTracker

- (ATXNotificationDigestHistogramFeedbackTracker)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXNotificationDigestHistogramFeedbackTracker *v7;

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categoricalHistogramForLaunchType:", 97);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoricalHistogramForLaunchType:", 98);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ATXNotificationDigestHistogramFeedbackTracker initWithDigestFeedbackHistogram:alltimeMarqueeAppearanceHistogram:](self, "initWithDigestFeedbackHistogram:alltimeMarqueeAppearanceHistogram:", v4, v6);
  return v7;
}

- (ATXNotificationDigestHistogramFeedbackTracker)initWithDigestFeedbackHistogram:(id)a3 alltimeMarqueeAppearanceHistogram:(id)a4
{
  id v7;
  id v8;
  ATXNotificationDigestHistogramFeedbackTracker *v9;
  ATXNotificationDigestHistogramFeedbackTracker *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationDigestHistogramFeedbackTracker;
  v9 = -[ATXNotificationDigestHistogramFeedbackTracker init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_digestFeedbackHistogram, a3);
    objc_storeStrong((id *)&v10->_alltimeMarqueeAppearanceHistogram, a4);
  }

  return v10;
}

- (void)logMarqueeAppearanceForBundleId:(id)a3
{
  _ATXAppLaunchCategoricalHistogram *digestFeedbackHistogram;
  void *v5;
  id v6;
  void *v7;
  _ATXAppLaunchCategoricalHistogram *alltimeMarqueeAppearanceHistogram;
  id v9;

  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  v5 = (void *)MEMORY[0x1E0C99D68];
  v6 = a3;
  objc_msgSend(v5, "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:](digestFeedbackHistogram, "addLaunchWithBundleId:date:category:", v6, v7, CFSTR("marquee_appearance"));

  alltimeMarqueeAppearanceHistogram = self->_alltimeMarqueeAppearanceHistogram;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:](alltimeMarqueeAppearanceHistogram, "addLaunchWithBundleId:date:category:", v6, v9, CFSTR("marquee_alltimeAppearance"));

}

- (void)logMarqueeEngagementForBundleId:(id)a3
{
  _ATXAppLaunchCategoricalHistogram *digestFeedbackHistogram;
  void *v4;
  id v5;
  id v6;

  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:](digestFeedbackHistogram, "addLaunchWithBundleId:date:category:", v5, v6, CFSTR("marquee_engagement"));

}

- (void)logNonMarqueeAppearanceForBundleId:(id)a3
{
  _ATXAppLaunchCategoricalHistogram *digestFeedbackHistogram;
  void *v4;
  id v5;
  id v6;

  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:](digestFeedbackHistogram, "addLaunchWithBundleId:date:category:", v5, v6, CFSTR("nonmarquee_appearance"));

}

- (void)logNonMarqueeEngagementForBundleId:(id)a3
{
  _ATXAppLaunchCategoricalHistogram *digestFeedbackHistogram;
  void *v4;
  id v5;
  id v6;

  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "now");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:](digestFeedbackHistogram, "addLaunchWithBundleId:date:category:", v5, v6, CFSTR("nonmarquee_engagement"));

}

- (void)logBasicNotificationsSentForBundleId:(id)a3 numNotifications:(unint64_t)a4
{
  _ATXAppLaunchCategoricalHistogram *digestFeedbackHistogram;
  void *v6;
  id v7;
  double v8;
  id v9;

  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "now");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = (float)a4;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](digestFeedbackHistogram, "addLaunchWithBundleId:date:category:weight:", v7, v9, CFSTR("basic_notifications_sent"), v8);

}

- (void)logTimeSensitiveNotificationsSentForBundleId:(id)a3 numNotifications:(unint64_t)a4
{
  _ATXAppLaunchCategoricalHistogram *digestFeedbackHistogram;
  void *v6;
  id v7;
  double v8;
  id v9;

  digestFeedbackHistogram = self->_digestFeedbackHistogram;
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "now");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = (float)a4;
  -[_ATXAppLaunchCategoricalHistogram addLaunchWithBundleId:date:category:weight:](digestFeedbackHistogram, "addLaunchWithBundleId:date:category:weight:", v7, v9, CFSTR("urgent_notifications_sent"), v8);

}

- (double)marqueeAppearancesForBundleId:(id)a3
{
  double result;

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_digestFeedbackHistogram, "totalLaunchesForBundleId:category:", a3, CFSTR("marquee_appearance"));
  return result;
}

- (double)marqueeEngagementsForBundleId:(id)a3
{
  double result;

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_digestFeedbackHistogram, "totalLaunchesForBundleId:category:", a3, CFSTR("marquee_engagement"));
  return result;
}

- (double)nonMarqueeAppearancesForBundleId:(id)a3
{
  double result;

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_digestFeedbackHistogram, "totalLaunchesForBundleId:category:", a3, CFSTR("nonmarquee_appearance"));
  return result;
}

- (double)nonMarqueeEngagementsForBundleId:(id)a3
{
  double result;

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_digestFeedbackHistogram, "totalLaunchesForBundleId:category:", a3, CFSTR("nonmarquee_engagement"));
  return result;
}

- (double)basicNotificationsSentForBundleId:(id)a3
{
  double result;

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_digestFeedbackHistogram, "totalLaunchesForBundleId:category:", a3, CFSTR("basic_notifications_sent"));
  return result;
}

- (double)timeSensitiveNotificationsSentForBundleId:(id)a3
{
  double result;

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_digestFeedbackHistogram, "totalLaunchesForBundleId:category:", a3, CFSTR("urgent_notifications_sent"));
  return result;
}

- (double)alltimeMarqueeAppearancesForBundleId:(id)a3
{
  double result;

  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_alltimeMarqueeAppearanceHistogram, "totalLaunchesForBundleId:category:", a3, CFSTR("marquee_alltimeAppearance"));
  return result;
}

- (void)decayFeedbackByFactor:(double)a3
{
  -[_ATXAppLaunchCategoricalHistogram decayByFactor:](self->_digestFeedbackHistogram, "decayByFactor:", a3);
}

- (id)feedbackDictionaryForBundleId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[6];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21[0] = CFSTR("marquee_engagement");
  v21[1] = CFSTR("marquee_appearance");
  v21[2] = CFSTR("nonmarquee_engagement");
  v21[3] = CFSTR("nonmarquee_appearance");
  v21[4] = CFSTR("basic_notifications_sent");
  v21[5] = CFSTR("urgent_notifications_sent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 6, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1E0CB37E8];
        -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_digestFeedbackHistogram, "totalLaunchesForBundleId:category:", v4, v11);
        objc_msgSend(v12, "numberWithDouble:");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v8);
  }

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[_ATXAppLaunchCategoricalHistogram totalLaunchesForBundleId:category:](self->_alltimeMarqueeAppearanceHistogram, "totalLaunchesForBundleId:category:", v4, CFSTR("marquee_alltimeAppearance"));
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("marquee_alltimeAppearance"));

  return v5;
}

- (_ATXAppLaunchCategoricalHistogram)digestFeedbackHistogram
{
  return self->_digestFeedbackHistogram;
}

- (_ATXAppLaunchCategoricalHistogram)alltimeMarqueeAppearanceHistogram
{
  return self->_alltimeMarqueeAppearanceHistogram;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alltimeMarqueeAppearanceHistogram, 0);
  objc_storeStrong((id *)&self->_digestFeedbackHistogram, 0);
}

@end
