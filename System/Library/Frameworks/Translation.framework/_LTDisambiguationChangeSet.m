@implementation _LTDisambiguationChangeSet

- (void)addUserSelection:(id)a3
{
  uint64_t v4;
  void *v5;
  NSString *v6;
  NSNumber *genderNumber;
  NSNumber *v8;
  id v9;

  if (a3)
  {
    objc_msgSend(a3, "edge");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v9, "type");
    if (v4 == 1)
    {
      objc_msgSend(v9, "targetGender");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (NSNumber *)objc_msgSend(v5, "copy");
      genderNumber = self->_genderNumber;
      self->_genderNumber = v8;
    }
    else
    {
      if (v4)
      {
LABEL_8:

        return;
      }
      objc_msgSend(v9, "menuDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (NSString *)objc_msgSend(v5, "copy");
      genderNumber = (NSNumber *)self->_meaningDescription;
      self->_meaningDescription = v6;
    }

    goto LABEL_8;
  }
}

- (BOOL)hasAnyChangeOfType:(unint64_t)a3
{
  void *v3;
  BOOL v4;

  if (a3)
  {
    if (a3 != 1)
      return 0;
    -[_LTDisambiguationChangeSet genderNumber](self, "genderNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_LTDisambiguationChangeSet meaningDescription](self, "meaningDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3 != 0;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _LTDisambiguationChangeSet *v5;
  uint64_t v6;
  NSString *meaningDescription;
  uint64_t v8;
  NSNumber *genderNumber;

  v5 = -[_LTDisambiguationChangeSet init](+[_LTDisambiguationChangeSet allocWithZone:](_LTDisambiguationChangeSet, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_meaningDescription, "copyWithZone:", a3);
  meaningDescription = v5->_meaningDescription;
  v5->_meaningDescription = (NSString *)v6;

  v8 = -[NSNumber copyWithZone:](self->_genderNumber, "copyWithZone:", a3);
  genderNumber = v5->_genderNumber;
  v5->_genderNumber = (NSNumber *)v8;

  return v5;
}

- (NSString)meaningDescription
{
  return self->_meaningDescription;
}

- (NSNumber)genderNumber
{
  return self->_genderNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genderNumber, 0);
  objc_storeStrong((id *)&self->_meaningDescription, 0);
}

@end
