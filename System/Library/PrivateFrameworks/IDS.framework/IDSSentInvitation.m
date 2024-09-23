@implementation IDSSentInvitation

- (IDSSentInvitation)initWithDestination:(id)a3 state:(int64_t)a4 expirationDate:(id)a5 uniqueID:(id)a6 context:(id)a7
{
  id v13;
  IDSSentInvitation *v14;
  IDSSentInvitation *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSSentInvitation;
  v14 = -[IDSInvitation initWithState:expirationDate:uniqueID:context:](&v17, sel_initWithState_expirationDate_uniqueID_context_, a4, a5, a6, a7);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_destination, a3);

  return v15;
}

- (void)setSelfHandle:(id)a3
{
  objc_storeStrong((id *)&self->super._selfHandle, a3);
}

- (void)setSenderMergeID:(id)a3
{
  objc_storeStrong((id *)&self->super._senderMergeID, a3);
}

- (void)setState:(int64_t)a3
{
  self->super._state = a3;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->super._context, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IDSInvitation uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSInvitation selfHandle](self, "selfHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSInvitation senderMergeID](self, "senderMergeID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[IDSInvitation state](self, "state");
  -[IDSInvitation expirationDate](self, "expirationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSSentInvitation destination](self, "destination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IDSSentInvitation %p>: uniqueID %@ selfHandle %@ senderMergeID %@ state %ld expirationDate %@ destination %@"), self, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[IDSInvitation state](self, "state");
    if (v6 == objc_msgSend(v5, "state"))
    {
      -[IDSInvitation uniqueID](self, "uniqueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }
    -[IDSInvitation senderMergeID](self, "senderMergeID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      if ((v9 & 1) == 0)
      {
        v12 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v5, "senderMergeID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        v12 = 0;
      else
        v12 = v9;
      if (!v13 || ((v9 ^ 1) & 1) != 0)
      {
LABEL_15:
        -[IDSInvitation selfHandle](self, "selfHandle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {

        }
        else
        {
          objc_msgSend(v5, "selfHandle");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            if (!v12)
              goto LABEL_25;
            goto LABEL_22;
          }
        }
        if (!v12)
          goto LABEL_25;
        -[IDSInvitation selfHandle](self, "selfHandle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "selfHandle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if ((v20 & 1) == 0)
          goto LABEL_25;
LABEL_22:
        -[IDSInvitation expirationDate](self, "expirationDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "expirationDate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqual:", v22);

        if (v23)
        {
          -[IDSSentInvitation destination](self, "destination");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "destinationURIs");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "destination");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "destinationURIs");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v25, "isEqual:", v27);

          if (v28)
          {
            -[IDSInvitation context](self, "context");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "context");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v29, "isEqual:", v30);

LABEL_26:
            goto LABEL_27;
          }
        }
LABEL_25:
        v10 = 0;
        goto LABEL_26;
      }
    }
    -[IDSInvitation senderMergeID](self, "senderMergeID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "senderMergeID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "isEqual:", v15);

    goto LABEL_15;
  }
  v10 = 0;
LABEL_27:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[IDSInvitation uniqueID](self, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, *MEMORY[0x1E0D344E0]);

  -[IDSInvitation selfHandle](self, "selfHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, *MEMORY[0x1E0D344C8]);

  -[IDSInvitation senderMergeID](self, "senderMergeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, *MEMORY[0x1E0D344D0]);

  v8 = -[IDSInvitation state](self, "state");
  objc_msgSend(v4, "encodeInteger:forKey:", v8, *MEMORY[0x1E0D344D8]);
  -[IDSInvitation expirationDate](self, "expirationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, *MEMORY[0x1E0D346F8]);

  -[IDSSentInvitation destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "destinationURIs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("destination"));

  -[IDSInvitation context](self, "context");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, *MEMORY[0x1E0D344A8]);

}

- (IDSSentInvitation)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  IDSSentInvitation *v16;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D344E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D344C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D344D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "decodeIntegerForKey:", *MEMORY[0x1E0D344D8]);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D346F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("destination"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  objc_msgSend(MEMORY[0x1E0D34D18], "destinationWithStrings:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0D344A8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[IDSSentInvitation initWithDestination:state:expirationDate:uniqueID:context:](self, "initWithDestination:state:expirationDate:uniqueID:context:", v14, v7, v8, v4, v15);
  -[IDSSentInvitation setSelfHandle:](v16, "setSelfHandle:", v5);
  -[IDSSentInvitation setSenderMergeID:](v16, "setSenderMergeID:", v6);

  return v16;
}

- (IDSDestinationProtocol)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
