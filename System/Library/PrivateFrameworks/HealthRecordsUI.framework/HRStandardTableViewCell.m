@implementation HRStandardTableViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)(id)sub_1BC62C650();
}

- (HRStandardTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (HRStandardTableViewCell *)sub_1BC59FA50((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))type metadata accessor for StandardTableViewCell);
}

- (HRStandardTableViewCell)initWithCoder:(id)a3
{
  return (HRStandardTableViewCell *)sub_1BC59FAEC(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for StandardTableViewCell);
}

@end
