@implementation GEOComposedStringSubstitutionCandidate

- (id)copyWithZone:(_NSZone *)a3
{
  GEOComposedStringSubstitutionCandidate *v4;
  uint64_t v5;
  GEOComposedStringOptions *optionsToUse;

  v4 = -[GEOComposedStringSubstitutionCandidate init](+[GEOComposedStringSubstitutionCandidate allocWithZone:](GEOComposedStringSubstitutionCandidate, "allocWithZone:", a3), "init");
  v4->_waypointCategory = self->_waypointCategory;
  objc_storeStrong((id *)&v4->_composedString, self->_composedString);
  v5 = -[GEOComposedStringOptions copy](self->_optionsToUse, "copy");
  optionsToUse = v4->_optionsToUse;
  v4->_optionsToUse = (GEOComposedStringOptions *)v5;

  return v4;
}

- (GEOComposedStringSubstitutionCandidate)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringSubstitutionCandidate *v5;
  uint64_t v6;
  GEOComposedString *composedString;
  GEOComposedStringSubstitutionCandidate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringSubstitutionCandidate;
  v5 = -[GEOComposedStringSubstitutionCandidate init](&v10, sel_init);
  if (v5)
  {
    v5->_waypointCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_waypointCategory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_composedString"));
    v6 = objc_claimAutoreleasedReturnValue();
    composedString = v5->_composedString;
    v5->_composedString = (GEOComposedString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t waypointCategory;
  id v5;

  waypointCategory = self->_waypointCategory;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", waypointCategory, CFSTR("_waypointCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_composedString, CFSTR("_composedString"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  _BOOL4 v10;
  GEOComposedStringOptions *optionsToUse;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  objc_super v17;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringSubstitutionCandidate;
    if (-[GEOComposedStringSubstitutionCandidate isEqual:](&v17, sel_isEqual_, v5)
      && self->_waypointCategory == *((_DWORD *)v5 + 2)
      && ((v6 = (void *)v5[2], v7 = self->_composedString, v8 = v6, !(v7 | v8))
       || (v9 = (void *)v8, v10 = objc_msgSend((id)v7, "isEqual:", v8), v9, (id)v7, v10)))
    {
      optionsToUse = self->_optionsToUse;
      v12 = v5[3];
      v13 = optionsToUse;
      v14 = v13;
      if ((unint64_t)v13 | v12)
        v15 = objc_msgSend(v13, "isEqual:", v12);
      else
        v15 = 1;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int)waypointCategory
{
  return self->_waypointCategory;
}

- (GEOComposedString)composedString
{
  return self->_composedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsToUse, 0);
  objc_storeStrong((id *)&self->_composedString, 0);
}

@end
