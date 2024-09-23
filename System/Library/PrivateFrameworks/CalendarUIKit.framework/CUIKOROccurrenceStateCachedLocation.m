@implementation CUIKOROccurrenceStateCachedLocation

- (CUIKOROccurrenceStateCachedLocation)initWithGeneratedLocationString:(id)a3 locationImageName:(id)a4 originalOccurrenceLocation:(id)a5 originalOccurrenceLocationWithoutPrediction:(id)a6 originalOccurrenceLocationIsPrediction:(BOOL)a7 originalHasNewTimeProposed:(BOOL)a8 originalConferenceURL:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  CUIKOROccurrenceStateCachedLocation *v18;
  CUIKOROccurrenceStateCachedLocation *v19;
  id v23;
  objc_super v24;

  v23 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)CUIKOROccurrenceStateCachedLocation;
  v18 = -[CUIKOROccurrenceStateCachedLocation init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_generatedLocationString, a3);
    objc_storeStrong((id *)&v19->_locationImageName, a4);
    objc_storeStrong((id *)&v19->_originalOccurrenceLocation, a5);
    objc_storeStrong((id *)&v19->_originalOccurrenceLocationWithoutPrediction, a6);
    v19->_originalOccurrenceLocationIsPrediction = a7;
    v19->_originalHasNewTimeProposed = a8;
    objc_storeStrong((id *)&v19->_originalConferenceURL, a9);
  }

  return v19;
}

- (NSAttributedString)generatedLocationString
{
  return self->_generatedLocationString;
}

- (NSString)locationImageName
{
  return self->_locationImageName;
}

- (NSString)originalOccurrenceLocation
{
  return self->_originalOccurrenceLocation;
}

- (NSString)originalOccurrenceLocationWithoutPrediction
{
  return self->_originalOccurrenceLocationWithoutPrediction;
}

- (BOOL)originalOccurrenceLocationIsPrediction
{
  return self->_originalOccurrenceLocationIsPrediction;
}

- (BOOL)originalHasNewTimeProposed
{
  return self->_originalHasNewTimeProposed;
}

- (NSURL)originalConferenceURL
{
  return self->_originalConferenceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalConferenceURL, 0);
  objc_storeStrong((id *)&self->_originalOccurrenceLocationWithoutPrediction, 0);
  objc_storeStrong((id *)&self->_originalOccurrenceLocation, 0);
  objc_storeStrong((id *)&self->_locationImageName, 0);
  objc_storeStrong((id *)&self->_generatedLocationString, 0);
}

@end
