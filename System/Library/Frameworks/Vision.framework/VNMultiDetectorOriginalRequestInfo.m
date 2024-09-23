@implementation VNMultiDetectorOriginalRequestInfo

- (VNMultiDetectorOriginalRequestInfo)initWithOriginatingRequestSpecifierProcessingOptionKey:(id)a3 originalRequestResultsIndex:(unint64_t)a4
{
  id v6;
  VNMultiDetectorOriginalRequestInfo *v7;
  uint64_t v8;
  NSString *originatingRequestSpecifierKey;
  VNMultiDetectorOriginalRequestInfo *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNMultiDetectorOriginalRequestInfo;
  v7 = -[VNMultiDetectorOriginalRequestInfo init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    originatingRequestSpecifierKey = v7->_originatingRequestSpecifierKey;
    v7->_originatingRequestSpecifierKey = (NSString *)v8;

    v7->_originalRequestResultsIndex = a4;
    v10 = v7;
  }

  return v7;
}

- (NSString)originatingRequestSpecifierKey
{
  return self->_originatingRequestSpecifierKey;
}

+ (id)requestKeyFromRequest:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  NSStringFromClass((Class)objc_msgSend(v3, "frameworkClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@; resultsIndex=%lu"),
                                           self->_originatingRequestSpecifierKey,
                                           self->_originalRequestResultsIndex));
}

- (unint64_t)originalRequestResultsIndex
{
  return self->_originalRequestResultsIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifierKey, 0);
}

+ (NSDictionary)originatingRequestSpecifierToDetectorClassMap
{
  +[VNError VNAssertClass:needsToOverrideMethod:](VNError, "VNAssertClass:needsToOverrideMethod:", objc_opt_class(), a2);
  return 0;
}

+ (id)requestClassNameFromRequestKey:(id)a3
{
  return a3;
}

@end
