@implementation HDWorkoutStatisticsPredicate

- (id)description
{
  HKQuantityType *quantityType;
  void *v4;
  NSString *column;
  void *v6;
  void *v7;

  quantityType = self->_quantityType;
  v4 = (void *)MEMORY[0x1E0CB3940];
  column = self->_column;
  HDSQLOperatorForComparisonType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<\"data_type\"=\"%@\" and \"%@\" %@ \"%@\"), quantityType, column, v6, self->_quantity);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForSumQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "_predicateForColumn:quantity:quantityType:operatorType:", 0x1E6D12C78, a3, a4, a5);
}

+ (id)predicateForMinimumQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "_predicateForColumn:quantity:quantityType:operatorType:", 0x1E6D12C98, a3, a4, a5);
}

+ (id)predicateForMaximumQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "_predicateForColumn:quantity:quantityType:operatorType:", 0x1E6D12CB8, a3, a4, a5);
}

+ (id)predicateForAverageQuantity:(id)a3 quantityType:(id)a4 operatorType:(unint64_t)a5
{
  return (id)objc_msgSend(a1, "_predicateForColumn:quantity:quantityType:operatorType:", 0x1E6D12C78, a3, a4, a5);
}

- (id)SQLForEntityClass:(Class)a3
{
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *column;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  HDSQLOperatorForComparisonType();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v5)
  {
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDWorkoutStatisticsEntity, "disambiguatedDatabaseTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDWorkoutActivityEntity, "disambiguatedSQLForProperty:", *MEMORY[0x1E0D29618]);
    v8 = objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDWorkoutStatisticsEntity, "disambiguatedSQLForProperty:", 0x1E6D12C38);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDWorkoutStatisticsEntity, "disambiguatedSQLForProperty:", 0x1E6D12C58);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKQuantityType code](self->_quantityType, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    column = self->_column;
    v13 = (void *)v8;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("(EXISTS (SELECT 1 FROM %@ WHERE %@=%@ AND %@=%@ AND %@%@?))"), v7, v8, v9, v10, v11, column, v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDWorkoutActivityEntity, "disambiguatedDatabaseTable");
    v25 = objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDWorkoutStatisticsEntity, "disambiguatedDatabaseTable");
    v24 = objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0D29618];
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDWorkoutActivityEntity, "disambiguatedSQLForProperty:", *MEMORY[0x1E0D29618]);
    v23 = objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDWorkoutStatisticsEntity, "disambiguatedSQLForProperty:", 0x1E6D12C38);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)-[objc_class entityClassForEnumeration](a3, "entityClassForEnumeration"), "disambiguatedSQLForProperty:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDWorkoutActivityEntity, "disambiguatedSQLForProperty:", CFSTR("owner_id"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDWorkoutActivityEntity, "disambiguatedSQLForProperty:", CFSTR("is_primary_activity"));
    v22 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDWorkoutStatisticsEntity, "disambiguatedSQLForProperty:", 0x1E6D12C58);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HKQuantityType code](self->_quantityType, "code"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)v25;
    v20 = self->_column;
    v9 = (void *)v23;
    v13 = (void *)v24;
    objc_msgSend(v22, "stringWithFormat:", CFSTR("(EXISTS (SELECT 1 FROM %@ INNER JOIN %@ ON %@=%@ WHERE %@=%@ AND %@ AND %@=%@ AND %@%@?))"), v25, v24, v23, v10, v11, v16, v17, v18, v19, v20, v26);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  HKQuantity *quantity;
  void *v7;
  double v8;
  double v9;

  quantity = self->_quantity;
  -[HKQuantityType canonicalUnit](self->_quantityType, "canonicalUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantity doubleValueForUnit:](quantity, "doubleValueForUnit:", v7);
  v9 = v8;

  sqlite3_bind_double(a3, *a4, v9);
  ++*a4;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDWorkoutStatisticsPredicate;
  return -[HDWorkoutStatisticsPredicate init](&v3, sel_init);
}

+ (id)_predicateForColumn:(id)a3 quantity:(id)a4 quantityType:(id)a5 operatorType:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_init");
  v13 = (void *)v12[1];
  v12[1] = v9;
  v14 = v9;

  v15 = (void *)v12[2];
  v12[2] = v10;
  v16 = v10;

  v17 = (void *)v12[3];
  v12[3] = v11;

  v12[4] = HDSQLiteComparisonTypeForPredicateOperator();
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_column, 0);
}

@end
