@implementation BLItemContentRating

- (BLItemContentRating)init
{
  BLItemContentRating *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BLItemContentRating;
  v2 = -[BLItemContentRating init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

  }
  return v2;
}

- (BLItemContentRating)initWithDictionary:(id)a3
{
  id v4;
  BLItemContentRating *v5;
  uint64_t v6;
  NSMutableDictionary *dictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLItemContentRating;
  v5 = -[BLItemContentRating init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_dictionary, "mutableCopyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (int64_t)rank
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("rank"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (int)objc_msgSend(v2, "intValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)ratingDescription
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("description"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (NSString)ratingLabel
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (int64_t)ratingSystem
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("system"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend((id)objc_opt_class(), "ratingSystemFromString:", v2);
  else
    v3 = 0;

  return v3;
}

- (void)setRank:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLItemContentRating _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("rank"));

}

- (void)setRatingDescription:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__setValueCopy_forProperty_);
}

- (void)setRatingLabel:(id)a3
{
  MEMORY[0x24BEDD108](self, sel__setValueCopy_forProperty_);
}

- (void)setRatingSystem:(int64_t)a3
{
  id v4;

  objc_msgSend((id)objc_opt_class(), "stringForRatingSystem:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BLItemContentRating _setValue:forProperty:](self, "_setValue:forProperty:", v4, CFSTR("system"));

}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dictionary, "objectForKey:", a3);
}

+ (int64_t)ratingSystemFromString:(id)a3
{
  uint64_t v4;

  v4 = 0;
  while (-[__CFString caseInsensitiveCompare:](*(__CFString **)((char *)&off_24CE8ABA0 + v4), "caseInsensitiveCompare:", a3))
  {
    v4 += 16;
    if (v4 == 1536)
      return 0;
  }
  return *(int64_t *)((char *)&off_24CE8ABA0 + v4 + 8);
}

+ (id)stringForRatingSystem:(int64_t)a3
{
  uint64_t v3;

  v3 = 0;
  while (*(__CFString **)((char *)&off_24CE8ABA0 + v3 + 8) != (__CFString *)a3)
  {
    v3 += 16;
    if (v3 == 1536)
      return 0;
  }
  return *(__CFString **)((char *)&off_24CE8ABA0 + v3);
}

- (NSDictionary)contentRatingDictionary
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_dictionary, "copy");
}

- (void)_setValueCopy:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  -[BLItemContentRating _setValue:forProperty:](self, "_setValue:forProperty:", v7, v6);

}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  NSMutableDictionary *dictionary;

  dictionary = self->_dictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKey:](dictionary, "setObject:forKey:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](dictionary, "removeObjectForKey:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
