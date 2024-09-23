@implementation MapsSuggestionsBaseCondition

- (MapsSuggestionsBaseCondition)initWithName:(id)a3
{
  id v4;
  MapsSuggestionsBaseCondition *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsBaseCondition;
  v5 = -[MapsSuggestionsBaseCondition init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (NSString)description
{
  return (NSString *)NSStringFromMapsSuggestionsJSON(self, 0);
}

- (BOOL)isTrue
{
  BOOL result;

  result = -[MapsSuggestionsBaseCondition doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (NSString)uniqueName
{
  return self->_name;
}

- (id)objectForJSON
{
  return MSg::jsonFor((MSg *)-[MapsSuggestionsBaseCondition isTrue](self, "isTrue"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
