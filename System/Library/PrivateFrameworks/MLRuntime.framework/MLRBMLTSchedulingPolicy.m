@implementation MLRBMLTSchedulingPolicy

- (MLRBMLTSchedulingPolicy)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  MLRBMLTSchedulingPolicy *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v38;
  objc_super v39;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("nil dictionary"), 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v38);
  }
  v5 = v4;
  v39.receiver = self;
  v39.super_class = (Class)MLRBMLTSchedulingPolicy;
  v6 = -[MLRBMLTSchedulingPolicy init](&v39, sel_init);
  if (!v6)
    goto LABEL_13;
  objc_msgSend(v5, "mlr_stringValueForKey:defaultValue:", CFSTR("attachments_factor_name"), CFSTR("attachments"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)*((_QWORD *)v6 + 3);
  *((_QWORD *)v6 + 3) = v7;

  objc_msgSend(v5, "mlr_stringValueForKey:defaultValue:", CFSTR("recipe_factor_name"), CFSTR("recipe"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)v6 + 6);
  *((_QWORD *)v6 + 6) = v9;

  objc_msgSend(v5, "mlr_stringValueForKey:defaultValue:", CFSTR("recipe_id"), 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)*((_QWORD *)v6 + 7);
  *((_QWORD *)v6 + 7) = v11;

  objc_msgSend(v5, "mlr_doubleValueForKey:defaultValue:", CFSTR("min_gap_in_seconds"), 0.0);
  *((_QWORD *)v6 + 8) = v13;
  *((_QWORD *)v6 + 9) = objc_msgSend(v5, "mlr_unsignedIntegerValueForKey:defaultValue:", CFSTR("task_type"), 0);
  *((_QWORD *)v6 + 10) = objc_msgSend(v5, "mlr_unsignedIntegerValueForKey:defaultValue:", CFSTR("upload"), 0);
  objc_msgSend(v5, "mlr_dictionaryValueForKey:", CFSTR("dodml"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v6[8] = objc_msgSend(v14, "mlr_BOOLValueForKey:defaultValue:", CFSTR("require_des_record_store"), 1);
    objc_msgSend(v15, "mlr_dictionaryValueForKey:", CFSTR("predicate"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v16;

    *((_QWORD *)v6 + 9) = 1;
  }
  else if (*((_QWORD *)v6 + 9) != 1)
  {
    goto LABEL_7;
  }
  *(_OWORD *)(v6 + 88) = xmmword_211303100;
  *((_QWORD *)v6 + 13) = 3;
  *((_QWORD *)v6 + 10) = 1;
LABEL_7:
  *((_QWORD *)v6 + 5) = objc_msgSend(v5, "mlr_unsignedIntegerValueForKey:defaultValue:", CFSTR("max_evaluation"));
  v18 = *((_QWORD *)v6 + 9);
  if (v18 == 1)
  {
    if (!*((_QWORD *)v6 + 7))
    {
      objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[MLRBMLTSchedulingPolicy initWithDictionary:].cold.2(v19, v30, v31, v32, v33, v34, v35, v36);
      goto LABEL_17;
    }
  }
  else if (!v18)
  {
    objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MLRBMLTSchedulingPolicy initWithDictionary:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
LABEL_17:

    v29 = 0;
    goto LABEL_18;
  }
  v27 = objc_msgSend(v5, "copy");
  v28 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v27;

LABEL_13:
  v29 = v6;
LABEL_18:

  return v29;
}

- (MLRBMLTSchedulingPolicy)initWithTRIPBStruct:(id)a3
{
  void *v4;
  MLRBMLTSchedulingPolicy *v5;

  objc_msgSend(a3, "mlr_dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MLRBMLTSchedulingPolicy initWithDictionary:](self, "initWithDictionary:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)"), v5, self->_dictionaryRepresentation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_dictionaryRepresentation, CFSTR("dictionaryRepresentation"));
}

- (MLRBMLTSchedulingPolicy)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  MLRBMLTSchedulingPolicy *v12;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("dictionaryRepresentation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[MLRBMLTSchedulingPolicy initWithDictionary:](self, "initWithDictionary:", v11);
  return v12;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (NSString)attachmentsFactorName
{
  return self->_attachmentsFactorName;
}

- (NSDictionary)dodMLPredicate
{
  return self->_dodMLPredicate;
}

- (BOOL)dodMLRequireDESRecordStore
{
  return self->_dodMLRequireDESRecordStore;
}

- (unint64_t)maxEvaluation
{
  return self->_maxEvaluation;
}

- (NSString)recipeFactorName
{
  return self->_recipeFactorName;
}

- (NSString)recipeID
{
  return self->_recipeID;
}

- (double)taskMinGapInSeconds
{
  return self->_taskMinGapInSeconds;
}

- (unint64_t)taskType
{
  return self->_taskType;
}

- (unint64_t)upload
{
  return self->_upload;
}

- (double)maxRunTimeInSeconds
{
  return self->_maxRunTimeInSeconds;
}

- (double)pluginMinGapInSeconds
{
  return self->_pluginMinGapInSeconds;
}

- (unint64_t)taskCount
{
  return self->_taskCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipeID, 0);
  objc_storeStrong((id *)&self->_recipeFactorName, 0);
  objc_storeStrong((id *)&self->_dodMLPredicate, 0);
  objc_storeStrong((id *)&self->_attachmentsFactorName, 0);
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

- (void)initWithDictionary:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2112F5000, a1, a3, "Unknown taskType", a5, a6, a7, a8, 0);
}

- (void)initWithDictionary:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2112F5000, a1, a3, "Invalid schedulingPolicy: nil recipe_id", a5, a6, a7, a8, 0);
}

@end
