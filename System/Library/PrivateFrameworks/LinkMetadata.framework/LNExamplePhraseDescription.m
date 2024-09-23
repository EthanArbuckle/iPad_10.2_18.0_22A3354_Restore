@implementation LNExamplePhraseDescription

- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrase:(id)a5 expected:(id)a6 phraseTemplate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  LNExamplePhraseDescription *v17;
  LNExamplePhraseDescription *v18;
  uint64_t v19;
  NSString *parentIdentifier;
  void *v21;
  uint64_t v22;
  NSArray *phrases;
  uint64_t v24;
  NSString *phrase;
  uint64_t v26;
  NSString *expected;
  uint64_t v28;
  NSString *phraseTemplate;
  LNExamplePhraseDescription *v30;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNExamplePhraseDescription.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentIdentifier"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNExamplePhraseDescription.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("phrase"));

LABEL_3:
  v34.receiver = self;
  v34.super_class = (Class)LNExamplePhraseDescription;
  v17 = -[LNExamplePhraseDescription init](&v34, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_kind = a3;
    v19 = objc_msgSend(v13, "copy");
    parentIdentifier = v18->_parentIdentifier;
    v18->_parentIdentifier = (NSString *)v19;

    v21 = (void *)objc_msgSend(v14, "copy");
    v35[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    phrases = v18->_phrases;
    v18->_phrases = (NSArray *)v22;

    v24 = objc_msgSend(v14, "copy");
    phrase = v18->_phrase;
    v18->_phrase = (NSString *)v24;

    v26 = objc_msgSend(v15, "copy");
    expected = v18->_expected;
    v18->_expected = (NSString *)v26;

    v28 = objc_msgSend(v16, "copy");
    phraseTemplate = v18->_phraseTemplate;
    v18->_phraseTemplate = (NSString *)v28;

    v30 = v18;
  }

  return v18;
}

- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrases:(id)a5 phrase:(id)a6 expected:(id)a7 parameter:(id)a8 phraseTemplate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  LNExamplePhraseDescription *v21;
  LNExamplePhraseDescription *v22;
  uint64_t v23;
  NSString *parentIdentifier;
  uint64_t v25;
  NSArray *phrases;
  uint64_t v27;
  NSString *phrase;
  uint64_t v29;
  NSString *expected;
  uint64_t v31;
  NSString *parameter;
  uint64_t v33;
  NSString *phraseTemplate;
  LNExamplePhraseDescription *v35;
  objc_super v37;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v37.receiver = self;
  v37.super_class = (Class)LNExamplePhraseDescription;
  v21 = -[LNExamplePhraseDescription init](&v37, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_kind = a3;
    v23 = objc_msgSend(v15, "copy");
    parentIdentifier = v22->_parentIdentifier;
    v22->_parentIdentifier = (NSString *)v23;

    v25 = objc_msgSend(v16, "copy");
    phrases = v22->_phrases;
    v22->_phrases = (NSArray *)v25;

    v27 = objc_msgSend(v17, "copy");
    phrase = v22->_phrase;
    v22->_phrase = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    expected = v22->_expected;
    v22->_expected = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    parameter = v22->_parameter;
    v22->_parameter = (NSString *)v31;

    v33 = objc_msgSend(v20, "copy");
    phraseTemplate = v22->_phraseTemplate;
    v22->_phraseTemplate = (NSString *)v33;

    v35 = v22;
  }

  return v22;
}

- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrases:(id)a5 expected:(id)a6
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  LNExamplePhraseDescription *v14;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_1E39A2988;
  }
  v14 = -[LNExamplePhraseDescription initWithKind:parentIdentifier:phrase:expected:phraseTemplate:](self, "initWithKind:parentIdentifier:phrase:expected:phraseTemplate:", a3, v10, v13, v12, 0);

  return v14;
}

- (LNExamplePhraseDescription)initWithOpenStringParameter:(id)a3 parentIdentifier:(id)a4 phrases:(id)a5
{
  return -[LNExamplePhraseDescription initWithKind:parentIdentifier:phrase:expected:phraseTemplate:](self, "initWithKind:parentIdentifier:phrase:expected:phraseTemplate:", 1, a4, &stru_1E39A2988, 0, 0);
}

- (LNExamplePhraseDescription)initWithNegativePhrases:(id)a3 parentIdentifier:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  LNExamplePhraseDescription *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E39A2988;
  }
  v9 = -[LNExamplePhraseDescription initWithKind:parentIdentifier:phrase:expected:phraseTemplate:](self, "initWithKind:parentIdentifier:phrase:expected:phraseTemplate:", 4, v7, v8, 0, 0);

  return v9;
}

- (LNExamplePhraseDescription)initWithKind:(int64_t)a3 parentIdentifier:(id)a4 phrases:(id)a5 expected:(id)a6 parameter:(id)a7
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  LNExamplePhraseDescription *v15;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_1E39A2988;
  }
  v15 = -[LNExamplePhraseDescription initWithKind:parentIdentifier:phrase:expected:phraseTemplate:](self, "initWithKind:parentIdentifier:phrase:expected:phraseTemplate:", a3, v11, v14, v13, 0);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNExamplePhraseDescription kind](self, "kind"), CFSTR("kind"));
  -[LNExamplePhraseDescription parentIdentifier](self, "parentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parentIdentifier"));

  -[LNExamplePhraseDescription phrases](self, "phrases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("phrases"));

  -[LNExamplePhraseDescription phrase](self, "phrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("phrase"));

  -[LNExamplePhraseDescription expected](self, "expected");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("expected"));

  -[LNExamplePhraseDescription parameter](self, "parameter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("parameter"));

  -[LNExamplePhraseDescription phraseTemplate](self, "phraseTemplate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("phraseTemplate"));

}

- (LNExamplePhraseDescription)initWithCoder:(id)a3
{
  id v4;
  LNExamplePhraseDescription *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LNExamplePhraseDescription *v12;

  v4 = a3;
  v5 = (LNExamplePhraseDescription *)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kind"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phrases"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phrase"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phraseTemplate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v5 == (LNExamplePhraseDescription *)1)
    {
      if (!v10)
      {
        v5 = 0;
        goto LABEL_8;
      }
      v12 = -[LNExamplePhraseDescription initWithKind:parentIdentifier:phrases:expected:](self, "initWithKind:parentIdentifier:phrases:expected:", 1, v6, v7, v9);
    }
    else
    {
      v12 = -[LNExamplePhraseDescription initWithKind:parentIdentifier:phrases:phrase:expected:parameter:phraseTemplate:](self, "initWithKind:parentIdentifier:phrases:phrase:expected:parameter:phraseTemplate:", v5, v6, v7, v8, v9, v10, v11);
    }
    self = v12;
    v5 = self;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  v3 = -[LNExamplePhraseDescription kind](self, "kind");
  -[LNExamplePhraseDescription phrases](self, "phrases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[LNExamplePhraseDescription expected](self, "expected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[LNExamplePhraseDescription parameter](self, "parameter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[LNExamplePhraseDescription phrase](self, "phrase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[LNExamplePhraseDescription phraseTemplate](self, "phraseTemplate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  LNExamplePhraseDescription *v4;
  LNExamplePhraseDescription *v5;
  LNExamplePhraseDescription *v6;
  int64_t v7;
  void *v8;
  void *v9;
  LNExamplePhraseDescription *v10;
  LNExamplePhraseDescription *v11;
  LNExamplePhraseDescription *v12;
  _BOOL4 v13;
  LNExamplePhraseDescription *v14;
  LNExamplePhraseDescription *v15;
  int v16;
  void *v17;
  void *v18;
  LNExamplePhraseDescription *v19;
  LNExamplePhraseDescription *v20;
  LNExamplePhraseDescription *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  LNExamplePhraseDescription *v25;
  LNExamplePhraseDescription *v26;
  void *v27;
  void *v28;
  LNExamplePhraseDescription *v29;
  LNExamplePhraseDescription *v30;
  LNExamplePhraseDescription *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  LNExamplePhraseDescription *v35;
  LNExamplePhraseDescription *v36;
  LNExamplePhraseDescription *v38;
  LNExamplePhraseDescription *v39;
  LNExamplePhraseDescription *v40;
  LNExamplePhraseDescription *v41;

  v4 = (LNExamplePhraseDescription *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = -[LNExamplePhraseDescription kind](self, "kind");
        if (v7 != -[LNExamplePhraseDescription kind](v6, "kind"))
        {
          LOBYTE(v13) = 0;
LABEL_48:

          goto LABEL_49;
        }
        -[LNExamplePhraseDescription phrases](self, "phrases");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNExamplePhraseDescription phrases](v6, "phrases");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {

        }
        else
        {
          LOBYTE(v13) = 0;
          v14 = v11;
          v15 = v10;
          if (!v10 || !v11)
            goto LABEL_45;
          v16 = -[LNExamplePhraseDescription isEqualToArray:](v10, "isEqualToArray:", v11);

          if (!v16)
          {
            LOBYTE(v13) = 0;
LABEL_46:

            goto LABEL_47;
          }
        }
        -[LNExamplePhraseDescription expected](self, "expected");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNExamplePhraseDescription expected](v6, "expected");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v17;
        v19 = v18;
        v14 = v19;
        if (v15 == v19)
        {

        }
        else
        {
          LOBYTE(v13) = 0;
          v20 = v19;
          v21 = v15;
          if (!v15 || !v19)
            goto LABEL_44;
          v22 = -[LNExamplePhraseDescription isEqual:](v15, "isEqual:", v19);

          if (!v22)
          {
            LOBYTE(v13) = 0;
LABEL_45:

            goto LABEL_46;
          }
        }
        -[LNExamplePhraseDescription parameter](self, "parameter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNExamplePhraseDescription parameter](v6, "parameter");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v23;
        v25 = v24;
        v20 = v25;
        v41 = v21;
        if (v21 == v25)
        {

        }
        else
        {
          LOBYTE(v13) = 0;
          v26 = v25;
          if (!v21 || !v25)
            goto LABEL_43;
          v13 = -[LNExamplePhraseDescription isEqual:](v21, "isEqual:", v25);

          if (!v13)
            goto LABEL_44;
        }
        -[LNExamplePhraseDescription phrase](self, "phrase", v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNExamplePhraseDescription phrase](v6, "phrase");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v27;
        v30 = v28;
        v39 = v30;
        v40 = v29;
        if (v29 == v30)
        {

        }
        else
        {
          LOBYTE(v13) = 0;
          if (!v29)
          {
            v31 = v30;
            v20 = v38;
            goto LABEL_41;
          }
          v31 = v30;
          v20 = v38;
          if (!v30)
          {
LABEL_41:

            goto LABEL_42;
          }
          v32 = -[LNExamplePhraseDescription isEqual:](v29, "isEqual:", v30);

          if (!v32)
          {
            LOBYTE(v13) = 0;
            v20 = v38;
LABEL_42:
            v26 = v39;
            v21 = v40;
LABEL_43:

            v21 = v41;
LABEL_44:

            goto LABEL_45;
          }
        }
        -[LNExamplePhraseDescription phraseTemplate](self, "phraseTemplate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[LNExamplePhraseDescription phraseTemplate](v6, "phraseTemplate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v33;
        v35 = v34;
        v36 = v35;
        if (v29 == v35)
        {
          LOBYTE(v13) = 1;
        }
        else
        {
          LOBYTE(v13) = 0;
          if (v29)
          {
            v20 = v38;
            if (v35)
              LOBYTE(v13) = -[LNExamplePhraseDescription isEqual:](v29, "isEqual:", v35);
            goto LABEL_39;
          }
        }
        v20 = v38;
LABEL_39:

        v31 = v36;
        goto LABEL_41;
      }
      LOBYTE(v13) = 0;
      v10 = v6;
      v6 = 0;
    }
    else
    {
      v10 = 0;
      LOBYTE(v13) = 0;
    }
LABEL_47:

    goto LABEL_48;
  }
  LOBYTE(v13) = 1;
LABEL_49:

  return v13;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = self;
  switch(-[LNExamplePhraseDescription kind](self, "kind"))
  {
    case 0:
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v2, "parentIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "phrases");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "phrase");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "expected");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "phraseTemplate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Intent parentIdentifier:%@ phrases:%@ phrase:%@ expected invocation:%@ phraseTemplate:%@"), v4, v5, v6, v8, v9);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    case 1:
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v2, "parameter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "phrases");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Parameter:%@ Phrases:%@"), v4, v5);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v2, "phrases");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "phrase");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "expected");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Entity phrases:%@ phrase:%@ expected entity:%@"), v4, v5, v6);
      goto LABEL_6;
    case 3:
    case 4:
      v3 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v2, "phrases");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "phrase");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "expected");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("Query phrases:%@ phrase:%@ expected query:%@"), v4, v5, v6);
LABEL_6:
      v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_8:
      break;
    default:
      return v2;
  }
  return v2;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (NSString)phrase
{
  return self->_phrase;
}

- (NSString)phraseTemplate
{
  return self->_phraseTemplate;
}

- (NSString)expected
{
  return self->_expected;
}

- (NSString)parameter
{
  return self->_parameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_expected, 0);
  objc_storeStrong((id *)&self->_phraseTemplate, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
