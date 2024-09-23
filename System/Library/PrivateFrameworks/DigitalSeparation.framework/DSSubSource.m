@implementation DSSubSource

- (id)init:(id)a3 withResourceName:(id)a4
{
  id v6;
  id v7;
  DSSubSource *v8;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DSSubSource;
  v8 = -[DSSubSource init](&v10, sel_init);
  if (v8 == self)
  {
    -[DSSubSource setParentSource:](self, "setParentSource:", v6);
    -[DSSubSource setResourceName:](self, "setResourceName:", v7);
  }

  return v8;
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DSSubSource parentSource](self, "parentSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DSSubSource resourceName](self, "resourceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchSharedResourcesWithName:completion:", v5, v4);

}

- (void)stopAllSharingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DSSubSource parentSource](self, "parentSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DSSubSource resourceName](self, "resourceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopSharingResourcesWithName:completion:", v5, v4);

}

- (void)stopSharing:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DSSubSource parentSource](self, "parentSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stopSharing:withCompletion:", v7, v6);

}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[DSSubSource parentSource](self, "parentSource");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[DSSubSource resourceName](self, "resourceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopSharingWithParticipant:forResourceName:withCompletion:", v7, v8, v6);

}

- (DSSource)parentSource
{
  return self->_parentSource;
}

- (void)setParentSource:(id)a3
{
  objc_storeStrong((id *)&self->_parentSource, a3);
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceName, 0);
  objc_storeStrong((id *)&self->_parentSource, 0);
}

@end
