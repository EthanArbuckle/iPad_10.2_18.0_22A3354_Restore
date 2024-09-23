@implementation ATXMissedNotificationRankingEngagementMetric

- (id)metricName
{
  return CFSTR("com.apple.MissedNotificationBundle.TopLevel.engagementSummary");
}

- (void)populateMetricsFromRanking:(id)a3
{
  id v4;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "digestTimeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstUpcomingViewTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "digestTimeline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstUpcomingViewTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    -[ATXMissedNotificationRankingEngagementMetric setCreatedTimestamp:](self, "setCreatedTimestamp:");

  }
  else
  {
    -[ATXMissedNotificationRankingEngagementMetric setCreatedTimestamp:](self, "setCreatedTimestamp:", 0.0);
  }

  objc_msgSend(v4, "digestTimeline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstScheduledViewTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v4, "digestTimeline");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstScheduledViewTimestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    -[ATXMissedNotificationRankingEngagementMetric setShowTimestamp:](self, "setShowTimestamp:");

  }
  else
  {
    -[ATXMissedNotificationRankingEngagementMetric setShowTimestamp:](self, "setShowTimestamp:", 0.0);
  }

  objc_msgSend(v4, "digestTimeline");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "digestRemovedTimestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v4, "digestTimeline");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "digestRemovedTimestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    -[ATXMissedNotificationRankingEngagementMetric setExpireTimestamp:](self, "setExpireTimestamp:");

  }
  else
  {
    -[ATXMissedNotificationRankingEngagementMetric setExpireTimestamp:](self, "setExpireTimestamp:", 0.0);
  }

  objc_msgSend(v4, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingEngagementMetric setMnbUUID:](self, "setMnbUUID:", v18);

  objc_msgSend(v4, "modeIdString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingEngagementMetric setPreviousModeSemanticType:](self, "setPreviousModeSemanticType:", v19);

  -[ATXMissedNotificationRankingEngagementMetric setNextModeSemanticType:](self, "setNextModeSemanticType:", 0);
  -[ATXMissedNotificationRankingEngagementMetric setNumMessageGroups:](self, "setNumMessageGroups:", 0);
  -[ATXMissedNotificationRankingEngagementMetric setNumOtherGroups:](self, "setNumOtherGroups:", 0);
  -[ATXMissedNotificationRankingEngagementMetric setNumMessageNotifications:](self, "setNumMessageNotifications:", 0);
  -[ATXMissedNotificationRankingEngagementMetric setNumOtherNotifications:](self, "setNumOtherNotifications:", 0);
  -[ATXMissedNotificationRankingEngagementMetric setNumMessageEngagements:](self, "setNumMessageEngagements:", 0);
  -[ATXMissedNotificationRankingEngagementMetric setNumOtherEngagements:](self, "setNumOtherEngagements:", 0);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v4, "rankedGroups", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v25, "digestEngagementTrackingMetrics");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "numEngagementsAfterExpiration");
        v28 = objc_msgSend(v26, "numEngagementsInScheduled") + v27;
        v29 = v28 + objc_msgSend(v26, "numEngagementsInUpcoming");
        if (objc_msgSend(v25, "isCommunicationGroup"))
        {
          -[ATXMissedNotificationRankingEngagementMetric setNumMessageGroups:](self, "setNumMessageGroups:", -[ATXMissedNotificationRankingEngagementMetric numMessageGroups](self, "numMessageGroups") + 1);
          objc_msgSend(v25, "rankedNotifications");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXMissedNotificationRankingEngagementMetric setNumMessageNotifications:](self, "setNumMessageNotifications:", -[ATXMissedNotificationRankingEngagementMetric numMessageNotifications](self, "numMessageNotifications")+ objc_msgSend(v30, "count"));

          -[ATXMissedNotificationRankingEngagementMetric setNumMessageEngagements:](self, "setNumMessageEngagements:", -[ATXMissedNotificationRankingEngagementMetric numMessageEngagements](self, "numMessageEngagements") + v29);
        }
        else
        {
          -[ATXMissedNotificationRankingEngagementMetric setNumOtherGroups:](self, "setNumOtherGroups:", -[ATXMissedNotificationRankingEngagementMetric numOtherGroups](self, "numOtherGroups") + 1);
          objc_msgSend(v25, "rankedNotifications");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXMissedNotificationRankingEngagementMetric setNumOtherNotifications:](self, "setNumOtherNotifications:", -[ATXMissedNotificationRankingEngagementMetric numOtherNotifications](self, "numOtherNotifications")+ objc_msgSend(v31, "count"));

          -[ATXMissedNotificationRankingEngagementMetric setNumOtherEngagements:](self, "setNumOtherEngagements:", -[ATXMissedNotificationRankingEngagementMetric numOtherEngagements](self, "numOtherEngagements") + v29);
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v22);
  }

  objc_msgSend(v4, "digestEngagementTrackingMetrics");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingEngagementMetric setNumEngagementsInUpcoming:](self, "setNumEngagementsInUpcoming:", objc_msgSend(v32, "numEngagementsInUpcoming"));

  objc_msgSend(v4, "digestEngagementTrackingMetrics");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingEngagementMetric setNumEngagementsAfterShow:](self, "setNumEngagementsAfterShow:", objc_msgSend(v33, "numEngagementsInScheduled"));

  objc_msgSend(v4, "digestEngagementTrackingMetrics");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingEngagementMetric setNumEngagementsAfterExpiration:](self, "setNumEngagementsAfterExpiration:", objc_msgSend(v34, "numEngagementsAfterExpiration"));

  objc_msgSend(v4, "digestEngagementTrackingMetrics");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMissedNotificationRankingEngagementMetric setNumExpansions:](self, "setNumExpansions:", objc_msgSend(v35, "numExpansions"));

}

- (id)coreAnalyticsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
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
  void *v31;
  _QWORD v32[16];
  _QWORD v33[18];

  v33[16] = *MEMORY[0x1E0C80C00];
  v32[0] = CFSTR("createdTimestamp");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXMissedNotificationRankingEngagementMetric createdTimestamp](self, "createdTimestamp");
  objc_msgSend(v3, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v31;
  v32[1] = CFSTR("showTimestamp");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXMissedNotificationRankingEngagementMetric expireTimestamp](self, "expireTimestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v30;
  v32[2] = CFSTR("expireTimestamp");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[ATXMissedNotificationRankingEngagementMetric expireTimestamp](self, "expireTimestamp");
  objc_msgSend(v5, "numberWithDouble:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v29;
  v32[3] = CFSTR("mnbUUID");
  -[ATXMissedNotificationRankingEngagementMetric mnbUUID](self, "mnbUUID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v6;
  v33[3] = v6;
  v32[4] = CFSTR("previousModeSemanticType");
  -[ATXMissedNotificationRankingEngagementMetric previousModeSemanticType](self, "previousModeSemanticType");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v27 = v9;
  v28 = v7;
  v23 = (void *)v8;
  v33[4] = v8;
  v32[5] = CFSTR("nextModeSemanticType");
  -[ATXMissedNotificationRankingEngagementMetric nextModeSemanticType](self, "nextModeSemanticType");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v33[5] = v10;
  v32[6] = CFSTR("numMessageGroups");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numMessageGroups](self, "numMessageGroups", v10));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v26;
  v32[7] = CFSTR("numOtherGroups");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numOtherGroups](self, "numOtherGroups"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v25;
  v32[8] = CFSTR("numMessageNotifications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numMessageNotifications](self, "numMessageNotifications"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[8] = v12;
  v32[9] = CFSTR("numOtherNotifications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numOtherNotifications](self, "numOtherNotifications"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[9] = v13;
  v32[10] = CFSTR("numMessageEngagements");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numMessageEngagements](self, "numMessageEngagements"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[10] = v14;
  v32[11] = CFSTR("numOtherEngagements");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numOtherEngagements](self, "numOtherEngagements"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[11] = v15;
  v32[12] = CFSTR("numEngagementsInUpcoming");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numEngagementsInUpcoming](self, "numEngagementsInUpcoming"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[12] = v16;
  v32[13] = CFSTR("numEngagementsAfterShow");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numEngagementsAfterShow](self, "numEngagementsAfterShow"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[13] = v17;
  v32[14] = CFSTR("numEngagementsAfterExpiration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v33[14] = v18;
  v32[15] = CFSTR("numExpansions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numExpansions](self, "numExpansions"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[15] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  if (!v27)

  if (!v28)
  return v20;
}

- (double)createdTimestamp
{
  return self->_createdTimestamp;
}

- (void)setCreatedTimestamp:(double)a3
{
  self->_createdTimestamp = a3;
}

- (double)showTimestamp
{
  return self->_showTimestamp;
}

- (void)setShowTimestamp:(double)a3
{
  self->_showTimestamp = a3;
}

- (double)expireTimestamp
{
  return self->_expireTimestamp;
}

- (void)setExpireTimestamp:(double)a3
{
  self->_expireTimestamp = a3;
}

- (NSString)mnbUUID
{
  return self->_mnbUUID;
}

- (void)setMnbUUID:(id)a3
{
  objc_storeStrong((id *)&self->_mnbUUID, a3);
}

- (NSString)previousModeSemanticType
{
  return self->_previousModeSemanticType;
}

- (void)setPreviousModeSemanticType:(id)a3
{
  objc_storeStrong((id *)&self->_previousModeSemanticType, a3);
}

- (NSString)nextModeSemanticType
{
  return self->_nextModeSemanticType;
}

- (void)setNextModeSemanticType:(id)a3
{
  objc_storeStrong((id *)&self->_nextModeSemanticType, a3);
}

- (unint64_t)numMessageGroups
{
  return self->_numMessageGroups;
}

- (void)setNumMessageGroups:(unint64_t)a3
{
  self->_numMessageGroups = a3;
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

- (unint64_t)numOtherNotifications
{
  return self->_numOtherNotifications;
}

- (void)setNumOtherNotifications:(unint64_t)a3
{
  self->_numOtherNotifications = a3;
}

- (unint64_t)numMessageEngagements
{
  return self->_numMessageEngagements;
}

- (void)setNumMessageEngagements:(unint64_t)a3
{
  self->_numMessageEngagements = a3;
}

- (unint64_t)numOtherEngagements
{
  return self->_numOtherEngagements;
}

- (void)setNumOtherEngagements:(unint64_t)a3
{
  self->_numOtherEngagements = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextModeSemanticType, 0);
  objc_storeStrong((id *)&self->_previousModeSemanticType, 0);
  objc_storeStrong((id *)&self->_mnbUUID, 0);
}

@end
