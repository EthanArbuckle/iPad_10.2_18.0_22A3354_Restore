@implementation MNGuidanceSignInfo

- (MNGuidanceSignInfo)initWithPrimarySign:(id)a3 secondarySign:(id)a4 stepIndex:(unint64_t)a5 primaryDistance:(double)a6 secondaryDistance:(double)a7 timeUntilPrimarySign:(double)a8 timeUntilSecondarySign:(double)a9
{
  id v17;
  id v18;
  MNGuidanceSignInfo *v19;
  MNGuidanceSignInfo *v20;
  objc_super v22;

  v17 = a3;
  v18 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MNGuidanceSignInfo;
  v19 = -[MNGuidanceSignInfo init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_primarySign, a3);
    objc_storeStrong((id *)&v20->_secondarySign, a4);
    v20->_stepIndex = a5;
    v20->_primaryDistance_SIRI_USE_ONLY = a6;
    v20->_secondaryDistance_SIRI_USE_ONLY = a7;
    v20->_timeUntilPrimarySign_SIRI_USE_ONLY = a8;
    v20->_timeUntilSecondarySign_SIRI_USE_ONLY = a9;
  }

  return v20;
}

- (id)debugDescription
{
  MNGuidanceSignDescription *primarySign;
  void *v4;
  __CFString *v5;
  MNGuidanceSignDescription *secondarySign;
  void *v7;
  uint64_t v8;

  primarySign = self->_primarySign;
  if (primarySign)
  {
    -[MNGuidanceSignDescription debugDescription](primarySign, "debugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_1E61D9090, "stringByAppendingFormat:", CFSTR("primary sign: %@"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E61D9090;
  }
  secondarySign = self->_secondarySign;
  if (secondarySign)
  {
    -[MNGuidanceSignDescription debugDescription](secondarySign, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR("secondary sign: %@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v8;
  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_stepIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Step %d"), self->_stepIndex);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (self->_primarySign)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), self->_primarySign);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (self->_secondarySign)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), self->_secondarySign);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceSignInfo)initWithCoder:(id)a3
{
  id v4;
  MNGuidanceSignInfo *v5;
  uint64_t v6;
  MNGuidanceSignDescription *primarySign;
  uint64_t v8;
  MNGuidanceSignDescription *secondarySign;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MNGuidanceSignInfo;
  v5 = -[MNGuidanceSignInfo init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_primarySign"));
    v6 = objc_claimAutoreleasedReturnValue();
    primarySign = v5->_primarySign;
    v5->_primarySign = (MNGuidanceSignDescription *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_secondarySign"));
    v8 = objc_claimAutoreleasedReturnValue();
    secondarySign = v5->_secondarySign;
    v5->_secondarySign = (MNGuidanceSignDescription *)v8;

    v5->_stepIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_stepIndex"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_primaryDistance_SIRI_USE_ONLY"));
    v5->_primaryDistance_SIRI_USE_ONLY = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_secondaryDistance_SIRI_USE_ONLY"));
    v5->_secondaryDistance_SIRI_USE_ONLY = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_timeUntilPrimarySign_SIRI_USE_ONLY"));
    v5->_timeUntilPrimarySign_SIRI_USE_ONLY = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_timeUntilSecondarySign_SIRI_USE_ONLY"));
    v5->_timeUntilSecondarySign_SIRI_USE_ONLY = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MNGuidanceSignDescription *primarySign;
  id v5;

  primarySign = self->_primarySign;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", primarySign, CFSTR("_primarySign"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_secondarySign, CFSTR("_secondarySign"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_stepIndex, CFSTR("_stepIndex"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_primaryDistance_SIRI_USE_ONLY"), self->_primaryDistance_SIRI_USE_ONLY);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_secondaryDistance_SIRI_USE_ONLY"), self->_secondaryDistance_SIRI_USE_ONLY);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_timeUntilPrimarySign_SIRI_USE_ONLY"), self->_timeUntilPrimarySign_SIRI_USE_ONLY);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_timeUntilSecondarySign_SIRI_USE_ONLY"), self->_timeUntilSecondarySign_SIRI_USE_ONLY);

}

- (MNGuidanceSignDescription)primarySign
{
  return self->_primarySign;
}

- (MNGuidanceSignDescription)secondarySign
{
  return self->_secondarySign;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (double)primaryDistance_SIRI_USE_ONLY
{
  return self->_primaryDistance_SIRI_USE_ONLY;
}

- (double)secondaryDistance_SIRI_USE_ONLY
{
  return self->_secondaryDistance_SIRI_USE_ONLY;
}

- (double)timeUntilPrimarySign_SIRI_USE_ONLY
{
  return self->_timeUntilPrimarySign_SIRI_USE_ONLY;
}

- (double)timeUntilSecondarySign_SIRI_USE_ONLY
{
  return self->_timeUntilSecondarySign_SIRI_USE_ONLY;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySign, 0);
  objc_storeStrong((id *)&self->_primarySign, 0);
}

@end
