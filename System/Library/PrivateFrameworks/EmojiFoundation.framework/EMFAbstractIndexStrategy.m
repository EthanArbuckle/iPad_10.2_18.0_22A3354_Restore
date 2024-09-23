@implementation EMFAbstractIndexStrategy

- (EMFAbstractIndexStrategy)initWithTermIndex:(id)a3 andDocumentIndex:(id)a4
{
  id v7;
  id v8;
  EMFAbstractIndexStrategy *v9;
  EMFAbstractIndexStrategy *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EMFAbstractIndexStrategy;
  v9 = -[EMFAbstractIndexStrategy init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_termIndex, a3);
    objc_storeStrong((id *)&v10->_documentIndex, a4);
  }

  return v10;
}

- (id)postingsForTerm:(id)a3
{
  -[EMFAbstractIndexStrategy assertMethodNeedsConcreteImplementation:](self, "assertMethodNeedsConcreteImplementation:", a2);
  return 0;
}

- (id)termsForDocument:(id)a3
{
  -[EMFAbstractIndexStrategy assertMethodNeedsConcreteImplementation:](self, "assertMethodNeedsConcreteImplementation:", a2);
  return 0;
}

- (id)termWeightForTerm:(id)a3 inDocument:(id)a4
{
  -[EMFAbstractIndexStrategy assertMethodNeedsConcreteImplementation:](self, "assertMethodNeedsConcreteImplementation:", a2, a4);
  return 0;
}

- (id)calculateDocumentWeightsForQueryTokenCounts:(id)a3
{
  -[EMFAbstractIndexStrategy assertMethodNeedsConcreteImplementation:](self, "assertMethodNeedsConcreteImplementation:", a2);
  return 0;
}

- (id)commonDocumentsForTerms:(id)a3
{
  -[EMFAbstractIndexStrategy assertMethodNeedsConcreteImplementation:](self, "assertMethodNeedsConcreteImplementation:", a2);
  return 0;
}

- (NSDictionary)termIndex
{
  return self->_termIndex;
}

- (void)setTermIndex:(id)a3
{
  objc_storeStrong((id *)&self->_termIndex, a3);
}

- (NSDictionary)documentIndex
{
  return self->_documentIndex;
}

- (void)setDocumentIndex:(id)a3
{
  objc_storeStrong((id *)&self->_documentIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentIndex, 0);
  objc_storeStrong((id *)&self->_termIndex, 0);
}

@end
