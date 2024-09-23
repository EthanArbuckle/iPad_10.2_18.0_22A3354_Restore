@implementation CATResult

- (NSString)catId
{
  return self->_catId;
}

- (void)setCatId:(id)a3
{
  objc_storeStrong((id *)&self->_catId, a3);
}

- (NSDictionary)meta
{
  return self->_meta;
}

- (void)setMeta:(id)a3
{
  objc_storeStrong((id *)&self->_meta, a3);
}

- (NSArray)speak
{
  return self->_speak;
}

- (void)setSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_speak, a3);
}

- (NSArray)print
{
  return self->_print;
}

- (void)setPrint:(id)a3
{
  objc_storeStrong((id *)&self->_print, a3);
}

- (NSArray)dialogId
{
  return self->_dialogId;
}

- (void)setDialogId:(id)a3
{
  objc_storeStrong((id *)&self->_dialogId, a3);
}

- (NSArray)captionSpeak
{
  return self->_captionSpeak;
}

- (void)setCaptionSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_captionSpeak, a3);
}

- (NSArray)captionPrint
{
  return self->_captionPrint;
}

- (void)setCaptionPrint:(id)a3
{
  objc_storeStrong((id *)&self->_captionPrint, a3);
}

- (NSArray)printOnly
{
  return self->_printOnly;
}

- (void)setPrintOnly:(id)a3
{
  objc_storeStrong((id *)&self->_printOnly, a3);
}

- (NSArray)spokenOnly
{
  return self->_spokenOnly;
}

- (void)setSpokenOnly:(id)a3
{
  objc_storeStrong((id *)&self->_spokenOnly, a3);
}

- (NSArray)spokenOnlyDefined
{
  return self->_spokenOnlyDefined;
}

- (void)setSpokenOnlyDefined:(id)a3
{
  objc_storeStrong((id *)&self->_spokenOnlyDefined, a3);
}

- (NSArray)isApprovedForGrading
{
  return self->_isApprovedForGrading;
}

- (void)setIsApprovedForGrading:(id)a3
{
  objc_storeStrong((id *)&self->_isApprovedForGrading, a3);
}

- (NSString)visualId
{
  return self->_visualId;
}

- (void)setVisualId:(id)a3
{
  objc_storeStrong((id *)&self->_visualId, a3);
}

- (NSDictionary)visualParameters
{
  return self->_visualParameters;
}

- (void)setVisualParameters:(id)a3
{
  objc_storeStrong((id *)&self->_visualParameters, a3);
}

- (NSData)visualResponse
{
  return self->_visualResponse;
}

- (void)setVisualResponse:(id)a3
{
  objc_storeStrong((id *)&self->_visualResponse, a3);
}

- (NSArray)unfilteredSpeak
{
  return self->_unfilteredSpeak;
}

- (void)setUnfilteredSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredSpeak, a3);
}

- (NSArray)unfilteredPrint
{
  return self->_unfilteredPrint;
}

- (void)setUnfilteredPrint:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredPrint, a3);
}

- (NSArray)unfilteredCaptionSpeak
{
  return self->_unfilteredCaptionSpeak;
}

- (void)setUnfilteredCaptionSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredCaptionSpeak, a3);
}

- (NSArray)unfilteredCaptionPrint
{
  return self->_unfilteredCaptionPrint;
}

- (void)setUnfilteredCaptionPrint:(id)a3
{
  objc_storeStrong((id *)&self->_unfilteredCaptionPrint, a3);
}

- (NSArray)redactedSpeak
{
  return self->_redactedSpeak;
}

- (void)setRedactedSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_redactedSpeak, a3);
}

- (NSArray)redactedPrint
{
  return self->_redactedPrint;
}

- (void)setRedactedPrint:(id)a3
{
  objc_storeStrong((id *)&self->_redactedPrint, a3);
}

- (NSArray)redactedCaptionSpeak
{
  return self->_redactedCaptionSpeak;
}

- (void)setRedactedCaptionSpeak:(id)a3
{
  objc_storeStrong((id *)&self->_redactedCaptionSpeak, a3);
}

- (NSArray)redactedCaptionPrint
{
  return self->_redactedCaptionPrint;
}

- (void)setRedactedCaptionPrint:(id)a3
{
  objc_storeStrong((id *)&self->_redactedCaptionPrint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redactedCaptionPrint, 0);
  objc_storeStrong((id *)&self->_redactedCaptionSpeak, 0);
  objc_storeStrong((id *)&self->_redactedPrint, 0);
  objc_storeStrong((id *)&self->_redactedSpeak, 0);
  objc_storeStrong((id *)&self->_unfilteredCaptionPrint, 0);
  objc_storeStrong((id *)&self->_unfilteredCaptionSpeak, 0);
  objc_storeStrong((id *)&self->_unfilteredPrint, 0);
  objc_storeStrong((id *)&self->_unfilteredSpeak, 0);
  objc_storeStrong((id *)&self->_visualResponse, 0);
  objc_storeStrong((id *)&self->_visualParameters, 0);
  objc_storeStrong((id *)&self->_visualId, 0);
  objc_storeStrong((id *)&self->_isApprovedForGrading, 0);
  objc_storeStrong((id *)&self->_spokenOnlyDefined, 0);
  objc_storeStrong((id *)&self->_spokenOnly, 0);
  objc_storeStrong((id *)&self->_printOnly, 0);
  objc_storeStrong((id *)&self->_captionPrint, 0);
  objc_storeStrong((id *)&self->_captionSpeak, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_print, 0);
  objc_storeStrong((id *)&self->_speak, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_catId, 0);
}

@end
