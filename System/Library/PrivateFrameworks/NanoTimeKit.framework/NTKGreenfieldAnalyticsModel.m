@implementation NTKGreenfieldAnalyticsModel

- (NSString)errorMessage
{
  NSError *error;
  void *v4;
  int v5;
  NSString *errorMessage;
  __CFString *v7;

  error = self->_error;
  if (error)
  {
    -[NSError domain](error, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.nanotimekit.NTKGreenfieldAddWatchFaceManager"));

    if (v5)
    {
      switch(-[NSError code](self->_error, "code"))
      {
        case 0:
          goto LABEL_4;
        case 1:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("Face Not Available.");
          goto LABEL_5;
        case 2:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("Complication Requires OS Update.");
          goto LABEL_5;
        case 3:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("No Watch Paired");
          goto LABEL_5;
        case 4:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("Cannot Download Remote File.");
          goto LABEL_5;
        case 5:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("Library Is Full.");
          goto LABEL_5;
        case 6:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("Face must Be Singular In Library.");
          goto LABEL_5;
        case 7:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("Photos Face Contains No Photos.");
          goto LABEL_5;
        case 8:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("Face Cannot Be Customized.");
          goto LABEL_5;
        case 9:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("Cannot Load Library");
          goto LABEL_5;
        case 10:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("No Network Connection Or Invalid URL");
          goto LABEL_5;
        case 11:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("Incompatible Watch Face");
          goto LABEL_5;
        case 12:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("Require Watch OS Update");
          goto LABEL_5;
        case 13:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("Cannot Add Watch Face to Tinker Paired Device");
          goto LABEL_5;
        case 14:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("B640 productKit URL is invalid.");
          goto LABEL_5;
        case 15:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("B640 failed to retrieve data from ProductKit.");
          goto LABEL_5;
        case 16:
          errorMessage = self->_errorMessage;
          v7 = CFSTR("B640 cannot add face");
          goto LABEL_5;
        default:
          return self->_errorMessage;
      }
    }
    else
    {
LABEL_4:
      errorMessage = self->_errorMessage;
      v7 = CFSTR("Cannot Add Watch Face.");
LABEL_5:
      self->_errorMessage = &v7->isa;

    }
  }
  return self->_errorMessage;
}

- (NTKFace)watchFace
{
  return self->_watchFace;
}

- (void)setWatchFace:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)purchasedComplicationsItemIds
{
  return self->_purchasedComplicationsItemIds;
}

- (void)setPurchasedComplicationsItemIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)skippedComplicationsItemIds
{
  return self->_skippedComplicationsItemIds;
}

- (void)setSkippedComplicationsItemIds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)complicationSlotToIdMapping
{
  return self->_complicationSlotToIdMapping;
}

- (void)setComplicationSlotToIdMapping:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)addFaceFlowExitScreenName
{
  return self->_addFaceFlowExitScreenName;
}

- (void)setAddFaceFlowExitScreenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)distributionMechanism
{
  return self->_distributionMechanism;
}

- (void)setDistributionMechanism:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setErrorMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)scannedCodeIdentifier
{
  return self->_scannedCodeIdentifier;
}

- (void)setScannedCodeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scannedCodeIdentifier, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_distributionMechanism, 0);
  objc_storeStrong((id *)&self->_addFaceFlowExitScreenName, 0);
  objc_storeStrong((id *)&self->_complicationSlotToIdMapping, 0);
  objc_storeStrong((id *)&self->_skippedComplicationsItemIds, 0);
  objc_storeStrong((id *)&self->_purchasedComplicationsItemIds, 0);
  objc_storeStrong((id *)&self->_watchFace, 0);
}

@end
