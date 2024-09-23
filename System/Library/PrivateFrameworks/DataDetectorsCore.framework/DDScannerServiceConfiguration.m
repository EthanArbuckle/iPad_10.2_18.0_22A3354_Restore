@implementation DDScannerServiceConfiguration

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)spotlightSuggestionsEnabled
{
  return self->_spotlightSuggestionsEnabled;
}

- (void)setSpotlightSuggestionsEnabled:(BOOL)a3
{
  NSString *recyclingIdentifier;

  if (self->_spotlightSuggestionsEnabled != a3)
  {
    self->_spotlightSuggestionsEnabled = a3;
    recyclingIdentifier = self->_recyclingIdentifier;
    self->_recyclingIdentifier = 0;

  }
}

- (void)setNoObjC:(BOOL)a3
{
  self->_noObjC = a3;
}

- (int)scannerType
{
  return self->_scannerType;
}

- (int64_t)scannerOptions
{
  return self->_scannerOptions;
}

- (int64_t)resultsOptions
{
  return self->_resultsOptions;
}

- (BOOL)remoteScannerEnabled
{
  _BOOL4 remoteScannerEnabled;

  remoteScannerEnabled = self->_remoteScannerEnabled;
  if (!self->_remoteScannerEnabled)
    -[DDScannerServiceConfiguration qos](self, "qos");
  return remoteScannerEnabled;
}

- (__CFString)recyclingIdentifier
{
  unsigned int *v1;
  void *v3;
  id v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;

  if (a1)
  {
    v1 = a1;
    if ((objc_msgSend(a1, "remoteScannerEnabled") & 1) != 0)
      return CFSTR("Remote");
    v3 = (void *)*((_QWORD *)v1 + 2);
    if (!v3)
    {
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      v5 = (const __CFString *)*((_QWORD *)v1 + 13);
      if (!v5)
        v5 = &stru_1E3C973D8;
      v6 = objc_msgSend(v4, "initWithFormat:", CFSTR("T:%d|S:%d:%@:%d:%@"), v1[2], *((unsigned __int8 *)v1 + 12), *((_QWORD *)v1 + 9), *((unsigned __int8 *)v1 + 33), v5);
      v7 = (void *)*((_QWORD *)v1 + 2);
      *((_QWORD *)v1 + 2) = v6;

      v3 = (void *)*((_QWORD *)v1 + 2);
    }
    a1 = v3;
  }
  return (__CFString *)a1;
}

- (BOOL)noObjC
{
  return self->_noObjC;
}

- (NSString)language
{
  return self->_language;
}

- (BOOL)languageHighConfidence
{
  return self->_languageHighConfidence;
}

- (DDScannerServiceConfiguration)initWithScannerType:(int)a3 passiveIntent:(BOOL)a4
{
  _BOOL4 v4;
  DDScannerServiceConfiguration *result;
  int64_t v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)DDScannerServiceConfiguration;
  result = -[DDScannerServiceConfiguration init](&v8, sel_init);
  if (result)
  {
    result->_scannerType = a3;
    v7 = 1537;
    if (v4)
      v7 = 1989;
    result->_resultsOptions = v7;
    result->_scannerOptions = 0;
    result->_timeout = 6.0;
  }
  return result;
}

- (id)initEmpty
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DDScannerServiceConfiguration;
  return -[DDScannerServiceConfiguration init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initEmpty");
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 8) = self->_scannerType;
    *(_QWORD *)(v4 + 56) = self->_resultsOptions;
    *(_QWORD *)(v4 + 64) = self->_scannerOptions;
    *(double *)(v4 + 48) = self->_timeout;
    *(_BYTE *)(v4 + 32) = self->_noObjC;
    *(_BYTE *)(v4 + 33) = self->_languageHighConfidence;
    *(_BYTE *)(v4 + 12) = self->_spotlightSuggestionsEnabled;
    *(_BYTE *)(v4 + 13) = self->_remoteScannerEnabled;
    objc_storeStrong((id *)(v4 + 72), self->_language);
    objc_storeStrong((id *)(v5 + 16), self->_recyclingIdentifier);
    objc_storeStrong((id *)(v5 + 88), self->_mockMLResults);
    objc_storeStrong((id *)(v5 + 96), self->_supportedMLResults);
    *(_DWORD *)(v5 + 36) = self->_qos;
    *(_DWORD *)(v5 + 40) = self->_script;
    objc_storeStrong((id *)(v5 + 104), self->_country);
  }
  return (id)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_supportedMLResults, 0);
  objc_storeStrong((id *)&self->_mockMLResults, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_recyclingIdentifier, 0);
}

- (DDScannerServiceConfiguration)init
{
  return -[DDScannerServiceConfiguration initWithScannerType:passiveIntent:](self, "initWithScannerType:passiveIntent:", 0, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *language;
  NSString *country;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", self->_scannerType, CFSTR("ST"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_resultsOptions, CFSTR("RO"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_scannerOptions, CFSTR("SO"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("TO"), self->_timeout);
  objc_msgSend(v6, "encodeBool:forKey:", self->_noObjC, CFSTR("OC"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_languageHighConfidence, CFSTR("LHC"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_spotlightSuggestionsEnabled, CFSTR("SP"));
  language = self->_language;
  if (language)
    objc_msgSend(v6, "encodeObject:forKey:", language, CFSTR("LG"));
  country = self->_country;
  if (country)
    objc_msgSend(v6, "encodeObject:forKey:", country, CFSTR("country"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_script, CFSTR("script"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_qos, CFSTR("qos"));

}

- (DDScannerServiceConfiguration)initWithCoder:(id)a3
{
  id v4;
  DDScannerServiceConfiguration *v5;
  double v6;
  uint64_t v7;
  NSString *language;
  uint64_t v9;
  NSString *country;

  v4 = a3;
  v5 = -[DDScannerServiceConfiguration initEmpty](self, "initEmpty");
  if (v5)
  {
    v5->_scannerType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ST"));
    v5->_resultsOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RO"));
    v5->_scannerOptions = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SO"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TO"));
    v5->_timeout = v6;
    v5->_noObjC = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OC"));
    v5->_languageHighConfidence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("LHC"));
    v5->_spotlightSuggestionsEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SP"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LG"));
    v7 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("country"));
    v9 = objc_claimAutoreleasedReturnValue();
    country = v5->_country;
    v5->_country = (NSString *)v9;

    v5->_script = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("script"));
    v5->_qos = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("qos"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DDScannerServiceConfiguration recyclingIdentifier]((unsigned int *)self);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_noObjC)
    v7 = CFSTR("C");
  else
    v7 = CFSTR("ObjC");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@ timeout:%.1f SPI:%@ resultsOptions:%ld scannerOptions:%ld"), v4, self, v5, *(_QWORD *)&self->_timeout, v7, self->_resultsOptions, self->_scannerOptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setLanguage:(id)a3
{
  NSString *v5;
  NSString *recyclingIdentifier;
  NSString *v7;

  v5 = (NSString *)a3;
  if (self->_language != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_language, a3);
    recyclingIdentifier = self->_recyclingIdentifier;
    self->_recyclingIdentifier = 0;

    v5 = v7;
  }

}

- (void)setLanguageHighConfidence:(BOOL)a3
{
  NSString *recyclingIdentifier;

  if (self->_languageHighConfidence != a3)
  {
    self->_languageHighConfidence = a3;
    recyclingIdentifier = self->_recyclingIdentifier;
    self->_recyclingIdentifier = 0;

  }
}

- (void)setRemoteScannerEnabled:(BOOL)a3
{
  self->_remoteScannerEnabled = a3;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void)setResultsOptions:(int64_t)a3
{
  self->_resultsOptions = a3;
}

- (void)setScannerOptions:(int64_t)a3
{
  self->_scannerOptions = a3;
}

- (int)qos
{
  return self->_qos;
}

- (void)setQos:(int)a3
{
  self->_qos = a3;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (int)script
{
  return self->_script;
}

- (void)setScript:(int)a3
{
  self->_script = a3;
}

- (NSArray)mockMLResults
{
  return self->_mockMLResults;
}

- (void)setMockMLResults:(id)a3
{
  objc_storeStrong((id *)&self->_mockMLResults, a3);
}

- (NSArray)supportedMLResults
{
  return self->_supportedMLResults;
}

- (void)setSupportedMLResults:(id)a3
{
  objc_storeStrong((id *)&self->_supportedMLResults, a3);
}

- (NSString)country
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCountry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
