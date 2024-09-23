@implementation ATXNotificationTelemetryQueryResult

- (NSUUID)notificationUUID
{
  return self->_notificationUUID;
}

- (void)setNotificationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_notificationUUID, a3);
}

- (NSDate)receiveTimestamp
{
  return self->_receiveTimestamp;
}

- (void)setReceiveTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_receiveTimestamp, a3);
}

- (int64_t)deliveryMethod
{
  return self->_deliveryMethod;
}

- (void)setDeliveryMethod:(int64_t)a3
{
  self->_deliveryMethod = a3;
}

- (int64_t)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int64_t)a3
{
  self->_urgency = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleId, a3);
}

- (BOOL)isMessage
{
  return self->_isMessage;
}

- (void)setIsMessage:(BOOL)a3
{
  self->_isMessage = a3;
}

- (NSString)destinationReason
{
  return self->_destinationReason;
}

- (void)setDestinationReason:(id)a3
{
  objc_storeStrong((id *)&self->_destinationReason, a3);
}

- (NSString)originalDestination
{
  return self->_originalDestination;
}

- (void)setOriginalDestination:(id)a3
{
  objc_storeStrong((id *)&self->_originalDestination, a3);
}

- (NSString)finalDestination
{
  return self->_finalDestination;
}

- (void)setFinalDestination:(id)a3
{
  objc_storeStrong((id *)&self->_finalDestination, a3);
}

- (NSString)receiveModeIdentifier
{
  return self->_receiveModeIdentifier;
}

- (void)setReceiveModeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_receiveModeIdentifier, a3);
}

- (ATXUserNotificationResolution)resolution
{
  return self->_resolution;
}

- (void)setResolution:(id)a3
{
  objc_storeStrong((id *)&self->_resolution, a3);
}

- (unint64_t)bodyLength
{
  return self->_bodyLength;
}

- (void)setBodyLength:(unint64_t)a3
{
  self->_bodyLength = a3;
}

- (unint64_t)titleLength
{
  return self->_titleLength;
}

- (void)setTitleLength:(unint64_t)a3
{
  self->_titleLength = a3;
}

- (unint64_t)subtitleLength
{
  return self->_subtitleLength;
}

- (void)setSubtitleLength:(unint64_t)a3
{
  self->_subtitleLength = a3;
}

- (BOOL)isSummarized
{
  return self->_isSummarized;
}

- (void)setIsSummarized:(BOOL)a3
{
  self->_isSummarized = a3;
}

- (unint64_t)summaryLength
{
  return self->_summaryLength;
}

- (void)setSummaryLength:(unint64_t)a3
{
  self->_summaryLength = a3;
}

- (BOOL)isPartOfStack
{
  return self->_isPartOfStack;
}

- (void)setIsPartOfStack:(BOOL)a3
{
  self->_isPartOfStack = a3;
}

- (BOOL)isStackSummary
{
  return self->_isStackSummary;
}

- (void)setIsStackSummary:(BOOL)a3
{
  self->_isStackSummary = a3;
}

- (BOOL)isDeliveredInPrioritySection
{
  return self->_isDeliveredInPrioritySection;
}

- (void)setIsDeliveredInPrioritySection:(BOOL)a3
{
  self->_isDeliveredInPrioritySection = a3;
}

- (BOOL)isDeterminedUrgentByModel
{
  return self->_isDeterminedUrgentByModel;
}

- (void)setIsDeterminedUrgentByModel:(BOOL)a3
{
  self->_isDeterminedUrgentByModel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolution, 0);
  objc_storeStrong((id *)&self->_receiveModeIdentifier, 0);
  objc_storeStrong((id *)&self->_finalDestination, 0);
  objc_storeStrong((id *)&self->_originalDestination, 0);
  objc_storeStrong((id *)&self->_destinationReason, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_receiveTimestamp, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
}

@end
