@implementation SGStructuredEventClassification

- (SGStructuredEventClassification)initWithDictionary:(id)a3
{
  id v4;
  SGStructuredEventClassification *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *locale;
  uint64_t v10;
  NSString *providerName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGStructuredEventClassification;
  v5 = -[SGStructuredEventClassification init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("category"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_category = -[SGStructuredEventClassification categoryForCategoryString:](v5, "categoryForCategoryString:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("use_case"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_useCase = -[SGStructuredEventClassification useCaseForUseCaseString:](v5, "useCaseForUseCaseString:", v7);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v8 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("provider_name"));
    v10 = objc_claimAutoreleasedReturnValue();
    providerName = v5->_providerName;
    v5->_providerName = (NSString *)v10;

  }
  return v5;
}

- (unsigned)categoryForCategoryString:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("flight")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bus")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("train")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("hotel")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("car")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tickets")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("movie")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("restaurant")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("social")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)useCaseForUseCaseString:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoEvent")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Confirmed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Cancelled")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)isCancelled
{
  return self->_useCase == 3;
}

- (unsigned)isCandidateForExtraction
{
  return (self->_useCase & 0xFE) == 2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "describeCategory:", -[SGStructuredEventClassification category](self, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "describeUseCase:", -[SGStructuredEventClassification useCase](self, "useCase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGStructuredEventClassification locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGStructuredEventClassification category:%@ useCase:%@ locale:%@>"), v4, v5, v6);

  return v7;
}

- (unsigned)category
{
  return self->_category;
}

- (unsigned)useCase
{
  return self->_useCase;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

+ (id)describeCategory:(unsigned __int8)a3
{
  if (a3 > 9u)
    return CFSTR("unknown");
  else
    return off_1E7DB1728[a3];
}

+ (id)describeUseCase:(unsigned __int8)a3
{
  if (a3 > 3u)
    return CFSTR("Unknown");
  else
    return off_1E7DB1778[a3];
}

+ (id)categoryForSchema:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("@type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("http://schema.org/LodgingReservation"), "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(CFSTR("http://schema.org/RentalCarReservation"), "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(CFSTR("http://schema.org/FoodEstablishmentReservation"), "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 8;
  }
  else if ((objc_msgSend(CFSTR("http://schema.org/FlightReservation"), "isEqualToString:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else if (objc_msgSend(CFSTR("http://schema.org/EventReservation"), "isEqualToString:", v5))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("@type"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(CFSTR("http://schema.org/MovieShowing"), "isEqualToString:", v9);

      if ((v10 & 1) != 0)
      {
        v6 = 7;
      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("@type"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(CFSTR("http://schema.org/Event"), "isEqualToString:", v12);

        v6 = 6;
        if ((v13 & 1) == 0)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reservationFor"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("@type"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(CFSTR("http://schema.org/MusicEvent"), "isEqualToString:", v15);

          if (v16)
            v6 = 6;
          else
            v6 = 0;
        }
      }
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(a1, "describeCategory:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end
