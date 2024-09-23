@implementation INFSentenceContext

- (id)combinedWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[INFSentenceContext sentenceContext](INFSentenceContext, "sentenceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNumber:", self->_number);
  objc_msgSend(v5, "setGender:", self->_gender);
  objc_msgSend(v4, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "number");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setNumber:", v7);

  }
  if (objc_msgSend(v4, "gender"))
    objc_msgSend(v5, "setGender:", objc_msgSend(v4, "gender"));

  return v5;
}

- (NSNumber)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)gender
{
  return self->_gender;
}

- (void)setGender:(unint64_t)a3
{
  self->_gender = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_number, 0);
}

+ (id)sentenceContext
{
  return objc_alloc_init((Class)a1);
}

@end
