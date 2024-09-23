@implementation GKLeaderboardScoreRangeRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKLeaderboardScoreRangeRequest)initWithCoder:(id)a3
{
  id v4;
  GKLeaderboardScoreRangeRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardScoreRangeRequest;
  v5 = -[GKLeaderboardScoreRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_range.location = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("location"));
    v5->_range.length = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("length"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GKLeaderboardScoreRangeRequest *v3;
  id v4;
  objc_super v5;

  v3 = self;
  v5.receiver = self;
  v5.super_class = (Class)GKLeaderboardScoreRangeRequest;
  v4 = a3;
  -[GKLeaderboardScoreRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  v3 = (GKLeaderboardScoreRangeRequest *)((char *)v3 + 64);
  objc_msgSend(v4, "encodeInteger:forKey:", v3->super.super.isa, CFSTR("location"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", v3->super._playerInternal, CFSTR("length"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardScoreRangeRequest;
  if (-[GKLeaderboardScoreRequest isEqual:](&v8, sel_isEqual_, v4))
    v6 = self->_range.location != v4[8] || self->_range.length != v4[9];
  else
    v6 = 0;

  return v6;
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

@end
