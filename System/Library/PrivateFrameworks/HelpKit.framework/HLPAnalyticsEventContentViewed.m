@implementation HLPAnalyticsEventContentViewed

- (id)_initWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  HLPAnalyticsEventContentViewed *v14;
  id *p_isa;
  const __CFString *v16;
  __CFString *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HLPAnalyticsEventContentViewed;
  v14 = -[HLPAnalyticsEventContentViewed init](&v19, sel_init);
  p_isa = (id *)&v14->super.super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_topicID, a3);
    objc_storeStrong(p_isa + 4, a4);
    objc_storeStrong(p_isa + 5, a5);
    v16 = CFSTR("unspecified");
    if (a6 == 1)
      v16 = CFSTR("light");
    if (a6 == 2)
      v17 = CFSTR("dark");
    else
      v17 = (__CFString *)v16;
    objc_storeStrong(p_isa + 6, v17);
  }

  return p_isa;
}

+ (id)eventWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTopicID:topicTitle:source:interfaceStyle:", v12, v11, v10, a6);

  return v13;
}

- (void)log
{
  void *v3;
  objc_super v4;

  +[HLPAnalyticsEventController sharedInstance](HLPAnalyticsEventController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incrementCounterForKey:", CFSTR("content_viewed_counter"));

  v4.receiver = self;
  v4.super_class = (Class)HLPAnalyticsEventContentViewed;
  -[HLPAnalyticsEvent log](&v4, "log");
}

- (id)eventName
{
  return CFSTR("ContentViewed");
}

- (id)caRepresentation
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
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HLPAnalyticsEventContentViewed;
  -[HLPAnalyticsEvent caRepresentation](&v16, sel_caRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HLPAnalyticsEventContentViewed source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("view_src"));

  -[HLPAnalyticsEventContentViewed viewMode](self, "viewMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("mode"));

  -[HLPAnalyticsEventContentViewed topicID](self, "topicID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("topic_ID"));

  -[HLPAnalyticsEventContentViewed topicTitle](self, "topicTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("topic_title"));

  -[HLPAnalyticsEventContentViewed fromTopicID](self, "fromTopicID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HLPAnalyticsEventContentViewed fromTopicID](self, "fromTopicID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("from_topic_ID"));

  }
  -[HLPAnalyticsEventContentViewed externalURLString](self, "externalURLString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HLPAnalyticsEventContentViewed externalURLString](self, "externalURLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("external_link"));

  }
  +[HLPAnalyticsEventController sharedInstance](HLPAnalyticsEventController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "counterForKey:", CFSTR("content_viewed_counter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("session_view_num"));

  return v4;
}

- (NSString)externalURLString
{
  return self->_externalURLString;
}

- (void)setExternalURLString:(id)a3
{
  objc_storeStrong((id *)&self->_externalURLString, a3);
}

- (NSString)fromTopicID
{
  return self->_fromTopicID;
}

- (void)setFromTopicID:(id)a3
{
  objc_storeStrong((id *)&self->_fromTopicID, a3);
}

- (NSString)topicID
{
  return self->_topicID;
}

- (void)setTopicID:(id)a3
{
  objc_storeStrong((id *)&self->_topicID, a3);
}

- (NSString)topicTitle
{
  return self->_topicTitle;
}

- (void)setTopicTitle:(id)a3
{
  objc_storeStrong((id *)&self->_topicTitle, a3);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSString)viewMode
{
  return self->_viewMode;
}

- (void)setViewMode:(id)a3
{
  objc_storeStrong((id *)&self->_viewMode, a3);
}

- (unint64_t)viewNum
{
  return self->_viewNum;
}

- (void)setViewNum:(unint64_t)a3
{
  self->_viewNum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewMode, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_topicTitle, 0);
  objc_storeStrong((id *)&self->_topicID, 0);
  objc_storeStrong((id *)&self->_fromTopicID, 0);
  objc_storeStrong((id *)&self->_externalURLString, 0);
}

@end
