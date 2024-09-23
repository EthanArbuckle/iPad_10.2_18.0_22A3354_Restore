@implementation EKUIConferenceRoomInfo

- (EKUIConferenceRoomInfo)init
{
  EKUIConferenceRoomInfo *v2;
  EKUIConferenceRoomInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIConferenceRoomInfo;
  v2 = -[EKUIConferenceRoomInfo init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[EKUIConferenceRoomInfo setAvailabilityType:](v2, "setAvailabilityType:", 0);
  return v3;
}

- (EKRequestAvailabilityOperation)availabilityRequest
{
  return self->_availabilityRequest;
}

- (void)setAvailabilityRequest:(id)a3
{
  objc_storeStrong((id *)&self->_availabilityRequest, a3);
}

- (NSArray)availabilitySpans
{
  return self->_availabilitySpans;
}

- (void)setAvailabilitySpans:(id)a3
{
  objc_storeStrong((id *)&self->_availabilitySpans, a3);
}

- (int64_t)availabilityType
{
  return self->_availabilityType;
}

- (void)setAvailabilityType:(int64_t)a3
{
  self->_availabilityType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilitySpans, 0);
  objc_storeStrong((id *)&self->_availabilityRequest, 0);
}

@end
