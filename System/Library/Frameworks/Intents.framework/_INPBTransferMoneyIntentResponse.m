@implementation _INPBTransferMoneyIntentResponse

- (void)setFromAccount:(id)a3
{
  objc_storeStrong((id *)&self->_fromAccount, a3);
}

- (BOOL)hasFromAccount
{
  return self->_fromAccount != 0;
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

- (void)setTransferFee:(id)a3
{
  objc_storeStrong((id *)&self->_transferFee, a3);
}

- (BOOL)hasTransferFee
{
  return self->_transferFee != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBTransferMoneyIntentResponseReadFrom(self, (uint64_t)a3);
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
  -[_INPBTransferMoneyIntentResponse fromAccount](self, "fromAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBTransferMoneyIntentResponse fromAccount](self, "fromAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTransferMoneyIntentResponse toAccount](self, "toAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBTransferMoneyIntentResponse toAccount](self, "toAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTransferMoneyIntentResponse transactionAmount](self, "transactionAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBTransferMoneyIntentResponse transactionAmount](self, "transactionAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTransferMoneyIntentResponse transactionNote](self, "transactionNote");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_INPBTransferMoneyIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBTransferMoneyIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBTransferMoneyIntentResponse transferFee](self, "transferFee");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBTransferMoneyIntentResponse transferFee](self, "transferFee");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBTransferMoneyIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBTransferMoneyIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBTransferMoneyIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBTransferMoneyIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBTransferMoneyIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBTransferMoneyIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBTransferMoneyIntentResponse *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v5 = -[_INPBTransferMoneyIntentResponse init](+[_INPBTransferMoneyIntentResponse allocWithZone:](_INPBTransferMoneyIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBFinancialAccountValue copyWithZone:](self->_fromAccount, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntentResponse setFromAccount:](v5, "setFromAccount:", v6);

  v7 = -[_INPBFinancialAccountValue copyWithZone:](self->_toAccount, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntentResponse setToAccount:](v5, "setToAccount:", v7);

  v8 = -[_INPBPaymentAmountValue copyWithZone:](self->_transactionAmount, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntentResponse setTransactionAmount:](v5, "setTransactionAmount:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_transactionNote, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntentResponse setTransactionNote:](v5, "setTransactionNote:", v9);

  v10 = -[_INPBDateTimeRange copyWithZone:](self->_transactionScheduledDate, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntentResponse setTransactionScheduledDate:](v5, "setTransactionScheduledDate:", v10);

  v11 = -[_INPBCurrencyAmountValue copyWithZone:](self->_transferFee, "copyWithZone:", a3);
  -[_INPBTransferMoneyIntentResponse setTransferFee:](v5, "setTransferFee:", v11);

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
  -[_INPBTransferMoneyIntentResponse fromAccount](self, "fromAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBTransferMoneyIntentResponse fromAccount](self, "fromAccount");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBTransferMoneyIntentResponse fromAccount](self, "fromAccount");
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
  -[_INPBTransferMoneyIntentResponse toAccount](self, "toAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBTransferMoneyIntentResponse toAccount](self, "toAccount");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBTransferMoneyIntentResponse toAccount](self, "toAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBTransferMoneyIntentResponse transactionAmount](self, "transactionAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBTransferMoneyIntentResponse transactionAmount](self, "transactionAmount");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBTransferMoneyIntentResponse transactionAmount](self, "transactionAmount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionAmount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBTransferMoneyIntentResponse transactionNote](self, "transactionNote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBTransferMoneyIntentResponse transactionNote](self, "transactionNote");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBTransferMoneyIntentResponse transactionNote](self, "transactionNote");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionNote");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBTransferMoneyIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionScheduledDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBTransferMoneyIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBTransferMoneyIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionScheduledDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBTransferMoneyIntentResponse transferFee](self, "transferFee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transferFee");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBTransferMoneyIntentResponse transferFee](self, "transferFee");
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

LABEL_35:
      v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    -[_INPBTransferMoneyIntentResponse transferFee](self, "transferFee");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transferFee");
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
  NSUInteger v6;
  unint64_t v7;

  v3 = -[_INPBFinancialAccountValue hash](self->_fromAccount, "hash");
  v4 = -[_INPBFinancialAccountValue hash](self->_toAccount, "hash") ^ v3;
  v5 = -[_INPBPaymentAmountValue hash](self->_transactionAmount, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_transactionNote, "hash");
  v7 = -[_INPBDateTimeRange hash](self->_transactionScheduledDate, "hash");
  return v6 ^ v7 ^ -[_INPBCurrencyAmountValue hash](self->_transferFee, "hash");
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
  -[_INPBTransferMoneyIntentResponse fromAccount](self, "fromAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fromAccount"));

  -[_INPBTransferMoneyIntentResponse toAccount](self, "toAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("toAccount"));

  -[_INPBTransferMoneyIntentResponse transactionAmount](self, "transactionAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("transactionAmount"));

  if (self->_transactionNote)
  {
    -[_INPBTransferMoneyIntentResponse transactionNote](self, "transactionNote");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("transactionNote"));

  }
  -[_INPBTransferMoneyIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("transactionScheduledDate"));

  -[_INPBTransferMoneyIntentResponse transferFee](self, "transferFee");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("transferFee"));

  return v3;
}

- (_INPBFinancialAccountValue)fromAccount
{
  return self->_fromAccount;
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

- (_INPBCurrencyAmountValue)transferFee
{
  return self->_transferFee;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferFee, 0);
  objc_storeStrong((id *)&self->_transactionScheduledDate, 0);
  objc_storeStrong((id *)&self->_transactionNote, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_toAccount, 0);
  objc_storeStrong((id *)&self->_fromAccount, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
