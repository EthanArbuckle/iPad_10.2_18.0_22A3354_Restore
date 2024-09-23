@implementation NRDeviceDiffType

- (NRDeviceDiffType)initWithDiff:(id)a3 andChangeType:(unint64_t)a4
{
  id v7;
  NRDeviceDiffType *v8;
  NRDeviceDiffType *v9;

  v7 = a3;
  v8 = -[NRDeviceDiffType init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_diff, a3);
    v9->_changeType = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRDeviceDiffType)initWithCoder:(id)a3
{
  id v4;
  NRDeviceDiffType *v5;
  uint64_t v6;
  void *v7;
  NRPBDeviceDiffType *v8;
  NRDeviceDiffType *v9;
  uint64_t v10;
  NRDeviceDiff *diff;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NRDeviceDiffType;
  v5 = -[NRDeviceDiffType init](&v13, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceDiff"));
    v10 = objc_claimAutoreleasedReturnValue();
    diff = v5->_diff;
    v5->_diff = (NRDeviceDiff *)v10;

    v5->_changeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("changeType"));
LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = -[NRPBDeviceDiffType initWithData:]([NRPBDeviceDiffType alloc], "initWithData:", v6);
  v9 = -[NRDeviceDiffType initWithProtobuf:](v5, "initWithProtobuf:", v8);

LABEL_6:
  return v9;
}

- (NRDeviceDiffType)initWithProtobuf:(id)a3
{
  int *v4;
  NRDeviceDiffType *v5;
  NRDeviceDiffType *v6;
  unint64_t v7;
  NRDeviceDiff *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NRDeviceDiff *diff;
  objc_super v14;

  v4 = (int *)a3;
  v14.receiver = self;
  v14.super_class = (Class)NRDeviceDiffType;
  v5 = -[NRDeviceDiffType init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    if (!v4)
    {
      v5->_changeType = 0;
      v8 = [NRDeviceDiff alloc];
      v9 = 0;
      goto LABEL_7;
    }
    if ((v4[6] & 1) == 0)
    {
      v5->_changeType = 0;
LABEL_6:
      v8 = [NRDeviceDiff alloc];
      v9 = (void *)*((_QWORD *)v4 + 2);
LABEL_7:
      v10 = v9;
      v11 = -[NRDeviceDiff initWithProtobuf:](v8, "initWithProtobuf:", v10);
      diff = v6->_diff;
      v6->_diff = (NRDeviceDiff *)v11;

      goto LABEL_8;
    }
    v7 = v4[2];
    v5->_changeType = v7;
    if ((_DWORD)v7 != 2)
      goto LABEL_6;
  }
LABEL_8:

  return v6;
}

- (NRPBDeviceDiffType)protobuf
{
  uint64_t v3;
  void *v4;
  unint64_t changeType;

  v3 = objc_opt_new();
  -[NRDeviceDiff protobuf](self->_diff, "protobuf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBDeviceDiffType setDiff:](v3, v4);

  if (v3)
  {
    changeType = self->_changeType;
    *(_BYTE *)(v3 + 24) |= 1u;
    *(_DWORD *)(v3 + 8) = changeType;
  }
  return (NRPBDeviceDiffType *)(id)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NRDeviceDiffType protobuf](self, "protobuf");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NRDeviceDiffType *v4;

  v4 = -[NRDeviceDiffType init](+[NRDeviceDiffType allocWithZone:](NRDeviceDiffType, "allocWithZone:", a3), "init");
  objc_storeStrong((id *)&v4->_diff, self->_diff);
  v4->_changeType = self->_changeType;
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[NRDeviceDiff hash](self->_diff, "hash");
  return self->_changeType - v3 + 32 * v3 + 961;
}

- (id)description
{
  NRDeviceDiff *diff;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;

  diff = self->_diff;
  if (diff)
  {
    if (self->_changeType)
      v3 = CFSTR("[UPDATED]");
    else
      v3 = CFSTR("[CREATED]");
    v4 = v3;
    -[NRDeviceDiff description](diff, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[NRTextFormattingUtilities prefixLinesWithString:withText:](NRTextFormattingUtilities, "prefixLinesWithString:withText:", v4, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("[DELETED]");
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NRDeviceDiffType *v4;
  NRDeviceDiffType *v5;
  NRDeviceDiff *diff;
  char v7;

  v4 = (NRDeviceDiffType *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_7;
  if (v4 == self)
  {
    v7 = 1;
    goto LABEL_12;
  }
  if (v4)
  {
    v5 = v4;
    if (self->_changeType == v5->_changeType)
    {
      diff = self->_diff;
      if (diff == v5->_diff)
        v7 = 1;
      else
        v7 = -[NRDeviceDiff isEqual:](diff, "isEqual:");
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
LABEL_7:
    v7 = 0;
  }
LABEL_12:

  return v7;
}

- (NRDeviceDiff)diff
{
  return self->_diff;
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diff, 0);
}

@end
