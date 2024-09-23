@implementation _FBServiceFacilityServerPendingConnection

+ (id)pendingConnectionToFacility:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _FBServiceFacilityServerPendingConnection *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_FBServiceFacilityServerPendingConnection initWithFacility:completion:]([_FBServiceFacilityServerPendingConnection alloc], "initWithFacility:completion:", v6, v5);

  return v7;
}

- (_FBServiceFacilityServerPendingConnection)initWithFacility:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  _FBServiceFacilityServerPendingConnection *v9;
  _FBServiceFacilityServerPendingConnection *v10;
  uint64_t v11;
  id completion;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_FBServiceFacilityServerPendingConnection;
  v9 = -[_FBServiceFacilityServerPendingConnection init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_facility, a3);
    v11 = objc_msgSend(v8, "copy");
    completion = v10->_completion;
    v10->_completion = (id)v11;

  }
  return v10;
}

- (FBSServiceFacility)facility
{
  return self->_facility;
}

- (void)setFacility:(id)a3
{
  objc_storeStrong((id *)&self->_facility, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_facility, 0);
}

@end
