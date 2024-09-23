@implementation ACHBackCompatMonthlyChallengeDefinition

+ (id)definitionFromData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v11;

  v3 = (objc_class *)MEMORY[0x24BDD1620];
  v4 = a3;
  v11 = 0;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, &v11);

  v6 = v11;
  objc_msgSend(v5, "setClass:forClassName:", objc_opt_class(), CFSTR("_HKAchievementDefinition"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD0E88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishDecoding");
  if (v6)
  {
    ACHLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[ACHBackCompatMonthlyChallengeDefinition definitionFromData:].cold.1((uint64_t)v6, v8);

    v9 = 0;
  }
  else
  {
    v9 = v7;
  }

  return v9;
}

- (id)template
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  ACHDateComponentInterval *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  void *v18;
  double v19;
  uint64_t v20;
  double v21;
  void *v23;

  v3 = -[ACHBackCompatMonthlyChallengeDefinition _monthlyChallengeTypeFromTypeString](self, "_monthlyChallengeTypeFromTypeString");
  v4 = 0;
  if (v3)
  {
    v5 = v3;
    if (v3 != 29)
    {
      -[ACHBackCompatMonthlyChallengeDefinition _dateComponentsFromIdentifier](self, "_dateComponentsFromIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "dateFromComponents:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hk_startOfMonthForDate:addingMonths:", v8, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hk_startOfDateBySubtractingDays:fromDate:", 1, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "components:fromDate:", 28, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[ACHDateComponentInterval initWithStartDateComponents:endDateComponents:]([ACHDateComponentInterval alloc], "initWithStartDateComponents:endDateComponents:", v6, v11);
        -[ACHBackCompatMonthlyChallengeDefinition _goalExpressionValue](self, "_goalExpressionValue");
        v13 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v8;
        if (v13)
        {
          v14 = (void *)v13;
          -[ACHBackCompatMonthlyChallengeDefinition typeString](self, "typeString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containsString:", CFSTR("Average"));

          if (v16)
          {
            v17 = -[ACHDateComponentInterval countOfDaysContainedInIntervalInCalendar:](v12, "countOfDaysContainedInIntervalInCalendar:", v7);
            v18 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v14, "doubleValue");
            objc_msgSend(v18, "numberWithDouble:", v19 * (double)v17);
            v20 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)v20;
          }
          objc_msgSend(v14, "doubleValue");
          ACHMonthlyChallengeTemplate(v5, v12, v21);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setSourceName:", CFSTR("MonthlyChallenges"));

        }
        else
        {
          v4 = 0;
        }

      }
      else
      {
        v4 = 0;
      }

    }
  }
  return v4;
}

- (unint64_t)_monthlyChallengeTypeFromTypeString
{
  void *v2;
  unint64_t v3;

  -[ACHBackCompatMonthlyChallengeDefinition typeString](self, "typeString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = ACHMonthlyChallengeTypeFromLegacyString(v2);

  return v3;
}

- (id)_dateComponentsFromIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ACHBackCompatMonthlyChallengeDefinition identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count") == 3)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ACHDateComponentsForYearMonthDay(objc_msgSend(v4, "integerValue"), objc_msgSend(v5, "integerValue"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_goalExpressionValue
{
  void *v2;
  void *v3;
  id v4;

  -[ACHBackCompatMonthlyChallengeDefinition goalExpression](self, "goalExpression");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expressionValueWithObject:context:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHBackCompatMonthlyChallengeDefinition)initWithCoder:(id)a3
{
  id v4;
  ACHBackCompatMonthlyChallengeDefinition *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *typeString;
  uint64_t v10;
  NSExpression *goalExpression;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACHBackCompatMonthlyChallengeDefinition;
  v5 = -[ACHBackCompatMonthlyChallengeDefinition init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("achievementTypeString"));
    v8 = objc_claimAutoreleasedReturnValue();
    typeString = v5->_typeString;
    v5->_typeString = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expressionForGoalValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    goalExpression = v5->_goalExpression;
    v5->_goalExpression = (NSExpression *)v10;

    -[NSExpression allowEvaluation](v5->_goalExpression, "allowEvaluation");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("ACHBackCompatMonthlyChallengeDefinition Un-Implemented Exception"), CFSTR("Encoding new system templates to backwards compatible monthly challenge definitions is unsupported."), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise");

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)typeString
{
  return self->_typeString;
}

- (NSExpression)goalExpression
{
  return self->_goalExpression;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goalExpression, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)definitionFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_214029000, a2, OS_LOG_TYPE_ERROR, "Failed to decode ACHBackCompatMonthlyChallengeDefinition with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
