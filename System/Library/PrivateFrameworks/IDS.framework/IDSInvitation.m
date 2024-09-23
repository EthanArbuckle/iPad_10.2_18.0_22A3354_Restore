@implementation IDSInvitation

- (IDSInvitation)initWithState:(int64_t)a3 expirationDate:(id)a4 uniqueID:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  id v13;
  IDSInvitation *v14;
  IDSInvitation *v15;
  NSUUID *v16;
  NSUUID *uniqueID;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)IDSInvitation;
  v14 = -[IDSInvitation init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_context, a6);
    objc_storeStrong((id *)&v15->_expirationDate, a4);
    if (v12)
    {
      v16 = (NSUUID *)v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v16 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    }
    uniqueID = v15->_uniqueID;
    v15->_uniqueID = v16;

    v15->_state = a3;
  }

  return v15;
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSString)senderMergeID
{
  return self->_senderMergeID;
}

- (NSString)selfHandle
{
  return self->_selfHandle;
}

- (int64_t)state
{
  return self->_state;
}

- (IDSInvitationContext)context
{
  return self->_context;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_selfHandle, 0);
  objc_storeStrong((id *)&self->_senderMergeID, 0);
}

@end
