@implementation ATXDigestGroupEngagementMetric

- (id)metricName
{
  return CFSTR("com.apple.NotificationDigest.DigestGroup.engagementSummary");
}

- (void)populateMetricsFromDigestGroup:(id)a3 digestUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a3;
  objc_msgSend(a4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestGroupEngagementMetric setDigestUUID:](self, "setDigestUUID:", v7);

  objc_msgSend(v6, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestGroupEngagementMetric setBundleId:](self, "setBundleId:", v8);

  objc_msgSend(v6, "digestEngagementTrackingMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestGroupEngagementMetric setSection:](self, "setSection:", v10);

  objc_msgSend(v6, "digestEngagementTrackingMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestGroupEngagementMetric setSectionPosition:](self, "setSectionPosition:", objc_msgSend(v11, "sectionPosition"));

  objc_msgSend(v6, "digestEngagementTrackingMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestGroupEngagementMetric setSectionSize:](self, "setSectionSize:", objc_msgSend(v12, "sectionSize"));

  objc_msgSend(v6, "rankedNotifications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestGroupEngagementMetric setNumNotifications:](self, "setNumNotifications:", objc_msgSend(v13, "count"));

  -[ATXDigestGroupEngagementMetric setHasImage:](self, "setHasImage:", objc_msgSend(v6, "hasPreviewableAttachment"));
  objc_msgSend(v6, "priority");
  -[ATXDigestGroupEngagementMetric setGroupScore:](self, "setGroupScore:");
  objc_msgSend(v6, "digestEngagementTrackingMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestGroupEngagementMetric setNumEngagementsInUpcoming:](self, "setNumEngagementsInUpcoming:", objc_msgSend(v14, "numEngagementsInUpcoming"));

  objc_msgSend(v6, "digestEngagementTrackingMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestGroupEngagementMetric setNumEngagementsInScheduled:](self, "setNumEngagementsInScheduled:", objc_msgSend(v15, "numEngagementsInScheduled"));

  objc_msgSend(v6, "digestEngagementTrackingMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestGroupEngagementMetric setNumEngagementsAfterExpiration:](self, "setNumEngagementsAfterExpiration:", objc_msgSend(v16, "numEngagementsAfterExpiration"));

  objc_msgSend(v6, "digestEngagementTrackingMetrics");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[ATXDigestGroupEngagementMetric setNumExpansions:](self, "setNumExpansions:", objc_msgSend(v17, "numExpansions"));
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[13];
  _QWORD v32[15];

  v32[13] = *MEMORY[0x1E0C80C00];
  v31[0] = CFSTR("digestUUID");
  -[ATXDigestGroupEngagementMetric digestUUID](self, "digestUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v3;
  v32[0] = v3;
  v31[1] = CFSTR("bundleId");
  -[ATXDigestGroupEngagementMetric bundleId](self, "bundleId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v30 = v4;
  v23 = (void *)v5;
  v32[1] = v5;
  v31[2] = CFSTR("secureBundleId");
  -[ATXDigestGroupEngagementMetric bundleId](self, "bundleId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ATXDigestGroupEngagementMetric bundleId](self, "bundleId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v8;
  }
  v28 = (void *)v7;
  v29 = v6;
  v25 = (void *)v8;
  v32[2] = v8;
  v31[3] = CFSTR("section");
  -[ATXDigestGroupEngagementMetric section](self, "section");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v9;
  v32[3] = v9;
  v31[4] = CFSTR("sectionPosition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric sectionPosition](self, "sectionPosition"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v26;
  v31[5] = CFSTR("sectionSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric sectionSize](self, "sectionSize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v11;
  v31[6] = CFSTR("numNotifications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric numNotifications](self, "numNotifications"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v12;
  v31[7] = CFSTR("hasImage");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXDigestGroupEngagementMetric hasImage](self, "hasImage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v13;
  v31[8] = CFSTR("groupScore");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXDigestGroupEngagementMetric groupScore](self, "groupScore");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v15;
  v31[9] = CFSTR("numEngagementsInUpcoming");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric numEngagementsInUpcoming](self, "numEngagementsInUpcoming"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[9] = v16;
  v31[10] = CFSTR("numEngagementsInScheduled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric numEngagementsInScheduled](self, "numEngagementsInScheduled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[10] = v17;
  v31[11] = CFSTR("numEngagementsAfterExpiration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[11] = v18;
  v31[12] = CFSTR("numExpansions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric numExpansions](self, "numExpansions"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[12] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  if (v28)

  if (!v29)
  if (!v30)

  return v20;
}

- (NSString)digestUUID
{
  return self->_digestUUID;
}

- (void)setDigestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_digestUUID, a3);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
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

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (void)setHasImage:(BOOL)a3
{
  self->_hasImage = a3;
}

- (double)groupScore
{
  return self->_groupScore;
}

- (void)setGroupScore:(double)a3
{
  self->_groupScore = a3;
}

- (unint64_t)numEngagementsInUpcoming
{
  return self->_numEngagementsInUpcoming;
}

- (void)setNumEngagementsInUpcoming:(unint64_t)a3
{
  self->_numEngagementsInUpcoming = a3;
}

- (unint64_t)numEngagementsInScheduled
{
  return self->_numEngagementsInScheduled;
}

- (void)setNumEngagementsInScheduled:(unint64_t)a3
{
  self->_numEngagementsInScheduled = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_digestUUID, 0);
}

@end
