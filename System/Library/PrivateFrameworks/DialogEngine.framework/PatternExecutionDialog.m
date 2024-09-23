@implementation PatternExecutionDialog

- (NSString)dialogId
{
  return self->_dialogId;
}

- (void)setDialogId:(id)a3
{
  objc_storeStrong((id *)&self->_dialogId, a3);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (NSString)fullPrint
{
  return self->_fullPrint;
}

- (void)setFullPrint:(id)a3
{
  objc_storeStrong((id *)&self->_fullPrint, a3);
}

- (NSString)fullSpeak
{
  return self->_fullSpeak;
}

- (void)setFullSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_fullSpeak, a3);
}

- (NSString)supportingPrint
{
  return self->_supportingPrint;
}

- (void)setSupportingPrint:(id)a3
{
  objc_storeStrong((id *)&self->_supportingPrint, a3);
}

- (NSString)supportingSpeak
{
  return self->_supportingSpeak;
}

- (void)setSupportingSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_supportingSpeak, a3);
}

- (NSNumber)printOnly
{
  return self->_printOnly;
}

- (void)setPrintOnly:(id)a3
{
  objc_storeStrong((id *)&self->_printOnly, a3);
}

- (NSNumber)spokenOnly
{
  return self->_spokenOnly;
}

- (void)setSpokenOnly:(id)a3
{
  objc_storeStrong((id *)&self->_spokenOnly, a3);
}

- (NSString)unfilteredFullPrint
{
  return self->_unfilteredFullPrint;
}

- (void)setUnfilteredFullPrint:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredFullPrint, a3);
}

- (NSString)unfilteredFullSpeak
{
  return self->_unfilteredFullSpeak;
}

- (void)setUnfilteredFullSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredFullSpeak, a3);
}

- (NSString)unfilteredSupportingPrint
{
  return self->_unfilteredSupportingPrint;
}

- (void)setUnfilteredSupportingPrint:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredSupportingPrint, a3);
}

- (NSString)unfilteredSupportingSpeak
{
  return self->_unfilteredSupportingSpeak;
}

- (void)setUnfilteredSupportingSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredSupportingSpeak, a3);
}

- (NSString)redactedFullPrint
{
  return self->_redactedFullPrint;
}

- (void)setRedactedFullPrint:(id)a3
{
  objc_storeStrong((id *)&self->_redactedFullPrint, a3);
}

- (NSString)redactedFullSpeak
{
  return self->_redactedFullSpeak;
}

- (void)setRedactedFullSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_redactedFullSpeak, a3);
}

- (NSString)redactedSupportingPrint
{
  return self->_redactedSupportingPrint;
}

- (void)setRedactedSupportingPrint:(id)a3
{
  objc_storeStrong((id *)&self->_redactedSupportingPrint, a3);
}

- (NSString)redactedSupportingSpeak
{
  return self->_redactedSupportingSpeak;
}

- (void)setRedactedSupportingSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_redactedSupportingSpeak, a3);
}

- (BOOL)isApprovedForGrading
{
  return self->_isApprovedForGrading;
}

- (void)setIsApprovedForGrading:(BOOL)a3
{
  self->_isApprovedForGrading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactedSupportingSpeak, 0);
  objc_storeStrong((id *)&self->_redactedSupportingPrint, 0);
  objc_storeStrong((id *)&self->_redactedFullSpeak, 0);
  objc_storeStrong((id *)&self->_redactedFullPrint, 0);
  objc_storeStrong((id *)&self->_unfilteredSupportingSpeak, 0);
  objc_storeStrong((id *)&self->_unfilteredSupportingPrint, 0);
  objc_storeStrong((id *)&self->_unfilteredFullSpeak, 0);
  objc_storeStrong((id *)&self->_unfilteredFullPrint, 0);
  objc_storeStrong((id *)&self->_spokenOnly, 0);
  objc_storeStrong((id *)&self->_printOnly, 0);
  objc_storeStrong((id *)&self->_supportingSpeak, 0);
  objc_storeStrong((id *)&self->_supportingPrint, 0);
  objc_storeStrong((id *)&self->_fullSpeak, 0);
  objc_storeStrong((id *)&self->_fullPrint, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
}

@end
