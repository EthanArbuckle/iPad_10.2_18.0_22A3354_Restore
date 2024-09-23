@implementation CNUIUserActionContext

- (CNUIUserActionContext)initWithContactStore:(id)a3 applicationWorkspace:(id)a4
{
  id v6;
  id v7;
  CNUIUserActionContext *v8;
  _CNUIUserActionCurator *v9;
  CNUIUserActionCurator *actionCurator;
  CNUIUserActionContext *v11;

  v6 = a3;
  v7 = a4;
  v8 = -[CNUIUserActionContext init](self, "init");
  if (v8)
  {
    v9 = -[_CNUIUserActionCurator initWithContactStore:applicationWorkspace:]([_CNUIUserActionCurator alloc], "initWithContactStore:applicationWorkspace:", v6, v7);
    actionCurator = v8->_actionCurator;
    v8->_actionCurator = (CNUIUserActionCurator *)v9;

    v11 = v8;
  }

  return v8;
}

- (CNUIUserActionContext)init
{
  CNUIUserActionContext *v2;
  CNUIUserActionWorkspaceURLOpener *v3;
  CNUIUserActionURLOpener *urlOpener;
  _CNUIUserActionUserActivityOpener *v5;
  CNUIUserActionUserActivityOpener *userActivityOpener;
  _CNUIUserActionDialRequestOpener *v7;
  CNUIUserActionDialRequestOpener *dialRequestOpener;
  CNUIDefaultUserActionRecorder *v9;
  CNUIUserActionRecorder *actionRecorder;
  _CNUIUserActionCurator *v11;
  CNUIUserActionCurator *actionCurator;
  CNUIUserActionContext *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CNUIUserActionContext;
  v2 = -[CNUIUserActionContext init](&v15, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CNUIUserActionWorkspaceURLOpener);
    urlOpener = v2->_urlOpener;
    v2->_urlOpener = (CNUIUserActionURLOpener *)v3;

    v5 = objc_alloc_init(_CNUIUserActionUserActivityOpener);
    userActivityOpener = v2->_userActivityOpener;
    v2->_userActivityOpener = (CNUIUserActionUserActivityOpener *)v5;

    v7 = objc_alloc_init(_CNUIUserActionDialRequestOpener);
    dialRequestOpener = v2->_dialRequestOpener;
    v2->_dialRequestOpener = (CNUIUserActionDialRequestOpener *)v7;

    v9 = objc_alloc_init(CNUIDefaultUserActionRecorder);
    actionRecorder = v2->_actionRecorder;
    v2->_actionRecorder = (CNUIUserActionRecorder *)v9;

    v11 = objc_alloc_init(_CNUIUserActionCurator);
    actionCurator = v2->_actionCurator;
    v2->_actionCurator = (CNUIUserActionCurator *)v11;

    v13 = v2;
  }

  return v2;
}

+ (id)contextWithExtensionContext:(id)a3
{
  id v3;
  CNUIUserActionContext *v4;
  CNUIUserActionExtensionURLOpener *v5;
  _CNUIUserActionUserActivityOpener *v6;
  CNUIDefaultUserActionRecorder *v7;
  _CNUIUserActionCurator *v8;

  v3 = a3;
  v4 = objc_alloc_init(CNUIUserActionContext);
  v5 = -[CNUIUserActionExtensionURLOpener initWithExtensionContext:]([CNUIUserActionExtensionURLOpener alloc], "initWithExtensionContext:", v3);

  -[CNUIUserActionContext setUrlOpener:](v4, "setUrlOpener:", v5);
  v6 = objc_alloc_init(_CNUIUserActionUserActivityOpener);
  -[CNUIUserActionContext setUserActivityOpener:](v4, "setUserActivityOpener:", v6);

  v7 = objc_alloc_init(CNUIDefaultUserActionRecorder);
  -[CNUIUserActionContext setActionRecorder:](v4, "setActionRecorder:", v7);

  v8 = objc_alloc_init(_CNUIUserActionCurator);
  -[CNUIUserActionContext setActionCurator:](v4, "setActionCurator:", v8);

  return v4;
}

+ (id)makeDefaultContext
{
  CNUIUserActionContext *v2;
  CNUIUserActionWorkspaceURLOpener *v3;
  _CNUIUserActionUserActivityOpener *v4;
  CNUIDefaultUserActionRecorder *v5;
  _CNUIUserActionCurator *v6;

  v2 = objc_alloc_init(CNUIUserActionContext);
  v3 = objc_alloc_init(CNUIUserActionWorkspaceURLOpener);
  -[CNUIUserActionContext setUrlOpener:](v2, "setUrlOpener:", v3);

  v4 = objc_alloc_init(_CNUIUserActionUserActivityOpener);
  -[CNUIUserActionContext setUserActivityOpener:](v2, "setUserActivityOpener:", v4);

  v5 = objc_alloc_init(CNUIDefaultUserActionRecorder);
  -[CNUIUserActionContext setActionRecorder:](v2, "setActionRecorder:", v5);

  v6 = objc_alloc_init(_CNUIUserActionCurator);
  -[CNUIUserActionContext setActionCurator:](v2, "setActionCurator:", v6);

  return v2;
}

- (CNUIUserActionURLOpener)urlOpener
{
  return self->_urlOpener;
}

- (void)setUrlOpener:(id)a3
{
  objc_storeStrong((id *)&self->_urlOpener, a3);
}

- (CNUIUserActionUserActivityOpener)userActivityOpener
{
  return self->_userActivityOpener;
}

- (void)setUserActivityOpener:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityOpener, a3);
}

- (CNUIUserActionDialRequestOpener)dialRequestOpener
{
  return self->_dialRequestOpener;
}

- (void)setDialRequestOpener:(id)a3
{
  objc_storeStrong((id *)&self->_dialRequestOpener, a3);
}

- (CNUIUserActionRecorder)actionRecorder
{
  return self->_actionRecorder;
}

- (void)setActionRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_actionRecorder, a3);
}

- (CNUIUserActionCurator)actionCurator
{
  return self->_actionCurator;
}

- (void)setActionCurator:(id)a3
{
  objc_storeStrong((id *)&self->_actionCurator, a3);
}

- (NSString)channelIdentifier
{
  return self->_channelIdentifier;
}

- (void)setChannelIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BSServiceConnectionEndpoint)connectionEndpoint
{
  return self->_connectionEndpoint;
}

- (void)setConnectionEndpoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isOriginatingFromFavorites
{
  return self->_isOriginatingFromFavorites;
}

- (void)setIsOriginatingFromFavorites:(BOOL)a3
{
  self->_isOriginatingFromFavorites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionEndpoint, 0);
  objc_storeStrong((id *)&self->_channelIdentifier, 0);
  objc_storeStrong((id *)&self->_actionCurator, 0);
  objc_storeStrong((id *)&self->_actionRecorder, 0);
  objc_storeStrong((id *)&self->_dialRequestOpener, 0);
  objc_storeStrong((id *)&self->_userActivityOpener, 0);
  objc_storeStrong((id *)&self->_urlOpener, 0);
}

@end
