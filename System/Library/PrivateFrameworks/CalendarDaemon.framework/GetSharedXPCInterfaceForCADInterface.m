@implementation GetSharedXPCInterfaceForCADInterface

void __GetSharedXPCInterfaceForCADInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[9];

  v25[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF159B90);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)GetSharedXPCInterfaceForCADInterface___remoteInterface;
  GetSharedXPCInterfaceForCADInterface___remoteInterface = v0;

  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "classesForSelector:argumentIndex:ofReply:", sel_CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply_, 1, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v25[3] = objc_opt_class();
  v25[4] = objc_opt_class();
  v25[5] = objc_opt_class();
  v25[6] = objc_opt_class();
  v25[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setByAddingObjectsFromArray:", v23);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADObject_getRelatedObjectsWithRelationName_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADObjectsExist_reply_, 0, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADObjectsExist_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseFetchObjectChangesForEntityTypes_insideObject_reply_, 3, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseExportICSDataForCalendarItems_options_reply_, 0, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply_, 0, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply_, 1, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseCommitDeletes_updatesAndInserts_options_andFetchChangesSinceTimestamp_withReply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADEventSetInvitationStatus_forEvents_error_, 1, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseImportEvents_fromICSData_intoCalendarsWithIDs_optionsMask_batchSize_reply_, 2, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseImportEvents_fromICSData_intoCalendarsWithIDs_optionsMask_batchSize_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseFetchCalendarItemsWithPredicate_entityType_fetchIdentifier_synchronous_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetAlarmOccurrencesFromAlarmCacheWithReply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetCalendarItemsWithUniqueIdentifier_inCalendar_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetCalendarItemsWithRecurrenceSet_inCalendar_reply_, 1, 1);
  v3 = (void *)GetSharedXPCInterfaceForCADInterface___remoteInterface;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_CADDatabaseSetInitializationOptions_reply_, 0, 0);

  v5 = (void *)GetSharedXPCInterfaceForCADInterface___remoteInterface;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_CADDatabaseConsumeAllChangesUpToToken_except_reply_, 1, 0);

  v11 = (void *)GetSharedXPCInterfaceForCADInterface___remoteInterface;
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_CADDatabaseMarkIndividualChangesConsumed_reply_, 0, 0);

  v17 = (void *)GetSharedXPCInterfaceForCADInterface___remoteInterface;
  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_CADDatabaseFetchChangedObjectIDs_, 3, 1);

  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply_, 1, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetCalendarItemsWithUUIDs_inCalendars_propertiesToLoad_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADRemoveCalendarItemsOlderThanDate_ofType_inSource_reply_, 0, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADSourceGetGrantedDelegatesList_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetAllEventsWithUniqueID_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADObjects_getPropertiesWithNames_reply_, 0, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADObjects_getPropertiesWithNames_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetSourcesWithFaultedProperties_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetCalendarsWithFaultedProperties_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADOccurrenceCacheGetOccurrenceCountsForCalendars_reply_, 0, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply_, 0, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADOccurrenceCacheGetOccurrencesForCalendars_onDay_reply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADOccurrenceCacheDoEvents_haveOccurrencesAfterDate_reply_, 0, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADOccurrenceCacheSearchWithTerm_inCalendars_responseToken_reply_, 1, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADOccurrenceCacheSearchLocationsWithTerm_inCalendars_responseToken_reply_, 1, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetEventsWithErrorsPerSource_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetSharedCalendarInvitationsWithReply_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetResourceChanges_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetInviteReplyNotifications_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetEventNotificationItemsAfterDate_excludingUncheckedCalendars_filteredByShowsNotificationsFlag_reply_, 2, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetNotificationCountForSourceWithExternalIdentifier_excludingDelegateSources_filteredByShowsNotificationsFlag_expanded_reply_, 2, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetInboxRepliedSectionItems_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADOccurrenceCacheSearchLocationsWithTerm_inCalendars_responseToken_reply_, 1, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetDeletableCalendars_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseGetDeletableSources_, 1, 1);
  objc_msgSend((id)GetSharedXPCInterfaceForCADInterface___remoteInterface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_CADDatabaseLoadEventsInCalendar_reply_, 1, 1);

}

@end
