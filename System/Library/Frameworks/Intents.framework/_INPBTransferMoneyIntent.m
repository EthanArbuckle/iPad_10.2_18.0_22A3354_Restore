@implementation _INPBTransferMoneyIntent

- (void)setFromAccount:(id)a3
{
  objc_storeStrong((id *)&self->_fromAccount, a3);
}

- (BOOL)hasFromAccount
{
  return self->_fromAccount != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setToAccount:(id)a3
{
  objc_storeStrong((id *)&self->_toAccount, a3);
}

- (BOOL)hasToAccount
{
  return self->_toAccount != 0;
}

- (void)setTransactionAmount:(id)a3
{
  objc_storeStrong((id *)&self->_transactionAmount, a3);
}

- (BOOL)hasTransactionAmount
{
  return self->_transactionAmount != 0;
}

- (void)setTransactionNote:(id)a3
{
  NSString *v4;
  NSString *transactionNote;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  transactionNote = self->_transactionNote;
  self->_transactionNote = v4;

}

- (BOOL)hasTransactionNote
{
  return self->_transactionNote != 0;
}

- (void)setTransactionScheduledDate:(id)a3
{
  objc_storeStrong((id *)&self->_transactionScheduledDate, a3);
}

- (BOOL)hasTransactionScheduledDate
{
  return self->_transactionScheduledDate != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTransferMoneyIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[_INPBTransferMoneyIntent fromAccount](self, "fromAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBTransferMoneyIntent fromAccount](self, "fromAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTransferMoneyIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBTransferMoneyIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTransferMoneyIntent toAccount](self, "toAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBTransferMoneyIntent toAccount](self, "toAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTransferMoneyIntent transactionAmount](self, "transactionAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBTransferMoneyIntent transactionAmount](self, "transactionAmount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTransferMoneyIntent transactionNote](self, "transactionNote");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();
  -[_INPBTransferMoneyIntent transactionScheduledDate](self, "transactionScheduledDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBTransferMoneyIntent transactionScheduledDate](self, "transactionScheduledDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBTransferMoneyIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBTransferMoneyIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBTransferMoneyIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBTransferMoneyIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBTransferMoneyIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBTransferMoneyIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBTransferMoneyIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = -[_INPBTransferMoneyIntent init](+[_INPBTransferMoneyIntent allocWithZone:](_INPBTransferMoneyIntent, "allocWithZone:"), "init");
  v6 = -[_INPBFinancialAccountValue copyWithZone:](self->_fromAccount, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntent setFromAccount:](v5, "setFromAccount:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = -[_INPBFinancialAccountValue copyWithZone:](self->_toAccount, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntent setToAccount:](v5, "setToAccount:", v8);

  v9 = -[_INPBPaymentAmountValue copyWithZone:](self->_transactionAmount, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntent setTransactionAmount:](v5, "setTransactionAmount:", v9);

  v10 = (void *)-[NSString copyWithZone:](self->_transactionNote, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntent setTransactionNote:](v5, "setTransactionNote:", v10);

  v11 = -[_INPBDateTimeRange copyWithZone:](self->_transactionScheduledDate, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntent setTransactionScheduledDate:](v5, "setTransactionScheduledDate:", v11);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  BOOL v37;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[_INPBTransferMoneyIntent fromAccount](self, "fromAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBTransferMoneyIntent fromAccount](self, "fromAccount");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBTransferMoneyIntent fromAccount](self, "fromAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fromAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBTransferMoneyIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBTransferMoneyIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBTransferMoneyIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBTransferMoneyIntent toAccount](self, "toAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBTransferMoneyIntent toAccount](self, "toAccount");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBTransferMoneyIntent toAccount](self, "toAccount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toAccount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBTransferMoneyIntent transactionAmount](self, "transactionAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBTransferMoneyIntent transactionAmount](self, "transactionAmount");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBTransferMoneyIntent transactionAmount](self, "transactionAmount");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionAmount");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBTransferMoneyIntent transactionNote](self, "transactionNote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBTransferMoneyIntent transactionNote](self, "transactionNote");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBTransferMoneyIntent transactionNote](self, "transactionNote");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionNote");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBTransferMoneyIntent transactionScheduledDate](self, "transactionScheduledDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionScheduledDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBTransferMoneyIntent transactionScheduledDate](self, "transactionScheduledDate");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[_INPBTransferMoneyIntent transactionScheduledDate](self, "transactionScheduledDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionScheduledDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if ((v36 & 1) != 0)
      goto LABEL_35;
  }
  else
  {
LABEL_31:

  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSUInteger v7;

  v3 = -[_INPBFinancialAccountValue hash](self->_fromAccount, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  v5 = -[_INPBFinancialAccountValue hash](self->_toAccount, "hash");
  v6 = v4 ^ v5 ^ -[_INPBPaymentAmountValue hash](self->_transactionAmount, "hash");
  v7 = -[NSString hash](self->_transactionNote, "hash");
  return v6 ^ v7 ^ -[_INPBDateTimeRange hash](self->_transactionScheduledDate, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBTransferMoneyIntent fromAccount](self, "fromAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fromAccount"));

  -[_INPBTransferMoneyIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  -[_INPBTransferMoneyIntent toAccount](self, "toAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("toAccount"));

  -[_INPBTransferMoneyIntent transactionAmount](self, "transactionAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("transactionAmount"));

  if (self->_transactionNote)
  {
    -[_INPBTransferMoneyIntent transactionNote](self, "transactionNote");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("transactionNote"));

  }
  -[_INPBTransferMoneyIntent transactionScheduledDate](self, "transactionScheduledDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("transactionScheduledDate"));

  return v3;
}

- (_INPBFinancialAccountValue)fromAccount
{
  return self->_fromAccount;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBFinancialAccountValue)toAccount
{
  return self->_toAccount;
}

- (_INPBPaymentAmountValue)transactionAmount
{
  return self->_transactionAmount;
}

- (NSString)transactionNote
{
  return self->_transactionNote;
}

- (_INPBDateTimeRange)transactionScheduledDate
{
  return self->_transactionScheduledDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionScheduledDate, 0);
  objc_storeStrong((id *)&self->_transactionNote, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_toAccount, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_fromAccount, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
