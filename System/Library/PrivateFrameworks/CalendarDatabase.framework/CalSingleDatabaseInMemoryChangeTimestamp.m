@implementation CalSingleDatabaseInMemoryChangeTimestamp

- (CalSingleDatabaseInMemoryChangeTimestamp)init
{
  CalSingleDatabaseInMemoryChangeTimestamp *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CalSingleDatabaseInMemoryChangeTimestamp;
  v2 = -[CalSingleDatabaseInMemoryChangeTimestamp init](&v5, sel_init);
  if (v2)
  {
    v3 = CalMonotonicTime();
    v2->_others = v3;
    v2->_myself = v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalSingleDatabaseInMemoryChangeTimestamp)initWithDawnOfTime
{
  return -[CalSingleDatabaseInMemoryChangeTimestamp initWithTimestampForMyself:others:](self, "initWithTimestampForMyself:others:", 0, 0);
}

- (CalSingleDatabaseInMemoryChangeTimestamp)initWithTimestampForMyself:(unint64_t)a3 others:(unint64_t)a4
{
  CalSingleDatabaseInMemoryChangeTimestamp *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalSingleDatabaseInMemoryChangeTimestamp;
  result = -[CalSingleDatabaseInMemoryChangeTimestamp init](&v7, sel_init);
  if (result)
  {
    result->_others = a4;
    result->_myself = a3;
  }
  return result;
}

- (CalSingleDatabaseInMemoryChangeTimestamp)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("myself"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("others"));

  return -[CalSingleDatabaseInMemoryChangeTimestamp initWithTimestampForMyself:others:](self, "initWithTimestampForMyself:others:", v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t myself;
  id v5;

  myself = self->_myself;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", myself, CFSTR("myself"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_others, CFSTR("others"));

}

- (unint64_t)others
{
  return self->_others;
}

- (unint64_t)myself
{
  return self->_myself;
}

@end
