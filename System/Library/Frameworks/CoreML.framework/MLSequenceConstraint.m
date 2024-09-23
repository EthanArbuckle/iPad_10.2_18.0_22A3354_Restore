@implementation MLSequenceConstraint

- (MLSequenceConstraint)initWithValueDescription:(id)a3 countRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  MLSequenceConstraint *v9;
  MLSequenceConstraint *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLSequenceConstraint;
  v9 = -[MLSequenceConstraint init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_valueDescription, a3);
    v10->_countRange.location = location;
    v10->_countRange.length = length;
  }

  return v10;
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSUInteger length;
  NSUInteger location;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  MLFeatureDescription *valueDescription;
  BOOL v21;
  id v22;
  void *v23;
  BOOL v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v32;
  unsigned int v33;
  id obj;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(v6, "isUndefined") & 1) == 0)
  {
    objc_msgSend(v6, "sequenceValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (objc_msgSend(v6, "type") == 7)
      {
        objc_msgSend(v6, "sequenceValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "values");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");
        location = self->_countRange.location;
        length = self->_countRange.length;

        if (v10 < location || v10 - location >= length)
        {
          if (a4)
          {
            v26 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v8, "values");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "count"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("MLSequenceConstraint count constraint does not allow count of %@"), v28);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          v13 = objc_msgSend(v8, "type");
          if (v13 == -[MLFeatureDescription type](self->_valueDescription, "type"))
          {
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            objc_msgSend(v8, "values");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
            if (v14)
            {
              v15 = v14;
              v16 = 0;
              v17 = *(_QWORD *)v37;
              while (2)
              {
                v18 = 0;
                v32 = v16;
                v33 = v16 + v15;
                do
                {
                  if (*(_QWORD *)v37 != v17)
                    objc_enumerationMutation(obj);
                  +[MLFeatureValue featureValueOfType:fromObject:error:](MLFeatureValue, "featureValueOfType:fromObject:error:", objc_msgSend(v8, "type"), *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v18), 0);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  valueDescription = self->_valueDescription;
                  v35 = 0;
                  v21 = -[MLFeatureDescription isAllowedValue:error:](valueDescription, "isAllowedValue:error:", v19, &v35);
                  v22 = v35;
                  v23 = v22;
                  if (!v21)
                  {
                    if (a4)
                    {
                      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 1, v22, CFSTR("Value at index %d of sequence is not allowed"), v32 + v18);
                      *a4 = (id)objc_claimAutoreleasedReturnValue();
                    }

                    v24 = 0;
                    goto LABEL_30;
                  }

                  ++v18;
                }
                while (v15 != v18);
                v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
                v16 = v33;
                if (v15)
                  continue;
                break;
              }
            }
            v24 = 1;
LABEL_30:

            goto LABEL_31;
          }
          if (a4)
          {
            +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", -[MLFeatureDescription type](self->_valueDescription, "type"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v8, "type"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", CFSTR("MLSequenceConstraint only allows sequence value of type %@. This sequence is type %@"), v29, v30);
            *a4 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        v24 = 0;
LABEL_31:

        goto LABEL_32;
      }
      if (a4)
      {
        v25 = CFSTR("MLSequenceConstraint only allows MLSequence values");
        goto LABEL_18;
      }
LABEL_21:
      v24 = 0;
      goto LABEL_32;
    }
  }
  if (!a4)
    goto LABEL_21;
  v25 = CFSTR("MLSequenceConstraint cannot check undefined values");
LABEL_18:
  +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", v25);
  v24 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MLSequenceConstraint *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  MLSequenceConstraint *v8;

  v4 = +[MLSequenceConstraint allocWithZone:](MLSequenceConstraint, "allocWithZone:", a3);
  -[MLSequenceConstraint valueDescription](self, "valueDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLSequenceConstraint countRange](self, "countRange");
  v8 = -[MLSequenceConstraint initWithValueDescription:countRange:](v4, "initWithValueDescription:countRange:", v5, v6, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  -[MLSequenceConstraint valueDescription](self, "valueDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("valueDescription"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[MLSequenceConstraint countRange](self, "countRange");
  objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("countRange_len"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MLSequenceConstraint countRange](self, "countRange"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("countRange_loc"));

}

- (MLSequenceConstraint)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  MLSequenceConstraint *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("valueDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countRange_loc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countRange_len"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "unsignedIntegerValue");
  v10 = -[MLSequenceConstraint initWithValueDescription:countRange:](self, "initWithValueDescription:countRange:", v5, v7, v9);

  return v10;
}

- (MLFeatureDescription)valueDescription
{
  return self->_valueDescription;
}

- (NSRange)countRange
{
  NSUInteger length;
  NSUInteger location;
  NSRange result;

  length = self->_countRange.length;
  location = self->_countRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueDescription, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
