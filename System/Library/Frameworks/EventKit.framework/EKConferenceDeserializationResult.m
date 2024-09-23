@implementation EKConferenceDeserializationResult

- (EKConferenceDeserializationResult)initWithConference:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  EKConferenceDeserializationResult *v9;
  EKConferenceDeserializationResult *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKConferenceDeserializationResult;
  v9 = -[EKConferenceDeserializationResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conference, a3);
    v10->_range.location = location;
    v10->_range.length = length;
  }

  return v10;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (EKVirtualConference)conference
{
  return self->_conference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conference, 0);
}

@end
