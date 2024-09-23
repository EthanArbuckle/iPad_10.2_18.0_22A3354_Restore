@implementation MNNavigationServiceCallback_DidUpdateMatchedLocation

- (unint64_t)type
{
  return 7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServiceCallback_DidUpdateMatchedLocation;
  v4 = a3;
  -[MNNavigationServiceCallbackParameters encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_location, CFSTR("_location"), v5.receiver, v5.super_class);

}

- (MNNavigationServiceCallback_DidUpdateMatchedLocation)initWithCoder:(id)a3
{
  id v4;
  MNNavigationServiceCallback_DidUpdateMatchedLocation *v5;
  uint64_t v6;
  MNLocation *location;
  MNNavigationServiceCallback_DidUpdateMatchedLocation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationServiceCallback_DidUpdateMatchedLocation;
  v5 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_location"));
    v6 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (MNLocation *)v6;

    v8 = v5;
  }

  return v5;
}

- (MNLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
