@implementation MFMailMessageLibraryIndexedUIDRangesAndMessageCount

- (_QWORD)initWithRanges:(uint64_t)a3 messageCount:
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v5 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)MFMailMessageLibraryIndexedUIDRangesAndMessageCount;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v6 = objc_msgSend(v5, "copy");
      v7 = (void *)a1[1];
      a1[1] = v6;

      a1[2] = a3;
    }
  }

  return a1;
}

- (NSArray)ranges
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)messageCount
{
  return self->_messageCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranges, 0);
}

@end
