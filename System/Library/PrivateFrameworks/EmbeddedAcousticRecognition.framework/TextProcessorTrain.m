@implementation TextProcessorTrain

- (TextProcessorTrain)init
{

  return 0;
}

- (TextProcessorTrain)initWithVocab:(id)a3
{
  id v5;
  TextProcessorTrain *v6;
  NSMutableArray *v7;
  NSMutableArray *text;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TextProcessorTrain;
  v6 = -[TextProcessorTrain init](&v10, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    text = v6->_text;
    v6->_text = v7;

    objc_storeStrong((id *)&v6->_vocab, a3);
    v6->_numValidTokens = 0;
  }

  return v6;
}

- (void)addText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TextSequenceTrain *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(TextSequenceTrain);
  v8 = -[_EARLMTKaldiVocab endOfSentenceIndex](self->_vocab, "endOfSentenceIndex");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[TextSequenceTrain addWordWithInputId:](v7, "addWordWithInputId:", -[_EARLMTKaldiVocab indexForWord:](self->_vocab, "indexForWord:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13), (_QWORD)v14));
        ++self->_numValidTokens;
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  -[TextSequenceTrain addWordWithInputId:](v7, "addWordWithInputId:", v8);
  -[NSMutableArray addObject:](self->_text, "addObject:", v7);

}

- (void)addText:(id)a3 length:(unint64_t)a4
{
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSMutableArray *text;
  TextSequenceTrain *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  _EARLMTKaldiVocab *vocab;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  TextSequenceTrain *v21;
  unint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[_EARLMTKaldiVocab endOfSentenceIndex](self->_vocab, "endOfSentenceIndex");
  v9 = -[_EARLMTKaldiVocab beginOfSentenceIndex](self->_vocab, "beginOfSentenceIndex");
  v10 = objc_msgSend(v7, "count");
  if (a4 && v10)
  {
    text = self->_text;
    v12 = -[TextSequenceTrain initWithLength:]([TextSequenceTrain alloc], "initWithLength:", a4);
    -[NSMutableArray addObject:](text, "addObject:", v12);

    -[NSMutableArray objectAtIndexedSubscript:](self->_text, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_text, "count") - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addWordWithInputId:", v9);

    if (objc_msgSend(v7, "count"))
    {
      v14 = 0;
      v15 = 1;
      do
      {
        vocab = self->_vocab;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[_EARLMTKaldiVocab indexForWord:](vocab, "indexForWord:", v17);

        -[NSMutableArray objectAtIndexedSubscript:](self->_text, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_text, "count") - 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addWordWithInputId:", v18);

        ++self->_numValidTokens;
        if (++v15 == a4)
        {
          v15 = a4;
          if (v14 != objc_msgSend(v7, "count") - 1)
          {
            v20 = self->_text;
            v21 = -[TextSequenceTrain initWithLength:]([TextSequenceTrain alloc], "initWithLength:", a4);
            -[NSMutableArray addObject:](v20, "addObject:", v21);

            v15 = 0;
          }
        }
        ++v14;
      }
      while (v14 < objc_msgSend(v7, "count"));
    }
    else
    {
      v15 = 1;
    }
    v22 = a4 - v15;
    if (a4 > v15)
    {
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_text, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_text, "count") - 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addWordWithInputId:", v8);

        --v22;
      }
      while (v22);
    }
  }

}

- (void)addTokenizedText:(id)a3 length:(unint64_t)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSMutableArray *text;
  TextSequenceTrain *v10;
  _EARLMTKaldiVocab *vocab;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  _EARLMTKaldiVocab *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _EARLMTKaldiVocab *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  TextSequenceTrain *v25;
  unint64_t v26;
  void *v27;
  id v28;

  v28 = a3;
  v6 = objc_msgSend(v28, "count");
  if (a4 && v6)
  {
    v7 = -[_EARLMTKaldiVocab endOfSentenceIndex](self->_vocab, "endOfSentenceIndex");
    v8 = -[_EARLMTKaldiVocab beginOfSentenceIndex](self->_vocab, "beginOfSentenceIndex");
    text = self->_text;
    v10 = -[TextSequenceTrain initWithLength:]([TextSequenceTrain alloc], "initWithLength:", a4);
    -[NSMutableArray addObject:](text, "addObject:", v10);

    vocab = self->_vocab;
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_EARLMTKaldiVocab indexForWord:](vocab, "indexForWord:", v12);

    -[NSMutableArray objectAtIndexedSubscript:](self->_text, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_text, "count") - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 1;
    objc_msgSend(v14, "addWordWithInputId:target:mask:", v8, v13, 1);

    if (objc_msgSend(v28, "count"))
    {
      v16 = 0;
      v15 = 1;
      do
      {
        v17 = self->_vocab;
        objc_msgSend(v28, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[_EARLMTKaldiVocab indexForWord:](v17, "indexForWord:", v18);

        v20 = v7;
        if (v16 < objc_msgSend(v28, "count") - 1)
        {
          v21 = self->_vocab;
          objc_msgSend(v28, "objectAtIndexedSubscript:", v16 + 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[_EARLMTKaldiVocab indexForWord:](v21, "indexForWord:", v22);

        }
        -[NSMutableArray objectAtIndexedSubscript:](self->_text, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_text, "count") - 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addWordWithInputId:target:mask:", v19, v20, 1);

        ++self->_numValidTokens;
        if (++v15 == a4)
        {
          v15 = a4;
          if (v16 != objc_msgSend(v28, "count") - 1)
          {
            v24 = self->_text;
            v25 = -[TextSequenceTrain initWithLength:]([TextSequenceTrain alloc], "initWithLength:", a4);
            -[NSMutableArray addObject:](v24, "addObject:", v25);

            v15 = 0;
          }
        }
        ++v16;
      }
      while (v16 < objc_msgSend(v28, "count"));
    }
    v26 = a4 - v15;
    if (a4 > v15)
    {
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_text, "objectAtIndexedSubscript:", -[NSMutableArray count](self->_text, "count") - 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addWordWithInputId:target:mask:", v7, v7, 0);

        --v26;
      }
      while (v26);
    }
  }

}

- (void)shuffleSamples
{
  uint64_t v3;
  unint64_t v4;

  if (-[NSMutableArray count](self->_text, "count"))
  {
    v3 = 0;
    v4 = 0;
    do
    {
      -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->_text, "exchangeObjectAtIndex:withObjectAtIndex:", v4, arc4random() % (unint64_t)(-[NSMutableArray count](self->_text, "count") + v3) + v4);
      ++v4;
      --v3;
    }
    while (v4 < -[NSMutableArray count](self->_text, "count"));
  }
}

- (id)textSequence
{
  return self->_text;
}

- (unint64_t)numberSamples
{
  return -[NSMutableArray count](self->_text, "count");
}

- (int64_t)numberTokens
{
  return *self->_numValidTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
