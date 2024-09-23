@implementation IRCandidateResult

- (IRCandidateResult)initWithCandidate:(id)a3 classification:(int64_t)a4 andClassificationDescription:(id)a5
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  return -[IRCandidateResult initWithCandidate:classification:classificationDescription:sortingHint:isCallToAction:isLockScreenControl:isConservativeFiltered:](self, "initWithCandidate:classification:classificationDescription:sortingHint:isCallToAction:isLockScreenControl:isConservativeFiltered:", a3, a4, a5, 0, 0, 0, v6);
}

- (IRCandidateResult)initWithCandidate:(id)a3 classification:(int64_t)a4 classificationDescription:(id)a5 sortingHint:(id)a6 isCallToAction:(BOOL)a7 isLockScreenControl:(BOOL)a8 isConservativeFiltered:(BOOL)a9
{
  id v16;
  __CFString *v17;
  id v18;
  IRCandidateResult *v19;
  IRCandidateResult *v20;
  __CFString *v21;
  objc_super v23;

  v16 = a3;
  v17 = (__CFString *)a5;
  v18 = a6;
  v23.receiver = self;
  v23.super_class = (Class)IRCandidateResult;
  v19 = -[IRCandidateResult init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_candidate, a3);
    v20->_classification = a4;
    if (v17)
      v21 = v17;
    else
      v21 = CFSTR("Classification not assigned");
    objc_storeStrong((id *)&v20->_classificationDescription, v21);
    objc_storeStrong((id *)&v20->_sortingHint, a6);
    v20->_isCallToAction = a7;
    v20->_isLockScreenControl = a8;
    v20->_isConservativeFiltered = a9;
  }

  return v20;
}

- (void)setClassification:(int64_t)a3 withDescription:(id)a4
{
  self->_classification = a3;
  objc_storeStrong((id *)&self->_classificationDescription, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCandidate:classification:andClassificationDescription:", self->_candidate, self->_classification, self->_classificationDescription);
  v6 = -[IRCandidate copyWithZone:](self->_candidate, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_QWORD *)(v5 + 24) = -[IRCandidateResult classification](self, "classification");
  v8 = -[NSString copyWithZone:](self->_classificationDescription, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSNumber copyWithZone:](self->_sortingHint, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  *(_BYTE *)(v5 + 8) = -[IRCandidateResult isCallToAction](self, "isCallToAction");
  *(_BYTE *)(v5 + 9) = -[IRCandidateResult isLockScreenControl](self, "isLockScreenControl");
  *(_BYTE *)(v5 + 10) = -[IRCandidateResult isConservativeFiltered](self, "isConservativeFiltered");
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  IRCandidate *candidate;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  candidate = self->_candidate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", candidate, CFSTR("candidate"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_classification);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("classification"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_classificationDescription, CFSTR("classificationDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sortingHint, CFSTR("sortingHint"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCallToAction);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("isCallToAction"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isLockScreenControl);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("isLockScreenControl"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isConservativeFiltered);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("isConservativeFiltered"));

}

- (IRCandidateResult)initWithCoder:(id)a3
{
  id v4;
  IRCandidateResult *v5;
  IRCandidateResult *v6;
  uint64_t v7;
  IRCandidate *candidate;
  IRCandidateResult *v9;
  int64_t v10;
  uint64_t v11;
  NSString *classificationDescription;
  void *v13;
  uint64_t v14;
  NSNumber *sortingHint;
  IRCandidateResult *v16;
  char v17;
  IRCandidateResult *v18;
  char v19;
  IRCandidateResult *v20;
  char v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IRCandidateResult;
  v5 = -[IRCandidateResult init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("candidate"));
    v6 = (IRCandidateResult *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_self();
      v7 = objc_claimAutoreleasedReturnValue();

      candidate = v5->_candidate;
      v5->_candidate = (IRCandidate *)v7;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classification"));
      v9 = (IRCandidateResult *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      if (v9)
      {
        v10 = (int)-[IRCandidateResult intValue](v9, "intValue");

        v5->_classification = v10;
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("classificationDescription"));
        v6 = (IRCandidateResult *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_opt_self();
          v11 = objc_claimAutoreleasedReturnValue();

          classificationDescription = v5->_classificationDescription;
          v5->_classificationDescription = (NSString *)v11;

          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortingHint"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_self();
          v14 = objc_claimAutoreleasedReturnValue();

          sortingHint = v5->_sortingHint;
          v5->_sortingHint = (NSNumber *)v14;

          objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isCallToAction"));
          v16 = (IRCandidateResult *)objc_claimAutoreleasedReturnValue();
          v6 = v16;
          if (v16)
          {
            v17 = -[IRCandidateResult BOOLValue](v16, "BOOLValue");

            v5->_isCallToAction = v17;
            objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isLockScreenControl"));
            v18 = (IRCandidateResult *)objc_claimAutoreleasedReturnValue();
            v6 = v18;
            if (v18)
            {
              v19 = -[IRCandidateResult BOOLValue](v18, "BOOLValue");

              v5->_isLockScreenControl = v19;
              objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isConservativeFiltered"));
              v20 = (IRCandidateResult *)objc_claimAutoreleasedReturnValue();
              v6 = v20;
              if (v20)
              {
                v21 = -[IRCandidateResult BOOLValue](v20, "BOOLValue");

                v5->_isConservativeFiltered = v21;
                v6 = v5;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t classification;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR(", candidate: %@"), self->_candidate);
  classification = self->_classification;
  if (classification > 4)
    v8 = CFSTR("Invalid");
  else
    v8 = *(&off_25103FB60 + classification);
  objc_msgSend(v6, "appendFormat:", CFSTR(", classification: %@"), v8);
  objc_msgSend(v6, "appendFormat:", CFSTR(", classificationDescription: %@"), self->_classificationDescription);
  objc_msgSend(v6, "appendFormat:", CFSTR(", sortingHint: %@"), self->_sortingHint);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCallToAction);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isCallToAction: %@"), v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isLockScreenControl);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isLockScreenControl: %@"), v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isConservativeFiltered);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", isConservativeFiltered: %@"), v11);

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  _BOOL4 v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IRCandidateResult candidate](self, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {

    }
    else
    {
      -[IRCandidateResult candidate](self, "candidate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "candidate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
        goto LABEL_12;
    }
    v11 = -[IRCandidateResult classification](self, "classification");
    if (v11 == objc_msgSend(v5, "classification"))
    {
      -[IRCandidateResult sortingHint](self, "sortingHint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sortingHint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqual:", v13))
      {

      }
      else
      {
        -[IRCandidateResult sortingHint](self, "sortingHint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sortingHint");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 != v15)
          goto LABEL_12;
      }
      v16 = -[IRCandidateResult isCallToAction](self, "isCallToAction");
      if (v16 == objc_msgSend(v5, "isCallToAction"))
      {
        v17 = -[IRCandidateResult isLockScreenControl](self, "isLockScreenControl");
        if (v17 == objc_msgSend(v5, "isLockScreenControl"))
        {
          v19 = -[IRCandidateResult isConservativeFiltered](self, "isConservativeFiltered");
          v8 = v19 ^ objc_msgSend(v5, "isConservativeFiltered") ^ 1;
          goto LABEL_13;
        }
      }
    }
LABEL_12:
    LOBYTE(v8) = 0;
LABEL_13:

    goto LABEL_14;
  }
  LOBYTE(v8) = 0;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  int64_t classification;

  v3 = -[IRCandidate hash](self->_candidate, "hash");
  classification = self->_classification;
  return v3 ^ classification ^ -[NSNumber hash](self->_sortingHint, "hash") ^ self->_isCallToAction ^ self->_isLockScreenControl ^ (unint64_t)self->_isConservativeFiltered ^ 0x1F;
}

- (IRCandidate)candidate
{
  return self->_candidate;
}

- (int64_t)classification
{
  return self->_classification;
}

- (NSNumber)sortingHint
{
  return self->_sortingHint;
}

- (void)setSortingHint:(id)a3
{
  objc_storeStrong((id *)&self->_sortingHint, a3);
}

- (BOOL)isCallToAction
{
  return self->_isCallToAction;
}

- (void)setIsCallToAction:(BOOL)a3
{
  self->_isCallToAction = a3;
}

- (BOOL)isLockScreenControl
{
  return self->_isLockScreenControl;
}

- (void)setIsLockScreenControl:(BOOL)a3
{
  self->_isLockScreenControl = a3;
}

- (BOOL)isConservativeFiltered
{
  return self->_isConservativeFiltered;
}

- (void)setIsConservativeFiltered:(BOOL)a3
{
  self->_isConservativeFiltered = a3;
}

- (NSString)classificationDescription
{
  return self->_classificationDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationDescription, 0);
  objc_storeStrong((id *)&self->_sortingHint, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

@end
