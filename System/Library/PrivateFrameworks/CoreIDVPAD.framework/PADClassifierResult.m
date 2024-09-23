@implementation PADClassifierResult

- (NSNumber)livenessLabel
{
  return self->_livenessLabel;
}

- (void)setLivenessLabel:(id)a3
{
  objc_storeStrong((id *)&self->_livenessLabel, a3);
}

- (NSArray)gestureSequence
{
  return self->_gestureSequence;
}

- (void)setGestureSequence:(id)a3
{
  objc_storeStrong((id *)&self->_gestureSequence, a3);
}

- (NSArray)assessmentsFAC
{
  return self->_assessmentsFAC;
}

- (void)setAssessmentsFAC:(id)a3
{
  objc_storeStrong((id *)&self->_assessmentsFAC, a3);
}

- (NSArray)assessmentsPRD
{
  return self->_assessmentsPRD;
}

- (void)setAssessmentsPRD:(id)a3
{
  objc_storeStrong((id *)&self->_assessmentsPRD, a3);
}

- (NSArray)assessmentsTA
{
  return self->_assessmentsTA;
}

- (void)setAssessmentsTA:(id)a3
{
  objc_storeStrong((id *)&self->_assessmentsTA, a3);
}

- (NSArray)timestampsFAC
{
  return self->_timestampsFAC;
}

- (void)setTimestampsFAC:(id)a3
{
  objc_storeStrong((id *)&self->_timestampsFAC, a3);
}

- (NSArray)faceprintsID
{
  return self->_faceprintsID;
}

- (void)setFaceprintsID:(id)a3
{
  objc_storeStrong((id *)&self->_faceprintsID, a3);
}

- (NSArray)timestampsID
{
  return self->_timestampsID;
}

- (void)setTimestampsID:(id)a3
{
  objc_storeStrong((id *)&self->_timestampsID, a3);
}

- (NSArray)timestampsButtonPressed
{
  return self->_timestampsButtonPressed;
}

- (void)setTimestampsButtonPressed:(id)a3
{
  objc_storeStrong((id *)&self->_timestampsButtonPressed, a3);
}

- (NSNumber)assessmentFAC
{
  return self->_assessmentFAC;
}

- (void)setAssessmentFAC:(id)a3
{
  objc_storeStrong((id *)&self->_assessmentFAC, a3);
}

- (NSNumber)assessmentTA
{
  return self->_assessmentTA;
}

- (void)setAssessmentTA:(id)a3
{
  objc_storeStrong((id *)&self->_assessmentTA, a3);
}

- (NSNumber)maxNccLow
{
  return self->_maxNccLow;
}

- (void)setMaxNccLow:(id)a3
{
  objc_storeStrong((id *)&self->_maxNccLow, a3);
}

- (NSNumber)maxNccHigh
{
  return self->_maxNccHigh;
}

- (void)setMaxNccHigh:(id)a3
{
  objc_storeStrong((id *)&self->_maxNccHigh, a3);
}

- (NSNumber)ignoredStitches
{
  return self->_ignoredStitches;
}

- (void)setIgnoredStitches:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredStitches, a3);
}

- (NSNumber)assessmentFakePRD
{
  return self->_assessmentFakePRD;
}

- (void)setAssessmentFakePRD:(id)a3
{
  objc_storeStrong((id *)&self->_assessmentFakePRD, a3);
}

- (NSNumber)assessmentLivePRD
{
  return self->_assessmentLivePRD;
}

- (void)setAssessmentLivePRD:(id)a3
{
  objc_storeStrong((id *)&self->_assessmentLivePRD, a3);
}

- (NSNumber)assessmentID
{
  return self->_assessmentID;
}

- (void)setAssessmentID:(id)a3
{
  objc_storeStrong((id *)&self->_assessmentID, a3);
}

- (NSString)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (NSString)ageLabel
{
  return self->_ageLabel;
}

- (void)setAgeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_ageLabel, a3);
}

- (NSString)sexLabel
{
  return self->_sexLabel;
}

- (void)setSexLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sexLabel, a3);
}

- (NSString)skintoneLabel
{
  return self->_skintoneLabel;
}

- (void)setSkintoneLabel:(id)a3
{
  objc_storeStrong((id *)&self->_skintoneLabel, a3);
}

- (NSString)ethnicityLabel
{
  return self->_ethnicityLabel;
}

- (void)setEthnicityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_ethnicityLabel, a3);
}

- (NSString)faceHairLabel
{
  return self->_faceHairLabel;
}

- (void)setFaceHairLabel:(id)a3
{
  objc_storeStrong((id *)&self->_faceHairLabel, a3);
}

- (NSString)headgearLabel
{
  return self->_headgearLabel;
}

- (void)setHeadgearLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headgearLabel, a3);
}

- (NSString)glassesLabel
{
  return self->_glassesLabel;
}

- (void)setGlassesLabel:(id)a3
{
  objc_storeStrong((id *)&self->_glassesLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glassesLabel, 0);
  objc_storeStrong((id *)&self->_headgearLabel, 0);
  objc_storeStrong((id *)&self->_faceHairLabel, 0);
  objc_storeStrong((id *)&self->_ethnicityLabel, 0);
  objc_storeStrong((id *)&self->_skintoneLabel, 0);
  objc_storeStrong((id *)&self->_sexLabel, 0);
  objc_storeStrong((id *)&self->_ageLabel, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_assessmentID, 0);
  objc_storeStrong((id *)&self->_assessmentLivePRD, 0);
  objc_storeStrong((id *)&self->_assessmentFakePRD, 0);
  objc_storeStrong((id *)&self->_ignoredStitches, 0);
  objc_storeStrong((id *)&self->_maxNccHigh, 0);
  objc_storeStrong((id *)&self->_maxNccLow, 0);
  objc_storeStrong((id *)&self->_assessmentTA, 0);
  objc_storeStrong((id *)&self->_assessmentFAC, 0);
  objc_storeStrong((id *)&self->_timestampsButtonPressed, 0);
  objc_storeStrong((id *)&self->_timestampsID, 0);
  objc_storeStrong((id *)&self->_faceprintsID, 0);
  objc_storeStrong((id *)&self->_timestampsFAC, 0);
  objc_storeStrong((id *)&self->_assessmentsTA, 0);
  objc_storeStrong((id *)&self->_assessmentsPRD, 0);
  objc_storeStrong((id *)&self->_assessmentsFAC, 0);
  objc_storeStrong((id *)&self->_gestureSequence, 0);
  objc_storeStrong((id *)&self->_livenessLabel, 0);
}

@end
