@implementation CHSToolSupportService

- (CHSToolSupportService)init
{
  void *v3;
  CHSToolSupportService *v4;

  +[CHSToolServiceConnection sharedInstance](CHSToolServiceConnection, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CHSToolSupportService initWithConnection:](self, "initWithConnection:", v3);

  return v4;
}

- (CHSToolSupportService)initWithConnection:(id)a3
{
  id v5;
  CHSToolSupportService *v6;
  CHSToolSupportService *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSToolSupportService;
  v6 = -[CHSToolSupportService init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void)cacheDescriptorsForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__CHSToolSupportService_cacheDescriptorsForBundleIdentifier_completion___block_invoke;
  v8[3] = &unk_1E2A5B810;
  v9 = v6;
  v7 = v6;
  -[CHSToolSupportService reloadDescriptorsForExtensionBundleIdentifier:completion:](self, "reloadDescriptorsForExtensionBundleIdentifier:completion:", a3, v8);

}

void __72__CHSToolSupportService_cacheDescriptorsForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v9)
  {
    objc_msgSend(v9, "orderedDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extensionBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v8);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)reloadDescriptorsForExtensionBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  CHSToolServiceConnection *connection;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  connection = self->_connection;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__CHSToolSupportService_reloadDescriptorsForExtensionBundleIdentifier_completion___block_invoke;
  v9[3] = &unk_1E2A5B810;
  v10 = v6;
  v8 = v6;
  -[CHSToolServiceConnection refreshDescriptorsForExtensionBundleIdentifier:completion:](connection, "refreshDescriptorsForExtensionBundleIdentifier:completion:", a3, v9);

}

uint64_t __82__CHSToolSupportService_reloadDescriptorsForExtensionBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetCaches:(unint64_t)a3 completion:(id)a4
{
  -[CHSToolServiceConnection resetCaches:completion:](self->_connection, "resetCaches:completion:", a3, a4);
}

- (void)allCachedSnapshotURLsWithCompletion:(id)a3
{
  -[CHSToolServiceConnection allCachedSnapshotURLsWithCompletion:](self->_connection, "allCachedSnapshotURLsWithCompletion:", a3);
}

- (void)listStateCaptureIdentifiersWithCompletion:(id)a3
{
  -[CHSToolServiceConnection listStateCaptureIdentifiersWithCompletion:](self->_connection, "listStateCaptureIdentifiersWithCompletion:", a3);
}

- (void)fetchStateWithCompletion:(id)a3
{
  -[CHSToolServiceConnection fetchStateWithCompletion:](self->_connection, "fetchStateWithCompletion:", a3);
}

- (void)fetchStateForItemWithIdentifier:(id)a3 completion:(id)a4
{
  -[CHSToolServiceConnection fetchStateForItemWithIdentifier:completion:](self->_connection, "fetchStateForItemWithIdentifier:completion:", a3, a4);
}

- (void)extensionInfoForBundleIdentifier:(id)a3 completion:(id)a4
{
  -[CHSToolServiceConnection extensionInfoForBundleIdentifier:completion:](self->_connection, "extensionInfoForBundleIdentifier:completion:", a3, a4);
}

- (void)extensionInfo:(id)a3
{
  -[CHSToolServiceConnection extensionInfo:](self->_connection, "extensionInfo:", a3);
}

- (void)widgetsWithTimelines:(id)a3
{
  -[CHSToolServiceConnection widgetsWithTimelines:](self->_connection, "widgetsWithTimelines:", a3);
}

- (void)timelineForWidgetKey:(id)a3 completion:(id)a4
{
  -[CHSToolServiceConnection timelineForWidgetKey:completion:](self->_connection, "timelineForWidgetKey:completion:", a3, a4);
}

- (void)reloadControlsOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
  -[CHSToolServiceConnection reloadControlsOfKind:containedIn:reason:completion:](self->_connection, "reloadControlsOfKind:containedIn:reason:completion:", a3, a4, a5, a6);
}

- (void)reloadTimelinesOfKind:(id)a3 containedIn:(id)a4 reason:(id)a5 completion:(id)a6
{
  -[CHSToolServiceConnection reloadTimelinesOfKind:containedIn:reason:completion:](self->_connection, "reloadTimelinesOfKind:containedIn:reason:completion:", a3, a4, a5, a6);
}

- (void)expireLocationGracePeriods
{
  -[CHSToolServiceConnection expireLocationGracePeriods](self->_connection, "expireLocationGracePeriods");
}

- (void)contentURLForActivityID:(id)a3 completion:(id)a4
{
  -[CHSToolServiceConnection contentURLForActivityID:completion:](self->_connection, "contentURLForActivityID:completion:", a3, a4);
}

- (void)runReaper
{
  -[CHSToolServiceConnection runReaper](self->_connection, "runReaper");
}

- (void)runMigrationReaper
{
  -[CHSToolServiceConnection runMigrationReaper](self->_connection, "runMigrationReaper");
}

- (CHSToolServiceConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
