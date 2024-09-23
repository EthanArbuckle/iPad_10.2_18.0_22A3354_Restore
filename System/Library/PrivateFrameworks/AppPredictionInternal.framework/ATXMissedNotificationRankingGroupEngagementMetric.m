@implementation ATXMissedNotificationRankingGroupEngagementMetric

- (id)metricName
{
  return CFSTR("com.apple.MissedNotificationBundle.Group.engagementSummary");
}

- (void)populateMetricsFromDigestGroup:(id)a3 mnbUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingGroupEngagementMetric setBundleId:](self, "setBundleId:", v8);

  objc_msgSend(v7, "priority");
  -[ATXMissedNotificationRankingGroupEngagementMetric setGroupScore:](self, "setGroupScore:");
  objc_msgSend(v6, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXMissedNotificationRankingGroupEngagementMetric setMnbUUID:](self, "setMnbUUID:", v9);
  objc_msgSend(v7, "digestEngagementTrackingMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingGroupEngagementMetric setNumEngagementsInUpcoming:](self, "setNumEngagementsInUpcoming:", objc_msgSend(v10, "numEngagementsInUpcoming"));

  objc_msgSend(v7, "digestEngagementTrackingMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingGroupEngagementMetric setNumEngagementsAfterShow:](self, "setNumEngagementsAfterShow:", objc_msgSend(v11, "numEngagementsInScheduled"));

  objc_msgSend(v7, "digestEngagementTrackingMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingGroupEngagementMetric setNumEngagementsAfterExpiration:](self, "setNumEngagementsAfterExpiration:", objc_msgSend(v12, "numEngagementsAfterExpiration"));

  objc_msgSend(v7, "digestEngagementTrackingMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingGroupEngagementMetric setNumExpansions:](self, "setNumExpansions:", objc_msgSend(v13, "numExpansions"));

  objc_msgSend(v7, "digestEngagementTrackingMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingGroupEngagementMetric setSection:](self, "setSection:", v15);

  objc_msgSend(v7, "digestEngagementTrackingMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingGroupEngagementMetric setSectionPosition:](self, "setSectionPosition:", objc_msgSend(v16, "sectionPosition"));

  objc_msgSend(v7, "digestEngagementTrackingMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingGroupEngagementMetric setSectionSize:](self, "setSectionSize:", objc_msgSend(v17, "sectionSize"));

  objc_msgSend(v7, "rankedNotifications");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[ATXMissedNotificationRankingGroupEngagementMetric setNumNotifications:](self, "setNumNotifications:", objc_msgSend(v18, "count"));
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[11];
  _QWORD v27[13];

  v27[11] = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("bundleId");
  -[ATXMissedNotificationRankingGroupEngagementMetric bundleId](self, "bundleId");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v3;
  v27[0] = v3;
  v26[1] = CFSTR("secureBundleId");
  -[ATXMissedNotificationRankingGroupEngagementMetric bundleId](self, "bundleId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  if (v24)
  {
    -[ATXMissedNotificationRankingGroupEngagementMetric bundleId](self, "bundleId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v5;
  }
  v21 = (void *)v5;
  v27[1] = v5;
  v26[2] = CFSTR("groupScore");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXMissedNotificationRankingGroupEngagementMetric groupScore](self, "groupScore");
  objc_msgSend(v6, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v22;
  v26[3] = CFSTR("mnbUUID");
  -[ATXMissedNotificationRankingGroupEngagementMetric mnbUUID](self, "mnbUUID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v7;
  v27[3] = v7;
  v26[4] = CFSTR("numEngagementsAfterExpiration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v9;
  v26[5] = CFSTR("numEngagementsAfterShow");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric numEngagementsAfterShow](self, "numEngagementsAfterShow"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v10;
  v26[6] = CFSTR("numEngagementsInUpcoming");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric numEngagementsInUpcoming](self, "numEngagementsInUpcoming"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v11;
  v26[7] = CFSTR("numExpansions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric numExpansions](self, "numExpansions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v12;
  v26[8] = CFSTR("section");
  -[ATXMissedNotificationRankingGroupEngagementMetric section](self, "section");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[8] = v14;
  v26[9] = CFSTR("sectionPosition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric sectionPosition](self, "sectionPosition"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v15;
  v26[10] = CFSTR("sectionSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric sectionSize](self, "sectionSize"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[10] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  if (!v8)

  if (v24)
  if (!v25)

  return v17;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (double)groupScore
{
  return self->_groupScore;
}

- (void)setGroupScore:(double)a3
{
  self->_groupScore = a3;
}

- (NSString)mnbUUID
{
  return self->_mnbUUID;
}

- (void)setMnbUUID:(id)a3
{
  objc_storeStrong((id *)&self->_mnbUUID, a3);
}

- (unint64_t)numEngagementsInUpcoming
{
  return self->_numEngagementsInUpcoming;
}

- (void)setNumEngagementsInUpcoming:(unint64_t)a3
{
  self->_numEngagementsInUpcoming = a3;
}

- (unint64_t)numEngagementsAfterShow
{
  return self->_numEngagementsAfterShow;
}

- (void)setNumEngagementsAfterShow:(unint64_t)a3
{
  self->_numEngagementsAfterShow = a3;
}

- (unint64_t)numEngagementsAfterExpiration
{
  return self->_numEngagementsAfterExpiration;
}

- (void)setNumEngagementsAfterExpiration:(unint64_t)a3
{
  self->_numEngagementsAfterExpiration = a3;
}

- (unint64_t)numExpansions
{
  return self->_numExpansions;
}

- (void)setNumExpansions:(unint64_t)a3
{
  self->_numExpansions = a3;
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
  objc_storeStrong((id *)&self->_section, a3);
}

- (unint64_t)sectionPosition
{
  return self->_sectionPosition;
}

- (void)setSectionPosition:(unint64_t)a3
{
  self->_sectionPosition = a3;
}

- (unint64_t)sectionSize
{
  return self->_sectionSize;
}

- (void)setSectionSize:(unint64_t)a3
{
  self->_sectionSize = a3;
}

- (unint64_t)numNotifications
{
  return self->_numNotifications;
}

- (void)setNumNotifications:(unint64_t)a3
{
  self->_numNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_mnbUUID, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
