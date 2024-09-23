@implementation HKCodableQuantityValueWithRange

- (void)clearCodes
{
  -[NSMutableArray removeAllObjects](self->_codes, "removeAllObjects");
}

- (void)addCode:(id)a3
{
  id v4;
  NSMutableArray *codes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  codes = self->_codes;
  v8 = v4;
  if (!codes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_codes;
    self->_codes = v6;

    v4 = v8;
    codes = self->_codes;
  }
  -[NSMutableArray addObject:](codes, "addObject:", v4);

}

- (unint64_t)codesCount
{
  return -[NSMutableArray count](self->_codes, "count");
}

- (id)codeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_codes, "objectAtIndex:", a3);
}

+ (Class)codeType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasQuantityValue
{
  return self->_quantityValue != 0;
}

- (BOOL)hasTextualValue
{
  return self->_textualValue != 0;
}

- (BOOL)hasReferenceRangeMin
{
  return self->_referenceRangeMin != 0;
}

- (BOOL)hasReferenceRangeMax
{
  return self->_referenceRangeMax != 0;
}

- (BOOL)hasValueTitle
{
  return self->_valueTitle != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HKCodableQuantityValueWithRange;
  -[HKCodableQuantityValueWithRange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableQuantityValueWithRange dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  HKCodableQuantity *quantityValue;
  void *v12;
  NSString *textualValue;
  HKCodableQuantity *referenceRangeMin;
  void *v15;
  HKCodableQuantity *referenceRangeMax;
  void *v17;
  NSString *valueTitle;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_codes, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_codes, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = self->_codes;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("code"));
  }
  quantityValue = self->_quantityValue;
  if (quantityValue)
  {
    -[HKCodableQuantity dictionaryRepresentation](quantityValue, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("quantityValue"));

  }
  textualValue = self->_textualValue;
  if (textualValue)
    objc_msgSend(v3, "setObject:forKey:", textualValue, CFSTR("textualValue"));
  referenceRangeMin = self->_referenceRangeMin;
  if (referenceRangeMin)
  {
    -[HKCodableQuantity dictionaryRepresentation](referenceRangeMin, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("referenceRangeMin"));

  }
  referenceRangeMax = self->_referenceRangeMax;
  if (referenceRangeMax)
  {
    -[HKCodableQuantity dictionaryRepresentation](referenceRangeMax, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("referenceRangeMax"));

  }
  valueTitle = self->_valueTitle;
  if (valueTitle)
    objc_msgSend(v3, "setObject:forKey:", valueTitle, CFSTR("valueTitle"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableQuantityValueWithRangeReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_codes;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_quantityValue)
    PBDataWriterWriteSubmessage();
  if (self->_textualValue)
    PBDataWriterWriteStringField();
  if (self->_referenceRangeMin)
    PBDataWriterWriteSubmessage();
  if (self->_referenceRangeMax)
    PBDataWriterWriteSubmessage();
  if (self->_valueTitle)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[HKCodableQuantityValueWithRange codesCount](self, "codesCount"))
  {
    objc_msgSend(v9, "clearCodes");
    v4 = -[HKCodableQuantityValueWithRange codesCount](self, "codesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HKCodableQuantityValueWithRange codeAtIndex:](self, "codeAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addCode:", v7);

      }
    }
  }
  if (self->_quantityValue)
    objc_msgSend(v9, "setQuantityValue:");
  v8 = v9;
  if (self->_textualValue)
  {
    objc_msgSend(v9, "setTextualValue:");
    v8 = v9;
  }
  if (self->_referenceRangeMin)
  {
    objc_msgSend(v9, "setReferenceRangeMin:");
    v8 = v9;
  }
  if (self->_referenceRangeMax)
  {
    objc_msgSend(v9, "setReferenceRangeMax:");
    v8 = v9;
  }
  if (self->_valueTitle)
  {
    objc_msgSend(v9, "setValueTitle:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = self->_codes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v23);
        objc_msgSend(v5, "addCode:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  v12 = -[HKCodableQuantity copyWithZone:](self->_quantityValue, "copyWithZone:", a3);
  v13 = (void *)v5[2];
  v5[2] = v12;

  v14 = -[NSString copyWithZone:](self->_textualValue, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  v16 = -[HKCodableQuantity copyWithZone:](self->_referenceRangeMin, "copyWithZone:", a3);
  v17 = (void *)v5[4];
  v5[4] = v16;

  v18 = -[HKCodableQuantity copyWithZone:](self->_referenceRangeMax, "copyWithZone:", a3);
  v19 = (void *)v5[3];
  v5[3] = v18;

  v20 = -[NSString copyWithZone:](self->_valueTitle, "copyWithZone:", a3);
  v21 = (void *)v5[6];
  v5[6] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *codes;
  HKCodableQuantity *quantityValue;
  NSString *textualValue;
  HKCodableQuantity *referenceRangeMin;
  HKCodableQuantity *referenceRangeMax;
  NSString *valueTitle;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((codes = self->_codes, !((unint64_t)codes | v4[1]))
     || -[NSMutableArray isEqual:](codes, "isEqual:"))
    && ((quantityValue = self->_quantityValue, !((unint64_t)quantityValue | v4[2]))
     || -[HKCodableQuantity isEqual:](quantityValue, "isEqual:"))
    && ((textualValue = self->_textualValue, !((unint64_t)textualValue | v4[5]))
     || -[NSString isEqual:](textualValue, "isEqual:"))
    && ((referenceRangeMin = self->_referenceRangeMin, !((unint64_t)referenceRangeMin | v4[4]))
     || -[HKCodableQuantity isEqual:](referenceRangeMin, "isEqual:"))
    && ((referenceRangeMax = self->_referenceRangeMax, !((unint64_t)referenceRangeMax | v4[3]))
     || -[HKCodableQuantity isEqual:](referenceRangeMax, "isEqual:")))
  {
    valueTitle = self->_valueTitle;
    if ((unint64_t)valueTitle | v4[6])
      v11 = -[NSString isEqual:](valueTitle, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NSMutableArray hash](self->_codes, "hash");
  v4 = -[HKCodableQuantity hash](self->_quantityValue, "hash") ^ v3;
  v5 = -[NSString hash](self->_textualValue, "hash");
  v6 = v4 ^ v5 ^ -[HKCodableQuantity hash](self->_referenceRangeMin, "hash");
  v7 = -[HKCodableQuantity hash](self->_referenceRangeMax, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_valueTitle, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  HKCodableQuantity *quantityValue;
  id v11;
  HKCodableQuantity *referenceRangeMin;
  id v13;
  HKCodableQuantity *referenceRangeMax;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4[1];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        -[HKCodableQuantityValueWithRange addCode:](self, "addCode:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  quantityValue = self->_quantityValue;
  v11 = v4[2];
  if (quantityValue)
  {
    if (v11)
      -[HKCodableQuantity mergeFrom:](quantityValue, "mergeFrom:");
  }
  else if (v11)
  {
    -[HKCodableQuantityValueWithRange setQuantityValue:](self, "setQuantityValue:");
  }
  if (v4[5])
    -[HKCodableQuantityValueWithRange setTextualValue:](self, "setTextualValue:");
  referenceRangeMin = self->_referenceRangeMin;
  v13 = v4[4];
  if (referenceRangeMin)
  {
    if (v13)
      -[HKCodableQuantity mergeFrom:](referenceRangeMin, "mergeFrom:");
  }
  else if (v13)
  {
    -[HKCodableQuantityValueWithRange setReferenceRangeMin:](self, "setReferenceRangeMin:");
  }
  referenceRangeMax = self->_referenceRangeMax;
  v15 = v4[3];
  if (referenceRangeMax)
  {
    if (v15)
      -[HKCodableQuantity mergeFrom:](referenceRangeMax, "mergeFrom:");
  }
  else if (v15)
  {
    -[HKCodableQuantityValueWithRange setReferenceRangeMax:](self, "setReferenceRangeMax:");
  }
  if (v4[6])
    -[HKCodableQuantityValueWithRange setValueTitle:](self, "setValueTitle:");

}

- (NSMutableArray)codes
{
  return self->_codes;
}

- (void)setCodes:(id)a3
{
  objc_storeStrong((id *)&self->_codes, a3);
}

- (HKCodableQuantity)quantityValue
{
  return self->_quantityValue;
}

- (void)setQuantityValue:(id)a3
{
  objc_storeStrong((id *)&self->_quantityValue, a3);
}

- (NSString)textualValue
{
  return self->_textualValue;
}

- (void)setTextualValue:(id)a3
{
  objc_storeStrong((id *)&self->_textualValue, a3);
}

- (HKCodableQuantity)referenceRangeMin
{
  return self->_referenceRangeMin;
}

- (void)setReferenceRangeMin:(id)a3
{
  objc_storeStrong((id *)&self->_referenceRangeMin, a3);
}

- (HKCodableQuantity)referenceRangeMax
{
  return self->_referenceRangeMax;
}

- (void)setReferenceRangeMax:(id)a3
{
  objc_storeStrong((id *)&self->_referenceRangeMax, a3);
}

- (NSString)valueTitle
{
  return self->_valueTitle;
}

- (void)setValueTitle:(id)a3
{
  objc_storeStrong((id *)&self->_valueTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTitle, 0);
  objc_storeStrong((id *)&self->_textualValue, 0);
  objc_storeStrong((id *)&self->_referenceRangeMin, 0);
  objc_storeStrong((id *)&self->_referenceRangeMax, 0);
  objc_storeStrong((id *)&self->_quantityValue, 0);
  objc_storeStrong((id *)&self->_codes, 0);
}

@end
