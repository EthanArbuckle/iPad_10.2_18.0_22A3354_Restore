@implementation MKFitnessRAPReport

- (id)initForRunningTrackIssue:(unint64_t)a3 trackCoordinate:(CLLocationCoordinate2D)a4 trackFeatureID:(id)a5 nameOfTrack:(id)a6 numberOfLanes:(id)a7 comment:(id)a8
{
  double longitude;
  double latitude;
  id v15;
  id v16;
  id v17;
  id v18;
  MKFitnessRAPReport *v19;
  uint64_t v20;
  GEORPFeedbackRequestParameters *requestParameters;
  objc_super v23;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MKFitnessRAPReport;
  v19 = -[MKFitnessRAPReport init](&v23, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0D273B0]), "initForRunningTrackIssue:trackCoordinateLatitude:trackCoordinateLongitude:trackFeatureID:nameOfTrack:numberOfLanes:comment:", -[MKFitnessRAPReport optionKeyForTrackIssue:](v19, "optionKeyForTrackIssue:", a3), v15, v16, v17, v18, latitude, longitude);
    requestParameters = v19->_requestParameters;
    v19->_requestParameters = (GEORPFeedbackRequestParameters *)v20;

  }
  return v19;
}

- (int)optionKeyForTrackIssue:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return 0;
  else
    return dword_18B2AFDF0[a3 - 1];
}

- (GEORPFeedbackRequestParameters)requestParameters
{
  return self->_requestParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_storeStrong((id *)&self->_feedbackRequestParameters, 0);
}

@end
