@implementation _AFSharedConfidenceScoreMutation

- (_AFSharedConfidenceScoreMutation)initWithBase:(id)a3
{
  id v5;
  _AFSharedConfidenceScoreMutation *v6;
  _AFSharedConfidenceScoreMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSharedConfidenceScoreMutation;
  v6 = -[_AFSharedConfidenceScoreMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getSharedUserId
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_sharedUserId;
  }
  else
  {
    -[AFSharedConfidenceScore sharedUserId](self->_base, "sharedUserId");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSharedUserId:(id)a3
{
  objc_storeStrong((id *)&self->_sharedUserId, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getConfidenceScore
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_confidenceScore;
  else
    return -[AFSharedConfidenceScore confidenceScore](self->_base, "confidenceScore");
}

- (void)setConfidenceScore:(unint64_t)a3
{
  self->_confidenceScore = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserId, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
