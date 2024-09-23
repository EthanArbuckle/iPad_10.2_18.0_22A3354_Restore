@implementation HDHRSDataCollectionScrubber

+ (id)scrubberForResource:(id)a3 redactor:(id)a4 rules:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  id *v14;
  void *v15;
  id *v16;

  v11 = a4;
  v12 = a5;
  v13 = a3;
  v14 = (id *)objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDD3C90], "visitorWithJSONObject:delegate:error:", v13, v14, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_storeStrong(v14 + 1, v15);
    objc_storeStrong(v14 + 2, a4);
    objc_storeStrong(v14 + 3, a5);
    v16 = v14;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)generateRedactedResource
{
  NSMutableArray *v3;
  NSMutableArray *objectStack;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objectStack = self->_objectStack;
  self->_objectStack = v3;

  -[HKJSONVisitor traverseJSONObject](self->_visitor, "traverseJSONObject");
  return self->_redactedResource;
}

- (void)_addObjectToTopObject:(id)a3 key:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  -[NSMutableArray lastObject](self->_objectStack, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    objc_storeStrong(&self->_redactedResource, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setValue:forKey:", v9, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v8, "addObject:", v9);
  }

}

- (unint64_t)_redactorOptionsForRule:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RedactionSkipNumbers")) & 1) != 0)
    {
      v5 = 42;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("RedactionSkipLinks")) & 1) != 0)
    {
      v5 = 16;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("RedactionPolicyCodingSystemURI")))
    {
      v5 = 24;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_ruleNodeForKeyPath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSDictionary valueForKeyPath:](self->_rules, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)visitor:(id)a3 visitPrimitive:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSDictionary *rules;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  unint64_t v16;
  uint64_t v17;
  HKPIIRedactor *redactor;
  void *v19;
  void *v20;
  id v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "currentKeyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRSDataCollectionScrubber _ruleNodeForKeyPath:](self, "_ruleNodeForKeyPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    rules = self->_rules;
    objc_msgSend(v6, "currentKeyPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    -[NSDictionary hk_safeStringForKeyPath:error:](rules, "hk_safeStringForKeyPath:error:", v11, &v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v22;

    if (v12)
    {
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("RedactionNone")))
      {
        objc_msgSend(v6, "lastKeyPathComponent");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        -[HDHRSDataCollectionScrubber _addObjectToTopObject:key:](self, "_addObjectToTopObject:key:", v7, v14);
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
        -[HDHRSDataCollectionScrubber visitor:visitPrimitive:].cold.1((uint64_t)self, (uint64_t)v13, v15);
    }
    v14 = v7;
    v16 = -[HDHRSDataCollectionScrubber _redactorOptionsForRule:](self, "_redactorOptionsForRule:", v12);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HKPIIRedactor redactedStringWithString:options:](self->_redactor, "redactedStringWithString:options:", v14, v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        objc_opt_isKindOfClass();
        goto LABEL_13;
      }
      redactor = self->_redactor;
      objc_msgSend(v14, "stringValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKPIIRedactor redactedStringWithString:options:](redactor, "redactedStringWithString:options:", v19, v16);
      v17 = objc_claimAutoreleasedReturnValue();

    }
    v14 = (id)v17;
LABEL_13:
    objc_msgSend(v6, "lastKeyPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHRSDataCollectionScrubber _addObjectToTopObject:key:](self, "_addObjectToTopObject:key:", v14, v20);

    goto LABEL_14;
  }
LABEL_15:

  return 1;
}

- (int64_t)visitor:(id)a3 willVisitDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "currentKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {

    goto LABEL_5;
  }
  objc_msgSend(v5, "currentKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRSDataCollectionScrubber _ruleNodeForKeyPath:](self, "_ruleNodeForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_5:
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v5, "lastKeyPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHRSDataCollectionScrubber _addObjectToTopObject:key:](self, "_addObjectToTopObject:key:", v10, v11);

    -[NSMutableArray addObject:](self->_objectStack, "addObject:", v10);
    v9 = 1;
    goto LABEL_6;
  }
  v9 = 2;
LABEL_6:

  return v9;
}

- (int64_t)visitor:(id)a3 didVisitDictionary:(id)a4
{
  -[NSMutableArray removeLastObject](self->_objectStack, "removeLastObject", a3, a4);
  return 1;
}

- (int64_t)visitor:(id)a3 willVisitArray:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "currentKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {

    goto LABEL_5;
  }
  objc_msgSend(v5, "currentKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHRSDataCollectionScrubber _ruleNodeForKeyPath:](self, "_ruleNodeForKeyPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_5:
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v5, "lastKeyPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDHRSDataCollectionScrubber _addObjectToTopObject:key:](self, "_addObjectToTopObject:key:", v10, v11);

    -[NSMutableArray addObject:](self->_objectStack, "addObject:", v10);
    v9 = 1;
    goto LABEL_6;
  }
  v9 = 2;
LABEL_6:

  return v9;
}

- (int64_t)visitor:(id)a3 didVisitArray:(id)a4
{
  -[NSMutableArray removeLastObject](self->_objectStack, "removeLastObject", a3, a4);
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_redactedResource, 0);
  objc_storeStrong((id *)&self->_objectStack, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_redactor, 0);
  objc_storeStrong((id *)&self->_visitor, 0);
}

- (void)_ruleNodeForKeyPath:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_3(&dword_224DAC000, a2, a3, "Exception caught when looking up redaction rule for key path %@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

- (void)visitor:(NSObject *)a3 visitPrimitive:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_3(&dword_224DAC000, a2, a3, "%{public}@: rule of unexpected type: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end
