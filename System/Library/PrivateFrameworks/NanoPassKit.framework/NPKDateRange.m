@implementation NPKDateRange

- (NPKDateRange)initWithStartDate:(id)a3 expirationDate:(id)a4 formatterStyle:(unint64_t)a5
{
  id v9;
  id v10;
  NPKDateRange *v11;
  NPKDateRange *v12;
  uint64_t v13;
  NSString *startDateString;
  uint64_t v15;
  NSString *expiryDateString;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NPKDateRange;
  v11 = -[NPKDateRange init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startDate, a3);
    objc_msgSend((id)objc_opt_class(), "_dateStringWithDate:style:", v9, a5);
    v13 = objc_claimAutoreleasedReturnValue();
    startDateString = v12->_startDateString;
    v12->_startDateString = (NSString *)v13;

    objc_storeStrong((id *)&v12->_expiryDate, a4);
    objc_msgSend((id)objc_opt_class(), "_dateStringWithDate:style:", v12->_expiryDate, a5);
    v15 = objc_claimAutoreleasedReturnValue();
    expiryDateString = v12->_expiryDateString;
    v12->_expiryDateString = (NSString *)v15;

  }
  return v12;
}

+ (id)_dateStringWithDate:(id)a3 style:(unint64_t)a4
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)startDateString
{
  return self->_startDateString;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSString)expiryDateString
{
  return self->_expiryDateString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDateString, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_startDateString, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
