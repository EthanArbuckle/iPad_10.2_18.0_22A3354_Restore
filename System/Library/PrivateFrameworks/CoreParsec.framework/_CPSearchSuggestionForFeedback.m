@implementation _CPSearchSuggestionForFeedback

- (BOOL)readFrom:(id)a3
{
  return _CPSearchSuggestionForFeedbackReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[_CPSearchSuggestionForFeedback identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_CPSearchSuggestionForFeedback suggestion](self, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_CPSearchSuggestionForFeedback query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_CPSearchSuggestionForFeedback score](self, "score");
  if (v7 != 0.0)
    PBDataWriterWriteDoubleField();
  if (-[_CPSearchSuggestionForFeedback type](self, "type"))
    PBDataWriterWriteInt32Field();
  -[_CPSearchSuggestionForFeedback fbr](self, "fbr");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    PBDataWriterWriteStringField();
  -[_CPSearchSuggestionForFeedback topicIdentifier](self, "topicIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v9)
  {
    PBDataWriterWriteStringField();
    v10 = v11;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  double score;
  double v23;
  int type;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  BOOL v35;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[_CPSearchSuggestionForFeedback identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[_CPSearchSuggestionForFeedback identifier](self, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_CPSearchSuggestionForFeedback identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_29;
  }
  else
  {

  }
  -[_CPSearchSuggestionForFeedback suggestion](self, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[_CPSearchSuggestionForFeedback suggestion](self, "suggestion");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_CPSearchSuggestionForFeedback suggestion](self, "suggestion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suggestion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_29;
  }
  else
  {

  }
  -[_CPSearchSuggestionForFeedback query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[_CPSearchSuggestionForFeedback query](self, "query");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_CPSearchSuggestionForFeedback query](self, "query");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "query");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_29;
  }
  else
  {

  }
  score = self->_score;
  objc_msgSend(v4, "score");
  if (score != v23)
    goto LABEL_29;
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_29;
  -[_CPSearchSuggestionForFeedback fbr](self, "fbr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fbr");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[_CPSearchSuggestionForFeedback fbr](self, "fbr");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[_CPSearchSuggestionForFeedback fbr](self, "fbr");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fbr");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_29;
  }
  else
  {

  }
  -[_CPSearchSuggestionForFeedback topicIdentifier](self, "topicIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_CPSearchSuggestionForFeedback topicIdentifier](self, "topicIdentifier");
    v30 = objc_claimAutoreleasedReturnValue();
    if (!v30)
    {

LABEL_32:
      v35 = 1;
      goto LABEL_30;
    }
    v31 = (void *)v30;
    -[_CPSearchSuggestionForFeedback topicIdentifier](self, "topicIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topicIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    if ((v34 & 1) != 0)
      goto LABEL_32;
  }
  else
  {
LABEL_28:

  }
LABEL_29:
  v35 = 0;
LABEL_30:

  return v35;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  double score;
  NSUInteger v7;
  double v8;
  long double v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v12;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_suggestion, "hash") ^ v3;
  v5 = -[NSString hash](self->_query, "hash");
  score = self->_score;
  v7 = v4 ^ v5;
  v8 = -score;
  if (score >= 0.0)
    v8 = self->_score;
  v9 = round(v8);
  v10 = (unint64_t)(fmod(v9, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v8 - v9, 0x40uLL);
  v11 = 2654435761 * self->_type;
  v12 = -[NSString hash](self->_fbr, "hash");
  return v7 ^ v12 ^ v11 ^ -[NSString hash](self->_topicIdentifier, "hash") ^ v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)fbr
{
  return self->_fbr;
}

- (void)setFbr:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (void)setTopicIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicIdentifier, 0);
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (_CPSearchSuggestionForFeedback)initWithFacade:(id)a3
{
  id v4;
  _CPSearchSuggestionForFeedback *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _CPSearchSuggestionForFeedback *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_CPSearchSuggestionForFeedback;
  v5 = -[_CPSearchSuggestionForFeedback init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPSearchSuggestionForFeedback setIdentifier:](v5, "setIdentifier:", v7);

    }
    objc_msgSend(v4, "suggestion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "suggestion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPSearchSuggestionForFeedback setSuggestion:](v5, "setSuggestion:", v9);

    }
    objc_msgSend(v4, "query");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "query");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPSearchSuggestionForFeedback setQuery:](v5, "setQuery:", v11);

    }
    objc_msgSend(v4, "score");
    -[_CPSearchSuggestionForFeedback setScore:](v5, "setScore:");
    -[_CPSearchSuggestionForFeedback setType:](v5, "setType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "fbr");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "fbr");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPSearchSuggestionForFeedback setFbr:](v5, "setFbr:", v13);

    }
    objc_msgSend(v4, "topicIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "topicIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CPSearchSuggestionForFeedback setTopicIdentifier:](v5, "setTopicIdentifier:", v15);

    }
    v16 = v5;
  }

  return v5;
}

@end
