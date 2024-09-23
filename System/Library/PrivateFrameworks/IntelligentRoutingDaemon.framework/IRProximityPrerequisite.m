@implementation IRProximityPrerequisite

- (BOOL)anyCandidateInProximity
{
  return self->_anyCandidateInProximity;
}

- (void)setAnyCandidateInProximity:(BOOL)a3
{
  self->_anyCandidateInProximity = a3;
}

- (NSDictionary)proximityPerCandiate
{
  return self->_proximityPerCandiate;
}

- (void)setProximityPerCandiate:(id)a3
{
  objc_storeStrong((id *)&self->_proximityPerCandiate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proximityPerCandiate, 0);
}

@end
