@implementation CNACTStewieFacadeTestDouble

- (CNACTStewieFacadeTestDouble)initWithPhrases:(id)a3 numbers:(id)a4
{
  id v6;
  id v7;
  CNACTStewieFacadeTestDouble *v8;
  uint64_t v9;
  NSArray *phrases;
  uint64_t v11;
  NSArray *numbers;
  CNACTStewieFacadeTestDouble *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNACTStewieFacadeTestDouble;
  v8 = -[CNACTStewieFacadeTestDouble init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    phrases = v8->_phrases;
    v8->_phrases = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    numbers = v8->_numbers;
    v8->_numbers = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)isEmergencyEnabled
{
  return -[NSArray count](self->_numbers, "count") != 0;
}

- (BOOL)isAvocetEnabled
{
  return -[NSArray count](self->_numbers, "count") != 0;
}

- (id)terms
{
  NSArray *numbers;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  numbers = self->_numbers;
  v6[0] = self->_phrases;
  v6[1] = numbers;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_flatten");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)emergencyTerms
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)avocetTerms
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->avocetTerms, 0);
  objc_storeStrong((id *)&self->emergencyTerms, 0);
  objc_storeStrong((id *)&self->_numbers, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
}

@end
