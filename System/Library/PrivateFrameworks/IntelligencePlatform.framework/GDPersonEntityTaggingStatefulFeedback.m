@implementation GDPersonEntityTaggingStatefulFeedback

- (GDPersonEntityTaggingStatefulFeedback)initWithStatefulFeedbackType:(int64_t)a3 eventIds:(id)a4
{
  id v7;
  GDPersonEntityTaggingStatefulFeedback *v8;
  GDPersonEntityTaggingStatefulFeedback *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GDPersonEntityTaggingStatefulFeedback;
  v8 = -[GDPersonEntityTaggingStatefulFeedback init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_feedbackType = a3;
    objc_storeStrong((id *)&v8->_eventIds, a4);
  }

  return v9;
}

- (int64_t)feedbackType
{
  return self->_feedbackType;
}

- (GDPersonEntityTagEventIDSet)eventIds
{
  return self->_eventIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIds, 0);
}

@end
