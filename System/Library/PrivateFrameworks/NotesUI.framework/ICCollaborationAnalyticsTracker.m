@implementation ICCollaborationAnalyticsTracker

- (ICCollaborationAnalyticsTracker)initWithDelegate:(id)a3
{
  id v4;
  ICCollaborationAnalyticsTracker *v5;
  ICCollaborationAnalyticsTrackerInternal *v6;
  ICCollaborationAnalyticsTrackerInternal *collaborationAnalyticsTracker;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCollaborationAnalyticsTracker;
  v5 = -[ICCollaborationAnalyticsTracker init](&v9, sel_init);
  if (v5)
  {
    v6 = -[ICCollaborationAnalyticsTrackerInternal initWithDelegate:]([ICCollaborationAnalyticsTrackerInternal alloc], "initWithDelegate:", v4);
    collaborationAnalyticsTracker = v5->_collaborationAnalyticsTracker;
    v5->_collaborationAnalyticsTracker = v6;

  }
  return v5;
}

- (void)trackShare:(id)a3 forNote:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICCollaborationAnalyticsTracker collaborationAnalyticsTracker](self, "collaborationAnalyticsTracker");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackShare:forNote:", v7, v6);

}

- (void)saveNewShare:(id)a3 forNote:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICCollaborationAnalyticsTracker collaborationAnalyticsTracker](self, "collaborationAnalyticsTracker");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveNewShare:forNote:", v7, v6);

}

- (void)saveActivityType:(id)a3 isCollaborationSelected:(BOOL)a4 error:(id)a5 completed:(BOOL)a6 forNote:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  v9 = a4;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  -[ICCollaborationAnalyticsTracker collaborationAnalyticsTracker](self, "collaborationAnalyticsTracker");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "saveActivityType:isCollaborationSelected:error:completed:forNote:", v14, v9, v13, v7, v12);

}

- (void)unshareNote:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICCollaborationAnalyticsTracker collaborationAnalyticsTracker](self, "collaborationAnalyticsTracker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unshareNote:", v4);

}

- (ICCollaborationAnalyticsTrackerInternal)collaborationAnalyticsTracker
{
  return self->_collaborationAnalyticsTracker;
}

- (void)setCollaborationAnalyticsTracker:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationAnalyticsTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationAnalyticsTracker, 0);
}

@end
