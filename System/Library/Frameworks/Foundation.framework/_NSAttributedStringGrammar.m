@implementation _NSAttributedStringGrammar

- (_NSAttributedStringGrammar)init
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSAttributedStringGrammar;
  return -[_NSAttributedStringGrammar init](&v3, sel_init);
}

+ (_NSAttributedStringGrammar)identityGrammar
{
  return (_NSAttributedStringGrammar *)objc_alloc_init((Class)a1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSAttributedStringGrammar *v4;

  v4 = objc_alloc_init(_NSAttributedStringGrammar);
  v4->_aspect = -[_NSAttributedStringGrammar aspect](self, "aspect");
  v4->_deictic = -[_NSAttributedStringGrammar deictic](self, "deictic");
  v4->_determinationType = -[_NSAttributedStringGrammar determinationType](self, "determinationType");
  v4->_gender = -[_NSAttributedStringGrammar gender](self, "gender");
  v4->_grammaticalCase = -[_NSAttributedStringGrammar grammaticalCase](self, "grammaticalCase");
  v4->_mood = -[_NSAttributedStringGrammar mood](self, "mood");
  v4->_number = -[_NSAttributedStringGrammar number](self, "number");
  v4->_person = -[_NSAttributedStringGrammar person](self, "person");
  v4->_position = -[_NSAttributedStringGrammar position](self, "position");
  v4->_tense = -[_NSAttributedStringGrammar tense](self, "tense");
  v4->_verbForm = -[_NSAttributedStringGrammar verbForm](self, "verbForm");
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;

  v3 = objc_msgSend((id)objc_opt_class(), "hash");
  v4 = -[_NSAttributedStringGrammar aspect](self, "aspect");
  v5 = v4 ^ -[_NSAttributedStringGrammar deictic](self, "deictic") ^ v3;
  v6 = -[_NSAttributedStringGrammar determinationType](self, "determinationType");
  v7 = v6 ^ -[_NSAttributedStringGrammar gender](self, "gender");
  v8 = v5 ^ v7 ^ -[_NSAttributedStringGrammar grammaticalCase](self, "grammaticalCase");
  v9 = -[_NSAttributedStringGrammar mood](self, "mood");
  v10 = v9 ^ -[_NSAttributedStringGrammar number](self, "number");
  v11 = v10 ^ -[_NSAttributedStringGrammar person](self, "person");
  v12 = v8 ^ v11 ^ -[_NSAttributedStringGrammar position](self, "position");
  v13 = -[_NSAttributedStringGrammar tense](self, "tense");
  return v12 ^ v13 ^ -[_NSAttributedStringGrammar verbForm](self, "verbForm");
}

- (BOOL)isEqual:(id)a3
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[_NSAttributedStringGrammar aspect](self, "aspect");
  if (v5 != objc_msgSend(a3, "aspect"))
    return 0;
  v6 = -[_NSAttributedStringGrammar deictic](self, "deictic");
  if (v6 != objc_msgSend(a3, "deictic"))
    return 0;
  v7 = -[_NSAttributedStringGrammar determinationType](self, "determinationType");
  if (v7 != objc_msgSend(a3, "determinationType"))
    return 0;
  v8 = -[_NSAttributedStringGrammar gender](self, "gender");
  if (v8 != objc_msgSend(a3, "gender"))
    return 0;
  v9 = -[_NSAttributedStringGrammar grammaticalCase](self, "grammaticalCase");
  if (v9 != objc_msgSend(a3, "grammaticalCase"))
    return 0;
  v10 = -[_NSAttributedStringGrammar mood](self, "mood");
  if (v10 != objc_msgSend(a3, "mood"))
    return 0;
  v11 = -[_NSAttributedStringGrammar number](self, "number");
  if (v11 != objc_msgSend(a3, "number"))
    return 0;
  v12 = -[_NSAttributedStringGrammar person](self, "person");
  if (v12 != objc_msgSend(a3, "person"))
    return 0;
  v13 = -[_NSAttributedStringGrammar position](self, "position");
  if (v13 != objc_msgSend(a3, "position"))
    return 0;
  v14 = -[_NSAttributedStringGrammar tense](self, "tense");
  if (v14 != objc_msgSend(a3, "tense"))
    return 0;
  v15 = -[_NSAttributedStringGrammar verbForm](self, "verbForm");
  return v15 == objc_msgSend(a3, "verbForm");
}

- (_NSAttributedStringGrammar)initWithMorphology:(id)a3
{
  _NSAttributedStringGrammar *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_NSAttributedStringGrammar;
  v4 = -[_NSAttributedStringGrammar init](&v14, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "grammaticalGender");
    if (v5 <= 3)
      -[_NSAttributedStringGrammar setGender:](v4, "setGender:", qword_1822CD150[v5]);
    v6 = objc_msgSend(a3, "number");
    if (v6 <= 6)
      -[_NSAttributedStringGrammar setNumber:](v4, "setNumber:", qword_1822CD170[v6]);
    v7 = objc_msgSend(a3, "partOfSpeech");
    if (v7 <= 0xE)
      -[_NSAttributedStringGrammar setPosition:](v4, "setPosition:", v7);
    v8 = objc_msgSend(a3, "grammaticalCase") - 1;
    if (v8 > 0xC)
      v9 = 0;
    else
      v9 = qword_1822CD1A8[v8];
    -[_NSAttributedStringGrammar setGrammaticalCase:](v4, "setGrammaticalCase:", v9);
    v10 = objc_msgSend(a3, "definiteness");
    v11 = 3;
    if (v10 != 1)
      v11 = 0;
    if (v10 == 2)
      v12 = 2;
    else
      v12 = v11;
    -[_NSAttributedStringGrammar setDeterminationType:](v4, "setDeterminationType:", v12);
  }
  return v4;
}

- (int64_t)aspect
{
  return self->_aspect;
}

- (void)setAspect:(int64_t)a3
{
  self->_aspect = a3;
}

- (int64_t)deictic
{
  return self->_deictic;
}

- (void)setDeictic:(int64_t)a3
{
  self->_deictic = a3;
}

- (int64_t)determinationType
{
  return self->_determinationType;
}

- (void)setDeterminationType:(int64_t)a3
{
  self->_determinationType = a3;
}

- (int64_t)gender
{
  return self->_gender;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (int64_t)grammaticalCase
{
  return self->_grammaticalCase;
}

- (void)setGrammaticalCase:(int64_t)a3
{
  self->_grammaticalCase = a3;
}

- (int64_t)mood
{
  return self->_mood;
}

- (void)setMood:(int64_t)a3
{
  self->_mood = a3;
}

- (int64_t)number
{
  return self->_number;
}

- (void)setNumber:(int64_t)a3
{
  self->_number = a3;
}

- (int64_t)person
{
  return self->_person;
}

- (void)setPerson:(int64_t)a3
{
  self->_person = a3;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (int64_t)tense
{
  return self->_tense;
}

- (void)setTense:(int64_t)a3
{
  self->_tense = a3;
}

- (int64_t)verbForm
{
  return self->_verbForm;
}

- (void)setVerbForm:(int64_t)a3
{
  self->_verbForm = a3;
}

- (id)_initWithMarkdownDictionary:(id)a3
{
  _NSAttributedStringGrammar *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  _NSAttributedStringGrammar *v38;

  v4 = -[_NSAttributedStringGrammar init](self, "init");
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("aspect"));
    if (v5 && (v6 = v5, (objc_msgSend(v5, "isEqual:", CFSTR("none")) & 1) == 0))
    {
      if ((objc_msgSend(v6, "isEqual:", CFSTR("perfect")) & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        if ((objc_msgSend(v6, "isEqual:", CFSTR("imperfect")) & 1) == 0)
          goto LABEL_152;
        v7 = 2;
      }
    }
    else
    {
      v7 = 0;
    }
    -[_NSAttributedStringGrammar setAspect:](v4, "setAspect:", v7);
    v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("deictic"));
    if (v8 && (v9 = v8, (objc_msgSend(v8, "isEqual:", CFSTR("none")) & 1) == 0))
    {
      if ((objc_msgSend(v9, "isEqual:", CFSTR("distal")) & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        if ((objc_msgSend(v9, "isEqual:", CFSTR("proximal")) & 1) == 0)
          goto LABEL_152;
        v10 = 2;
      }
    }
    else
    {
      v10 = 0;
    }
    -[_NSAttributedStringGrammar setDeictic:](v4, "setDeictic:", v10);
    v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("determinationType"));
    if (v11 && (v12 = v11, (objc_msgSend(v11, "isEqual:", CFSTR("none")) & 1) == 0))
    {
      if ((objc_msgSend(v12, "isEqual:", CFSTR("demonstrative")) & 1) != 0)
      {
        v13 = 1;
      }
      else if ((objc_msgSend(v12, "isEqual:", CFSTR("definite")) & 1) != 0)
      {
        v13 = 2;
      }
      else
      {
        if ((objc_msgSend(v12, "isEqual:", CFSTR("indefinite")) & 1) == 0)
          goto LABEL_152;
        v13 = 3;
      }
    }
    else
    {
      v13 = 0;
    }
    -[_NSAttributedStringGrammar setDeterminationType:](v4, "setDeterminationType:", v13);
    v14 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("grammaticalGender"));
    if (v14 && (v15 = v14, (objc_msgSend(v14, "isEqual:", CFSTR("none")) & 1) == 0))
    {
      if ((objc_msgSend(v15, "isEqual:", CFSTR("masculine")) & 1) != 0)
      {
        v16 = 1;
      }
      else if ((objc_msgSend(v15, "isEqual:", CFSTR("feminine")) & 1) != 0)
      {
        v16 = 2;
      }
      else if ((objc_msgSend(v15, "isEqual:", CFSTR("neuter")) & 1) != 0)
      {
        v16 = 3;
      }
      else
      {
        if ((objc_msgSend(v15, "isEqual:", CFSTR("common")) & 1) == 0)
          goto LABEL_152;
        v16 = 4;
      }
    }
    else
    {
      v16 = 0;
    }
    -[_NSAttributedStringGrammar setGender:](v4, "setGender:", v16);
    v17 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("grammaticalCase"));
    if (v17 && (v18 = v17, (objc_msgSend(v17, "isEqual:", CFSTR("none")) & 1) == 0))
    {
      if ((objc_msgSend(v18, "isEqual:", CFSTR("accusative")) & 1) != 0)
      {
        v19 = 1;
      }
      else if ((objc_msgSend(v18, "isEqual:", CFSTR("dative")) & 1) != 0)
      {
        v19 = 2;
      }
      else if ((objc_msgSend(v18, "isEqual:", CFSTR("genitive")) & 1) != 0)
      {
        v19 = 3;
      }
      else if ((objc_msgSend(v18, "isEqual:", CFSTR("locative")) & 1) != 0)
      {
        v19 = 4;
      }
      else if ((objc_msgSend(v18, "isEqual:", CFSTR("nominative")) & 1) != 0)
      {
        v19 = 5;
      }
      else if ((objc_msgSend(v18, "isEqual:", CFSTR("partitive")) & 1) != 0)
      {
        v19 = 6;
      }
      else if ((objc_msgSend(v18, "isEqual:", CFSTR("instrumental")) & 1) != 0)
      {
        v19 = 7;
      }
      else if ((objc_msgSend(v18, "isEqual:", CFSTR("prepositional")) & 1) != 0)
      {
        v19 = 8;
      }
      else if ((objc_msgSend(v18, "isEqual:", CFSTR("object")) & 1) != 0)
      {
        v19 = 9;
      }
      else if ((objc_msgSend(v18, "isEqual:", CFSTR("directObject")) & 1) != 0)
      {
        v19 = 10;
      }
      else
      {
        if ((objc_msgSend(v18, "isEqual:", CFSTR("indirectObject")) & 1) == 0)
          goto LABEL_152;
        v19 = 11;
      }
    }
    else
    {
      v19 = 0;
    }
    -[_NSAttributedStringGrammar setGrammaticalCase:](v4, "setGrammaticalCase:", v19);
    v20 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("mood"));
    if (v20 && (v21 = v20, (objc_msgSend(v20, "isEqual:", CFSTR("none")) & 1) == 0))
    {
      if ((objc_msgSend(v21, "isEqual:", CFSTR("conditional")) & 1) != 0)
      {
        v22 = 1;
      }
      else if ((objc_msgSend(v21, "isEqual:", CFSTR("subjunctive")) & 1) != 0)
      {
        v22 = 2;
      }
      else if ((objc_msgSend(v21, "isEqual:", CFSTR("imperative")) & 1) != 0)
      {
        v22 = 3;
      }
      else
      {
        if ((objc_msgSend(v21, "isEqual:", CFSTR("indicative")) & 1) == 0)
          goto LABEL_152;
        v22 = 4;
      }
    }
    else
    {
      v22 = 0;
    }
    -[_NSAttributedStringGrammar setMood:](v4, "setMood:", v22);
    v23 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("number"));
    if (v23 && (v24 = v23, (objc_msgSend(v23, "isEqual:", CFSTR("none")) & 1) == 0))
    {
      if ((objc_msgSend(v24, "isEqual:", CFSTR("one")) & 1) != 0)
      {
        v25 = 1;
      }
      else if ((objc_msgSend(v24, "isEqual:", CFSTR("two")) & 1) != 0)
      {
        v25 = 2;
      }
      else if ((objc_msgSend(v24, "isEqual:", CFSTR("few")) & 1) != 0)
      {
        v25 = 3;
      }
      else if ((objc_msgSend(v24, "isEqual:", CFSTR("many")) & 1) != 0)
      {
        v25 = 4;
      }
      else if ((objc_msgSend(v24, "isEqual:", CFSTR("zero")) & 1) != 0)
      {
        v25 = 5;
      }
      else
      {
        if ((objc_msgSend(v24, "isEqual:", CFSTR("other")) & 1) == 0)
          goto LABEL_152;
        v25 = 6;
      }
    }
    else
    {
      v25 = 0;
    }
    -[_NSAttributedStringGrammar setNumber:](v4, "setNumber:", v25);
    v26 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("person"));
    if (v26 && (v27 = v26, (objc_msgSend(v26, "isEqual:", CFSTR("none")) & 1) == 0))
    {
      if ((objc_msgSend(v27, "isEqual:", CFSTR("first")) & 1) != 0)
      {
        v28 = 1;
      }
      else if ((objc_msgSend(v27, "isEqual:", CFSTR("second")) & 1) != 0)
      {
        v28 = 2;
      }
      else
      {
        if ((objc_msgSend(v27, "isEqual:", CFSTR("third")) & 1) == 0)
          goto LABEL_152;
        v28 = 3;
      }
    }
    else
    {
      v28 = 0;
    }
    -[_NSAttributedStringGrammar setPerson:](v4, "setPerson:", v28);
    v29 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("partOfSpeech"));
    if (v29 && (v30 = v29, (objc_msgSend(v29, "isEqual:", CFSTR("none")) & 1) == 0))
    {
      if ((objc_msgSend(v30, "isEqual:", CFSTR("determiner")) & 1) != 0)
      {
        v31 = 1;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("pronoun")) & 1) != 0)
      {
        v31 = 2;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("letter")) & 1) != 0)
      {
        v31 = 3;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("adverb")) & 1) != 0)
      {
        v31 = 4;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("particle")) & 1) != 0)
      {
        v31 = 5;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("adjective")) & 1) != 0)
      {
        v31 = 6;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("adposition")) & 1) != 0)
      {
        v31 = 7;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("verb")) & 1) != 0)
      {
        v31 = 8;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("noun")) & 1) != 0)
      {
        v31 = 9;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("conjunction")) & 1) != 0)
      {
        v31 = 10;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("numeral")) & 1) != 0)
      {
        v31 = 11;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("interjection")) & 1) != 0)
      {
        v31 = 12;
      }
      else if ((objc_msgSend(v30, "isEqual:", CFSTR("preposition")) & 1) != 0)
      {
        v31 = 13;
      }
      else
      {
        if ((objc_msgSend(v30, "isEqual:", CFSTR("abbreviation")) & 1) == 0)
          goto LABEL_152;
        v31 = 14;
      }
    }
    else
    {
      v31 = 0;
    }
    -[_NSAttributedStringGrammar setPosition:](v4, "setPosition:", v31);
    v32 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("tense"));
    if (v32 && (v33 = v32, (objc_msgSend(v32, "isEqual:", CFSTR("none")) & 1) == 0))
    {
      if ((objc_msgSend(v33, "isEqual:", CFSTR("past")) & 1) != 0)
      {
        v34 = 1;
      }
      else if ((objc_msgSend(v33, "isEqual:", CFSTR("present")) & 1) != 0)
      {
        v34 = 2;
      }
      else
      {
        if ((objc_msgSend(v33, "isEqual:", CFSTR("future")) & 1) == 0)
          goto LABEL_152;
        v34 = 3;
      }
    }
    else
    {
      v34 = 0;
    }
    -[_NSAttributedStringGrammar setTense:](v4, "setTense:", v34);
    v35 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("verbForm"));
    if (!v35)
    {
      v38 = v4;
      v37 = 0;
LABEL_119:
      -[_NSAttributedStringGrammar setVerbForm:](v38, "setVerbForm:", v37);
      return v4;
    }
    v36 = v35;
    if ((objc_msgSend(v35, "isEqual:", CFSTR("none")) & 1) != 0)
    {
      v37 = 0;
LABEL_118:
      v38 = v4;
      goto LABEL_119;
    }
    if ((objc_msgSend(v36, "isEqual:", CFSTR("gerund")) & 1) != 0)
    {
      v37 = 1;
      goto LABEL_118;
    }
    if ((objc_msgSend(v36, "isEqual:", CFSTR("participative")) & 1) != 0)
    {
      v37 = 2;
      goto LABEL_118;
    }
    if ((objc_msgSend(v36, "isEqual:", CFSTR("infinitive")) & 1) != 0)
    {
      v37 = 3;
      goto LABEL_118;
    }
    if ((objc_msgSend(v36, "isEqual:", CFSTR("participle")) & 1) != 0)
    {
      v37 = 4;
      goto LABEL_118;
    }
    if (objc_msgSend(v36, "isEqual:", CFSTR("supine")))
    {
      v37 = 5;
      goto LABEL_118;
    }
LABEL_152:

    return 0;
  }
  return v4;
}

@end
