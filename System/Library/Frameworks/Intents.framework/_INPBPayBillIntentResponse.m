@implementation _INPBPayBillIntentResponse

- (void)setBillDetails:(id)a3
{
  objc_storeStrong((id *)&self->_billDetails, a3);
}

- (BOOL)hasBillDetails
{
  return self->_billDetails != 0;
}

- (void)setFromAccount:(id)a3
{
  objc_storeStrong((id *)&self->_fromAccount, a3);
}

- (BOOL)hasFromAccount
{
  return self->_fromAccount != 0;
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
  objc_storeStrong((id *)&self->_transactionNote, a3);
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
  return _INPBPayBillIntentResponseReadFrom(self, (uint64_t)a3);
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
  id v14;

  v14 = a3;
  -[_INPBPayBillIntentResponse billDetails](self, "billDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBPayBillIntentResponse billDetails](self, "billDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPayBillIntentResponse fromAccount](self, "fromAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBPayBillIntentResponse fromAccount](self, "fromAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPayBillIntentResponse transactionAmount](self, "transactionAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBPayBillIntentResponse transactionAmount](self, "transactionAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPayBillIntentResponse transactionNote](self, "transactionNote");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBPayBillIntentResponse transactionNote](self, "transactionNote");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBPayBillIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBPayBillIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBPayBillIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBPayBillIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBPayBillIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBPayBillIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBPayBillIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBPayBillIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBPayBillIntentResponse *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = -[_INPBPayBillIntentResponse init](+[_INPBPayBillIntentResponse allocWithZone:](_INPBPayBillIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBBillDetailsValue copyWithZone:](self->_billDetails, "copyWithZone:", a3);
  -[_INPBPayBillIntentResponse setBillDetails:](v5, "setBillDetails:", v6);

  v7 = -[_INPBFinancialAccountValue copyWithZone:](self->_fromAccount, "copyWithZone:", a3);
  -[_INPBPayBillIntentResponse setFromAccount:](v5, "setFromAccount:", v7);

  v8 = -[_INPBPaymentAmountValue copyWithZone:](self->_transactionAmount, "copyWithZone:", a3);
  -[_INPBPayBillIntentResponse setTransactionAmount:](v5, "setTransactionAmount:", v8);

  v9 = -[_INPBString copyWithZone:](self->_transactionNote, "copyWithZone:", a3);
  -[_INPBPayBillIntentResponse setTransactionNote:](v5, "setTransactionNote:", v9);

  v10 = -[_INPBDateTimeRange copyWithZone:](self->_transactionScheduledDate, "copyWithZone:", a3);
  -[_INPBPayBillIntentResponse setTransactionScheduledDate:](v5, "setTransactionScheduledDate:", v10);

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
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[_INPBPayBillIntentResponse billDetails](self, "billDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "billDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBPayBillIntentResponse billDetails](self, "billDetails");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBPayBillIntentResponse billDetails](self, "billDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "billDetails");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBPayBillIntentResponse fromAccount](self, "fromAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBPayBillIntentResponse fromAccount](self, "fromAccount");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBPayBillIntentResponse fromAccount](self, "fromAccount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fromAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBPayBillIntentResponse transactionAmount](self, "transactionAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBPayBillIntentResponse transactionAmount](self, "transactionAmount");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBPayBillIntentResponse transactionAmount](self, "transactionAmount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionAmount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBPayBillIntentResponse transactionNote](self, "transactionNote");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_26;
  -[_INPBPayBillIntentResponse transactionNote](self, "transactionNote");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBPayBillIntentResponse transactionNote](self, "transactionNote");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionNote");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_27;
  }
  else
  {

  }
  -[_INPBPayBillIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transactionScheduledDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBPayBillIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_30:
      v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    -[_INPBPayBillIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionScheduledDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_30;
  }
  else
  {
LABEL_26:

  }
LABEL_27:
  v32 = 0;
LABEL_28:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[_INPBBillDetailsValue hash](self->_billDetails, "hash");
  v4 = -[_INPBFinancialAccountValue hash](self->_fromAccount, "hash") ^ v3;
  v5 = -[_INPBPaymentAmountValue hash](self->_transactionAmount, "hash");
  v6 = v4 ^ v5 ^ -[_INPBString hash](self->_transactionNote, "hash");
  return v6 ^ -[_INPBDateTimeRange hash](self->_transactionScheduledDate, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBPayBillIntentResponse billDetails](self, "billDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("billDetails"));

  -[_INPBPayBillIntentResponse fromAccount](self, "fromAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("fromAccount"));

  -[_INPBPayBillIntentResponse transactionAmount](self, "transactionAmount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("transactionAmount"));

  -[_INPBPayBillIntentResponse transactionNote](self, "transactionNote");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("transactionNote"));

  -[_INPBPayBillIntentResponse transactionScheduledDate](self, "transactionScheduledDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("transactionScheduledDate"));

  return v3;
}

- (_INPBBillDetailsValue)billDetails
{
  return self->_billDetails;
}

- (_INPBFinancialAccountValue)fromAccount
{
  return self->_fromAccount;
}

- (_INPBPaymentAmountValue)transactionAmount
{
  return self->_transactionAmount;
}

- (_INPBString)transactionNote
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
  objc_storeStrong((id *)&self->_fromAccount, 0);
  objc_storeStrong((id *)&self->_billDetails, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
