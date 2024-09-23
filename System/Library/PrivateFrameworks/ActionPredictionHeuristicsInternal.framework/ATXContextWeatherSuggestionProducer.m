@implementation ATXContextWeatherSuggestionProducer

- (ATXContextWeatherSuggestionProducer)initWithValidDateInterval:(id)a3 reasonCode:(int64_t)a4 score:(double)a5
{
  id v9;
  ATXContextWeatherSuggestionProducer *v10;
  ATXContextWeatherSuggestionProducer *v11;
  uint64_t v12;
  ATXLocationManager *locationManager;
  objc_super v15;

  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXContextWeatherSuggestionProducer;
  v10 = -[ATXContextWeatherSuggestionProducer init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_validDateInterval, a3);
    v11->_score = a5;
    v11->_reasonCode = a4;
    objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    locationManager = v11->_locationManager;
    v11->_locationManager = (ATXLocationManager *)v12;

  }
  return v11;
}

- (id)weatherSuggestionWithRefreshTriggers:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXInformationHeuristicRefreshLocationTrigger *v10;
  ATXInformationHeuristicRefreshLocationTrigger *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CF8C28]);
  -[NSDateInterval startDate](self->_validDateInterval, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_validDateInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithStartDate:endDate:lockScreenEligible:predicate:", v6, v7, 0, 0);

  -[ATXLocationManager getCurrentLocation](self->_locationManager, "getCurrentLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
    objc_msgSend(v9, "coordinate");
    v11 = -[ATXInformationHeuristicRefreshLocationTrigger initWithExitingLocation:radiusInMeters:](v10, "initWithExitingLocation:radiusInMeters:");
    objc_msgSend(v4, "addObject:", v11);
    objc_msgSend(v9, "coordinate");
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithWeatherLatitude:longitude:criteria:", v8, v12, v13);
    -[ATXContextWeatherSuggestionProducer _suggestionWithAction:predictionReasons:score:](self, "_suggestionWithAction:predictionReasons:score:", v14, 1 << self->_reasonCode, self->_score);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_context_heuristic();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXContextWeatherSuggestionProducer weatherSuggestionWithRefreshTriggers:].cold.1(v16);

    v15 = 0;
  }

  return v15;
}

- (id)dummySuggestion
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CF8C28]);
  -[NSDateInterval startDate](self->_validDateInterval, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_validDateInterval, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:lockScreenEligible:predicate:", v4, v5, 0, 0);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithEntityName:qid:criteria:", &stru_1E82C5A18, &stru_1E82C5A18, v6);
  -[ATXContextWeatherSuggestionProducer _dummySuggestionWithAction:predictionReasons:score:](self, "_dummySuggestionWithAction:predictionReasons:score:", v7, 1 << self->_reasonCode, self->_score);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_suggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 score:(double)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  stringForATXSuggestionPredictionReasonCode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXContextHeuristicSuggestionProducer suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:](ATXContextHeuristicSuggestionProducer, "suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:", v7, a4, v8, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dummySuggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 score:(double)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  stringForATXSuggestionPredictionReasonCode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXContextHeuristicSuggestionProducer dummySuggestionWithSpotlightAction:predictionReasons:localizedReason:score:](ATXContextHeuristicSuggestionProducer, "dummySuggestionWithSpotlightAction:predictionReasons:localizedReason:score:", v7, a4, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_validDateInterval, 0);
}

- (void)weatherSuggestionWithRefreshTriggers:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C99DF000, log, OS_LOG_TYPE_ERROR, "Current location nil for weather suggestion", v1, 2u);
}

@end
