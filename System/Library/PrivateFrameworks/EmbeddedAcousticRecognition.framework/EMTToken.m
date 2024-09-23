@implementation EMTToken

- (EMTToken)initWithText:(id)a3 confidence:(float)a4 precededBySpace:(BOOL)a5 followedBySpace:(BOOL)a6
{
  return -[EMTToken initWithText:confidence:score:precededBySpace:followedBySpace:](self, "initWithText:confidence:score:precededBySpace:followedBySpace:", a3, a5, a6);
}

- (EMTToken)initWithText:(id)a3 confidence:(float)a4 score:(float)a5 precededBySpace:(BOOL)a6 followedBySpace:(BOOL)a7
{
  id v12;
  EMTToken *v13;
  uint64_t v14;
  NSString *text;
  objc_super v17;

  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EMTToken;
  v13 = -[EMTToken init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    text = v13->_text;
    v13->_text = (NSString *)v14;

    v13->_confidence = a4;
    v13->_score = a5;
    v13->_precededBySpace = a6;
    v13->_followedBySpace = a7;
  }

  return v13;
}

- (id)description
{
  return self->_text;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSString *text;
  void *v7;
  float confidence;
  float v9;
  float score;
  float v11;
  int precededBySpace;
  int followedBySpace;
  BOOL v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    text = self->_text;
    objc_msgSend(v5, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqual:](text, "isEqual:", v7)
      && (confidence = self->_confidence, objc_msgSend(v5, "confidence"), confidence == v9)
      && (score = self->_score, objc_msgSend(v5, "score"), score == v11)
      && (precededBySpace = self->_precededBySpace, precededBySpace == objc_msgSend(v5, "precededBySpace")))
    {
      followedBySpace = self->_followedBySpace;
      v14 = followedBySpace == objc_msgSend(v5, "followedBySpace");
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;

  if (self->_confidence == 0.0)
    v2 = 0;
  else
    v2 = 527 * LODWORD(self->_confidence);
  return 17 * (17 * (v2 + -[NSString hash](self->_text, "hash")) + 11 * self->_precededBySpace)
       + 11 * self->_followedBySpace;
}

- (NSString)text
{
  return self->_text;
}

- (float)confidence
{
  return self->_confidence;
}

- (float)score
{
  return self->_score;
}

- (BOOL)precededBySpace
{
  return self->_precededBySpace;
}

- (BOOL)followedBySpace
{
  return self->_followedBySpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
