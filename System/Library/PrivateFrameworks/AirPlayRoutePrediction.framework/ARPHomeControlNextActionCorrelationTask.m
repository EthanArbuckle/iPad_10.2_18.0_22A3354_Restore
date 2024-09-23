@implementation ARPHomeControlNextActionCorrelationTask

- (ARPHomeControlNextActionCorrelationTask)initWithCorrelationsFile:(id)a3
{
  id v4;
  ARPHomeControlNextActionCorrelationTask *v5;
  uint64_t v6;
  NSString *file;
  ARPHomeControlCorrelationUtilities *v8;
  ARPHomeControlCorrelationUtilities *utilities;
  uint64_t v10;
  ARPHomeControlSuggester *suggester;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARPHomeControlNextActionCorrelationTask;
  v5 = -[ARPHomeControlNextActionCorrelationTask init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    file = v5->_file;
    v5->_file = (NSString *)v6;

    v8 = objc_alloc_init(ARPHomeControlCorrelationUtilities);
    utilities = v5->_utilities;
    v5->_utilities = v8;

    +[ARPHomeControlSuggester suggester](ARPHomeControlSuggester, "suggester");
    v10 = objc_claimAutoreleasedReturnValue();
    suggester = v5->_suggester;
    v5->_suggester = (ARPHomeControlSuggester *)v10;

  }
  return v5;
}

- (void)execute
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DD793000, log, OS_LOG_TYPE_ERROR, "Skipping event - BMHomeKitClientBase is nil", buf, 2u);
}

- (NSString)file
{
  return self->_file;
}

- (ARPHomeControlCorrelationUtilities)utilities
{
  return self->_utilities;
}

- (void)setUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_utilities, a3);
}

- (ARPHomeControlSuggester)suggester
{
  return self->_suggester;
}

- (void)setSuggester:(id)a3
{
  objc_storeStrong((id *)&self->_suggester, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end
