@implementation EMTAlternative

- (EMTAlternative)initWithDescription:(id)a3 translationPhraseIndex:(unint64_t)a4 selectionSpanIndex:(unint64_t)a5
{
  id v9;
  EMTAlternative *v10;
  EMTAlternative *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMTAlternative;
  v10 = -[EMTAlternative init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_alternativeDescription, a3);
    v11->_translationPhraseIndex = a4;
    v11->_selectionSpanIndex = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  EMTAlternativeDescription *alternativeDescription;
  void *v7;
  unint64_t translationPhraseIndex;
  unint64_t selectionSpanIndex;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    alternativeDescription = self->_alternativeDescription;
    objc_msgSend(v5, "alternativeDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[EMTAlternativeDescription isEqual:](alternativeDescription, "isEqual:", v7)
      && (translationPhraseIndex = self->_translationPhraseIndex,
          translationPhraseIndex == objc_msgSend(v5, "translationPhraseIndex")))
    {
      selectionSpanIndex = self->_selectionSpanIndex;
      v10 = selectionSpanIndex == objc_msgSend(v5, "selectionSpanIndex");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[EMTAlternativeDescription hash](self->_alternativeDescription, "hash");
  v4 = self->_translationPhraseIndex - v3 + 32 * v3;
  return self->_selectionSpanIndex - v4 + 32 * v4 + 29791;
}

- (EMTAlternativeDescription)alternativeDescription
{
  return self->_alternativeDescription;
}

- (unint64_t)translationPhraseIndex
{
  return self->_translationPhraseIndex;
}

- (unint64_t)selectionSpanIndex
{
  return self->_selectionSpanIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeDescription, 0);
}

@end
