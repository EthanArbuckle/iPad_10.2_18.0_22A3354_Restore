@implementation ATXModeConfigurationUIFlowMetric

- (id)metricName
{
  return CFSTR("com.apple.ModeConfiguration.ConfigurationEvent");
}

- (id)coreAnalyticsDictionary
{
  uint64_t v3;
  uint64_t v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[15];
  _QWORD v26[17];

  v26[15] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("stableModeID");
  -[ATXModeConfigurationUIFlowMetric modeUUID](self, "modeUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[ATXModeConfigurationUIFlowMetric modeUUID](self, "modeUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v3;
  }
  v17 = (void *)v3;
  v26[0] = v3;
  v25[1] = CFSTR("modeSemanticType");
  -[ATXModeConfigurationUIFlowMetric modeSemanticType](self, "modeSemanticType");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v4;
  v26[1] = v4;
  v25[2] = CFSTR("modeConfigurationUI");
  -[ATXModeConfigurationUIFlowMetric modeConfigurationUI](self, "modeConfigurationUI");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v22;
  v25[3] = CFSTR("numAppsAdded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numAppsAdded](self, "numAppsAdded"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v21;
  v25[4] = CFSTR("numAppsRemoved");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numAppsRemoved](self, "numAppsRemoved"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v20;
  v25[5] = CFSTR("numAppsSuggested");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numAppsSuggested](self, "numAppsSuggested"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v19;
  v25[6] = CFSTR("numExistingAllowedApps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numExistingAllowedApps](self, "numExistingAllowedApps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v18;
  v25[7] = CFSTR("numSuggestedAppsAdded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numSuggestedAppsAdded](self, "numSuggestedAppsAdded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v6;
  v25[8] = CFSTR("numSuggestedAppsRemoved");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numSuggestedAppsRemoved](self, "numSuggestedAppsRemoved"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v7;
  v25[9] = CFSTR("numContactsAdded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numContactsAdded](self, "numContactsAdded"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[9] = v8;
  v25[10] = CFSTR("numContactsRemoved");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numContactsRemoved](self, "numContactsRemoved"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[10] = v9;
  v25[11] = CFSTR("numContactsSuggested");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numContactsSuggested](self, "numContactsSuggested"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[11] = v10;
  v25[12] = CFSTR("numExistingAllowedContacts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numExistingAllowedContacts](self, "numExistingAllowedContacts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[12] = v11;
  v25[13] = CFSTR("numSuggestedContactsAdded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numSuggestedContactsAdded](self, "numSuggestedContactsAdded"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[13] = v12;
  v25[14] = CFSTR("numSuggestedContactsRemoved");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXModeConfigurationUIFlowMetric numSuggestedContactsRemoved](self, "numSuggestedContactsRemoved"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[14] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  if (v24)

  return v14;
}

- (NSString)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(id)a3
{
  objc_storeStrong((id *)&self->_modeSemanticType, a3);
}

- (NSString)modeUUID
{
  return self->_modeUUID;
}

- (void)setModeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_modeUUID, a3);
}

- (NSString)modeConfigurationUI
{
  return self->_modeConfigurationUI;
}

- (void)setModeConfigurationUI:(id)a3
{
  objc_storeStrong((id *)&self->_modeConfigurationUI, a3);
}

- (unint64_t)numAppsAdded
{
  return self->_numAppsAdded;
}

- (void)setNumAppsAdded:(unint64_t)a3
{
  self->_numAppsAdded = a3;
}

- (unint64_t)numAppsRemoved
{
  return self->_numAppsRemoved;
}

- (void)setNumAppsRemoved:(unint64_t)a3
{
  self->_numAppsRemoved = a3;
}

- (unint64_t)numAppsSuggested
{
  return self->_numAppsSuggested;
}

- (void)setNumAppsSuggested:(unint64_t)a3
{
  self->_numAppsSuggested = a3;
}

- (unint64_t)numExistingAllowedApps
{
  return self->_numExistingAllowedApps;
}

- (void)setNumExistingAllowedApps:(unint64_t)a3
{
  self->_numExistingAllowedApps = a3;
}

- (unint64_t)numSuggestedAppsAdded
{
  return self->_numSuggestedAppsAdded;
}

- (void)setNumSuggestedAppsAdded:(unint64_t)a3
{
  self->_numSuggestedAppsAdded = a3;
}

- (unint64_t)numSuggestedAppsRemoved
{
  return self->_numSuggestedAppsRemoved;
}

- (void)setNumSuggestedAppsRemoved:(unint64_t)a3
{
  self->_numSuggestedAppsRemoved = a3;
}

- (unint64_t)numContactsAdded
{
  return self->_numContactsAdded;
}

- (void)setNumContactsAdded:(unint64_t)a3
{
  self->_numContactsAdded = a3;
}

- (unint64_t)numContactsRemoved
{
  return self->_numContactsRemoved;
}

- (void)setNumContactsRemoved:(unint64_t)a3
{
  self->_numContactsRemoved = a3;
}

- (unint64_t)numContactsSuggested
{
  return self->_numContactsSuggested;
}

- (void)setNumContactsSuggested:(unint64_t)a3
{
  self->_numContactsSuggested = a3;
}

- (unint64_t)numExistingAllowedContacts
{
  return self->_numExistingAllowedContacts;
}

- (void)setNumExistingAllowedContacts:(unint64_t)a3
{
  self->_numExistingAllowedContacts = a3;
}

- (unint64_t)numSuggestedContactsAdded
{
  return self->_numSuggestedContactsAdded;
}

- (void)setNumSuggestedContactsAdded:(unint64_t)a3
{
  self->_numSuggestedContactsAdded = a3;
}

- (unint64_t)numSuggestedContactsRemoved
{
  return self->_numSuggestedContactsRemoved;
}

- (void)setNumSuggestedContactsRemoved:(unint64_t)a3
{
  self->_numSuggestedContactsRemoved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConfigurationUI, 0);
  objc_storeStrong((id *)&self->_modeUUID, 0);
  objc_storeStrong((id *)&self->_modeSemanticType, 0);
}

@end
