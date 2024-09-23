@implementation _CDCandidateInteractionTaxonomy

+ (_QWORD)taxonomyWithDirection:(uint64_t)a3 mechanism:
{
  _QWORD *v5;

  v5 = objc_alloc((Class)objc_opt_self());
  if (v5)
  {
    v5[1] = a2;
    v5[2] = a3;
  }
  return v5;
}

+ (_QWORD)taxonomyOfInteraction:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  v3 = objc_msgSend(v2, "direction");
  v4 = objc_msgSend(v2, "mechanism");

  return +[_CDCandidateInteractionTaxonomy taxonomyWithDirection:mechanism:]((uint64_t)_CDCandidateInteractionTaxonomy, v3, v4);
}

- (unint64_t)hash
{
  return self->_direction + 4 * self->_mechanism;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  BOOL v7;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6 && self->_direction == v6[1] && self->_mechanism == v6[2];

  return v7;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  directionToString(self->_direction);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  mechanismToString(self->_mechanism);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@ %@>"), v4, v5, v6);

  return v7;
}

@end
