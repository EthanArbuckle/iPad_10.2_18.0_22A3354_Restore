@implementation CTSimSetupUsage

- (CTSimSetupUsage)initWithInBuddy:(BOOL)a3 transferablePlans:(unint64_t)a4 selectedTransferablePlans:(unint64_t)a5 alsPlans:(unint64_t)a6 selectedAlsPlans:(unint64_t)a7 odaPlans:(unint64_t)a8
{
  CTSimSetupUsage *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CTSimSetupUsage;
  result = -[CTSimSetupUsage init](&v15, sel_init);
  if (result)
  {
    result->_inBuddy = a3;
    result->_transferablePlans = a4;
    result->_selectedTransferablePlans = a5;
    result->_alsPlans = a6;
    result->_selectedAlsPlans = a7;
    result->_odaPlans = a8;
  }
  return result;
}

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const char *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CTSimSetupUsage inBuddy](self, "inBuddy");
  v5 = "NO";
  if (v4)
    v5 = "YES";
  objc_msgSend(v3, "appendFormat:", CFSTR(" inBuddy=%s"), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR(" transferablePlans=%lu"), -[CTSimSetupUsage transferablePlans](self, "transferablePlans"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" selectedTransferablePlans=%lu"), -[CTSimSetupUsage selectedTransferablePlans](self, "selectedTransferablePlans"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" alsPlans=%lu"), -[CTSimSetupUsage alsPlans](self, "alsPlans"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" selectedAlsPlans=%lu"), -[CTSimSetupUsage selectedAlsPlans](self, "selectedAlsPlans"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" odaPlans=%lu"), -[CTSimSetupUsage odaPlans](self, "odaPlans"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTSimSetupUsage *v4;
  _BOOL4 v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;

  v4 = (CTSimSetupUsage *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[CTSimSetupUsage inBuddy](self, "inBuddy"), v5 == -[CTSimSetupUsage inBuddy](v4, "inBuddy"))
      && (v6 = -[CTSimSetupUsage transferablePlans](self, "transferablePlans"),
          v6 == -[CTSimSetupUsage transferablePlans](v4, "transferablePlans"))
      && (v7 = -[CTSimSetupUsage selectedTransferablePlans](self, "selectedTransferablePlans"),
          v7 == -[CTSimSetupUsage selectedTransferablePlans](v4, "selectedTransferablePlans"))
      && (v8 = -[CTSimSetupUsage alsPlans](self, "alsPlans"), v8 == -[CTSimSetupUsage alsPlans](v4, "alsPlans"))
      && (v9 = -[CTSimSetupUsage selectedAlsPlans](self, "selectedAlsPlans"),
          v9 == -[CTSimSetupUsage selectedAlsPlans](v4, "selectedAlsPlans")))
    {
      v10 = -[CTSimSetupUsage odaPlans](self, "odaPlans");
      v11 = v10 == -[CTSimSetupUsage odaPlans](v4, "odaPlans");
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTSimSetupUsage)initWithCoder:(id)a3
{
  id v4;
  CTSimSetupUsage *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CTSimSetupUsage;
  v5 = -[CTSimSetupUsage init](&v7, sel_init);
  if (v5)
  {
    v5->_inBuddy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("inBuddy"));
    v5->_transferablePlans = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transferablePlans"));
    v5->_selectedTransferablePlans = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectedTransferablePlans"));
    v5->_alsPlans = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alsPlans"));
    v5->_selectedAlsPlans = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("selectedAlsPlans"));
    v5->_odaPlans = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("odaPlans"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[CTSimSetupUsage inBuddy](self, "inBuddy"), CFSTR("inBuddy"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSimSetupUsage transferablePlans](self, "transferablePlans"), CFSTR("transferablePlans"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSimSetupUsage selectedTransferablePlans](self, "selectedTransferablePlans"), CFSTR("selectedTransferablePlans"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSimSetupUsage alsPlans](self, "alsPlans"), CFSTR("alsPlans"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSimSetupUsage selectedAlsPlans](self, "selectedAlsPlans"), CFSTR("selectedAlsPlans"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTSimSetupUsage odaPlans](self, "odaPlans"), CFSTR("odaPlans"));

}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (unint64_t)transferablePlans
{
  return self->_transferablePlans;
}

- (void)setTransferablePlans:(unint64_t)a3
{
  self->_transferablePlans = a3;
}

- (unint64_t)selectedTransferablePlans
{
  return self->_selectedTransferablePlans;
}

- (void)setSelectedTransferablePlans:(unint64_t)a3
{
  self->_selectedTransferablePlans = a3;
}

- (unint64_t)alsPlans
{
  return self->_alsPlans;
}

- (void)setAlsPlans:(unint64_t)a3
{
  self->_alsPlans = a3;
}

- (unint64_t)selectedAlsPlans
{
  return self->_selectedAlsPlans;
}

- (void)setSelectedAlsPlans:(unint64_t)a3
{
  self->_selectedAlsPlans = a3;
}

- (unint64_t)odaPlans
{
  return self->_odaPlans;
}

- (void)setOdaPlans:(unint64_t)a3
{
  self->_odaPlans = a3;
}

@end
