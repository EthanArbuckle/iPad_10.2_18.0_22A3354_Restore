@implementation CTLocalPlan

- (CTLocalPlan)initWithPlanID:(id)a3
{
  id v5;
  CTLocalPlan *v6;
  CTLocalPlan *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLocalPlan;
  v6 = -[CTLocalPlan init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_planID, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTLocalPlan planID](self, "planID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" planID=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLocalPlan)initWithCoder:(id)a3
{
  id v4;
  CTLocalPlan *v5;
  uint64_t v6;
  CTPlanIdentifier *planID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLocalPlan;
  v5 = -[CTLocalPlan init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("planID"));
    v6 = objc_claimAutoreleasedReturnValue();
    planID = v5->_planID;
    v5->_planID = (CTPlanIdentifier *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_planID, CFSTR("planID"));
}

- (CTPlanIdentifier)planID
{
  return self->_planID;
}

- (void)setPlanID:(id)a3
{
  objc_storeStrong((id *)&self->_planID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planID, 0);
}

@end
