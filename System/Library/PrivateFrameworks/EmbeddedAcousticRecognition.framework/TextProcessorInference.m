@implementation TextProcessorInference

- (TextProcessorInference)init
{

  return 0;
}

- (TextProcessorInference)initWithVocab:(id)a3
{
  id v5;
  TextProcessorInference *v6;
  TextProcessorInference *v7;
  NSMutableArray *v8;
  NSMutableArray *text;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TextProcessorInference;
  v6 = -[TextProcessorInference init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_vocab, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    text = v7->_text;
    v7->_text = v8;

  }
  return v7;
}

- (TextProcessorInference)initWithLength:(unint64_t)a3 vocab:(id)a4 BOS:(unint64_t)a5
{
  TextProcessorInference *v7;
  TextSequenceInference *v8;

  v7 = -[TextProcessorInference initWithVocab:](self, "initWithVocab:", a4);
  if (v7)
  {
    v8 = -[TextSequenceInference initWithLength:BOS:]([TextSequenceInference alloc], "initWithLength:BOS:", a3, a5);
    -[NSMutableArray addObject:](v7->_text, "addObject:", v8);

  }
  return v7;
}

- (void)resetWithBOS:(unint64_t)a3
{
  id v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_text, "objectAtIndexedSubscript:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetWithBOS:", a3);

}

- (void)addText:(id)a3
{
  unint64_t v4;
  id v5;

  v4 = -[_EARLMTKaldiVocab indexForWord:](self->_vocab, "indexForWord:", a3);
  -[NSMutableArray objectAtIndexedSubscript:](self->_text, "objectAtIndexedSubscript:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addWordWithInputId:", v4);

}

- (id)textSequence
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
