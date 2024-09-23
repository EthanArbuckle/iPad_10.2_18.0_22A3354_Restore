@implementation DNDSAvailabilityInvitationRequest

- (DNDSAvailabilityInvitationRequest)initWithHandles:(id)a3 invitation:(id)a4
{
  id v7;
  id v8;
  DNDSAvailabilityInvitationRequest *v9;
  DNDSAvailabilityInvitationRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDSAvailabilityInvitationRequest;
  v9 = -[DNDSAvailabilityInvitationRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handles, a3);
    objc_storeStrong((id *)&v10->_invitation, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[DNDSAvailabilityInvitationRequest handles](self, "handles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[DNDSAvailabilityInvitationRequest invitation](self, "invitation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  DNDSAvailabilityInvitationRequest *v4;
  DNDSAvailabilityInvitationRequest *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = (DNDSAvailabilityInvitationRequest *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DNDSAvailabilityInvitationRequest handles](self, "handles");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSAvailabilityInvitationRequest handles](v5, "handles");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != v7)
      {
        -[DNDSAvailabilityInvitationRequest handles](self, "handles");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v9 = (void *)v8;
        -[DNDSAvailabilityInvitationRequest handles](v5, "handles");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          v13 = 0;
LABEL_23:

          goto LABEL_24;
        }
        -[DNDSAvailabilityInvitationRequest handles](self, "handles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSAvailabilityInvitationRequest handles](v5, "handles");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = 0;
LABEL_22:

          goto LABEL_23;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      -[DNDSAvailabilityInvitationRequest invitation](self, "invitation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSAvailabilityInvitationRequest invitation](v5, "invitation");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v13 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[DNDSAvailabilityInvitationRequest invitation](self, "invitation");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          -[DNDSAvailabilityInvitationRequest invitation](v5, "invitation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            -[DNDSAvailabilityInvitationRequest invitation](self, "invitation");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[DNDSAvailabilityInvitationRequest invitation](v5, "invitation");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v22, "isEqual:", v20);

          }
          else
          {
            v13 = 0;
          }

        }
        else
        {

          v13 = 0;
        }
      }
      v10 = v25;
      v9 = v26;
      v12 = v23;
      v11 = v24;
      if (v6 == v7)
        goto LABEL_24;
      goto LABEL_22;
    }
    v13 = 0;
  }
LABEL_25:

  return v13;
}

- (NSArray)handles
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (AKAvailabilityInvitation)invitation
{
  return (AKAvailabilityInvitation *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_handles, 0);
}

@end
