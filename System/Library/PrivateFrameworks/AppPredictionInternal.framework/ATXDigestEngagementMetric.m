@implementation ATXDigestEngagementMetric

- (id)metricName
{
  return CFSTR("com.apple.NotificationDigest.TopLevelDigest.engagementSummary");
}

- (void)populateMetricsFromDigest:(id)a3
{
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
  void *v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  objc_msgSend(v33, "modeIdString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setDigestTimeCategory:](self, "setDigestTimeCategory:", v4);

  objc_msgSend(v33, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setDigestUUID:](self, "setDigestUUID:", v6);

  objc_msgSend(v33, "digestEngagementTrackingMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setNumDigestExpansions:](self, "setNumDigestExpansions:", objc_msgSend(v7, "numDigestExpansions"));

  objc_msgSend(v33, "messageGroups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setNumMessageGroups:](self, "setNumMessageGroups:", objc_msgSend(v8, "count"));

  objc_msgSend(v33, "highlightedGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setNumHighlightedGroups:](self, "setNumHighlightedGroups:", objc_msgSend(v9, "count"));

  objc_msgSend(v33, "rankedGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setNumOtherGroups:](self, "setNumOtherGroups:", objc_msgSend(v10, "count"));

  objc_msgSend(v33, "messageGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1E83CDC18, &__block_literal_global_197);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setNumMessageNotifications:](self, "setNumMessageNotifications:", objc_msgSend(v12, "unsignedIntegerValue"));

  objc_msgSend(v33, "highlightedGroups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1E83CDC18, &__block_literal_global_11_2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setNumHighlightedNotifications:](self, "setNumHighlightedNotifications:", objc_msgSend(v14, "unsignedIntegerValue"));

  objc_msgSend(v33, "rankedGroups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1E83CDC18, &__block_literal_global_12_5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setNumOtherNotifications:](self, "setNumOtherNotifications:", objc_msgSend(v16, "unsignedIntegerValue"));

  objc_msgSend(v33, "digestEngagementTrackingMetrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setNumEngagementsInUpcoming:](self, "setNumEngagementsInUpcoming:", objc_msgSend(v17, "numEngagementsInUpcoming"));

  objc_msgSend(v33, "digestEngagementTrackingMetrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setNumEngagementsInScheduled:](self, "setNumEngagementsInScheduled:", objc_msgSend(v18, "numEngagementsInScheduled"));

  objc_msgSend(v33, "digestEngagementTrackingMetrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setNumEngagementsAfterExpiration:](self, "setNumEngagementsAfterExpiration:", objc_msgSend(v19, "numEngagementsAfterExpiration"));

  objc_msgSend(v33, "digestEngagementTrackingMetrics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXDigestEngagementMetric setNumNotificationGroupExpansions:](self, "setNumNotificationGroupExpansions:", objc_msgSend(v20, "numExpansions"));

  objc_msgSend(v33, "digestTimeline");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstUpcomingViewTimestamp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v33, "digestTimeline");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstUpcomingViewTimestamp");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceReferenceDate");
    -[ATXDigestEngagementMetric setFirstUpcomingViewTimestamp:](self, "setFirstUpcomingViewTimestamp:");

  }
  else
  {
    -[ATXDigestEngagementMetric setFirstUpcomingViewTimestamp:](self, "setFirstUpcomingViewTimestamp:", 0.0);
  }

  objc_msgSend(v33, "digestTimeline");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstScheduledViewTimestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v33, "digestTimeline");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstScheduledViewTimestamp");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSinceReferenceDate");
    -[ATXDigestEngagementMetric setFirstScheduledViewTimestamp:](self, "setFirstScheduledViewTimestamp:");

  }
  else
  {
    -[ATXDigestEngagementMetric setFirstScheduledViewTimestamp:](self, "setFirstScheduledViewTimestamp:", 0.0);
  }

  objc_msgSend(v33, "digestTimeline");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "digestRemovedTimestamp");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    objc_msgSend(v33, "digestTimeline");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "digestRemovedTimestamp");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "timeIntervalSinceReferenceDate");
    -[ATXDigestEngagementMetric setDigestExpirationTimestamp:](self, "setDigestExpirationTimestamp:");

  }
  else
  {
    -[ATXDigestEngagementMetric setDigestExpirationTimestamp:](self, "setDigestExpirationTimestamp:", 0.0);
  }

}

id __55__ATXDigestEngagementMetric_populateMetricsFromDigest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  objc_msgSend(v5, "rankedNotifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v7, "count") + v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __55__ATXDigestEngagementMetric_populateMetricsFromDigest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  objc_msgSend(v5, "rankedNotifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v7, "count") + v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __55__ATXDigestEngagementMetric_populateMetricsFromDigest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  objc_msgSend(v5, "rankedNotifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v7, "count") + v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
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
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[16];
  _QWORD v30[18];

  v30[16] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("digestTimeCategory");
  -[ATXDigestEngagementMetric digestTimeCategory](self, "digestTimeCategory");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v28 = v4;
  v21 = (void *)v3;
  v30[0] = v3;
  v29[1] = CFSTR("digestUUID");
  -[ATXDigestEngagementMetric digestUUID](self, "digestUUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v5;
  v30[1] = v5;
  v29[2] = CFSTR("numDigestExpansions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numDigestExpansions](self, "numDigestExpansions"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v26;
  v29[3] = CFSTR("numMessageGroups");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numMessageGroups](self, "numMessageGroups"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v25;
  v29[4] = CFSTR("numHighlightedGroups");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numHighlightedGroups](self, "numHighlightedGroups"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v24;
  v29[5] = CFSTR("numOtherGroups");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numOtherGroups](self, "numOtherGroups"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v23;
  v29[6] = CFSTR("numMessageNotifications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numMessageNotifications](self, "numMessageNotifications"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v22;
  v29[7] = CFSTR("numHighlightedNotifications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numHighlightedNotifications](self, "numHighlightedNotifications"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v6;
  v29[8] = CFSTR("numOtherNotifications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numOtherNotifications](self, "numOtherNotifications"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v7;
  v29[9] = CFSTR("numEngagementsInUpcoming");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numEngagementsInUpcoming](self, "numEngagementsInUpcoming"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  v29[10] = CFSTR("numEngagementsInScheduled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numEngagementsInScheduled](self, "numEngagementsInScheduled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v9;
  v29[11] = CFSTR("numEngagementsAfterExpiration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[11] = v10;
  v29[12] = CFSTR("numNotificationGroupExpansions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numNotificationGroupExpansions](self, "numNotificationGroupExpansions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[12] = v11;
  v29[13] = CFSTR("firstUpcomingViewTimestamp");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXDigestEngagementMetric firstUpcomingViewTimestamp](self, "firstUpcomingViewTimestamp");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[13] = v13;
  v29[14] = CFSTR("firstScheduledViewTimestamp");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXDigestEngagementMetric firstScheduledViewTimestamp](self, "firstScheduledViewTimestamp");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[14] = v15;
  v29[15] = CFSTR("digestExpirationTimestamp");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXDigestEngagementMetric digestExpirationTimestamp](self, "digestExpirationTimestamp");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[15] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  if (!v28)

  return v18;
}

- (NSString)digestTimeCategory
{
  return self->_digestTimeCategory;
}

- (void)setDigestTimeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_digestTimeCategory, a3);
}

- (NSString)digestUUID
{
  return self->_digestUUID;
}

- (void)setDigestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_digestUUID, a3);
}

- (unint64_t)numDigestExpansions
{
  return self->_numDigestExpansions;
}

- (void)setNumDigestExpansions:(unint64_t)a3
{
  self->_numDigestExpansions = a3;
}

- (unint64_t)numMessageGroups
{
  return self->_numMessageGroups;
}

- (void)setNumMessageGroups:(unint64_t)a3
{
  self->_numMessageGroups = a3;
}

- (unint64_t)numHighlightedGroups
{
  return self->_numHighlightedGroups;
}

- (void)setNumHighlightedGroups:(unint64_t)a3
{
  self->_numHighlightedGroups = a3;
}

- (unint64_t)numOtherGroups
{
  return self->_numOtherGroups;
}

- (void)setNumOtherGroups:(unint64_t)a3
{
  self->_numOtherGroups = a3;
}

- (unint64_t)numMessageNotifications
{
  return self->_numMessageNotifications;
}

- (void)setNumMessageNotifications:(unint64_t)a3
{
  self->_numMessageNotifications = a3;
}

- (unint64_t)numHighlightedNotifications
{
  return self->_numHighlightedNotifications;
}

- (void)setNumHighlightedNotifications:(unint64_t)a3
{
  self->_numHighlightedNotifications = a3;
}

- (unint64_t)numOtherNotifications
{
  return self->_numOtherNotifications;
}

- (void)setNumOtherNotifications:(unint64_t)a3
{
  self->_numOtherNotifications = a3;
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

- (unint64_t)numNotificationGroupExpansions
{
  return self->_numNotificationGroupExpansions;
}

- (void)setNumNotificationGroupExpansions:(unint64_t)a3
{
  self->_numNotificationGroupExpansions = a3;
}

- (double)firstUpcomingViewTimestamp
{
  return self->_firstUpcomingViewTimestamp;
}

- (void)setFirstUpcomingViewTimestamp:(double)a3
{
  self->_firstUpcomingViewTimestamp = a3;
}

- (double)firstScheduledViewTimestamp
{
  return self->_firstScheduledViewTimestamp;
}

- (void)setFirstScheduledViewTimestamp:(double)a3
{
  self->_firstScheduledViewTimestamp = a3;
}

- (double)digestExpirationTimestamp
{
  return self->_digestExpirationTimestamp;
}

- (void)setDigestExpirationTimestamp:(double)a3
{
  self->_digestExpirationTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestUUID, 0);
  objc_storeStrong((id *)&self->_digestTimeCategory, 0);
}

@end
