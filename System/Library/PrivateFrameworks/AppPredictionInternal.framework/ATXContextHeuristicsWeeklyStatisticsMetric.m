@implementation ATXContextHeuristicsWeeklyStatisticsMetric

- (id)metricName
{
  return CFSTR("com.apple.zkw.weeklyStatistics");
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
  void *v16;
  void *v17;
  id v18;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[25];
  _QWORD v39[27];

  v39[25] = *MEMORY[0x1E0C80C00];
  v38[0] = CFSTR("areSpotlightRecentsEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXContextHeuristicsWeeklyStatisticsMetric areSpotlightRecentsEnabled](self, "areSpotlightRecentsEnabled"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v37;
  v38[1] = CFSTR("areSpotlightSuggestionsEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXContextHeuristicsWeeklyStatisticsMetric areSpotlightSuggestionsEnabled](self, "areSpotlightSuggestionsEnabled"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v36;
  v38[2] = CFSTR("numAppSuggestionsVisibleInSpotlight");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numAppSuggestionsVisibleInSpotlight](self, "numAppSuggestionsVisibleInSpotlight"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v35;
  v38[3] = CFSTR("numAppLibraryAppSuggestionTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numAppLibraryAppSuggestionTaps](self, "numAppLibraryAppSuggestionTaps"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v34;
  v38[4] = CFSTR("numAppLibraryAppTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numAppLibraryAppTaps](self, "numAppLibraryAppTaps"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v33;
  v38[5] = CFSTR("numHomescreenAppSuggestionTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numHomescreenAppSuggestionTaps](self, "numHomescreenAppSuggestionTaps"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v32;
  v38[6] = CFSTR("numHomescreenAppTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numHomescreenAppTaps](self, "numHomescreenAppTaps"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v31;
  v38[7] = CFSTR("numLeftOfHomeAppSuggestionTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numLeftOfHomeAppSuggestionTaps](self, "numLeftOfHomeAppSuggestionTaps"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v30;
  v38[8] = CFSTR("numSpotlightAppSuggestionTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightAppSuggestionTaps](self, "numSpotlightAppSuggestionTaps"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v29;
  v38[9] = CFSTR("numSpotlightSearchAppTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightSearchAppTaps](self, "numSpotlightSearchAppTaps"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v28;
  v38[10] = CFSTR("numSpotlightActionSuggestionTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightActionSuggestionTaps](self, "numSpotlightActionSuggestionTaps"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[10] = v27;
  v38[11] = CFSTR("numRecentsTaps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numRecentsTaps](self, "numRecentsTaps"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[11] = v26;
  v38[12] = CFSTR("numSpotlightSearches");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightSearches](self, "numSpotlightSearches"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[12] = v25;
  v38[13] = CFSTR("numSpotlightViews");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightViews](self, "numSpotlightViews"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[13] = v24;
  v38[14] = CFSTR("numSpotlightUniqueDayVisits");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numSpotlightUniqueDayVisits](self, "numSpotlightUniqueDayVisits"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39[14] = v23;
  v38[15] = CFSTR("percentageOfTimeSpotlightActionSuggestionAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric percentageOfTimeSpotlightActionSuggestionAvailable](self, "percentageOfTimeSpotlightActionSuggestionAvailable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[15] = v22;
  v38[16] = CFSTR("numCalendarEvents");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numCalendarEvents](self, "numCalendarEvents"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[16] = v21;
  v38[17] = CFSTR("numCalendarEventsWithLink");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numCalendarEventsWithLink](self, "numCalendarEventsWithLink"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[17] = v20;
  v38[18] = CFSTR("numCalendarEventsWithLocation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXContextHeuristicsWeeklyStatisticsMetric numCalendarEventsWithLocation](self, "numCalendarEventsWithLocation"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[18] = v19;
  v38[19] = CFSTR("trialDeploymentId");
  -[ATXContextHeuristicsWeeklyStatisticsMetric trialDeploymentId](self, "trialDeploymentId");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v3;
  v39[19] = v3;
  v38[20] = CFSTR("trialExperimentId");
  -[ATXContextHeuristicsWeeklyStatisticsMetric trialExperimentId](self, "trialExperimentId");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v39[20] = v5;
  v38[21] = CFSTR("trialTreatmentId");
  -[ATXContextHeuristicsWeeklyStatisticsMetric trialTreatmentId](self, "trialTreatmentId", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[21] = v8;
  v38[22] = CFSTR("atxTrialDeploymentId");
  -[ATXContextHeuristicsWeeklyStatisticsMetric atxTrialDeploymentId](self, "atxTrialDeploymentId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[22] = v10;
  v38[23] = CFSTR("atxTrialExperimentId");
  -[ATXContextHeuristicsWeeklyStatisticsMetric atxTrialExperimentId](self, "atxTrialExperimentId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[23] = v12;
  v38[24] = CFSTR("atxTrialTreatmentId");
  -[ATXContextHeuristicsWeeklyStatisticsMetric atxTrialTreatmentId](self, "atxTrialTreatmentId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[24] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 25);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)

  if (!v11)
  if (!v9)

  if (!v7)
  if (!v6)

  if (!v4)
  return v18;
}

- (BOOL)areSpotlightRecentsEnabled
{
  return self->_areSpotlightRecentsEnabled;
}

- (void)setAreSpotlightRecentsEnabled:(BOOL)a3
{
  self->_areSpotlightRecentsEnabled = a3;
}

- (BOOL)areSpotlightSuggestionsEnabled
{
  return self->_areSpotlightSuggestionsEnabled;
}

- (void)setAreSpotlightSuggestionsEnabled:(BOOL)a3
{
  self->_areSpotlightSuggestionsEnabled = a3;
}

- (unint64_t)numAppSuggestionsVisibleInSpotlight
{
  return self->_numAppSuggestionsVisibleInSpotlight;
}

- (void)setNumAppSuggestionsVisibleInSpotlight:(unint64_t)a3
{
  self->_numAppSuggestionsVisibleInSpotlight = a3;
}

- (unint64_t)numAppLibraryAppSuggestionTaps
{
  return self->_numAppLibraryAppSuggestionTaps;
}

- (void)setNumAppLibraryAppSuggestionTaps:(unint64_t)a3
{
  self->_numAppLibraryAppSuggestionTaps = a3;
}

- (unint64_t)numAppLibraryAppTaps
{
  return self->_numAppLibraryAppTaps;
}

- (void)setNumAppLibraryAppTaps:(unint64_t)a3
{
  self->_numAppLibraryAppTaps = a3;
}

- (unint64_t)numHomescreenAppSuggestionTaps
{
  return self->_numHomescreenAppSuggestionTaps;
}

- (void)setNumHomescreenAppSuggestionTaps:(unint64_t)a3
{
  self->_numHomescreenAppSuggestionTaps = a3;
}

- (unint64_t)numHomescreenAppTaps
{
  return self->_numHomescreenAppTaps;
}

- (void)setNumHomescreenAppTaps:(unint64_t)a3
{
  self->_numHomescreenAppTaps = a3;
}

- (unint64_t)numLeftOfHomeAppSuggestionTaps
{
  return self->_numLeftOfHomeAppSuggestionTaps;
}

- (void)setNumLeftOfHomeAppSuggestionTaps:(unint64_t)a3
{
  self->_numLeftOfHomeAppSuggestionTaps = a3;
}

- (unint64_t)numSpotlightAppSuggestionTaps
{
  return self->_numSpotlightAppSuggestionTaps;
}

- (void)setNumSpotlightAppSuggestionTaps:(unint64_t)a3
{
  self->_numSpotlightAppSuggestionTaps = a3;
}

- (unint64_t)numSpotlightSearchAppTaps
{
  return self->_numSpotlightSearchAppTaps;
}

- (void)setNumSpotlightSearchAppTaps:(unint64_t)a3
{
  self->_numSpotlightSearchAppTaps = a3;
}

- (unint64_t)numSpotlightActionSuggestionTaps
{
  return self->_numSpotlightActionSuggestionTaps;
}

- (void)setNumSpotlightActionSuggestionTaps:(unint64_t)a3
{
  self->_numSpotlightActionSuggestionTaps = a3;
}

- (unint64_t)numRecentsTaps
{
  return self->_numRecentsTaps;
}

- (void)setNumRecentsTaps:(unint64_t)a3
{
  self->_numRecentsTaps = a3;
}

- (unint64_t)numSpotlightSearches
{
  return self->_numSpotlightSearches;
}

- (void)setNumSpotlightSearches:(unint64_t)a3
{
  self->_numSpotlightSearches = a3;
}

- (unint64_t)numSpotlightViews
{
  return self->_numSpotlightViews;
}

- (void)setNumSpotlightViews:(unint64_t)a3
{
  self->_numSpotlightViews = a3;
}

- (unint64_t)numSpotlightUniqueDayVisits
{
  return self->_numSpotlightUniqueDayVisits;
}

- (void)setNumSpotlightUniqueDayVisits:(unint64_t)a3
{
  self->_numSpotlightUniqueDayVisits = a3;
}

- (unint64_t)percentageOfTimeSpotlightActionSuggestionAvailable
{
  return self->_percentageOfTimeSpotlightActionSuggestionAvailable;
}

- (void)setPercentageOfTimeSpotlightActionSuggestionAvailable:(unint64_t)a3
{
  self->_percentageOfTimeSpotlightActionSuggestionAvailable = a3;
}

- (unint64_t)numCalendarEvents
{
  return self->_numCalendarEvents;
}

- (void)setNumCalendarEvents:(unint64_t)a3
{
  self->_numCalendarEvents = a3;
}

- (unint64_t)numCalendarEventsWithLink
{
  return self->_numCalendarEventsWithLink;
}

- (void)setNumCalendarEventsWithLink:(unint64_t)a3
{
  self->_numCalendarEventsWithLink = a3;
}

- (unint64_t)numCalendarEventsWithLocation
{
  return self->_numCalendarEventsWithLocation;
}

- (void)setNumCalendarEventsWithLocation:(unint64_t)a3
{
  self->_numCalendarEventsWithLocation = a3;
}

- (NSString)trialDeploymentId
{
  return self->_trialDeploymentId;
}

- (void)setTrialDeploymentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)trialExperimentId
{
  return self->_trialExperimentId;
}

- (void)setTrialExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)trialTreatmentId
{
  return self->_trialTreatmentId;
}

- (void)setTrialTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)atxTrialDeploymentId
{
  return self->_atxTrialDeploymentId;
}

- (void)setAtxTrialDeploymentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)atxTrialExperimentId
{
  return self->_atxTrialExperimentId;
}

- (void)setAtxTrialExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)atxTrialTreatmentId
{
  return self->_atxTrialTreatmentId;
}

- (void)setAtxTrialTreatmentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atxTrialTreatmentId, 0);
  objc_storeStrong((id *)&self->_atxTrialExperimentId, 0);
  objc_storeStrong((id *)&self->_atxTrialDeploymentId, 0);
  objc_storeStrong((id *)&self->_trialTreatmentId, 0);
  objc_storeStrong((id *)&self->_trialExperimentId, 0);
  objc_storeStrong((id *)&self->_trialDeploymentId, 0);
}

@end
