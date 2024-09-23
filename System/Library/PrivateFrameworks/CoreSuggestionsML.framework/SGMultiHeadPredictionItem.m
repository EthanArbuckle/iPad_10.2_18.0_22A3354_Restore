@implementation SGMultiHeadPredictionItem

- (SGMultiHeadPredictionItem)initWithScore:(id)a3 label:(id)a4
{
  id v8;
  id v9;
  SGMultiHeadPredictionItem *v10;
  SGMultiHeadPredictionItem *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGMultiHeadInference.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("score"));

  }
  v14.receiver = self;
  v14.super_class = (Class)SGMultiHeadPredictionItem;
  v10 = -[SGMultiHeadPredictionItem init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_score, a3);
    objc_storeStrong((id *)&v11->_label, a4);
  }

  return v11;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_score, 0);
}

@end
