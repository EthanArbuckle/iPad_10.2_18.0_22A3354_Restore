@implementation NPKProtoPassSyncProposedReconciledState

- (BOOL)hasProposedReconciledState
{
  return self->_proposedReconciledState != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPassSyncProposedReconciledState;
  -[NPKProtoPassSyncProposedReconciledState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPassSyncProposedReconciledState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoPassSyncState *proposedReconciledState;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  proposedReconciledState = self->_proposedReconciledState;
  if (proposedReconciledState)
  {
    -[NPKProtoPassSyncState dictionaryRepresentation](proposedReconciledState, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("proposedReconciledState"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPassSyncProposedReconciledStateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_proposedReconciledState)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  NPKProtoPassSyncState *proposedReconciledState;

  proposedReconciledState = self->_proposedReconciledState;
  if (proposedReconciledState)
    objc_msgSend(a3, "setProposedReconciledState:", proposedReconciledState);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoPassSyncState copyWithZone:](self->_proposedReconciledState, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NPKProtoPassSyncState *proposedReconciledState;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    proposedReconciledState = self->_proposedReconciledState;
    if ((unint64_t)proposedReconciledState | v4[1])
      v6 = -[NPKProtoPassSyncState isEqual:](proposedReconciledState, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NPKProtoPassSyncState hash](self->_proposedReconciledState, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NPKProtoPassSyncState *proposedReconciledState;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  proposedReconciledState = self->_proposedReconciledState;
  v6 = v4[1];
  if (proposedReconciledState)
  {
    if (v6)
    {
      v7 = v4;
      -[NPKProtoPassSyncState mergeFrom:](proposedReconciledState, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[NPKProtoPassSyncProposedReconciledState setProposedReconciledState:](self, "setProposedReconciledState:");
    goto LABEL_6;
  }

}

- (NPKProtoPassSyncState)proposedReconciledState
{
  return self->_proposedReconciledState;
}

- (void)setProposedReconciledState:(id)a3
{
  objc_storeStrong((id *)&self->_proposedReconciledState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedReconciledState, 0);
}

@end
