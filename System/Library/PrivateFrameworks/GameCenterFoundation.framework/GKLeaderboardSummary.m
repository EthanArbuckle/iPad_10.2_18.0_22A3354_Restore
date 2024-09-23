@implementation GKLeaderboardSummary

- (GKLeaderboardSummary)initWithInternalRepresentation:(id)a3
{
  id v4;
  GKLeaderboardSummary *v5;
  GKLeaderboardSummary *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardSummary;
  v5 = -[GKLeaderboardSummary init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[GKLeaderboardSummary setInternal:](v5, "setInternal:", v4);

  return v6;
}

- (GKLeaderboardSummaryInternal)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
  objc_storeStrong((id *)&self->_internal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
