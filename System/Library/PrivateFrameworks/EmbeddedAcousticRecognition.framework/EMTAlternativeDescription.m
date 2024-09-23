@implementation EMTAlternativeDescription

- (EMTAlternativeDescription)initWithGenderDescription:(id)a3
{
  id v5;
  EMTAlternativeDescription *v6;
  EMTAlternativeDescription *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMTAlternativeDescription;
  v6 = -[EMTAlternativeDescription init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_alternativeType = 0;
    objc_storeStrong((id *)&v6->_genderDescription, a3);
  }

  return v7;
}

- (EMTAlternativeDescription)initWithMeaningDescription:(id)a3
{
  id v5;
  EMTAlternativeDescription *v6;
  EMTAlternativeDescription *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMTAlternativeDescription;
  v6 = -[EMTAlternativeDescription init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_alternativeType = 1;
    objc_storeStrong((id *)&v6->_meaningDescription, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t alternativeType;
  EMTGenderDescription *genderDescription;
  void *v9;
  BOOL v10;
  BOOL v11;
  EMTMeaningDescription *meaningDescription;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    alternativeType = self->_alternativeType;
    if (alternativeType == 1)
    {
      meaningDescription = self->_meaningDescription;
      objc_msgSend(v5, "meaningDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[EMTMeaningDescription isEqual:](meaningDescription, "isEqual:", v9);
    }
    else
    {
      if (alternativeType)
      {
        v11 = 0;
        goto LABEL_9;
      }
      genderDescription = self->_genderDescription;
      objc_msgSend(v5, "genderDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[EMTGenderDescription isEqual:](genderDescription, "isEqual:", v9);
    }
    v11 = v10;

LABEL_9:
    goto LABEL_10;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (unint64_t)alternativeType
{
  return self->_alternativeType;
}

- (EMTGenderDescription)genderDescription
{
  return self->_genderDescription;
}

- (EMTMeaningDescription)meaningDescription
{
  return self->_meaningDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningDescription, 0);
  objc_storeStrong((id *)&self->_genderDescription, 0);
}

@end
