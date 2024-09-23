@implementation BLSHPresentationDateSpecifier

+ (BLSHPresentationDateSpecifier)specifierWithPresentationDate:(id)a3 specifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPresentationDate:specifiers:", v7, v6);

  return (BLSHPresentationDateSpecifier *)v8;
}

- (BLSHPresentationDateSpecifier)initWithPresentationDate:(id)a3 specifiers:(id)a4
{
  id v7;
  id v8;
  BLSHPresentationDateSpecifier *v9;
  BLSHPresentationDateSpecifier *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BLSHPresentationDateSpecifier;
  v9 = -[BLSHPresentationDateSpecifier init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presentationDate, a3);
    objc_storeStrong((id *)&v10->_specifiers, a4);
  }

  return v10;
}

- (unint64_t)encodedPresentationTime
{
  unint64_t encodedPresentationTime;
  uint64_t v4;
  NSDate *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  encodedPresentationTime = self->_encodedPresentationTime;
  if (!encodedPresentationTime)
  {
    v4 = BLSHEncodePresentationTime_onceToken;
    v5 = self->_presentationDate;
    if (v4 != -1)
      dispatch_once(&BLSHEncodePresentationTime_onceToken, &__block_literal_global_23);
    objc_msgSend((id)BLSHEncodePresentationTime_calendar, "components:fromDate:", 32992, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "hour");
    v8 = objc_msgSend(v6, "minute");
    v9 = objc_msgSend(v6, "second");
    v10 = objc_msgSend(v6, "nanosecond");
    encodedPresentationTime = ((v7 / 0xA) << 44) | ((v7 % 0xA) << 40) | ((v8 / 0xA) << 32) | ((v8 % 0xA) << 28) | ((v9 / 0xA) << 20) | ((v9 % 0xA) << 16) | ((v10 + 500000) / 0x5F5E1uLL) & 0xFFFFFFFFFFFFFF00 | ((v10 + 500000) / 0xF4240uLL - 10 * (((v10 + 500000) / 0xF4240uLL * (unsigned __int128)0x199999999999999AuLL) >> 64)) | (16 * ((v10 + 500000) / 0x989680uLL - 10 * (((v10 + 500000) / 0x989680uLL * (unsigned __int128)0x199999999999999AuLL) >> 64))) | 0xC00C00C000;

    self->_encodedPresentationTime = encodedPresentationTime;
  }
  return encodedPresentationTime;
}

- (id)bls_loggingString
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  BLSHPresentationDateSpecifier *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  BLSHPresentationDateSpecifier *v17;

  v3 = (void *)objc_opt_new();
  v4 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __50__BLSHPresentationDateSpecifier_bls_loggingString__block_invoke;
  v15[3] = &unk_24D1BBE80;
  v5 = v3;
  v16 = v5;
  v17 = self;
  objc_msgSend(v5, "appendProem:block:", 0, v15);
  v9 = v4;
  v10 = 3221225472;
  v11 = __50__BLSHPresentationDateSpecifier_bls_loggingString__block_invoke_2;
  v12 = &unk_24D1BBE80;
  v13 = self;
  v14 = v5;
  v6 = v5;
  objc_msgSend(v6, "appendBodySectionWithOpenDelimiter:closeDelimiter:block:", CFSTR(" {"), CFSTR("} "), &v9);
  objc_msgSend(v6, "description", v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __50__BLSHPresentationDateSpecifier_bls_loggingString__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v5;
  __CFString *v6;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    objc_msgSend(*(id *)(v1 + 16), "bls_shortLoggingString");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v1 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v6 = CFSTR("<NULL>");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v6, v5);

  if (v3)
}

void __50__BLSHPresentationDateSpecifier_bls_loggingString__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "bls_shortLoggingString", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (id)bls_shortLoggingString
{
  void *v3;
  NSDate *presentationDate;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  presentationDate = self->_presentationDate;
  if (presentationDate)
  {
    -[NSDate bls_shortLoggingString](presentationDate, "bls_shortLoggingString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v5, 0);

  }
  else
  {
    objc_msgSend(v3, "appendString:withName:", CFSTR("<NULL>"), 0);
  }
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSArray count](self->_specifiers, "count"), CFSTR("env"));
  -[NSArray firstObject](self->_specifiers, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v9, CFSTR("1st"), 1);

  objc_msgSend(v3, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  NSArray *specifiers;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_presentationDate);
  specifiers = self->_specifiers;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__BLSHPresentationDateSpecifier_hash__block_invoke;
  v9[3] = &unk_24D1BE088;
  v10 = v3;
  v6 = v3;
  -[NSArray enumerateObjectsUsingBlock:](specifiers, "enumerateObjectsUsingBlock:", v9);
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

id __37__BLSHPresentationDateSpecifier_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:", a2);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSDate *presentationDate;
  id v7;
  id v8;
  NSArray *specifiers;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE0BE20], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  presentationDate = self->_presentationDate;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41__BLSHPresentationDateSpecifier_isEqual___block_invoke;
  v13[3] = &unk_24D1BC410;
  v7 = v4;
  v14 = v7;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", presentationDate, v13);
  if (objc_msgSend(v5, "isEqual"))
  {
    specifiers = self->_specifiers;
    objc_msgSend(v7, "specifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSArray isEqualToArray:](specifiers, "isEqualToArray:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __41__BLSHPresentationDateSpecifier_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentationDate");
}

- (void)enumerateDateSpecifiersUsingBlock:(id)a3
{
  id v4;
  NSArray *specifiers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  specifiers = self->_specifiers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__BLSHPresentationDateSpecifier_enumerateDateSpecifiersUsingBlock___block_invoke;
  v7[3] = &unk_24D1BE0B0;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](specifiers, "enumerateObjectsUsingBlock:", v7);

}

void __67__BLSHPresentationDateSpecifier_enumerateDateSpecifiersUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "dateSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (id)dateSpecifierForEnvironment:(id)a3
{
  id v4;
  NSArray *v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_specifiers;
  v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "environment", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          objc_msgSend(v9, "dateSpecifier");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)filter:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_specifiers, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_specifiers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11))
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  +[BLSHPresentationDateSpecifier specifierWithPresentationDate:specifiers:](BLSHPresentationDateSpecifier, "specifierWithPresentationDate:specifiers:", self->_presentationDate, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDate)presentationDate
{
  return self->_presentationDate;
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_presentationDate, 0);
}

@end
