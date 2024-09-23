@implementation SRDismissalClassificationContext

- (SRDismissalClassificationContext)initWithCancellationReason:(int64_t)a3 contentPresentationState:(int64_t)a4 dismissalReason:(int64_t)a5 isDeviceUnlocked:(BOOL)a6 siriState:(int64_t)a7 requestSource:(int64_t)a8
{
  SRDismissalClassificationContext *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SRDismissalClassificationContext;
  result = -[SRDismissalClassificationContext init](&v15, "init");
  if (result)
  {
    result->_cancellationReason = a3;
    result->_contentPresentationState = a4;
    result->_isDeviceUnlocked = a6;
    result->_dismissalReason = a5;
    result->_siriState = a7;
    result->_requestSource = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SRDismissalClassificationContext *v4;

  v4 = -[SRDismissalClassificationContext initWithCancellationReason:contentPresentationState:dismissalReason:isDeviceUnlocked:siriState:requestSource:](+[SRDismissalClassificationContext allocWithZone:](SRDismissalClassificationContext, "allocWithZone:", a3), "initWithCancellationReason:contentPresentationState:dismissalReason:isDeviceUnlocked:siriState:requestSource:", self->_cancellationReason, self->_contentPresentationState, self->_dismissalReason, self->_isDeviceUnlocked, self->_siriState, self->_requestSource);
  -[SRDismissalClassificationContext setClassifiedAsUnintended:](v4, "setClassifiedAsUnintended:", self->_classifiedAsUnintended);
  return v4;
}

- (BOOL)classifiedAsUnintended
{
  return self->_classifiedAsUnintended;
}

- (void)setClassifiedAsUnintended:(BOOL)a3
{
  self->_classifiedAsUnintended = a3;
}

- (int64_t)cancellationReason
{
  return self->_cancellationReason;
}

- (int64_t)contentPresentationState
{
  return self->_contentPresentationState;
}

- (int64_t)dismissalReason
{
  return self->_dismissalReason;
}

- (BOOL)isDeviceUnlocked
{
  return self->_isDeviceUnlocked;
}

- (int64_t)siriState
{
  return self->_siriState;
}

- (int64_t)requestSource
{
  return self->_requestSource;
}

@end
