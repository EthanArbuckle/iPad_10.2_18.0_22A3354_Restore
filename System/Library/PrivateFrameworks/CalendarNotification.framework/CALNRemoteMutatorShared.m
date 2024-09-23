@implementation CALNRemoteMutatorShared

+ (BOOL)deleteEvent:(id)a3 inEventStore:(id)a4 withSpan:(int64_t)a5 usingRemoteMutator:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  char v13;

  v11 = a3;
  v12 = a4;
  if ((objc_msgSend(a6, "deleteEvent:withSpan:", v11, a5) & 1) != 0)
    v13 = 1;
  else
    v13 = objc_msgSend(v12, "removeEvent:span:error:", v11, a5, a7);

  return v13;
}

@end
