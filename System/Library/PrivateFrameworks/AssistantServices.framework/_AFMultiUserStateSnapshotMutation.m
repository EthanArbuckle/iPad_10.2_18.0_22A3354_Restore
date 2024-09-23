@implementation _AFMultiUserStateSnapshotMutation

- (_AFMultiUserStateSnapshotMutation)initWithBase:(id)a3
{
  id v5;
  _AFMultiUserStateSnapshotMutation *v6;
  _AFMultiUserStateSnapshotMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFMultiUserStateSnapshotMutation;
  v6 = -[_AFMultiUserStateSnapshotMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getVtSatScore
{
  NSNumber *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_vtSatScore;
  }
  else
  {
    -[AFMultiUserStateSnapshot vtSatScore](self->_base, "vtSatScore");
    v2 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setVtSatScore:(id)a3
{
  objc_storeStrong((id *)&self->_vtSatScore, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getConfidenceScores
{
  NSArray *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_confidenceScores;
  }
  else
  {
    -[AFMultiUserStateSnapshot confidenceScores](self->_base, "confidenceScores");
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setConfidenceScores:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceScores, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceScores, 0);
  objc_storeStrong((id *)&self->_vtSatScore, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
