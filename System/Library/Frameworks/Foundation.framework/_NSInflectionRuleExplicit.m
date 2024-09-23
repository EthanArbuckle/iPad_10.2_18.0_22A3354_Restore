@implementation _NSInflectionRuleExplicit

- (_NSInflectionRuleExplicit)initWithAttributesDictionary:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _NSInflectionRuleExplicit *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSInflectionAgreementArgument"));
  if (_NSIsNSNumber())
    v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSInflectionAgreementArgument")), "integerValue");
  else
    v5 = 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSInflectionAgreementConcept"));
  if (_NSIsNSNumber())
    v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSInflectionAgreementConcept")), "integerValue");
  else
    v6 = 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSInflectionReferentConcept"));
  if (_NSIsNSNumber())
    v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSInflectionReferentConcept")), "integerValue");
  else
    v7 = 0;
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSInflect"));
  if (!v8)
  {
LABEL_13:
    if (v5)
      goto LABEL_20;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v8, "morphology");
    goto LABEL_13;
  }
  v8 = 0;
  if (v5)
    goto LABEL_20;
LABEL_16:
  if (!v6 && !v7 && !v8)
  {

    return 0;
  }
LABEL_20:
  v11.receiver = self;
  v11.super_class = (Class)_NSInflectionRuleExplicit;
  v9 = -[NSInflectionRule _init](&v11, sel__init);
  if (v9)
  {
    v9->_morphology = (NSMorphology *)objc_msgSend(v8, "copy");
    v9->_agreeWithConcept = v6;
    v9->_agreeWithArgument = v5;
    v9->_referentConcept = v7;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSInflectionRuleExplicit;
  -[_NSInflectionRuleExplicit dealloc](&v3, sel_dealloc);
}

- (_NSInflectionRuleExplicit)initWithMorphology:(id)a3 agreeWithArgument:(int64_t)a4 agreeWithConcept:(int64_t)a5 referentConcept:(int64_t)a6
{
  _NSInflectionRuleExplicit *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 || a5 | a4 | a6)
  {
    v12.receiver = self;
    v12.super_class = (Class)_NSInflectionRuleExplicit;
    v10 = -[NSInflectionRule _init](&v12, sel__init);
    if (v10)
    {
      v10->_morphology = (NSMorphology *)objc_msgSend(a3, "copy");
      v10->_agreeWithConcept = a5;
      v10->_agreeWithArgument = a4;
      v10->_referentConcept = a6;
    }
  }
  else
  {

    return 0;
  }
  return v10;
}

- (id)description
{
  void *v3;
  NSString *v4;
  NSString *v5;
  uint64_t v7;
  objc_super v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  if (-[_NSInflectionRuleExplicit morphology](self, "morphology"))
    objc_msgSend(v3, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("morphology = %@"), -[_NSInflectionRuleExplicit morphology](self, "morphology")));
  if (-[_NSInflectionRuleExplicit agreeWithConcept](self, "agreeWithConcept"))
    objc_msgSend(v3, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("agreeWithConcept = %ld"), -[_NSInflectionRuleExplicit agreeWithConcept](self, "agreeWithConcept")));
  if (-[_NSInflectionRuleExplicit agreeWithArgument](self, "agreeWithArgument"))
    objc_msgSend(v3, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("agreeWithArgument = %ld"), -[_NSInflectionRuleExplicit agreeWithArgument](self, "agreeWithArgument")));
  if (-[_NSInflectionRuleExplicit referentConcept](self, "referentConcept"))
    objc_msgSend(v3, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("referentConcept = %ld"), -[_NSInflectionRuleExplicit referentConcept](self, "referentConcept")));
  if (objc_msgSend(v3, "count"))
  {
    v9.receiver = self;
    v9.super_class = (Class)_NSInflectionRuleExplicit;
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ { %@ }"), -[_NSInflectionRuleExplicit description](&v9, sel_description), objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_NSInflectionRuleExplicit;
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (automatic inflection rule)"), -[_NSInflectionRuleExplicit description](&v8, sel_description), v7);
  }
  v5 = v4;

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  int64_t v6;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  v4 = -[NSMorphology hash](-[_NSInflectionRuleExplicit morphology](self, "morphology"), "hash") ^ v3;
  v5 = -[_NSInflectionRuleExplicit referentConcept](self, "referentConcept");
  v6 = v5 ^ -[_NSInflectionRuleExplicit agreeWithConcept](self, "agreeWithConcept");
  return v4 ^ v6 ^ -[_NSInflectionRuleExplicit agreeWithArgument](self, "agreeWithArgument");
}

- (BOOL)isEqual:(id)a3
{
  _BOOL4 v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  if (!-[_NSInflectionRuleExplicit morphology](self, "morphology")
    || (v5 = -[NSMorphology isEqual:](-[_NSInflectionRuleExplicit morphology](self, "morphology"), "isEqual:", objc_msgSend(a3, "morphology"))))
  {
    v6 = -[_NSInflectionRuleExplicit referentConcept](self, "referentConcept");
    if (v6 == objc_msgSend(a3, "referentConcept"))
    {
      v7 = -[_NSInflectionRuleExplicit agreeWithConcept](self, "agreeWithConcept");
      if (v7 == objc_msgSend(a3, "agreeWithConcept"))
      {
        v8 = -[_NSInflectionRuleExplicit agreeWithArgument](self, "agreeWithArgument");
        LOBYTE(v5) = v8 == objc_msgSend(a3, "agreeWithArgument");
        return v5;
      }
    }
LABEL_7:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isAutomatic
{
  return !-[_NSInflectionRuleExplicit morphology](self, "morphology")
      && !-[_NSInflectionRuleExplicit agreeWithConcept](self, "agreeWithConcept")
      && -[_NSInflectionRuleExplicit agreeWithArgument](self, "agreeWithArgument") == 0;
}

- (NSMorphology)morphology
{
  return (NSMorphology *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)agreeWithConcept
{
  return self->_agreeWithConcept;
}

- (int64_t)agreeWithArgument
{
  return self->_agreeWithArgument;
}

- (int64_t)referentConcept
{
  return self->_referentConcept;
}

@end
