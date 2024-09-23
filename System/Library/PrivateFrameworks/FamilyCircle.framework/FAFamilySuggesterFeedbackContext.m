@implementation FAFamilySuggesterFeedbackContext

- (FAFamilySuggesterFeedbackContext)initWithPredictionContext:(id)a3 suggestions:(id)a4
{
  id v7;
  id v8;
  FAFamilySuggesterFeedbackContext *v9;
  FAFamilySuggesterFeedbackContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FAFamilySuggesterFeedbackContext;
  v9 = -[FAFamilySuggesterFeedbackContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_peopleSuggesterPredictionContext, a3);
    objc_storeStrong((id *)&v10->_peopleSuggesterSuggestions, a4);
    v10->_megadomeFeedbackEventId = -1;
  }

  return v10;
}

- (FAFamilySuggesterFeedbackContext)initWithMegadomeFeedbackEventID:(int64_t)a3
{
  FAFamilySuggesterFeedbackContext *v4;
  FAFamilySuggesterFeedbackContext *v5;
  _PSPredictionContext *peopleSuggesterPredictionContext;
  NSArray *peopleSuggesterSuggestions;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FAFamilySuggesterFeedbackContext;
  v4 = -[FAFamilySuggesterFeedbackContext init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    peopleSuggesterPredictionContext = v4->_peopleSuggesterPredictionContext;
    v4->_peopleSuggesterPredictionContext = 0;

    peopleSuggesterSuggestions = v5->_peopleSuggesterSuggestions;
    v5->_peopleSuggesterSuggestions = 0;

    v5->_megadomeFeedbackEventId = a3;
  }
  return v5;
}

- (_PSPredictionContext)peopleSuggesterPredictionContext
{
  return self->_peopleSuggesterPredictionContext;
}

- (NSArray)peopleSuggesterSuggestions
{
  return self->_peopleSuggesterSuggestions;
}

- (int64_t)megadomeFeedbackEventId
{
  return self->_megadomeFeedbackEventId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleSuggesterSuggestions, 0);
  objc_storeStrong((id *)&self->_peopleSuggesterPredictionContext, 0);
}

@end
