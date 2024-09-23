@implementation EnhancedLoggingStateInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSSet *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  _QWORD v26[5];
  char v27;

  v4 = a3;
  v27 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", ELSParameterCommand, &off_100008428, &off_100008440, &v27));
  v6 = v5;
  if (v27)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (!v7)
    -[EnhancedLoggingStateInputs setCommand:](self, "setCommand:", objc_msgSend(v5, "integerValue"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000047E4;
  v26[3] = &unk_100008240;
  v26[4] = self;
  v8 = objc_retainBlock(v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromKey:defaultValue:failed:", ELSParameterPayloadsDict, 0, &v27));
  -[EnhancedLoggingStateInputs setParameterPayloads:](self, "setParameterPayloads:", v9);

  v10 = ELSDefaultQueue;
  v11 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:", v10, v12, 30, &v27, v8));
  -[EnhancedLoggingStateInputs setQueue:](self, "setQueue:", v13);

  v14 = ELSDefaultConsentHandles;
  v15 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:", v14, v16, 30, 0, &v27, &stru_100008280));
  -[EnhancedLoggingStateInputs setConsentHandles:](self, "setConsentHandles:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", ELSParameterRetries, &off_100008458, &off_100008470, &off_100008488, &v27));
  v19 = v18;
  if (!v27 && v18)
    -[EnhancedLoggingStateInputs setRetries:](self, "setRetries:", objc_msgSend(v18, "integerValue"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromKey:defaultValue:failed:", ELSDefaultMetadata, 0, &v27));
  -[EnhancedLoggingStateInputs setMetadata:](self, "setMetadata:", v20);

  v21 = ELSDefaultFollowUpOptions;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", ELSFollowUpOptionFrequency, ELSFollowUpOptionUseSpringBoardNotification, 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromKey:limitedToKeys:defaultValue:failed:", v21, v22, 0, &v27));
  -[EnhancedLoggingStateInputs setFollowUpOptions:](self, "setFollowUpOptions:", v23);

  v24 = v27 == 0;
  return v24;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  void *v4;
  char v6;

  v6 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dk_dictionaryFromKey:defaultValue:failed:", ELSParameterPayloadsDict, 0, &v6));
  -[EnhancedLoggingStateInputs setSpecificationPayloads:](self, "setSpecificationPayloads:", v4);

  return v6 == 0;
}

- (unint64_t)command
{
  return self->_command;
}

- (void)setCommand:(unint64_t)a3
{
  self->_command = a3;
}

- (NSArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDictionary)parameterPayloads
{
  return self->_parameterPayloads;
}

- (void)setParameterPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_parameterPayloads, a3);
}

- (NSDictionary)specificationPayloads
{
  return self->_specificationPayloads;
}

- (void)setSpecificationPayloads:(id)a3
{
  objc_storeStrong((id *)&self->_specificationPayloads, a3);
}

- (int64_t)retries
{
  return self->_retries;
}

- (void)setRetries:(int64_t)a3
{
  self->_retries = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSDictionary)followUpOptions
{
  return self->_followUpOptions;
}

- (void)setFollowUpOptions:(id)a3
{
  objc_storeStrong((id *)&self->_followUpOptions, a3);
}

- (NSArray)consentHandles
{
  return self->_consentHandles;
}

- (void)setConsentHandles:(id)a3
{
  objc_storeStrong((id *)&self->_consentHandles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consentHandles, 0);
  objc_storeStrong((id *)&self->_followUpOptions, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_specificationPayloads, 0);
  objc_storeStrong((id *)&self->_parameterPayloads, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
