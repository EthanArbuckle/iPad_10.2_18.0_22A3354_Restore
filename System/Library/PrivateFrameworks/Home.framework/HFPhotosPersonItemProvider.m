@implementation HFPhotosPersonItemProvider

- (HFPhotosPersonItemProvider)initWithHome:(id)a3 forUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  HFPhotosPersonItemProvider *v11;
  HFPhotosPersonItemProvider *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "hf_allUsersIncludingCurrentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v6, "photosPersonManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15.receiver = self;
    v15.super_class = (Class)HFPhotosPersonItemProvider;
    v11 = -[HFPersonItemProvider initWithHome:personManager:](&v15, sel_initWithHome_personManager_, v7, v10);

    self = v11;
    v12 = self;
  }
  else
  {
    objc_msgSend(v7, "hf_allUsersIncludingCurrentUser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@ %s: home %@ doesn't include user %@. home's users = %@"), self, "-[HFPhotosPersonItemProvider initWithHome:forUser:]", v7, v6, v13);

    v12 = 0;
  }

  return v12;
}

- (HFPhotosPersonItemProvider)initWithHome:(id)a3 personManager:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_forUser_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPersonItemProvider.m"), 106, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFPhotosPersonItemProvider initWithHome:personManager:]",
    v7);

  return 0;
}

@end
