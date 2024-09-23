@implementation MLContentRating

- (MLContentRating)init
{
  return -[MLContentRating initWithContentRatingDictionary:](self, "initWithContentRatingDictionary:", 0);
}

- (MLContentRating)initWithContentRatingDictionary:(id)a3
{
  id v4;
  MLContentRating *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLContentRating;
  v5 = -[MLContentRating init](&v9, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
    else
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    dictionary = v5->_dictionary;
    v5->_dictionary = v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContentRatingDictionary:", self->_dictionary);
}

- (NSString)ratingDescription
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("content"));
}

- (NSString)ratingLabel
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("label"));
}

- (NSNumber)ratingRank
{
  void *v2;
  id v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("rank"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "integerValue"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return (NSNumber *)v4;
}

- (NSString)ratingSystem
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("system"));
}

- (void)setRatingDescription:(id)a3
{
  -[MLContentRating _setValueCopy:forKey:](self, "_setValueCopy:forKey:", a3, CFSTR("content"));
}

- (void)setRatingLabel:(id)a3
{
  -[MLContentRating _setValueCopy:forKey:](self, "_setValueCopy:forKey:", a3, CFSTR("label"));
}

- (void)setRatingRank:(id)a3
{
  -[MLContentRating _setValueCopy:forKey:](self, "_setValueCopy:forKey:", a3, CFSTR("rank"));
}

- (void)setRatingSystem:(id)a3
{
  -[MLContentRating _setValueCopy:forKey:](self, "_setValueCopy:forKey:", a3, CFSTR("system"));
}

- (MLContentRating)initWithStringRepresentation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MLContentRating *v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("|"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v6, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("system"));

      if (v8 != 1)
      {
        objc_msgSend(v6, "objectAtIndex:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("label"));

        if (v8 >= 3)
        {
          v11 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v6, "objectAtIndex:", 2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("rank"));

        }
        objc_msgSend(v6, "objectAtIndex:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("content"));

      }
    }

  }
  v15 = -[MLContentRating initWithContentRatingDictionary:](self, "initWithContentRatingDictionary:", v5);

  return v15;
}

- (id)copyStringRepresentation
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  const __CFString *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[MLContentRating ratingSystem](self, "ratingSystem");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E5B66908;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@|"), v6);
  -[MLContentRating ratingLabel](self, "ratingLabel");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = &stru_1E5B66908;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@|"), v8);
  -[MLContentRating ratingRank](self, "ratingRank");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = v10;
  else
    v11 = &stru_1E5B66908;
  objc_msgSend(v3, "appendFormat:", CFSTR("%@|"), v11);
  -[MLContentRating ratingDescription](self, "ratingDescription");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;
  else
    v13 = &stru_1E5B66908;
  objc_msgSend(v3, "appendString:", v13);

  return v3;
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](dictionary, "removeObjectForKey:", a4);
}

- (void)_setValueCopy:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  -[MLContentRating _setValue:forKey:](self, "_setValue:forKey:", v7, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
