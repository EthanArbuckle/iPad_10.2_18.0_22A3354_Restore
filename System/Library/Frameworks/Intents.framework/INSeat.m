@implementation INSeat

- (INSeat)initWithSeatSection:(NSString *)seatSection seatRow:(NSString *)seatRow seatNumber:(NSString *)seatNumber seatingType:(NSString *)seatingType
{
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  INSeat *v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  NSString *v20;
  uint64_t v21;
  NSString *v22;
  objc_super v24;

  v10 = seatSection;
  v11 = seatRow;
  v12 = seatNumber;
  v13 = seatingType;
  v24.receiver = self;
  v24.super_class = (Class)INSeat;
  v14 = -[INSeat init](&v24, sel_init);
  if (v14)
  {
    v15 = -[NSString copy](v10, "copy");
    v16 = v14->_seatSection;
    v14->_seatSection = (NSString *)v15;

    v17 = -[NSString copy](v11, "copy");
    v18 = v14->_seatRow;
    v14->_seatRow = (NSString *)v17;

    v19 = -[NSString copy](v12, "copy");
    v20 = v14->_seatNumber;
    v14->_seatNumber = (NSString *)v19;

    v21 = -[NSString copy](v13, "copy");
    v22 = v14->_seatingType;
    v14->_seatingType = (NSString *)v21;

  }
  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_seatSection, "hash");
  v4 = -[NSString hash](self->_seatRow, "hash") ^ v3;
  v5 = -[NSString hash](self->_seatNumber, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_seatingType, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INSeat *v4;
  INSeat *v5;
  NSString *seatSection;
  NSString *seatRow;
  NSString *seatNumber;
  NSString *seatingType;
  BOOL v10;

  v4 = (INSeat *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      seatSection = self->_seatSection;
      v10 = 0;
      if (seatSection == v5->_seatSection || -[NSString isEqual:](seatSection, "isEqual:"))
      {
        seatRow = self->_seatRow;
        if (seatRow == v5->_seatRow || -[NSString isEqual:](seatRow, "isEqual:"))
        {
          seatNumber = self->_seatNumber;
          if (seatNumber == v5->_seatNumber || -[NSString isEqual:](seatNumber, "isEqual:"))
          {
            seatingType = self->_seatingType;
            if (seatingType == v5->_seatingType || -[NSString isEqual:](seatingType, "isEqual:"))
              v10 = 1;
          }
        }
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (INSeat)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  INSeat *v21;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("seatSection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("seatRow"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("seatNumber"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v19, CFSTR("seatingType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[INSeat initWithSeatSection:seatRow:seatNumber:seatingType:](self, "initWithSeatSection:seatRow:seatNumber:seatingType:", v8, v12, v16, v20);
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *seatSection;
  id v5;

  seatSection = self->_seatSection;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", seatSection, CFSTR("seatSection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seatRow, CFSTR("seatRow"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seatNumber, CFSTR("seatNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_seatingType, CFSTR("seatingType"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_seatSection);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("seatSection"));

  objc_msgSend(v6, "encodeObject:", self->_seatRow);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("seatRow"));

  objc_msgSend(v6, "encodeObject:", self->_seatNumber);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("seatNumber"));

  objc_msgSend(v6, "encodeObject:", self->_seatingType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("seatingType"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INSeat descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INSeat;
  -[INSeat description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSeat _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *seatSection;
  void *v4;
  NSString *seatRow;
  void *v6;
  NSString *seatNumber;
  void *v8;
  NSString *seatingType;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("seatSection");
  seatSection = self->_seatSection;
  v4 = seatSection;
  if (!seatSection)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[0] = v4;
  v13[1] = CFSTR("seatRow");
  seatRow = self->_seatRow;
  v6 = seatRow;
  if (!seatRow)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v6;
  v13[2] = CFSTR("seatNumber");
  seatNumber = self->_seatNumber;
  v8 = seatNumber;
  if (!seatNumber)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[2] = v8;
  v13[3] = CFSTR("seatingType");
  seatingType = self->_seatingType;
  v10 = seatingType;
  if (!seatingType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (seatingType)
  {
    if (seatNumber)
      goto LABEL_11;
  }
  else
  {

    if (seatNumber)
    {
LABEL_11:
      if (seatRow)
        goto LABEL_12;
LABEL_16:

      if (seatSection)
        return v11;
LABEL_17:

      return v11;
    }
  }

  if (!seatRow)
    goto LABEL_16;
LABEL_12:
  if (!seatSection)
    goto LABEL_17;
  return v11;
}

- (NSString)seatSection
{
  return self->_seatSection;
}

- (NSString)seatRow
{
  return self->_seatRow;
}

- (NSString)seatNumber
{
  return self->_seatNumber;
}

- (NSString)seatingType
{
  return self->_seatingType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seatingType, 0);
  objc_storeStrong((id *)&self->_seatNumber, 0);
  objc_storeStrong((id *)&self->_seatRow, 0);
  objc_storeStrong((id *)&self->_seatSection, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("seatSection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("seatRow"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("seatNumber"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("seatingType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSeatSection:seatRow:seatNumber:seatingType:", v7, v8, v9, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
