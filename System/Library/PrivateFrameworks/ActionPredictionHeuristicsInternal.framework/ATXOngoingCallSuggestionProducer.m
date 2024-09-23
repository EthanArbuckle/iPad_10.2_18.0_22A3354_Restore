@implementation ATXOngoingCallSuggestionProducer

- (ATXOngoingCallSuggestionProducer)initWithEnvironment:(id)a3
{
  id v5;
  ATXOngoingCallSuggestionProducer *v6;
  ATXOngoingCallSuggestionProducer *v7;
  ATXOngoingCallSuggestionProducer *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXOngoingCallSuggestionProducer;
  v6 = -[ATXOngoingCallSuggestionProducer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    v8 = v7;
  }

  return v7;
}

- (id)suggestionsForOngoingCall:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_msgSend(v4, "count");
  if (v6 >= 4)
    v7 = 4;
  else
    v7 = v6;
  if (v7)
  {
    v8 = 0;
    v9 = 80;
    do
    {
      -[ATXContextHeuristicsEnvironment heuristicDevice](self->_environment, "heuristicDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "resolveContact:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[ATXOngoingCallSuggestionProducer suggestionWithContact:score:](self, "suggestionWithContact:score:", v12, (double)v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v13);

      ++v8;
      --v9;
    }
    while (v7 != v8);
  }

  return v5;
}

- (id)suggestionWithContact:(id)a3 score:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (void *)MEMORY[0x1E0C97218];
  v6 = a3;
  objc_msgSend(v5, "stringFromContact:style:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithContactName:contactIdentifier:subtitle:criteria:", v7, v8, 0, 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CONTEXT_ONGOING_CALL"), &stru_1E82C5A18, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:", v9, 0x80000, v11, 0, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
