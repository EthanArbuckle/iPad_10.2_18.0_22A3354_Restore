@implementation FCArticleSearchOperationFeedbackResult

- (FCArticleSearchOperationFeedbackResult)initWithSearchOperationRankingFeedBack:(id)a3
{
  id v4;
  FCArticleSearchOperationFeedbackResult *v5;
  uint64_t v6;
  SFRankingFeedback *resultRankingFeedback;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCArticleSearchOperationFeedbackResult;
  v5 = -[FCArticleSearchOperationFeedbackResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    resultRankingFeedback = v5->_resultRankingFeedback;
    v5->_resultRankingFeedback = (SFRankingFeedback *)v6;

  }
  return v5;
}

- (SFRankingFeedback)resultRankingFeedback
{
  return self->_resultRankingFeedback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRankingFeedback, 0);
}

@end
