@implementation CUIKOccurrencesCollection

- (CUIKOccurrencesCollection)initWithOccurrences:(id)a3 timedOccurrences:(id)a4 allDayOccurrences:(id)a5 generation:(int)a6
{
  id v10;
  id v11;
  id v12;
  CUIKOccurrencesCollection *v13;
  uint64_t v14;
  NSArray *occurrences;
  uint64_t v16;
  NSArray *allDayOccurrences;
  uint64_t v18;
  NSArray *timedOccurrences;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CUIKOccurrencesCollection;
  v13 = -[CUIKOccurrencesCollection init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    occurrences = v13->_occurrences;
    v13->_occurrences = (NSArray *)v14;

    v16 = objc_msgSend(v12, "copy");
    allDayOccurrences = v13->_allDayOccurrences;
    v13->_allDayOccurrences = (NSArray *)v16;

    v18 = objc_msgSend(v11, "copy");
    timedOccurrences = v13->_timedOccurrences;
    v13->_timedOccurrences = (NSArray *)v18;

    v13->_generation = a6;
  }

  return v13;
}

- (NSArray)timedOccurrences
{
  return self->_timedOccurrences;
}

- (int)generation
{
  return self->_generation;
}

- (NSArray)allDayOccurrences
{
  return self->_allDayOccurrences;
}

- (CUIKOccurrencesCollection)initWithOccurrences:(id)a3 timedOccurrences:(id)a4 allDayOccurrences:(id)a5
{
  return -[CUIKOccurrencesCollection initWithOccurrences:timedOccurrences:allDayOccurrences:generation:](self, "initWithOccurrences:timedOccurrences:allDayOccurrences:generation:", a3, a4, a5, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIKOccurrencesCollection;
  -[CUIKOccurrencesCollection description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("; _occurrences count = %lu"),
    -[NSArray count](self->_occurrences, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)occurrences
{
  return self->_occurrences;
}

- (void)setGeneration:(int)a3
{
  self->_generation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedOccurrences, 0);
  objc_storeStrong((id *)&self->_allDayOccurrences, 0);
  objc_storeStrong((id *)&self->_occurrences, 0);
}

@end
