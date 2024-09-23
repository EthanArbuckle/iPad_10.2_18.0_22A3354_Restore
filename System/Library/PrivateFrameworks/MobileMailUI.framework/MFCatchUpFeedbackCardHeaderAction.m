@implementation MFCatchUpFeedbackCardHeaderAction

- (MFCatchUpFeedbackCardAction)feedbackAction
{
  return self->_feedbackAction;
}

- (void)setFeedbackAction:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackAction, 0);
}

@end
