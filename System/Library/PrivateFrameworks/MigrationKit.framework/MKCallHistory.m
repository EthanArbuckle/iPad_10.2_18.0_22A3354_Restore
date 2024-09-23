@implementation MKCallHistory

- (MKCallHistory)initWithSerializedData:(id)a3
{
  id v4;
  MKCallHistory *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MKCallHistory *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MKCallHistory;
  v5 = -[MKCallHistory init](&v19, sel_init);
  if (!v5)
    goto LABEL_4;
  if (!v4)
    goto LABEL_5;
  objc_msgSend(v4, "mk_numberForKey:", CFSTR("is_read"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCallHistory setIsRead:](v5, "setIsRead:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v4, "mk_numberForKey:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCallHistory setType:](v5, "setType:", objc_msgSend(v7, "unsignedIntegerValue"));

  v8 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(v4, "mk_numberForKey:", CFSTR("date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v8, "dateWithTimeIntervalSince1970:", v10 / 1000.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCallHistory setDate:](v5, "setDate:", v11);

  objc_msgSend(v4, "mk_numberForKey:", CFSTR("duration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  -[MKCallHistory setDuration:](v5, "setDuration:");

  objc_msgSend(v4, "mk_stringForKey:", CFSTR("country_code"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lowercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCallHistory setCountryCode:](v5, "setCountryCode:", v14);

  objc_msgSend(v4, "mk_stringForKey:", CFSTR("number"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCallHistory setNumber:](v5, "setNumber:", v15);

  objc_msgSend(v4, "mk_arrayForKey:", CFSTR("other_numbers"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKCallHistory setOtherNumbers:](v5, "setOtherNumbers:", v16);

  if (-[NSArray count](v5->_otherNumbers, "count"))
LABEL_4:
    v17 = v5;
  else
LABEL_5:
    v17 = 0;

  return v17;
}

+ (BOOL)read:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 4)
    v4 = objc_msgSend(v3, "isRead");
  else
    v4 = 1;

  return v4;
}

+ (unsigned)status:(id)a3
{
  id v3;
  unsigned int *v4;
  double v5;
  unsigned int v6;

  v3 = a3;
  switch(objc_msgSend(v3, "type"))
  {
    case 1:
      v4 = (unsigned int *)MEMORY[0x24BE14970];
      break;
    case 2:
      objc_msgSend(v3, "duration");
      v4 = (unsigned int *)MEMORY[0x24BE14960];
      if (v5 != 0.0)
        v4 = (unsigned int *)MEMORY[0x24BE14978];
      break;
    case 3:
      v4 = (unsigned int *)MEMORY[0x24BE14958];
      break;
    case 4:
    case 5:
      v4 = (unsigned int *)MEMORY[0x24BE14980];
      break;
    default:
      v4 = (unsigned int *)MEMORY[0x24BE14990];
      break;
  }
  v6 = *v4;

  return v6;
}

+ (double)duration:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 1 || (v4 = 0.0, objc_msgSend(v3, "type") == 2))
  {
    objc_msgSend(v3, "duration");
    v4 = v5;
  }

  return v4;
}

+ (id)calls:(id)a3 label:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  MKCallHistory *v12;
  MKCallHistory *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BYTE *v19;
  id v20;
  uint8_t buf;
  _BYTE v22[7];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v20 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    v19 = v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = -[MKCallHistory initWithSerializedData:]([MKCallHistory alloc], "initWithSerializedData:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        v13 = v12;
        if (!v12)
        {
          +[MKLog log](MKLog, "log");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            +[MKCallHistory calls:label:].cold.1(&buf, v19, v17);
          goto LABEL_15;
        }
        if (-[MKCallHistory type](v12, "type") && -[MKCallHistory type](v13, "type") <= 5)
        {
          -[MKCallHistory number](v13, "number");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            -[MKCallHistory number](v13, "number");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "label:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKCallHistory setLabel:](v13, "setLabel:", v16);

          }
          +[MKCallHistory convertCallHistoryToCall:](MKCallHistory, "convertCallHistoryToCall:", v13, v19);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v6, "addObject:", v17);
LABEL_15:

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  return v6;
}

+ (id)convertCallHistoryToCall:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v3, "otherNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "otherNumbers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x24BE14928];
        objc_msgSend(v3, "countryCode");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "normalizedPhoneNumberHandleForValue:isoCountryCode:", v12, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15
          || (objc_msgSend(MEMORY[0x24BE14928], "normalizedEmailAddressHandleForValue:", v12),
              (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
          || (objc_msgSend(MEMORY[0x24BE14928], "normalizedGenericHandleForValue:", v12),
              (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(v6, "addObject:", v15);

        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    v16 = objc_alloc_init(MEMORY[0x24BE14948]);
    objc_msgSend(v16, "setHandleType:", 2);
    objc_msgSend(v16, "setMediaType:", 1);
    objc_msgSend(v16, "setTtyType:", 0);
    objc_msgSend(v16, "setServiceProvider:", *MEMORY[0x24BE149D0]);
    objc_msgSend(v16, "setRead:", +[MKCallHistory read:](MKCallHistory, "read:", v3));
    objc_msgSend(v16, "setRemoteParticipantHandles:", v6);
    objc_msgSend(v16, "setCallStatus:", +[MKCallHistory status:](MKCallHistory, "status:", v3));
    +[MKCallHistory duration:](MKCallHistory, "duration:", v3);
    objc_msgSend(v16, "setDuration:");
    objc_msgSend(v3, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDate:", v17);

    objc_msgSend(v3, "countryCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIsoCountryCode:", v18);

    objc_msgSend(v3, "label");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLocalParticipantUUID:", v19);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (void)setIsRead:(BOOL)a3
{
  self->_isRead = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSUUID)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)otherNumbers
{
  return self->_otherNumbers;
}

- (void)setOtherNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_otherNumbers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherNumbers, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

+ (void)calls:(os_log_t)log label:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21EC08000, log, OS_LOG_TYPE_ERROR, "could not deserialize call history item.", buf, 2u);
}

@end
