@implementation HDHealthAppSharingEntryObserver

- (HDHealthAppSharingEntryObserver)initWithProfile:(id)a3
{
  id v4;
  HDHealthAppSharingEntryObserver *v5;
  uint64_t v6;
  HDSummarySharingEntryManager *sharingEntryManager;
  HDHAHealthPluginHostFeedGenerator *v8;
  HDHAHealthPluginHostFeedGenerator *feedGenerator;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDHealthAppSharingEntryObserver;
  v5 = -[HDHealthAppSharingEntryObserver init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "sharingEntryManager");
    v6 = objc_claimAutoreleasedReturnValue();
    sharingEntryManager = v5->_sharingEntryManager;
    v5->_sharingEntryManager = (HDSummarySharingEntryManager *)v6;

    -[HDSummarySharingEntryManager setDelegate:](v5->_sharingEntryManager, "setDelegate:", v5);
    v8 = objc_alloc_init(HDHAHealthPluginHostFeedGenerator);
    feedGenerator = v5->_feedGenerator;
    v5->_feedGenerator = v8;

  }
  return v5;
}

- (void)sharingEntryManager:(id)a3 didJournalEntries:(id)a4
{
  -[HDHAHealthPluginHostFeedGenerator handleJournaledSharingEntries:](self->_feedGenerator, "handleJournaledSharingEntries:", a4);
}

- (HDSummarySharingEntryManager)sharingEntryManager
{
  return self->_sharingEntryManager;
}

- (void)setSharingEntryManager:(id)a3
{
  objc_storeStrong((id *)&self->_sharingEntryManager, a3);
}

- (HDHAHealthPluginHostFeedGenerator)feedGenerator
{
  return self->_feedGenerator;
}

- (void)setFeedGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedGenerator, 0);
  objc_storeStrong((id *)&self->_sharingEntryManager, 0);
}

@end
