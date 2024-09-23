@implementation MusicUIDisplayNowPlayingStateContext

- (MusicUIDisplayNowPlayingStateContext)initWithStateContext:(id)a3
{
  id v4;
  MusicUIDisplayNowPlayingStateContext *v5;
  MusicUIDisplayNowPlayingStateContext *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MusicUIDisplayNowPlayingStateContext;
  v5 = -[MusicUIDisplayNowPlayingStateContext init](&v8, "init");
  v6 = v5;
  if (v5)
    -[MusicUIDisplayNowPlayingStateContext setStateName:](v5, "setStateName:", v4);

  return v6;
}

+ (id)stateContextForNowPlaying
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithStateContext:", CFSTR("nowplaying"));
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p - state: %@, associatedBundleID: %@>"), v5, self, self->_stateName, self->_associatedBundleID));

  return v6;
}

- (NSString)stateName
{
  return self->_stateName;
}

- (void)setStateName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)associatedBundleID
{
  return self->_associatedBundleID;
}

- (void)setAssociatedBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedBundleID, 0);
  objc_storeStrong((id *)&self->_stateName, 0);
}

@end
