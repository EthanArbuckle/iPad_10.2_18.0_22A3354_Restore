@implementation _INPBSetTaskAttributeIntentResponse

- (void)setModifiedTask:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedTask, a3);
}

- (BOOL)hasModifiedTask
{
  return self->_modifiedTask != 0;
}

- (void)setWarnings:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)warnings
{
  return self->_warnings.list;
}

- (void)clearWarnings
{
  PBRepeatedInt32Clear();
}

- (void)addWarnings:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)warningsCount
{
  return self->_warnings.count;
}

- (int)warningsAtIndex:(unint64_t)a3
{
  return self->_warnings.list[a3];
}

- (id)warningsAsString:(int)a3
{
  if (a3 < 5)
    return off_1E228B920[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWarnings:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_SERVICES_DISABLED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLAGGED_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_TRIGGER_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_UPGRADED_TO_CLOUDKIT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetTaskAttributeIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_warnings;
  unint64_t v7;
  id v8;

  v8 = a3;
  -[_INPBSetTaskAttributeIntentResponse modifiedTask](self, "modifiedTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetTaskAttributeIntentResponse modifiedTask](self, "modifiedTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  p_warnings = &self->_warnings;
  if (p_warnings->count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < p_warnings->count);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBSetTaskAttributeIntentResponse clearWarnings](self, "clearWarnings");
  v3.receiver = self;
  v3.super_class = (Class)_INPBSetTaskAttributeIntentResponse;
  -[_INPBSetTaskAttributeIntentResponse dealloc](&v3, sel_dealloc);
}

- (_INPBSetTaskAttributeIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetTaskAttributeIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetTaskAttributeIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetTaskAttributeIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetTaskAttributeIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetTaskAttributeIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetTaskAttributeIntentResponse *v5;
  id v6;

  v5 = -[_INPBSetTaskAttributeIntentResponse init](+[_INPBSetTaskAttributeIntentResponse allocWithZone:](_INPBSetTaskAttributeIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBTask copyWithZone:](self->_modifiedTask, "copyWithZone:", a3);
  -[_INPBSetTaskAttributeIntentResponse setModifiedTask:](v5, "setModifiedTask:", v6);

  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_INPBSetTaskAttributeIntentResponse modifiedTask](self, "modifiedTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modifiedTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_INPBSetTaskAttributeIntentResponse modifiedTask](self, "modifiedTask");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        IsEqual = PBRepeatedInt32IsEqual();
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_INPBSetTaskAttributeIntentResponse modifiedTask](self, "modifiedTask");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "modifiedTask");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
        goto LABEL_10;
    }
    else
    {

    }
  }
  IsEqual = 0;
LABEL_8:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = -[_INPBTask hash](self->_modifiedTask, "hash");
  return PBRepeatedInt32Hash() ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSetTaskAttributeIntentResponse modifiedTask](self, "modifiedTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("modifiedTask"));

  if (self->_warnings.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBSetTaskAttributeIntentResponse warningsCount](self, "warningsCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBSetTaskAttributeIntentResponse warningsCount](self, "warningsCount"))
    {
      v7 = 0;
      do
      {
        v8 = self->_warnings.list[v7];
        if (v8 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_warnings.list[v7]);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_1E228B920[v8];
        }
        objc_msgSend(v6, "addObject:", v9);

        ++v7;
      }
      while (v7 < -[_INPBSetTaskAttributeIntentResponse warningsCount](self, "warningsCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("warnings"));

  }
  return v3;
}

- (_INPBTask)modifiedTask
{
  return self->_modifiedTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedTask, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
