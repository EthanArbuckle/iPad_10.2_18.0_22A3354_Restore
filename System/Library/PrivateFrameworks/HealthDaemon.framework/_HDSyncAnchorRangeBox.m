@implementation _HDSyncAnchorRangeBox

- (void)encodeWithCoder:(id)a3
{
  int64_t start;
  id v5;

  start = self->_anchorRange.start;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", start, CFSTR("start"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_anchorRange.end, CFSTR("end"));

}

- (_HDSyncAnchorRangeBox)initWithCoder:(id)a3
{
  id v4;
  _HDSyncAnchorRangeBox *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HDSyncAnchorRangeBox;
  v5 = -[_HDSyncAnchorRangeBox init](&v7, sel_init);
  if (v5)
  {
    v5->_anchorRange.start = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("start"));
    v5->_anchorRange.end = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("end"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_anchorRange.start == v4[1] && self->_anchorRange.end == v4[2];

  return v5;
}

- (unint64_t)hash
{
  return self->_anchorRange.end ^ self->_anchorRange.start;
}

@end
