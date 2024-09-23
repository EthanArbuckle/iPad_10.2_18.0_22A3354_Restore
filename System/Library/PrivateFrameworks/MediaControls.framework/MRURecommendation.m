@implementation MRURecommendation

+ (id)recommendationWithIRCandidateResult:(id)a3 contextIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SEL v12;
  void *v13;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D4C578];
  v7 = a4;
  objc_msgSend(v5, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeWithCandidate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setDonateAsCandidate:", 1);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setClassification:", objc_msgSend(v5, "classification"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "sortingHint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSortingHint:", v11);

  }
  objc_msgSend(v10, "setRoute:", v9);
  objc_msgSend(v10, "setContextIdentifier:", v7);

  objc_msgSend(v10, "setConservativelyFiltered:", objc_msgSend(v5, "isConservativeFiltered"));
  v12 = NSSelectorFromString(CFSTR("classificationDescription"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "performSelector:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "setReason:", v13);

  }
  return v10;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  const __CFString *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ (%p): "), v5, self);

  -[MRURecommendation route](self, "route");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("routeIdentififer: %@"), v8);

  v9 = -[MRURecommendation classification](self, "classification");
  if ((unint64_t)(v9 - 1) > 3)
    v10 = CFSTR("Unknown");
  else
    v10 = off_1E581A4E0[v9 - 1];
  objc_msgSend(v6, "appendFormat:", CFSTR(", classification: %@"), v10);
  -[MRURecommendation contextIdentifier](self, "contextIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", contextIdentifier: %@"), v11);

  if (-[MRURecommendation isConservativelyFiltered](self, "isConservativelyFiltered"))
    objc_msgSend(v6, "appendString:", CFSTR(", ConservativelyFiltered"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return (NSString *)v6;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (NSNumber)sortingHint
{
  return self->_sortingHint;
}

- (void)setSortingHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isCallToAction
{
  return self->_callToAction;
}

- (void)setCallToAction:(BOOL)a3
{
  self->_callToAction = a3;
}

- (BOOL)isLockScreenControl
{
  return self->_lockScreenControl;
}

- (void)setLockScreenControl:(BOOL)a3
{
  self->_lockScreenControl = a3;
}

- (BOOL)isConservativelyFiltered
{
  return self->_conservativelyFiltered;
}

- (void)setConservativelyFiltered:(BOOL)a3
{
  self->_conservativelyFiltered = a3;
}

- (MRIRRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contextIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_sortingHint, 0);
}

@end
