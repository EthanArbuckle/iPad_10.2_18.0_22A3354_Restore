@implementation GEOComposedStringSubstitutionCandidate_NoSubstitution

- (GEOComposedStringSubstitutionCandidate_NoSubstitution)initWithCategory:(int)a3
{
  uint64_t v3;
  GEOComposedStringSubstitutionCandidate_NoSubstitution *v4;
  GEOComposedStringSubstitutionCandidate_NoSubstitution *v5;
  GEOComposedStringSubstitutionCandidate_NoSubstitution *v6;
  objc_super v8;

  v3 = *(_QWORD *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedStringSubstitutionCandidate_NoSubstitution;
  v4 = -[GEOComposedStringSubstitutionCandidate_NoSubstitution init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[GEOComposedStringSubstitutionCandidate_NoSubstitution setWaypointCategory:](v4, "setWaypointCategory:", v3);
    v6 = v5;
  }

  return v5;
}

- (int)waypointCategory
{
  return self->waypointCategory;
}

- (void)setWaypointCategory:(int)a3
{
  self->waypointCategory = a3;
}

@end
