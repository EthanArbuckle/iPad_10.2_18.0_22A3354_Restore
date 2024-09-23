@implementation MLBackgroundPredictionTask

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MLBackgroundPredictionTask;
  v4 = a3;
  -[MLBackgroundTask encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_modelURL, CFSTR("modelURL"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_modelConfiguration, CFSTR("modelConfiguration"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_predictionOptions, CFSTR("predictionOptions"));

}

- (MLBackgroundPredictionTask)initWithCoder:(id)a3
{
  id v4;
  MLBackgroundPredictionTask *v5;
  uint64_t v6;
  NSURL *modelURL;
  uint64_t v8;
  MLModelConfiguration *modelConfiguration;
  uint64_t v10;
  MLPredictionOptions *predictionOptions;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MLBackgroundPredictionTask;
  v5 = -[MLBackgroundTask initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    modelURL = v5->_modelURL;
    v5->_modelURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelConfiguration"));
    v8 = objc_claimAutoreleasedReturnValue();
    modelConfiguration = v5->_modelConfiguration;
    v5->_modelConfiguration = (MLModelConfiguration *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionOptions"));
    v10 = objc_claimAutoreleasedReturnValue();
    predictionOptions = v5->_predictionOptions;
    v5->_predictionOptions = (MLPredictionOptions *)v10;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MLBackgroundPredictionTask;
  v4 = -[MLBackgroundTask copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setModelURL:", self->_modelURL);
  objc_msgSend(v4, "setModelConfiguration:", self->_modelConfiguration);
  objc_msgSend(v4, "setPredictionOptions:", self->_predictionOptions);
  return v4;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (void)setModelURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MLModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (void)setModelConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MLPredictionOptions)predictionOptions
{
  return self->_predictionOptions;
}

- (void)setPredictionOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionOptions, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
}

+ (Class)taskRunnerClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
