@implementation DAMoveResponse

- (DAMoveResponse)initWithStatus:(int)a3 sourceID:(id)a4 destID:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  DAMoveResponse *v10;
  DAMoveResponse *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DAMoveResponse;
  v10 = -[DAMoveResponse init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    -[DAMoveResponse setStatus:](v10, "setStatus:", v6);
    v12 = (void *)objc_msgSend(v8, "copy");
    -[DAMoveResponse setSourceID:](v11, "setSourceID:", v12);

    v13 = (void *)objc_msgSend(v9, "copy");
    -[DAMoveResponse setDestID:](v11, "setDestID:", v13);

  }
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)DAMoveResponse;
  -[DAMoveResponse description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DAMoveResponse status](self, "status");
  -[DAMoveResponse sourceID](self, "sourceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMoveResponse destID](self, "destID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAMoveResponse origRequest](self, "origRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ status %d, sourceID \"%@\", destID \"%@\", origRequest (%@)"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)destID
{
  return self->_destID;
}

- (void)setDestID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (DAMessageMoveRequest)origRequest
{
  return self->_origRequest;
}

- (void)setOrigRequest:(id)a3
{
  objc_storeStrong((id *)&self->_origRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origRequest, 0);
  objc_storeStrong((id *)&self->_destID, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
}

@end
